<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReorderPoint extends Model
{
    use HasFactory;

    protected $table = 'reorder_point';
    public $timestamps = false;
    protected $primaryKey = 'barang_id';
    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'barang_id',
        'kode_barang',
        'nama_barang',
        'avg_daily_demand',
        'max_daily_demand',
        'lead_time_days',
        'safety_stock',
        'reorder_point'
    ];

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
