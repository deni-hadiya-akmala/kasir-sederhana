@extends('auth.layouts')

@section('content')
    <div class="container mt-4">
        <h1>Data Master Barang</h1>
        <div class="row">
            <div class="col-12 col-sm-6">
                <button class="btn btn-primary mb-2" onclick="showCreateForm()">Tambah Barang</button>
            </div>
        </div>

        <table class="table table-bordered" id="barangTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama Barang</th>
                    <th>Harga Satuan</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>

    <!-- Modal for Create and Edit Barang -->
    <div class="modal fade" id="barangModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="formTitle">Tambah Barang</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="barangForm">
                        @csrf
                        <input type="hidden" id="barangId">
                        <div class="form-group">
                            <label>Nama Barang</label>
                            <input type="text" id="nama_barang" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Harga Satuan</label>
                            <input type="number" id="harga_satuan" class="form-control" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" form="barangForm" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            var table = $('#barangTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('barang.index') }}",
                    type: 'GET',
                },
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'nama_barang',
                        name: 'nama_barang'
                    },
                    {
                        data: 'harga_satuan',
                        name: 'harga_satuan'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });

            $('#barangForm').on('submit', function(e) {
                e.preventDefault();
                let id = $('#barangId').val();
                let url = id ? `/barang/${id}` : '/barang';
                let method = id ? 'PUT' : 'POST';

                $.ajax({
                    url: url,
                    method: method,
                    data: {
                        nama_barang: $('#nama_barang').val(),
                        harga_satuan: $('#harga_satuan').val(),
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(response) {
                        $('#barangModal').modal('hide');
                        $('#barangForm')[0].reset();
                        table.ajax.reload();
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Operation successful!',
                            timer: 3000,
                            showConfirmButton: false
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Operation failed!',
                            timer: 3000,
                            showConfirmButton: false
                        });
                    }
                });
            });

            $(document).on('click', '.edit', function() {
                let id = $(this).data('id');
                $.ajax({
                    url: `/barang/${id}`,
                    method: 'GET',
                    success: function(response) {
                        $('#formTitle').text('Ubah Barang');
                        $('#barangId').val(response.id);
                        $('#nama_barang').val(response.nama_barang);
                        $('#harga_satuan').val(response.harga_satuan);
                        $('#barangModal').modal('show');
                    }
                });
            });

            $(document).on('click', '.delete', function() {
                let id = $(this).data('id');
                let nama_barang = $(this).data('nama_barang');

                Swal.fire({
                    title: 'Hapus Barang',
                    text: 'Apakah ingin menghapus nama barang ' + nama_barang + '?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `/barang/${id}`,
                            method: 'DELETE',
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            success: function() {
                                table.ajax.reload();
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Deleted',
                                    text: 'Delete operation successful!',
                                    timer: 3000,
                                    showConfirmButton: false
                                });
                            },
                            error: function(xhr, status, error) {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error',
                                    text: 'Delete operation failed!',
                                    timer: 3000,
                                    showConfirmButton: false
                                });
                            }
                        });
                    }
                });
            });
        });

        function showCreateForm() {
            $('#formTitle').text('Tambah Barang');
            $('#barangForm')[0].reset();
            $('#barangId').val('');
            $('#barangModal').modal('show');
        }
    </script>
@endsection
