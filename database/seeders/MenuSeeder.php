<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Menu;
use App\Models\Role;

class MenuSeeder extends Seeder
{
    public function run(): void
    {
        // Clear existing
        \Schema::disableForeignKeyConstraints();
        Menu::truncate();
        \DB::table('role_menu')->truncate();
        \Schema::enableForeignKeyConstraints();

        $roles = Role::all()->keyBy('role');

        // 1. Dashboard
        $dashboard = Menu::create([
            'name' => 'Dashboard',
            'url' => '/',
            'icon' => 'fas fa-fire',
            'order' => 1,
            'type' => 'menu'
        ]);
        $dashboard->roles()->attach($roles->pluck('id'));

        // 2. Data Master
        $headerMaster = Menu::create(['name' => 'DATA MASTER', 'type' => 'header', 'order' => 2]);
        $headerMaster->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        $dataBarang = Menu::create([
            'name' => 'Data Barang',
            'icon' => 'fas fa-thin fa-cubes',
            'order' => 3,
            'type' => 'menu'
        ]);
        $dataBarang->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        Menu::create(['name' => 'Nama Barang', 'url' => '/barang', 'parent_id' => $dataBarang->id, 'order' => 1])
            ->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));
        Menu::create(['name' => 'Jenis', 'url' => '/jenis-barang', 'parent_id' => $dataBarang->id, 'order' => 2])
            ->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));
        Menu::create(['name' => 'Satuan', 'url' => '/satuan-barang', 'parent_id' => $dataBarang->id, 'order' => 3])
            ->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        $perusahaan = Menu::create([
            'name' => 'Perusahaan',
            'icon' => 'fa fa-sharp fa-solid fa-building',
            'order' => 4,
            'type' => 'menu'
        ]);
        $perusahaan->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        Menu::create(['name' => 'Supplier', 'url' => '/supplier', 'parent_id' => $perusahaan->id, 'order' => 1])
            ->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));
        Menu::create(['name' => 'Customer', 'url' => '/customer', 'parent_id' => $perusahaan->id, 'order' => 2])
            ->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        // 3. Transaksi Barang Masuk
        $headerMasuk = Menu::create(['name' => 'TRANSAKSI BARANG MASUK', 'type' => 'header', 'order' => 5]);
        $headerMasuk->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        $po = Menu::create([
            'name' => 'Purchase Order',
            'url' => '/purchase-order',
            'icon' => 'fa fa-file-invoice-dollar',
            'order' => 6,
            'type' => 'menu'
        ]);
        $po->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        // 4. Transaksi Barang Keluar
        $headerKeluar = Menu::create(['name' => 'TRANSAKSI BARANG KELUAR', 'type' => 'header', 'order' => 7]);
        $headerKeluar->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        $so = Menu::create([
            'name' => 'Sales Order',
            'url' => '/order',
            'icon' => 'fa fa-file-invoice-dollar',
            'order' => 8,
            'type' => 'menu'
        ]);
        $so->roles()->attach($roles->pluck('id')->except($roles['kepala_gudang']->id ?? null));

        // 5. Laporan
        $headerLaporan = Menu::create(['name' => 'LAPORAN', 'type' => 'header', 'order' => 9]);
        $headerLaporan->roles()->attach($roles->pluck('id'));

        $lapStok = Menu::create(['name' => 'Stok', 'url' => '/laporan-stok', 'icon' => 'fa fa-sharp fa-reguler fa-file', 'order' => 10]);
        $lapStok->roles()->attach($roles->pluck('id'));

        $lapMasuk = Menu::create(['name' => 'Barang Masuk', 'url' => '/laporan-barang-masuk', 'icon' => 'fa fa-regular fa-file-import', 'order' => 11]);
        $lapMasuk->roles()->attach($roles->pluck('id'));

        $lapKeluar = Menu::create(['name' => 'Barang Keluar', 'url' => '/laporan-barang-keluar', 'icon' => 'fa fa-sharp fa-regular fa-file-export', 'order' => 12]);
        $lapKeluar->roles()->attach($roles->pluck('id'));

        // 6. Manajemen User
        $headerUser = Menu::create(['name' => 'MANAJEMEN USER', 'type' => 'header', 'order' => 13]);
        $headerUser->roles()->attach([$roles['super_admin']->id, $roles['kepala_gudang']->id]);

        $dataPengguna = Menu::create(['name' => 'Data Pengguna', 'url' => '/data-pengguna', 'icon' => 'fa fa-solid fa-users', 'order' => 14]);
        $dataPengguna->roles()->attach([$roles['super_admin']->id]);

        $hakAkses = Menu::create(['name' => 'Hak Akses/Role', 'url' => '/hak-akses', 'icon' => 'fa fa-solid fa-user-lock', 'order' => 15]);
        $hakAkses->roles()->attach([$roles['super_admin']->id]);

        $menuMgmt = Menu::create(['name' => 'Menu Management', 'url' => '/menu-management', 'icon' => 'fa fa-solid fa-bars', 'order' => 16]);
        $menuMgmt->roles()->attach([$roles['super_admin']->id]);

        $aktivitas = Menu::create(['name' => 'Aktivitas User', 'url' => '/aktivitas-user', 'icon' => 'fa fa-solid fa-list', 'order' => 17]);
        $aktivitas->roles()->attach([$roles['super_admin']->id, $roles['kepala_gudang']->id]);
    }
}
