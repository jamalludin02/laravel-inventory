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
                                                'post' => 'badge-info',
                                                'confirmed' => 'badge-primary',
                                                'processing' => 'badge-warning',
                                                'shipped' => 'badge-info',
                                                'completed' => 'badge-success',
                                                'cancelled' => 'badge-danger'
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
                                    @if(auth()->user()->role->role === 'admin_gudang' && $salesOrder->status === 'post')
                                        <th>Action</th>
                                    @endif
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
                                        @if(auth()->user()->role->role === 'admin_gudang' && $salesOrder->status === 'post')
                                            <td>
                                                <button class="btn btn-warning btn-sm btn-edit-detail" 
                                                    data-id="{{ $detail->id }}"
                                                    data-name="{{ $detail->barang->nama_barang }}"
                                                    data-qty="{{ $detail->quantity }}">
                                                    <i class="fa fa-edit"></i> Edit
                                                </button>
                                                <button class="btn btn-danger btn-sm btn-delete-detail" data-id="{{ $detail->id }}"
                                                    data-name="{{ $detail->barang->nama_barang }}">
                                                    <i class="fa fa-trash"></i> Hapus
                                                </button>
                                            </td>
                                        @endif
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="5" class="text-right">Grand Total</th>
                                    <th>Rp {{ number_format($salesOrder->total_amount, 0, ',', '.') }}</th>
                                    @if(auth()->user()->role->role === 'admin_gudang' && $salesOrder->status === 'post')
                                        <th></th>
                                    @endif
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    @if($salesOrder->histories->count() > 0)
                        <hr>
                        <h5>History Perubahan</h5>
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered">
                                <thead class="bg-light">
                                    <tr>
                                        <th>Waktu</th>
                                        <th>User</th>
                                        <th>Aksi</th>
                                        <th>Alasan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($salesOrder->histories as $history)
                                        <tr>
                                            <td>{{ $history->created_at->format('d/m/Y H:i') }}</td>
                                            <td>{{ $history->user->name }}</td>
                                            <td>{{ $history->action }}</td>
                                            <td>{{ $history->reason }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endif
                </div>
                <div class="card-footer text-right">
                    @if(auth()->user()->role->role === 'admin_sales' && $salesOrder->status === 'draft')
                        <form action="{{ route('sales-order.post', $salesOrder->id) }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-success">Post ke Gudang</button>
                        </form>
                    @endif

                    @if(auth()->user()->role->role === 'admin_gudang' && $salesOrder->status === 'post')
                        <button class="btn btn-danger btn-reject" data-id="{{ $salesOrder->id }}">Reject Dokumen</button>
                        <button class="btn btn-primary btn-verify" data-id="{{ $salesOrder->id }}">Konfirmasi &
                            Verifikasi</button>
                    @endif

                    @if(auth()->user()->role->role === 'admin_sales' || auth()->user()->role->role === 'super_admin')
                        @if($salesOrder->status === 'draft')
                            <a href="{{ route('sales-order.edit', $salesOrder->id) }}" class="btn btn-warning">Edit</a>
                            <button class="btn btn-danger btn-delete" data-id="{{ $salesOrder->id }}">Delete</button>
                        @endif
                    @endif
                </div>
            </div>
        </div>
    </div>

    <!-- Verification Modal -->
    <div class="modal fade" id="verifyModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form id="verifyForm" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Verifikasi & Konfirmasi - {{ $salesOrder->sales_order_no }}</h5>
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

    <!-- Reject Modal -->
    <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form id="rejectForm" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Reject Dokumen - {{ $salesOrder->sales_order_no }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Dokumen akan dikembalikan ke status <strong>Draft</strong> (Admin Sales).</p>
                        <div class="form-group">
                            <label>Alasan Reject</label>
                            <textarea name="reason" class="form-control" rows="3" required placeholder="Masukkan alasan penolakan dokumen..."></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-danger">Reject Dokumen</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Edit Detail Modal -->
    <div class="modal fade" id="editDetailModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Item: <span id="editItemName"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" id="editQty" class="form-control" min="1" required>
                    </div>
                    <div class="form-group">
                        <label>Alasan Perubahan</label>
                        <textarea id="editReason" class="form-control" rows="3" placeholder="Contoh: Stok tidak mencukupi, hanya tersedia 5 pcs" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-primary" id="btn-confirm-edit-detail">Simpan Perubahan</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Detail Modal -->
    <div class="modal fade" id="deleteDetailModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Hapus Item: <span id="deleteItemName"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Alasan Penghapusan</label>
                        <textarea id="deleteReason" class="form-control" rows="3"
                            placeholder="Contoh: Stok rusak, barang tidak ditemukan, dll" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-danger" id="btn-confirm-delete-detail">Hapus Item</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            // Fix for modal backdrop issue
            $('.modal').on('show.bs.modal', function() {
                $(this).appendTo('body');
            });

            let selectedDetailId = null;

            $('.btn-verify').click(function () {
                let id = $(this).data('id');
                $('#verifyForm').attr('action', `/sales-order/${id}/verify`);
                $('#verifyModal').modal('show');
            });

            $('.btn-reject').click(function () {
                let id = $(this).data('id');
                $('#rejectForm').attr('action', `/sales-order/${id}/reject`);
                $('#rejectModal').modal('show');
            });

            $('.btn-edit-detail').click(function () {
                selectedDetailId = $(this).data('id');
                $('#editItemName').text($(this).data('name'));
                $('#editQty').val($(this).data('qty'));
                $('#editReason').val('');
                $('#editDetailModal').modal('show');
            });

            $('#btn-confirm-edit-detail').click(function () {
                let qty = $('#editQty').val();
                let reason = $('#editReason').val();
                if (!qty || !reason) {
                    alert('Quantity dan Alasan harus diisi!');
                    return;
                }

                $.ajax({
                    url: `/sales-order/detail/${selectedDetailId}`,
                    type: 'PUT',
                    data: {
                        _token: '{{ csrf_token() }}',
                        quantity: qty,
                        reason: reason
                    },
                    success: function (response) {
                        $('#editDetailModal').modal('hide');
                        Swal.fire('Berhasil!', response.message, 'success').then(() => {
                            location.reload();
                        });
                    },
                    error: function (xhr) {
                        alert('Terjadi kesalahan saat mengubah item.');
                    }
                });
            });

            $('.btn-delete-detail').click(function () {
                selectedDetailId = $(this).data('id');
                $('#deleteItemName').text($(this).data('name'));
                $('#deleteReason').val('');
                $('#deleteDetailModal').modal('show');
            });

            $('#btn-confirm-delete-detail').click(function () {
                let reason = $('#deleteReason').val();
                if (!reason) {
                    alert('Alasan harus diisi!');
                    return;
                }

                $.ajax({
                    url: `/sales-order/detail/${selectedDetailId}`,
                    type: 'DELETE',
                    data: {
                        _token: '{{ csrf_token() }}',
                        reason: reason
                    },
                    success: function (response) {
                        $('#deleteDetailModal').modal('hide');
                        Swal.fire('Berhasil!', response.message, 'success').then(() => {
                            location.reload();
                        });
                    },
                    error: function (xhr) {
                        alert('Terjadi kesalahan saat menghapus item.');
                    }
                });
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