<?php

class M_JenisDocument extends CI_Model
{
    function GetDataJenis($id = null, $Additional)
    {
        try {
            $where = [];
            if ($id != null)
                $where = ['id' => $id];

            if ($Additional['page'] == null)
                throw new Exception('Param Page not found');

            $this->req->select = 'kode_upk';
            $ReadUpk = $this->req->GetData('t_upk', $where);
            if ($ReadUpk->num_rows() <= 0)
                throw new Exception('UPK Tidak diketahui');
            $KodeUpk = $ReadUpk->row()->kode_upk;

            $start = $Additional['page'] == 1 ? 0 : ($Additional['page'] * $Additional['offset']) - $Additional['offset'];

            $DataWhere = ['kode_upk' => $KodeUpk];
            if (isset($Additional['id']) && $Additional['id'] != null)
                $DataWhere['id'] = $Additional['id'];

            $this->req->select = 'kode_upk,nama_jenis,id';
            $ReadJenis = $this->req->GetData('doc_jenis_file', $DataWhere, [
                'start' => $start,
                'offset' => $Additional['offset']
            ], $Additional['q']);

            $this->load->library('pagination');
            $SettingPagination = $this->library->SettingPagination($Additional['offset']);
            $SettingPagination['base_url'] = base_url('jenis-dokumen/index');
            $SettingPagination['total_rows'] = $Additional['q'] == null ? $this->req->GetData('doc_jenis_file', $DataWhere)->num_rows() : $ReadJenis->num_rows();
            $this->pagination->initialize($SettingPagination);
            $Pagination = $this->pagination->create_links();

            $data = [
                'status_code' => 200,
                'message'     => 'ok',
                'row_count'   => $SettingPagination['total_rows'],
                'collections' => $ReadJenis->result_array(),
                'pagination'  => $Pagination
            ];
        } catch (Exception $Error) {
            $data = [
                'status_code' => 400,
                'message'     => $Error->getMessage()
            ];
        } catch (Throwable $Error) {
            $data = [
                'status_code' => 400,
                'message'     => 'Throwable ' . $Error->getMessage()
            ];
        } finally {
            return $data;
        }
    }

    function GetCount($id)
    {
        if ($id == null)
            return false;
        $this->db->select('id');
        $this->db->from('doc_jenis_file');
        $this->db->where(['id' => $id]);
        return $this->db->get()->num_rows();
    }
}