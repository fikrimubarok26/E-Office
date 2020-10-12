<?php
class Library
{
    public function __construct()
    {
        $this->CI = &get_instance();
    }
    // countPages($path) 
    // digunakan untuk menghitung halman file ekstensi .pdf
    // $path : Lokasi file
    public function countPages($path)
    {
        $pdftext = file_get_contents($path);
        $num = preg_match_all("/\/Page\W/", $pdftext, $dummy);
        return $num;
    }

    public function FileSize($path)
    {
        $size = filesize($path);
        $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
        $power = $size > 0 ? floor(log($size, 1024)) : 0;
        return number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];
    }

    public function GetTanggalIndo($DateTime)
    {
        $DateTime = explode('-', $DateTime);
        $Explode = explode(' ', $DateTime[2]);

        // tahun
        $Tahun = $DateTime[0];
        $Tanggal = $Explode[0];
        $Bulan = $this->GetBulan($DateTime[1]);
        $Jam = $Explode[1];
        return $Tanggal . ' ' . $Bulan . ' ' . $Tahun . ' ' . $Jam;
    }

    function timeDiff($firstTime, $lastTime)
    {
        $firstTime = strtotime($firstTime);
        $lastTime = strtotime($lastTime);
        $timeDiff = $lastTime - $firstTime;
        return $timeDiff;
    }

    public function GetBulan($angka)
    {
        $bulan = '';
        switch ($angka) {
            case '01':
                $bulan = 'Januari';
                break;
            case '02':
                $bulan = 'Februari';
                break;
            case '03':
                $bulan = 'Maret';
                break;
            case '04':
                $bulan = 'April';
                break;
            case '05':
                $bulan = 'Mei';
                break;
            case '06':
                $bulan = 'Juni';
                break;
            case '07':
                $bulan = 'Juli';
                break;
            case '08':
                $bulan = 'Agustus';
                break;
            case '09':
                $bulan = 'September';
                break;
            case '10':
                $bulan = 'Oktober';
                break;
            case '11':
                $bulan = 'November';
                break;
            case '12':
                $bulan = 'Desember';
                break;
        }
        return $bulan;
    }

    public function XssClean($input)
    {
        return htmlspecialchars(trim($_POST[$input]));
    }


    public function get_client_ip()
    {
        $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ipaddress = getenv('HTTP_CLIENT_IP');
        else if (getenv('HTTP_X_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        else if (getenv('HTTP_X_FORWARDED'))
            $ipaddress = getenv('HTTP_X_FORWARDED');
        else if (getenv('HTTP_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        else if (getenv('HTTP_FORWARDED'))
            $ipaddress = getenv('HTTP_FORWARDED');
        else if (getenv('REMOTE_ADDR'))
            $ipaddress = getenv('REMOTE_ADDR');
        else
            $ipaddress = 'IP tidak dikenali';
        return $ipaddress;
    }

    // Mendapatkan jenis web browser pengunjung
    function get_client_browser()
    {
        $browser = '';
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'Netscape'))
            $browser = 'Netscape';
        else if (strpos($_SERVER['HTTP_USER_AGENT'], 'Firefox'))
            $browser = 'Firefox';
        else if (strpos($_SERVER['HTTP_USER_AGENT'], 'Chrome'))
            $browser = 'Chrome';
        else if (strpos($_SERVER['HTTP_USER_AGENT'], 'Opera'))
            $browser = 'Opera';
        else if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE'))
            $browser = 'Internet Explorer';
        else
            $browser = 'Other';
        return $browser;
    }

    public function Encode($string, $count = 7)
    {
        $tampung = [];
        for ($x = 0; $x < $count; $x++) {
            if (count($tampung) == 0) $tampung[] = base64_encode($string);
            else $tampung[] = base64_encode($tampung[$x - 1]);
        }

        return str_replace('=', '', ($tampung[count($tampung) - 1]));
    }

    public function Decode($stringDecode, $count, $RemoveSalt = '')
    {
        $tampung = [];
        for ($x = 0; $x < $count; $x++) {
            if (count($tampung) == 0) $tampung[] = base64_decode($stringDecode);
            else $tampung[] = base64_decode($tampung[$x - 1]);
        }

        return str_replace('=', '', ($tampung[count($tampung) - 1]));
    }

    public function PreviousPage($string = '')
    {

        // import session
        $tampung = substr($_SERVER['REQUEST_URI'], 1, strlen($_SERVER['REQUEST_URI']));
        $page = 'https://' . $_SERVER['HTTP_HOST'] . '/' . $tampung;
        $ExplodePage = explode('?', $page);
        $this->CI->session->set_userdata(sha1('academy') . '_previous_page', str_replace($string, '', $ExplodePage[0]));
    }

    public function RedirectPrevious()
    {
        $CekSession = $this->CI->session->userdata('previous_page');
        return !empty($CekSession) ? $CekSession : base_url();
    }
    public function printr($array, $mode = 'exit')
    {
        echo '<pre>' . print_r($array, true) . '</pre>';
        if ($mode == 'exit') exit(1);
    }

    public function ValidateEmail($email)
    {
        if (filter_var($email, FILTER_VALIDATE_EMAIL))
            return true;
        else
            return false;
    }

    public static function slug($text)
    {
        // replace non letter or digits by -
        $text = preg_replace('~[^\pL\d]+~u', '-', $text);

        // transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);

        // trim
        $text = trim($text, '-');

        // remove duplicate -
        $text = preg_replace('~-+~', '-', $text);

        // lowercase
        $text = strtolower($text);

        if (empty($text)) {
            return 'n-a';
        }

        return $text;
    }

    public function UrlMedia($link, $file)
    {
        // return "https://portal.tu-pay.net/tupay_new/{$link}/media/{$file}";
        // return "https://portal.tu-pay.net/tupay_new/";
        // return "https://.id/elearning/{$link}/media/";
        return "https://app.tu-pay.net/tupay_new_dev/{$link}/media/{$file}";
    }

    // 
    public function SettingPagination($PerPage)
    {

        $config['per_page'] = $PerPage; //show record per halaman
        $config["num_links"] = 5; // uri parameter
        $config["uri_segment"] = 3; // uri parameter
        // Membuat Style pagination untuk BootStrap v4
        $config['page_query_string'] = TRUE;
        $config['use_page_numbers'] = TRUE;
        $config['query_string_segment'] = 'page';
        $config['first_link'] = 'First';
        $config['last_link'] = 'Last';
        $config['next_link'] = 'Next';
        $config['prev_link'] = 'Prev';
        $config['full_tag_open'] = '<div class="pagging text-center"><nav><ul class="pagination justify-content-center">';
        $config['full_tag_close'] = '</ul></nav></div>';
        $config['num_tag_open'] = '<li class="page-item datatable-pagination"><span class="page-link">';
        $config['num_tag_close'] = '</span></li>';
        $config['cur_tag_open'] = '<li class="page-item datatable-pagination active"><span class="page-link">';
        $config['cur_tag_close'] = '<span class="sr-only">(current)</span></span></li>';
        $config['next_tag_open'] = '<li class="page-item datatable-pagination"><span class="page-link">';
        $config['next_tagl_close'] = '<span aria-hidden="true">&raquo;</span></span></li>';
        $config['prev_tag_open'] = '<li class="page-item datatable-pagination"><span class="page-link">';
        $config['prev_tagl_close'] = '</span>Next</li>';
        $config['first_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['first_tagl_close'] = '</span></li>';
        $config['last_tag_open'] = '<li class="page-item"><span class="page-link">';
        $config['last_tagl_close'] = '</span></li>';

        return $config;
    }

    function CleanSpecialChar($string)
    {
        $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

        return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
    }
}