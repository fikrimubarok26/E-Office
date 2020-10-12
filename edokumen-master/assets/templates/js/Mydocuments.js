PageJenis(1);
PageFile(localStorage.getItem('page-documents') == null ? 1 : localStorage.getItem('page-documents'));
const TampungSelected = [];
var jenis = '';
var search = '';
var offset = 10;
var user = '';
$('#page-now').text(localStorage.getItem('page-documents') == null ? 1 : localStorage.getItem('page-documents'));
$('#pagination').on('click', 'a', function (evt) {
    evt.preventDefault();
    const page = $(this).attr('data-ci-pagination-page');
    PageFile(page, jenis, search, offset, user);
    localStorage.setItem('page-documents', page);
    $('#page-now').text(page);
})
$('input[name=q]').on('keyup', function (evt) {
    const q = $(this).val();
    search = q;
    PageFile(1, jenis, search, offset, user);
})
$('.show-data').on('click', function (evt) {
    const val = $(this).attr('data-val');
    offset = val;
    PageFile(1, jenis, '', offset, user);
})
function PageFile(page = 1, jenis = '', q = '', offset = 10, user = '') {
    let data = { page: page };
    if (q != '') data.q = q;
    if (jenis != '') data.jenis = jenis;
    if (offset != '') data.offset = offset;
    if (user != '') data.user = user;

    $.ajax({
        url: baseUrl + 'dokumen-saya/getfile',
        data: data,
        type: 'GET',
        dataType: 'json',
        beforeSend: function () {
            $('#Data').html(LoadingFile());
        },
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
        },
    }).done(function (response) {
        if (response.status_code == 200) {
            if (response.row_count > 0) {
                $('#Data').html(DisplayDataFile(response.data));
                $('#pagination').html(response.pagination);
                GetChecked();
            }
            else
                $('#Data').html(EmptyData('Data belum tersedia'));

            $('#total-page').text(Math.ceil(response.row_count / offset == 0 ? 1 : response.row_count / offset));
            $('#total-data').text(Math.ceil(response.row_count));
            $('#page-now').text(page);

        }

        else
            pesan(response.message);
    });
}

function PageJenis(page = 1, id = '') {
    let data = { page: page };
    if (id != '') data.id = id;
    $.ajax({
        url: baseUrl + 'dokumen-saya/getjenis',
        data: data,
        type: 'GET',
        dataType: 'json',
        beforeSend: function () {
            $('#jenis-file').html(LoadingJenis());
        },
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
        },
    }).done(function (response) {
        if (response.status_code == 200) {
            if (response.row_count > 0) {
                $('#jenis-file').html(DisplayDataJenis(response.data));

            }
        }
        else
            pesan(response.message);
    });
}

function EmptyData(message) {
    return `
        <tr>
            <td colspan='6' class='text-center nunito-500'>${message}</td>
        </tr>
    `;
}

function LoadingJenis() {
    let html = '';
    for (let x = 0; x < 10; x++) {
        html += `
        <div class="ph-item m-0 p-0" style="border:0px solid transparent;">
            <div class="ph-row">
                <div class="ph-col-12"></div>
            </div>
        </div><br/>`;
    }
    return html;
}

function LoadingFile() {
    let html = '';
    for (let x = 0; x < 10; x++) {
        html += `
        <tr>
        <td>
            <div class="ph-item m-0 p-0" style="background:transparent; border:0px solid transparent;" >
                <div class="ph-row">
                    <div class="ph-col-12"></div>
                </div>
            </div>
        </td>
            <td>
                <div class="ph-item m-0 p-0" style="background:transparent; border:0px solid transparent;" >
                    <div class="ph-row">
                        <div class="ph-col-12"></div>
                    </div>
                </div>
            </td>

            <td>
                <div class="ph-item m-0 p-0" style="background:transparent; border:0px solid transparent;" >
                    <div class="ph-row">
                        <div class="ph-col-12"></div>
                    </div>
                </div>
            </td>
            <td>
                <div class="ph-item m-0 p-0" style="background:transparent; border:0px solid transparent;" >
                    <div class="ph-row">
                        <div class="ph-col-12"></div>
                    </div>
                </div>
            </td>
            <td>
                <div class="ph-item m-0 p-0" style="background:transparent; border:0px solid transparent;" >
                    <div class="ph-row">
                        <div class="ph-col-12"></div>
                    </div>
                </div>
            </td>
            <td>
                <div class="ph-item m-0 p-0" style="background:transparent; border:0px solid transparent;" >
                    <div class="ph-row">
                        <div class="ph-col-12"></div>
                    </div>
                </div>
            </td>    
 
            </tr>
        `;
    }
    return html;
}

