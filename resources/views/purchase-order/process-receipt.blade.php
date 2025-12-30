@extends('layouts.app')

@section('content')
    <div class="section-header">
        <div class="section-header-back">
            <a href="{{ route('purchase-order.show', $purchaseOrder->id) }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
        <h1>Proses Penerimaan: {{ $purchaseOrder->po_no }}</h1>
    </div>

    <div class="row">
        <div class="col-12">
            <form action="{{ route('purchase-order.store-receipt', $purchaseOrder->id) }}" method="POST">
                @csrf
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-sm table-borderless">
                                    <tr>
                                        <th width="150">Supplier</th>
                                        <td>: {{ $purchaseOrder->supplier->supplier }}</td>
                                    </tr>
                                    <tr>
                                        <th>Tanggal PO</th>
                                        <td>: {{ $purchaseOrder->po_date }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <hr>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> Silakan sesuaikan jumlah barang yang benar-benar diterima. 
                            <br>Jika ada perbedaan jumlah, <strong>wajib</strong> mengisi alasan pada kolom yang tersedia.
                        </div>

                        <h5>Items to Receive</h5>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Produk</th>
                                        <th width="100">Qty Pesan</th>
                                        <th width="120">Qty Terima</th>
                                        <th>Satuan</th>
                                        <th width="250">Alasan Perubahan (Jika Qty Berbeda)</th>
                                        <th>Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($purchaseOrder->details as $index => $detail)
                                        <tr class="item-row">
                                            <td>
                                                <input type="hidden" name="items[{{ $index }}][id]" value="{{ $detail->id }}">
                                                <input type="hidden" class="original-qty" value="{{ $detail->quantity }}">
                                                {{ $detail->barang->nama_barang }}
                                            </td>
                                            <td class="text-center">{{ $detail->quantity }}</td>
                                            <td>
                                                <input type="number" name="items[{{ $index }}][quantity]" 
                                                    class="form-control qty-input" 
                                                    value="{{ $detail->quantity }}" 
                                                    min="0" 
                                                    max="{{ $detail->quantity }}" 
                                                    data-price="{{ $detail->unit_price }}"
                                                    required>
                                            </td>
                                            <td>{{ $detail->barang->satuan->satuan ?? '-' }}</td>
                                            <td>
                                                <textarea name="items[{{ $index }}][reason]" 
                                                    class="form-control reason-input" 
                                                    rows="1" 
                                                    placeholder="Alasan..."
                                                    style="height: 38px; min-height: 38px;"></textarea>
                                            </td>
                                            <td class="total-price-display">Rp {{ number_format($detail->total_price, 0, ',', '.') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5" class="text-right">Grand Total Baru</th>
                                        <th id="grand-total-display">Rp {{ number_format($purchaseOrder->total_amount, 0, ',', '.') }}</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button type="submit" class="btn btn-primary btn-lg" id="btn-submit">Konfirmasi & Simpan Penerimaan</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            function formatRupiah(number) {
                return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR', minimumFractionDigits: 0 }).format(number);
            }

            function checkReasons() {
                let allValid = true;
                $('.item-row').each(function() {
                    let row = $(this);
                    let originalQty = parseFloat(row.find('.original-qty').val());
                    let currentQty = parseFloat(row.find('.qty-input').val()) || 0;
                    let reasonInput = row.find('.reason-input');

                    if (currentQty !== originalQty) {
                        reasonInput.prop('required', true);
                        if (reasonInput.val().trim() === "") {
                            reasonInput.addClass('is-invalid');
                            allValid = false;
                        } else {
                            reasonInput.removeClass('is-invalid');
                        }
                    } else {
                        reasonInput.prop('required', false);
                        reasonInput.removeClass('is-invalid');
                    }
                });
                return allValid;
            }

            $('.qty-input, .reason-input').on('input change', function() {
                let row = $(this).closest('tr');
                let qty = row.find('.qty-input').val() || 0;
                let price = row.find('.qty-input').data('price');
                let total = qty * price;
                
                row.find('.total-price-display').text(formatRupiah(total));
                
                calculateGrandTotal();
                checkReasons();
            });

            function calculateGrandTotal() {
                let grandTotal = 0;
                $('.qty-input').each(function() {
                    let qty = $(this).val() || 0;
                    let price = $(this).data('price');
                    grandTotal += (qty * price);
                });
                $('#grand-total-display').text(formatRupiah(grandTotal));
            }

            $('form').on('submit', function(e) {
                if (!checkReasons()) {
                    e.preventDefault();
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Silakan isi alasan untuk setiap perubahan jumlah barang!',
                    });
                }
            });
        });
    </script>
@endpush