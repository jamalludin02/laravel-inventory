@extends('layouts.app')

@section('content')
    <div class="section-header">
        <h1>Purchase Order</h1>
        <div class="ml-auto">
            @if(auth()->user()->role->role === 'admin_gudang' || auth()->user()->role->role === 'super_admin')
                <a href="{{ route('purchase-order.create') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah
                    Purchase Order</a>
            @endif
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped" id="table-po">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>No. PO</th>
                                    <th>Supplier</th>
                                    <th>Tanggal PO</th>
                                    <th>Total Amount</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($purchaseOrders as $index => $po)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $po->po_no }}</td>
                                        <td>{{ $po->supplier->supplier }}</td>
                                        <td>{{ $po->po_date }}</td>
                                        <td>Rp {{ number_format($po->total_amount, 0, ',', '.') }}</td>
                                        <td>
                                            @php
                                                $badgeClass = [
                                                    'draft' => 'badge-secondary',
                                                    'post' => 'badge-info',
                                                    'received' => 'badge-success',
                                                ][$po->status];
                                            @endphp
                                            <span class="badge {{ $badgeClass }}">{{ ucfirst($po->status) }}</span>
                                        </td>
                                        <td>
                                            <a href="{{ route('purchase-order.show', $po->id) }}" class="btn btn-info btn-sm"
                                                title="Detail"><i class="fa fa-eye"></i></a>

                                            @if(auth()->user()->role->role === 'admin_gudang' || auth()->user()->role->role === 'super_admin')
                                                @if ($po->status === 'draft')
                                                    <form action="{{ route('purchase-order.post', $po->id) }}" method="POST"
                                                        class="d-inline">
                                                        @csrf
                                                        <button type="submit" class="btn btn-success btn-sm"
                                                            title="Post to Warehouse"><i class="fa fa-paper-plane"></i></button>
                                                    </form>
                                                    <a href="{{ route('purchase-order.edit', $po->id) }}" class="btn btn-warning btn-sm"
                                                        title="Edit"><i class="fa fa-edit"></i></a>
                                                    <button class="btn btn-danger btn-sm btn-delete" data-id="{{ $po->id }}"
                                                        title="Hapus"><i class="fa fa-trash"></i></button>
                                                @endif
                                            @endif

                                            @if(auth()->user()->role->role === 'staff_gudang' || auth()->user()->role->role === 'super_admin')
                                                @if ($po->status === 'post')
                                                    <form action="{{ route('purchase-order.received', $po->id) }}" method="POST"
                                                        class="d-inline">
                                                        @csrf
                                                        <button type="submit" class="btn btn-primary btn-sm" title="Receive Goods"><i
                                                                class="fa fa-download"></i> Receive</button>
                                                    </form>
                                                @endif
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            $('#table-po').DataTable();

            $('.btn-delete').click(function () {
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Apakah Anda yakin?',
                    text: "Data yang dihapus tidak dapat dikembalikan!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, hapus!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `/purchase-order/${id}`,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function (response) {
                                Swal.fire('Berhasil!', response.message, 'success').then(() => {
                                    location.reload();
                                });
                            },
                            error: function (xhr) {
                                Swal.fire('Gagal!', xhr.responseJSON.message, 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endpush