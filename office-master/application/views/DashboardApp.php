<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <meta name="baseUrl" content="<?= base_url() ?>">
    <meta name="menu" content="<?= (isset($menu)) ? $menu : null ?>">
    <meta name="token" content="<?= $this->session->userdata('token') ?>">
    <meta name="upk" content="<?= $this->session->userdata('upk') ?>">

    <title>E - Office | <?= $title ?></title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/fontawasome/css/fontawesome.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/fontawasome/css/all.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/jstree/dist/themes/default/style.min.css">

    <!-- CSS Libraries -->
    <!-- <link rel="stylesheet" href="<?= base_url() ?>assets/admin/node_modules/prismjs/themes/prism.css"> -->
    <link rel="stylesheet" type="text/css" href="<?= base_url() ?>assets/css/datatables.min.css" />


    <!-- CSS Libraries -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/modules/iziToast.min.css">

    <!-- Template CSS -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/admin/assets/css/style.css">
    <link rel="stylesheet" href="<?= base_url() ?>assets/admin/assets/css/components.css">
</head>

<body class="layout-3">


    <div style="margin-top:200px">
        <div class="container px-5">
            <h5 class="text-center mb-4">Aplikasi E - Office</h5>
            <div class="wizard-steps px-5">
                <div class="wizard-step wizard-step-active mx-3">
                    <a href="<?= base_url('admin') ?>" class="text-white" style="text-decoration: none;">
                        <div class="wizard-step-icon">
                            <i class="far fa-envelope"></i>
                        </div>
                        <div class="wizard-step-label">
                            <h6>E - LETTER</h6>
                        </div>
                    </a>
                </div>
                <div class="wizard-step wizard-step-active  bg-danger mx-5">
                    <a href="http://localhost/e-officebth/edokumen-master/" class="text-white" style="text-decoration: none;">

                        <div class="wizard-step-icon">
                            <i class="far fa-file-alt"></i>
                        </div>
                        <div class="wizard-step-label">
                            <h6>E - DOKUMEN</h6>
                        </div>
                    </a>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-12 text-center d-flex flex-column">
                    <div class="mb-2 text-danger " style="font-weight:700; font-size:20px">Keluar</div>
                    <a href="<?= base_url('logout') ?>">
                        <i class="fas fa-power-off text-danger" style="font-size:50px"></i>
                    </a>
                </div>
            </div>
        </div>

    </div>

</body>

</html>