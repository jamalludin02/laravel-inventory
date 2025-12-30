<?php

namespace App\Http\Controllers;

use App\Models\PurchaseOrder;
use App\Models\PurchaseOrderDetail;
use App\Models\PurchaseOrderHistory;
use App\Models\Supplier;
use App\Models\Barang;
use App\Models\BarangMasuk;
use Illuminate\Http\Request;
use App\Http\Requests\StorePurchaseOrderRequest;
use App\Http\Requests\UpdatePurchaseOrderRequest;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class PurchaseOrderController extends Controller
{
    public function index()
    {
        $purchaseOrders = PurchaseOrder::with(['supplier', 'creator'])->latest()->get();
        return view('purchase-order.index', compact('purchaseOrders'));
    }

    public function create()
    {
        $suppliers = Supplier::all();
        // Get barangs that are below reorder point
        $barangsBelowSafety = Barang::select('barangs.*', 'reorder_point.reorder_point as safety_stock')
            ->join('reorder_point', 'barangs.id', '=', 'reorder_point.barang_id')
            ->whereColumn('barangs.stok', '<', 'reorder_point.reorder_point')
            ->with('satuan')
            ->get();

        $allBarangs = Barang::with('satuan')->get();

        return view('purchase-order.create', compact('suppliers', 'barangsBelowSafety', 'allBarangs'));
    }

    public function store(StorePurchaseOrderRequest $request)
    {
        DB::transaction(function () use ($request) {
            $poNumber = $this->generatePONumber($request->po_date);

            $purchaseOrder = PurchaseOrder::create([
                'po_no' => $poNumber,
                'supplier_id' => $request->supplier_id,
                'po_date' => $request->po_date,
                'status' => 'draft',
                'total_amount' => 0,
                'created_by' => auth()->id(),
            ]);

            $totalAmount = 0;
            foreach ($request->items as $item) {
                $totalPrice = $item['quantity'] * $item['unit_price'];
                PurchaseOrderDetail::create([
                    'purchase_order_id' => $purchaseOrder->id,
                    'barang_id' => $item['barang_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $totalPrice,
                ]);
                $totalAmount += $totalPrice;
            }

            $purchaseOrder->update(['total_amount' => $totalAmount]);

            PurchaseOrderHistory::create([
                'purchase_order_id' => $purchaseOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Created Purchase Order',
                'reason' => 'Initial creation'
            ]);
        });

        Alert::success('Berhasil', 'Purchase Order berhasil dibuat');
        return redirect()->route('purchase-order.index');
    }

    public function show(PurchaseOrder $purchaseOrder)
    {
        $purchaseOrder->load(['supplier', 'details.barang.satuan', 'histories.user', 'creator']);
        return view('purchase-order.show', compact('purchaseOrder'));
    }

    public function edit(PurchaseOrder $purchaseOrder)
    {
        if ($purchaseOrder->status !== 'draft') {
            Alert::error('Gagal', 'Hanya Purchase Order dengan status Draft yang dapat diubah.');
            return back();
        }

        $purchaseOrder->load('details');
        $suppliers = Supplier::all();
        $allBarangs = Barang::with('satuan')->get();
        return view('purchase-order.edit', compact('purchaseOrder', 'suppliers', 'allBarangs'));
    }

    public function update(UpdatePurchaseOrderRequest $request, PurchaseOrder $purchaseOrder)
    {
        if ($purchaseOrder->status !== 'draft') {
            Alert::error('Gagal', 'Hanya Purchase Order dengan status Draft yang dapat diubah.');
            return back();
        }

        DB::transaction(function () use ($request, $purchaseOrder) {
            $purchaseOrder->update([
                'supplier_id' => $request->supplier_id,
                'po_date' => $request->po_date,
            ]);

            $purchaseOrder->details()->delete();

            $totalAmount = 0;
            foreach ($request->items as $item) {
                $totalPrice = $item['quantity'] * $item['unit_price'];
                PurchaseOrderDetail::create([
                    'purchase_order_id' => $purchaseOrder->id,
                    'barang_id' => $item['barang_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $totalPrice,
                ]);
                $totalAmount += $totalPrice;
            }

            $purchaseOrder->update(['total_amount' => $totalAmount]);

            PurchaseOrderHistory::create([
                'purchase_order_id' => $purchaseOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Updated Purchase Order',
                'reason' => 'General update'
            ]);
        });

        Alert::success('Berhasil', 'Purchase Order berhasil diperbarui');
        return redirect()->route('purchase-order.index');
    }

    public function destroy(PurchaseOrder $purchaseOrder)
    {
        if ($purchaseOrder->status !== 'draft') {
            return response()->json(['message' => 'Hanya status Draft yang dapat dihapus'], 403);
        }
        $purchaseOrder->delete();
        return response()->json(['message' => 'Purchase Order berhasil dihapus']);
    }

    public function post(PurchaseOrder $purchaseOrder)
    {
        if ($purchaseOrder->status !== 'draft') {
            Alert::error('Gagal', 'Hanya status Draft yang dapat di-Post.');
            return back();
        }

        DB::transaction(function () use ($purchaseOrder) {
            $purchaseOrder->update([
                'status' => 'post',
                'date_post' => now()
            ]);

            PurchaseOrderHistory::create([
                'purchase_order_id' => $purchaseOrder->id,
                'user_id' => auth()->id(),
                'action' => 'Posted Purchase Order',
                'reason' => 'Sent to Warehouse for receiving'
            ]);
        });

        Alert::success('Berhasil', 'Purchase Order berhasil di-Post.');
        return back();
    }

    public function processReceipt(PurchaseOrder $purchaseOrder)
    {
        if ($purchaseOrder->status !== 'post') {
            Alert::error('Gagal', 'Hanya status Post yang dapat diproses penerimaannya.');
            return back();
        }

        $purchaseOrder->load(['supplier', 'details.barang.satuan']);
        return view('purchase-order.process-receipt', compact('purchaseOrder'));
    }

    public function storeReceipt(Request $request, PurchaseOrder $purchaseOrder)
    {
        if ($purchaseOrder->status !== 'post') {
            Alert::error('Gagal', 'Hanya status Post yang dapat diproses penerimaannya.');
            return back();
        }

        $request->validate([
            'items' => 'required|array',
            'items.*.id' => 'required|exists:purchase_order_details,id',
            'items.*.quantity' => 'required|numeric|min:0',
            'items.*.reason' => 'nullable|string|max:255'
        ]);

        DB::transaction(function () use ($request, $purchaseOrder) {
            $totalAmount = 0;
            $changes = [];

            foreach ($request->items as $itemData) {
                $detail = PurchaseOrderDetail::findOrFail($itemData['id']);
                $oldQty = $detail->quantity;
                $newQty = $itemData['quantity'];
                $reason = $itemData['reason'] ?? '-';

                if ($newQty == 0) {
                    // Item deleted/not received
                    $changes[] = "Removed " . $detail->barang->nama_barang . " (Ordered: $oldQty). Reason: $reason";
                    $detail->delete();
                } else {
                    if ($newQty != $oldQty) {
                        $changes[] = "Adjusted " . $detail->barang->nama_barang . ": $oldQty -> $newQty. Reason: $reason";
                    }

                    $detail->update([
                        'quantity' => $newQty,
                        'total_price' => $newQty * $detail->unit_price
                    ]);
                    $totalAmount += $detail->total_price;
                }
            }

            $purchaseOrder->update([
                'status' => 'received',
                'date_received' => now(),
                'total_amount' => $totalAmount
            ]);

            // Record History
            $action = count($changes) > 0 ? 'Received with Adjustments' : 'Received Goods';
            $finalReason = count($changes) > 0 ? implode(" | ", $changes) : "Goods received as ordered";

            PurchaseOrderHistory::create([
                'purchase_order_id' => $purchaseOrder->id,
                'user_id' => auth()->id(),
                'action' => $action,
                'reason' => $finalReason
            ]);

            // Automate Barang Masuk and Stock Increase for remaining items
            foreach ($purchaseOrder->details()->get() as $detail) {
                $date = now()->format('Y-m-d');
                $random = str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT);
                $kodeTransaksi = "TRX-IN-$date-$random";

                BarangMasuk::create([
                    'kode_transaksi' => $kodeTransaksi,
                    'po_no' => $purchaseOrder->po_no,
                    'tanggal_masuk' => $date,
                    'nama_barang' => $detail->barang->nama_barang,
                    'jumlah_masuk' => $detail->quantity,
                    'supplier_id' => $purchaseOrder->supplier_id,
                    'user_id' => auth()->id(),
                ]);

                // Increase Stock
                $barang = $detail->barang;
                $barang->stok += $detail->quantity;
                $barang->save();
            }
        });

        Alert::success('Berhasil', 'Penerimaan barang berhasil diproses dan stok telah diperbarui.');
        return redirect()->route('purchase-order.index');
    }


    private function generatePONumber($date)
    {
        $dateStr = date('Ymd', strtotime($date));
        $lastPO = PurchaseOrder::where('po_no', 'like', "PO-$dateStr%")
            ->orderBy('po_no', 'desc')
            ->first();

        $nextNumber = 1;
        if ($lastPO) {
            $lastNumber = (int) substr($lastPO->po_no, -3);
            $nextNumber = $lastNumber + 1;
        }

        return "PO-$dateStr" . str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
    }
}
