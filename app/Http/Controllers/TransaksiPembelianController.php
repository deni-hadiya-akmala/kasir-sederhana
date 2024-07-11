<?php

namespace App\Http\Controllers;

use App\Models\MasterBarang;
use App\Models\TransaksiPembelian;
use App\Models\TransaksiPembelianBarang;
use Illuminate\Http\Request;

class TransaksiPembelianController extends Controller
{
    public function create()
    {
        $barangs = MasterBarang::all();
        return view('transaksi.create', compact('barangs'));
    }

    public function store(Request $request)
    {
        $transaksi = new TransaksiPembelianBarang();
        $transaksi->total_harga = array_sum(array_map(function ($item) {
            return $item['jumlah'] * $item['harga_satuan'];
        }, $request->items));
        $transaksi->save();

        foreach ($request->items as $item) {
            $transaksiBarang = new TransaksiPembelian();
            $transaksiBarang->transaksi_pembelian_id = $transaksi->id;
            $transaksiBarang->master_barang_id = $item['id'];
            $transaksiBarang->jumlah = $item['jumlah'];
            $transaksiBarang->harga_satuan = $item['harga_satuan'];
            $transaksiBarang->save();
        }

        return redirect()->route('transaksi.index');
    }

    public function index()
    {
        $transaksi = TransaksiPembelianBarang::all();
        return view('transaksi.index', compact('transaksi'));
    }

    public function show($id)
    {
        $transaksi = TransaksiPembelianBarang::findOrFail($id);
        $items = TransaksiPembelian::with('masterBarang')->where('transaksi_pembelian_id', $id)->get();
        // dd($items);
        return view('transaksi.show', compact('transaksi', 'items'));
    }
}
