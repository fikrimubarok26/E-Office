<br /><br />
<div class="container">
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class=" d-flex justify-content-between">
                <div class="text-size-7 nunito-600 text-dark-1 letter-spacing"><i class="fas fa-cloud-upload-alt"
                        style="font-size:19px"></i> Unggah Dokumen
                </div>

            </div>
            <hr />

            <!-- FORM -->
            <?= form_open_multipart(base_url('dokumen-saya/store'), ['autocomplete' => 'off', 'id' => 'StoreDokumen']); ?>
            <!-- Kategori Dokumen -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Kategori Dokumen</label>
                        <select class="form-control" name="nama_jenis">
                            <option value="">- Pilih Kategori Dokumen -</option>
                            <?php foreach ($data as $list) : ?>
                            <option value="<?= $list['id'] ?>"><?= $list['nama_jenis'] ?></option>
                            <?php endforeach; ?>
                        </select>
                        <div class="text-danger nunito-500" id="__nama_jenis"></div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Dokumen</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="berkas" accept="application/pdf"
                                id="customFile">
                            <label class="custom-file-label text-size---1" for="customFile" id="nameFile">Unggah
                                Dokumen</label>
                        </div>
                        <div class="text-danger nunito-500" id="__customFile"></div>
                    </div>
                </div>

            </div>
            <!-- /Kategori Dokumen -->
            <!-- JUDUL -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label>Judul</label>
                        <input name="judul" class="form-control" placeholder="Judul Berkas">
                        <div class="text-danger nunito-500" id="__judul"></div>

                    </div>
                </div>
            </div>
            <!-- /JUDUL -->

            <!-- DESKRIPSI -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label>Deskripsi</label>
                        <textarea name="deskripsi" class="form-control"></textarea>
                        <div class="text-danger nunito-500" id="__deskripsi"></div>

                    </div>
                </div>
            </div>
            <!-- /DESKRIPSI -->

            <!-- IS PUBLIC -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label class="custom-switch pl-0">
                            <input id="is_public" type="checkbox" checked name="is_public" class="custom-switch-input">
                            <span class="custom-switch-indicator"></span>
                            <span class="custom-switch-description">Untuk Publik</span>
                        </label>
                    </div>
                </div>
            </div>
            <!-- /IS PUBLIC -->

            <!-- AKSES -->
            <div class="row">
                <div class="col-lg-12" id="AksesPublic">
                </div>
            </div>
            <!-- /AKSES -->

            <!-- LIST BAGIAN -->
            <div id="ListBagian"></div>

            <button type='submit' name="save" class="btn btn-info float-right nunito-500 "><i class="far fa-save"></i>
                Simpan</button>
            <!-- /LIST BAGIAN -->
            <?= form_close() ?>
            <!-- /FORM -->
            <br /><br /><br />
        </div>
    </div>
</div>
<script src="<?= base_url('assets/autosize/autosize.min.js') ?>"></script>
<script>
autosize(document.querySelectorAll('textarea'));
</script>