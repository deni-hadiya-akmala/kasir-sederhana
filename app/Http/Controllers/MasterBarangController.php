<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MasterBarang;

class MasterBarangController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = MasterBarang::latest()->get();
            return datatables()->of($data)
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" data-id="' . $row->id . '" class="edit btn btn-primary btn-sm">Edit</a>';
                    $btn = $btn . '<a href="javascript:void(0)" data-id="' . $row->id . '" class="delete btn btn-danger btn-sm">Delete</a>';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('barang.index');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_barang' => 'required',
            'harga_satuan' => 'required|numeric',
        ]);

        $input = $request->all();
        MasterBarang::create($input);

        return response()->json(['success' => 'Barang berhasil ditambahkan.']);
    }

    public function show($id)
    {
        $barang = MasterBarang::find($id);
        return response()->json($barang);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nama_barang' => 'required',
            'harga_satuan' => 'required|numeric',
        ]);

        $barang = MasterBarang::find($id);
        $barang->nama_barang = $request->nama_barang;
        $barang->harga_satuan = $request->harga_satuan;
        $barang->save();

        return response()->json(['success' => 'Barang berhasil diperbarui.']);
    }

    public function destroy($id)
    {
        MasterBarang::find($id)->delete();

        return response()->json(['success' => 'Barang berhasil dihapus.']);
    }
}
