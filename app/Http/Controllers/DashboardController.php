<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Barang;
use App\Models\BarangMasuk;
use App\Models\BarangKeluar;
use App\Models\PurchaseOrder;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $barangCount = Barang::all()->count();
        $barangMasukCount = BarangMasuk::all()->count();
        $barangKeluarCount = BarangKeluar::all()->count();
        $userCount = User::all()->count();
        $barangMasukPerBulan = BarangMasuk::selectRaw('DATE_FORMAT(tanggal_masuk, "%Y-%m") as date, SUM(jumlah_masuk) as total')
            ->groupBy('date')
            ->get()
            ->map(function ($data) {
                $data->date = date('Y-m', strtotime($data->date));
                $data->total = (int) $data->total;
                return $data;
            });
        $barangKeluarPerBulan = BarangKeluar::selectRaw('DATE_FORMAT(tanggal_keluar, "%Y-%m") as date, SUM(jumlah_keluar) as total')
            ->groupBy('date')
            ->get()
            ->map(function ($data) {
                $data->date = date('Y-m', strtotime($data->date));
                $data->total = (int) $data->total;
                return $data;
            });

        $barangMinimum = Barang::with('reorderPoint')
            ->whereHas('reorderPoint', function ($query) {
                $query->whereRaw('barangs.stok <= reorder_point.reorder_point');
            })->get();


        return view('dashboard', [
            'barang' => $barangCount,
            'barangMasuk' => $barangMasukCount,
            'barangKeluar' => $barangKeluarCount,
            'user' => $userCount,
            'barangMasukData' => $barangMasukPerBulan,
            'barangKeluarData' => $barangKeluarPerBulan,
            'barangMinimum' => $barangMinimum
        ]);
    }

    public function getStats(Request $request)
    {
        $type = $request->get('type', 'month'); // 'week' or 'month'
        $stat = $request->get('stat'); // which stat to fetch
        $format = $type === 'month' ? '%Y-%m' : '%x-%v';
        $phpFormat = $type === 'month' ? 'Y-m' : 'o-W';

        // Generate last 5 periods
        $periods = [];
        for ($i = 4; $i >= 0; $i--) {
            $periods[] = date($phpFormat, strtotime("-$i " . ($type === 'month' ? 'months' : 'weeks')));
        }

        $results = [];
        switch ($stat) {
            case 'barangKeluarAvg':
                $results = BarangKeluar::selectRaw("DATE_FORMAT(tanggal_keluar, '$format') as period, SUM(jumlah_keluar) / COUNT(DISTINCT nama_barang) as avg")
                    ->whereRaw("DATE_FORMAT(tanggal_keluar, '$format') IN ('" . implode("','", $periods) . "')")
                    ->groupBy('period')
                    ->get()
                    ->pluck('avg', 'period');
                break;
            case 'barangMasukAvg':
                $results = BarangMasuk::selectRaw("DATE_FORMAT(tanggal_masuk, '$format') as period, SUM(jumlah_masuk) / COUNT(DISTINCT nama_barang) as avg")
                    ->whereRaw("DATE_FORMAT(tanggal_masuk, '$format') IN ('" . implode("','", $periods) . "')")
                    ->groupBy('period')
                    ->get()
                    ->pluck('avg', 'period');
                break;
            case 'leadTimeAvg':
                $results = PurchaseOrder::selectRaw("DATE_FORMAT(date_received, '$format') as period, AVG(DATEDIFF(date_received, po_date) + 1) as avg")
                    ->whereNotNull('date_received')
                    ->whereRaw("DATE_FORMAT(date_received, '$format') IN ('" . implode("','", $periods) . "')")
                    ->groupBy('period')
                    ->get()
                    ->pluck('avg', 'period');
                break;
            case 'totalAmountAvg':
                $results = Order::selectRaw("DATE_FORMAT(order_date, '$format') as period, AVG(total_amount) as avg")
                    ->whereRaw("DATE_FORMAT(order_date, '$format') IN ('" . implode("','", $periods) . "')")
                    ->groupBy('period')
                    ->get()
                    ->pluck('avg', 'period');
                break;
        }

        $finalData = [];
        foreach ($periods as $p) {
            $finalData[] = [
                'period' => $p,
                'avg' => isset($results[$p]) ? round($results[$p], 2) : 0
            ];
        }

        return response()->json($finalData);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
