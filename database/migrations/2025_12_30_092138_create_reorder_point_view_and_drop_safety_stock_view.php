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
        DB::statement("DROP VIEW IF EXISTS safety_stock");

        DB::statement("
            CREATE VIEW reorder_point AS
            WITH 
            daily_demand_stats AS (
                SELECT
                    b.barang_id,
                    COALESCE(ROUND(AVG(b.qty)), 0) AS avg_daily_demand,
                    COALESCE(MAX(b.qty), 0) AS max_daily_demand
                FROM
                    order_produk b
                WHERE
                    b.order_date >= DATE_SUB(NOW(), INTERVAL 90 DAY)
                GROUP BY
                    b.barang_id
            ),
            lead_time_calc AS (
                SELECT 
                    COALESCE(ROUND(AVG(DATEDIFF(date_received, po_date) + 1)), 0) AS lead_time_days
                FROM purchase_orders
                WHERE date_received IS NOT NULL
            )
            SELECT 
                br.id as barang_id,
                br.kode_barang,
                br.nama_barang,
                COALESCE(d.avg_daily_demand, 0) AS avg_daily_demand,
                COALESCE(d.max_daily_demand, 0) AS max_daily_demand,
                l.lead_time_days,
                CASE 
                    WHEN d.barang_id IS NULL THEN 0
                    ELSE GREATEST(0, 
                        (COALESCE(d.max_daily_demand, 0) - COALESCE(d.avg_daily_demand, 0)) * l.lead_time_days
                    )
                END AS safety_stock,
                ROUND(
                    (COALESCE(d.avg_daily_demand, 0) * l.lead_time_days) + 
                    GREATEST(0, (COALESCE(d.max_daily_demand, 0) - COALESCE(d.avg_daily_demand, 0)) * l.lead_time_days)
                ) AS reorder_point
            FROM 
                barangs br
                LEFT JOIN daily_demand_stats d ON br.id = d.barang_id
                CROSS JOIN lead_time_calc l
        ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("DROP VIEW IF EXISTS reorder_point");
    }
};
