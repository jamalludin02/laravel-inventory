<?php

namespace App\Http\Controllers;

use App\Models\SalesOrder;
use App\Models\SalesOrderDetail;
use App\Models\Customer;
use App\Models\Barang;
use App\Models\SalesOrderHistory;
use Illuminate\Http\Request;
use App\Http\Requests\StoreSalesOrderRequest;
use App\Http\Requests\UpdateSalesOrderRequest;
use App\Http\Requests\ImportSalesOrderRequest;
use App\Exports\SalesOrderExport;
use App\Exports\SalesOrderTemplateExport;
use App\Imports\SalesOrderImport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class SalesOrderController extends Controller
{
    public function index()
    {
        $salesOrders = SalesOrder::with('customer')->latest()->get();
        $customers = Customer::all();
        return view('sales-order.index', compact('salesOrders', 'customers'));
    }

    public function create()
    {
        $customers = Customer::all();
        $barangs = Barang::with('satuan')->get();
        return view('sales-order.create', compact('customers', 'barangs'));
    }

    public function store(StoreSalesOrderRequest $request)
    {
        DB::transaction(function () use ($request) {
            $soNumber = $this->generateSoNumber($request->order_date);

            $salesOrder = SalesOrder::create([
                'sales_order_no' => $soNumber,
                'customer_id' => $request->customer_id,
                'order_date' => $request->order_date,
                'status' => 'draft',
                'total_amount' => 0,
            ]);

            $totalAmount = 0;
            foreach ($request->items as $item) {
                $totalPrice = $item['quantity'] * $item['unit_price'];
                SalesOrderDetail::create([
                    'sales_order_id' => $salesOrder->id,
                    'barang_id' => $item['barang_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $totalPrice,
                ]);
                $totalAmount += $totalPrice;
            }

            $salesOrder->update(['total_amount' => $totalAmount]);

            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Created Sales Order',
                'reason' => 'Initial creation'
            ]);
        });

        Alert::success('Berhasil', 'Sales Order berhasil dibuat');
        return redirect()->route('sales-order.index');
    }

    public function show(SalesOrder $salesOrder)
    {
        $salesOrder->load(['customer', 'details.barang.satuan', 'histories.user']);
        return view('sales-order.show', compact('salesOrder'));
    }

    public function edit(SalesOrder $salesOrder)
    {
        $salesOrder->load('details');
        $customers = Customer::all();
        $barangs = Barang::with('satuan')->get();
        return view('sales-order.edit', compact('salesOrder', 'customers', 'barangs'));
    }

    public function update(UpdateSalesOrderRequest $request, SalesOrder $salesOrder)
    {
        DB::transaction(function () use ($request, $salesOrder) {
            $salesOrder->update([
                'customer_id' => $request->customer_id,
                'order_date' => $request->order_date,
                'status' => $request->status,
            ]);

            $salesOrder->details()->delete();

            $totalAmount = 0;
            foreach ($request->items as $item) {
                $totalPrice = $item['quantity'] * $item['unit_price'];
                SalesOrderDetail::create([
                    'sales_order_id' => $salesOrder->id,
                    'barang_id' => $item['barang_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $totalPrice,
                ]);
                $totalAmount += $totalPrice;
            }

            $salesOrder->update(['total_amount' => $totalAmount]);

            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Updated Sales Order',
                'reason' => 'General update by Admin Sales'
            ]);
        });

        Alert::success('Berhasil', 'Sales Order berhasil diperbarui');
        return redirect()->route('sales-order.index');
    }

    public function destroy(SalesOrder $salesOrder)
    {
        $salesOrder->delete();
        return response()->json(['message' => 'Sales Order berhasil dihapus']);
    }

    public function verify(Request $request, SalesOrder $salesOrder)
    {
        $request->validate([
            'status' => 'required|in:confirmed,processing,cancelled',
        ]);

        DB::transaction(function () use ($request, $salesOrder) {
            $salesOrder->update([
                'status' => $request->status
            ]);

            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Status Changed to ' . ucfirst($request->status),
                'reason' => 'Verification by Warehouse Admin'
            ]);
        });

        $message = 'Status Sales Order diperbarui menjadi ' . ucfirst($request->status);
        if ($request->status == 'confirmed') {
            $message = 'Sales Order dikonfirmasi oleh Admin Gudang.';
        } elseif ($request->status == 'processing') {
            $message = 'Sales Order diverifikasi dan siap untuk packing.';
        }

        Alert::success('Berhasil', $message);
        return back();
    }

    public function postToGudang(SalesOrder $salesOrder)
    {
        DB::transaction(function () use ($salesOrder) {
            $salesOrder->update(['status' => 'post']);

            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Posted to Warehouse',
                'reason' => 'Ready for stock verification'
            ]);
        });

        Alert::success('Berhasil', 'Sales Order berhasil dikirim ke Gudang.');
        return back();
    }

    public function deleteDetail(Request $request, SalesOrderDetail $detail)
    {
        $request->validate([
            'reason' => 'required|string|max:255',
        ]);

        $salesOrder = $detail->salesOrder;

        DB::transaction(function () use ($request, $detail, $salesOrder) {
            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Deleted Item: ' . $detail->barang->nama_barang,
                'reason' => $request->reason
            ]);

            $detail->delete();

            // Recalculate total amount
            $totalAmount = $salesOrder->details()->sum('total_price');
            $salesOrder->update(['total_amount' => $totalAmount]);
        });

        return response()->json(['success' => true, 'message' => 'Item berhasil dihapus dan dicatat dalam riwayat.']);
    }

    public function updateDetail(Request $request, SalesOrderDetail $detail)
    {
        $request->validate([
            'quantity' => 'required|numeric|min:1',
            'reason' => 'required|string|max:255',
        ]);

        $salesOrder = $detail->salesOrder;

        DB::transaction(function () use ($request, $detail, $salesOrder) {
            $oldQty = $detail->quantity;
            $newQty = $request->quantity;
            $totalPrice = $newQty * $detail->unit_price;

            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => "Updated Item: {$detail->barang->nama_barang} (Qty: {$oldQty} -> {$newQty})",
                'reason' => $request->reason
            ]);

            $detail->update([
                'quantity' => $newQty,
                'total_price' => $totalPrice
            ]);

            // Recalculate total amount
            $totalAmount = $salesOrder->details()->sum('total_price');
            $salesOrder->update(['total_amount' => $totalAmount]);
        });

        return response()->json(['success' => true, 'message' => 'Item berhasil diperbarui dan dicatat dalam riwayat.']);
    }

    public function reject(Request $request, SalesOrder $salesOrder)
    {
        $request->validate([
            'reason' => 'required|string|max:255',
        ]);

        DB::transaction(function () use ($request, $salesOrder) {
            // Record history
            SalesOrderHistory::create([
                'sales_order_id' => $salesOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Rejected Document (Returned to Draft)',
                'reason' => $request->reason
            ]);

            $salesOrder->update(['status' => 'draft']);
        });

        Alert::success('Berhasil', 'Sales Order ditolak dan dikembalikan ke Admin Sales.');
        return back();
    }

    public function export(Request $request)
    {
        return Excel::download(new SalesOrderExport($request->all()), 'sales-orders.xlsx');
    }

    public function import(ImportSalesOrderRequest $request)
    {
        Excel::import(new SalesOrderImport, $request->file('file'));

        Alert::success('Berhasil', 'Data berhasil diimport');
        return back();
    }

    public function downloadTemplate()
    {
        return Excel::download(new SalesOrderTemplateExport, 'sales_order_template.xlsx');
    }

    private function generateSoNumber($date)
    {
        $dateStr = date('Ymd', strtotime($date));
        $lastOrder = SalesOrder::where('sales_order_no', 'like', "SO-$dateStr-%")
            ->orderBy('sales_order_no', 'desc')
            ->first();

        $nextNumber = 1;
        if ($lastOrder) {
            $lastNumber = (int) substr($lastOrder->sales_order_no, -3);
            $nextNumber = $lastNumber + 1;
        }

        return "SO-$dateStr-" . str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
    }
}
