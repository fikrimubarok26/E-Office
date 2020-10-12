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
    <meta name="<?= $this->security->get_csrf_token_name() ?>" content="<?= $this->security->get_csrf_hash() ?>"
        id="csrf">
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
</head>

<body class="layout-3 bg-background">
    <div>
        <div class="main-wrapper container px-5" style="padding-top:200px">

            <div class="container px-5">
                <div class="row px-5 mb-4">
                    <div class="col text-center">
                        <h5 class="nunito-700">Menu Aplikasi E-Office</h5>
                    </div>
                </div>
                <div class="wizard-steps px-5">
                    <div class="wizard-step wizard-step-active mx-5">
                        <a class="text-white" href="">
                            <div class="wizard-step-icon">
                                <i class="fas fa-envelope"> </i>
                            </div>
                            <div class="wizard-step-label">
                                <h4>E - LETTER</h4>
                            </div>
                        </a>
                    </div>
                    <div class="wizard-step wizard-step-active">
                        <a class="text-white" href="">
                            <div class="wizard-step-icon">
                                <i class="far fa-file-alt"></i>
                            </div>
                            <div class="wizard-step-label">
                                <h4>E - DOCUMENT</h4>
                            </div>
                        </a>
                    </div>

                </div>
            </div>


            <!-- General JS Scripts -->
            <script src="<?= base_url() ?>assets/js/jquery-3.3.1.min.js"></script>
            <script src="<?= base_url() ?>assets/js/popper.min.js"></script>
            <script src="<?= base_url() ?>assets/js/bootstrap.min.js"></script>
            <script src="<?= base_url() ?>assets/js/jquery.nicescroll.min.js"></script>
            <script src="<?= base_url() ?>assets/js/moment.min.js"></script>
            <script src="<?= base_url() ?>assets/templates/js/stisla.js"></script>

            <!-- Sweet Alert -->
            <script src="<?= base_url() ?>assets/modules/iziToast.min.js"></script>

            <!-- Template JS File -->
            <script src="<?= base_url() ?>assets/templates/js/scripts.js"></script>
            <script src="<?= base_url() ?>assets/templates/js/custom.js"></script>
            <script src="<?= base_url() ?>assets/templates/js/page/bootstrap-modal.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

            <script src="<?= base_url() ?>assets/js/page/admin.js"></script>
            <script src="<?= base_url('assets/js/snackbar.min.js') ?>"></script>
            <script src="<?= base_url() ?>assets/js/page/script.js"></script>
            <?= $this->session->flashdata('pesan') ?>

</body>

</html>