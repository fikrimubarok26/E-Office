<link rel="stylesheet" href="https://unpkg.com/placeholder-loading/dist/css/placeholder-loading.min.css">
<style>
tr:hover {
    cursor: pointer;
    background: #e3eaef;
}

.MYbounce {
    position: fixed;
    left: 0;
    top: 10%;
    right: 0;
    margin: auto;
    display: none;
    padding: 10px;
    width: 300px;
    border-radius: 5px;
    z-index: 99999;
}

.fab {
    position: fixed;
    width: 56px;
    left: 95%;
    bottom: 15px;
    margin-left: -28px;
    z-index: 999999;
    display: none;
}

.fab:hover .fab-buttons {
    opacity: 1;
    visibility: visible;
}

.fab:hover .fab-buttons__link {
    transform: scaleY(1) scaleX(1) translateY(-16px) translateX(0px);
}

.fab-action-button:hover+.fab-buttons .fab-buttons__link:before {
    visibility: visible;
    opacity: 1;
    transform: scale(1);
    transform-origin: right center 0;
    transition-delay: 0.3s;
}

.fab-action-button {
    position: absolute;
    bottom: 0;
    display: block;
    padding: 14px;
    width: 56px;
    height: 56px;
    background-color: #fc544b;
    border-radius: 50%;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.fab-buttons {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 50px;
    list-style: none;
    margin: 0;
    padding: 0;
    opacity: 0;
    visibility: hidden;
    transition: 0.2s;
}

.fab-action-button__icon {
    display: inline-block;
    width: 56px;
    height: 56px;
    background: url("data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjZmZmZmZmIiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0wIDBoMjR2MjRIMHoiIGZpbGw9Im5vbmUiLz4KICAgIDxwYXRoIGQ9Ik0xOCAxNi4wOGMtLjc2IDAtMS40NC4zLTEuOTYuNzdMOC45MSAxMi43Yy4wNS0uMjMuMDktLjQ2LjA5LS43cy0uMDQtLjQ3LS4wOS0uN2w3LjA1LTQuMTFjLjU0LjUgMS4yNS44MSAyLjA0LjgxIDEuNjYgMCAzLTEuMzQgMy0zcy0xLjM0LTMtMy0zLTMgMS4zNC0zIDNjMCAuMjQuMDQuNDcuMDkuN0w4LjA0IDkuODFDNy41IDkuMzEgNi43OSA5IDYgOWMtMS42NiAwLTMgMS4zNC0zIDNzMS4zNCAzIDMgM2MuNzkgMCAxLjUtLjMxIDIuMDQtLjgxbDcuMTIgNC4xNmMtLjA1LjIxLS4wOC40My0uMDguNjUgMCAxLjYxIDEuMzEgMi45MiAyLjkyIDIuOTIgMS42MSAwIDIuOTItMS4zMSAyLjkyLTIuOTJzLTEuMzEtMi45Mi0yLjkyLTIuOTJ6Ii8+Cjwvc3ZnPg==") center no-repeat;
}

.fab-buttons__item {
    display: block;
    text-align: center;
    margin: 12px 0;
}

.fab-buttons__link {
    display: inline-block;
    width: 40px;
    height: 40px;
    padding-top: 9px;
    text-decoration: none;
    background-color: #ffffff;
    border-radius: 50%;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
    transform: scaleY(0.5) scaleX(0.5) translateY(0px) translateX(0px);
    -moz-transition: .3s;
    -webkit-transition: .3s;
    -o-transition: .3s;
    transition: .3s;
}

[data-tooltip]:before {
    top: 50%;
    margin-top: -15px;
    border-radius: 50px;
    background: #343a40;
    color: #fff;
    font-family: 'Nunito', sans-serif;
    font-weight: 700;
    content: attr(data-tooltip);
    font-size: 12px;
    text-decoration: none;
    visibility: hidden;
    opacity: 0;
    padding: 1px 12px;
    margin-right: 12px;
    position: absolute;
    transform: scale(0);
    right: 100%;
    white-space: nowrap;
    transform-origin: top right;
    transition: all .3s cubic-bezier(.25, .8, .25, 1);
}

[data-tooltip]:hover:before {
    visibility: visible;
    opacity: 1;
    transform: scale(1);
    transform-origin: right center 0;
}

.icon-material {
    display: inline-block;
    width: 40px;
    height: 40px;
}

thead tr {
    background: #e3eaef;
}

thead tr:hover {
    background: #e3eaef;
}

thead tr td:hover {
    opacity: 0.8;
    color: #223;
}
</style>

<br /><br />
<div class="container">
    <?= form_open(base_url('admin/dokumen-saya/action')) ?>
    <!-- FAB -->
    <div class="fab">
        <button class="no-border fab-action-button text-center" style="padding-top:15.8px">
            <i class="fas fa-trash-alt text-white" style="font-size:23px;"></i>
        </button>
    </div>
    <!-- /FAB -->
    <input type='hidden' readonly name='id_jenis' id="tampung-input" class="form-control">
    <?= form_close(); ?>


    <!-- BOUNCE -->
    <div class='MYbounce bg-danger box-shadow'>
        <h4 class="text-center montserrat-600 letter-spacing text-white text-size-5" id='text-selected '
            style="padding: 0; margin: 0;">
            <label class="text-center" id='counter-selected' style="padding: 0; margin: 0;"></label>
            Item
            terpilih
        </h4>
    </div>
    <!-- /BOUNCE -->
    <div class="row">

        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <div class=" d-flex justify-content-between">
                <div class="text-size-7 nunito-600 text-dark-1 letter-spacing">
                    <i class="far fa-folder" style="font-size:19px">
                    </i> Jenis Dokumen
                </div>

            </div>

            <hr />

            <!-- SEARCH -->
            <div class="row mb-2">
                <div class="col-lg-2">
                    <a href="#" data-toggle="dropdown" class="btn btn-light dropdown-toggle mt-4"
                        aria-expanded="true"><i class="fas fa-list-ul"></i> Tampilkan Data</a>
                    <ul class="dropdown-menu dropdown-menu-sm dropdown-menu-right" id="display-data"
                        x-placement="bottom-end"
                        style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-124px, 31px, 0px);">
                        <li class="dropdown-title text-size-1 nunito-500">Tampilkan data</li>
                        <li><a href="#" class="dropdown-item show-data" data-val=5>5</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=10>10</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=25>25</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=50>50</a></li>
                        <li><a href="#" class="dropdown-item show-data" data-val=100>100</a></li>
                    </ul>

                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg-4"></div>

                <div class="col-lg-4">
                    <form action="" action='POST' autocomplete="off">
                        <label for=""></label>
                        <div class="input-group ">
                            <div class="input-group-btn">
                                <button type='button' class="btn btn-light py-2" name="btn-search"><i
                                        class="fas fa-search"></i></button>
                            </div>

                            <input type="text" class="form-control radius-right" placeholder="Cari Jenis dokumen"
                                name="q">
                        </div>
                    </form>
                </div>
            </div>
            <!-- /SEARCH -->

            <!-- Table Files -->

            <table class="table table-striped">
                <thead>
                    <tr class="mt-0">
                        <td style="background-color:transparent !important; width:26px; "
                            class="nunito-700 letter-spacing pl-3 pr-0 ">
                            <label class='pure-material-checkbox'>
                                <input type='checkbox' id='SelectAll'>
                                <span></span>
                            </label>
                        </td>
                        <td style="background-color:transparent !important; "
                            class="nunito-700 icon-th text-size---1 letter-spacing" data-filter='up'>
                            Jenis Dokumen
                            <span class=' float-right'><i class="fas fa-sort-amount-down-alt"></i></span>

                        </td>
                        <td style="background-color:transparent !important; width:10%"
                            class="nunito-700 text-size---1 letter-spacing">
                            Opsi

                        </td>
                    </tr>
                </thead>
                <tbody id="Data">
                </tbody>
            </table>
            <!-- Table Files -->

            <div class="d-flex justify-content-between">
                <!-- COUNT -->
                <div id="count-result" class="text-weight-italic">
                    <code><span id='total-data'>0</span></code> Records data aktif<br />
                    Halaman <code><span id='page-now'>0</span></code> dari <code><span id='total-page'>0</span></code>
                    halaman</div>
                <!-- /COUNT -->

                <!-- PAGINATION -->
                <div class="float-right" id="pagination"></div>
                <!-- /PAGINATION -->

            </div>

        </div>
        <!-- Berkas -->
    </div>
    <br /><br /><br />
</div>