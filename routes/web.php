<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginRegisterController;
use App\Http\Controllers\PasienController;
use App\Http\Controllers\RumahSakitController;

use App\Http\Controllers\TransaksiPembelianController;
use App\Http\Controllers\MasterBarangController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

Route::controller(LoginRegisterController::class)->group(function () {
    Route::get('/register', 'register')->name('register');
    Route::post('/store', 'store')->name('store');
    Route::get('/login', 'login')->name('login');
    Route::post('/authenticate', 'authenticate')->name('authenticate');
    Route::get('/dashboard', 'dashboard')->name('dashboard');
    Route::post('/logout', 'logout')->name('logout');
});
//transaksi

Route::get('/transaksi/create', [TransaksiPembelianController::class, 'create'])->name('transaksi.create');
Route::post('/transaksi/store', [TransaksiPembelianController::class, 'store'])->name('transaksi.store');
Route::get('/transaksi', [TransaksiPembelianController::class, 'index'])->name('transaksi.index');
Route::get('/transaksi/{id}', [TransaksiPembelianController::class, 'show'])->name('transaksi.show');

//master barang
Route::get('/barang', [MasterBarangController::class, 'index'])->name('barang.index');
Route::post('/barang', [MasterBarangController::class, 'store'])->name('barang.store');
Route::get('/barang/{id}', [MasterBarangController::class, 'show'])->name('barang.show');
Route::put('/barang/{id}', [MasterBarangController::class, 'update'])->name('barang.update');
Route::delete('/barang/{id}', [MasterBarangController::class, 'destroy'])->name('barang.destroy');
