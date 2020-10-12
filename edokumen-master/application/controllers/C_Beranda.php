<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_Beranda extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array(
            'title'  => 'Beranda',
            'menu'   => 'Beranda',
            'konten' => 'User/Beranda',
            'script' => 'beranda'
        );
        $ReadMaintenance = $this->db->order_by('tanggal', 'desc')->get('doc_changelog');
        $data['count'] = $ReadMaintenance->num_rows();
        $data['collections'] = $ReadMaintenance->result_array();
        $now = date('Y-m-d');
        $ReadUpk = $this->db->select("upk,
                                      COUNT(t_user.id) AS JUMLAH_ANGGOTA,
                                      (SELECT COUNT(dfile.id_upk) 
                                        FROM doc_file dfile 
                                            WHERE dfile.id_upk = t_upk.id AND DATE(last_update) = '$now') AS DOKUMEN_MASUK_NOW,

                                        (SELECT COUNT(dfile.id_upk) 
                                        FROM doc_file dfile 
                                            WHERE dfile.id_upk = t_upk.id) AS DOKUMEN_MASUK")



            ->from('t_upk')
            ->join('t_user', 't_user.id_upk = t_upk.id', 'inner')
            // ->where(['t_user.id_upk' => $IdUpk])
            ->group_by('t_upk.id')
            ->get();
        $data['CountUpk'] = $ReadUpk->num_rows();
        $data['CollectionsUpk'] = [];
        if ($data['CountUpk'] > 0)
            $data['CollectionsUpk'] = $ReadUpk->result_array();
        // $this->library->printr($data);
        $this->load->view('templates/templates', $data);
    }
}
