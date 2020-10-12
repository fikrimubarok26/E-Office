<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <meta name="baseUrl" content="<?= base_url() ?>">
    <meta name="menu" content="<?= (isset($menu)) ? $menu : null ?>">
    <meta name="token" content="<?= $this->session->userdata('token') ?>">
    <meta name="upk" content="<?= $this->session->userdata('upk') ?>">
    <meta name="level" content="<?= $this->session->userdata('level') ?>">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>
    <meta name="<?= $this->security->get_csrf_token_name() ?>" content="<?= $this->security->get_csrf_hash() ?>" id="csrf">
    <meta name="router" content="<?= strtolower($this->router->fetch_class()) ?>">

    <title>E - Office | <?= $title ?></title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/fontawasome/css/fontawesome.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/fontawasome/css/all.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/jstree/dist/themes/default/style.min.css">
    <link rel="stylesheet" href="<?= base_url('assets/css/snackbar.min.css') ?>">



    <!-- CSS Libraries -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/modules/iziToast.min.css">

    <!-- Template CSS -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/templates/css/style.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/templates/css/components.css">

    <!-- Tagify -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/tagify/dist/tagify.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/css/CustomFiles.css" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600&display=swap');

        .jofan-300 {
            font-family: 'Josefin Sans', sans-serif;
            font-weight: 300;
        }

        .jofan-400 {
            font-family: 'Josefin Sans', sans-serif;
            font-weight: 400;
        }

        .jofan-500 {
            font-family: 'Josefin Sans', sans-serif;
            font-weight: 500;
        }

        .jofan-600 {
            font-family: 'Josefin Sans', sans-serif;
            font-weight: 600;
        }

        .nunito-400 {
            font-family: "Nunito", "Segoe UI", arial;
            font-weight: 400;
        }

        .nunito-600 {
            font-family: "Nunito", "Segoe UI", arial;
            font-weight: 600;
        }

        .nunito-700 {
            font-family: "Nunito", "Segoe UI", arial;
            font-weight: 700;
        }

        .nunito-800 {
            font-family: "Nunito", "Segoe UI", arial;
            font-weight: 800;
        }

        /* Suggestions items */
        .tagify__dropdown.users-list .tagify__dropdown__item {
            padding: .5em .7em;
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 0 1em;
            grid-template-areas: "avatar name"
                "avatar email";
        }

        .tagify__dropdown.users-list .tagify__dropdown__item:hover .tagify__dropdown__item__avatar-wrap {
            transform: scale(1.2);
        }

        .tagify__dropdown.users-list .tagify__dropdown__item__avatar-wrap {
            grid-area: avatar;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            overflow: hidden;
            background: #EEE;
            transition: .1s ease-out;
        }

        .tagify__dropdown.users-list img {
            width: 100%;
            vertical-align: top;
        }

        .tagify__dropdown.users-list strong {
            grid-area: name;
            width: 100%;
            align-self: center;
        }

        .tagify__dropdown.users-list span {
            grid-area: email;
            width: 100%;
            font-size: .9em;
            opacity: .6;
        }

        .tagify__dropdown.users-list .addAll {
            border-bottom: 1px solid #DDD;
            gap: 0;
        }


        /* Tags items */
        .tagify__tag {
            white-space: nowrap;
        }

        .tagify__tag:hover .tagify__tag__avatar-wrap {
            transform: scale(1.6) translateX(-10%);
        }

        .tagify__tag .tagify__tag__avatar-wrap {
            width: 16px;
            height: 16px;
            white-space: normal;
            border-radius: 50%;
            margin-right: 5px;
            transition: .12s ease-out;
        }

        .tagify__tag img {
            width: 100%;
            vertical-align: top;
        }

        .text-size---1 {
            font-size: 0.780rem;
        }

        .text-size--1 {
            font-size: 0.840rem;
        }

        .text-size-1 {
            font-size: 0.875rem;
        }

        .text-size-2 {
            font-size: 0.938rem;
        }

        .text-size-3 {
            font-size: 1rem
        }

        .text-size-4 {
            font-size: 1.063rem;
        }

        .text-size-5 {
            font-size: 1.125rem;
        }

        .text-size-6 {
            font-size: 1.188rem;
        }

        .text-size-7 {
            font-size: 1.25rem;
        }

        .text-size-8 {
            font-size: 1.313rem;
        }

        .text-size-9 {
            font-size: 1.375rem;
        }

        .text-size-10 {
            font-size: 1.438rem;
        }

        .text-size-11 {
            font-size: 1.5rem;
        }

        .text-size-12 {
            font-size: 1.563rem;
        }

        level .text-size-13 {
            font-size: 1.625rem;
        }

        .text-size-14 {
            font-size: 1.688rem;
        }

        .text-size-15 {
            font-size: 1.75rem;
        }

        .text-size-16 {
            font-size: 1.813rem;
        }

        .letter-spacing {
            letter-spacing: 0.5px;
        }

        .bg-background {
            background: #f8f9fa !important;
        }

        .text-dark-1 {
            color: #212529;
        }

        <?php
        if ($this->session->level == 3) { ?>.nav-link.active.menu-beranda {
            background: #007bff !important;
            color: #fff !important;
        }

        .nav-pills .nav-item .nav-link {
            color: #111;

        }

        <?php
        }

        if ($this->session->level == 2) {

        ?>.nav-link.active.menu-beranda {
            background: #007bff !important;
            color: #fff !important;
        }

        .nav-pills .nav-item .nav-link {
            color: #111;

        }

        .bg-primary {
            background: #e63946 !important;
        }

        .btn-primary {
            background: #e63946;
            border-color: #e63946;
        }

        .text-primary {
            color: #e63946 !important;
        }

        a {
            color: #e63946;
        }

        .tickets .ticket-items .ticket-item.active {
            background: #e63946;
        }

        .tickets .ticket-items .ticket-item:hover .ticket-title {
            color: #e63946;
        }

        <?php
        }
        ?>.box-shadow {
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.07),
                0 2px 4px rgba(0, 0, 0, 0.07),
                0 4px 8px rgba(0, 0, 0, 0.07),
                0 8px 16px rgba(0, 0, 0, 0.07),
                0 16px 32px rgba(0, 0, 0, 0.07),
                0 32px 64px rgba(0, 0, 0, 0.07);
        }
    </style>

