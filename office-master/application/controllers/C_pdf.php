<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_pdf extends CI_Controller {

	
	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata($this->session->token) == true) {
			redirect(base_url());
		}
		$this->load->model('admin/M_surat', 'surat');
		$this->load->model('admin/M_suratkeluar', 'keluar');
		$this->load->model('admin/M_user', 'user');

	}

	public function index()
	{
		$data = $this->load->view('v_mpdf');
	}

	public function surat_keluar($id)
	{
		$surat = $this->keluar->data_surat($id);
		$data['surat'] = $surat;
		$acc = explode(',',$surat->acc);		

		$namaAcc = [];
		foreach($acc as $list):
			$user = $this->db->get_where('t_user',['id' => $list]);
			if($user->num_rows() > 0){
				$source = $user->row();	
				$namaAcc[] = $source->nama_user;
			}

		endforeach;
		$data['acc'] = $namaAcc;
		$mpdf = new \Mpdf\Mpdf();
		$data = $this->load->view('pdf/surat_keluar', $data, TRUE);
		// $this->load->view('pdf/surat_keluar', $data);
		$mpdf->WriteHTML($data);
		$mpdf->Output();
	
	}

	public function disposisi($id)
	{
		$surat = $this->surat->data_disposisi($id);

		$dikirimKepda = explode(",", $surat->aksi_kirim);

		// print_r($dikirimKepda);

		$namaJabatan = [];
        
		foreach ($dikirimKepda as $key) {
			if ($key != '') {
				$jab = $this->db->get_where('t_jabatan', ['id' => $key])->row();
				$namaJabatan[] = $jab->jabatan;
			}
		}

		// $namaJabatan = substr($namaJabatan, 0, strlen($namaJabatan) - 1);

		// echo $namaJabatan;

		$datana = array(
			'surat' => $surat,
			'dikirimKepda' => $namaJabatan,
		);

		$mpdf = new \Mpdf\Mpdf();
		$data = $this->load->view('pdf/disposisi', $datana, TRUE);
		$mpdf->WriteHTML($data);
		$mpdf->Output();
	}

}