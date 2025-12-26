<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class SalesOrder extends Model
{
    use HasFactory, LogsActivity;

    protected $fillable = [
        'sales_order_no',
        'customer_id',
        'order_date',
        'total_amount',
        'status'
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['sales_order_no', 'customer_id', 'order_date', 'total_amount', 'status'])
            ->logOnlyDirty();
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function details()
    {
        return $this->hasMany(SalesOrderDetail::class);
    }

    public function histories()
    {
        return $this->hasMany(SalesOrderHistory::class)->latest();
    }
}
