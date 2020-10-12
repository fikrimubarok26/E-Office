<?php

class M_surat extends CI_Model
{

    public $tipeKirim = null;
    public $tipe = null;
    public $upk;

    function __construct()
    {
        parent::__construct();
        $this->table = "t_surat";
        $this->table1 = "t_jenis";
        $this->table2 = "t_disposisi";
        $this->column_order = array(null, 'no_surat', 'tanggal_dibuat');
        $this->column_search = array('no_surat', 'tanggal_dibuat');
        $this->order = array('t_surat.id' => 'desc');
    }

    private function _get_datatables_query()
    {

        $this->db->select('*,t_surat.id, t_jenis.jenis');
        $this->db->from($this->table);
        $this->db->join('t_jenis', 't_jenis.id = t_surat.jenis_surat', 'left');
        $this->db->join('t_disposisi', "t_disposisi.id_surat = ". $this->req->encKey('t_surat.id'), 'left');

        if ($this->tipe == null) {
            $this->db->where('t_surat.id_user', $this->session->userdata('id_user'));
        }

        if ($this->tipe != null) {
            $this->db->like('t_surat.tujuan_kirim', $this->session->userdata('id_user'));
            $this->db->or_like('t_surat.aksi_kirim', $this->session->userdata('jabatan'));
            $this->db->or_like('t_disposisi.user_tujuan', $this->session->userdata('jabatan'));
            $this->db->where('status_suratmasuk', '1');
        }
        if ($this->tipeKirim != null) {
            $this->db->where('t_surat.jenis_kirim', $this->tipeKirim);
        }

        $i = 0;

        foreach ($this->column_search as $item) {
            if ($_POST['search']['value']) {

                if ($i === 0) {
                    $this->db->group_start();
                    $this->db->like($item, $_POST['search']['value']);
                } else {
                    $this->db->or_like($item, $_POST['search']['value']);
                }

                if (count($this->column_search) - 1 == $i)
                    $this->db->group_end();
            }
            $i++;
        }

        if (isset($_POST['order'])) {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } else if (isset($this->order)) {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }

    function get_datatables()
    {
        $this->_get_datatables_query();
        if ($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }

    function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all()
    {
        $this->db->where('id_upk', $this->upk);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    function cekPerubahan()
    {
        if ($this->db->affected_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    function insert($data)
    {
        $cek = $this->db->get_where($this->table, array('id_upk' => $this->upk))->num_rows();
        if ($cek == 1) {
            return false;
        } else {
            $this->db->insert($this->table, $data);
            return $this->cekPerubahan();
        }
    }

    function insert_disposisi($data)
    {
        // $cek = $this->db->get_where('t_disposisi', array('id_upk' => $this->upk))->num_rows();
        // if ($cek == 1) {
        // return false;
        // } else {
        $this->db->insert('t_disposisi', $data);
        return $this->cekPerubahan();
        // }
    }

    function get($id)
    {
        return $this->db->get_where($this->table, $this->req->id($id))->row();
    }

    function update($data, $where)
    {
        $this->db->where($where);
        $this->db->update($this->table, $data);
        return $this->cekPerubahan();
    }

    function delete($where)
    {
        $this->db->where($where);
        $this->db->delete($this->table);
        return $this->cekPerubahan();
    }

    function data_aksi()
    {
        $this->db->select('*');
        $this->db->from('t_aksi');
        $this->db->order_by('aksi', 'ASC');
        $this->db->where('id_upk', $this->session->userdata('upk'));
        $query = $this->db->get();
        return $query->result();
    }

    function data_sifat()
    {
        $this->db->select('*');
        $this->db->from('t_sifat');
        $this->db->order_by('sifat', 'ASC');
        $this->db->where('id_upk', $this->session->userdata('upk'));
        $query = $this->db->get();
        return $query->result();
    }

    function data_jenis()
    {
        $this->db->select('*');
        $this->db->from('t_jenis');
        $this->db->order_by('jenis', 'ASC');
        $this->db->where('id_upk', $this->session->userdata('upk'));
        $query = $this->db->get();
        return $query->result();
    }

    // function data_jabatan()
    // {
    //     $this->db->select('*');
    //     $this->db->from('t_jabatan');
    //     $this->db->order_by('jabatan', 'ASC');
    //     $this->db->where('id_upk', $this->session->userdata('upk'));
    //     $query = $this->db->get();
    //     return $query->result();
    // }

    function data_surat($id)
    {
        $this->db->select('*');
        $this->db->from('t_surat');
        $this->db->order_by('id', 'desc');
        $this->db->where('id', $id);
        $this->db->where('id_upk', $this->session->userdata('upk'));
        $query = $this->db->get();
        return $query->result();
    }


    function data_disposisi($id)
    {
        // $this->db->select('*');
        // $this->db->from('t_surat, t_jabatan');
        // $this->db->query("SELECT *  FROM TABLE a JOIN TABLE b ON b.column LIKE '%'+ a.column +'%'")
        // $this->db->join('t_jabatan', 't_jabatan.id LIKE t_surat.aksi_kirim', 'left');
        // $this->db->where($this->req->encKey('t_surat.id'), $id);
        // $query = $this->db->get();
        // return $query->row();

        return $this->db->query("SELECT * FROM t_surat LEFT JOIN t_jabatan ON t_jabatan.id LIKE '%' + t_surat.aksi_kirim + '%' WHERE "
            . $this->req->encKey('t_surat.id') . " = '" . $id . "'")->row();
    }

    function data_user()
    {
        $this->db->select('id as value, nama_user as name');
        $this->db->from('t_user');
        $this->db->order_by('id', 'ASC');
        $this->db->where('id !=', $this->session->userdata('id_user'));
        $this->db->where('id_upk', $this->session->userdata('upk'));
        $this->db->where('level', 3);
        $query = $this->db->get();
        return $query->result();
    }

    function data_upk()
    {
        $this->db->select('*');
        $this->db->from('t_upk');
        $this->db->order_by('id', 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

    function data_jabatan()
    {
        $this->db->select('id as value, jabatan as name');
        $this->db->from('t_jabatan');
        $this->db->order_by('id', 'ASC');
        $this->db->where('id_upk', $this->session->userdata('upk'));
        $query = $this->db->get();
        return $query->result();
    }

    //  function data_jabatan($where = null)
    // {
    //     $this->db->select('*');
    //     $this->db->from('t_jabatan');
    //     $this->db->join('t_upk', 't_upk.id = t_jabatan.id_upk', 'left');
    //     if($where != null)
    //         $this->db->where('t_upk.upk',$where);
    //     $this->db->order_by('t_jabatan.id', 'desc');
    //     $query = $this->db->get();
    //     return $query->result();
    // }

    function getNamaUPK()
    {
        error_reporting(0);
        if ($_SESSION['kodeUpk']) {
            return $_SESSION['kodeUpk'];
        } else {
            $upk = $this->db->get_where('t_upk', ['id' => $_SESSION['upk']])->row();
            $_SESSION['kodeUpk'] = $upk->kode_upk;
            return $upk->kode_upk;
        }
    }

    function getNomorUrut($jenis = 1)
    {
        //1 = masuk 
        //0 = keluar
        
        if ($jenis == 1) {
            $urut = "SM0000";
        } else {
            $urut = "SK0000";
        }

        $where = [
            'jenis_kirim' => $jenis,
            'DATE_FORMAT(tanggal_dibuat, "%Y") = ' => date('Y', time())
        ];

        $bul = date('n');

        switch ($bul) {
            case 1:
                $bulan = "I";
                break;
            case 2:
                $bulan = "II";
                break;
            case 3:
                $bulan = "III";
                break;
            case 4:
                $bulan = "IV";
                break;
            case 5:
                $bulan = "V";
                break;
            case 6:
                $bulan = "VI";
                break;
            case 7:
                $bulan = "VII";
                break;
            case 8:
                $bulan = "VIII";
                break;
            case 9:
                $bulan = "IX";
                break;
            case 10:
                $bulan = "X";
                break;
            case 11:
                $bulan = "XI";
                break;
            case 12:
                $bulan = "XII";
                break;
        }

        $nomor = $this->db->get_where($this->table, $where)->num_rows();
        $panjang = strlen($nomor);
        $urut_ = substr($urut, 0, strlen($urut) - $panjang);
        // $urutna = 
        return [
            'nomor' => "$urut_" . ($nomor + 1),
            'tahun' => date('Y', time()),
            'bulan' => $bulan,
            'upk'   => $this->getNamaUPK()
        ];
    }
}
