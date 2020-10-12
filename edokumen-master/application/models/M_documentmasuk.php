<?php

class M_documentmasuk extends CI_Model
{

    public function Get($id, $IdFile = null)
    {
        // $this->library->printr($_SESSION);
        $IdJabatan = $this->session->jabatan == 0 ? null : $this->session->jabatan;
        $Where = 'WHERE '; // where kalau jabatan tidak ada
        $Match = '';
        if ($IdJabatan != null) { // kalau jabatan ada
            var_dump($IdJabatan);
            $Where = "
            WHERE {$IdJabatan} IN 
            (SELECT doc_akses_file.id_jabatan 
                FROM doc_akses_file 
                    WHERE doc_akses_file.akses = doc_file.akses 
                        AND doc_akses_file.id_jabatan = {$IdJabatan}) AND ";
            $Match = "AND {$IdJabatan} != t_user.id_jabatan "; // jangan tampilkan kalau si pengirim yang melakukannya
        }
        $ArrayWhere[] = $id;
        $AddWhere = '';
        if ($IdFile != null) {
            $AddWhere = ' AND doc_file.id = ? ';
            $ArrayWhere[] = $IdFile;
        }
        $Read = $this->db->query("SELECT 
                                   doc_file.id,
                                   doc_file.tipe_file,
                                   doc_file.judul,
                                   doc_file.last_update,
                                   doc_file.desc,
                                   doc_file.ori_file,
                                   t_user.nama_user,
                                   t_user.gelar_depan,
                                   t_user.gelar_belakang
                                        FROM doc_file 
                                            INNER JOIN t_user ON t_user.id = doc_file.id_user
                                            INNER JOIN doc_jenis_file ON doc_jenis_file.id = doc_file.id_jenis
                                            {$Where} doc_file.id_upk = ? {$Match} {$AddWhere} ORDER BY last_update DESC
                                    ", $ArrayWhere);
        // $this->library->printr($Read->result_array());
        // ->order_by('last_update', 'desc')

        $data['count'] = $Read->num_rows();
        $data['collections'] = [];
        if ($data['count'] > 0)
            $data['collections'] = $Read->result_array();
        // exit(1);
        // $this->library->printr($tampung);
        return $data;
    }
}
