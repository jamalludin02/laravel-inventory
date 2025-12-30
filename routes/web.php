<?php

use App\Http\Controllers\ActivityLogController;
use App\Models\Supplier;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JenisController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\SatuanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\BarangMasukController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HakAksesController;
use App\Http\Controllers\LaporanBarangKeluarController;
use App\Http\Controllers\LaporanBarangMasukController;
use App\Http\Controllers\LaporanStokController;
use App\Http\Controllers\ManajemenUserController;
use App\Http\Controllers\UbahPasswordController;
use App\Models\BarangKeluar;
use App\Models\BarangMasuk;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PurchaseOrderController;

/*
|--------------------------------------------------------------------------
| Web Routes    
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::middleware('auth')->group(function () {

    // --- ALL ROLES ---
    Route::group(['middleware' => 'checkRole:super_admin,kepala_gudang,admin_gudang,staff_gudang,admin_sales'], function () {
        Route::get('/', [DashboardController::class, 'index']);
        Route::resource('/dashboard', DashboardController::class);

        Route::get('/ubah-password', [UbahPasswordController::class, 'index']);
        Route::post('/ubah-password', [UbahPasswordController::class, 'changePassword']);

        // Reports
        Route::get('/laporan-stok/get-data', [LaporanStokController::class, 'getData']);
        Route::get('/laporan-stok/print-stok', [LaporanStokController::class, 'printStok']);
        Route::get('/api/satuan/', [LaporanStokController::class, 'getSatuan']);
        Route::resource('/laporan-stok', LaporanStokController::class);

        Route::get('/laporan-barang-masuk/get-data', [LaporanBarangMasukController::class, 'getData']);
        Route::get('/laporan-barang-masuk/print-barang-masuk', [LaporanBarangMasukController::class, 'printBarangMasuk']);
        Route::get('/api/supplier/', [LaporanBarangMasukController::class, 'getSupplier']);
        Route::resource('/laporan-barang-masuk', LaporanBarangMasukController::class);

        Route::get('/laporan-barang-keluar/get-data', [LaporanBarangKeluarController::class, 'getData']);
        Route::get('/laporan-barang-keluar/print-barang-keluar', [LaporanBarangKeluarController::class, 'printBarangKeluar']);
        Route::get('/api/customer/', [LaporanBarangKeluarController::class, 'getCustomer']);
        Route::resource('/laporan-barang-keluar', LaporanBarangKeluarController::class);
    });

    // --- SUPER ADMIN ONLY ---
    Route::group(['middleware' => 'checkRole:super_admin'], function () {
        Route::get('/data-pengguna/get-data', [ManajemenUserController::class, 'getDataPengguna']);
        Route::get('/api/role/', [ManajemenUserController::class, 'getRole']);
        Route::get('/data-pengguna/switch/{id}', [ManajemenUserController::class, 'switchUser'])->name('data-pengguna.switch');
        Route::resource('/data-pengguna', ManajemenUserController::class);

        Route::get('/hak-akses/get-data', [HakAksesController::class, 'getDataRole']);
        Route::resource('/hak-akses', HakAksesController::class);

        Route::post('/menu-management/reorder', [\App\Http\Controllers\MenuManagementController::class, 'reorder'])->name('menu-management.reorder');
        Route::resource('/menu-management', \App\Http\Controllers\MenuManagementController::class);
    });

    Route::get('/switch-back', [ManajemenUserController::class, 'switchBack'])->name('data-pengguna.switch-back');

    // --- SUPER ADMIN & KEPALA GUDANG ---
    Route::group(['middleware' => 'checkRole:super_admin,kepala_gudang'], function () {
        Route::resource('/aktivitas-user', ActivityLogController::class);
    });

    // --- OPERATIONAL (SUPER ADMIN, ADMIN GUDANG, STAFF GUDANG, ADMIN SALES) ---
    Route::group(['middleware' => 'checkRole:super_admin,admin_gudang,staff_gudang,admin_sales'], function () {
        // Master Data
        Route::get('/barang/get-data', [BarangController::class, 'getDataBarang']);
        Route::resource('/barang', BarangController::class);

        Route::get('/jenis-barang/get-data', [JenisController::class, 'getDataJenisBarang']);
        Route::resource('/jenis-barang', JenisController::class);

        Route::get('/satuan-barang/get-data', [SatuanController::class, 'getDataSatuanBarang']);
        Route::resource('/satuan-barang', SatuanController::class);

        Route::get('/supplier/get-data', [SupplierController::class, 'getDataSupplier']);
        Route::resource('/supplier', SupplierController::class);

        Route::get('/customer/get-data', [CustomerController::class, 'getDataCustomer']);
        Route::resource('/customer', CustomerController::class);

        // Transactions
        Route::get('/api/barang-masuk/', [BarangMasukController::class, 'getAutoCompleteData']);
        Route::get('/barang-masuk/get-data', [BarangMasukController::class, 'getDataBarangMasuk']);
        Route::get('/api/satuan/', [BarangMasukController::class, 'getSatuan']);
        Route::resource('/barang-masuk', BarangMasukController::class);

        Route::get('/api/barang-keluar/', [BarangKeluarController::class, 'getAutoCompleteData']);
        Route::get('/barang-keluar/get-data', [BarangKeluarController::class, 'getDataBarangKeluar']);
        Route::get('/api/satuan/', [BarangKeluarController::class, 'getSatuan']);
        Route::resource('/barang-keluar', BarangKeluarController::class);

        // Order
        Route::get('/order/export', [OrderController::class, 'export'])->name('order.export');
        Route::post('/order/import', [OrderController::class, 'import'])->name('order.import');
        Route::get('/order/download-template', [OrderController::class, 'downloadTemplate'])->name('order.download-template');
        Route::post('/order/{order}/post', [OrderController::class, 'post'])->name('order.post');
        Route::post('/order/{order}/verify', [OrderController::class, 'verify'])->name('order.verify');
        Route::post('/order/{order}/shipped', [OrderController::class, 'shipped'])->name('order.shipped');
        Route::post('/order/{order}/completed', [OrderController::class, 'completed'])->name('order.completed');
        Route::get('/order/{order}/print', [OrderController::class, 'printPDF'])->name('order.print');
        Route::post('/order/{order}/reject', [OrderController::class, 'reject'])->name('order.reject');
        Route::delete('/order/detail/{detail}', [OrderController::class, 'deleteDetail'])->name('order.delete-detail');
        Route::put('/order/detail/{detail}', [OrderController::class, 'updateDetail'])->name('order.update-detail');
        Route::resource('/order', OrderController::class);

        // Purchase Order
        Route::get('/purchase-order/{purchaseOrder}/process-receipt', [PurchaseOrderController::class, 'processReceipt'])->name('purchase-order.process-receipt');
        Route::post('/purchase-order/{purchaseOrder}/store-receipt', [PurchaseOrderController::class, 'storeReceipt'])->name('purchase-order.store-receipt');
        Route::post('/purchase-order/{purchaseOrder}/post', [PurchaseOrderController::class, 'post'])->name('purchase-order.post');
        Route::resource('/purchase-order', PurchaseOrderController::class);
    });
});

require __DIR__ . '/auth.php';
