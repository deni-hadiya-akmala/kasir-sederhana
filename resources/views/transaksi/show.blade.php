@extends('auth.layouts')

@section('content')
    <div class="container">
        <h2>Detail Transaksi Pembelian</h2>
        <a href="{{ route('transaksi.index') }}" class="btn btn-primary mb-2">Kembali</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Nama Barang</th>
                    <th>Jumlah</th>
                    <th>Harga Satuan</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($items as $item)
                    <tr>
                        <td>{{ $item->masterBarang->nama_barang }}</td>
                        <td>{{ $item->jumlah }}</td>
                        <td>{{ number_format($item->harga_satuan, 0, ',', '.') }}</td>
                        <td>{{ number_format($item->jumlah * $item->harga_satuan, 0, ',', '.') }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="mt-3">
            <label><strong>Total: </strong></label>
            <span>{{ number_format($transaksi->total_harga, 0, ',', '.') }}</span>
        </div>
        <div class="mt-2">
            <label><strong>Waktu Transaksi: </strong></label>
            <span>{{ $transaksi->created_at->format('d-m-Y H:i:s') }}</span>
        </div>
    </div>
@endsection
