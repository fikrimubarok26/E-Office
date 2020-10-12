<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_DocumentsMasuk extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_documentmasuk', 'documentmasuk');
    }

    public function index()
    {
        // $this->req->print($_SESSION);

        $data = array(
            'title'  => 'Dokomen',
            'menu'   => 'Dokumen Saya',
            'script' => 'Documentsmasuk',
            'konten' => 'User/DokumenMasuk/Data'
        );
        $IdUpk = $this->session->upk;
        $ReadUser = $this->documentmasuk->Get($IdUpk);
        $data['count'] = $ReadUser['count'];
        $data['collections'] = $ReadUser['collections'];

        $this->load->view('templates/templates', $data, FALSE);
    }

    public function DetailDokumenMasuk()
    {
        try {
            $input = $this->input->get();
            if (!$input)
                throw new Exception('GET Data method kosong');
            $IdUpk = $this->session->upk;
            $Id = $this->library->Decode($input['id'], 7);
            $ReadDetailUser = $this->documentmasuk->Get($IdUpk, $Id);
            $message = [
                'status_code' => 200,
                'message'    => 'ok',
                'data'       => $ReadDetailUser['collections'],
                'row_count'  => $ReadDetailUser['count']
            ];
        } catch (Exception $Error) {
            $message = [
                'status_code' => 400,
                'message' => $Error->getMessage(),
            ];
        } catch (Throwable $Error) {
            $message = [
                'status_code' => 400,
                'message' => 'Throwable ' . $Error->getMessage(),
            ];
        } finally {
            echo json_encode($message);
        }
    }
}