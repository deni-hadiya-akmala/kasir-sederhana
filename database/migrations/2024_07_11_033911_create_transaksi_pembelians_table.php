<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transaksi_pembelians', function (Blueprint $table) {
            $table->id();
            $table->foreignId('transaksi_pembelian_id')->constrained('transaksi_pembelians')->onDelete('cascade');
            $table->foreignId('master_barang_id')->constrained('master_barangs')->onDelete('cascade');
            $table->integer('jumlah');
            $table->bigInteger('harga_satuan'); // Ubah menjadi bigInteger
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaksi_pembelians');
    }
};
