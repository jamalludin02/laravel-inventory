
# Sistem Informasi Inventory Gudang


Sistem Informasi Inventory Gudang Berbasis Web adalah aplikasi atau sistem yang digunakan untuk mengelola inventaris atau stok barang di dalam gudang melalui platform web. Sistem ini dirancang untuk memudahkan proses pengelolaan, pemantauan, dan pengendalian persediaan barang secara efisien.


## Fitur
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



## Teknologi

Sistem Informasi Inventory Gudang menggunakan beberapa Teknologi diantaranya :

- Laravel - The PHP Framework for Web Artisans
- JavaScript - JavaScript, often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.
- jQuery - jQuery is a JavaScript framework designed to simplify HTML DOM tree traversal and manipulation, as well as event handling, CSS animation, and Ajax.
- Bootstrap - Bootstrap is a free and open-source CSS framework directed at responsive, mobile-first front-end web development. 


## Installasi

Lakukan Clone Project/Unduh manual 

Buat database dengan nama 'inventorygudang'

Jika melakukan Clone Project, rename file .env.example dengan env dan hubungkan
database nya dengan mengisikan nama database, 'DB_DATABASE=inventorygudang'


Kemudian, Ketik pada terminal :
```sh
php artisan migrate
```

Lalu ketik juga

```sh
php artisan migrate:fresh --seed
```

Jalankan aplikasi 

```sh
php artisan serve
```

Akses Aplikasi di Web browser 
```sh
127.0.0.1:8000
```
