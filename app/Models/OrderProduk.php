<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderProduk extends Model
{
    use HasFactory;

    protected $table = 'order_produk';

    protected $fillable = [
        'order_id',
        'customer_id',
        'barang_id',
        'order_date',
        'qty'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }
}
