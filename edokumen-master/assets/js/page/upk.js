$(document).ready(function () {

	// const socketIoAddress = `ws:office-tasik.herokuapp.com:8080`;
	// const socket = io(socketIoAddress);
	// // socket = io.connect()
	// console.log(socket);
	// socket.emit('reload-table');

	table = $('#list_upk').DataTable({
		"processing": true,
		"serverSide": true,
		"order": [],

		"ajax": {
			"url": baseUrl + 'admin/upk/data',
			"type": "POST",
			"error": function (error) {
				errorCode(error)
			}
		},

		"columnDefs": [{
				"sClass": "text-center",
				"targets": [0],
				"orderable": false
			},
			{
				"targets": [1],
				"orderable": true
			},
			{
				"targets": [2],
				"orderable": true
			},
			{
				"sClass": "text-center",
				"targets": [4],
				"orderable": false
			}
		],
	});
	getPegawai()
})

$('#list_upk').on('click', '#edit', function () {
	let id = $(this).data('id');
	$.ajax({
		url: baseUrl + 'admin/upk/get/' + id,
		type: "GET",
		success: function (result) {
            response = JSON.parse(result)
            $("#idData").val(response.id)
            $("#kode_upk1").val(response.kode_upk)
            $("#upk1").val(response.upk)
            $("#ketua_upk1").val(response.ketua_upk)
            $("#keterangan1").val(response.keterangan)
			$("#modalEdit").modal('show')
		},
		error: function (error) {
			errorCode(error)
		}
	})
})

$('#list_upk').on('click', '#delete', function () {
	let id = $(this).data('id');
	confirmSweet("Data akan terhapus secara permanen !")
    .then(result => {
        if (result) {
            $.ajax({
                url: baseUrl + 'admin/upk/delete/' + id,
                type: "GET",
                success: function (result) {
                    response = JSON.parse(result)
                    if (response.status == 'ok') {
                        table.ajax.reload(null, false)
                        // msgSweetSuccess(response.msg)
                        toastSuccess(response.msg)
                    } else {
                        // msgSweetWarning(response.msg)
                        toastWarning(response.msg)
                    }
                },
                error: function (error) {
                    errorCode(error)
                }
            })
        }
    })
})

$("#formAddUpk").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: baseUrl + "admin/upk/insert",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		beforeSend: function () {
			disableButton()
		},
		complete: function () {
			enableButton()
		},
		success: function (result) {
			let response = JSON.parse(result)
			if (response.status == "fail") {
				msgSweetError(response.msg)
			} else {
                table.ajax.reload(null, false)
				toastSuccess(response.msg)
				clearInput($("input"))
			}
		},
		error: function (event) {
			errorCode(event)
		}
	});
})

$("#formEditUpk").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: baseUrl + "admin/upk/update",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		beforeSend: function () {
			disableButton()
		},
		complete: function () {
			enableButton()
		},
		success: function (result) {
			let response = JSON.parse(result)
			if (response.status == "fail") {
                // msgSweetError(response.msg)
                clearInput($("input"))
                $("#modalEdit").modal('hide')
			} else {
				table.ajax.reload(null, false)
				toastSuccess(response.msg)
                clearInput($("input"))
                $("#modalEdit").modal('hide')
			}
		},
		error: function (event) {
			errorCode(event)
		}
	});
})

function getPegawai() {
	$('#ketua_upk').find('option').remove().end()
	$('#ketua_upk').append("<option value=''> -- Pilih Ketua -- </option>");
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/upk/getPegawai",
		success: function (result) {
			console.log(result);
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#ketua_upk').append("<option value=" + item.id + ">" + item.nama_user + "</option>");
			})
		}
	})
	
	$('#ketua_upk1').find('option').remove().end()
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/upk/getPegawai",
		success: function (result) {
			console.log(result);
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#ketua_upk1').append("<option value=" + item.id + ">" + item.nama_user + "</option>");
			})
		}
	})
}