function ClearAll() {
    localStorage.clear();
    $('#counter-selected').html('');
    $('.fab').css('display', 'none');
    $('.MYbounce').hide();
    $('#tampung-input').val('');
    TampungSelected.splice(0, TampungSelected.length)

}
function DisplayDataFile(data) {
    let html = '';
    let ExplodeTglMulai = '', GetDays = '', GetDate = '', GetMonths = '', GetYear = '', TanggalPembelian = '';
    let id = '';

    for (let x = 0; x < data.length; x++) {
        id = Encode(String(data[x]['id']), 4);
        judul = data[x]['judul'];
        if (judul.length > 35)
            judul = data[x]['judul'].substr(0, 35).trim() + '...';
        html += `
            <tr>
                <td class="text-center  pl-3 pr-0 item-td" style="width:20px">
                <label class='pure-material-checkbox'>
                    <input type='checkbox' disabled class='subSelect' ${$('#' + id).length > 0 ? 'checked' : ''} name='SelectDocumentX[]'
                        value="${id}" ${TampungSelected.includes(id) == true ? 'checked' : ''}>
                    <span></span>
                </label>
                </td>
                <td class="nunito-400 py-2 item-td">
                    <div class="d-flex justify-content-start">
                        <div class="pt-2">
                            <i class="far fa-file" style="font-size:19px"></i>
                        </div>
                        <div class="ml-3">
                            <span class='pt-2'>
                                <a target='_blank' title='${data[x]['judul']}' class='nunito-700 text-primary text-size--1' onclick='event.stopPropagation()' href='${url + 'upload/documents/' + data[x]['ori_file']}'>${judul}</a>
                            </span><br />
                            <span class="text-size---1 nunito-700">${data[x]['file_size']}</span>
                        </div>
                    </div>

                </td class=" item-td">
                <td class="nunito-400 item-td text-size---1">${data[x]['last_update']}</td>
                <td class="nunito-400 item-td text-center text-size---1">${data[x]['tipe_file']}</td>
                <td class="nunito-700 item-td text-center text-size---1">${data[x]['akses_file'] == '' ? '<span class="text-success">Public</span>' : '<span class="text-info">Private</span>'}</td>
                <td class="nunito-400 item-td">
                    <div class="dropdown" >
                        <a href="#" data-toggle="dropdown" aria-expanded="true"><i
                                class="fas fa-ellipsis-h text-dark"></i></a>
                        <ul class="dropdown-menu dropdown-menu-sm dropdown-menu-right" x-placement="bottom-end"
                            style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-124px, 31px, 0px);">
                            <li class="item-options"><a href='${url + 'upload/documents/' + data[x]['ori_file']}' target='_blank' class="dropdown-item options" data-option='lihat'><i class="far fa-eye"></i> Lihat</a></li>
                            <li class="item-options"><a href="#" data-id='${id}' id='ubah-${id}' class="dropdown-item options" data-option='ubah-nama'><i class="far fa-edit"></i> Ubah nama</a></li>
                            <li class="item-options"><a href="#" data-id='${id}' id='save-${id}' class="dropdown-item options" data-option='unduh'><i class="far fa-save"></i> Unduh</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        `;
    }
    GetChecked();
    return html;
}


