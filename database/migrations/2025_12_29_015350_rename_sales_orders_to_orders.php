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
        // Rename Tables
        Schema::rename('sales_orders', 'orders');
        Schema::rename('sales_order_details', 'order_details');
        Schema::rename('sales_order_histories', 'order_histories');

        // Rename Columns in orders
        Schema::table('orders', function (Blueprint $table) {
            $table->renameColumn('sales_order_no', 'order_no');
        });

        // Rename Columns in order_details
        Schema::table('order_details', function (Blueprint $table) {
            $table->renameColumn('sales_order_id', 'order_id');
        });

        // Rename Columns in order_histories
        Schema::table('order_histories', function (Blueprint $table) {
            $table->renameColumn('sales_order_id', 'order_id');
        });

        // Rename Columns in barang_keluars
        Schema::table('barang_keluars', function (Blueprint $table) {
            $table->renameColumn('sales_order_no', 'order_no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Rename Columns in barang_keluars
        Schema::table('barang_keluars', function (Blueprint $table) {
            $table->renameColumn('order_no', 'sales_order_no');
        });

        // Rename Columns in order_histories
        Schema::table('order_histories', function (Blueprint $table) {
            $table->renameColumn('order_id', 'sales_order_id');
        });

        // Rename Columns in order_details
        Schema::table('order_details', function (Blueprint $table) {
            $table->renameColumn('order_id', 'sales_order_id');
        });

        // Rename Columns in orders
        Schema::table('orders', function (Blueprint $table) {
            $table->renameColumn('order_no', 'sales_order_no');
        });

        // Rename Tables back
        Schema::rename('order_histories', 'sales_order_histories');
        Schema::rename('order_details', 'sales_order_details');
        Schema::rename('orders', 'sales_orders');
    }
};
