<form id="formPenomoran">
    <div class="row">
        <div class="col-md-12 col-lg-8 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4>Format Penomoran Surat Masuk & Keluar</h4>
                </div>
                <div class="card-body">

                    <div class="form-group">
                        <label>Format Nomor Surat Masuk</label>
                        <input type="text" class="form-control" id="noSuratMasuk" name="format_surat_masuk" value="" placeholder="Nomor Surat Masuk">

                    </div>


                    <div class="form-group">
                        <label>Format Nomor Surat Keluar</label>
                        <input type="text" class="form-control" id="noSuratKeluar" name="format_surat_keluar" value="" placeholder="Nomor Surat Keluar">
                    </div>
                    <div class="row">
                        <div class="col-md-6">

                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-primary col-md-12">Simpan</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h4>Tampilan Penomoran Surat</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label>Format Nomor Surat Masuk</label>
                        <p>No Surat</p>
                    </div>
                    <div class="form-group">
                        <label>Format Nomor Surat Keluar</label>
                        <p>No Surat</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    var loadFile = function(event) {
        var output = document.getElementById('output');
        output.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
</script>