$(document).ready(function () {
	table = $('#list_aksi').DataTable({
		"processing": true,
		"serverSide": true,
		"order": [],

		"ajax": {
			"url": baseUrl + 'admin/aksi/data',
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
	// $("#id_upk").val(upk)
})

$('#list_aksi').on('click', '#edit', function () {
	let id = $(this).data('id');
	$.ajax({
		url: baseUrl + 'admin/aksi/get/' + id,
		type: "GET",
		success: function (result) {
			response = JSON.parse(result)
			$("#idData").val(response.id)
			$("#kode_aksi1").val(response.kode_aksi)
			$("#aksi1").val(response.aksi)
			$("#keterangan1").val(response.keterangan)
			$("#modalEdit").modal('show')
		},
		error: function (error) {
			errorCode(error)
		}
	})
})

$('#list_aksi').on('click', '#delete', function () {
	let id = $(this).data('id');
	confirmSweet("Data akan terhapus secara permanen !")
		.then(result => {
			if (result) {
				$.ajax({
					url: baseUrl + 'admin/aksi/delete/' + id,
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

$("#formAddAksi").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: baseUrl + "admin/aksi/insert",
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
				$("#id_upk").val(upk)
			}
		},
		error: function (event) {
			errorCode(event)
		}
	});
})

$("#formEditAksi").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: baseUrl + "admin/aksi/update",
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