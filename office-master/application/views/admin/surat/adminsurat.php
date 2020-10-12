<div class="card">
    <div class="card-header">
        <h4><?= $title ?></h4>
        <div class="card-header-form">
        </div>
    </div>
</div>

<input type="hidden" id="tipena" value="<?= $this->uri->segment(4, 0) ?>">

<?php echo $this->session->userdata('level'); ?>

<div class="card">
    <div class="card-body">
        <div class="table-responsive">
            <table id="list_surat" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nomor Surat</th>
                        <th>Tanggal Surat</th>
                        <th>Asal Surat</th>
                        <th>Jenis Surat</th>
                        <th>Perihal</th>
                        <th>Aksi</th>
                    </tr>
                </thead>

                <tbody>
                </tbody>

            </table>
        </div>
    </div>

</div>
</div>
