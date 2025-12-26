@extends('layouts.app')

@include('barang.create')
@include('barang.edit')
@include('barang.show')

@section('content')
    <div class="section-header">
        <h1>Data Barang</h1>
        <div class="ml-auto">
            <a href="javascript:void(0)" class="btn btn-primary" id="button_tambah_barang"><i class="fa fa-plus"></i> Tambah
                Barang</a>
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
                                    <th>Kode Barang</th>
                                    <th>Nama Barang</th>
                                    <th>Harga</th>
                                    <th>Stok</th>
                                    <th>Satuan</th>
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

            $('.select2').select2({
                width: '100%'
            });

            // Load Initial Data
            loadData();

            // --- Event Listeners ---

            // Show Modal Tambah
            $('body').on('click', '#button_tambah_barang', function () {
                $('#modal_tambah_barang').modal('show');
            });

            // Store Data
            $('#store').click(function (e) {
                e.preventDefault();
                storeData();
            });

            // Show Detail Data
            $('body').on('click', '#button_detail_barang', function () {
                let id = $(this).data('id');
                showDetail(id);
            });

            // Show Modal Edit
            $('body').on('click', '#button_edit_barang', function () {
                let id = $(this).data('id');
                editData(id);
            });

            // Update Data
            $('#update').click(function (e) {
                e.preventDefault();
                updateData();
            });

            // Hapus Data
            $('body').on('click', '#button_hapus_barang', function () {
                let id = $(this).data('id');
                deleteData(id);
            });

            // --- Functions ---

            function loadData() {
                $.ajax({
                    url: "/barang/get-data",
                    type: "GET",
                    dataType: 'JSON',
                    success: function (response) {
                        renderTable(response.data);
                    }
                });
            }

            function renderTable(data) {
                let counter = 1;
                $('#table_id').DataTable().clear();
                $.each(data, function (key, value) {
                    let stok = value.stok != null ? value.stok : "Stok Kosong";
                    let row = `
                                    <tr class="barang-row" id="index_${value.id}">
                                        <td>${counter++}</td>
                                        <td>${value.kode_barang}</td>
                                        <td>${value.nama_barang}</td>
                                        <td>Rp ${new Intl.NumberFormat('id-ID').format(value.price)}</td>
                                        <td>${stok}</td>
                                        <td>${value.satuan ? value.satuan.satuan : '-'}</td>
                                        <td>
                                            <a href="javascript:void(0)" id="button_detail_barang" data-id="${value.id}" class="btn btn-icon btn-success btn-lg mb-2"><i class="far fa-eye"></i> </a>
                                            <a href="javascript:void(0)" id="button_edit_barang" data-id="${value.id}" class="btn btn-icon btn-warning btn-lg mb-2"><i class="far fa-edit"></i> </a>
                                            <a href="javascript:void(0)" id="button_hapus_barang" data-id="${value.id}" class="btn btn-icon btn-danger btn-lg mb-2"><i class="fas fa-trash"></i> </a>
                                        </td>
                                    </tr>
                                `;
                    $('#table_id').DataTable().row.add($(row)).draw(false);
                });
            }

            function storeData() {
                let formData = new FormData();
                formData.append('nama_barang', $('#nama_barang').val());
                formData.append('stok_minimum', $('#stok_minimum').val());
                formData.append('price', $('#price').val());
                formData.append('jenis_id', $('#jenis_id').val());
                formData.append('satuan_id', $('#satuan_id').val());
                formData.append('deskripsi', $('#deskripsi').val());
                formData.append('_token', $("meta[name='csrf-token']").attr("content"));

                $.ajax({
                    url: '/barang',
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
                        $('#modal_tambah_barang').modal('hide');
                        resetCreateForm();
                        loadData();
                    },
                    error: function (error) {
                        handleValidationErrors(error.responseJSON, '');
                    }
                });
            }

            function showDetail(id) {
                $.ajax({
                    url: `/barang/${id}/`,
                    type: "GET",
                    success: function (response) {
                        $('#barang_id').val(response.data.id);
                        $('#detail_nama_barang').val(response.data.nama_barang);
                        $('#detail_jenis_id').val(response.data.jenis_id);
                        $('#detail_satuan_id').val(response.data.satuan_id);
                        $('#detail_stok').val(response.data.stok !== null && response.data.stok !== '' ? response.data.stok : 'Stok Kosong');
                        $('#detail_stok_minimum').val(response.data.stok_minimum);
                        $('#detail_price').val(response.data.price);
                        $('#detail_deskripsi').val(response.data.deskripsi);
                        $('#modal_detail_barang').modal('show');
                    }
                });
            }

            function editData(id) {
                $.ajax({
                    url: `/barang/${id}/edit`,
                    type: "GET",
                    success: function (response) {
                        $('#barang_id').val(response.data.id);
                        $('#edit_nama_barang').val(response.data.nama_barang);
                        $('#edit_stok_minimum').val(response.data.stok_minimum);
                        $('#edit_price').val(response.data.price);
                        $('#edit_jenis_id').val(response.data.jenis_id);
                        $('#edit_satuan_id').val(response.data.satuan_id);
                        $('#edit_deskripsi').val(response.data.deskripsi);
                        $('#modal_edit_barang').modal('show');
                    }
                });
            }

            function updateData() {
                let id = $('#barang_id').val();
                let formData = new FormData();
                formData.append('nama_barang', $('#edit_nama_barang').val());
                formData.append('stok_minimum', $('#edit_stok_minimum').val());
                formData.append('price', $('#edit_price').val());
                formData.append('deskripsi', $('#edit_deskripsi').val());
                formData.append('jenis_id', $('#edit_jenis_id').val());
                formData.append('satuan_id', $('#edit_satuan_id').val());
                formData.append('_token', $("meta[name='csrf-token']").attr("content"));
                formData.append('_method', 'PUT');

                $.ajax({
                    url: `/barang/${id}`,
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
                        $('#modal_edit_barang').modal('hide');
                        location.reload();
                    },
                    error: function (error) {
                        handleValidationErrors(error.responseJSON, 'edit_');
                    }
                });
            }

            function deleteData(id) {
                Swal.fire({
                    title: 'Apakah Kamu Yakin?',
                    text: "ingin menghapus data ini!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'YA, HAPUS!',
                    cancelButtonText: 'TIDAK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `/barang/${id}`,
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

            function resetCreateForm() {
                $('#nama_barang').val('');
                $('#stok_minimum').val('');
                $('#price').val('');
                $('#deskripsi').val('');
                $('#preview').attr('src', '');
            }

            function handleValidationErrors(errors, prefix) {
                const fields = ['nama_barang', 'stok_minimum', 'price', 'jenis_id', 'satuan_id', 'deskripsi'];
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

        function previewImage() {
            preview.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>

@endsection