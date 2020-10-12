<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_jenis extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        //cek login
        if (!$this->session->userdata('logged_in')) {
            redirect(base_url());
        }

        if ($this->session->userdata('level') != 2) {
            redirect(base_url());
        }
        $this->load->model('admin/M_jenis', 'jenis');
        $this->jenis->upk = $this->session->userdata('upk');
    }

    public function list()
    {
        $data = array(
            'title'  => 'Jenis Surat',
            'menu'   => 'jenis',
            'script' => 'jenis',
            'konten' => 'admin/jenis/list'
        );

        $this->load->view('admin/templates/templates', $data, FALSE);
    }

    function getJenis()
    {
        echo json_encode($this->jenis->data_jenis());
    }

    function data()
    {
        error_reporting(0);
        $list = $this->jenis->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $field) {
            $idNa = $this->req->acak($field->id);
            // $idNa = $field->id;
            $button = "
                <button class='btn btn-danger btn-sm' id='delete' data-id='$idNa'><i class='fas fa-trash-alt'></i></button>
                <button class='btn btn-warning btn-sm' id='edit' data-id='$idNa'><i class='fas fa-pencil-alt'></i></button>
            ";
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $field->kode_jenis;
            $row[] = $field->jenis;
            $row[] = $field->keterangan;
            $row[] = $button;
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->jenis->count_all(),
            "recordsFiltered" => $this->jenis->count_filtered(),
            "data" => $data,
        );
        echo json_encode($output);
    }

    function get($id)
    {
        $data = $this->jenis->get($id);
        foreach ($data as $key => $value) {
            if (strtolower($key) == 'id') {
                $data->$key = $this->req->acak($value);
            }
        }
        echo json_encode($data);
    }

    function insert()
    {
        $data = $this->req->all();
        if ($this->jenis->insert($data) == true) {
            $msg = array(
                'status' => 'ok',
                'msg' => 'Berhasil menambahkan data !'
            );
        } else {
            $msg = array(
                'status' => 'fail',
                'msg' => 'Gagal menambahkan data !'
            );
        }
        echo json_encode($msg);
    }

    function update()
    {
        $id = $this->input->post('id');
        $data = $this->req->all(['id' => false]);
        if ($this->jenis->update($data, $this->req->id($id)) == true) {
            $msg = array(
                'status' => 'ok',
                'msg' => 'Berhasil mengubah data !'
            );
        } else {
            $msg = array(
                'status' => 'fail',
                'msg' => 'Gagal mengubah data !'
            );
        }
        echo json_encode($msg);
    }

    function delete($id)
    {
        if ($this->jenis->delete($this->req->id($id)) == true) {
            $msg = array(
                'status' => 'ok',
                'msg' => 'Berhasil menghapus data !'
            );
        } else {
            $msg = array(
                'status' => 'fail',
                'msg' => 'Gagal menghapus data !'
            );
        }
        echo json_encode($msg);
    }
}
