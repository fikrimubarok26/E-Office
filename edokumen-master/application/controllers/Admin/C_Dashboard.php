<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_Dashboard extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array(
            'title'  => 'Dashboard',
            'menu'   => 'Dashboard',
            'script' => 'Dashboard',
            'konten' => 'Admin/Dashboard'
        );

        $this->load->view('Admin/templates/templates', $data, FALSE);
    }
}