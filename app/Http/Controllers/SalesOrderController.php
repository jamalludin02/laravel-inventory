<?php

namespace App\Http\Controllers;

use App\Models\SalesOrder;
use App\Models\SalesOrderDetail;
use App\Models\Customer;
use App\Models\Barang;
use Illuminate\Http\Request;
use App\Http\Requests\StoreSalesOrderRequest;
use App\Http\Requests\UpdateSalesOrderRequest;
use App\Http\Requests\ImportSalesOrderRequest;
use App\Exports\SalesOrderExport;
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
        });

        Alert::success('Success', 'Sales Order created successfully');
        return redirect()->route('sales-order.index');
    }

    public function show(SalesOrder $salesOrder)
    {
        $salesOrder->load(['customer', 'details.barang.satuan']);
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
        });

        Alert::success('Success', 'Sales Order updated successfully');
        return redirect()->route('sales-order.index');
    }

    public function destroy(SalesOrder $salesOrder)
    {
        $salesOrder->delete();
        return response()->json(['message' => 'Sales Order deleted successfully']);
    }

    public function export(Request $request)
    {
        return Excel::download(new SalesOrderExport($request->all()), 'sales-orders.xlsx');
    }

    public function import(ImportSalesOrderRequest $request)
    {
        Excel::import(new SalesOrderImport, $request->file('file'));

        Alert::success('Success', 'Data imported successfully');
        return back();
    }

    public function downloadTemplate()
    {
        $headers = [
            'sales_order_no',
            'customer_id',
            'customer_name',
            'order_date',
            'product_id',
            'product_name',
            'quantity',
            'unit_price',
            'total_price'
        ];

        $callback = function () use ($headers) {
            $file = fopen('php://output', 'w');
            fputcsv($file, $headers);
            fclose($file);
        };

        return response()->stream($callback, 200, [
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=sales_order_template.csv",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        ]);
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
