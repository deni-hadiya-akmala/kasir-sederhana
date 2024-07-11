<?php

namespace Database\Seeders;

use App\Models\MasterBarang;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MasterBarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        MasterBarang::insert([
            ['nama_barang' => 'Sabun batang', 'harga_satuan' => 3000],
            ['nama_barang' => 'Mi Instan', 'harga_satuan' => 2000],
            ['nama_barang' => 'Pensil', 'harga_satuan' => 1000],
            ['nama_barang' => 'Kopi sachet', 'harga_satuan' => 1500],
            ['nama_barang' => 'Air minum galon', 'harga_satuan' => 20000],
        ]);
    }
}
