<div class="container mt-3">
    <!-- MENU -->
    <div class="row mb-3">
        <div class="col d-flex justify-content-center">
            <ul class="nav nav-pills" id="myTab3" role="tablist">
                <li class="nav-item">
                    <a class="nav-link nunito-500 active menu-beranda" id="upk" data-toggle="tab" href="#home3"><i class="fas fa-archive"></i> UPK</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-beranda nunito-500" id="maintenance" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile" aria-selected="false"><i class="fas fa-tools"></i> Laporan Maintenance</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /MENU -->
    <div id="__UPK">
        <div class="row d-flex justify-content-center ">
            <?php foreach ($CollectionsUpk as $list) : ?>
                <div class="col-lg-4">
                    <div class="card card-statistic-2 box-shadow">
                        <div class="card-icon shadow-primary bg-primary">
                            <i class="fas fa-archive"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>UPK</h4>
                            </div>
                            <div class="card-body text-size-1">
                                <?= "<span class='text-size-4'>" . $list["upk"] . "</span>"; ?>
                            </div>
                        </div>
                        <div class="card-stats px-3 pt-2 pb-3">
                            <div class="card-stats-items py-4">

                                <div class="card-stats-item">
                                    <div class="card-stats-item-count"><?= $list['JUMLAH_ANGGOTA'] ?></div>
                                    <div class="card-stats-item-label">Anggota</div>
                                </div>
                                <div class="card-stats-item">
                                    <div class="card-stats-item-count"><?= $list['DOKUMEN_MASUK'] ?></div>
                                    <div class="card-stats-item-label">Upload</div>
                                </div>
                                <div class="card-stats-item">
                                    <div class="card-stats-item-count"><?= $list['DOKUMEN_MASUK_NOW'] ?></div>
                                    <div class="card-stats-item-label">Hari ini</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <div id="__MAINTENANCE" class="d-none">
        <div class="row">
            <div class="col">
                <h5><i class="fas fa-tools"></i> Maintenance Aplikasi E-Dokumen</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>TANGGAL</th>
                            <th>MAINTENANCE</th>
                            <th>DESKRIPSI</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($collections as $list) : ?>
                            <tr>
                                <td><?= $list['tanggal'] ?></td>
                                <td><?= $list['judul'] ?></td>
                                <td><?= $list['deskripsi_fitur'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>