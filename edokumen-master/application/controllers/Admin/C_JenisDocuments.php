<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_JenisDocuments extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('admin/M_JenisDocument', 'jdocument');
    }

    public function index()
    {
        // $this->req->print($_SESSION);
        $data = array(
            'title'  => 'Jenis Dokumen',
            'menu'   => 'Jenis Dokumen',
            'script' => 'Jenisdocuments',
            'konten' => 'Admin/Jenis/Data'
        );

        $this->load->view('Admin/templates/templates', $data, FALSE);
    }
}