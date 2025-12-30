<?php

namespace App\Http\Controllers;

use App\Models\Jenis;
use App\Models\Barang;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Satuan;
use Illuminate\Contracts\Cache\Store;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;



class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('barang.index', [
            'barangs' => Barang::all(),
            'jenis_barangs' => Jenis::all(),
            'satuans' => Satuan::all()
        ]);
    }

    public function getDataBarang()
    {
        $barangs = Barang::with('satuan')->get();

        return response()->json([
            'success' => true,
            'data' => $barangs
        ]);
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('barang.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama_barang' => 'required',
            'deskripsi' => 'required',
            'price' => 'required|numeric|min:0',
            'jenis_id' => 'required',
            'satuan_id' => 'required'
        ], [
            'nama_barang.required' => 'Form Nama Barang Wajib Di Isi !',
            'deskripsi.required' => 'Form Deskripsi Wajib Di Isi !',
            'price.required' => 'Form Harga Wajib Di Isi !',
            'price.numeric' => 'Gunakan Angka Untuk Mengisi Form Ini !',
            'jenis_id.required' => 'Pilih Jenis Barang !',
            'satuan_id.required' => 'Pilih Satuan Barang !'
        ]);


        $kode_barang = 'BRG-' . str_pad(rand(1, 99999), 5, '0', STR_PAD_LEFT);
        $request->merge([
            'kode_barang' => $kode_barang,
            'user_id' => auth()->user()->id,
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $barang = Barang::create([
            'nama_barang' => $request->nama_barang,
            'deskripsi' => $request->deskripsi,
            'user_id' => $request->user_id,
            'kode_barang' => $request->kode_barang,
            'price' => $request->price,
            'jenis_id' => $request->jenis_id,
            'satuan_id' => $request->satuan_id
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Disimpan !',
            'data' => $barang
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Barang $barang)
    {
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Barang',
            'data' => $barang
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Barang $barang)
    {
        return response()->json([
            'success' => true,
            'message' => 'Edit Data Barang',
            'data' => $barang
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Barang $barang)
    {
        $validator = Validator::make($request->all(), [
            'nama_barang' => 'required',
            'deskripsi' => 'required',
            'price' => 'required|numeric|min:0',
            'jenis_id' => 'required',
            'satuan_id' => 'required'
        ], [
            'nama_barang.required' => 'Form Nama Barang Wajib Di Isi !',
            'deskripsi.required' => 'Form Deskripsi Wajib Di Isi !',
            'price.required' => 'Form Harga Wajib Di Isi !',
            'price.numeric' => 'Gunakan Angka Untuk Mengisi Form Ini !',
            'jenis_id.required' => 'Pilih Jenis Barang !',
            'satuan_id.required' => 'Pilih Satuan Barang !'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $barang->update([
            'nama_barang' => $request->nama_barang,
            'price' => $request->price,
            'deskripsi' => $request->deskripsi,
            'user_id' => auth()->user()->id,
            'jenis_id' => $request->jenis_id,
            'satuan_id' => $request->satuan_id
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Terupdate',
            'data' => $barang
        ]);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Barang $barang)
    {
        Barang::destroy($barang->id);

        return response()->json([
            'success' => true,
            'message' => 'Data Barang Berhasil Dihapus!'
        ]);
    }
}
