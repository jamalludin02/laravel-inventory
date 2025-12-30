<div class="modal fade" tabindex="-1" role="dialog" id="modal_edit_role">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Role & Hak Akses</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form enctype="multipart/form-data">
        <div class="modal-body">
          <div class="row">
            <div class="col-md-5">
              <input type="hidden" id="role_id">
              <div class="form-group">
                <label>Role</label>
                <input type="text" class="form-control" name="role" id="edit_role">
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-role"></div>
              </div>
              <div class="form-group">
                <label>Deskripsi</label>
                <textarea class="form-control" name="deskripsi" id="edit_deskripsi" rows="5"></textarea>
                <div class="alert alert-danger mt-2 d-none" role="alert" id="alert-deskripsi"></div>
              </div>
            </div>
            <div class="col-md-7">
              <div class="form-group">
                <label class="d-block">Akses Menu</label>
                <div
                  style="max-height: 400px; overflow-y: auto; border: 1px solid #e9ecef; padding: 15px; border-radius: 5px; background: #fdfdfd;">
                  <div id="menu_list">
                    <!-- Menus will be loaded here via AJAX -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Keluar</button>
          <button type="button" class="btn btn-primary" id="update">Simpan Perubahan</button>
        </div>
      </form>
    </div>
  </div>
</div>