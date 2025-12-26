<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 1)->update(['role' => 'super_admin']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 2)->update(['role' => 'kepala_gudang']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 3)->update(['role' => 'admin_gudang']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 4)->update(['role' => 'staff_gudang']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 5)->update(['role' => 'admin_sales']);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 1)->update(['role' => 'superadmin']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 2)->update(['role' => 'kepala gudang']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 3)->update(['role' => 'admin gudang']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 4)->update(['role' => 'admin pembelian']);
        \Illuminate\Support\Facades\DB::table('roles')->where('id', 5)->update(['role' => 'admin penjualan']);
    }
};
