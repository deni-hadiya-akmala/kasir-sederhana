<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiPembelian extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'transaksi_pembelians';
    public function transaksiPembelianBarangs()
    {
        return $this->hasMany(TransaksiPembelianBarang::class, 'transaksi_pembelian_id');
    }
    public function masterBarang()
    {
        return $this->belongsTo(MasterBarang::class, 'master_barang_id');
    }
}
