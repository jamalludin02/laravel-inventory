<?php

namespace App\Exports;

use App\Models\SalesOrder;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class SalesOrderExport implements FromCollection, WithHeadings, WithMapping
{
    protected $filters;

    public function __construct($filters = [])
    {
        $this->filters = $filters;
    }

    public function collection()
    {
        $query = SalesOrder::with(['customer', 'details.barang']);

        if (!empty($this->filters['start_date'])) {
            $query->whereDate('order_date', '>=', $this->filters['start_date']);
        }

        if (!empty($this->filters['end_date'])) {
            $query->whereDate('order_date', '<=', $this->filters['end_date']);
        }

        if (!empty($this->filters['status'])) {
            $query->where('status', $this->filters['status']);
        }

        if (!empty($this->filters['customer_id'])) {
            $query->where('customer_id', $this->filters['customer_id']);
        }

        return $query->get();
    }

    public function headings(): array
    {
        return [
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
    }

    public function map($salesOrder): array
    {
        $rows = [];
        foreach ($salesOrder->details as $detail) {
            $rows[] = [
                $salesOrder->sales_order_no,
                $salesOrder->customer_id,
                $salesOrder->customer->customer,
                $salesOrder->order_date,
                $detail->barang_id,
                $detail->barang->nama_barang,
                $detail->quantity,
                $detail->unit_price,
                $detail->total_price
            ];
        }
        return $rows;
    }
}
