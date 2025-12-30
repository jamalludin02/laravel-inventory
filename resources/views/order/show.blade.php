@extends('layouts.app')

@section('content')
    <style>
        .status-steps {
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 0 10px;
        }

        .status-steps::before {
            content: '';
            position: absolute;
            top: 15px;
            left: 0;
            right: 0;
            height: 2px;
            background: #e9ecef;
            z-index: 1;
        }

        .step-item {
            position: relative;
            z-index: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
            flex: 1;
            cursor: pointer;
        }

        .step-dot {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #fff;
            border: 2px solid #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
            color: #adb5bd;
            transition: all 0.3s ease;
        }

        .step-item.active .step-dot {
            background: #6777ef;
            border-color: #6777ef;
            color: #fff;
            box-shadow: 0 0 0 3px rgba(103, 119, 239, 0.2);
        }

        .step-item.completed .step-dot {
            background: #47c363;
            border-color: #47c363;
            color: #fff;
        }

        .step-label {
            margin-top: 8px;
            font-size: 10px;
            font-weight: 600;
            text-transform: uppercase;
            color: #adb5bd;
            text-align: center;
        }

        .step-item.active .step-label {
            color: #6777ef;
        }

        .step-item.completed .step-label {
            color: #47c363;
        }

        .status-info-icon {
            cursor: pointer;
            color: #6777ef;
            margin-left: 5px;
            font-size: 14px;
            vertical-align: middle;
        }
    </style>

    <div class="section-header">
        <div class="section-header-back">
            <a href="{{ route('order.index') }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
        <h1>Detail Order: {{ $order->order_no }}</h1>
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
                                    <td>: {{ $order->customer->customer }}</td>
                                </tr>
                                <tr>
                                    <th>Tanggal Order</th>
                                    <td>: {{ $order->order_date }}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table table-borderless">
                                <tr>
                                    <th width="150">Status</th>
                                    <td>:
                                        @php
                                            $statuses = [
                                                'draft' => ['label' => 'Draft', 'color' => 'badge-secondary', 'desc' => 'Pesanan baru dibuat oleh Admin Sales dan masih bisa diedit.'],
                                                'post' => ['label' => 'Posted', 'color' => 'badge-info', 'desc' => 'Pesanan telah dikirim ke Gudang untuk verifikasi stok.'],
                                                'confirmed' => ['label' => 'Confirmed', 'color' => 'badge-primary', 'desc' => 'Stok telah dikonfirmasi tersedia oleh Admin Gudang.'],
                                                'shipped' => ['label' => 'Shipped', 'color' => 'badge-info', 'desc' => 'Barang telah dikirim ke customer.'],
                                                'completed' => ['label' => 'Completed', 'color' => 'badge-success', 'desc' => 'Transaksi selesai, barang telah diterima.'],
                                                'cancelled' => ['label' => 'Cancelled', 'color' => 'badge-danger', 'desc' => 'Pesanan dibatalkan.']
                                            ];
                                            $currentStatus = $order->status;
                                            $badgeClass = $statuses[$currentStatus]['color'] ?? 'badge-secondary';
                                            $statusLabel = $statuses[$currentStatus]['label'] ?? ucfirst($currentStatus);
                                        @endphp
                                        <span class="badge {{ $badgeClass }}">{{ $statusLabel }}</span>
                                        <i class="fas fa-question-circle status-info-icon btn-status-info"
                                            data-status="{{ $currentStatus }}"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total Amount</th>
                                    <td>: Rp {{ number_format($order->total_amount, 0, ',', '.') }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <!-- Progress Point Section -->
                    <div class="row mt-4">
                        <div class="col-12">
                            @php
                                $workflow = ['draft', 'post', 'confirmed', 'shipped', 'completed'];
                                $currentIndex = array_search($currentStatus, $workflow);
                                if ($currentStatus === 'cancelled')
                                    $currentIndex = -1;
                            @endphp

                            <div class="status-steps">
                                @foreach($workflow as $index => $step)
                                    @php
                                        $isCompleted = $currentIndex > $index;
                                        $isActive = $currentIndex === $index;
                                        $stepInfo = $statuses[$step];
                                    @endphp
                                    <div class="step-item btn-status-info {{ $isCompleted ? 'completed' : ($isActive ? 'active' : '') }}"
                                        data-status="{{ $step }}">
                                        <div class="step-dot">
                                            @if($isCompleted)
                                                <i class="fas fa-check"></i>
                                            @else
                                                {{ $index + 1 }}
                                            @endif
                                        </div>
                                        <div class="step-label">{{ $stepInfo['label'] }}</div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>

                    <div class="text-right">
                        <a href="{{ route('order.print', $order->id) }}" class="btn btn-info" target="_blank">
                            <i class="fas fa-print"></i> Print PDF
                        </a>
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
                                    @php
                                        $canEditItems = (auth()->user()->role->role === 'admin_gudang' && $order->status === 'post') ||
                                            (auth()->user()->role->role === 'staff_gudang' && $order->status === 'confirmed');
                                    @endphp
                                    @if($canEditItems)
                                        <th>Action</th>
                                    @endif
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($order->details as $index => $detail)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $detail->barang->nama_barang }}
                                            <strong>({{ $detail->barang->kode_barang }})</strong>
                                        </td>
                                        <td>{{ $detail->quantity }}</td>
                                        <td>{{ $detail->barang->satuan->satuan ?? '-' }}</td>
                                        <td>Rp {{ number_format($detail->unit_price, 0, ',', '.') }}</td>
                                        <td>Rp {{ number_format($detail->total_price, 0, ',', '.') }}</td>
                                        @if($canEditItems)
                                            <td>
                                                <button class="btn btn-warning btn-sm btn-edit-detail" data-id="{{ $detail->id }}"
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
                                    <th>Rp {{ number_format($order->total_amount, 0, ',', '.') }}</th>
                                    @if($canEditItems)
                                        <th></th>
                                    @endif
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    @if($order->histories->count() > 0)
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
                                    @foreach($order->histories as $history)
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
                    @if(auth()->user()->role->role === 'admin_sales' && $order->status === 'draft')
                        <form action="{{ route('order.post', $order->id) }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-success">Post ke Gudang</button>
                        </form>
                    @endif

                    @if(auth()->user()->role->role === 'admin_gudang' && $order->status === 'post')
                        <button class="btn btn-danger btn-reject" data-id="{{ $order->id }}">Reject Dokumen</button>
                        <form action="{{ route('order.verify', $order->id) }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-primary">Konfirmasi & Verifikasi</button>
                        </form>
                    @endif
                    @if((auth()->user()->role->role === 'staff_gudang' || auth()->user()->role->role === 'super_admin') && $order->status === 'confirmed')
                        <button class="btn btn-success btn-ship" data-id="{{ $order->id }}">Kirim Barang (Ship)</button>
                    @endif

                    @if((auth()->user()->role->role === 'admin_sales' || auth()->user()->role->role === 'super_admin') && $order->status === 'shipped')
                        <button class="btn btn-primary btn-complete" data-id="{{ $order->id }}">Selesaikan Pesanan
                            (Complete)</button>
                    @endif

                    @if(auth()->user()->role->role === 'admin_sales' || auth()->user()->role->role === 'super_admin')
                        @if($order->status === 'draft')
                            <a href="{{ route('order.edit', $order->id) }}" class="btn btn-warning">Edit</a>
                            <button class="btn btn-danger btn-delete" data-id="{{ $order->id }}">Delete</button>
                        @endif
                    @endif
                </div>
            </div>
        </div>
    </div>

    <!-- Status Info Modal -->
    <div class="modal fade" id="statusInfoModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Informasi Status: <span id="infoStatusLabel"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="infoStatusDesc"></p>
                </div>
                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-primary" data-dismiss="modal">Mengerti</button> -->
                </div>
            </div>
        </div>
    </div>

    <!-- Ship Modal -->
    <div class="modal fade" id="shipModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form id="shipForm" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Konfirmasi Pengiriman - {{ $order->order_no }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Apakah Anda yakin pesanan ini sudah siap dan akan dikirim sekarang?</p>
                        <p class="text-warning"><small>* Stok barang akan otomatis berkurang setelah dikirim.</small></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-success">Ya, Kirim Sekarang</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Complete Modal -->
    <div class="modal fade" id="completeModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form id="completeForm" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Selesaikan Pesanan - {{ $order->order_no }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Apakah Anda yakin pesanan ini sudah diterima oleh customer dan transaksi selesai?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary">Ya, Selesai</button>
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
                        <h5 class="modal-title">Reject Dokumen - {{ $order->order_no }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Dokumen akan dikembalikan ke status <strong>Draft</strong> (Admin Sales).</p>
                        <div class="form-group">
                            <label>Alasan Reject</label>
                            <textarea name="reason" class="form-control" rows="3" required
                                placeholder="Masukkan alasan penolakan dokumen..."></textarea>
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
                        <textarea id="editReason" class="form-control" rows="3"
                            placeholder="Contoh: Stok tidak mencukupi, hanya tersedia 5 pcs" required></textarea>
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
            $('.modal').on('show.bs.modal', function () {
                $(this).appendTo('body');
            });

            const statusDescriptions = @json($statuses);

            $('.btn-status-info').click(function () {
                const status = $(this).data('status');
                const info = statusDescriptions[status];

                if (info) {
                    $('#infoStatusLabel').text(info.label);
                    $('#infoStatusDesc').text(info.desc);
                    $('#statusInfoModal').modal('show');
                }
            });

            let selectedDetailId = null;

            $('.btn-ship').click(function () {
                let id = $(this).data('id');
                $('#shipForm').attr('action', "{{ url('order') }}/" + id + "/shipped");
                $('#shipModal').modal('show');
            });

            $('.btn-complete').click(function () {
                let id = $(this).data('id');
                $('#completeForm').attr('action', "{{ url('order') }}/" + id + "/completed");
                $('#completeModal').modal('show');
            });

            $('.btn-reject').click(function () {
                let id = $(this).data('id');
                $('#rejectForm').attr('action', "{{ url('order') }}/" + id + "/reject");
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
                    url: "{{ url('order/detail') }}/" + selectedDetailId,
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
                    url: "{{ url('order/detail') }}/" + selectedDetailId,
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
                            url: "{{ url('order') }}/" + id,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function (response) {
                                Swal.fire('Deleted!', response.message, 'success').then(() => {
                                    window.location.href = "{{ route('order.index') }}";
                                });
                            }
                        });
                    }
                });
            });
        });
    </script>
@endpush