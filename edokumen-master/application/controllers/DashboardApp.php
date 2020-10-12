<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DashboardApp extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array(
            'title'  => 'Dashboard Aplikasi',
            'menu'   => 'Dashboard Aplikasi E-Office',
            'konten' => 'DashboardEoffice'
        );

        $this->load->view('DashboardEoffice', $data, FALSE);
    }
}