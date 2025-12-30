<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1,
        p {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            text-align: center;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .text-danger {
            color: #dc3545;
            font-weight: bold;
        }

        .text-warning {
            color: #e67e22;
            font-weight: bold;
        }

        .footer {
            position: fixed;
            bottom: 20px;
            right: 20px;
            font-size: 12px;
        }
    </style>
</head>

<body>
    <h1>Laporan Stok</h1>
    <p>Keterangan : {{ $selectedOption }}</p>

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Stok</th>
                <th>Lead Time</th>
                <th>Safety Stock</th>
                <th>Reorder Point</th>
            </tr>
        </thead>
        <tbody>
            @foreach($barangs as $index => $barang)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $barang->kode_barang }}</td>
                    <td style="text-align: left;">{{ $barang->nama_barang }}</td>
                    <td
                        class="{{ $barang->stok < $barang->safety_stock ? 'text-danger' : ($barang->stok < $barang->reorder_point ? 'text-warning' : '') }}">
                        {{ $barang->stok}} {{ $barang->satuan->satuan ?? '' }}
                    </td>
                    <td>{{ $barang->lead_time_days }} days</td>
                    <td>{{ $barang->safety_stock }} {{ $barang->satuan->satuan ?? '' }}</td>
                    <td>{{ $barang->reorder_point }} {{ $barang->satuan->satuan ?? '' }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <div class="footer">
        Dicetak oleh: {{ auth()->user()->name }}<br>
        Tanggal: {{ date('d-m-Y') }}
    </div>
</body>

</html>