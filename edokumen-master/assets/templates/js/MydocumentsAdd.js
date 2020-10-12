$('#customFile').change(function (evt) {
    const val = $(this);
    let TampungFile = val.val().split('\\');
    let FileName = TampungFile[(TampungFile.length - 1)];
    if (val[0].files.length > 1)
        FileName = val[0].files.length + ' Berkas dipilih';

    if (FileName.length > 19)
        $('#nameFile').html(FileName.substr(0, 19) + '..');
    else
        $('#nameFile').html(FileName);

});

$('#is_public').on('change', function (evt) {
    const checked = $(this).is(':checked');
    if (checked == false)
        AksesPublic();
    else {
        $('#AksesPublic').html('');
        $('#ListBagian').html('');
    }
})

function LoadingDocument() {
    return `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>`;
}

function AksesPublic() {
    $.ajax({
        url: url + 'dokumen-saya/getakses',
        type: 'GET',
        dataType: 'json',
        beforeSend: function () {
            $('#AksesPublic').html(LoadingDocument());
        },
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
        },
    }).done(function (response) {
        if (response.status_code == 200) {
            if (response.row_count > 0)
                $('#AksesPublic').html(DisplayDataDocuments(response.data));
        }
        else
            pesan(response.message);
    });
}

function DisplayDataDocuments(data) {
    let html = '<label>Dikirim ke :</label><div class="row">';
    let id = '';
    for (let x = 0; x < data.length; x++) {
        id = Encode(data[x]['id'], 3);
        html += `        
            <div class="col-lg-4">`;
        if (data[x]['jumlah_jabatan'] > 0) {
            html += `<label class='pure-material-checkbox text-size--1'>
                        <input type='checkbox' class='subSelect' name='SelectUpk[]' value="${id}">
                            <span class="NamaUpk">${capitalize(data[x]['upk'].toLowerCase())}</span>
                     </label>
                    <div class='mb-2' id='__SelectUpk-${id}'></div>
                     `;
        } else {
            html += `<label>${capitalize(data[x]['upk'].toLowerCase())}</label>`;
        }

        html += `</div>`;
    }
    html += '</div>';
    return html;
}

$('#AksesPublic').on('change', '.subSelect', function (evt) {
    const checked = $(this);
    const index = $('#AksesPublic .subSelect').index(this);
    if (checked.is(':checked') == true) {
        const val = $('.NamaUpk').eq(index).text();
        const html = `
            <div div class="row" id = '${checked.val()}' >
                <div class="col-lg-12">
                    <div class="form-group mb-2">
                        <label>Jabatan ${val}</label>
                        <input type="text" id="input-${checked.val()}" class="users-list" name="jabatan[${checked.val()}]" placeholder="Pilih Jabatan" >
                    </div>
                    <div class="mb-2 text-danger nunito-500" id="__jabatan-${checked.val()}"></div>
                    </div>
                </div>

                <input type='hidden' name='tampungjabatan[${checked.val()}]' id="id-${checked.val()}">
                    `;
        $('#ListBagian').append(html);
        masukinTag(`#input-${checked.val()}`, 'getjabatan', { id: checked.val() });
        ChangeInputJabatan(checked.val());
    }
    else
        $(`#${checked.val()}`).remove();
})

function ChangeInputJabatan(id) {
    $('#ListBagian').on('change', `#input-${id}`, function (evt) {
        const DecodeData = JSON.parse($(this).val());
        let tampung = [];
        for (let x = 0; x < DecodeData.length; x++) {
            tampung[x] = DecodeData[x].value;
        }
        $(`#id-${id}`).val(tampung.join(','));
    });
}

