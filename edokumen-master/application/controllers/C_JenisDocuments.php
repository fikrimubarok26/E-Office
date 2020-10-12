<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_JenisDocuments extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_JenisDocument', 'jdocument');
    }

    public function index()
    {
        // $this->req->print($_SESSION);
        $data = array(
            'title'  => 'Jenis Dokumen',
            'menu'   => 'Jenis Dokumen',
            'script' => 'Jenisdocuments',
            'konten' => 'User/Jenis/Data'
        );

        $this->load->view('templates/templates', $data, FALSE);
    }

    public function Get()
    {
        try {
            $IdUpk = $this->session->upk;
            $page = $this->input->get('page') != null ? $this->input->get('page') : 1;
            $id = $this->input->get('id') != null ? $this->library->Decode($this->input->get('id'), 4) : null;
            $q = $this->input->get('q') != null ? $this->input->get('q') : null;
            $offset = $this->input->get('offset');

            $Additional['page'] = $page;
            $Additional['offset'] = $offset;
            if ($id != null)
                $Additional['id'] = $id;
            if ($q != null)
                $Additional['q'] = $q;
            $Additional['q'] = [];
            if ($q != null) {
                $Additional['q'] = [
                    'nama_jenis' => $q,
                ];
            }

            $GetData = $this->jdocument->GetDataJenis($IdUpk, $Additional);
            if ($GetData['status_code'] != 200)
                throw new Exception($GetData['message']);

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
            echo json_encode($message);
        }
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
            $Cari = $this->jdocument->GetCount($DecodeId);
            if ($Cari == false)
                throw new Exception('Data tidak ditemukan');

            $this->db->where(['id' => $DecodeId]);
            $this->db->update('doc_jenis_file', ['nama_jenis' => $input['nama']]);

            $message = [
                'status' => 200,
                'message' => 'jenis dokumen telah di ubah',
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


    public function Hapus()
    {
        try {
            $input = $this->input->post();
            if (!$input)
                throw new Exception('Perlu akses POST');
            $DecodeId = $this->library->Decode($input['id'], 4);
            // $this->library->printr($DecodeId);
            // cari id
            $Cari = $this->jdocument->GetCount($DecodeId);
            if ($Cari == false)
                throw new Exception('Data tidak ditemukan');

            // cari dokumen
            $this->load->model('M_document', 'document');
            $CariDokumen = $this->document->GetCount(['id_jenis' => $DecodeId]);
            if ($CariDokumen > 0)
                throw new Exception('Gagal dihapus, Terdapat <b class="nunito-700">File aktif</b> pada jenis dokumen ini');

            $this->db->where(['id' => $DecodeId]);
            $this->db->delete('doc_jenis_file');
            $message = [
                'status' => 200,
                'message' => 'Jenis dokumen telah dihapus',
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
}
