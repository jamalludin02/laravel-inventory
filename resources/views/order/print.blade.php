<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Order - {{ $order->order_no }}</title>
    <style>
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            color: #333;
            line-height: 1.5;
            font-size: 12px;
        }

        .container {
            width: 100%;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }

        .header h1 {
            margin: 0;
            text-transform: uppercase;
        }

        .info-table {
            width: 100%;
            margin-bottom: 20px;
        }

        .info-table td {
            vertical-align: top;
        }

        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .items-table th,
        .items-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .items-table th {
            background-color: #f2f2f2;
        }

        .text-right {
            text-align: right;
        }

        .footer {
            margin-top: 50px;
        }

        .signature-box {
            width: 200px;
            text-align: center;
            float: right;
        }

        .signature-space {
            height: 80px;
        }

        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1>Order</h1>
            <p>No: {{ $order->order_no }}</p>
        </div>

        <table class="info-table">
            <tr>
                <td width="50%">
                    <strong>Customer:</strong><br>
                    {{ $order->customer->customer }}<br>
                    {{ $order->customer->alamat ?? '-' }}<br>
                    {{ $order->customer->telepon ?? '-' }}
                </td>
                <td width="50%" class="text-right">
                    <strong>Tanggal Order:</strong> {{ date('d/m/Y', strtotime($order->order_date)) }}<br>
                    <strong>Status:</strong> {{ ucfirst($order->status) }}
                </td>
            </tr>
        </table>

        <table class="items-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Produk</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                @foreach($order->details as $index => $detail)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $detail->barang->nama_barang }} ({{ $detail->barang->kode_barang }})</td>
                        <td>{{ $detail->quantity }} {{ $detail->barang->satuan->satuan ?? '' }}</td>
                        <td>Rp {{ number_format($detail->unit_price, 0, ',', '.') }}</td>
                        <td>Rp {{ number_format($detail->total_price, 0, ',', '.') }}</td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="4" class="text-right">Grand Total</th>
                    <th>Rp {{ number_format($order->total_amount, 0, ',', '.') }}</th>
                </tr>
            </tfoot>
        </table>

        <div class="footer clearfix">
            <div class="signature-box">
                <p>Hormat Kami,</p>
                <div class="signature-space"></div>
                <p>____________________</p>
                <p>( Admin Sales )</p>
            </div>
        </div>
    </div>
</body>

</html>