function DisplayDataJenis(data) {
    let html = `
    <li class="nav-item text-size-3" data-id=''>
        <a class="nav-link m-0 pl-0 pb-2 nunito-700 btn-jenis text-link" id='ALL' data-toggle="tab" href="#home4" role="tab" aria-controls="home"
            aria-selected="false"><i class="far fa-folder text-size-3"></i> Semua Jenis</a>
    </li>
    `;
    for (let x = 0; x < data.length; x++) {
        html += `
        <li class="nav-item text-size-3" data-id='${Encode(String(data[x]['id']), 3)}'>
            <a class="nav-link m-0 pl-0 pb-2 nunito-700 btn-jenis"  data-toggle="tab" href="#home4" role="tab" aria-controls="home"
                aria-selected="false"><i class="far fa-folder text-size-3"></i> ${data[x]['nama_jenis']}</a>
        </li>
        
        `;
    }

    return html;
}

function RemoveModal() {
    if ($('.modal').length >= 1) {
        $('.modal:not(first-child)').remove();
    }

}

function UbahNama(ID, index) {
    $(`#ubah-${ID}`).fireModal({
        body: `<div class="w-100 text-center"><span style='margin-bottom:2px; display:inline-block' class='spinner-border spinner-border-md' role='status' aria-hidden='true'></span><br/> </div>`,
        title: '<span class="inter-600 "><i class="far fa-edit"></i> Ubah nama file</span>',
        size: 'modal-md',
        center: true,
        created: function (modal) {
            $.ajax({
                url: url + 'dokumen-saya/getfilename',
                data: { id: ID },
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response.status_code == 200) {
                        const html = `
                        <form action='${url + 'dokumen-saya/storeubah'}' action='POST' autocomplete='off' id='StoreUbah'>
                            <input type='hidden' name='id' readonly  value='${ID}'>
                            <input type='text' class='form-control' name='nama' value='${response.data.collections}'>
                            <div class="text-danger mt-1 nunito-400 text-size--1" id='__nama'></div>
                            <br/>
                            <button class="btn btn-light float-right" name='btn-update'><i class="far fa-edit"></i> Ubah</button>
                        </form>`;
                        modal.find('.modal-body').html(html);
                        modal.find('.modal-footer').html(html);
                    } else
                        pesan(response.message);
                }
            })


        },

    });
}

// update 
$(document).delegate('#StoreUbah', 'submit', function (evt) {
    evt.preventDefault();
    const Data = new FormData(this);
    Data.append(CsrfTokenName(), CsrfTokenValue());
    const Tmp = $(this).serializeArray();
    // console.log(Tmp);
    const Validation = ValidationEmpty(Tmp);
    if (Validation == false)
        return false;

    // kalau lulus validasi
    $.ajax({
        url: url + 'dokumen-saya/storeupdate',
        type: 'POST',
        data: Data,
        dataType: 'json',
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('button[name=btn-update]').html(LoadingButton('on', '', 'btn-update'));
        },
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
            $('button[name=btn-update]').html(LoadingButton('off', `<i class="far fa-edit"></i> Ubah`, 'btn-update'));
        },
    }).done(function (response) {
        ResetToken(response.token);
        if (response.status == 200) {
            pesan(response.message);
            $('.modal').remove();
            $('.modal-backdrop').remove();
            PageFile(localStorage.getItem('page-documents') == null ? 1 : localStorage.getItem('page-documents'));
            $('body').removeClass('modal-open');
        }
        else {
            $('.modal').removeClass('show');
            $('.modal-backdrop').removeClass('show');
            pesan(response.message);
        }
        $('button[name=btn-update]').html(LoadingButton('off', `<i class="far fa-edit"></i> Ubah`, 'btn-update'));

    });
})
// OPTION UBAH NAMA
$('#Data').on('click', '.dropdown-item.options', function (evt) {
    const options = $(this).attr('data-option');
    const ID = $(this).attr('data-id');
    const index = $(this).parent().parent().parent().parent().parent().index();
    RemoveModal();
    if (options == 'ubah-nama')
        UbahNama(ID, index);
    else if (options == 'unduh') {
        Unduh(ID);
    }
});

