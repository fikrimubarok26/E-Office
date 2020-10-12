var url = document.querySelector("meta[name=baseUrl]").getAttribute("content");
var level = document.querySelector("meta[name=level]").getAttribute("content");
// var router = document.querySelector("meta[name=router]").getAttribute("content");

var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var r, t, a, n, o, c, s, i = "", u = 0; for (e = Base64._utf8_encode(e); u < e.length;)n = (r = e.charCodeAt(u++)) >> 2, o = (3 & r) << 4 | (t = e.charCodeAt(u++)) >> 4, c = (15 & t) << 2 | (a = e.charCodeAt(u++)) >> 6, s = 63 & a, isNaN(t) ? c = s = 64 : isNaN(a) && (s = 64), i = i + this._keyStr.charAt(n) + this._keyStr.charAt(o) + this._keyStr.charAt(c) + this._keyStr.charAt(s); return i }, decode: function (e) { var r, t, a, n, o, c, s = "", i = 0; for (e = e.replace(/[^A-Za-z0-9\+\/\=]/g, ""); i < e.length;)r = this._keyStr.indexOf(e.charAt(i++)) << 2 | (n = this._keyStr.indexOf(e.charAt(i++))) >> 4, t = (15 & n) << 4 | (o = this._keyStr.indexOf(e.charAt(i++))) >> 2, a = (3 & o) << 6 | (c = this._keyStr.indexOf(e.charAt(i++))), s += String.fromCharCode(r), 64 != o && (s += String.fromCharCode(t)), 64 != c && (s += String.fromCharCode(a)); return s = Base64._utf8_decode(s) }, _utf8_encode: function (e) { e = e.replace(/\r\n/g, "\n"); for (var r = "", t = 0; t < e.length; t++) { var a = e.charCodeAt(t); a < 128 ? r += String.fromCharCode(a) : a > 127 && a < 2048 ? (r += String.fromCharCode(a >> 6 | 192), r += String.fromCharCode(63 & a | 128)) : (r += String.fromCharCode(a >> 12 | 224), r += String.fromCharCode(a >> 6 & 63 | 128), r += String.fromCharCode(63 & a | 128)) } return r }, _utf8_decode: function (e) { for (var r = "", t = 0, a = c1 = c2 = 0; t < e.length;)(a = e.charCodeAt(t)) < 128 ? (r += String.fromCharCode(a), t++) : a > 191 && a < 224 ? (c2 = e.charCodeAt(t + 1), r += String.fromCharCode((31 & a) << 6 | 63 & c2), t += 2) : (c2 = e.charCodeAt(t + 1), c3 = e.charCodeAt(t + 2), r += String.fromCharCode((15 & a) << 12 | (63 & c2) << 6 | 63 & c3), t += 3); return r } };
function Encode(e, r = 7) { let t = []; for (let a = 0; a < r; a++)0 == t.length ? t[a] = Base64.encode(e.toString()) : t[a] = Base64.encode(t[a - 1].toString()); return t[t.length - 1].replace(/=/g, "") } function Decode(e, r, t = "") { let tampung = []; for (let t = 0; t < r; t++)0 == tampung.length ? tampung[t] = Base64.decode(e) : tampung[t] = Base64.decode(tampung[t - 1]); return tampung[tampung.length - 1].replace(/=/g, "") }
function ResetToken(value) {
    $('meta[id=csrf]').attr('content', value);
}
function CsrfTokenName() {
    return document.querySelector("meta[id=csrf]").getAttribute("name");
}
function CsrfTokenValue() {
    return document.querySelector("meta[id=csrf]").getAttribute("content");

}
function LoadingButton(type, text, name = 'save') {
    let button = "button[name=" + name + "]";
    const btext = $(button).html();

    if (type == 'on') {
        $(button).html(" <span style='margin-bottom:2px; display:inline-block' class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> " + text)
        $(button).attr('disabled', 'true');
    }
    else if (type == 'off') {
        $(button).html(text)
        $(button).removeAttr('disabled');
    }
    return btext;
}

function UrlMedia(link, file) {
    // return `https://portal.tu-pay.net/tupay_new/${link}/media/${file}`;
    return `https://app.tu-pay.net/tupay_new_dev/${link}/media/${file}`;
    // return "https://.id/elearning/{$link}/media/";
}
function capitalize(s) {
    if (typeof s !== 'string') return ''
    return s.charAt(0).toUpperCase() + s.slice(1)
}

