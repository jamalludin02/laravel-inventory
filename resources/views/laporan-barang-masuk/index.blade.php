@extends('layouts.app')

@include('barang-masuk.edit')

@section('content')

<div class="section-header">
    <h1>Laporan Barang Masuk</h1>
    <div class="ml-auto">
        <a href="javascript:void(0)" class="btn btn-danger" id="print-barang-masuk"><i class="fa fa-sharp fa-light fa-print"></i> Print PDF</a>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="form-group">
                    <form id="filter_form" action="/laporan-barang-masuk/get-data" method="GET">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Pilih Tanggal Mulai :</label>
                                <input type="date" class="form-control" name="tanggal_mulai" id="tanggal_mulai">
                            </div>
                            <div class="col-md-5">
                                <label>Pilih Tanggal Selesai :</label>
                                <input type="date" class="form-control" name="tanggal_selesai" id="tanggal_selesai">
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary">Filter</button>
                                <button type="button" class="btn btn-danger" id="refresh_btn">Refresh</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="table_id" class="display">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Transaksi</th>
                                <th>Tanggal Masuk</th>
                                <th>Nama Barang</th>
                                <th>Jumlah Masuk</th>
                                <th>Supplier</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        <tbody id="tabel-laporan-barang-masuk">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
    var table = $('#table_id').DataTable({ paging: true }); // Simpan objek DataTable dalam variabel

    loadData(); // Panggil fungsi loadData saat halaman dimuat

    $('#filter_form').submit(function(event) {
        event.preventDefault();
        loadData(); // Panggil fungsi loadData saat tombol filter ditekan
    });

    $('#refresh_btn').on('click', function() {
        refreshTable();
    });

    // Fungsi load data berdasarkan range tanggal_mulai dan tanggal_selesai
    function loadData() {
        var tanggalMulai = $('#tanggal_mulai').val();
        var tanggalSelesai = $('#tanggal_selesai').val();

        $.ajax({
            url: '/laporan-barang-masuk/get-data',
            type: 'GET',
            dataType: 'json',
            data: {
                tanggal_mulai: tanggalMulai,
                tanggal_selesai: tanggalSelesai
            },
            success: function(response) {
                table.clear().draw(); // Hapus data yang sudah ada dari DataTable sebelum menambahkan data yang baru

                if (response.length > 0) {
                    $.each(response, function(index, item) {
                        getSupplierName(item.supplier_id, function(supplier) {
                            var row = [
                                (index + 1),
                                item.kode_transaksi,
                                item.tanggal_masuk,
                                item.nama_barang,
                                item.jumlah_masuk,
                                supplier,
                                `<a href="javascript:void(0)" id="button_edit_barangMasuk" data-id="${item.id}" class="btn btn-icon btn-warning btn-lg mb-2"><i class="far fa-edit"></i> </a>`
                            ];
                            table.row.add(row).draw(false); // Tambahkan data yang baru ke DataTable
                        });
                    });
                } else {
                    var emptyRow = ['','Tidak ada data yang tersedia.', '', '', '', '', ''];
                    table.row.add(emptyRow).draw(false); // Tambahkan baris kosong ke DataTable
                }
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });

        function getSupplierName(supplierId, callback) {
            $.getJSON('{{ url('api/supplier') }}', function(suppliers) {
                var supplier = suppliers.find(function(s) {
                    return s.id === supplierId;
                });
                callback(supplier ? supplier.supplier : '');
            });
        }
    }

    // Fungsi Refresh Tabel
    function refreshTable() {
        $('#filter_form')[0].reset();
        loadData();
    }

    // Print barang masuk
    $('#print-barang-masuk').on('click', function() {
        var tanggalMulai = $('#tanggal_mulai').val();
        var tanggalSelesai = $('#tanggal_selesai').val();

        var url = '/laporan-barang-masuk/print-barang-masuk';

        if (tanggalMulai && tanggalSelesai) {
            url += '?tanggal_mulai=' + tanggalMulai + '&tanggal_selesai=' + tanggalSelesai;
        }

        window.location.href = url;
    });

    // Edit Data Barang Masuk
    $('body').on('click', '#button_edit_barangMasuk', function() {
        let barangMasuk_id = $(this).data('id');

        $.ajax({
            url: `/barang-masuk/${barangMasuk_id}/edit`,
            type: "GET",
            cache: false,
            success: function(response) {
                $('#barangMasuk_id').val(response.data.id);
                $('#edit_tanggal_masuk').val(response.data.tanggal_masuk);
                $('#edit_kode_transaksi').val(response.data.kode_transaksi);
                $('#edit_nama_barang').val(response.data.nama_barang).trigger('change');
                $('#edit_jumlah_masuk').val(response.data.jumlah_masuk);
                $('#edit_supplier_id').val(response.data.supplier_id);

                $('#modal_edit_barangMasuk').modal('show');
            }
        });
    });

    // Update Data Barang Masuk
    $('#update').click(function(e) {
        e.preventDefault();

        let barangMasuk_id = $('#barangMasuk_id').val();
        let tanggal_masuk = $('#edit_tanggal_masuk').val();
        let kode_transaksi = $('#edit_kode_transaksi').val();
        let nama_barang = $('#edit_nama_barang').val();
        let jumlah_masuk = $('#edit_jumlah_masuk').val();
        let supplier_id = $('#edit_supplier_id').val();
        let token = $("meta[name='csrf-token']").attr("content");

        let formData = new FormData();
        formData.append('tanggal_masuk', tanggal_masuk);
        formData.append('kode_transaksi', kode_transaksi);
        formData.append('nama_barang', nama_barang);
        formData.append('jumlah_masuk', jumlah_masuk);
        formData.append('supplier_id', supplier_id);
        formData.append('_token', token);
        formData.append('_method', 'PUT');

        $.ajax({
            url: `/barang-masuk/${barangMasuk_id}`,
            type: "POST",
            cache: false,
            data: formData,
            contentType: false,
            processData: false,

            success: function(response) {
                Swal.fire({
                    type: 'success',
                    icon: 'success',
                    title: `${response.message}`,
                    showConfirmButton: true,
                    timer: 3000
                });

                $('#modal_edit_barangMasuk').modal('hide');
                loadData();
            },
            error: function(error) {
                // Handle errors
            }
        });
    });

    // Auto-fill stok and satuan on barang change in edit modal
    $('#edit_nama_barang').on('change', function() {
        var selectedOption = $(this).find('option:selected');
        var nama_barang = selectedOption.text();

        $.ajax({
            url: '/api/barang-masuk',
            type: 'GET',
            data: {
                nama_barang: nama_barang,
            },
            success: function(response) {
                if (response && (response.stok || response.stok === 0) &&
                    response.satuan_id) {
                    $('#edit_stok').val(response.stok);
                    getSatuanName(response.satuan_id, function(satuan) {
                        $('#edit_satuan_id').val(satuan);
                    });
                }
            },
        });
    });

    function getSatuanName(satuanId, callback) {
        $.getJSON('{{ url('api/satuan') }}', function(satuans) {
            var satuan = satuans.find(function(s) {
                return s.id === satuanId;
            });
            callback(satuan ? satuan.satuan : '');
        });
    }
});

</script>
@endsection