</head>

<body class="layout-3 bg-background">
    <div>
        <div class="main-wrapper container">
            <div class="navbar-bg <?= $this->session->level != 2 ? '' : 'bg-custom-red'; ?> "></div>
            <!--             <div style="color: white">
                <nav class="navbar navbar-expand-lg main-navbar">
                    <center>
                        <img src="https://www.ybth.org/pictures/ybth_bg2d.png" width="1%">
                        Sekolah Tinggi Ilmu Kesehatan
                        Bakti Tunas Husada   
                        <img src="https://www.ybth.org/pictures/ybth_bg2d.png" width="1%">
                    </center>
                </nav>
            </div>
            <br>
    

 -->

            <br>
            <nav class="navbar navbar-expand-lg main-navbar d-flex justify-content-center">
                <a href="<?= base_url('admin/dashboard') ?>" class="navbar-brand sidebar-gone-hide">
                    <!-- E-LETTER -->
                </a>
                <?php
                if ($this->session->userdata('upk') == 0) { ?>
                    <img src='<?= base_url('uploads/config/' . $this->req->getLogo()) ?>' width='3%'>
                <?php } else { ?>
                    <img src='<?= base_url('uploads/config/' . $this->req->getLogoUpk()) ?>' width='3%'>
                <?php }
                ?>


                <!-- <div class="navbar-nav">
                    <a href="#" class="nav-link sidebar-gone-show" data-toggle="sidebar"><i class="fas fa-bars"></i></a>
                </div>
 -->


                <div class="container">
                    <div class="nav-collapse">
                        <a class="sidebar-gone-show nav-collapse-toggle nav-link" href="#">
                            <i class="fas fa-bars"></i>
                        </a>
                        <ul class="navbar-nav">
                            <?php if ($this->session->level == 3) { ?>
                                <li class="nav-item">
                                    <a href="<?= base_url() ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="far fa-copy" style="font-size:19px"></i> <span class="nunito-500 text-size-3 letter-spacing">
                                                Beranda</span>
                                        </div>
                                    </a>

                                </li>
                                <li class="nav-item ml-2">
                                    <a href="<?= base_url('dokumen-masuk') ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="far fa-copy" style="font-size:19px"></i> <span class="nunito-500 text-size-3 letter-spacing">
                                                Dokumen Masuk</span>
                                        </div>
                                    </a>

                                </li>

                                <li class="nav-item ml-2">
                                    <a href="<?= base_url('dokumen-saya') ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="far fa-file-alt" style="font-size:18px"></i> <span class="nunito-500 text-size-3 letter-spacing">
                                                Dokumen Saya</span>
                                        </div>
                                    </a>

                                </li>
                            <?php } elseif ($this->session->level == 2 || $this->session->level == 1) { ?>
                                <li class="nav-item">
                                    <a href="<?= base_url() ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="fas fa-home" style="font-size:19px"></i></> <span class="nunito-500 text-size-3 letter-spacing">
                                                Beranda</span>
                                        </div>
                                    </a>

                                </li>
                                <li class="nav-item ml-2">
                                    <a href="<?= base_url('dokumen-masuk') ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="far fa-copy" style="font-size:19px"></i> <span class="nunito-500 text-size-3 letter-spacing">
                                                Dokumen Masuk</span>
                                        </div>
                                    </a>

                                </li>

                                <li class="nav-item ml-2">
                                    <a href="<?= base_url('dokumen-saya') ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="far fa-file-alt" style="font-size:18px"></i> <span class="nunito-500 text-size-3 letter-spacing">
                                                Dokumen</span>
                                        </div>
                                    </a>

                                </li>
                                <li class="nav-item ml-2">
                                    <a href="<?= base_url('jenis-dokumen') ?>" class="nav-item nav-link nav-link-lg nav-link-user active">
                                        <div class="d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-inline-block">
                                            <i class="far fa-folder" style="font-size:19px"></i> <span class="nunito-500 text-size-3 letter-spacing">
                                                Jenis Dokumen</span>
                                        </div>
                                    </a>
                                </li>
                            <?php } ?>
                            <!-- <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-inbox"></i> Arsip Surat
                                Masuk</a></li>
                        <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-shipping-fast"> </i> Arsip
                                Surat Keluar</a></li> -->
                        </ul>
                    </div>
                    <div>
                        <ul class="navbar-nav">
                            <li class="nav-item nav-link-lg nav-link-user active">
                                <a href='<?= $this->config->item('apps') . 'office-master/dashboard-app' ?>' class="nav-link nunito-700 text-size-2">
                                    Kembali ke halaman
                                    <i class="fas fa-chevron-circle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>

                </div>

            </nav>

            <!-- Main Content -->
            <div class="" style="padding-top:100px">
                <section class="section">
                    <!-- <div class="card"> -->
                    <!-- <div class="card-body"> -->
                    <?php require_once 'content.php' ?>
                    <!-- </div> -->
                    <!-- </div> -->

                </section>




            </div>
        </div>

        <!-- General JS Scripts -->
        <script src="<?= base_url() ?>assets/js/jquery-3.3.1.min.js"></script>
        <script src="<?= base_url() ?>assets/js/popper.min.js"></script>
        <script src="<?= base_url() ?>assets/js/bootstrap.min.js"></script>
        <script src="<?= base_url() ?>assets/js/jquery.nicescroll.min.js"></script>
        <script src="<?= base_url() ?>assets/js/moment.min.js"></script>
        <script src="<?= base_url() ?>assets/templates/js/stisla.js"></script>
        <!-- JS Libraies -->
        <script src="<?= base_url() ?>assets/jstree/dist/jstree.js"></script>

        <!-- <script src="<?= base_url() ?>assets/node_modules/prismjs/prism.js"></script> -->
        <!-- JS Libraies -->

        <!-- Tagify -->
        <script src="<?= base_url() ?>assets/tagify/dist/tagify.min.js"></script>
        <script src="<?= base_url() ?>assets/tagify/dist/jQuery.tagify.min.js"></script>

        <!-- Sweet Alert -->
        <script src="<?= base_url() ?>assets/modules/iziToast.min.js"></script>
        <script src="<?= base_url() ?>assets/modules/sweetalert.min.js"></script>


        <!-- Template JS File -->
        <script src="<?= base_url() ?>assets/templates/js/scripts.js"></script>
        <script src="<?= base_url() ?>assets/templates/js/custom.js"></script>
        <script src="<?= base_url() ?>assets/templates/js/page/bootstrap-modal.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

        <script src="<?= base_url() ?>assets/js/page/admin.js"></script>
        <script src="<?= base_url('assets/js/snackbar.min.js') ?>"></script>
        <script src="<?= base_url() ?>assets/js/page/script.js"></script>
        <script src="<?= base_url() ?>assets/templates/js/<?= (isset($script)) ? $script : "" ?>.js"></script>
        <?= $this->session->flashdata('pesan') ?>
        <?php if ($this->session->flashdata('pesan-hapus') != null) { ?>
            <script>
                localStorage.clear();
            </script>
        <?php } ?>


        <!-- bs-custom-file-input -->
        <!-- <script src="<?= base_url() ?>assets/cust/bs-custom-file-input.min.js"></script> -->

</body>

</html>