function ReToken() {
    return $.ajax({
        url: url + 'dapur/dashboard/retoken',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.status == 200)
                return response.token;
            else
                return false;
        }
    })
}
function pesan(message) {
    Snackbar.show({
        text: `<span class='nunito-500'>${message}</span>`,
        pos: 'top-center',
        actionText: '<b>OKE</b>',
        actionTextColor: '#fabe58'
    });
}
function pesan_error(title, message) {
    iziToast.error({
        title: title,
        message: message.replace("'", "\'"),
        progressBar: false,
        position: 'topCenter'
    });
}
function pesan_warning(title, message) {
    iziToast.warning({
        title: title,
        message: message.replace("'", "\'"),
        progressBar: false,
        position: 'topCenter'
    });
}
function pesan_sukses(title, message) {
    iziToast.success({
        title: title,
        message: message.replace("'", "\'"),
        progressBar: false,
        position: 'topCenter'
    });
}

function ValidateEmail(email) {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

function IsMobile() {
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
        return true;
    return false;
}

function ValidationEmpty(data, except = '') {
    let flag = 0;
    let replace = '';
    data.forEach(function (elm, index) {
        // console.log(elm['name'] + ' - ' + $.inArray(elm['name'], except) + " #__" + elm['name'] + ' - ');
        //validasi kosong 

        if (elm['name'].match(/\[|\]/gi) == null) {

            if (elm["value"].length <= 0) {
                $("#__" + elm["name"]).html(
                    " *) kolom tidak boleh kosong");
                flag += 1;

            } else {
                $("#__" + elm['name']).html(" ");

            }
        } else {
            if ($.inArray(elm['name'], except) != 0) {
                replace = elm['name'].replace('[', '-');
                replace = replace.replace(']', '');
                if (elm["value"].length <= 0) {
                    $("#__" + replace).html(
                        " *) kolom tidak boleh kosong");
                    flag += 1;

                } else {
                    $("#__" + replace).html(" ");

                }
            }
        }

    });
    if (flag > 0)
        return false;

    return true;
}

function convertToRupiah(angka) {
    var rupiah = '';
    var angkarev = angka.toString().split('').reverse().join('');
    for (var i = 0; i < angkarev.length; i++) if (i % 3 == 0) rupiah += angkarev.substr(i, 3) + '.';
    return rupiah.split('', rupiah.length - 1).reverse().join('');
}

function GetDay(e) {
    let r = "";
    switch (e) {
        case "Sun,":
            r = "Minggu"; break;
        case "Mon,":
            r = "Senin"; break;
        case "Tue,":
            r = "Selasa"; break;
        case "Wed,":
            r = "Rabu"; break;
        case "Thu,":
            r = "Kamis"; break;
        case "Fri,":
            r = "Jum'at"; break;
        case "Sat,": r = "Sabtu"
    }
    return r;
}
function GetMonth(e) {
    let r = ""; switch (e) {
        case "Jan": r = "januari"; break; case "Feb": r = "februari"; break; case "Mar": r = "maret"; break; case "Apr": r = "april"; break; case "May": r = "mei"; break; case "Jun": r = "juni"; break; case "Jul": r = "juli"; break; case "Aug": r = "agustus"; break; case "Sep": r = "september"; break; case "Oct": r = "oktober"; break; case "Nov": r = "november"; break; case "Dec": r = "desember"
    }
    return r;
}

function ErrorLog(jqXHR, exception) {
    if (jqXHR.status === 0) {
        msg = 'Not connect.n Verify Network.';
    } else if (jqXHR.status == 404) {
        msg = 'Requested page not found. [404]';
    } else if (jqXHR.status == 500) {
        msg = 'Internal Server Error [500].';
    } else if (exception === 'parsererror') {
        msg = 'Requested JSON parse failed.';
    } else if (exception === 'timeout') {
        msg = 'Time out error.';
    } else if (exception === 'abort') {
        msg = 'Ajax request aborted.';
    } else {
        msg = 'Uncaught Error.n' + jqXHR.responseText;
    }
    return msg;
}