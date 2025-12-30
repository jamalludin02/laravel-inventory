<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Create the safety_stock view
        DB::statement("DROP VIEW IF EXISTS safety_stock");
        DB::statement("
            CREATE VIEW safety_stock AS
            WITH 
            max_order_per_week AS (
                SELECT
                    a.id,
                    WEEK(b.order_date) AS week,
                    YEAR(b.order_date) AS year,
                    COALESCE(MAX(b.qty), 0) AS qty_order_maks
                FROM
                    barangs a
                    LEFT JOIN order_produk b ON a.id = b.barang_id
                WHERE 
                    b.order_date IS NULL OR WEEK(b.order_date) = WEEK(NOW())
                GROUP BY 
                    a.id, 
                    WEEK(b.order_date), 
                    YEAR(b.order_date)
            ),
            avg_order_per_week AS (
                SELECT
                    a.id,
                    WEEK(b.order_date) AS week,
                    YEAR(b.order_date) AS year,
                    COALESCE(ROUND(AVG(b.qty)), 0) AS qty_order_average
                FROM
                    barangs a
                    LEFT JOIN order_produk b ON a.id = b.barang_id
                WHERE 
                    b.order_date IS NULL OR WEEK(b.order_date) = WEEK(NOW())
                GROUP BY 
                    a.id, 
                    WEEK(b.order_date), 
                    YEAR(b.order_date)
            ),
            lead_time_calc AS (
                SELECT 
                    COALESCE(ROUND(AVG(DATEDIFF(date_complete, order_date) + 1)), 0) AS lead_time 
                FROM orders
            )
            SELECT 
                br.id as barang_id,
                COALESCE(m.qty_order_maks, 0) AS qty_order_maks,
                COALESCE(a.qty_order_average, 0) AS qty_order_average,
                CASE 
                    WHEN m.qty_order_maks IS NULL OR m.qty_order_maks = 0 THEN 0
                    ELSE l.lead_time
                END AS lead_time,
                CASE 
                    WHEN m.id IS NULL OR a.id IS NULL THEN 0
                    ELSE GREATEST(0, (COALESCE(m.qty_order_maks, 0) - COALESCE(a.qty_order_average, 0)) * l.lead_time)
                END AS safety_stock
            FROM 
                barangs br
                LEFT JOIN max_order_per_week m ON br.id = m.id
                LEFT JOIN avg_order_per_week a ON br.id = a.id AND COALESCE(m.week, 0) = COALESCE(a.week, 0) AND COALESCE(m.year, 0) = COALESCE(a.year, 0)
                CROSS JOIN lead_time_calc l
        ");

        // 2. Drop stok_minimum column from barangs table
        Schema::table('barangs', function (Blueprint $table) {
            $table->dropColumn('stok_minimum');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('barangs', function (Blueprint $table) {
            $table->integer('stok_minimum')->default(10)->after('gambar');
        });

        DB::statement("DROP VIEW IF EXISTS safety_stock");
    }
};
