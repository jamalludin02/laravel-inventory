@extends('layouts.app')

@section('content')

    <div class="section-header">
        <h1>Laporan Stok</h1>
        <div class="ml-auto">
            <a href="javascript:void(0)" class="btn btn-danger" id="print-stok"><i
                    class="fa fa-sharp fa-light fa-print"></i> Print PDF</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="opsi-laporan-stok">Filter Stok Berdasarkan :</label>
                        <select class="form-control" name="opsi-laporan-stok" id="opsi-laporan-stok">
                            <option value="semua" selected>Semua</option>
                            <option value="minimum">Batas Reorder Point</option>
                            <option value="stok-habis">Stok Habis</option>
                        </select>
                    </div>

                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="table_id" class="display">
                            <thead>
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Kode Barang</th>
                                    <th>Nama Barang</th>
                                    <th class="text-center">Stok</th>
                                    <th class="text-center">Lead Time</th>
                                    <th class="text-center">
                                        Safety Stock <br> <small>SS = ( Max order - Avg Demand) * Lead Time</small>
                                    </th>
                                    <th class="text-center">
                                        Reorder Point <br> <small>ROP = ( Avg Demand * Lead Time ) + Safety Stock</small>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="tabel-laporan-stok">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Dropdown -->
    <script>
        $(document).ready(function () {
            var table = $('#table_id').DataTable({
                paging: true,
                columnDefs: [
                    { className: 'text-center', targets: [0, 3, 4, 5, 6] }
                ]
            });

            loadData('semua');

            $('#opsi-laporan-stok').on('change', function () {
                var selectedOption = $(this).val();
                loadData(selectedOption);
            });

            function loadData(selectedOption) {
                $.ajax({
                    url: '/laporan-stok/get-data',
                    type: 'GET',
                    data: { opsi: selectedOption },
                    success: function (response) {
                        table.clear().draw();

                        let counter = 1;
                        $.each(response, function (index, item) {
                            let warning = '';
                            let stokClass = '';
                            let stokVal = parseFloat(item.stok);
                            let ssVal = parseFloat(item.safety_stock);
                            let ropVal = parseFloat(item.reorder_point);

                            if (stokVal < ssVal) {
                                stokClass = 'text-danger font-weight-bold';
                                warning = ' &nbsp; &nbsp;<i class="fas fa-exclamation-circle text-danger" title="Stok di bawah Safety Stock!"></i>';
                            } else if (stokVal < ropVal) {
                                stokClass = 'text-warning font-weight-bold';
                                warning = ' &nbsp; &nbsp;<i class="fas fa-exclamation-triangle text-warning" title="Stok di bawah Reorder Point!"></i>';
                            }

                            var row = [
                                counter++,
                                item.kode_barang + warning,
                                item.nama_barang,
                                `<span class="${stokClass}">${item.stok} ${(item.satuan ? item.satuan.satuan : '')}</span>`,
                                item.lead_time_days + ' days',
                                item.safety_stock + ' ' + (item.satuan ? item.satuan.satuan : ''),
                                item.reorder_point + ' ' + (item.satuan ? item.satuan.satuan : '')
                            ];
                            table.row.add(row); // Menambahkan baris data ke DataTables
                        });
                        table.draw();
                    }
                });

            }

            $('#print-stok').on('click', function () {
                var selectedOption = $('#opsi-laporan-stok').val();
                window.location.href = '/laporan-stok/print-stok?opsi=' + selectedOption;
            });
        });
    </script>

@endsection