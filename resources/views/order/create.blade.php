@extends('layouts.app')

@section('content')
    <div class="section-header">
        <div class="section-header-back">
            <a href="{{ route('order.index') }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
        <h1>Tambah Order</h1>
    </div>

    <div class="row">
        <div class="col-12">
            <form action="{{ route('order.store') }}" method="POST">
                @csrf
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Customer</label>
                                    <select name="customer_id" class="form-control select2" required>
                                        <option value="">Pilih Customer</option>
                                        @foreach($customers as $customer)
                                            <option value="{{ $customer->id }}">{{ $customer->customer }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tanggal Order</label>
                                    <input type="date" name="order_date" class="form-control" value="{{ date('Y-m-d') }}"
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
                                                required>
                                                <option value="">Pilih Produk</option>
                                                @foreach($barangs as $barang)
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
                                                class="form-control price-input" min="0" required readonly>
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
                                    <input type="text" id="grand-total" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button type="submit" class="btn btn-primary">Simpan Order</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            $('.select2').select2({ width: '100%' });

            let rowIndex = 1;

            $('#btn-add-row').click(function () {
                let newRow = `
                                <tr class="item-row">
                                    <td>
                                        <select name="items[${rowIndex}][barang_id]" class="form-control select2 product-select" required>
                                            <option value="">Pilih Produk</option>
                                            @foreach($barangs as $barang)
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
                                        <input type="number" name="items[${rowIndex}][unit_price]" class="form-control price-input" min="0" required readonly>
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
                $('#items-table tbody tr:last .select2').select2({ width: '100%' });
                rowIndex++;
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
                if ($('.item-row').length > 1) {
                    $(this).closest('tr').remove();
                    calculateGrandTotal();
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
                $('#grand-total').val(grandTotal);
            }
        });
    </script>
@endpush
