<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Role;
use App\Models\User;
use App\Models\Jenis;
use App\Models\Barang;
use App\Models\Satuan;
use App\Models\Customer;
use App\Models\Supplier;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // ROLES
        Role::insert([
            [
                'role' => 'superadmin',
                'deskripsi' => 'Superadmin memiliki kendali penuh pada aplikasi termasuk manajemen User',
            ],
            [
                'role' => 'kepala gudang',
                'deskripsi' => 'Kepala gudang memiliki akses untuk mengelola dan mencetak laporan stok, barang masuk, dan barang keluar',
            ],
            [
                'role' => 'admin gudang',
                'deskripsi' => 'Admin gudang memiliki akses untuk mengelola stok, barang masuk, barang keluar dan laporannya',
            ],
            [
                'role' => 'admin pembelian',
                'deskripsi' => 'Admin pembelian mengelola data supplier dan pengadaan barang',
            ],
            [
                'role' => 'admin penjualan',
                'deskripsi' => 'Admin penjualan mengelola data customer dan distribusi barang',
            ],
        ]);

        // // USERS
        User::insert([
            [
                'name' => 'Super Admin',
                'username' => 'super_admin',
                'password' => bcrypt('1234'),
                'role_id' => 1,
            ],
            [
                'name' => 'Kepala Gudang',
                'username' => 'kepala_gudang',
                'password' => bcrypt('1234'),
                'role_id' => 2,
            ],
            [
                'name' => 'Admin Gudang 1',
                'username' => 'admin_gudang_1',
                'password' => bcrypt('1234'),
                'role_id' => 3,
            ],
            [
                'name' => 'Admin Pembelian',
                'username' => 'admin_pembelian',
                'password' => bcrypt('1234'),
                'role_id' => 4,
            ],
            [
                'name' => 'Admin Penjualan',
                'username' => 'admin_penjualan',
                'password' => bcrypt('1234'),
                'role_id' => 5,
            ],
        ]);

        // // JENIS BARANG
        // Jenis::insert([
        //     ['jenis_barang' => 'Beras Medium', 'user_id' => 1],
        //     ['jenis_barang' => 'Minyak Goreng', 'user_id' => 1],
        //     ['jenis_barang' => 'Gula Pasir', 'user_id' => 1],
        //     ['jenis_barang' => 'Tepung Terigu', 'user_id' => 1],
        //     ['jenis_barang' => 'Susu Bubuk', 'user_id' => 1],
        // ]);

        // // SATUAN
        // Satuan::insert([
        //     ['satuan' => 'Kg', 'user_id' => 1],
        //     ['satuan' => 'Liter', 'user_id' => 1],
        //     ['satuan' => 'Dus', 'user_id' => 1],
        //     ['satuan' => 'Pack', 'user_id' => 1],
        //     ['satuan' => 'Pcs', 'user_id' => 1],
        // ]);

        // // SUPPLIER
        // Supplier::insert([
        //     ['supplier' => 'PT Agro Makmur', 'alamat' => 'Jl. Raya Pati – Kudus KM. 4', 'user_id' => 1],
        //     ['supplier' => 'CV Sumber Pangan', 'alamat' => 'Jl. Industri No. 10, Gresik', 'user_id' => 1],
        //     ['supplier' => 'PT Indo Grosir', 'alamat' => 'Jl. Ahmad Yani, Surabaya', 'user_id' => 1],
        //     ['supplier' => 'CV Mitra Niaga', 'alamat' => 'Jl. Slamet Riyadi, Solo', 'user_id' => 1],
        //     ['supplier' => 'PT Daya Pangan', 'alamat' => 'Jl. Dr. Wahidin, Semarang', 'user_id' => 1],
        // ]);

        // // CUSTOMER
        // Customer::insert([
        //     ['customer' => 'CV Sejahtera Abadi', 'alamat' => 'Jl. Pemuda No. 10, Pekalongan', 'user_id' => 1],
        //     ['customer' => 'Toko Makmur Sentosa', 'alamat' => 'Jl. Malioboro No. 2, Yogyakarta', 'user_id' => 1],
        //     ['customer' => 'PT Pangan Nusantara', 'alamat' => 'Jl. Gatot Subroto, Jakarta', 'user_id' => 1],
        //     ['customer' => 'UD Rizky Jaya', 'alamat' => 'Jl. Letjend S. Parman, Purwokerto', 'user_id' => 1],
        //     ['customer' => 'Toko Laris Manis', 'alamat' => 'Jl. Sunan Kalijaga, Tegal', 'user_id' => 1],
        // ]);
    }
}