function masukinTag(input, getNa, data = '') {
    (function () {
        var dataNa = [];
        var inputElm = document.querySelector(input);

        function tagTemplate(tagData) {
            return `
                <tag title="${tagData.name}"
                        contenteditable='false'
                        spellcheck='false'
                        tabIndex="-1"
                        class="tagify__tag ${tagData.class ? tagData.class : ""}"
                        ${this.getAttributes(tagData)}>
                    <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
                    <div>
                        <div class='tagify__tag__avatar-wrap'>
                            <img src="${url}/assets/img/icon.png">
                        </div>
                        <span class='tagify__tag-text'>${tagData.name}</span>
                    </div>
                </tag>
            `
        }

        function suggestionItemTemplate(tagData) {
            return `
                <div ${this.getAttributes(tagData)}
                    class='tagify__dropdown__item ${tagData.class ? tagData.class : ""}'
                    tabindex="0"
                    role="option">
                    ${ url + `/assets/img/icon.png` ? `
                    <div class='tagify__dropdown__item__avatar-wrap'>
                        <img src="${url}/assets/img/icon.png">
                    </div>` : ''
                }
                    <strong>${tagData.name}</strong>
                    
                </div>
            `
        }

        $.ajax({
            dataType: "json",
            url: url + `dokumen-saya/${getNa}`,
            type: 'GET',
            data: data,
            success: function (result) {
                result.forEach(element => {
                    dataNa.push({
                        'value': element.value,
                        'name': element.name
                    })
                });
            }
        })
        // initialize Tagify on the above input node reference
        var tagify = new Tagify(inputElm, {
            enforceWhitelist: true,
            skipInvalid: true, // do not remporarily add invalid tags
            dropdown: {
                closeOnSelect: false,
                enabled: 0,
                classname: 'users-list',
                searchKeys: ['name'] // very important to set by which keys to search for suggesttions when typing
            },
            templates: {
                tag: tagTemplate,
                dropdownItem: suggestionItemTemplate
            },
            whitelist: dataNa
        })



        tagify.on('dropdown:show dropdown:updated', onDropdownShow)
        tagify.on('dropdown:select', onSelectSuggestion)

        var addAllSuggestionsElm;

        function onDropdownShow(e) {
            var dropdownContentElm = e.detail.tagify.DOM.dropdown.content;

            if (tagify.suggestedListItems.length > 1) {
                addAllSuggestionsElm = getAddAllSuggestionsElm();

                // insert "addAllSuggestionsElm" as the first element in the suggestions list
                dropdownContentElm.insertBefore(addAllSuggestionsElm, dropdownContentElm.firstChild)
            }
        }

        function onSelectSuggestion(e) {
            if (e.detail.elm == addAllSuggestionsElm)
                tagify.dropdown.selectAll.call(tagify);
        }

        // create a "add all" custom suggestion element every time the dropdown changes
        function getAddAllSuggestionsElm() {
            // suggestions items should be based on "dropdownItem" template
            return tagify.parseTemplate('dropdownItem', [{
                class: "addAll",
                name: "Pilih semua",
                email: tagify.settings.whitelist.reduce(function (remainingSuggestions, item) {
                    return tagify.isTagDuplicate(item.value) ? remainingSuggestions : remainingSuggestions + 1
                }, 0) + " Members"
            }])
        }
    })()
}

// alert(CsrfTokenName);

$('#StoreDokumen').submit(function (evt) {
    evt.preventDefault();
    const data = new FormData(this);
    const Tmp = $(this).serializeArray();
    // console.log(Tmp);
    const Validation = ValidationEmpty(Tmp, ['tampungjabatan[]']);
    let flag = 0;
    if (Validation == false)
        flag++;

    // khusus 
    if ($('#customFile').val() == '') {
        $('#__customFile').html('*) kolom tidak boleh kosong');
        flag++;
    } else
        $('#__customFile').html('');

    if (flag != 0)
        return false;

    // kalau lulus validasi
    data.append(CsrfTokenName(), CsrfTokenValue());
    $.ajax({
        url: url + 'dokumen-saya/store',
        data: data,
        type: 'POST',
        dataType: 'json',
        processData: false,
        contentType: false,
        error: function (jqXHR, exception) {
            pesan(ErrorLog(jqXHR, exception));
            LoadingButton('on', '', 'save')
        },
        beforeSend: function () {
            LoadingButton('on', '', 'save')
        },

    }).done(function (response) {
        ResetToken(response.token);
        if (response.status != 200)
            pesan(response.message);
        else {
            pesan(response.message);
        }
        LoadingButton('off', `<i class="far fa-save"></i> Simpan`, 'save')
    })

});