function Unduh(id) {
    document.location = url + 'dokumen-saya/unduh-file?file=' + id
}

$('#Data').on('click', 'tr td.item-td:not(:last-child)', function (evt) {
    const index = $(this).parent().index();
    const checkbox = $('.subSelect').eq(index);
    const ID = checkbox.val();
    if (checkbox.is(':checked') == false) {
        checkbox.attr('checked', 'true');
        TampungSelected.push(ID);
        $('#tampung-input').val(TampungSelected.join(','));
        // console.log(TampungSelected.includes(''))
    }
    else {
        const IndexElement = TampungSelected.indexOf(ID);
        if (IndexElement > -1)
            TampungSelected.splice(IndexElement, 1);

        $(`#tampung-input`).val(TampungSelected);
        checkbox.removeAttr('checked');
    }

    GetChecked();
})


function GetChecked() {
    const Selected = $('.subSelect:checked').length;
    const Select = $('.subSelect').length;
    if (Selected == Select && Selected > 0)
        $('#SelectAll').prop('checked', true);
    else {
        $('#SelectAll').prop('checked', false);
    }
    GetSelected();
}

function GetSelected() {
    const GetSelected = TampungSelected.length;
    if (GetSelected > 0) {
        $('#counter-selected').html(GetSelected);
        $('.MYbounce').show();
        $('.fab').css('display', 'block');
    } else {
        $('.fab').css('display', 'none');
        $('.MYbounce').hide();
    }

    if (GetSelected == 1)
        $(".MYbounce").effect("bounce", { times: 2 }, 100);


}

$('#SelectAll').on('change', function (evt) {
    const checkbox = $(this);
    const checked = checkbox.is(':checked');
    const select = $('.subSelect');
    let IndexElement = '';
    if (checked == true) {
        const GetNotSelected = $('.subSelect');
        for (let x = 0; x < GetNotSelected.length; x++) {
            if (GetNotSelected.eq(x).is(':checked') == false) {
                TampungSelected.push(GetNotSelected.eq(x).val());
                GetNotSelected.eq(x).attr('checked', 'true');
            }
        }
        $('#tampung-input').val(TampungSelected);
    }
    else {
        const GetChecked = $('.subSelect:checked');
        for (let x = 0; x < GetChecked.length; x++) {
            IndexElement = TampungSelected.indexOf(GetChecked.eq(x).val());
            if (IndexElement > -1)
                TampungSelected.splice(IndexElement, 1);
            $(`#tampung-input`).val(TampungSelected);

        }
        select.removeAttr('checked');
    }

    GetChecked();
})

$('#jenis-file').on('click', '.nav-item', function (evt) {
    const data = $(this).attr('data-id');
    const index = $('#jenis-file .nav-item').index(this);
    $('#jenis-file .nav-item .nav-link').removeClass('text-link');
    $('#jenis-file .nav-item .nav-link').eq(index).addClass('text-link');

    ClearAll();
    PageFile(1, data, '', 10, user);
    jenis = data;
});

// $('.icon-th').on('click', function (evt) {
//     const index = $('.icon-th').index(this);
//     const val = $(this).data('filter');
//     if (index == 0) // filter nama
//         FilterNama(val);
//     else if (index == 1)
//         FilterTanggal(val);
//     else if (index == 2)
//         FilterTipe(val);
//     else if (index == 3)
//         FilterAkses(val);
//     else
//         pesan('Filter Tidak diketahui');
// });

// function FilterNama(val) {   
//     if (filter == 'up')
// }


$(document).ready(function () {
    $('#select2-user').select2();
});

$('#select2-user').on('change', function (evt) {
    const val = $(this).val();
    user = val;
    PageFile(1, jenis, search, offset, user)
});