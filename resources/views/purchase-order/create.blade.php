@extends('layouts.app')

@section('content')
    <div class="section-header">
        <div class="section-header-back">
            <a href="{{ route('purchase-order.index') }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
        <h1>Tambah Purchase Order</h1>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card card-warning">
                <div class="card-header">
                    <h4>Barang di Bawah Reorder Point</h4>
                    <div class="card-header-action">
                        <a data-collapse="#safety-stock-collapse" class="btn btn-icon btn-info" href="#"><i
                                class="fas fa-minus"></i></a>
                    </div>
                </div>
                <div class="collapse show" id="safety-stock-collapse">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered">
                                <thead>
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th>Stok Saat Ini</th>
                                        <th>Reorder Point</th>
                                        <th>Kekurangan</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($barangsBelowSafety as $barang)
                                        <tr>
                                            <td>{{ $barang->nama_barang }}</td>
                                            <td>{{ $barang->stok }}</td>
                                            <td>{{ $barang->safety_stock }}</td>
                                            <td><span class="text-danger">{{ $barang->safety_stock - $barang->stok }}</span>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-sm btn-add-safety"
                                                    data-id="{{ $barang->id }}" data-name="{{ $barang->nama_barang }}"
                                                    data-price="{{ $barang->price }}"
                                                    data-unit="{{ $barang->satuan->satuan ?? '-' }}"
                                                    data-qty="{{ $barang->safety_stock - $barang->stok }}">
                                                    <i class="fa fa-plus"></i> Add to PO
                                                </button>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="5" class="text-center">Tidak ada barang di bawah reorder point.</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <form action="{{ route('purchase-order.store') }}" method="POST" autocomplete="off">
                @csrf
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Supplier</label>
                                    <select name="supplier_id" class="form-control select2"
                                        data-placeholder="Pilih Supplier" required>
                                        <option value=""></option>
                                        @foreach($suppliers as $supplier)
                                            <option value="{{ $supplier->id }}">{{ $supplier->supplier }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tanggal PO</label>
                                    <input type="date" name="po_date" class="form-control" value="{{ date('Y-m-d') }}"
                                        required>
                                </div>
                            </div>
                        </div>

                        <hr>
                        <h5>Items</h5>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="items-table">
                                <thead>
                                    <tr>
                                        <th>Produk</th>
                                        <th>Quantity</th>
                                        <th>Satuan</th>
                                        <th>Unit Price</th>
                                        <th>Total Price</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="item-row">
                                        <td>
                                            <select name="items[0][barang_id]" class="form-control select2 product-select"
                                                data-placeholder="Pilih Produk" required>
                                                <option value=""></option>
                                                @foreach($allBarangs as $barang)
                                                    <option value="{{ $barang->id }}" data-price="{{ $barang->price }}"
                                                        data-unit="{{ $barang->satuan->satuan ?? '-' }}">
                                                        {{ $barang->nama_barang }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td>
                                            <input type="number" name="items[0][quantity]" class="form-control qty-input"
                                                min="1" required>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control unit-input" readonly disabled>
                                        </td>
                                        <td>
                                            <input type="number" name="items[0][unit_price]"
                                                class="form-control price-input" min="0" required>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control total-input" readonly>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger btn-remove-row"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-info" id="btn-add-row"><i class="fa fa-plus"></i> Tambah
                                Baris</button>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-4 offset-md-8">
                                <div class="form-group">
                                    <label>Grand Total</label>
                                    <input type="text" id="grand-total-display" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button type="submit" class="btn btn-primary">Simpan Purchase Order</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            $('.select2').select2({
                width: '100%',
                allowClear: true
            });

            let rowIndex = 1;

            function addRow(data = null) {
                let newRow = `
                                <tr class="item-row">
                                    <td>
                                        <select name="items[${rowIndex}][barang_id]" class="form-control select2 product-select" data-placeholder="Pilih Produk" required>
                                            <option value=""></option>
                                            @foreach($allBarangs as $barang)
                                                <option value="{{ $barang->id }}" data-price="{{ $barang->price }}" data-unit="{{ $barang->satuan->satuan ?? '-' }}">{{ $barang->nama_barang }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" name="items[${rowIndex}][quantity]" class="form-control qty-input" min="1" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control unit-input" readonly disabled>
                                    </td>
                                    <td>
                                        <input type="number" name="items[${rowIndex}][unit_price]" class="form-control price-input" min="0" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control total-input" readonly>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-remove-row"><i class="fa fa-trash"></i></button>
                                    </td>
                                </tr>
                            `;
                $('#items-table tbody').append(newRow);
                let $lastRow = $('#items-table tbody tr:last');
                $lastRow.find('.select2').select2({
                    width: '100%',
                    allowClear: true
                });

                if (data) {
                    $lastRow.find('.product-select').val(data.id).trigger('change');
                    $lastRow.find('.qty-input').val(data.qty).trigger('input');
                    $lastRow.find('.price-input').val(data.price).trigger('input');
                }

                rowIndex++;
            }

            $('#btn-add-row').click(function () {
                addRow();
            });

            $('.btn-add-safety').click(function () {
                let data = {
                    id: $(this).data('id'),
                    name: $(this).data('name'),
                    price: $(this).data('price'),
                    unit: $(this).data('unit'),
                    qty: $(this).data('qty')
                };

                // Check if first row is empty
                let firstRow = $('#items-table tbody tr:first');
                if ($('.item-row').length === 1 && firstRow.find('.product-select').val() === "") {
                    firstRow.find('.product-select').val(data.id).trigger('change');
                    firstRow.find('.qty-input').val(data.qty).trigger('input');
                    firstRow.find('.price-input').val(data.price).trigger('input');
                } else {
                    addRow(data);
                }

                $(this).prop('disabled', true).html('<i class="fa fa-check"></i> Added');
            });

            $(document).on('change', '.product-select', function () {
                let selected = $(this).find(':selected');
                let price = selected.data('price') || 0;
                let unit = selected.data('unit') || '-';
                let row = $(this).closest('tr');
                row.find('.price-input').val(price);
                row.find('.unit-input').val(unit);
                row.find('.qty-input').trigger('input');
            });

            $(document).on('click', '.btn-remove-row', function () {
                let row = $(this).closest('tr');
                let barangId = row.find('.product-select').val();

                if (barangId) {
                    let safetyBtn = $(`.btn-add-safety[data-id="${barangId}"]`);
                    if (safetyBtn.length) {
                        safetyBtn.prop('disabled', false).html('<i class="fa fa-plus"></i> Add to PO');
                    }
                }

                row.remove();
                calculateGrandTotal();

                if ($('.item-row').length === 0) {
                    addRow();
                }
            });

            $(document).on('input', '.qty-input, .price-input', function () {
                let row = $(this).closest('tr');
                let qty = row.find('.qty-input').val() || 0;
                let price = row.find('.price-input').val() || 0;
                let total = qty * price;
                row.find('.total-input').val(total);
                calculateGrandTotal();
            });

            function calculateGrandTotal() {
                let grandTotal = 0;
                $('.total-input').each(function () {
                    grandTotal += parseFloat($(this).val()) || 0;
                });
                $('#grand-total-display').val(new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(grandTotal));
            }

            // Initialize grand total on load
            calculateGrandTotal();
        });
    </script>
@endpush