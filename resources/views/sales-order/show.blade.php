@extends('layouts.app')

@section('content')
    <div class="section-header">
        <div class="section-header-back">
            <a href="{{ route('sales-order.index') }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
        <h1>Detail Sales Order: {{ $salesOrder->sales_order_no }}</h1>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <table class="table table-borderless">
                                <tr>
                                    <th width="150">Customer</th>
                                    <td>: {{ $salesOrder->customer->customer }}</td>
                                </tr>
                                <tr>
                                    <th>Tanggal Order</th>
                                    <td>: {{ $salesOrder->order_date }}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table table-borderless">
                                <tr>
                                    <th width="150">Status</th>
                                    <td>:
                                        @php
                                            $badgeClass = [
                                                'draft' => 'badge-secondary',
                                                'confirmed' => 'badge-primary',
                                                'shipped' => 'badge-info',
                                                'completed' => 'badge-success'
                                            ][$salesOrder->status];
                                        @endphp
                                        <span class="badge {{ $badgeClass }}">{{ ucfirst($salesOrder->status) }}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total Amount</th>
                                    <td>: Rp {{ number_format($salesOrder->total_amount, 0, ',', '.') }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <hr>
                    <h5>Items</h5>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Produk</th>
                                    <th>Quantity</th>
                                    <th>Satuan</th>
                                    <th>Unit Price</th>
                                    <th>Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($salesOrder->details as $index => $detail)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $detail->barang->nama_barang }}</td>
                                        <td>{{ $detail->quantity }}</td>
                                        <td>{{ $detail->barang->satuan->satuan ?? '-' }}</td>
                                        <td>Rp {{ number_format($detail->unit_price, 0, ',', '.') }}</td>
                                        <td>Rp {{ number_format($detail->total_price, 0, ',', '.') }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="5" class="text-right">Grand Total</th>
                                    <th>Rp {{ number_format($salesOrder->total_amount, 0, ',', '.') }}</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <a href="{{ route('sales-order.edit', $salesOrder->id) }}" class="btn btn-warning">Edit</a>
                    <button class="btn btn-danger btn-delete" data-id="{{ $salesOrder->id }}">Delete</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            $('.btn-delete').click(function () {
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `/sales-order/${id}`,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function (response) {
                                Swal.fire('Deleted!', response.message, 'success').then(() => {
                                    window.location.href = "{{ route('sales-order.index') }}";
                                });
                            }
                        });
                    }
                });
            });
        });
    </script>
@endpush