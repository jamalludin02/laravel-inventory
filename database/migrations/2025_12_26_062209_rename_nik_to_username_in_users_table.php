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
        Schema::table('users', function (Blueprint $table) {
            $table->renameColumn('nik', 'username');
        });

        // Update existing data: "Super Admin" -> "super_admin"
        $users = \Illuminate\Support\Facades\DB::table('users')->get();
        foreach ($users as $user) {
            \Illuminate\Support\Facades\DB::table('users')->where('id', $user->id)->update([
                'username' => str_replace(' ', '_', strtolower($user->name))
            ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->renameColumn('username', 'nik');
        });
    }
};
