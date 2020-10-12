<style>
    /* width */
    #ticket-items::-webkit-scrollbar {
        width: 4px;
    }

    <?php if ($this->session->level == 3) {
    ?>

    /* Track */
    #ticket-items::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    /* Handle */
    #ticket-items::-webkit-scrollbar-thumb {
        border-radius: 50px;
        background: #02c39a;
    }

    /* Handle on hover */
    #ticket-items::-webkit-scrollbar-thumb:hover {
        background: #444;
    }


    <?php
    } elseif ($this->session->level == 2) {
    ?>.bg-primary {
        background: #e63946 !important;
    }

    /* Track */
    #ticket-items::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    /* Handle */
    #ticket-items::-webkit-scrollbar-thumb {
        border-radius: 50px;
        background: #444;
    }

    /* Handle on hover */
    #ticket-items::-webkit-scrollbar-thumb:hover {
        background: #444;
    }

    <?php
    }

    ?>
</style>
<di class="container mt-0">
    <div class="row mt-0 pt-0">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header pb-0 no-border bg-primary">
                    <div class="card-title nunito-700 letter-spacing text-size-5 text-white"><i class="far fa-copy" style="font-size:24px"></i>
                        Dokumen Masuk
                    </div>

                </div>
                <div class="card-body px-0 pt-0">
                    <div class="tickets">
                        <?php if (count($collections) > 0) : ?>
                            <div class="ticket-items pr-0" style='max-height:450px; overflow:auto;' id="ticket-items">
                                <?php
                                $counter = 0;
                                foreach ($collections as $list) :
                                    $Judul = $list['judul'];
                                    if (strlen($Judul) > 30)
                                        $Judul = substr($Judul, 0, 30) . '...';
                                    $nama = $list['nama_user'];
                                    $Explode = explode(' ', $list['last_update']);
                                    $ExplodeTime = explode(':', $Explode[1]);
                                    $Jam = $ExplodeTime[0];
                                    $Menit = $ExplodeTime[1];
                                    $Detik = $ExplodeTime[2];
                                    $Tanggal = $this->library->GetTanggalIndo($list['last_update']);
                                    $JamData = date('H');
                                    $MenitData = date('i');
                                    if (date('Y-m-d') == date('Y-m-d', strtotime($list['last_update']))) {
                                        $MenitReal =  $this->library->timeDiff("{$Jam}:{$Menit}", "{$JamData}:{$MenitData}") / 60;
                                        $Tanggal = intval($MenitReal) . " Menit yang lalu";
                                        if ($MenitReal > 60) {
                                            $MenitReal =  $this->library->timeDiff("{$Jam}:{$Menit}", "{$JamData}:{$MenitData}") / 60 / 60;
                                            $Tanggal = intval($MenitReal) . ' Jam yang lalu';
                                        } elseif ($MenitReal <= 0)
                                            $Tanggal = 'Baru saja';
                                    } elseif (date('Y-m') == date('Y-m', strtotime($list['last_update']))) {
                                        $now = time(); // or your date as well
                                        $your_date = strtotime(date('Y-m-d', strtotime($list['last_update'])));
                                        $datediff = $now - $your_date;
                                        if (floor($datediff / (60 * 60 * 24)) <= 7)
                                            $Tanggal = floor($datediff / (60 * 60 * 24)) . ' Hari yang lalu';;
                                    }
                                    $Akses = $this->session->jabatan;
                                ?>
                                    <div title="<?= $list['judul'] ?>" class="ticket-item d-flex justify-content-start mb-1 pt-3 pb-2 px-4 item-dokumen-masuk <?= $counter == 0 ? 'bg-light' : '' ?>" data-id="<?= $this->library->Encode($list['id'], 7) ?>">
                                        <div>
                                            <i class="far fa-file-alt" style="font-size:30px"></i>
                                        </div>
                                        <div class="ml-3 w-100">
                                            <div class="ticket-title">
                                                <h6 class="text-size--1 text-primary"><?= $Judul ?></h6>
                                            </div>
                                            <div class="ticket-desc d-flex flex-column">
                                                <div class="nunito-500" style="margin-top:-5px;"><?= $list['nama_user'] ?></div>
                                                <div class="mt-3 d-flex justify-content-end">
                                                    <span class="text-muted">
                                                        <i class="far fa-clock"></i>&nbsp;
                                                        <span class='tgl-docmasuk'><?= $Tanggal ?></span>
                                                    </span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                <?php
                                    $counter++;
                                endforeach;
                                ?>
                            </div>

                            <div class="ticket-content px-5" id="content-dokumen">
                                <?php
                                $source = $collections[0];
                                $Nama = $source['nama_user'];
                                $Judul = $source['judul'];
                                $Deskripsi = $source['desc'];
                                $File = $source['ori_file'];

                                // tanggal
                                $Explode = explode(' ', $source['last_update']);
                                $ExplodeTime = explode(':', $Explode[1]);
                                $Jam = $ExplodeTime[0];
                                $Menit = $ExplodeTime[1];
                                $Detik = $ExplodeTime[2];
                                $Tanggal = $this->library->GetTanggalIndo($source['last_update']);
                                $JamData = date('H');
                                $MenitData = date('i');
                                if (date('Y-m-d') == date('Y-m-d', strtotime($source['last_update']))) {
                                    $MenitReal =  $this->library->timeDiff("{$Jam}:{$Menit}", "{$JamData}:{$MenitData}") / 60;
                                    $Tanggal = intval($MenitReal) . ' Menit yang lalu';
                                    if ($MenitReal > 60) {
                                        $MenitReal =  $this->library->timeDiff("{$Jam}:{$Menit}", "{$JamData}:{$MenitData}") / 60 / 60;
                                        $Tanggal = intval($MenitReal) . ' Jam yang lalu';
                                    } elseif ($MenitReal <= 0)
                                        $Tanggal = 'Baru saja';
                                } elseif (date('Y-m') == date('Y-m', strtotime($source['last_update']))) {
                                    $now = time(); // or your date as well
                                    $your_date = strtotime(date('Y-m-d', strtotime($source['last_update'])));
                                    $datediff = $now - $your_date;
                                    if (floor($datediff / (60 * 60 * 24)) <= 7)
                                        $Tanggal = floor($datediff / (60 * 60 * 24)) . ' Hari yang lalu';;
                                }

                                ?>
                                <div class="ticket-header mt-4">
                                    <div class="ticket-sender-picture img-shadow">
                                        <i class="far fa-file-alt" style="font-size:50px"></i>
                                    </div>
                                    <div class="ticket-detail">
                                        <div class="ticket-title">
                                            <h4><?= ucfirst($Judul) ?></h4>
                                        </div>
                                        <div class="ticket-info">
                                            <div class="font-weight-600"><?= ucfirst($Nama) ?></div>
                                            <div class="bullet"></div>
                                            <div class="text-primary font-weight-600"><i class="far fa-clock"></i>
                                                <?= $Tanggal ?></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ticket-description">
                                    <p class="text-justify"><?= $Deskripsi ?></p>

                                    <a title='<?= $Judul ?>' target='_blank' href="<?= base_url('upload/documents/' . $File) ?>" class="btn btn-primary nunito-700 float-right" id='btn-show-file'><i class="far fa-file-alt"></i>
                                        Unduh file</a>
                                </div>

                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</di v>