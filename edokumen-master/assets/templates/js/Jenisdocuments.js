
PageJenisDokumen(localStorage.getItem('page-jenis-documents') == null ? 1 : localStorage.getItem('page-jenis-documents'));
const TampungSelected = [];
var offset;
var search = '';
$('#page-now').text(localStorage.getItem('page-jenis-documents') == null ? 1 : localStorage.getItem('page-jenis-documents'));
$('#pagination').on('click', 'a', function (evt) {
    evt.preventDefault();
    const page = $(this).attr('data-ci-pagination-page');
    PageJenisDokumen(page, search, offset);
    localStorage.setItem('page-jenis-documents', page);
    $('#page-now').text(page);
})
$('input[name=q]').on('keyup', function (evt) {
    const q = $(this).val();
    search = q;
    PageJenisDokumen(1, q, offset);
})
$('.show-data').on('click', function (evt) {
    const val = $(this).attr('data-val'); // ambil tampilkan data [5,10,25,50,100, ...]
    offset = val; // simpan ke variabel global
    PageJenisDokumen(1, search, offset); // set halamannya
})
function PageJenisDokumen(page = 1, q = '', offset = 10) {
    let data = { page: page };
    if (page <= 0) { data.page = 1; }
    if (q != '') data.q = q;
    if (offset != '') data.offset = offset;

    $.ajax({
        url: baseUrl + 'jenis-dokumen/get',
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

            const PageReduce = Math.ceil(response.row_count / offset);
            $('#total-page').text(Math.ceil(PageReduce == 0 ? 1 : PageReduce));
            $('#total-data').text(Math.ceil(response.row_count));
            $('#page-now').text(page);

            if (page > PageReduce) {
                localStorage.setItem('page-jenis-documents', PageReduce);
                PageJenisDokumen(PageReduce, q, offset);
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
            </tr>
        `;
    }
    return html;
}

function DisplayDataFile(data) {
    let html = '';
    let ExplodeTglMulai = '', GetDays = '', GetDate = '', GetMonths = '', GetYear = '', TanggalPembelian = '';
    let id = '';

    for (let x = 0; x < data.length; x++) {
        id = Encode(String(data[x]['id']), 4);
        html += `
            <tr>
                <td class="text-center  pl-3 pr-0 item-td" style="width:20px">
                <label class='pure-material-checkbox'>
                    <input type='checkbox' disabled class='subSelect' ${$('#' + id).length > 0 ? 'checked' : ''} name='SelectDocumentX[]'
                        value="${id}" ${TampungSelected.includes(id) == true ? 'checked' : ''}>
                    <span></span>
                </label>
                </td>
                <td class="nunito-400 item-td text-size-2">${data[x]['nama_jenis']}</td>
                <td class="nunito-400 item-td">
                    <div class="dropdown" >
                        <a href="#" data-toggle="dropdown" aria-expanded="true"><i
                                class="fas fa-ellipsis-h text-dark"></i></a>
                        <ul class="dropdown-menu dropdown-menu-sm dropdown-menu-right" x-placement="bottom-end"
                            style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-124px, 31px, 0px);">
                            <li class="item-options"><a href="#" data-id='${id}' id='ubah-${id}' class="dropdown-item options" data-option='ubah'><i class="far fa-edit"></i> Ubah</a></li>
                            <li class="item-options"><a href="#" data-id='${id}' id='hapus-${id}' class="dropdown-item options" data-option='hapus'><i class="far fa-trash-alt text-size-5" style="margin-left:0px;"></i> Hapus</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
        `;
    }
    GetChecked();
    return html;
}

function RemoveModal() {
    if ($('.modal').length >= 1) {
        $('.modal:not(first-child)').remove();
    }

}

function Ubah(ID) {
    $(`#ubah-${ID}`).fireModal({
        body: `<div class="w-100 text-center"><span style='margin-bottom:2px; display:inline-block' class='spinner-border spinner-border-md' role='status' aria-hidden='true'></span><br/> </div>`,
        title: '<span class="inter-600 "><i class="far fa-edit"></i> Ubah Jenis Dokumen</span>',
        size: 'modal-md',
        center: true,
        created: function (modal) {
            $.ajax({
                url: url + 'jenis-dokumen/get',
                data: { id: ID },
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response.status_code == 200) {
                        if (response.row_count > 0 && response.row_count == 1) {

                            const html = `
                        <form action='${url + 'jenis-dokumen/storeubah'}' action='POST' autocomplete='off' id='StoreUbah'>
                            <input type='hidden' name='id' readonly  value='${ID}'>
                            <input type='text' class='form-control' name='nama' value='${response.data[0].nama_jenis}'>
                            <div class="text-danger mt-1 nunito-400 text-size--1" id='__nama'></div>
                            <br/>
                            <button class="btn btn-light float-right" name='btn-update'><i class="far fa-edit"></i> Ubah</button>
                        </form>`;
                            modal.find('.modal-body').html(html);
                            modal.find('.modal-footer').html(html);
                        } else pesan('Jenis dokumen yang anda minta tidak ditemukan');

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
        url: url + 'jenis-dokumen/storeupdate',
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
            PageJenisDokumen(localStorage.getItem('page-jenis-documents') == null ? 1 : localStorage.getItem('page-jenis-documents'));
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
    evt.preventDefault();
    const options = $(this).attr('data-option');
    const ID = $(this).attr('data-id');
    // const index = $(this).parent().parent().parent().parent().parent().index()/;
    RemoveModal();
    if (options == 'ubah')
        Ubah(ID);
    else if (options == 'hapus') {
        Hapus(ID);
        ClearAll();
    }
});

function ClearAll() {
    localStorage.clear();
    $('#counter-selected').html('');
    $('.fab').css('display', 'none');
    $('.MYbounce').hide();
    $('#tampung-input').val('');
    TampungSelected.splice(0, TampungSelected.length)

}

function Hapus(ID) {
    const Data = { [CsrfTokenName()]: CsrfTokenValue() };
    Data.id = ID;
    // console.log(Data);
    $.ajax({
        url: url + 'jenis-dokumen/hapus',
        type: 'POST',
        data: Data,
        dataType: 'json',
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
        },
    }).done(function (response) {
        ResetToken(response.token);
        if (response.status == 200) {
            pesan(response.message);
            PageJenisDokumen(localStorage.getItem('page-jenis-documents') == null ? 1 : localStorage.getItem('page-jenis-documents'), '', offset);
        }
        else
            pesan(response.message);
    });
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
    // console.log(TampungSelected);
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