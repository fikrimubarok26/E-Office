<?php
defined('BASEPATH') or exit('No direct script access allowed');


$route['default_controller'] = 'C_Beranda';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['dashboard-app'] = 'DashboardApp';
$route['dokumen-masuk'] = 'C_DocumentsMasuk';
$route['dokumen-masuk/detaildokumenmasuk'] = 'C_DocumentsMasuk/DetailDokumenMasuk';

$route['dokumen-saya'] = 'C_Documents';
$route['dokumen-saya/store'] = 'C_Documents/store';
$route['dokumen-saya/getjenis'] = 'C_Documents/GetJenis';
$route['dokumen-saya/getfile'] = 'C_Documents/GetFile';
$route['dokumen-saya/add'] = 'C_Documents/Add';
$route['dokumen-saya/getakses'] =   'C_Documents/GetAkses';
$route['dokumen-saya/getjabatan'] = 'C_Documents/GetJabatan';
$route['dokumen-saya/store'] = 'C_Documents/Store';
$route['dokumen-saya/search'] = 'C_Documents/Search';
$route['dokumen-saya/getfilename'] = 'C_Documents/GetFileName';
$route['dokumen-saya/storeupdate'] = 'C_Documents/StoreUpdate';
$route['dokumen-saya/action'] = 'C_Documents/Action';
$route['dokumen-saya/unduh-file'] = 'C_Documents/Unduh';
$route['dokumen-saya/loaduser'] = 'C_Documents/LoadUser';
$route['dokumen-saya/file/(:any)'] = 'C_Documents/File/$1';

$route['jenis-dokumen'] = 'C_JenisDocuments/index';
$route['jenis-dokumen/get'] = 'C_JenisDocuments/Get';
$route['jenis-dokumen/storeupdate'] = 'C_JenisDocuments/StoreUpdate';
$route['jenis-dokumen/hapus'] = 'C_JenisDocuments/Hapus';



$route['mydocuments/tree1'] = 'C_tree';
