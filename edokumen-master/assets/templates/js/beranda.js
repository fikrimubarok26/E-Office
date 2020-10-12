$('#upk').on('click', function (evt) {

    $('#__MAINTENANCE').addClass('d-none');
    $('#__UPK').removeClass('d-none');
})

$('#maintenance').on('click', function (evt) {
    $('#__MAINTENANCE').removeClass('d-none');
    $('#__UPK').addClass('d-none');
})
