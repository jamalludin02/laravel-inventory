<div class="modal fade" role="dialog" id="modal_edit_barangMasuk">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Barang Masuk</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form enctype="multipart/form-data">
        <input type="hidden" id="barangMasuk_id">
        <div class="modal-body">

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>Tanggal Masuk</label>
                <input type="text" class="form-control" name="tanggal_masuk" id="edit_tanggal_masuk">
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-edit-tanggal_masuk"></div>
              </div>

              <div class="form-group">
                <label>Kode Transaksi</label>
                <input type="text" class="form-control" name="kode_transaksi" id="edit_kode_transaksi" readonly>
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-edit-kode_transaksi"></div>
              </div>

              <div class="form-group">
                <label>Stok Saat Ini</label>
                <input type="number" class="form-control" name="stok" id="edit_stok" disabled>
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-edit-stok"></div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label>Pilih Barang</label>
                <select class="form-control select2" name="nama_barang" id="edit_nama_barang">
                  <option selected>Pilih Barang</option>
                  @foreach ($barangs as $barang)
                    <option value="{{ $barang->nama_barang }}">{{ $barang->nama_barang }}</option>
                  @endforeach
                </select>
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-edit-nama_barang"></div>
              </div>

              <div class="form-group">
                <label>Supplier</label>
                <select class="form-control select2" name="supplier_id" id="edit_supplier_id">
                  @foreach ($suppliers as $supplier)
                    <option value="{{ $supplier->id }}">{{ $supplier->supplier}}</option>
                  @endforeach
                </select>
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-edit-supplier_id"></div>
              </div>

              <div class="form-group">
                <label>Jumlah Masuk</label>
                <div class="input-group">
                  <input type="number" class="form-control" name="jumlah_masuk" id="edit_jumlah_masuk" min="0"
                    style="width: 75%;">
                  <div class="input-group-append" style="width: 25%;">
                    <input type="text" class="form-control" name="satuan" id="edit_satuan_id" disabled>
                  </div>
                  <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-edit-jumlah_masuk"></div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Keluar</button>
          <button type="button" class="btn btn-primary" id="update">Update</button>
        </div>
      </form>
    </div>
  </div>
</div>
</div>