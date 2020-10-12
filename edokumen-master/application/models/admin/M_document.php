<?php

class M_document extends CI_Model
{

    function GetDataJenis($id = null, $page = null)
    {
        try {
            $where = [];
            if ($id != null)
                $where = ['id' => $id];

            if ($page != null) {

                $offset = $page * 10;
                $from = $offset - 10;
            }

            $this->req->select = 'kode_upk';
            $ReadUpk = $this->req->GetData('t_upk', $where);
            if ($ReadUpk->num_rows() <= 0)
                throw new Exception('UPK Tidak diketahui');

            $KodeUpk = $ReadUpk->row()->kode_upk;
            $this->db->select('id,nama_jenis');
            $this->db->from('doc_jenis_file');
            $this->db->where(['kode_upk' => $KodeUpk]);
            if ($page != null)
                $this->db->limit($offset, $from);
            $ReadJenisFile = $this->db->get();
            $data['collections'] = $ReadJenisFile->result_array();
            $data['status'] = 200;
            $data['message'] = 'ok';
            $data = [
                'status_code' => 200,
                'message'     => 'ok',
                'row_count'   => $this->req->CountAll('doc_jenis_file'),
                'collections' => $ReadJenisFile->result_array(),
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

    function GetFileName($id)
    {
        $Read = $this->db->select('judul')
            ->from('doc_file')
            ->where($id)
            ->get();
        $data['count'] = $Read->num_rows();
        $data['collections'] = [];
        if ($data['count'] > 0)
            $data['collections'] = $Read->row()->judul;
        return $data;
    }
    function GetCount($id)
    {
        if ($id == null)
            return false;
        $this->db->select('id');
        $this->db->from('doc_file');
        $this->db->where(['id' => $id]);
        return $this->db->get()->num_rows();
    }

    function GetDataFile($data = null, $page = 1, $q = null, $limit = 10)
    {
        try {
            $where = [];
            if ($data != null)
                $where = $data;

            $start = $page == 1 ? 0 : ($page * $limit) - $limit;
            // echo $start . ' - ' . $end;
            // exit(1);
            $this->req->select = 'id,judul,tipe_file,ori_file,last_update,akses_file';
            $ReadFile = $this->req->GetData('doc_file', $where, [
                'start' => $start,
                'offset' => $limit
            ], $q);

            $this->load->library('pagination');
            $SettingPagination = $this->library->SettingPagination($limit);
            $SettingPagination['base_url'] = base_url('dapur/member/index');
            $SettingPagination['total_rows'] = $q == null ? $this->req->GetData('doc_file', $where)->num_rows() : $ReadFile->num_rows();
            $this->pagination->initialize($SettingPagination);
            $Pagination = $this->pagination->create_links();
            $no = 0;
            $tampung = [];
            foreach ($ReadFile->result_array() as $list) :
                $tampung[$no]['id'] = $list['id'];
                $tampung[$no]['judul'] = $list['judul'];
                $tampung[$no]['ori_file'] = $list['ori_file'];
                $tampung[$no]['last_update'] = $list['last_update'];
                $tampung[$no]['tipe_file'] = $list['tipe_file'];
                $tampung[$no]['akses_file'] = $list['akses_file'];
                $tampung[$no]['file_size'] = $this->library->FileSize('upload/documents/' . $list['ori_file']);
                $no++;
            endforeach;
            $data = [
                'status_code' => 200,
                'message'     => 'ok',
                'row_count'   => $SettingPagination['total_rows'],
                'collections' => $tampung,
                'pagination'  => $Pagination
            ];
            if ($data['row_count'] > 0)
                $data['collections'] = $tampung;
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

    function GetDataUpk($id = null, $page = null)
    {
        try {
            $where = [];
            if ($id != null)
                $where = ['id' => $id];

            if ($page != null) {

                $offset = $page * 10;
                $from = $offset - 10;
            }

            $this->req->select = 'kode_upk,upk,id';
            $this->db->select('t_upk.kode_upk,
                               t_upk.upk, 
                               t_upk.id,
                               (SELECT COUNT(t_jb.id) FROM t_jabatan t_jb WHERE t_upk.id = t_jb.id_upk) AS jumlah_jabatan');
            $this->db->from('t_upk');
            $this->db->where($where);
            $ReadUpk = $this->db->get();
            // $this->req->print($ReadUpk);
            $data['collections'] = $ReadUpk->result_array();
            $data['status'] = 200;
            $data['message'] = 'ok';
            $data = [
                'status_code' => 200,
                'message'     => 'ok',
                'row_count'   => $this->req->CountAll('t_upk'),
                'collections' => $ReadUpk->result_array(),
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

    public function UnduhFile($ID)
    {
        $Read =  $this->db->select('ori_file')
            ->from('doc_file')
            ->where(['id' => $ID])
            ->get();
        $File = null;
        if ($Read->num_rows() > 0) {
            $File = $Read->row()->ori_file;
            $path = 'upload/documents/' . $File;
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . $path . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($path));
            flush(); // Flush system output buffer
            readfile($path);
        }
    }

    public function Unduh($id)
    {
        try {
            if ($id == null)
                throw new Exception('Param kosong');

            if (!is_array($id))
                throw new Exception('File tidak diketahui');


            $this->db->select('judul,ori_file,tipe_file');
            $this->db->from('doc_file');
            $counter = 1;
            foreach ($id as $list) :
                if ($counter++ == 1)
                    $this->db->where(['id' => $this->library->Decode($list, 4)]);
                else
                    $this->db->or_where(['id' => $this->library->Decode($list, 4)]);
            endforeach;
            $Read = $this->db->get();
            if ($Read->num_rows() <= 0)
                throw new Exception('File yang akan diunduh tidak tersedia');


            $zip = new ZipArchive(); // Load zip library  
            $zip_name = time() . "_berkas-saya.zip";  // nama Zip  

            if ($zip->open($zip_name, ZIPARCHIVE::CREATE) !== TRUE)
                throw new Exception('Gagal Mendownload File, silahkan coba beberapa saat lagi');

            // $this->library->printr($Read->result_array());
            foreach ($Read->result_array() as  $list) :
                $zip->addFile("upload/documents/{$list['ori_file']}", str_replace(' ', '-', $this->library->CleanSpecialChar($list['judul'])) . '.' . $list['tipe_file']);
            endforeach;
            $zip->close();

            if (file_exists($zip_name)) {  // Unduh Zip 
                header('Content-type: application/zip');
                header('Content-Disposition: attachment; filename="' . $zip_name . '"');
                readfile($zip_name);
                unlink($zip_name);
            }

            $message = [
                'status' => 200,
                'message' => 'File telah didownload'
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
            return $message;
        }
    }

    public function Hapus($id)
    {

        try {
            if ($id == null)
                throw new Exception('param kosong');

            if (!is_array($id))
                throw new Exception('File tidak diketahui');

            $counter = 1;
            $CounterDoc = 1;
            $WhereDelete = "";
            $WhereDocFile = "";
            foreach ($id as $list) :
                if ($CounterDoc++ == 1)
                    $WhereDocFile .= "WHERE id = '" . $this->library->Decode($list, 4) . "' ";
                else
                    $WhereDocFile .= " OR id = '" . $this->library->Decode($list, 4) . "' ";

                if ($counter++ == 1)
                    $WhereDelete .= "WHERE id = '" . $this->library->Decode($list, 4) . "' ";
                else
                    $WhereDelete .= " OR id = '" . $this->library->Decode($list, 4) . "' ";

            endforeach;

            // read file and unline file 
            $ReadDoc = $this->db->query("SELECT ori_file FROM doc_file {$WhereDocFile}");
            if ($ReadDoc->num_rows() <= 0)
                throw new Exception("file tidak ditemukan");
            $path = 'upload/documents/';
            foreach ($ReadDoc->result_array() as $list) :
                if (file_exists($path . $list['ori_file']))
                    unlink($path . $list['ori_file']);
            endforeach;

            // delete from database
            $this->db->query("DELETE FROM doc_file {$WhereDelete}");

            $message = [
                'status' => 200,
                'message' => 'File telah dihapus'
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
            return $message;
        }
    }
}