<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaksi;

class TransaksiController extends Controller
{
    public function index()
    {
        // $data = Transaksi::get();
        $data = Transaksi::join('users', 'transaksi.id_user', '=', 'users.id')
            ->get(['transaksi.*', 'users.name as nama_customer']);


        $output = array(
            'error' => false,
            'msg' => 'Data Berhasil Ditampilkan',
            'data' => $data
        );
        return $output;
    }

    public function get_by_id_user_cust($id)
    {
        // var_dump(Paket::find($id));
        // var_dump(Paket::where('id_paket', $id)->first()); 
        // die;

        return response()->json(['error' => false, 'data' => Paket::find($id)]);

        // return response()->json(['error' => false, 'data' => Paket::where('status', $id)->get()]);
    }

    public function get_by_id_paket($id)
    {
        // var_dump(Paket::find($id));
        // var_dump(Paket::where('id_paket', $id)->first()); 
        // die;

        return response()->json(['error' => false, 'data' => Paket::find($id)]);

        // return response()->json(['error' => false, 'data' => Paket::where('status', $id)->get()]);

    }

    public function get_by_id_user_admin($id)
    {
        // var_dump(Paket::find($id));
        // var_dump(Paket::where('id_paket', $id)->first()); 
        // die;

        return response()->json(['error' => false, 'data' => Paket::find($id)]);

        // return response()->json(['error' => false, 'data' => Paket::where('status', $id)->get()]);

    }

    public function create(Request $request)
    {
        $request->validate([
            'id_user' => 'required',
            'nama_paket' => 'required',
            'kecepatan' => 'required',
            'harga' => 'required',
            'disc' => 'required',
            'status' => 'required',
        ]);

        $create =  Paket::create($request->all());
        if ($create) {
            return response()->json(['error' => false, 'msg' => 'insert data successfully']);
        } else {
            return response()->json(['error' => true, 'msg' => 'insert data unsuccessfully']);
        }
        // return response()->json(['mahasiswa' => Paket::all()]);
    }

    // public function update(Request $request)
    // {
    //     // dd($request->all());
    //     $request->validate([
    //         'id_user' => 'required',
    //         'nama_paket' => 'required',
    //         'kecepatan' => 'required',
    //         'harga' => 'required',
    //         'disc' => 'required',
    //         'status' => 'required',
    //     ]);
    //     $update = Paket::where('id_paket', $request->id_paket)->update($request->all());
    //     if ($update) {
    //         return response()->json(['error' => false, 'msg' => 'update data successfully']);
    //     } else {
    //         return response()->json(['error' => true, 'msg' => 'update data unsuccessfully']);
    //     }
    // }
}
