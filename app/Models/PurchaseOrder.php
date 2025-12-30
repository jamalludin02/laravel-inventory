<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{
    use HasFactory;

    protected $fillable = [
        'po_no',
        'supplier_id',
        'po_date',
        'total_amount',
        'status',
        'created_by',
        'date_post',
        'date_received',
    ];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function details()
    {
        return $this->hasMany(PurchaseOrderDetail::class);
    }

    public function histories()
    {
        return $this->hasMany(PurchaseOrderHistory::class);
    }
}
