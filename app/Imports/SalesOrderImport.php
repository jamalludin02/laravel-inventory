<?php

namespace App\Imports;

use App\Models\SalesOrder;
use App\Models\SalesOrderDetail;
use App\Models\Customer;
use App\Models\Barang;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class SalesOrderImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows)
    {
        // Group by sales_order_no if provided, or we might need to generate them.
        // The user said: "Validasi duplicate sales_order_no".
        // Let's assume each row is a detail, and we group them by some criteria or they provide the SO number.

        $groupedOrders = $rows->groupBy('sales_order_no');

        foreach ($groupedOrders as $soNo => $details) {
            DB::transaction(function () use ($soNo, $details) {
                $firstRow = $details->first();

                // Validate customer
                $customer = Customer::find($firstRow['customer_id']);
                if (!$customer)
                    return;

                $salesOrder = SalesOrder::create([
                    'sales_order_no' => $soNo ?? $this->generateSoNumber($firstRow['order_date']),
                    'customer_id' => $firstRow['customer_id'],
                    'order_date' => $firstRow['order_date'],
                    'status' => 'draft',
                    'total_amount' => 0, // Will update after details
                ]);

                $totalAmount = 0;
                foreach ($details as $row) {
                    $barang = Barang::find($row['product_id']);
                    if (!$barang)
                        continue;

                    $totalPrice = $row['quantity'] * $row['unit_price'];
                    SalesOrderDetail::create([
                        'sales_order_id' => $salesOrder->id,
                        'barang_id' => $row['product_id'],
                        'quantity' => $row['quantity'],
                        'unit_price' => $row['unit_price'],
                        'total_price' => $totalPrice,
                    ]);
                    $totalAmount += $totalPrice;
                }

                $salesOrder->update(['total_amount' => $totalAmount]);
            });
        }
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
