@extends('layouts.app')

@section('content')
    <div class="section-header">
        <div class="section-header-back">
            <a href="{{ route('purchase-order.index') }}" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
        <h1>Detail Purchase Order: {{ $purchaseOrder->po_no }}</h1>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <table class="table table-borderless">
                                <tr>
                                    <th width="150">Supplier</th>
                                    <td>: {{ $purchaseOrder->supplier->supplier }}</td>
                                </tr>
                                <tr>
                                    <th>Tanggal PO</th>
                                    <td>: {{ $purchaseOrder->po_date }}</td>
                                </tr>
                                <tr>
                                    <th>Dibuat Oleh</th>
                                    <td>: {{ $purchaseOrder->creator->name }}</td>
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
                                                'draft' => ['label' => 'Draft', 'color' => 'badge-secondary'],
                                                'post' => ['label' => 'Posted', 'color' => 'badge-info'],
                                                'received' => ['label' => 'Received', 'color' => 'badge-success'],
                                            ];
                                            $currentStatus = $purchaseOrder->status;
                                            $badgeClass = $statuses[$currentStatus]['color'] ?? 'badge-secondary';
                                            $statusLabel = $statuses[$currentStatus]['label'] ?? ucfirst($currentStatus);
                                        @endphp
                                        <span class="badge {{ $badgeClass }}">{{ $statusLabel }}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Total Amount</th>
                                    <td>: Rp {{ number_format($purchaseOrder->total_amount, 0, ',', '.') }}</td>
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
                                @foreach($purchaseOrder->details as $index => $detail)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $detail->barang->nama_barang }} ({{ $detail->barang->kode_barang }})</td>
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
                                    <th>Rp {{ number_format($purchaseOrder->total_amount, 0, ',', '.') }}</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    @if($purchaseOrder->histories->count() > 0)
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
                                    @foreach($purchaseOrder->histories as $history)
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
                    @if(auth()->user()->role->role === 'admin_gudang' && $purchaseOrder->status === 'draft')
                        <form action="{{ route('purchase-order.post', $purchaseOrder->id) }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-success">Post ke Warehouse</button>
                        </form>
                        <a href="{{ route('purchase-order.edit', $purchaseOrder->id) }}" class="btn btn-warning">Edit</a>
                    @endif

                    @if(auth()->user()->role->role === 'staff_gudang' && $purchaseOrder->status === 'post')
                        <a href="{{ route('purchase-order.process-receipt', $purchaseOrder->id) }}"
                            class="btn btn-primary">Proses Penerimaan Barang</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection