<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class SalesOrderDetail extends Model
{
    use HasFactory, LogsActivity;

    protected $fillable = [
        'sales_order_id',
        'barang_id',
        'quantity',
        'unit_price',
        'total_price'
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['sales_order_id', 'barang_id', 'quantity', 'unit_price', 'total_price'])
            ->logOnlyDirty();
    }

    public function salesOrder()
    {
        return $this->belongsTo(SalesOrder::class);
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }
}
