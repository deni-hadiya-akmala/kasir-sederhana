@extends('auth.layouts')

@section('content')
    <div class="container">
        <h2>Buat Transaksi Pembelian</h2><a href="{{ route('transaksi.index') }}" class="btn btn-primary mb-2">Kembali</a>
        <form action="{{ route('transaksi.store') }}"class="my-5" method="POST">
            @csrf
            <div class="form-group">
                <label for="items">Barang:</label>
                <div id="items">
                    <div class="item form-row mb-2">
                        <div class="col-md-5">
                            <select class="form-control" name="items[0][id]" required>
                                <option value="">Pilih Barang</option>
                                @foreach ($barangs as $barang)
                                    <option value="{{ $barang->id }}" data-harga="{{ $barang->harga_satuan }}">
                                        {{ $barang->nama_barang }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="number" class="form-control" name="items[0][jumlah]" min="1"
                                placeholder="Jumlah" required>
                        </div>
                        <div class="col-md-2">
                            <input type="number" class="form-control" name="items[0][harga_satuan]" readonly
                                placeholder="Harga Satuan">
                        </div>
                        <div class="col-md-2">
                            <input type="number" class="form-control" name="items[0][subtotal]" readonly
                                placeholder="Subtotal">
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="btn btn-danger" onclick="removeItem(this)">Hapus</button>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary mt-2" onclick="addItem()">Tambah Barang</button>
            </div>
            <div class="form-group">
                <label for="total">Total:</label>
                <input type="number" class="form-control" id="total" name="total_harga" readonly>
            </div>
            <button type="submit" class="btn btn-success">Simpan</button>
        </form>
    </div>

    <script>
        function addItem() {
            const itemsDiv = document.getElementById('items');
            const newItem = itemsDiv.firstElementChild.cloneNode(true);
            const index = itemsDiv.childElementCount;
            newItem.querySelectorAll('input, select').forEach(input => {
                input.name = input.name.replace(/\d+/, index);
                input.value = '';
            });
            itemsDiv.appendChild(newItem);
        }

        function removeItem(button) {
            const item = button.parentElement.parentElement;
            item.remove();
            calculateTotal();
        }

        document.getElementById('items').addEventListener('change', function(e) {
            if (e.target.tagName === 'SELECT') {
                const harga = e.target.selectedOptions[0].dataset.harga;
                const itemDiv = e.target.parentElement.parentElement;
                itemDiv.querySelector('input[name$="[harga_satuan]"]').value = harga;
            } else if (e.target.name.endsWith('[jumlah]')) {
                const itemDiv = e.target.parentElement.parentElement;
                const jumlah = e.target.value;
                const harga = itemDiv.querySelector('input[name$="[harga_satuan]"]').value;
                const subtotal = jumlah * harga;
                itemDiv.querySelector('input[name$="[subtotal]"]').value = subtotal;
            }
            calculateTotal();
        });

        function calculateTotal() {
            const itemsDiv = document.getElementById('items');
            let total = 0;
            itemsDiv.querySelectorAll('input[name$="[subtotal]"]').forEach(input => {
                total += parseInt(input.value) || 0;
            });
            document.getElementById('total').value = total;
        }
    </script>
@endsection
