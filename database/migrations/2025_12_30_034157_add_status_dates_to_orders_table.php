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
        Schema::table('orders', function (Blueprint $table) {
            $table->timestamp('date_post')->nullable()->after('status');
            $table->timestamp('date_confirm')->nullable()->after('date_post');
            $table->timestamp('date_shipped')->nullable()->after('date_confirm');
            $table->timestamp('date_complete')->nullable()->after('date_shipped');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn(['date_post', 'date_confirm', 'date_shipped', 'date_complete']);
        });
    }
};
