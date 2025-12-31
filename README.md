# Sistem Informasi Inventory Gudang

Sistem Informasi Inventory Gudang Berbasis Web adalah aplikasi yang dirancang untuk mengelola inventaris atau stok barang secara efisien. Sistem ini mencakup manajemen stok cerdas menggunakan metode **Reorder Point (ROP)** dan **Safety Stock (SS)** untuk memastikan ketersediaan barang tetap terjaga berdasarkan data historis transaksi.

## Fitur Utama

### 1. Manajemen Stok Cerdas (ROP & SS)
*   **Safety Stock (SS)**: Perhitungan stok pengaman otomatis berdasarkan variasi permintaan dan lead time.
    *   *Rumus: (Max Demand - Avg Demand) * Lead Time*
*   **Reorder Point (ROP)**: Titik pemesanan kembali otomatis untuk mencegah kehabisan stok.
    *   *Rumus: (Avg Demand * Lead Time) + Safety Stock*
*   **Visual Warning**: Indikator warna (Merah/Oranye) pada laporan stok untuk barang yang mencapai ambang batas kritis.

### 2. Fitur Aplikasi
- **Dashboard**: Ringkasan stok dan aktivitas terbaru.
- **Data Master**:
    1. **Data Barang**: Manajemen stok, harga, dan kategori barang.
    2. **Jenis Barang**: Pengelompokan barang berdasarkan jenis.
    3. **Satuan Barang**: Pengaturan satuan (Pcs, Box, Kg, dll).
    4. **Perusahaan**:
        - **Customer**: Data pelanggan untuk Sales Order.
        - **Supplier**: Data pemasok untuk Purchase Order.
- **Transaksi**:
    1. **Sales Order (Order)**: Manajemen pesanan penjualan, status pengiriman, dan cetak invoice.
    2. **Purchase Order (PO)**: Manajemen pesanan pembelian ke supplier dengan fitur *Reorder Point*.
    3. **Barang Masuk**: Pencatatan barang masuk (terintegrasi dengan PO).
    4. **Barang Keluar**: Pencatatan barang keluar (terintegrasi dengan Sales Order).
- **Laporan**:
    1. **Laporan Stok**: Monitoring stok dengan indikator *Safety Stock* dan *Reorder Point* (Print PDF).
    2. **Laporan Barang Masuk**: Rekapitulasi barang masuk berdasarkan periode (Print PDF).
    3. **Laporan Barang Keluar**: Rekapitulasi barang keluar berdasarkan periode (Print PDF).
- **Manajemen User**:
    1. **Data Pengguna**: Pengaturan akun pengguna.
    2. **Hak Akses (Role)**: Pengaturan izin akses (Super Admin, Admin Gudang, Staff, dll).
    3. **Menu Management**: Pengaturan urutan dan visibilitas menu.
    4. **Activity Log**: Pencatatan riwayat aktivitas pengguna di sistem.
- **Profil**:
    1. **Ubah Password**: Fitur keamanan untuk mengganti password pengguna.

### 3. Siklus Penjualan & Logistik
*   **Sales Order (SO)**: Manajemen pesanan dari customer.
*   **Barang Masuk & Keluar**: Pencatatan mutasi barang dengan traceability (Kode PO/SO).
*   **Laporan**: Cetak laporan stok, barang masuk, dan barang keluar dalam format PDF.

### 4. Administrasi & Keamanan
*   **Manajemen User**: Pengaturan pengguna dengan hak akses (Role-based Access Control).
*   **Activity Log**: Pencatatan setiap aktivitas penting yang dilakukan pengguna dalam sistem.
*   **Database Backup**: Fitur backup database mandiri untuk keamanan data.

## Teknologi
*   **Laravel 10/11**: PHP Framework.
*   **MySQL**: Database dengan pemanfaatan *Database Views* untuk kalkulasi ROP dinamis.
*   **Stisla**: Admin Template.
*   **DataTables**: Manajemen tabel interaktif.
*   **Dompdf**: Generator laporan PDF.

## Instalasi Lokal (XAMPP)

1.  **Clone Project**:
    ```sh
    git clone https://github.com/jamalludin02/laravel-inventory.git
    ```
2.  **Install Dependensi**:
    ```sh
    composer install
    ```
3.  **Konfigurasi Database**:
    *   Buat database di MySQL.
    *   Salin `.env.example` menjadi `.env` dan sesuaikan `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`.
4.  **Migrasi & Seed**:
    ```sh
    php artisan migrate --seed
    ```
5.  **Konfigurasi Sub-folder (Opsional)**:
    Jika dijalankan di sub-folder XAMPP (misal: `localhost/inventory`), sesuaikan `APP_URL` di `.env`:
    ```env
    APP_URL=http://localhost/inventory
    ```

## Hosting (InfinityFree/Shared Hosting)

1.  **Optimasi Vendor**: Jalankan `composer install --no-dev --optimize-autoloader`.
3.  **Upload**: Unggah seluruh file ke folder `htdocs` (gunakan ZIP untuk kecepatan).
4.  **Entry Point**: Gunakan file `.htaccess` di root untuk mengarahkan traffic ke folder `public`.
5.  **Database**: Import database melalui phpMyAdmin di panel hosting.
