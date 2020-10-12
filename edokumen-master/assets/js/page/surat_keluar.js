var nomorSurat;

$(document).ready(function () {
	tampilData()
	getJenis()
	getAksi()
	getSifat()
	nomorSurat()
	getJabatan()
	getCurUpk()
})

function tampilData() {
	var statusPengiriman = $("#statusPengiriman").val();
	try {
		table.destroy()
	} catch (error) {
		
	}
	table = $('#list_surat').DataTable({
		"processing": true,
		"serverSide": true,
		"order": [],

		"ajax": {
			"url": baseUrl + 'admin/surat/keluar/aksi/data',
			"type": "POST",
			"data": {
				'tipeKirim': 0,
				'statusPengiriman': statusPengiriman
			},
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
				"orderablegetJabatan": true
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
}

$("#statusPengiriman").on('change', function(){
	tampilData();
})

$('#list_surat').on('click', '#edit', function () {
	let id = $(this).data('id');
	$.ajax({
		url: baseUrl + 'admin/surat/keluar/aksi/get/' + id,
		type: "GET",
		success: function (result) {
			response = JSON.parse(result)
			$("#idData").val(response.id_suratkeluar)
			$("#catatan1").html(response.catatan_revisi)
			$("#no_surat1").val(response.no_surat)
			$("#tanggal_dibuat1").val(response.tanggal_dibuat)
			$("#id_jenis1").val(`${response.kode_jenis}-${response.jenis_surat}`).change()
			$("#id_sifat1").val(response.sifat_surat).change()
			$("#perihal1").val(response.perihal)
			$("#persetujuan1").val(response.persetujuan)
			$("#isi_surat1").val(response.isi_surat)
			$("#modalEdit").modal('show')
		},
		error: function (error) {
			errorCode(error)
		}
	})
})

$('#list_surat').on('click', '#delete', function () {
	let id = $(this).data('id');
	confirmSweet("Data akan terhapus secara permanen !")
		.then(result => {
			if (result) {
				$.ajax({
					url: baseUrl + 'admin/surat/keluar/aksi/delete/' + id,
					type: "GET",
					success: function (result) {
						response = JSON.parse(result)
						if (response.surat == 'ok') {
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

$("#formAddSurat").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: baseUrl + "admin/surat/keluar/aksi/insert",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		beforeSend: function () {
			// disableButton()
		},
		complete: function () {
			// enableButton()
		},
		success: function (result) {
			let response = JSON.parse(result)
			if (response.surat == "fail") {
				msgSweetError(response.msg)
			} else {
				table.ajax.reload(null, false)
				toastSuccess(response.msg)
				clearInput($("input"))
				getCurUpk()
				$("#modalTambah").modal('hide')
				// $("#id_upk").val(upk)
			}
		},
		error: function (event) {
			errorCode(event)
		}
	});
})

$("#formRevisiSurat").submit(function (e) {
	e.preventDefault();
	$.ajax({
		url: baseUrl + "admin/surat/keluar/aksi/insert/revisi",
		type: "post",
		data: new FormData(this),
		processData: false,
		contentType: false,
		cache: false,
		beforeSend: function () {
			// disableButton()
		},
		complete: function () {
			// enableButton()
		},
		success: function (result) {
			let response = JSON.parse(result)
			if (response.surat == "fail") {
				msgSweetError(response.msg)
			} else {
				table.ajax.reload(null, false)
				toastSuccess(response.msg)
				clearInput($("input"))
				getCurUpk()
				$("#modalEdit").modal('hide')
				// $("#id_upk").val(upk)
			}
		},
		error: function (event) {
			errorCode(event)
		}
	});
})

function getJenis() {
	$('#id_jenis').find('option').remove().end()
	$('#id_jenis').append("<option value=''> -- Pilih Jenis -- </option>");
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/surat/keluar/aksi/getJenis",
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#id_jenis').append(`<option value="${item.kode_jenis}-${item.id}">${item.jenis}</option>`);
			})
		}
	})

	$('#id_jenis1').find('option').remove().end()
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/surat/keluar/aksi/getJenis",
		success: function (result) {
			console.log(result);
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#id_jenis1').append(`<option value="${item.kode_jenis}-${item.id}">${item.jenis}</option>`);
			})
		}
	})


}

function getAksi() {
	$('#id_aksi').find('option').remove().end()
	$('#id_aksi').append("<option value=''> -- Pilih Aksi -- </option>");
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/surat/keluar/aksi/getAksi",
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#id_aksi').append("<option value=" + item.id + ">" + item.aksi + "</option>");
			})
		}
	})
}

function getJabatan() {
	$('#ttd_pejabat').find('option').remove().end()
	$('#ttd_pejabat').append("<option value=''> -- Pilih Tanda Tangan -- </option>");
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/surat/keluar/aksi/getJabatan",
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#ttd_pejabat').append("<option value=" + item.value + ">" + item.name + "</option>");
			})
		}
	})
}

function getSifat() {
	$('#id_sifat').find('option').remove().end()
	$('#id_sifat').append("<option value=''> -- Pilih Sifat -- </option>");
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/surat/keluar/aksi/getSifat",
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#id_sifat').append("<option value=" + item.id + ">" + item.sifat + "</option>");
			})
		}
	})

	$('#id_sifat1').find('option').remove().end()
	$.ajax({
		dataType: "json",
		url: baseUrl + "admin/surat/keluar/aksi/getSifat",
		success: function (result) {
			console.log(result);
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				$('#id_sifat1').append("<option value=" + item.id + ">" + item.sifat + "</option>");
			})
		}
	})

}
$("#id_jenis").on('change', function () {
	nomorSurat()
})

$("#id_jenis1").on('change', function () {
	nomorSurat()
})

$("#ttd_pejabat").on('change', function() {
	let id = $(this).val()
	let html = ''
	let optionNa = ''
	$.ajax({
		dataType: "json",
		url: `${baseUrl}admin/surat/keluar/aksi/getStaff/${id}`,
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result));
			response.forEach(item => {
				optionNa += `<option value='${item.id}'>${item.name}</option>`
			})
			html = `
				<div class="form-group">
                	<label>Staff</label>
					<select class="form-control" name="">
						${optionNa}
					</select>
                </div>
			`
			$("#pilihStaff").html(html)
		}
	})	
})

function getCurUpk() {
	$.ajax({
		dataType: "json",
		url: baseUrl + 'admin/surat/keluar/aksi/getCurUpk',
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result))
			$("#upkNa").val(response.upk)
		}
	})

	$.ajax({
		dataType: "json",
		url: baseUrl + 'admin/surat/keluar/aksi/getCurUpk',
		success: function (result) {
			let response = jQuery.parseJSON(JSON.stringify(result))
			$("#upkNa1").val(response.upk)
		}
	})
}

function nomorSurat() {
	$.ajax({
		dataType: "json",
		url: baseUrl + 'admin/surat/keluar/aksi/getNomorUrut',
		success: function (result) {
			// let response = jQuery.parseJSON(JSON.stringify(result))
			// $("#no_surat").val(response.nomor)
			let response = jQuery.parseJSON(JSON.stringify(result))
			let kodeJenis = $("#id_jenis").val().split('-')
			let kodeJenis1 = $("#id_jenis1").val().split('-')
			let nomorSurat = `${response.nomor}/${kodeJenis[0]}/${response.upk}/${response.bulan}${response.tahun}`;
			let nomorSurat1 = `${response.nomor}/${kodeJenis1[0]}/${response.upk}/${response.bulan}${response.tahun}`;
			$("#no_surat").val(nomorSurat)
			$("#no_surat1").val(nomorSurat1)
		}
	})
}