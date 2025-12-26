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
use Carbon\Carbon;

class SalesOrderImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows)
    {
        // Filter out empty rows and format dates
        $rows = $rows->filter(function ($row) {
            return !empty($row['customer_id']) && !empty($row['product_id']) && !empty($row['order_date']);
        })->map(function ($row) {
            // Handle Excel serial date (e.g., 46018)
            if (is_numeric($row['order_date'])) {
                $row['order_date'] = Carbon::instance(\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['order_date']))->format('Y-m-d');
            } else {
                try {
                    $row['order_date'] = Carbon::parse($row['order_date'])->format('Y-m-d');
                } catch (\Exception $e) {
                    // Fallback to today if parsing fails
                    $row['order_date'] = date('Y-m-d');
                }
            }
            return $row;
        });

        // Group by both customer_id and order_date
        $groupedOrders = $rows->groupBy(function ($item) {
            return $item['customer_id'] . '|' . $item['order_date'];
        });

        foreach ($groupedOrders as $key => $details) {
            DB::transaction(function () use ($details) {
                $firstRow = $details->first();
                $customerId = $firstRow['customer_id'];
                $orderDate = $firstRow['order_date'];

                // Validate customer
                $customer = Customer::find($customerId);
                if (!$customer) {
                    return;
                }

                // Generate SO Number
                $soNumber = $this->generateSoNumber($orderDate);

                $salesOrder = SalesOrder::create([
                    'sales_order_no' => $soNumber,
                    'customer_id' => $customerId,
                    'order_date' => $orderDate,
                    'status' => 'draft',
                    'total_amount' => 0,
                ]);

                $totalAmount = 0;
                foreach ($details as $row) {
                    $barang = Barang::find($row['product_id']);
                    if (!$barang) {
                        continue;
                    }

                    $unitPrice = $barang->price;
                    $totalPrice = $row['quantity'] * $unitPrice;

                    SalesOrderDetail::create([
                        'sales_order_id' => $salesOrder->id,
                        'barang_id' => $row['product_id'],
                        'quantity' => $row['quantity'],
                        'unit_price' => $unitPrice,
                        'total_price' => $totalPrice,
                    ]);
                    $totalAmount += $totalPrice;
                }

                $salesOrder->update(['total_amount' => $totalAmount]);

                // Record history
                \App\Models\SalesOrderHistory::create([
                    'sales_order_id' => $salesOrder->id,
                    'user_id' => auth()->id(),
                    'action' => 'Created Sales Order (via Import)',
                    'reason' => 'Imported from Excel file'
                ]);
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
