<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_Documents extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_document', 'document');
    }

    public function index()
    {
        // $this->req->print($_SESSION);
        $data = array(
            'title'  => 'Dokomen',
            'menu'   => 'Dokumen Saya',
            'script' => 'Mydocuments',
            'konten' => 'User/Dokumen/Data'
        );

        if ($this->session->level == 2) {

            $IdUpk = $this->session->upk;
            $ReadUser = $this->req->GetData('t_user', ['id_upk' => $IdUpk]);
            $data['count'] = $ReadUser->num_rows();
            if ($data['count'] > 0)
                $data['collections'] = $ReadUser->result_array();
        }

        $this->load->view('templates/templates', $data, FALSE);
    }

    public function GetJenis()
    {
        try {
            $IdUpk = $this->session->upk;
            $page = $this->input->get('page') != null ? $this->input->get('page') : 1;

            $GetData = $this->document->GetDataJenis($IdUpk);
            if ($GetData['status_code'] != 200)
                throw new Exception($GetData['message']);

            $message = [
                'page'         => $page,
                'message'      => 'ok',
                'row_count'    => $GetData['row_count'],
                'status_code'  => 200,
                'data'         => $GetData['collections'],
            ];
            // $this->req->print($message);
        } catch (Exception $Error) {
            $message = [
                'status_code'  => 400,
                'message'      => $Error->getMessage(),
                'row_count'    => 0,
                'data'         => [],
            ];
        } catch (Throwable $Error) {
            $message = [
                'status_code'   => 400,
                'message'       => 'Throwable ' . $Error->getMessage(),
                'row_count'     => 0,
                'data'          => [],
            ];
        } finally {
            echo json_encode($message);
        }
    }

    public function Add()
    {
        $data = array(
            'title'  => 'Upload Dokomen',
            'menu'   => 'Dokumen Saya',
            'script' => 'MydocumentsAdd',
            'konten' => 'User/Dokumen/Add'
        );
        $IdUpk = $this->session->upk;

        $ReadJenis = $this->document->GetDataJenis($IdUpk);
        // $this->library->printr($ReadJenis);
        if ($ReadJenis['status_code'] != 200) {
            $this->session->set_flashdata('pesan', "<script>pesan('" . ($ReadJenis['status_code']) . "')</script>");
            redirect('dokumen-saya');
        }

        $data['row_count'] = $ReadJenis['row_count'];
        $data['data']      = $ReadJenis['collections'];

        $this->load->view('templates/templates', $data, FALSE);
    }

    public function GetAkses()
    {
        $ReadUpk = $this->document->GetDataUpk();
        $data['row_count'] = $ReadUpk['row_count'];
        $data['data']      = $ReadUpk['collections'];
        $message = [
            'status_code' => $ReadUpk['status_code'],
            'message'     => $ReadUpk['message'],
            'row_count'   => $ReadUpk['row_count'],
            'data' => $ReadUpk['collections'],
        ];
        echo json_encode($message);
    }


    public function GetFile()
    {
        try {
            $page = $this->input->get('page') != null ? $this->input->get('page') : 1;
            $jenis = $this->input->get('jenis') != null ? $this->library->Decode($this->input->get('jenis'), 3) : null;
            $q = $this->input->get('q') != null ? $this->input->get('q') : null;
            $SelectIdUser = $this->input->get('user') != null ? $this->input->get('user') : null;
            $offset = $this->input->get('offset');
            $IdUser = $this->session->id_user;
            $data = [];
            $level = $this->session->level;
            if ($level != 2)
                $data['id_user'] = $IdUser;

            if ($jenis != null)
                $data['id_jenis'] = $jenis;
            $search = [];
            if ($q != null) {
                $search = [
                    'judul'     => $q,
                    'tipe_file' => $q
                ];
            }
            if ($SelectIdUser != null)
                $data['sha1(id_user)'] = $SelectIdUser;
            $GetData = $this->document->GetDataFile($data, $page, $search, $offset);
            if ($GetData['status_code'] != 200)
                throw new Exception($GetData['message']);
            // $this->library->printr($GetData);
            $message = [
                'page'         => $page,
                'message'      => 'ok',
                'row_count'    => $GetData['row_count'],
                'status_code'  => 200,
                'data'         => $GetData['collections'],
                'pagination'   => $GetData['pagination']
            ];
            // $this->req->print($message);
        } catch (Exception $Error) {
            $message = [
                'status_code'  => 400,
                'message'      => $Error->getMessage(),
                'row_count'    => 0,
                'data'         => [],
            ];
        } catch (Throwable $Error) {
            $message = [
                'status_code'   => 400,
                'message'       => 'Throwable ' . $Error->getMessage(),
                'row_count'     => 0,
                'data'          => [],
            ];
        } finally {
            // $this->req->query();
            echo json_encode($message);
        }
    }

    public function GetFileName()
    {
        try {
            $input = $this->input->get();
            if ($input['id'] == null)
                throw new Exception('Param kosong');
            $DecodeId = $this->library->Decode($input['id'], 4);
            $FileName = $this->document->GetFileName(['id' => $DecodeId]);
            $message = [
                'status_code' => 200,
                'message'     => 'ok',
                'data'        => $FileName
            ];
        } catch (Exception $Error) {
            $message = [
                'status_code'  => 400,
                'message'      => $Error->getMessage(),
            ];
        } catch (Throwable $Error) {
            $message = [
                'status_code'   => 400,
                'message'       => 'Throwable ' . $Error->getMessage(),
            ];
        } finally {
            echo json_encode($message);
        }
    }


    private function UploadFile($name)
    {
        $config['upload_path'] = './upload/documents/';
        $config['allowed_types'] = 'pdf';
        $config['max_size']     = '8000';
        $config['file_name']     = sha1(uniqid(rand() / 19)) . '.pdf';
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload($name)) {
            $message = [
                'status'  => 400,
                'message' => $this->upload->display_errors()
            ];
        } else {
            $upload = $this->upload->data();
            $message = [
                'status'  => 200,
                'message' => 'ok',
                'filename' => $upload['file_name'],
                'ext'      => $upload['file_ext']
            ];
        }
        return $message;
    }

    public function StoreUpdate()
    {
        try {
            $input = $this->input->post();
            if (!$input)
                throw new Exception('Perlu akses POST');
            $DecodeId = $this->library->Decode($input['id'], 4);
            // $this->library->printr($DecodeId);
            // cari id
            $Cari = $this->document->GetCount(['id' => $DecodeId]);
            if ($Cari == false)
                throw new Exception('Data tidak ditemukan');

            $this->db->where(['id' => $DecodeId]);
            $this->db->update('doc_file', ['judul' => $input['nama']]);

            $message = [
                'status' => 200,
                'message' => 'nama file telah di ubah',
            ];
        } catch (Exception $Error) {
            $message = [
                'status' => 400,
                'message' => $Error->getMessage(),
            ];
        } catch (Throwable $Error) {
            $message = [
                'status' => 400,
                'message' => 'Throwable ' . $Error->getMessage(),
            ];
        } finally {
            $message['token'] = $this->security->get_csrf_hash();
            echo json_encode($message);
        }
    }

    public function Store()
    {
        try {
            // $this->library->printr($_POST);
            // set data 
            $IdUpk = $this->session->upk == null ? null : $this->session->upk;

            $data = [
                'id_user'     => $this->session->id_user,
                'id_jenis'    => $this->library->XssClean('nama_jenis'),
                'judul'       => $this->library->XssClean('judul'),
                'desc'        => $this->library->XssClean('deskripsi'),
                'id_upk'      => $IdUpk
            ];

            // cek tipe file
            $CekTipeFile = $this->FileCheck('berkas');
            if ($CekTipeFile == false)
                throw new Exception('Berkas file tidak didukung, disarankan berkas format .pdf');

            // upload file 
            $UploadFile = $this->UploadFile('berkas');
            if ($UploadFile['status'] != 200)
                throw new Exception($UploadFile['message']);

            // update data
            @$AksesFile = $this->input->post('tampungjabatan');

            $Akses = null;
            if (!empty($AksesFile)) {
                $Akses = ceil(rand(1, 999) + time());
                $no = 0;
                foreach ($AksesFile as $key => $list) :
                    foreach (explode(',', $list) as $ListJabatan) :
                        // aksi insert akses
                        $this->db->insert('doc_akses_file', [
                            'akses' => $Akses,
                            'id_jabatan' => $ListJabatan
                        ]);
                        $no++;
                    endforeach;
                endforeach;
            }

            $data['ori_file'] = $UploadFile['filename'];
            $data['tipe_file'] = $UploadFile['ext'];
            $data['akses'] = $Akses;

            // insert ke database
            $this->db->insert('doc_file', $data);
            $message = [
                'status' => 200,
                'message' => 'Berkas telah diupload'
            ];
        } catch (Exception $Error) {
            $message = [
                'status' => 400,
                'message' => $Error->getMessage()
            ];
        } catch (Throwable $Error) {
            $message = [
                'status' => 400,
                'message' => 'Throwable ' . $Error->getMessage()
            ];
        } finally {
            $message['token'] = $this->security->get_csrf_hash();
            echo json_encode($message);
        }
    }

    private function FileCheck($name)
    {
        if ($_FILES[$name]['error'] == 4) return false;
        // type 'mime' yg dibolehkan(pdf)
        $allowed_mime_type_arr = array('application/pdf');

        // ambil ekstensi mime berdasarkan nama file 
        $mime = get_mime_by_extension($_FILES[$name]['name']);

        // jika file ada dan tidak kosong
        if (isset($_FILES[$name]['name']) && !empty($_FILES[$name]['name'])) {
            // jika file yg diupload sesuai type mime yg dibolehkan
            if (in_array($mime, $allowed_mime_type_arr)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public function GetJabatan()
    {
        $IdUpk = $this->library->Decode($this->input->get('id'), 3);
        $this->db->select('id as value, jabatan as name');
        $this->db->from('t_jabatan');
        $this->db->order_by('name', 'ASC');
        $this->db->where(['id_upk' => $IdUpk]);
        $query = $this->db->get();
        echo json_encode($query->result());
    }



    public function Action()
    {
        try {
            $input = $this->input->post();
            if (!$input)
                throw new Exception('Method harus post');

            $IdFile = explode(',', $input['id_file']);
            if ($input['button-options'] == 'unduh') {
                $Action = $this->document->Unduh($IdFile);
            } elseif ($input['button-options'] == 'hapus') {
                $Action = $this->document->Hapus($IdFile);
            }

            if ($Action['status'] != 200)
                throw new exception($Action['message']);
            $this->session->set_flashdata('pesan', "<script>pesan('" . ($Action['message']) . "')</script>");
            $this->session->set_flashdata('pesan-hapus', '-');
            redirect('dokumen-saya/');
            echo "sukses";
        } catch (Exception $Error) {
            $this->session->set_flashdata('pesan', "<script>pesan('" . ($Error->getMessage()) . "')</script>");
            // echo $Error->getMessage();

            redirect('dokumen-saya');
        } catch (Throwable $Error) {
            $this->session->set_flashdata('pesan', "<script>pesan('Throwable " . ($Error->getMessage()) . "')</script>");
            // echo 'Throwable ' . $Error->getMessage();

            redirect('dokumen-saya');
        }
    }

    public function Unduh()
    {
        try {
            $input = $this->input->get();
            if (!$input)
                throw new Exception('Param tidak tersedia');
            if ($input['file'] == null)
                throw new Exception('Param File tidak tersedia');

            $DecodeId = $this->library->Decode($input['file'], 4);

            // READ 
            $Unduh = $this->document->UnduhFile($DecodeId);
        } catch (Exception $Error) {
            $this->session->set_flashdata('pesan', "<script>pesan('" . ($Error->getMessage()) . "')</script>");
            redirect('dokumen-saya');
        } catch (Throwable $Error) {
            $this->session->set_flashdata('pesan', "<script>pesan('Throwable " . ($Error->getMessage()) . "')</script>");
            redirect('dokumen-saya');
        }
    }

    public function LoadUser()
    {
        // echo '<pre>' . print_r($_GET, true) . '</pre>';
        // exit(1);
        $token = !empty($this->credential->GetTokenUser()) ? $this->credential->GetTokenUser() : $this->credential->GetToken();
        $page = '&page=' . (!isset($_GET['page']) ? 1 : $_GET['page']);

        if (isset($_GET['term']['term'])) {

            $term = $this->security->xss_clean($_GET['term']['term']);

            // Request Kategori
            $RequestKategori = $this->api->get("event/get_event_kategori", "is_aktif=1&q=" . $term . $page);

            if ($RequestKategori['status_code'] != 200) {
                return false;
            }

            $tampung = [];
            $counter = 0;
            foreach ($RequestKategori['data'] as $list) :
                $tampung[$counter]['id'] = $list['id_event_kategori'];
                $tampung[$counter]['text'] = $list['nama_kategori'];
                $counter++;
            endforeach;
        } else {
            $RequestKategori = $this->api->get("event/get_event_kategori", "is_aktif=1" . $page);

            if ($RequestKategori['status_code'] != 200) {
                return false;
            }

            $tampung = [];
            $counter = 0;
            foreach ($RequestKategori['data'] as $list) :
                $tampung[$counter]['id'] = $list['id_event_kategori'];
                $tampung[$counter]['text'] = $list['nama_kategori'];
                $counter++;
            endforeach;
        }

        echo json_encode($tampung);
    }
}
