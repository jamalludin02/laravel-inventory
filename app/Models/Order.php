<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Order extends Model
{
    use HasFactory, LogsActivity;

    protected $fillable = [
        'order_no',
        'customer_id',
        'order_date',
        'total_amount',
        'status',
        'date_post',
        'date_confirm',
        'date_shipped',
        'date_complete'
    ];

    protected $casts = [
        'date_post' => 'datetime',
        'date_confirm' => 'datetime',
        'date_shipped' => 'datetime',
        'date_complete' => 'datetime',
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['order_no', 'customer_id', 'order_date', 'total_amount', 'status'])
            ->logOnlyDirty();
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function details()
    {
        return $this->hasMany(OrderDetail::class);
    }

    public function histories()
    {
        return $this->hasMany(OrderHistory::class)->latest();
    }
}
