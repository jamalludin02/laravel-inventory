<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Customer;
use App\Models\Barang;
use App\Models\OrderHistory;
use App\Models\BarangKeluar;
use App\Models\OrderProduk;
use Illuminate\Http\Request;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;
use App\Http\Requests\ImportOrderRequest;
use App\Exports\OrderExport;
use App\Exports\OrderTemplateExport;
use App\Imports\OrderImport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;
use Dompdf\Dompdf;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::with('customer')->latest()->get();
        $customers = Customer::all();
        return view('order.index', compact('orders', 'customers'));
    }

    public function create()
    {
        $customers = Customer::all();
        $barangs = Barang::with('satuan')->get();
        return view('order.create', compact('customers', 'barangs'));
    }

    public function store(StoreOrderRequest $request)
    {
        DB::transaction(function () use ($request) {
            $orderNumber = $this->generateOrderNumber($request->order_date);

            $order = Order::create([
                'order_no' => $orderNumber,
                'customer_id' => $request->customer_id,
                'order_date' => $request->order_date,
                'status' => 'draft',
                'total_amount' => 0,
            ]);

            $totalAmount = 0;
            foreach ($request->items as $item) {
                $totalPrice = $item['quantity'] * $item['unit_price'];
                OrderDetail::create([
                    'order_id' => $order->id,
                    'barang_id' => $item['barang_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $totalPrice,
                ]);
                $totalAmount += $totalPrice;
            }

            $order->update(['total_amount' => $totalAmount]);

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Created Order',
                'reason' => 'Initial creation'
            ]);
        });

        Alert::success('Berhasil', 'Order berhasil dibuat');
        return redirect()->route('order.index');
    }

    public function show(Order $order)
    {
        $order->load(['customer', 'details.barang.satuan', 'histories.user']);
        return view('order.show', compact('order'));
    }

    public function edit(Order $order)
    {
        $order->load('details');
        $customers = Customer::all();
        $barangs = Barang::with('satuan')->get();
        return view('order.edit', compact('order', 'customers', 'barangs'));
    }

    public function update(UpdateOrderRequest $request, Order $order)
    {
        DB::transaction(function () use ($request, $order) {
            $order->update([
                'customer_id' => $request->customer_id,
                'order_date' => $request->order_date,
                'status' => $request->status,
            ]);

            $order->details()->delete();

            $totalAmount = 0;
            foreach ($request->items as $item) {
                $totalPrice = $item['quantity'] * $item['unit_price'];
                OrderDetail::create([
                    'order_id' => $order->id,
                    'barang_id' => $item['barang_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'total_price' => $totalPrice,
                ]);
                $totalAmount += $totalPrice;
            }

            $order->update(['total_amount' => $totalAmount]);

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Updated Order',
                'reason' => 'General update by Admin Sales'
            ]);
        });

        Alert::success('Berhasil', 'Order berhasil diperbarui');
        return redirect()->route('order.index');
    }

    public function destroy(Order $order)
    {
        $order->delete();
        return response()->json(['message' => 'Order berhasil dihapus']);
    }

    public function post(Order $order)
    {
        DB::transaction(function () use ($order) {
            $order->update([
                'status' => 'post',
                'date_post' => now()
            ]);

            // Record original demand to order_produk
            foreach ($order->details as $detail) {
                OrderProduk::create([
                    'order_id' => $order->id,
                    'customer_id' => $order->customer_id,
                    'barang_id' => $detail->barang_id,
                    'order_date' => $order->order_date,
                    'qty' => $detail->quantity,
                ]);
            }

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Posted to Warehouse',
                'reason' => 'Ready for stock verification'
            ]);
        });

        Alert::success('Berhasil', 'Order berhasil dikirim ke Gudang.');
        return back();
    }

    public function verify(Order $order)
    {
        DB::transaction(function () use ($order) {
            $order->update([
                'status' => 'confirmed',
                'date_confirm' => now()
            ]);

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Confirmed by Warehouse',
                'reason' => 'Stock verified and ready for shipping'
            ]);
        });

        Alert::success('Berhasil', 'Order dikonfirmasi oleh Admin Gudang.');
        return back();
    }

    public function shipped(Order $order)
    {
        // Check stock first
        foreach ($order->details as $detail) {
            if ($detail->barang->stok < $detail->quantity) {
                Alert::error('Gagal', "Stok barang '{$detail->barang->nama_barang}' tidak mencukupi (Tersedia: {$detail->barang->stok}, Dibutuhkan: {$detail->quantity})");
                return back();
            }
        }

        DB::transaction(function () use ($order) {
            $order->update([
                'status' => 'shipped',
                'date_shipped' => now()
            ]);

            // Automate Barang Keluar and Stock Reduction
            foreach ($order->details as $detail) {
                $date = now()->format('Y-m-d');
                $random = str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT);
                $kodeTransaksi = "TRX-OUT-$date-$random";

                BarangKeluar::create([
                    'kode_transaksi' => $kodeTransaksi,
                    'order_no' => $order->order_no,
                    'tanggal_keluar' => $date,
                    'nama_barang' => $detail->barang->nama_barang,
                    'jumlah_keluar' => $detail->quantity,
                    'customer_id' => $order->customer_id,
                    'user_id' => auth()->id(),
                ]);

                // Reduce Stock
                $barang = $detail->barang;
                $barang->stok -= $detail->quantity;
                $barang->save();
            }

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Shipped',
                'reason' => 'Order shipped by Warehouse Staff'
            ]);
        });

        Alert::success('Berhasil', 'Order telah dikirim dan stok telah diperbarui.');
        return back();
    }

    public function completed(Order $order)
    {
        DB::transaction(function () use ($order) {
            $order->update([
                'status' => 'completed',
                'date_complete' => now()
            ]);

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Completed',
                'reason' => 'Order received by customer'
            ]);
        });

        Alert::success('Berhasil', 'Order telah selesai.');
        return back();
    }

    public function printPDF(Order $order)
    {
        $dompdf = new Dompdf();
        $html = view('order.print', compact('order'))->render();
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();

        $filename = 'Order-' . $order->order_no . '.pdf';
        return $dompdf->stream($filename, ['Attachment' => false]);
    }

    public function deleteDetail(Request $request, OrderDetail $detail)
    {
        $request->validate([
            'reason' => 'required|string|max:255',
        ]);

        $order = $detail->order;

        DB::transaction(function () use ($request, $detail, $order) {
            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Deleted Item: ' . $detail->barang->nama_barang,
                'reason' => $request->reason
            ]);

            $detail->delete();

            // Recalculate total amount
            $totalAmount = $order->details()->sum('total_price');
            $order->update(['total_amount' => $totalAmount]);
        });

        return response()->json(['success' => true, 'message' => 'Item berhasil dihapus dan dicatat dalam riwayat.']);
    }

    public function updateDetail(Request $request, OrderDetail $detail)
    {
        $request->validate([
            'quantity' => 'required|numeric|min:1',
            'reason' => 'required|string|max:255',
        ]);

        $order = $detail->order;

        DB::transaction(function () use ($request, $detail, $order) {
            $oldQty = $detail->quantity;
            $newQty = $request->quantity;
            $totalPrice = $newQty * $detail->unit_price;

            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => "Updated Item: {$detail->barang->nama_barang} (Qty: {$oldQty} -> {$newQty})",
                'reason' => $request->reason
            ]);

            $detail->update([
                'quantity' => $newQty,
                'total_price' => $totalPrice
            ]);

            // Recalculate total amount
            $totalAmount = $order->details()->sum('total_price');
            $order->update(['total_amount' => $totalAmount]);
        });

        return response()->json(['success' => true, 'message' => 'Item berhasil diperbarui dan dicatat dalam riwayat.']);
    }

    public function reject(Request $request, Order $order)
    {
        $request->validate([
            'reason' => 'required|string|max:255',
        ]);

        DB::transaction(function () use ($request, $order) {
            // Record history
            OrderHistory::create([
                'order_id' => $order->id,
                'user_id' => auth()->id(),
                'action' => 'Rejected Document (Returned to Draft)',
                'reason' => $request->reason
            ]);

            $order->update([
                'status' => 'draft',
                'date_post' => null,
                'date_confirm' => null,
                'date_shipped' => null,
                'date_complete' => null
            ]);
        });

        Alert::success('Berhasil', 'Order ditolak dan dikembalikan ke Admin Sales.');
        return back();
    }

    public function export(Request $request)
    {
        return Excel::download(new OrderExport($request->all()), 'orders.xlsx');
    }

    public function import(ImportOrderRequest $request)
    {
        Excel::import(new OrderImport, $request->file('file'));

        Alert::success('Berhasil', 'Data berhasil diimport');
        return back();
    }

    public function downloadTemplate()
    {
        return Excel::download(new OrderTemplateExport, 'order_template.xlsx');
    }

    private function generateOrderNumber($date)
    {
        $dateStr = date('Ymd', strtotime($date));
        $lastOrder = Order::where('order_no', 'like', "ORD-$dateStr%")
            ->orderBy('order_no', 'desc')
            ->first();

        $nextNumber = 1;
        if ($lastOrder) {
            $lastNumber = (int) substr($lastOrder->order_no, -3);
            $nextNumber = $lastNumber + 1;
        }

        return "ORD-$dateStr" . str_pad($nextNumber, 3, '0', STR_PAD_LEFT);
    }
}
