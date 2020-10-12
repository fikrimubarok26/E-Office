<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_pengaturan extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata($this->session->token) == true) {
            redirect(base_url());
        }
        if ($this->session->userdata('level') != 2) {
            redirect(base_url());
        }
        $this->load->model('admin/M_config', 'config_');
        $this->table = 't_config';
    }

    public function web()
    {

        $kodeUpk = $this->config_->getKodeUpk($_SESSION['upk']);
        $this->db->like('config', $kodeUpk, 'after');
        $configNa = $this->db->get($this->table)->result();

        // $this->req->print($configNa);
        
        $data = array(
            'title' => 'Pengaturan UPK',
            'konten' => 'admin/pengaturan/web',
            'menu' => 'pengaturan',
            'configNa' => $configNa,
            'script' => 'pengaturan',
        );

        $this->load->view('admin/templates/templates', $data, FALSE);
    }

    function update()
    {
        //keur ngeget kode upk
        $kodeUpk = $this->config_->getKodeUpk($_SESSION['upk']);

        $conf = array(
            'type' => 'img',
            'path' => 'config',
            'file' => "$kodeUpk{}logo",
            'encrypt' => true
        );
        $data = $this->req->upload_form($conf);
        unset($data[0]);
        $config = $this->config_;
        error_reporting(0);
        if ($_FILES["$kodeUpk{}logo"]['name']) {
            unlink('./uploads/config/' . $this->config_->get("$kodeUpk{}logo"));
        }
        // $this->req->print($data);
        foreach ($data as $key => $value) {
            $config->setConfig($key, $value);
        }
        $msg = array(
            'status' => 'ok',
            'msg' => 'Berhasil mengubah Data !'
        );
        echo json_encode($msg);
    }

    function format()
    {
        // $this->req->print($configNa);

        $data = array(
            'title' => 'Pengaturan UPK',
            'konten' => 'admin/pengaturan/format',
            'menu' => 'format',
            'script' => 'pengaturan',
        );

        $this->load->view('admin/templates/templates', $data, FALSE);
    }

}

/* End of file C_pengaturan.php */



