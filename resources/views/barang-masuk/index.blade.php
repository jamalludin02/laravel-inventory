@extends('layouts.app')

@include('barang-masuk.create')
@include('barang-masuk.edit')

@section('content')
    <div class="section-header">
        <h1>Barang Masuk</h1>
        <div class="ml-auto">
            <a href="javascript:void(0)" class="btn btn-primary" id="button_tambah_barangMasuk"><i class="fa fa-plus"></i>
                Barang Masuk</a>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="table_id" class="display">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Kode Transaksi</th>
                                    <th>Kode PO</th>
                                    <th>Tanggal Masuk</th>
                                    <th>Nama Barang</th>
                                    <th>Stok Masuk</th>
                                    <th>Supplier</th>
                                    <th>Opsi</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Initialize DataTable
            $('#table_id').DataTable({
                paging: true
            });

            // Load Initial Data
            loadData();

            // Initialize Select2
            $('.select2').select2({
                width: '100%'
            });

            // Generate Initial Kode Transaksi
            generateKodeTransaksi();

            // Set Today's Date
            setTodayDate();

            // --- Event Listeners ---

            // Show Modal Tambah
            $('body').on('click', '#button_tambah_barangMasuk', function () {
                $('#modal_tambah_barangMasuk').modal('show');
                generateKodeTransaksi();
            });

            // Store Data
            $('#store').click(function (e) {
                e.preventDefault();
                storeData();
            });

            // Show Modal Edit
            $('body').on('click', '#button_edit_barangMasuk', function () {
                let id = $(this).data('id');
                editData(id);
            });

            // Update Data
            $('#update').click(function (e) {
                e.preventDefault();
                updateData();
            });

            // Hapus Data
            $('body').on('click', '#button_hapus_barangMasuk', function () {
                let id = $(this).data('id');
                deleteData(id);
            });

            // Auto-fill on Barang Change (Create)
            $('#nama_barang').on('change', function () {
                let nama_barang = $(this).find('option:selected').text();
                fetchBarangInfo(nama_barang, '#stok', '#satuan_id');
            });

            // Auto-fill on Barang Change (Edit)
            $('#edit_nama_barang').on('change', function () {
                let nama_barang = $(this).find('option:selected').text();
                fetchBarangInfo(nama_barang, '#edit_stok', '#edit_satuan_id');
            });

            // --- Functions ---

            function loadData() {
                $.ajax({
                    url: "/barang-masuk/get-data",
                    type: "GET",
                    dataType: 'JSON',
                    success: function (response) {
                        renderTable(response.data, response.supplier);
                    }
                });
            }

            function renderTable(data, suppliers) {
                let counter = 1;
                $('#table_id').DataTable().clear();
                $.each(data, function (key, value) {
                    let supplierName = getSupplierName(suppliers, value.supplier_id);
                    let row = `
                                        <tr class="barang-row" id="index_${value.id}">
                                            <td>${counter++}</td>   
                                            <td>${value.kode_transaksi}</td>
                                            <td>${value.po_no || '-'}</td>
                                            <td>${value.tanggal_masuk}</td>
                                            <td>${value.nama_barang}</td>
                                            <td>${value.jumlah_masuk}</td>
                                            <td>${supplierName}</td>
                                            <td>
                                                <a href="javascript:void(0)" id="button_edit_barangMasuk" data-id="${value.id}" class="btn btn-icon btn-warning btn-lg mb-2"><i class="far fa-edit"></i> </a>
                                                <a href="javascript:void(0)" id="button_hapus_barangMasuk" data-id="${value.id}" class="btn btn-icon btn-danger btn-lg mb-2"><i class="fas fa-trash"></i> </a>
                                            </td>
                                        </tr>
                                    `;
                    $('#table_id').DataTable().row.add($(row)).draw(false);
                });
            }

            function storeData() {
                let formData = new FormData();
                formData.append('kode_transaksi', $('#kode_transaksi').val());
                formData.append('tanggal_masuk', $('#tanggal_masuk').val());
                formData.append('nama_barang', $('#nama_barang').val());
                formData.append('jumlah_masuk', $('#jumlah_masuk').val());
                formData.append('supplier_id', $('#supplier_id').val());
                formData.append('_token', $("meta[name='csrf-token']").attr("content"));

                $.ajax({
                    url: '/barang-masuk',
                    type: "POST",
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        Swal.fire({
                            icon: 'success',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 3000
                        });
                        $('#modal_tambah_barangMasuk').modal('hide');
                        resetCreateForm();
                        loadData();
                    },
                    error: function (error) {
                        handleValidationErrors(error.responseJSON, '');
                    }
                });
            }

            function editData(id) {
                $.ajax({
                    url: `/barang-masuk/${id}/edit`,
                    type: "GET",
                    success: function (response) {
                        $('#barangMasuk_id').val(response.data.id);
                        $('#edit_tanggal_masuk').val(response.data.tanggal_masuk);
                        $('#edit_kode_transaksi').val(response.data.kode_transaksi);
                        $('#edit_nama_barang').val(response.data.nama_barang).trigger('change');
                        $('#edit_jumlah_masuk').val(response.data.jumlah_masuk);
                        $('#edit_supplier_id').val(response.data.supplier_id);
                        $('#modal_edit_barangMasuk').modal('show');
                    }
                });
            }

            function updateData() {
                let id = $('#barangMasuk_id').val();
                let formData = new FormData();
                formData.append('tanggal_masuk', $('#edit_tanggal_masuk').val());
                formData.append('kode_transaksi', $('#edit_kode_transaksi').val());
                formData.append('nama_barang', $('#edit_nama_barang').val());
                formData.append('jumlah_masuk', $('#edit_jumlah_masuk').val());
                formData.append('supplier_id', $('#edit_supplier_id').val());
                formData.append('_token', $("meta[name='csrf-token']").attr("content"));
                formData.append('_method', 'PUT');

                $.ajax({
                    url: `/barang-masuk/${id}`,
                    type: "POST",
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        Swal.fire({
                            icon: 'success',
                            title: response.message,
                            showConfirmButton: true,
                            timer: 3000
                        });
                        $('#modal_edit_barangMasuk').modal('hide');
                        loadData();
                    },
                    error: function (error) {
                        handleValidationErrors(error.responseJSON, 'edit-');
                    }
                });
            }

            function deleteData(id) {
                Swal.fire({
                    title: 'Apakah Kamu Yakin?',
                    text: "ingin menghapus data ini !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'YA, HAPUS!',
                    cancelButtonText: 'TIDAK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `/barang-masuk/${id}`,
                            type: "DELETE",
                            data: { "_token": $("meta[name='csrf-token']").attr("content") },
                            success: function (response) {
                                Swal.fire({
                                    icon: 'success',
                                    title: response.message,
                                    showConfirmButton: true,
                                    timer: 3000
                                });
                                loadData();
                            }
                        });
                    }
                });
            }

            function fetchBarangInfo(nama_barang, stokElem, satuanElem) {
                $.ajax({
                    url: '/api/barang-masuk',
                    type: 'GET',
                    data: { nama_barang: nama_barang },
                    success: function (response) {
                        if (response) {
                            $(stokElem).val(response.stok || 0);
                            if (response.satuan_id) {
                                getSatuanName(response.satuan_id, function (satuan) {
                                    $(satuanElem).val(satuan);
                                });
                            } else {
                                $(satuanElem).val('');
                            }
                        }
                    }
                });
            }

            function getSupplierName(suppliers, id) {
                let supplier = suppliers.find(s => s.id === id);
                return supplier ? supplier.supplier : '';
            }

            function getSatuanName(id, callback) {
                $.getJSON('{{ url('api/satuan') }}', function (satuans) {
                    let satuan = satuans.find(s => s.id === id);
                    callback(satuan ? satuan.satuan : '');
                });
            }

            function generateKodeTransaksi() {
                let date = new Date().toLocaleDateString('id-ID').split('/').reverse().join('-');
                let random = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
                let code = `TRX-IN-${date}-${random}`;
                $('#kode_transaksi').val(code);
            }

            function setTodayDate() {
                let today = new Date();
                let formatted = today.getFullYear() + '-' +
                    (today.getMonth() + 1).toString().padStart(2, '0') + '-' +
                    today.getDate().toString().padStart(2, '0');
                $('#tanggal_masuk').val(formatted);
            }

            function resetCreateForm() {
                $('#nama_barang').val('Pilih Barang').trigger('change');
                $('#jumlah_masuk').val('');
                $('#stok').val('');
                $('#satuan_id').val('');
                generateKodeTransaksi();
            }

            function handleValidationErrors(errors, prefix) {
                const fields = ['kode_transaksi', 'tanggal_masuk', 'nama_barang', 'jumlah_masuk', 'supplier_id'];
                fields.forEach(field => {
                    let errorElem = $(`#alert-${prefix}${field}`);
                    if (errors && errors[field]) {
                        errorElem.removeClass('d-none').addClass('d-block').html(errors[field][0]);
                    } else {
                        errorElem.removeClass('d-block').addClass('d-none');
                    }
                });
            }
        });
    </script>
@endsection