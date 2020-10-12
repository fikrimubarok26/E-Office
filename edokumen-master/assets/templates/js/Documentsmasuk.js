
function PageAksesDokumen(page = 1, id = '') {
    let data = { page: page };
    if (id != '') data.id = id;
    $.ajax({
        url: baseUrl + 'dokumen-masuk/getaksesdocument',
        data: data,
        type: 'GET',
        dataType: 'json',
        beforeSend: function () {
            $('#ticket-items').html(LoadingDokumenMasuk());
        },
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
        },
    }).done(function (response) {
        if (response.status_code == 200) {
            if (response.row_count > 0) {
                $('#ticket-items').html(DisplayDokumenMasuk(response.data));

            }
        }
        else
            pesan(response.message);
    });
}

$('.item-dokumen-masuk').on('click', function (evt) {
    $('.item-dokumen-masuk').removeClass('bg-light');
    $(this).addClass('bg-light');
});

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

function DisplayDokumenMasuk(data) {
    let html = '';
    for (let x = 0; x < data.length; x++) {
        html += `
        <div class="ticket-item active">
            <div class="ticket-title">
                <h4>${data[x]['judul']}</h4>
            </div>
            <div class="ticket-desc">
                <div>${data[x]['nama_user']}</div>
                <div class="bullet"></div>
                <div>${data[x]['nama_jenis']}</div>
            </div>
        </div>
        `;
    }

    return html;
}

$('.item-dokumen-masuk').on('click', function (evt) {
    const ID = $(this).data('id');
    const index = $('.item-dokumen-masuk').index(this);
    $.ajax({
        url: url + 'dokumen-masuk/detaildokumenmasuk',
        data: { id: ID },
        type: 'GET',
        dataType: 'json',
        beforeSend: function () {
            $('#content-dokumen').addClass('bg-light');
            $('#content-dokumen').css('opacity', '0.6');

            const loading = `
            <br/><br/><br/><r/>
            <div class="w-100 mt-5 text-center">
                <div class="spinner-border  text-primary " style="width: 4.4rem; height: 4.4rem;"  role="status">
                    <span class="sr-only">Tunggu sebentar</span>
                </div>
                <div class='nunito-500 text-size-9 text-muted mt-3'>Tunggu sebentar</div>    
            </div>`;
            $('#content-dokumen').html(loading);
        },
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
        },
    }).done(function (response) {
        if (response.status_code == 200) {
            if (response.row_count > 0) {
                const tanggal = $('.tgl-docmasuk').eq(index).text()
                $('#content-dokumen').html(DisplayDocumentMasuk(response.data, tanggal));
                $('#content-dokumen').removeClass('bg-light');
                $('#content-dokumen').css('opacity', '1');
            }
        }
        else
            pesan(response.message);
    });
});

function DisplayDocumentMasuk(data, tanggal) {
    let html = '';
    for (let x = 0; x < data.length; x++) {
        html += `
            <div class="ticket-header mt-4">
                <div class="ticket-sender-picture img-shadow">
                    <i class="far fa-file-alt" style="font-size:50px"></i>
                </div>
                <div class="ticket-detail">
                    <div class="ticket-title">
                        <h4>${data[x]['judul']}</h4>
                    </div>
                    <div class="ticket-info">
                        <div class="font-weight-600"> ${data[x]['judul']}</div>
                        <div class="bullet"></div>
                        <div class="text-primary font-weight-600"><i class="far fa-clock"></i>
                            ${tanggal}</div>
                    </div>
                </div>
            </div>
    <div class="ticket-description">
        <p class="text-justify">${data[x]['desc']}</p>

        <a target='_blank' title='${data[x]['judul']}' href="${url + 'upload/documents/' + data[x]['ori_file']}"
            class="btn btn-primary nunito-700 float-right" id='btn-show-file'><i  class="far fa-file-alt"></i>
            Unduh file</a>
    </div>`;

    }
    return html;
}

$('#content-dokumen').on('click', '#btn-show-file', function (evt) {
    evt.preventDefault();
    const href = $(this).attr('href');
    const title = $(this).attr('title');
    $(this).fireModal({
        size: 'modal-lg',
        title: title,
        body: `
    <embed src="${href}" style="width:100%; height:500px;" 
    type="application/pdf">
    ` });

})