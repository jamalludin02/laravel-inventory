@extends('layouts.app')

@section('content')
    <div class="section-header">
        <h1>Sales Order</h1>
        <div class="ml-auto">
            @if(auth()->user()->role->role === 'admin_sales' || auth()->user()->role->role === 'super_admin')
                <a href="{{ route('sales-order.create') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah Sales
                    Order</a>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#importModal"><i
                        class="fa fa-file-import"></i> Import Excel</button>
            @endif
            <a href="{{ route('sales-order.download-template') }}" class="btn btn-info"><i class="fa fa-download"></i>
                Download Template</a>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4>Filter</h4>
                </div>
                <div class="card-body">
                    <form action="{{ route('sales-order.export') }}" method="GET" class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Start Date</label>
                                <input type="date" name="start_date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>End Date</label>
                                <input type="date" name="end_date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-control select2">
                                    <option value="">All Status</option>
                                    <option value="draft">Draft (Sales Admin)</option>
                                    <option value="post">Posted (Warehouse Check)</option>
                                    <option value="confirmed">Confirmed (Verified)</option>
                                    <option value="processing">Processing (Packing)</option>
                                    <option value="shipped">Shipped</option>
                                    <option value="completed">Completed</option>
                                    <option value="cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Customer</label>
                                <select name="customer_id" class="form-control select2">
                                    <option value="">All Customer</option>
                                    @foreach($customers as $customer)
                                        <option value="{{ $customer->id }}">{{ $customer->customer }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <button type="submit" class="btn btn-success btn-block"><i class="fa fa-file-excel"></i>
                                    Export Excel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped" id="table-so">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>No. Sales Order</th>
                                    <th>Customer</th>
                                    <th>Tanggal Order</th>
                                    <th>Total Amount</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($salesOrders as $index => $so)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $so->sales_order_no }}</td>
                                        <td>{{ $so->customer->customer }}</td>
                                        <td>{{ $so->order_date }}</td>
                                        <td>Rp {{ number_format($so->total_amount, 0, ',', '.') }}</td>
                                        <td>
                                            @php
                                                $badgeClass = [
                                                    'draft' => 'badge-secondary',
                                                    'post' => 'badge-info',
                                                    'confirmed' => 'badge-primary',
                                                    'processing' => 'badge-warning',
                                                    'shipped' => 'badge-info',
                                                    'completed' => 'badge-success',
                                                    'cancelled' => 'badge-danger'
                                                ][$so->status];
                                            @endphp
                                            <span class="badge {{ $badgeClass }}">{{ ucfirst($so->status) }}</span>
                                        </td>
                                        <td>
                                            <a href="{{ route('sales-order.show', $so->id) }}" class="btn btn-info btn-sm"
                                                title="Detail"><i class="fa fa-eye"></i></a>

                                            @if(auth()->user()->role->role === 'admin_sales' && $so->status === 'draft')
                                                <form action="{{ route('sales-order.post', $so->id) }}" method="POST"
                                                    class="d-inline">
                                                    @csrf
                                                    <button type="submit" class="btn btn-success btn-sm"
                                                        title="Post to Warehouse"><i class="fa fa-paper-plane"></i></button>
                                                </form>
                                            @endif

                                            @if(auth()->user()->role->role === 'admin_gudang' && $so->status === 'post')
                                                <button class="btn btn-primary btn-sm btn-verify" data-id="{{ $so->id }}"
                                                    data-no="{{ $so->sales_order_no }}" title="Verifikasi & Konfirmasi"><i
                                                        class="fa fa-check-circle"></i></button>
                                            @endif

                                            @if(auth()->user()->role->role === 'admin_sales' || auth()->user()->role->role === 'super_admin')
                                                @if($so->status === 'draft')
                                                    <a href="{{ route('sales-order.edit', $so->id) }}" class="btn btn-warning btn-sm"
                                                        title="Edit"><i class="fa fa-edit"></i></a>
                                                    <button class="btn btn-danger btn-sm btn-delete" data-id="{{ $so->id }}"
                                                        title="Hapus"><i class="fa fa-trash"></i></button>
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

    <!-- Import Modal -->
    <div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="{{ route('sales-order.import') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Import Sales Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>File Excel (.xlsx, .xls)</label>
                            <input type="file" name="file" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Import</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Verification Modal -->
    <div class="modal fade" id="verifyModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form id="verifyForm" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Verifikasi & Konfirmasi - <span id="verifySoNo"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Konfirmasi ketersediaan stok untuk pesanan ini.</p>
                        <div class="form-group">
                            <label>Status Konfirmasi</label>
                            <select name="status" class="form-control" required>
                                <option value="confirmed">Konfirmasi (Stok Tersedia)</option>
                                <option value="cancelled">Batalkan (Stok Tidak Tersedia)</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-primary">Simpan Konfirmasi</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            // Fix for modal backdrop issue
            $('.modal').on('show.bs.modal', function () {
                $(this).appendTo('body');
            });

            $('#table-so').DataTable();
            $('.select2').select2({ width: '100%' });

            $('.btn-verify').click(function () {
                let id = $(this).data('id');
                let no = $(this).data('no');
                $('#verifySoNo').text(no);
                $('#verifyForm').attr('action', `/sales-order/${id}/verify`);
                $('#verifyModal').modal('show');
            });

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
                                    location.reload();
                                });
                            }
                        });
                    }
                });
            });
        });
    </script>
@endpush