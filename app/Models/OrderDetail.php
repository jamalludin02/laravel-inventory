<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class OrderDetail extends Model
{
    use HasFactory, LogsActivity;

    protected $fillable = [
        'order_id',
        'barang_id',
        'quantity',
        'unit_price',
        'total_price'
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['order_id', 'barang_id', 'quantity', 'unit_price', 'total_price'])
            ->logOnlyDirty();
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }
}
