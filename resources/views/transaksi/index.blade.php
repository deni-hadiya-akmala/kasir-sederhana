@extends('auth.layouts')

@section('content')
    <div class="container">
        <h2>Daftar Transaksi Pembelian</h2>

        <div class="row">
            <div class="col-12 col-sm-6">
                <a href="{{ route('transaksi.create') }}" class="btn btn-primary mb-2">Tambah Transaksi</a>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped"id="transaksi">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Waktu Transaksi</th>
                        <th>Total Harga</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($transaksi as $trans)
                        <tr>
                            <td>{{ $trans->id }}</td>
                            <td>{{ $trans->created_at }}</td>
                            <td>Rp {{ number_format($trans->total_harga, 0, ',', '.') }}</td>
                            <td><a href="{{ route('transaksi.show', $trans->id) }}" class="btn btn-info btn-sm">Detail</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
