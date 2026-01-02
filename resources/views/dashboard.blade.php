@extends('layouts.app')

@section('content')
<div class="section-header">
  <h1>Dashboard</h1>
</div>

<div class="row">
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
      <div class="card card-statistic-1">
        <div class="card-icon bg-primary">
          <i class="fas fa-thin fa-cubes"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>Semua Barang</h4>
          </div>
          <div class="card-body">
            {{ $barang }}
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
      <div class="card card-statistic-1">
        <div class="card-icon bg-danger">
          <i class="fas fa-file-import"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>Barang Masuk</h4>
          </div>
          <div class="card-body">
            {{ $barangMasuk }}
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
      <div class="card card-statistic-1">
        <div class="card-icon bg-warning">
          <i class="fas fa-file-export"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>Barang Keluar</h4>
          </div>
          <div class="card-body">
            {{ $barangKeluar }}
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
      <div class="card card-statistic-1">
        <div class="card-icon bg-success">
          <i class="far fa-user"></i>
        </div>
        <div class="card-wrap">
          <div class="card-header">
            <h4>Pengguna</h4>
          </div>
          <div class="card-body">
            {{ $user }}
          </div>
        </div>
      </div>
    </div>
</div>

<div class="row">
  <div class="col-lg-6 col-md-6">
    <div class="card">
      <div class="card-header">
        <h4>Rata-rata Barang Keluar per Produk</h4>
        <div class="card-header-action">
          <select class="form-control stat-filter" data-stat="barangKeluarAvg" data-chart="barangKeluar">
            <option value="month">Bulan</option>
            <option value="week">Minggu</option>
          </select>
        </div>
      </div>
      <div class="card-body">
        <canvas id="barangKeluarAvgChart"></canvas>
      </div>
    </div>
  </div>
  <div class="col-lg-6 col-md-6">
    <div class="card">
      <div class="card-header">
        <h4>Rata-rata Barang Masuk per Produk</h4>
        <div class="card-header-action">
          <select class="form-control stat-filter" data-stat="barangMasukAvg" data-chart="barangMasuk">
            <option value="month">Bulan</option>
            <option value="week">Minggu</option>
          </select>
        </div>
      </div>
      <div class="card-body">
        <canvas id="barangMasukAvgChart"></canvas>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-lg-6 col-md-6">
    <div class="card">
      <div class="card-header">
        <h4>Rata-rata Lead Time (Hari)</h4>
        <div class="card-header-action">
          <select class="form-control stat-filter" data-stat="leadTimeAvg" data-chart="leadTime">
            <option value="month">Bulan</option>
            <option value="week">Minggu</option>
          </select>
        </div>
      </div>
      <div class="card-body">
        <canvas id="leadTimeAvgChart"></canvas>
      </div>
    </div>
  </div>
  <div class="col-lg-6 col-md-6">
    <div class="card">
      <div class="card-header">
        <h4>Rata-rata Total Amount Order</h4>
        <div class="card-header-action">
          <select class="form-control stat-filter" data-stat="totalAmountAvg" data-chart="totalAmount">
            <option value="month">Bulan</option>
            <option value="week">Minggu</option>
          </select>
        </div>
      </div>
      <div class="card-body">
        <canvas id="totalAmountAvgChart"></canvas>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-lg-6 col-md-6 col-sm-6 col-6">
    <div class="card">
      <div class="card-header">
        <h4>Grafik Barang Masuk & Barang Keluar</h4>
      </div>
      <div class="card-body">
        <canvas id="summaryChart"></canvas>
      </div>
    </div>
  </div>

  <div class="col-lg-6 col-md-6 col-sm-6 col-6">
    <div class="card">
      <div class="card-header">
        <h4>Stok Mencapai Reorder Point</h4>
      </div>
      <div class="card-body">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">No</th>
              <th scope="col">Kode Barang</th>
              <th scope="col">Nama Barang</th>
              <th scope="col">Stok</th>
              <th scope="col">ROP</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($barangMinimum as $barang)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $barang->kode_barang }}</td>
                <td>{{ $barang->nama_barang }}</td>
                <td>
                  <span class="badge {{ $barang->stok > ($barang->reorderPoint->safety_stock ?? 0) ? 'badge-warning' : 'badge-danger' }}">
                      {{ $barang->stok }}
                  </span>
                </td>
                <td>
                  <span class="badge badge-info">
                    {{ $barang->reorderPoint->reorder_point ?? 0 }}
                  </span>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
@endsection

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Existing Summary Chart
    var ctx = document.getElementById('summaryChart').getContext('2d');
    var chart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: [
          @foreach($barangMasukData as $data)
              '{{ date("F", strtotime($data->date)) }}',
          @endforeach
        ],
        datasets: [
          {
            label : 'Barang Masuk',
            data: [
                @foreach($barangMasukData as $data)
                    '{{ $data->total }}',
                @endforeach
            ],
            backgroundColor: 'blue'
          },
          {
            label : 'Barang Keluar',
            data: [
                @foreach($barangKeluarData as $data)
                    '{{ $data->total }}',
                @endforeach
            ],
            backgroundColor: 'red'
          }
        ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
            precision: 0,
            stepSize: 1,
            ticks: {
              callback: function(value) {
                if (value % 1 === 0) {
                  return value;
                }
              }
            }
          }
        }
      }
    });

    // New Dynamic Charts
    let charts = {};

    function initChart(id, label, color) {
        let ctx = document.getElementById(id).getContext('2d');
        return new Chart(ctx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: label,
                    data: [],
                    borderColor: color,
                    backgroundColor: color + '33',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { 
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return value.toLocaleString();
                            }
                        }
                    }
                }
            }
        });
    }

    function updateStat(statName, chartKey, type) {
        $.ajax({
            url: '{{ route("dashboard.stats") }}',
            data: { 
                stat: statName,
                type: type 
            },
            success: function(res) {
                let chart = charts[chartKey];
                chart.data.labels = res.map(i => i.period);
                chart.data.datasets[0].data = res.map(i => i.avg);
                chart.update();
            }
        });
    }

    $(document).ready(function() {
        charts.barangKeluar = initChart('barangKeluarAvgChart', 'Avg Qty Keluar', '#fc544b');
        charts.barangMasuk = initChart('barangMasukAvgChart', 'Avg Qty Masuk', '#6777ef');
        charts.leadTime = initChart('leadTimeAvgChart', 'Avg Lead Time', '#ffa426');
        charts.totalAmount = initChart('totalAmountAvgChart', 'Avg Amount', '#47c363');

        // Initial load for all charts
        $('.stat-filter').each(function() {
            let $this = $(this);
            updateStat($this.data('stat'), $this.data('chart'), $this.val());
        });

        $('.stat-filter').on('change', function() {
            let $this = $(this);
            updateStat($this.data('stat'), $this.data('chart'), $this.val());
        });
    });
</script>
@endpush
