<?php

defined('BASEPATH') or exit('No direct script access allowed');

class C_surat extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata($this->session->token) == true) {
            redirect(base_url());
        }
        $this->load->model('admin/M_jenis', 'jenis');
        $this->load->model('admin/M_surat', 'surat');
    }


    public function masuk()
    {

        $jabatan = $this->surat->data_jabatan();
        $user = $this->surat->data_user();
        $data = array(
            'title'  => 'Surat Masuk',
            'jabatan' => $jabatan,
            'user'   => $user,
            'menu'   => 'surat-masuk',
            'script' => 'surat_masuk',
            'konten' => 'admin/surat/masuk',
        );

        $this->load->view('admin/templates/templates', $data, FALSE);
    }

    public function adminsurat()
    {
        // $surat = $this->surat->surat_user();
        $data = array(
            'title' => 'Surat Masuk - Admin Persuratan',
            // 'surat' => $surat,
            'menu' => 'surat-user',
            'script' => 'surat_user',
            'konten' => 'admin/surat/adminsurat',
        );


        $this->load->view('admin/templates/templates', $data, FALSE);
    }

    public function user()
    {
        // $surat = $this->surat->surat_user();
        $user = $this->surat->data_user();
        $data = array(
            'title' => 'Surat Masuk / Disposisi',
            // 'surat' => $surat,
            'user' => $user,
            'menu' => 'surat-user',
            'script' => 'surat_user',
            'konten' => 'admin/surat/suratuser',
        );


        $this->load->view('admin/templates/templates', $data, FALSE);
    }

    public function keluar()
    {
        $user = $this->surat->data_user();
        $jabatan = $this->surat->data_jabatan();
        $data = array(
            'title'  => 'Surat keluar',
            'menu'   => 'surat-keluar',
            'user'   =>  $user,
            'jabatan' => $jabatan,
            'script' => 'surat_keluar',
            'konten' => 'admin/surat/keluar',
        );

        $this->load->view('admin/templates/templates', $data, FALSE);
    }

    function data($tipe = null)
    {
        error_reporting(0);
        if ($tipe == 'user') {
            $this->surat->tipe = $this->session->userdata('id_user');
        }
        if ($_POST['tipeKirim'] != null) {
            $this->surat->tipeKirim = $_POST['tipeKirim'];
        }
        // echo $_POST['tipeKirim'];
        $list = $this->surat->get_datatables();
        // $this->req->query();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $field) {
            $idNa = $this->req->acak($field->id);
            // $idNa = $field->id;

            if ($tipe == 'user') {
                
                if ($field->disposisi == '1'  && $field->status_suratmasuk = '1') {
                    // echo "jang"; 
                    $button = "
                    <button class='btn btn-primary btn-sm' id='lihat' data-id='$idNa' title='Lihat Berkas'><i class='fas fa-eye' ></i></button>
                    <button class='btn btn-info btn-sm' id='arsip' data-id='$idNa' title='Arsipkan Surat'><i class='fas fa-file-archive' ></i></button>
                    <button class='btn btn-success btn-sm' id='confirm' data-id='$idNa' title='Disposisi Surat'><i class='fas fa-check-circle' ></i></button>
                    ";
                }elseif($field->disposisi == '2' && $field->status_suratmasuk = '1'){
                    // echo "ar";
                    $button = "
                    <button class='btn btn-primary btn-sm' id='lihat' data-id='$idNa' title='Lihat Berkas'><i class='fas fa-eye' ></i></button>
                    <button class='btn btn-info btn-sm' id='arsip' data-id='$idNa' title='Arsipkan Surat'><i class='fas fa-file-archive' ></i></button>
                    <button class='btn btn-success btn-sm' id='confirm' data-id='$idNa' title='Disposisi Surat'><i class='fas fa-check-circle' ></i></button>
                    ";
                
                } else {
                    $button = "<button class='btn btn-primary btn-sm' id='lihat' data-id='$idNa' title='Lihat Berkas'><i class='fas fa-eye' title='Lihat Berkas' ></i></button>
                    <button class='btn btn-info btn-sm' id='arsip' data-id='$idNa' title='Lihat Berkas'><i class='fas fa-file-archive' title='Lihat Berkas' ></i></button>";
                }


            } else {
                $button = "
                <button class='btn btn-danger btn-sm' id='delete' data-id='$idNa' title='Hapus Surat Masuk'><i class='fas fa-trash-alt'></i></button>
                <button class='btn btn-primary btn-sm' id='lihat' data-id='$idNa' title='Lihat Berkas Surat Masuk'><i class='fas fa-eye'></i></button>
            ";
            }

            if ($field->disposisi == '1') {
                $disposisi= "Ya";
            }
            if ($field->disposisi == '2') {
                $disposisi= "Sudah Disposisi";
            }
            if ($field->disposisi == '0') {
                $disposisi= "Tidak";
            }

            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $field->no_surat;
            $row[] = $field->tanggal_surat;
            $row[] = $field->asal_surat;
            $row[] = $field->jenis;
            $row[] = $disposisi;
            $row[] = $field->perihal;
            $row[] = $button;
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->surat->count_all(),
            "recordsFiltered" => $this->surat->count_filtered(),
            "data" => $data,
        );
        echo json_encode($output);
    }


    function getAksi()
    {
        echo json_encode($this->surat->data_aksi());
    }

    function getUser()
    {
        echo json_encode($this->surat->data_user());
    }

    function getJabatan()
    {
        echo json_encode($this->surat->data_jabatan());
    }

    function getUpk()
    {
        echo json_encode($this->surat->data_upk());
    }

    function getSifat()
    {
        echo json_encode($this->surat->data_sifat());
    }

    function getJenis()
    {
        echo json_encode($this->surat->data_jenis());
    }

    function getNomorUrut()
    {
        echo json_encode($this->surat->getNomorUrut());
    }


    function getUpkSelected()
    {
        $id_upk = $_GET['id_upks'];
        echo json_encode($this->surat->data_jabatan($id_upk));
    }

    function get($id)
    {
        $data = $this->surat->get($id);
        foreach ($data as $key => $value) {
            if (strtolower($key) == 'id_suratna') {
                $data->$key = $this->req->acak($value);
            }
        }
        // echo $this->req->id($data['nama_user']);
        // echo $this->db->last_query();
        echo json_encode($data);
    }

    function insert()
    {
        $id = explode('-', $this->input->post('jenis_surat'));
        $tujuanKirimNa   = $this->req->input('tujuan_kirim');
        $aksiKirimNa     = $this->req->input('aksi_kirim');
        $buatNotif       = time();
        
        $custom = [
            'jenis_surat' => $id[1],
            'list-dikirim' => false,
            'jenis_kirim' => false,
            'notif' => $buatNotif,
        ];

        $config = [
            'path' => 'surat',
            'file' => 'lampiran',
            'encrypt' => true,
            'type' => 'doc',
            'customInput' => $custom
        ];

        $data = $this->req->upload_form_multi($config);

        if ($this->surat->insert($data['data']) == true) {

            // Kirim Notifikasi
            $this->req->insertNotif([
                'table' => 't_surat',
                'tujuan' => $tujuanKirimNa,
                'notif' => $buatNotif,
                'tipe' => '1'
            ]);

            // Kirim Email
            $jabatanEmail = explode(',', $aksiKirimNa);
            $alamatEmail = explode(',', $tujuanKirimNa);

            $JabatanEmailNa = []; 
            foreach ($jabatanEmail as $keyNa) {
                $jabatanNa = $this->db->get_where('t_user', ['id_jabatan' => $keyNa ])->result();
                foreach ($jabatanNa as $keyKey) {
                    $JabatanEmailNa[] = $keyKey->email;
                }
            }

            $emailNa= [];
            foreach ($alamatEmail as $key) {
                $dataUser = $this->db->get_where('t_user', ['id' => $key])->result();
                foreach ($dataUser as $list) {
                    $emailNa[] = $list->email;
                }
            } 

            $mail = array(
                'subjek'            => 'Anda Mendapatkan Notif baru - Surat Masuk' ,
                'keterangan_surat'  => 'Surat Masuk',
                'perihal'           => $this->input->post('perihal'),
                'isi_surat'         => $this->input->post('isi_surat'),
                'email'             => $emailNa,
                'jabatanemail'      => $JabatanEmailNa,
                // 'nama' => $userName,
            );
            $email = $this->req->sendMail($mail);

            if (!$email->send()) {
                $msg = array(
                    'surat' => 'fail',
                    'msg' => 'Terjadi kesalahan Saat mengirim Email !'
                );
            } else {
                $msg = array(
                    'surat' => 'ok',
                    'msg' => 'Berhasil Mengirim Data !'
                );
            }
            echo json_encode($msg);

        } else {
            $msg = array(
                'surat' => 'fail',
                'msg' => 'Terjadi Kesalahan saat Mengirim Data !'
            );
            echo json_encode($msg);
        }
    }

    function update()
    {
        $id = $this->input->post('id');
        $data = $this->req->all(['id' => false]);
        if ($this->surat->update($data, $this->req->id($id)) == true) {
            $msg = array(
                'surat' => 'ok',
                'msg' => 'Berhasil mengubah data !'
            );
        } else {
            $msg = array(
                'surat' => 'fail',
                'msg' => 'Gagal mengubah data !'
            );
        }
        echo json_encode($msg);
    }

    function delete($id)
    {

        if ($this->surat->delete($this->req->id($id)) == true) {
            $msg = array(
                'msg' => 'Berhasil menghapus data !'
            );
        } else {
            $msg = array(
                'surat' => 'fail',
                'msg' => 'Gagal menghapus data !'
            );
        }
    }

    public function insert_disposisi()
    {
        $id = $this->input->post('id_surat');
        $userNa = $this->input->post('user_tujuan');

         // if ($this->surat->update([
         //    'status_suratmasuk' => '0',
         //    'disposisi' => '2'
         //    ],$this->req->id($id)) == true){}
        

        $pecahEmail = explode(',', $userNa);

        $emailNa = [];
        $jabatan = [];
        foreach ($pecahEmail as $keyNa) {
            $getEmail = $this->db->get_where('t_user', ['id_jabatan' => $keyNa])->result();
            foreach ($getEmail as $key) {
                $emailNa[] = $key->email;
            }
        } 

        $disposisi = array(
            'id_user_jabatan' => $this->session->jabatan,
             );
        // $this->req->print($emailNa);

        $data = $this->req->all($disposisi);
        if ($this->surat->insert_disposisi($data) == true) {

            $this->surat->update(['status_suratmasuk' => '0', 'disposisi' => '2'], $this->req->id($id));

            echo $this->db->last_query();

            $mail = array( 
                'subjek' => 'Anda Mendapatkan Notif baru - Disposisi Surat Masuk' ,
                'keterangan_surat' => 'Disposisi Surat Masuk',
                'perihal'           => $this->input->post('perihal'),
                'email'             => $emailNa,
                'jabatanemail'      => $jabatan,
            );

            $email = $this->req->sendMail($mail);

            if (!$email->send()) {
                $msg = array(
                    'surat' => 'fail',
                    'msg' => 'Terjadi kesalahan Saat mengirim Email !'
                );
            } else {
                $msg = array(
                    'surat' => 'ok',
                    'msg' => 'Berhasil Mengirim Data !'
                );
            }

            // $msg = array(
            //     'status' => 'ok',
            //     'msg' => 'Berhasil Disposisi !'
            // );
            echo json_encode($msg);
        } else {
            $msg = array(
                'status' => 'fail',
                'msg' => 'Gagal Disposisi !'
            );
            echo json_encode($msg);
        }            
        // echo $this->db->last_query();
    }

    function arsip($id, $action)
    {
        if ($action == 'arsip') {
            if ($this->surat->update(['arsipkan' => '1'], $this->req->id($id)) == true) {
                $this->surat->updateDisposisi(['arsipkan' => '1'], $this->req->id($id));
                $msg = array(
                    'status' => 'ok',
                    'msg' => 'Berhasil Mengarsipkan Surat !'
                );
            } else {
                $msg = array(
                    'status' => 'fail',
                    'msg' => 'Sepertinya Terjadi kesalahan !'
                );
            }
            echo json_encode($msg);
        }
        
    }
}
