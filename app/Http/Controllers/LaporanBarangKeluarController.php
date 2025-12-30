<?php

namespace App\Http\Controllers;

use Dompdf\Dompdf;
use App\Models\Customer;
use App\Models\BarangKeluar;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LaporanBarangKeluarController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('laporan-barang-keluar.index');
    }

    /**
     * Get Data 
     */
    public function getData(Request $request)
    {
        $tanggalMulai = $request->input('tanggal_mulai');
        $tanggalSelesai = $request->input('tanggal_selesai');

        $query = BarangKeluar::with('customer');

        if ($tanggalMulai && $tanggalSelesai) {
            $query->whereBetween('tanggal_keluar', [$tanggalMulai, $tanggalSelesai]);
        } else {
            $query->orderBy('tanggal_keluar', 'desc');
        }

        $data = $query->get();

        return response()->json($data);
    }

    /**
     * Print DomPDF
     */
    public function printBarangKeluar(Request $request)
    {
        $tanggalMulai = $request->input('tanggal_mulai');
        $tanggalSelesai = $request->input('tanggal_selesai');

        $query = BarangKeluar::with('customer');

        if ($tanggalMulai && $tanggalSelesai) {
            $query->whereBetween('tanggal_keluar', [$tanggalMulai, $tanggalSelesai]);
        }

        $data = $query->get();

        //Generate PDF
        $dompdf = new Dompdf();
        $html = view('/laporan-barang-keluar/print-barang-keluar', compact('data', 'tanggalMulai', 'tanggalSelesai'))->render();
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'landscape');
        $dompdf->render();
        $dompdf->stream('print-barang-keluar.pdf', ['Attachment' => false]);
    }

    /**
     * Get Customer
     */
    public function getcustomer()
    {
        $customer = Customer::all();
        return response()->json($customer);
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
