<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalesOrderHistory extends Model
{
    use HasFactory;

    protected $fillable = [
        'sales_order_id',
        'user_id',
        'action',
        'reason'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function salesOrder()
    {
        return $this->belongsTo(SalesOrder::class);
    }
}
