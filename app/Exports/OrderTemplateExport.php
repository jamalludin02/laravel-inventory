<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;

class OrderTemplateExport implements FromArray, WithHeadings
{
    public function headings(): array
    {
        return [
            'customer_id',
            'order_date',
            'product_id',
            'quantity',
        ];
    }

    public function array(): array
    {
        return [
            [
                '1',
                date('Y-m-d'),
                '1',
                '10',
            ]
        ];
    }
}
