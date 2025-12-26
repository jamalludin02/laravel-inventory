<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ManajemenUserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('data-pengguna.index', [
            'penggunas' => User::all(),
            'roles' => Role::all()
        ]);
    }

    public function getDataPengguna()
    {
        $penggunas = User::with('role')->get();

        return response()->json([
            'success' => true,
            'data' => $penggunas
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('data-pengguna.create', [
            'penggunas' => User::all(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'username' => 'required',
            'password' => 'required|min:4',
            'role_id' => 'required'
        ], [
            'name.required' => 'Form Nama Wajib Di isi !',
            'username.required' => 'Form Username Wajib Di isi !',
            'password.required' => 'Form Password Wajib Di isi !',
            'password.min' => 'Password Minimal 4 Huruf/Angka/Karakter !',
            'role_id.required' => 'Tentukan Role/Hak Akses !',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $pengguna = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role_id' => $request->role_id
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Tersimpan',
            'data' => $pengguna
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $pengguna = User::find($id);
        return response()->json([
            'success' => true,
            'message' => 'Edit Data Pengguna',
            'data' => $pengguna
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $pengguna = User::find($id);

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'username' => 'required',
            'role_id' => 'required'
        ], [
            'name.required' => 'Form Nama Wajib Di isi !',
            'username.required' => 'Form Username Wajib Di isi !',
            'role_id.required' => 'Tentukan Role/Hak Akses !',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $userData = [
            'name' => $request->name,
            'username' => $request->username,
            'role_id' => $request->role_id
        ];

        // Cek apakah password diubah atau tidak
        if (!empty($request->password)) {
            $validatorPassword = Validator::make($request->all(), [
                'password' => 'min:4'
            ], [
                'password.min' => 'Password minimal 4 Huruf/Angka/Karakter !'
            ]);

            if ($validatorPassword->fails()) {
                return response()->json($validatorPassword->errors(), 422);
            }

            $userData['password'] = Hash::make($request->password);
        }

        $pengguna->update($userData);

        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Terupdate',
            'data' => $pengguna
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        User::find($id)->delete();
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!'
        ]);
    }

    /**
     * Get Role
     */
    public function getRole()
    {
        $roles = Role::all();

        return response()->json($roles);
    }

    /**
     * Switch User
     */
    public function switchUser($id)
    {
        $originalId = auth()->id();
        $user = User::findOrFail($id);

        // Simpan ID original ke session
        session(['switched_from' => $originalId]);

        auth()->login($user);
        return redirect('/dashboard')->with('success', 'Berhasil pindah ke user ' . $user->name);
    }

    /**
     * Switch Back
     */
    public function switchBack()
    {
        $originalId = session('switched_from');
        if ($originalId) {
            $user = User::findOrFail($originalId);
            auth()->login($user);
            session()->forget('switched_from');
            return redirect('/data-pengguna')->with('success', 'Kembali ke Super Admin');
        }
        return redirect('/dashboard');
    }
}
