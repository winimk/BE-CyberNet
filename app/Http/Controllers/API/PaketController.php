<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Paket;

class PaketController extends Controller
{
    public function index()
    {
        $data = Paket::get();

        $output = array(
            'error' => false,
            'msg' => 'Data Berhasil Ditampilkan',
            'data' => $data
        );
        return $output;
    }

    public function get_by_id($id)
    {
        // var_dump(Paket::find($id));
        // var_dump(Paket::where('id_paket', $id)->first()); 
        // die;

        return response()->json(['error' => false, 'data' => Paket::find($id)]);
    }

    public function get_by_status($id)
    {
        return response()->json(['error' => false, 'data' => Paket::where('status', $id)->get()]);
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

    public function update(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'id_user' => 'required',
            'nama_paket' => 'required',
            'kecepatan' => 'required',
            'harga' => 'required',
            'disc' => 'required',
            'status' => 'required',
        ]);
        $update = Paket::where('id_paket', $request->id_paket)->update($request->all());
        if ($update) {
            return response()->json(['error' => false, 'msg' => 'update data successfully']);
        } else {
            return response()->json(['error' => true, 'msg' => 'update data unsuccessfully']);
        }
    }

    public function destroy($id)
    {
        $del = Paket::where('id_paket', $id)->delete();
        if ($del) {
            return response()->json(['error' => false, 'msg' => 'delete data successfully']);
        } else {
            return response()->json(['error' => true, 'msg' => 'delete data successfully']);
        }
    }
}
