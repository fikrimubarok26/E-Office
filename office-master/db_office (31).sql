-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2020 at 04:15 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_office`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_akses`
--

CREATE TABLE `t_akses` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_akses` varchar(50) NOT NULL,
  `akses` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_akses`
--

INSERT INTO `t_akses` (`id`, `id_upk`, `kode_akses`, `akses`, `keterangan`) VALUES
(1, 4, '01', 'Lihat Status Surat', ''),
(2, 4, '02', 'Lihat Posisi Surat', ''),
(3, 4, '03', 'Printout', ''),
(4, 7, '01', 'Akses', ''),
(5, 2, '12', '12', '-');

-- --------------------------------------------------------

--
-- Table structure for table `t_aksi`
--

CREATE TABLE `t_aksi` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_aksi` varchar(50) NOT NULL,
  `aksi` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_aksi`
--

INSERT INTO `t_aksi` (`id`, `id_upk`, `kode_aksi`, `aksi`, `keterangan`, `status`) VALUES
(4, 5, '01', 'ACC', '', '1'),
(5, 5, '02', 'LAKSANAKAN', '', '1'),
(6, 5, '03', 'SEGERA', '', '1'),
(7, 5, '04', 'SIAPKAN', '', '1'),
(8, 5, '05', 'TINDAK LANJUTI SEGERA', '', '1'),
(9, 7, '01', 'Aksi', '', '1'),
(10, 8, '01', 'ACC', '', '1'),
(11, 8, '02', 'LAKSANAKAN', '', '1'),
(12, 8, '03', 'SEGERA', '', '1'),
(13, 8, '04', 'SIAPKAN', '', '1'),
(14, 8, '05', 'TINDAK LANJUTI SEGERA', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_changelog`
--

CREATE TABLE `t_changelog` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL DEFAULT '0',
  `action` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 = add 2 = remove 3 = fix',
  `job` varchar(50) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `tgl` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_changelog`
--

INSERT INTO `t_changelog` (`id`, `version`, `action`, `job`, `detail`, `tgl`) VALUES
(1, 'Super Admin', '1', 'Super Admin', 'First Version', '2020-07-09 14:52:34'),
(2, 'Admin UPK', '1', 'Admin UPK', 'Tambah Jenis', '2020-07-10 15:01:05'),
(3, 'Admin UPK', '1', 'Admin UPK', 'Tambah Aksi Surat', '2020-07-10 15:01:46'),
(4, 'Admin UPK', '1', 'Admin UPK', 'Tambah Sifat Surat', '2020-07-11 15:36:17'),
(5, 'Admin UPK', '1', 'Admin UPK', 'Tambah Status Surat', '2020-07-12 20:05:38'),
(6, 'Admin UPK', '1', 'Admin UPK', 'Tambah Jabatan', '2020-07-12 21:05:38'),
(7, 'Admin UPK', '1', 'Penambahan Hak Akses', 'Tambah Staf UPK', '2020-07-12 16:05:38'),
(8, 'Admin UPK', '1', 'Admin UPK', 'Tambah Identitas UPK', '2020-07-13 16:05:38'),
(15, 'Super Admin', '1', 'Identitas Yayasan', 'Pengaturan Identitas Yayasan', '2020-07-09 14:52:34'),
(16, 'Super Admin', '1', 'Tambah Jabatan', 'Tambah Jabatan', '2020-07-09 14:52:34'),
(17, 'Super Admin', '1', 'Tambah UPK', 'Tambah data UPK', '2020-07-09 14:52:34'),
(18, 'Super Admin', '1', 'Tambah Pegawai', 'Tambah Pegawai', '2020-07-09 14:52:34'),
(19, 'Super Admin', '1', 'Tambah Admin UPK', 'Tambah Admin UPK', '2020-07-09 14:52:34'),
(21, 'Staf UPK', '1', 'Surat', 'Perbaikan Form Surat Masuk', '2020-07-13 16:05:38'),
(27, 'Super Admin', '1', 'Login', 'Lihat Password', '2020-07-09 14:52:34'),
(28, 'Admin UPK', '3', 'Admin UPK', 'Hapus Akses Pengajuan Surat', '2020-07-12 21:05:38'),
(29, 'Admin UPK', '1', 'Penambahan Identitas', 'Penambahan Data Pegawai NIY, Email ', '2020-07-12 21:05:38'),
(30, 'Staf UPK', '2', 'Surat Masuk', 'Merubah Dikirim menjadi Alamat Aksi', '2020-07-13 16:05:38'),
(31, 'Admin UPK', '1', 'Admin Persuratan UPK', 'Penambahan Admin persurat UPK', '2020-07-12 21:05:38'),
(32, 'Admin UPK', '2', 'Login Email', 'Login menggunakan Email', '2020-08-14 10:50:42'),
(33, 'Staf UPK', '2', 'Login Email', 'Login menggunakan Email', '2020-08-14 10:51:02'),
(34, 'Admin Persuratan', '2', 'Login Email', 'Login Menggunakan Email', '2020-08-14 10:51:23'),
(35, 'Staf Upk', '2', 'Lampiran', 'Multiple Upload FIle Lampiran PDF', '2020-08-14 10:55:24'),
(36, 'Super Admin', '1', 'Filter Per UPK', 'FIlter per UPK di tab pegawai', '2020-08-14 10:56:07'),
(37, 'Staf UPK', '1', 'Surat Masuk', 'Asal Surat ditambah dari UPK dan Lainnya', '2020-08-14 10:58:37'),
(38, 'Staf UPK', '1', 'Surat Masuk', 'Surat masuk disposisi + penerimaan surat', '2020-08-14 10:58:37'),
(39, 'Staf UPK', '1', 'Histori Surat', 'HIstori Surat', '2020-08-14 10:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `t_config`
--

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL,
  `config` varchar(50) NOT NULL,
  `value` longtext DEFAULT NULL,
  `extra` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_config`
--

INSERT INTO `t_config` (`id`, `config`, `value`, `extra`) VALUES
(1, 'logo', 'f3c5c33fde993c4638547d9ea6a19159.png', ''),
(2, 'nama', 'Sekolah Tinggi Ilmu Kesehatan Bakti Tunas Husada Tasikmalaya', ''),
(3, 'alamat', 'Setiajaya Kecamatan Cibeureum Jl. Cilolohan No. 36 Kel. Kahuripan Tawang, Kota, Kec, Tasikmalaya, https://dianglobaltech2.com/officeu/uploads/config/f3c5c33fde993c4638547d9ea6a19159.pngJawa Barat 46115', ''),
(4, 'no_telp_1', '0265327225', ''),
(5, 'no_telp_2', '0123123', ''),
(6, 'email', 'mail@stikes-bth.ac.id', ''),
(83, 'SY{}logo', 'f3c5c33fde993c4638547d9ea6a19159copy.png', NULL),
(84, 'SY{}nama', 'email@email.com', NULL),
(85, 'SY{}alamat', 'rumah gan', NULL),
(86, 'SY{}no_telp_1', '123123123', NULL),
(87, 'SY{}no_telp_2', '123123123', NULL),
(88, 'SY{}email', '123123123@123.123', NULL),
(90, 'SBTH{}logo', 'c1b9f28b6192b68a2a3e1540a56c48b6.png', NULL),
(91, 'SBTH{}nama', 'STIKES BTH', NULL),
(92, 'SBTH{}alamat', '', NULL),
(93, 'SBTH{}no_telp_1', '1', NULL),
(94, 'SBTH{}no_telp_2', '1', NULL),
(95, 'SBTH{}email', '1@1.com', NULL),
(103, 'LKSAA{}logo', '6063122c728821da00fb574bec1d38ed.jpg', NULL),
(104, 'LKSAA{}nama', 'LKSA Amanah', NULL),
(105, 'LKSAA{}alamat', 'lksa', NULL),
(106, 'LKSAA{}no_telp_1', '2', NULL),
(107, 'LKSAA{}no_telp_2', '2', NULL),
(108, 'LKSAA{}email', '2@2.com', NULL),
(109, 'BTHSH{}logo', '1efe52b60671a397b064196850f83512.jpeg', NULL),
(110, 'BTHSH{}nama', 'BTH Student House', NULL),
(111, 'BTHSH{}alamat', 'bthstudnethouse', NULL),
(112, 'BTHSH{}no_telp_1', '3', NULL),
(113, 'BTHSH{}no_telp_2', '3', NULL),
(114, 'BTHSH{}email', '3@3.com', NULL),
(115, 'BTHSH{}logo', 'dc68c3095d4180491e9a04277fabf151.png', NULL),
(116, 'BTHSH{}nama', 'Klinik BTH', NULL),
(117, 'BTHSH{}alamat', '12', NULL),
(118, 'BTHSH{}no_telp_1', '12', NULL),
(119, 'BTHSH{}no_telp_2', '12', NULL),
(120, 'BTHSH{}email', '12@12', NULL),
(127, 'ketua_yayasan', '60', NULL),
(128, 'ketua', 'Ketua Yayasan', ''),
(129, 'SY{}ketua', 'Ketua Sekretariat Yayasan', NULL),
(130, 'SBTH{}ketua', 'Ketua Stikes BTH', NULL),
(131, 'LKSAA{}ketua', 'Ketua LKSA Amanah', NULL),
(132, 'BTHSH{}ketua', 'Ketua BTH Student House', NULL),
(133, 'BTHSH{}ketua', 'Ketua Klinik BTH', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_disposisi`
--

CREATE TABLE `t_disposisi` (
  `id` int(11) NOT NULL,
  `id_surat` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user_tujuan` text NOT NULL,
  `aksi` int(11) DEFAULT NULL,
  `tgl_disposisi` date NOT NULL,
  `isi_disposisi` text NOT NULL,
  `catatan` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_disposisi`
--

INSERT INTO `t_disposisi` (`id`, `id_surat`, `id_user`, `user_tujuan`, `aksi`, `tgl_disposisi`, `isi_disposisi`, `catatan`, `status`) VALUES
(1, '21a224a4419347f64aeae6b448238698', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 6, '2020-09-02', 'hallo', 'hallo', 0),
(2, '318575da2fed5f44b4f8d55b18d7af3c', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 4, '2020-09-07', 'Isi disposisi aja', 'catatan disposisi', 0),
(3, 'd44254161c5f13d1f9cb071b95ee041b', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 5, '2020-09-09', 'isi', 'catatan', 0),
(4, '388483cca020e9e2d7808020454e7e13', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 5, '2020-09-09', 'isi disposisisisisisi', 'catkajd kawjdawd', 0),
(5, '59afa3280cb21cbc760e7430cbc45b32', 54, '32,33,', NULL, '2020-09-09', 'Isi disposisi / intruksi gan ', 'catatatan gan', 0),
(6, '7fd79eb2ab62666946f3d54d2c4906cf', 65, '36,39,32,31,', NULL, '2020-09-11', 'Isi ini gan', 'catatan ini gan', 0),
(7, '4b2b220aba7752d0950f0dc2a6d53def', 54, '31,39,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', NULL, '2020-09-18', 'awdwa', 'adawdwa', 0),
(8, '1e449642c44b7c1d040469c3bb783596', 54, '31,39,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', NULL, '2020-09-18', 'coba dispsisi', 'awdawdaw', 0),
(9, '9f98d0d2fb8db2ce749b706f8534ad8e', 54, '31,39,39,', NULL, '2020-09-18', 'awokawoawk', 'awwokawokawo', 0),
(10, '243451c8573414ef8b1fe1c9bb359f09', 54, '30,', NULL, '2020-09-18', 'isi', 'catatan', 0),
(11, '613f82c1951af9891773c47e1a38ea7d', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', NULL, '2020-09-18', 'adawd', 'awdawd', 0),
(12, '6f2a24626d19faa7af7396735927e9c6', 54, '31,39,', NULL, '2020-09-18', 'akoawkaowkwao', 'aowkaowkawooawk', 0),
(13, '6f2a24626d19faa7af7396735927e9c6', 54, '31,', NULL, '2020-09-18', 'coba aja', 'coba aja', 0),
(14, 'a7545e654b251b539c4cd3f5452d9ded', 54, '31,', NULL, '2020-09-18', 'percobaan', 'percobaan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_histori`
--

CREATE TABLE `t_histori` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(50) DEFAULT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `aksi` varchar(50) DEFAULT NULL,
  `status_pengiriman` varchar(50) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp(),
  `perihal` text DEFAULT NULL,
  `isi_surat` text DEFAULT NULL,
  `catatan_revisi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_histori`
--

INSERT INTO `t_histori` (`id`, `no_surat`, `nama_user`, `aksi`, `status_pengiriman`, `keterangan`, `waktu_dibuat`, `perihal`, `isi_surat`, `catatan_revisi`) VALUES
(1, '0', 'Agastya Pandu Satriya Utama', 'Buat Surat', 'Agastya Pandu Satriya UtamaMembuat Surat Keluar', '', '2020-09-13 23:23:33', 'peri', 'cat', ''),
(2, '0', 'Agastya Pandu Satriya Utama', 'Buat Surat', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '', '2020-09-13 23:24:10', 'peri', 'cat', ''),
(3, '', 'Agastya Pandu Satriya Utama', 'Buat Surat', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '', '2020-09-13 23:24:33', 'peri', 'cat', ''),
(4, 'SK00010/BA/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '', '2020-09-13 23:25:03', 'awdawd', 'awd', ''),
(5, 'SK0011/SKDT/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '', '2020-09-14 11:53:37', 'TTD minta Ketua Yayasan', 'TTD minta ketua yayasan tes histori', ''),
(6, 'SK0011/SKDT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'IBNU Mengkonfirmasi Surat Keluar', '', '2020-09-14 12:00:05', NULL, NULL, ''),
(7, 'SK00010/BA/SY/IX2020', 'IBNU', 'Surat Keluar Di Tolak', 'IBNU Menolak Surat Keluar', '', '2020-09-14 12:22:20', NULL, NULL, ''),
(8, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-14 12:25:34', 'buat surat keluar ttd upk', 'buat surat keluar ttd upk', ''),
(9, 'SK0012/PRT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-14 12:26:38', NULL, NULL, ''),
(10, 'SK0009/RK/SY/IX2020', 'IBNU', 'Surat Keluar Di Tolak', 'Surat Di tolak', 'IBNU Menolak Surat Keluar', '2020-09-14 12:26:56', NULL, NULL, ''),
(11, '', 'IBNU', 'Approval Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-14 12:47:39', NULL, NULL, 'catatan revisina'),
(12, 'SK0004/PRT/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-14 12:48:19', NULL, NULL, 'catatan revisina dikembalikan'),
(13, 'SK0013/RK/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Agastya Pandu Satriya Utama Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-14 12:57:35', NULL, NULL, ''),
(14, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-14 12:58:29', 'Histori ttd upk acc', 'Histori ttd upk acc', ''),
(15, 'SK0014/PNG/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-14 12:58:40', NULL, NULL, ''),
(16, 'SK0015/BLS/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-14 12:59:28', 'Histori ttd yayasan acc', 'Histori ttd yayasan acc', ''),
(17, 'SK0015/BLS/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-14 12:59:39', NULL, NULL, ''),
(18, 'SK0015/BLS/SY/IX2020', 'Tati Dedah Nurdianah', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'Tati Dedah Nurdianah Mengkonfirmasi Surat Keluar', '2020-09-14 13:00:05', NULL, NULL, ''),
(19, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:29:04', 'coba email', 'coba email', ''),
(20, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:29:09', 'coba email', 'coba email', ''),
(21, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:36:07', 'coba email', 'coba email', ''),
(22, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:37:18', 'coba email', 'coba email', ''),
(23, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:37:26', 'coba email', 'coba email', ''),
(24, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:37:52', 'coba email', 'coba email', ''),
(25, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:38:36', 'coba email', 'coba email', ''),
(26, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:39:28', 'coba email', 'coba email', ''),
(27, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:42:26', 'coba email', 'coba email', ''),
(28, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:42:42', 'coba email', 'coba email', ''),
(29, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 10:43:15', 'coba email', 'coba email', ''),
(30, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:18:10', 'coba email', 'coba email', ''),
(31, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:18:25', 'coba email', 'coba email', ''),
(32, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:18:38', 'coba email', 'coba email', ''),
(33, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:19:15', 'coba email', 'coba email', ''),
(34, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:19:27', 'coba email', 'coba email', ''),
(35, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:20:18', 'coba email', 'coba email', ''),
(36, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:21:14', 'coba email', 'coba email', ''),
(37, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:22:28', 'coba surat keluar', 'coba surat keluar', ''),
(38, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 11:23:00', 'coba surat keluar', 'coba surat keluar', ''),
(39, NULL, 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-18 14:16:22', 'ttd upk', 'ttd upk', ''),
(40, 'SK0026/PTBI/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 14:50:41', NULL, NULL, ''),
(41, 'SK0001/PKWT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 14:58:26', NULL, NULL, ''),
(42, 'SK0001/PKWT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 14:58:51', NULL, NULL, ''),
(43, 'SK0001/PKWT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 14:59:07', NULL, NULL, ''),
(44, 'SK0001/PKWT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:00:13', NULL, NULL, ''),
(45, 'SK0001/PKWT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:31:22', NULL, NULL, ''),
(46, NULL, 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 15:36:09', 'coba surat keluar upk', 'coba surat keluar upk', ''),
(47, 'SK0027/PRM/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:36:39', NULL, NULL, ''),
(48, 'SK0027/PRM/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:39:34', NULL, NULL, ''),
(49, 'SK0027/PRM/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:39:43', NULL, NULL, ''),
(50, 'SK0027/PRM/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:39:56', NULL, NULL, ''),
(51, NULL, 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 15:48:45', 'coba buat', 'coba buat', ''),
(52, NULL, 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 15:50:34', 'coba buat', 'coba buat', ''),
(53, NULL, 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 15:52:41', 'coba buat', 'coba buat', ''),
(54, '', 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 15:53:39', 'coba buat histori', 'coba buat histori', ''),
(55, 'SK0032/PRT/SY/IX2020', 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 15:55:10', 'coba buat histori', 'coba buat histori', ''),
(56, 'SK0032/PRT/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-18 15:55:48', NULL, NULL, ''),
(57, '', 'IBNU', 'Surat Keluar Di Tolak', 'Surat Di tolak', 'IBNU Menolak Surat Keluar', '2020-09-18 15:58:58', NULL, NULL, ''),
(58, 'SK0030/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:02:09', NULL, NULL, 'Ini catatannya'),
(59, 'SK0030/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:02:35', NULL, NULL, 'Ini catatannya'),
(60, 'SK0030/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:03:59', NULL, NULL, 'Ini catatannya'),
(61, 'SK0030/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:08:36', NULL, NULL, 'Ini catatannya'),
(62, 'SK0030/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:09:43', NULL, NULL, 'Ini catatannya'),
(63, 'SK0030/FRL/SY/IX2020', 'Titi Lestia', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Titi Lestia Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-18 16:22:01', NULL, NULL, ''),
(64, 'SK0030/FRL/SY/IX2020', 'Titi Lestia', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Titi Lestia Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-18 16:25:43', NULL, NULL, ''),
(65, 'SK0030/FRL/SY/IX2020', 'Titi Lestia', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Titi Lestia Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-18 16:26:23', NULL, NULL, ''),
(66, 'SK0029/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:30:47', NULL, NULL, 'ini catatan agan'),
(67, 'SK0029/FRL/SY/IX2020', 'Titi Lestia', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Titi Lestia Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-18 16:31:18', NULL, NULL, ''),
(68, 'SK0029/FRL/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:31:54', NULL, NULL, 'Revisi Lagi gan'),
(69, 'SK0028/PTN/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:35:31', NULL, NULL, 'Percobaan Revisi Ini Gan'),
(70, 'SK0001/PKWT/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-18 16:35:47', NULL, NULL, 'Percobaan Revisi Ini Gan'),
(71, 'SK0037/KU/SY/IX2020', 'Titi Lestia', 'Buat Surat', ' Membuat Surat Keluar', 'Titi Lestia Membuat Surat Keluar', '2020-09-18 16:55:46', 'cobacoba', 'cobacoba', ''),
(72, 'SK0038/27/LKSAA/IX2020', 'User LKSA Amanah', 'Buat Surat', ' Membuat Surat Keluar', 'User LKSA Amanah Membuat Surat Keluar', '2020-09-18 23:20:15', 'coba ke zaenal', 'coba ke zaenal', ''),
(73, 'SK0038/27/LKSAA/IX2020', 'User LKSA Amanah', 'Buat Surat', ' Membuat Surat Keluar', 'User LKSA Amanah Membuat Surat Keluar', '2020-09-18 23:20:23', 'coba ke zaenal', 'coba ke zaenal', ''),
(74, 'SK0038/27/LKSAA/IX2020', 'Zaenal Mutakin', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'Zaenal Mutakin Mengkonfirmasi Surat Keluar', '2020-09-18 23:20:52', NULL, NULL, ''),
(75, 'SK0039/04/LKSAA/IX2020', 'User LKSA Amanah', 'Buat Surat', ' Membuat Surat Keluar', 'User LKSA Amanah Membuat Surat Keluar', '2020-09-18 23:21:51', 'coba ketua yayasan', 'coba ketua yayasan', ''),
(76, 'SK0039/04/LKSAA/IX2020', 'Zaenal Mutakin', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'Zaenal Mutakin Mengkonfirmasi Surat Keluar', '2020-09-18 23:22:07', NULL, NULL, ''),
(77, 'SK0039/04/LKSAA/IX2020', 'Tati Dedah Nurdianah', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'Tati Dedah Nurdianah Mengkonfirmasi Surat Keluar', '2020-09-18 23:22:16', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_jabatan`
--

CREATE TABLE `t_jabatan` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_jabatan` varchar(50) NOT NULL,
  `jabatan` varchar(80) NOT NULL,
  `parent` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('1','0') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_jabatan`
--

INSERT INTO `t_jabatan` (`id`, `id_upk`, `kode_jabatan`, `jabatan`, `parent`, `level`, `keterangan`, `status`) VALUES
(30, 5, '01', 'Pembina Yayasan', 0, 1, '', '1'),
(31, 5, '02', 'Pengawas Yayasan', 30, 1, '', '1'),
(32, 5, '03', 'Ketua Yayasan', 0, 1, '', '1'),
(33, 5, '04', 'Sekretaris Yayasan', 32, 1, '', '1'),
(34, 5, '05', 'Bendahara Yayasan', 33, 1, '', '1'),
(35, 5, '06', 'Pekarya', 39, 3, 'Parent STAF TIK', '1'),
(36, 5, '07', 'Kepala Badan Perencanaan, Pengembangan, dan kerjasama', 0, 1, '', '1'),
(37, 5, '08', 'Kabid SDM', 0, 1, '', '1'),
(38, 5, '09', 'Sopir', 0, 1, '', '1'),
(39, 5, '10', 'Staf TIK', 0, 2, 'Parent Ketua Yayasan', '1'),
(40, 5, '11', 'Staf Anggaran dan Pengeluaran', 0, 1, '', '1'),
(41, 5, '12', 'Kasubid Akunting dan Pajak', 0, 1, '', '1'),
(42, 5, '13', 'Staf Adm Pengawas', 0, 1, '', '1'),
(43, 5, '14', 'Staf Adm Sarpras dan Lingkungan', 0, 1, '', '1'),
(44, 5, '15', 'Staf Akunting, anggaran dan Pajak', 0, 1, '', '1'),
(45, 5, '16', 'Staf Adminstrasi dan Umum', 0, 1, '', '1'),
(46, 5, '17', 'Staf TU dan SDM', 0, 1, '', '1'),
(47, 5, '18', 'Kabid Sarpras', 0, 1, '', '1'),
(48, 8, '01', 'Seksi Rumah Tangga', 0, 1, '', '1'),
(49, 8, '02', 'Adm Umum dan Keuangan', 0, 1, '', '1'),
(50, 8, '03', 'Pekarya', 0, 1, '', '1'),
(51, 8, '04', 'Ketua LKSA', 0, 1, '', '1'),
(52, 9, '01', 'Pekarya', 0, 1, '', '1'),
(53, 9, '02', 'Adm Umum dan Keuangan', 0, 1, '', '1'),
(54, 9, '03', 'Satpam', 0, 1, '', '1'),
(55, 9, '04', 'Pembimbing Resident', 0, 1, '', '1'),
(56, 9, '05', 'Sarana dan Prasarana', 0, 1, '', '1'),
(57, 10, '01', 'Pekarya', 0, 1, '', '1'),
(58, 10, '02', 'Adm Umum dan Keuangan', 0, 1, '', '1'),
(59, 10, '03', 'Bidan', 0, 1, '', '1'),
(60, 10, '04', 'Perawat', 0, 1, '', '1'),
(61, 10, '05', 'Ketua Klinik', 0, 1, '', '1'),
(62, 10, '06', 'Ass. Apoteker', 0, 1, '', '1'),
(63, 10, '06', 'Laboran', 0, 1, '', '1'),
(64, 10, '07', 'Terapi Komplementer Psikolog', 0, 1, '', '1'),
(65, 7, '01', 'Cleaning Service', 0, 1, '', '1'),
(66, 7, '02', 'Staf Pusat Karier PMB', 0, 1, '', '1'),
(67, 7, '03', 'Dosen Farmasi', 0, 1, '', '1'),
(68, 7, '04', 'Asisten Praktikum RO', 0, 1, '', '1'),
(69, 7, '05', 'Laboran Analis', 0, 1, '', '1'),
(70, 7, '06', 'Kabag Sarpras', 0, 1, '', '1'),
(71, 7, '07', 'Dosen Keperawatan', 0, 1, '', '1'),
(72, 7, '08', 'Laboran Farmasi', 0, 1, '', '1'),
(73, 7, '09', 'Kepala UPT Perpustakaan', 0, 1, '', '1'),
(74, 7, '10', 'Calon Dosen Analis', 0, 1, '', '1'),
(75, 7, '11', 'Sopir', 0, 1, '', '1'),
(76, 7, '12', 'Dosen', 0, 1, '', '1'),
(77, 7, '13', 'Laboran R O', 0, 1, '', '1'),
(78, 7, '14', 'Laboran Keperawatan', 0, 1, '', '1'),
(79, 7, '15', 'Satpam', 0, 1, '', '1'),
(80, 7, '16', 'Staf TIK', 0, 1, '', '1'),
(81, 7, '17', 'Staf Teknis Lab Analis', 0, 1, '', '1'),
(82, 7, '18', 'Dosen Analis', 0, 1, '', '1'),
(83, 7, '19', 'Wk. Ketua 2', 0, 1, '', '1'),
(84, 7, '20', 'Staff BAA', 0, 1, '', '1'),
(85, 7, '21', 'Staf Teknis Lab Keperawatan', 0, 1, '', '1'),
(86, 7, '22', 'Pustakawan', 0, 1, '', '1'),
(87, 7, '23', 'Ketua STIKes BTH', 0, 1, '', '1'),
(88, 7, '24', 'Pekarya', 0, 1, '', '1'),
(89, 7, '25', 'Sekprod Keperawatan', 0, 1, '', '1'),
(90, 7, '26', 'Kabag BAA', 0, 1, '', '1'),
(91, 7, '27', 'Dosen PSPPA', 0, 1, '', '1'),
(92, 7, '28', 'Staf TU', 0, 1, '', '1'),
(93, 7, '29', 'Sekprod RO', 0, 1, '', '1'),
(94, 7, '30', 'Sekretaris P3M', 0, 1, '', '1'),
(95, 7, '31', 'Laboran PSPPA', 0, 1, '', '1'),
(96, 7, '32', 'Staff Keuangan', 0, 1, '', '1'),
(97, 7, '33', 'Ketua Komisi KEPK', 0, 1, '', '1'),
(98, 7, '34', 'Ketua Prodi Farmasi', 0, 1, '', '1'),
(99, 7, '35', 'Staf BAA', 0, 1, '', '1'),
(100, 7, '36', 'Sekprod Farmasi', 0, 1, '', '1'),
(101, 7, '37', 'Staf Teknis Lab Farmasi', 0, 1, '', '1'),
(102, 7, '38', 'Sekprod PSPPA', 0, 1, '', '1'),
(103, 7, '39', 'Kabag SDM', 0, 1, '', '1'),
(104, 7, '40', 'Kabag Keuangan', 0, 1, '', '1'),
(105, 7, '41', 'Staf Sarana dan Prasarana', 0, 1, '', '1'),
(106, 7, '42', 'Ketua Prodi Analis Kesehatan', 0, 1, '', '1'),
(107, 7, '43', 'Staf Administrasi', 0, 1, '', '1'),
(108, 7, '44', 'Ketua Prodi RO', 0, 1, '', '1'),
(109, 7, '45', 'Ketua Prodi PSPPA', 0, 1, '', '1'),
(110, 7, '46', 'Sekprodi Analis', 0, 1, '', '1'),
(111, 7, '47', 'Ketua BPM', 0, 1, '', '1'),
(112, 7, '48', 'Dosen Farmasi (Dpk)', 0, 1, '', '1'),
(113, 7, '49', 'Ketua LSP', 0, 1, '', '1'),
(114, 7, '50', 'Wk. Ketua 1', 0, 1, '', '1'),
(115, 7, '51', 'Kabag Tata Usaha dan Kerjasama', 0, 1, '', '1'),
(116, 7, '52', 'Staf Keuangan', 0, 1, '', '1'),
(117, 7, '53', 'Wk. Ketua III', 0, 1, '', '1'),
(118, 7, '54', 'Ketua P3M', 0, 1, '', '1'),
(119, 7, '55', 'Ketua Prodi Keperawatan', 0, 1, '', '1'),
(120, 7, '56', 'Kabag Kemahasiswaan', 0, 1, '', '1'),
(121, 7, '57', 'Staf SDM', 0, 1, '', '1'),
(122, 7, '58', 'Staff Kemahasiswaan', 0, 1, '', '1'),
(123, 7, '59', 'Resepsionis', 0, 1, '', '1'),
(124, 7, '60', 'Staf BPM', 0, 1, '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis`
--

CREATE TABLE `t_jenis` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_jenis` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `keterangan` mediumtext DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_jenis`
--

INSERT INTO `t_jenis` (`id`, `id_upk`, `kode_jenis`, `jenis`, `keterangan`, `status`) VALUES
(1, 5, 'UND', 'Undangan', '', '1'),
(2, 5, 'PBN', 'Pemberitahuan ', '', '1'),
(3, 5, 'PRM', 'Permohonan ', '', '1'),
(4, 5, 'PTN', 'Pernyataan ', '', '1'),
(5, 5, 'KT', 'Keterangan ', '', '1'),
(6, 5, 'HMB', 'Himbauan ', '', '1'),
(7, 5, 'KU', 'Kuasa ', '', '1'),
(8, 5, 'SPK', 'Surat Perintah Kerja ', '', '1'),
(9, 5, 'SMPK', 'Surat Perintah Mulai Kerja (internal) ', '', '1'),
(10, 5, 'PNG', 'Pengumuman ', '', '1'),
(11, 5, 'BLS', 'Balasan', '', '1'),
(12, 5, 'BA', 'Berita acara ', '', '1'),
(13, 5, 'PNT', 'Pengantar', '', '1'),
(14, 5, 'RK', 'Rekomendasi ', '', '1'),
(15, 5, 'ST', 'Surat Tugas ', '', '1'),
(16, 5, 'MM', 'Memo ', '', '1'),
(17, 5, 'SKU', 'Surat Keputusan (Umum)', '', '1'),
(18, 5, 'SKSDM', 'Surat Keputusan SDM ', '', '1'),
(19, 5, 'SKDT', 'SK Dosen Tetap ', '', '1'),
(20, 5, 'SKPT', 'SK Pegawai Tetap ', '', '1'),
(21, 5, 'SKPHK', 'SK PHK ', '', '1'),
(22, 5, 'SKSK', 'SK Struktural ', '', '1'),
(23, 5, 'SKPMK', 'SK Penghargaan Masa Kerja ', '', '1'),
(24, 5, 'PRT', 'Peraturan ', '', '1'),
(25, 5, 'PTBI', 'Perjanjian Tugas Belajar / Izin Belajar ', '', '1'),
(26, 5, 'PKWT', 'Perjanjian Kerja Waktu Tertentu ', '', '1'),
(27, 5, 'FRL', 'Formulir', '', '1'),
(28, 10, '01', 'Undangan', '', '1'),
(29, 10, '02', 'Pemberitahuan ', '', '1'),
(30, 10, '03', 'Permohonan ', '', '1'),
(31, 10, '04', 'Pernyataan ', '', '1'),
(32, 10, '05', 'Keterangan ', '', '1'),
(33, 10, '06', 'Himbauan ', '', '1'),
(34, 10, '07', 'Kuasa ', '', '1'),
(35, 10, '08', 'Surat Perintah Kerja ', '', '1'),
(36, 10, '09', 'Surat Perintah Mulai Kerja (internal) ', '', '1'),
(37, 10, '10', 'Pengumuman ', '', '1'),
(38, 10, '11', 'Balasan', '', '1'),
(39, 10, '12', 'Berita acara ', '', '1'),
(40, 10, '13', 'Pengantar', '', '1'),
(41, 10, '14', 'Rekomendasi ', '', '1'),
(42, 10, '15', 'Surat Tugas ', '', '1'),
(43, 10, '16', 'Memo ', '', '1'),
(44, 10, '17', 'Surat Keputusan (Umum)', '', '1'),
(45, 10, '18', 'Surat Keputusan SDM ', '', '1'),
(46, 10, '19', 'SK Dosen Tetap ', '', '1'),
(47, 10, '20', 'SK Pegawai Tetap ', '', '1'),
(48, 10, '21', 'SK PHK ', '', '1'),
(49, 10, '22', 'SK Struktural ', '', '1'),
(50, 10, '23', 'SK Penghargaan Masa Kerja ', '', '1'),
(51, 10, '24', 'Peraturan ', '', '1'),
(52, 10, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', '', '1'),
(53, 10, '26', 'Perjanjian Kerja Waktu Tertentu ', '', '1'),
(54, 10, '27', 'Formulir', '', '1'),
(55, 9, '01', 'Undangan', '', '1'),
(56, 9, '02', 'Pemberitahuan ', '', '1'),
(57, 9, '03', 'Permohonan ', '', '1'),
(58, 9, '04', 'Pernyataan ', '', '1'),
(59, 9, '05', 'Keterangan ', '', '1'),
(60, 9, '06', 'Himbauan ', '', '1'),
(61, 9, '07', 'Kuasa ', '', '1'),
(62, 9, '08', 'Surat Perintah Kerja ', '', '1'),
(63, 9, '09', 'Surat Perintah Mulai Kerja (internal) ', '', '1'),
(64, 9, '10', 'Pengumuman ', '', '1'),
(65, 9, '11', 'Balasan', '', '1'),
(66, 9, '12', 'Berita acara ', '', '1'),
(67, 9, '13', 'Pengantar', '', '1'),
(68, 9, '14', 'Rekomendasi ', '', '1'),
(69, 9, '15', 'Surat Tugas ', '', '1'),
(70, 9, '16', 'Memo ', '', '1'),
(71, 9, '17', 'Surat Keputusan (Umum)', '', '1'),
(72, 9, '18', 'Surat Keputusan SDM ', '', '1'),
(73, 9, '19', 'SK Dosen Tetap ', '', '1'),
(74, 9, '20', 'SK Pegawai Tetap ', '', '1'),
(75, 9, '21', 'SK PHK ', '', '1'),
(76, 9, '22', 'SK Struktural ', '', '1'),
(77, 9, '23', 'SK Penghargaan Masa Kerja ', '', '1'),
(78, 9, '24', 'Peraturan ', '', '1'),
(79, 9, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', '', '1'),
(80, 9, '26', 'Perjanjian Kerja Waktu Tertentu ', '', '1'),
(81, 9, '27', 'Formulir', '', '1'),
(82, 8, '01', 'Undangan', '', '1'),
(83, 8, '02', 'Pemberitahuan ', '', '1'),
(84, 8, '03', 'Permohonan ', '', '1'),
(85, 8, '04', 'Pernyataan ', '', '1'),
(86, 8, '05', 'Keterangan ', '', '1'),
(87, 8, '06', 'Himbauan ', '', '1'),
(88, 8, '07', 'Kuasa ', '', '1'),
(89, 8, '08', 'Surat Perintah Kerja ', '', '1'),
(90, 8, '09', 'Surat Perintah Mulai Kerja (internal) ', '', '1'),
(91, 8, '10', 'Pengumuman ', '', '1'),
(92, 8, '11', 'Balasan', '', '1'),
(93, 8, '12', 'Berita acara ', '', '1'),
(94, 8, '13', 'Pengantar', '', '1'),
(95, 8, '14', 'Rekomendasi ', '', '1'),
(96, 8, '15', 'Surat Tugas ', '', '1'),
(97, 8, '16', 'Memo ', '', '1'),
(98, 8, '17', 'Surat Keputusan (Umum)', '', '1'),
(99, 8, '18', 'Surat Keputusan SDM ', '', '1'),
(100, 8, '19', 'SK Dosen Tetap ', '', '1'),
(101, 8, '20', 'SK Pegawai Tetap ', '', '1'),
(102, 8, '21', 'SK PHK ', '', '1'),
(103, 8, '22', 'SK Struktural ', '', '1'),
(104, 8, '23', 'SK Penghargaan Masa Kerja ', '', '1'),
(105, 8, '24', 'Peraturan ', '', '1'),
(106, 8, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', '', '1'),
(107, 8, '26', 'Perjanjian Kerja Waktu Tertentu ', '', '1'),
(108, 8, '27', 'Formulir', '', '1'),
(109, 7, '01', 'Undangan', '', '1'),
(110, 7, '02', 'Pemberitahuan ', '', '1'),
(111, 7, '03', 'Permohonan ', '', '1'),
(112, 7, '04', 'Pernyataan ', '', '1'),
(113, 7, '05', 'Keterangan ', '', '1'),
(114, 7, '06', 'Himbauan ', '', '1'),
(115, 7, '07', 'Kuasa ', '', '1'),
(116, 7, '08', 'Surat Perintah Kerja ', '', '1'),
(117, 7, '09', 'Surat Perintah Mulai Kerja (internal) ', '', '1'),
(118, 7, '10', 'Pengumuman ', '', '1'),
(119, 7, '11', 'Balasan', '', '1'),
(120, 7, '12', 'Berita acara ', '', '1'),
(121, 7, '13', 'Pengantar', '', '1'),
(122, 7, '14', 'Rekomendasi ', '', '1'),
(123, 7, '15', 'Surat Tugas ', '', '1'),
(124, 7, '16', 'Memo ', '', '1'),
(125, 7, '17', 'Surat Keputusan (Umum)', '', '1'),
(126, 7, '18', 'Surat Keputusan SDM ', '', '1'),
(127, 7, '19', 'SK Dosen Tetap ', '', '1'),
(128, 7, '20', 'SK Pegawai Tetap ', '', '1'),
(129, 7, '21', 'SK PHK ', '', '1'),
(130, 7, '22', 'SK Struktural ', '', '1'),
(131, 7, '23', 'SK Penghargaan Masa Kerja ', '', '1'),
(132, 7, '24', 'Peraturan ', '', '1'),
(133, 7, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', '', '1'),
(134, 7, '26', 'Perjanjian Kerja Waktu Tertentu ', '', '1'),
(135, 7, '27', 'Formulir', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_notif`
--

CREATE TABLE `t_notif` (
  `notif` varchar(50) NOT NULL,
  `id_surat_masuk` int(11) DEFAULT NULL,
  `id_surat_keluar` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `tipe` int(11) NOT NULL,
  `opened` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_notif`
--

INSERT INTO `t_notif` (`notif`, `id_surat_masuk`, `id_surat_keluar`, `id_user`, `tipe`, `opened`) VALUES
('1600323379', 1, NULL, 54, 1, '0'),
('1600323567', 2, NULL, 54, 1, '0'),
('1600323567', 2, NULL, 56, 1, '0'),
('1600323585', 3, NULL, 54, 1, '0'),
('1600323585', 3, NULL, 56, 1, '0'),
('1600323683', 4, NULL, 54, 1, '0'),
('1600323683', 4, NULL, 55, 1, '0'),
('1600323683', 4, NULL, 56, 1, '0'),
('1600323683', 4, NULL, 57, 1, '0'),
('1600323683', 4, NULL, 58, 1, '0'),
('1600323683', 4, NULL, 59, 1, '0'),
('1600323683', 4, NULL, 60, 1, '0'),
('1600323683', 4, NULL, 61, 1, '0'),
('1600323683', 4, NULL, 62, 1, '0'),
('1600323683', 4, NULL, 63, 1, '0'),
('1600323683', 4, NULL, 64, 1, '0'),
('1600323683', 4, NULL, 65, 1, '0'),
('1600323683', 4, NULL, 66, 1, '0'),
('1600323683', 4, NULL, 67, 1, '0'),
('1600323683', 4, NULL, 68, 1, '0'),
('1600323683', 4, NULL, 69, 1, '0'),
('1600323683', 4, NULL, 70, 1, '0'),
('1600323683', 4, NULL, 71, 1, '0'),
('1600323683', 4, NULL, 72, 1, '0'),
('1600323683', 4, NULL, 73, 1, '0'),
('1600323683', 4, NULL, 74, 1, '0'),
('1600323683', 4, NULL, 75, 1, '0'),
('1600323683', 4, NULL, 76, 1, '0'),
('1600323683', 4, NULL, 77, 1, '0'),
('1600323683', 4, NULL, 78, 1, '0'),
('1600323683', 4, NULL, 518, 1, '0'),
('1600323683', 4, NULL, 519, 1, '0'),
('1600323840', 5, NULL, 54, 1, '0'),
('1600323840', 5, NULL, 55, 1, '0'),
('1600323840', 5, NULL, 56, 1, '0'),
('1600323840', 5, NULL, 57, 1, '0'),
('1600323840', 5, NULL, 58, 1, '0'),
('1600323840', 5, NULL, 59, 1, '0'),
('1600323840', 5, NULL, 60, 1, '0'),
('1600323840', 5, NULL, 61, 1, '0'),
('1600323840', 5, NULL, 62, 1, '0'),
('1600323840', 5, NULL, 63, 1, '0'),
('1600323840', 5, NULL, 64, 1, '0'),
('1600323840', 5, NULL, 65, 1, '0'),
('1600323840', 5, NULL, 66, 1, '0'),
('1600323840', 5, NULL, 67, 1, '0'),
('1600323840', 5, NULL, 68, 1, '0'),
('1600323840', 5, NULL, 69, 1, '0'),
('1600323840', 5, NULL, 70, 1, '0'),
('1600323840', 5, NULL, 71, 1, '0'),
('1600323840', 5, NULL, 72, 1, '0'),
('1600323840', 5, NULL, 73, 1, '0'),
('1600323840', 5, NULL, 74, 1, '0'),
('1600323840', 5, NULL, 75, 1, '0'),
('1600323840', 5, NULL, 76, 1, '0'),
('1600323840', 5, NULL, 77, 1, '0'),
('1600323840', 5, NULL, 78, 1, '0'),
('1600323840', 5, NULL, 518, 1, '0'),
('1600323840', 5, NULL, 519, 1, '0'),
('1600323888', 6, NULL, 54, 1, '0'),
('1600323888', 6, NULL, 55, 1, '0'),
('1600323888', 6, NULL, 56, 1, '0'),
('1600323888', 6, NULL, 57, 1, '0'),
('1600323888', 6, NULL, 58, 1, '0'),
('1600323888', 6, NULL, 59, 1, '0'),
('1600323888', 6, NULL, 60, 1, '0'),
('1600323888', 6, NULL, 61, 1, '0'),
('1600323888', 6, NULL, 62, 1, '0'),
('1600323888', 6, NULL, 63, 1, '0'),
('1600323888', 6, NULL, 64, 1, '0'),
('1600323888', 6, NULL, 65, 1, '0'),
('1600323888', 6, NULL, 66, 1, '0'),
('1600323888', 6, NULL, 67, 1, '0'),
('1600323888', 6, NULL, 68, 1, '0'),
('1600323888', 6, NULL, 69, 1, '0'),
('1600323888', 6, NULL, 70, 1, '0'),
('1600323888', 6, NULL, 71, 1, '0'),
('1600323888', 6, NULL, 72, 1, '0'),
('1600323888', 6, NULL, 73, 1, '0'),
('1600323888', 6, NULL, 74, 1, '0'),
('1600323888', 6, NULL, 75, 1, '0'),
('1600323888', 6, NULL, 76, 1, '0'),
('1600323888', 6, NULL, 77, 1, '0'),
('1600323888', 6, NULL, 78, 1, '0'),
('1600323888', 6, NULL, 518, 1, '0'),
('1600323888', 6, NULL, 519, 1, '0'),
('1600323899', 7, NULL, 54, 1, '0'),
('1600323899', 7, NULL, 55, 1, '0'),
('1600323899', 7, NULL, 56, 1, '0'),
('1600323899', 7, NULL, 57, 1, '0'),
('1600323899', 7, NULL, 58, 1, '0'),
('1600323899', 7, NULL, 59, 1, '0'),
('1600323899', 7, NULL, 60, 1, '0'),
('1600323899', 7, NULL, 61, 1, '0'),
('1600323899', 7, NULL, 62, 1, '0'),
('1600323899', 7, NULL, 63, 1, '0'),
('1600323899', 7, NULL, 64, 1, '0'),
('1600323899', 7, NULL, 65, 1, '0'),
('1600323899', 7, NULL, 66, 1, '0'),
('1600323899', 7, NULL, 67, 1, '0'),
('1600323899', 7, NULL, 68, 1, '0'),
('1600323899', 7, NULL, 69, 1, '0'),
('1600323899', 7, NULL, 70, 1, '0'),
('1600323899', 7, NULL, 71, 1, '0'),
('1600323899', 7, NULL, 72, 1, '0'),
('1600323899', 7, NULL, 73, 1, '0'),
('1600323899', 7, NULL, 74, 1, '0'),
('1600323899', 7, NULL, 75, 1, '0'),
('1600323899', 7, NULL, 76, 1, '0'),
('1600323899', 7, NULL, 77, 1, '0'),
('1600323899', 7, NULL, 78, 1, '0'),
('1600323899', 7, NULL, 518, 1, '0'),
('1600323899', 7, NULL, 519, 1, '0'),
('1600324138', 8, NULL, 54, 1, '0'),
('1600324156', 9, NULL, 54, 1, '0'),
('1600324496', 10, NULL, 54, 1, '0'),
('1600324496', 10, NULL, 56, 1, '0'),
('1600324537', 11, NULL, 54, 1, '0'),
('1600324537', 11, NULL, 56, 1, '0'),
('1600324548', 12, NULL, 54, 1, '0'),
('1600324548', 12, NULL, 56, 1, '0'),
('1600324567', 13, NULL, 54, 1, '0'),
('1600324567', 13, NULL, 56, 1, '0'),
('1600324589', 14, NULL, 54, 1, '0'),
('1600324589', 14, NULL, 56, 1, '0'),
('1600324607', 15, NULL, 54, 1, '0'),
('1600324607', 15, NULL, 56, 1, '0'),
('1600324624', 16, NULL, 54, 1, '0'),
('1600324624', 16, NULL, 56, 1, '0'),
('1600327752', 18, NULL, 54, 1, '0'),
('1600327752', 18, NULL, 56, 1, '0'),
('1600327798', 19, NULL, 54, 1, '0'),
('1600327798', 19, NULL, 56, 1, '0'),
('1600327810', 20, NULL, 54, 1, '0'),
('1600327810', 20, NULL, 56, 1, '0'),
('1600327817', 21, NULL, 56, 1, '0'),
('1600327828', 22, NULL, 56, 1, '0'),
('1600327845', 23, NULL, 56, 1, '0'),
('1600327865', 24, NULL, 56, 1, '0'),
('1600327892', 26, NULL, 56, 1, '0'),
('1600327892', 26, NULL, 54, 1, '0'),
('1600327928', 27, NULL, 54, 1, '0'),
('1600327956', 28, NULL, 54, 1, '0'),
('1600327956', 28, NULL, 56, 1, '0'),
('1600327966', 29, NULL, 54, 1, '0'),
('1600327966', 29, NULL, 56, 1, '0'),
('1600328063', 30, NULL, 54, 1, '0'),
('1600328063', 30, NULL, 56, 1, '0'),
('1600328072', 31, NULL, 54, 1, '0'),
('1600328072', 31, NULL, 56, 1, '0'),
('1600328115', 32, NULL, 54, 1, '0'),
('1600328115', 32, NULL, 56, 1, '0'),
('1600328136', 33, NULL, 54, 1, '0'),
('1600328136', 33, NULL, 56, 1, '0'),
('1600328165', 34, NULL, 54, 1, '0'),
('1600328165', 34, NULL, 56, 1, '0'),
('1600328234', 35, NULL, 54, 1, '0'),
('1600328234', 35, NULL, 56, 1, '0'),
('1600328273', 36, NULL, 54, 1, '0'),
('1600328273', 36, NULL, 56, 1, '0'),
('1600328306', 37, NULL, 54, 1, '0'),
('1600328306', 37, NULL, 56, 1, '0'),
('1600328332', 38, NULL, 54, 1, '0'),
('1600328332', 38, NULL, 56, 1, '0'),
('1600328426', 39, NULL, 54, 1, '0'),
('1600328426', 39, NULL, 56, 1, '0'),
('1600328471', 40, NULL, 54, 1, '0'),
('1600328471', 40, NULL, 56, 1, '0'),
('1600328499', 41, NULL, 54, 1, '0'),
('1600328499', 41, NULL, 56, 1, '0'),
('1600328606', 42, NULL, 54, 1, '0'),
('1600328606', 42, NULL, 56, 1, '0'),
('1600328708', 43, NULL, 54, 1, '0'),
('1600328708', 43, NULL, 56, 1, '0'),
('1600328720', 44, NULL, 54, 1, '0'),
('1600328720', 44, NULL, 56, 1, '0'),
('1600328857', 45, NULL, 54, 1, '0'),
('1600328857', 45, NULL, 56, 1, '0'),
('1600329163', 46, NULL, 54, 1, '0'),
('1600329163', 46, NULL, 56, 1, '0'),
('1600329163', 46, NULL, 55, 1, '0'),
('1600329163', 46, NULL, 57, 1, '0'),
('1600329163', 46, NULL, 58, 1, '0'),
('1600329163', 46, NULL, 59, 1, '0'),
('1600329163', 46, NULL, 60, 1, '0'),
('1600329163', 46, NULL, 61, 1, '0'),
('1600329163', 46, NULL, 62, 1, '0'),
('1600329163', 46, NULL, 63, 1, '0'),
('1600329163', 46, NULL, 64, 1, '0'),
('1600329163', 46, NULL, 65, 1, '0'),
('1600329163', 46, NULL, 66, 1, '0'),
('1600329163', 46, NULL, 67, 1, '0'),
('1600329163', 46, NULL, 68, 1, '0'),
('1600329163', 46, NULL, 69, 1, '0'),
('1600329163', 46, NULL, 70, 1, '0'),
('1600329163', 46, NULL, 71, 1, '0'),
('1600329163', 46, NULL, 72, 1, '0'),
('1600329163', 46, NULL, 73, 1, '0'),
('1600329163', 46, NULL, 74, 1, '0'),
('1600329163', 46, NULL, 75, 1, '0'),
('1600329163', 46, NULL, 76, 1, '0'),
('1600329163', 46, NULL, 77, 1, '0'),
('1600329163', 46, NULL, 78, 1, '0'),
('1600329163', 46, NULL, 518, 1, '0'),
('1600329163', 46, NULL, 519, 1, '0'),
('1600329173', 47, NULL, 54, 1, '0'),
('1600329173', 47, NULL, 56, 1, '0'),
('1600329173', 47, NULL, 55, 1, '0'),
('1600329173', 47, NULL, 57, 1, '0'),
('1600329173', 47, NULL, 58, 1, '0'),
('1600329173', 47, NULL, 59, 1, '0'),
('1600329173', 47, NULL, 60, 1, '0'),
('1600329173', 47, NULL, 61, 1, '0'),
('1600329173', 47, NULL, 62, 1, '0'),
('1600329173', 47, NULL, 63, 1, '0'),
('1600329173', 47, NULL, 64, 1, '0'),
('1600329173', 47, NULL, 65, 1, '0'),
('1600329173', 47, NULL, 66, 1, '0'),
('1600329173', 47, NULL, 67, 1, '0'),
('1600329173', 47, NULL, 68, 1, '0'),
('1600329173', 47, NULL, 69, 1, '0'),
('1600329173', 47, NULL, 70, 1, '0'),
('1600329173', 47, NULL, 71, 1, '0'),
('1600329173', 47, NULL, 72, 1, '0'),
('1600329173', 47, NULL, 73, 1, '0'),
('1600329173', 47, NULL, 74, 1, '0'),
('1600329173', 47, NULL, 75, 1, '0'),
('1600329173', 47, NULL, 76, 1, '0'),
('1600329173', 47, NULL, 77, 1, '0'),
('1600329173', 47, NULL, 78, 1, '0'),
('1600329173', 47, NULL, 518, 1, '0'),
('1600329173', 47, NULL, 519, 1, '0'),
('1600329390', 48, NULL, 54, 1, '0'),
('1600329390', 48, NULL, 57, 1, '0'),
('1600329390', 48, NULL, 56, 1, '0'),
('1600329477', 49, NULL, 54, 1, '0'),
('1600329477', 49, NULL, 57, 1, '0'),
('1600329477', 49, NULL, 56, 1, '0'),
('1600329490', 50, NULL, 54, 1, '0'),
('1600329490', 50, NULL, 57, 1, '0'),
('1600329490', 50, NULL, 56, 1, '0'),
('1600329511', 51, NULL, 54, 1, '0'),
('1600329511', 51, NULL, 57, 1, '0'),
('1600329511', 51, NULL, 56, 1, '0'),
('1600329520', 52, NULL, 54, 1, '0'),
('1600329520', 52, NULL, 57, 1, '0'),
('1600329520', 52, NULL, 56, 1, '0'),
('1600329555', 53, NULL, 54, 1, '0'),
('1600329555', 53, NULL, 57, 1, '0'),
('1600329555', 53, NULL, 56, 1, '0'),
('1600329562', 54, NULL, 54, 1, '0'),
('1600329562', 54, NULL, 57, 1, '0'),
('1600329562', 54, NULL, 56, 1, '0'),
('1600329582', 55, NULL, 54, 1, '0'),
('1600329582', 55, NULL, 57, 1, '0'),
('1600329582', 55, NULL, 56, 1, '0'),
('1600329594', 56, NULL, 54, 1, '0'),
('1600329594', 56, NULL, 57, 1, '0'),
('1600329594', 56, NULL, 56, 1, '0'),
('1600329606', 57, NULL, 54, 1, '0'),
('1600329606', 57, NULL, 57, 1, '0'),
('1600329606', 57, NULL, 56, 1, '0'),
('1600329617', 58, NULL, 54, 1, '0'),
('1600329617', 58, NULL, 57, 1, '0'),
('1600329617', 58, NULL, 56, 1, '0'),
('1600329625', 59, NULL, 54, 1, '0'),
('1600329625', 59, NULL, 57, 1, '0'),
('1600329625', 59, NULL, 56, 1, '0'),
('1600329652', 60, NULL, 54, 1, '0'),
('1600329652', 60, NULL, 57, 1, '0'),
('1600329652', 60, NULL, 56, 1, '0'),
('1600329799', 61, NULL, 54, 1, '0'),
('1600329799', 61, NULL, 57, 1, '0'),
('1600329799', 61, NULL, 56, 1, '0'),
('1600329829', 62, NULL, 54, 1, '0'),
('1600329829', 62, NULL, 57, 1, '0'),
('1600329829', 62, NULL, 56, 1, '0'),
('1600329926', 63, NULL, 54, 1, '0'),
('1600329926', 63, NULL, 57, 1, '0'),
('1600329926', 63, NULL, 56, 1, '0'),
('1600329943', 64, NULL, 54, 1, '0'),
('1600329943', 64, NULL, 57, 1, '0'),
('1600329943', 64, NULL, 56, 1, '0'),
('1600330160', 65, NULL, 54, 1, '0'),
('1600330160', 65, NULL, 57, 1, '0'),
('1600330160', 65, NULL, 56, 1, '0'),
('1600357696', 66, NULL, 520, 1, '0'),
('1600357696', 66, NULL, 57, 1, '0'),
('1600357696', 66, NULL, 56, 1, '0'),
('1600357793', 67, NULL, 520, 1, '0'),
('1600357793', 67, NULL, 57, 1, '0'),
('1600357793', 67, NULL, 56, 1, '0'),
('1600357869', 68, NULL, 520, 1, '0'),
('1600357869', 68, NULL, 57, 1, '0'),
('1600357869', 68, NULL, 56, 1, '0'),
('1600358617', 69, NULL, 520, 1, '0'),
('1600358617', 69, NULL, 57, 1, '0'),
('1600358617', 69, NULL, 56, 1, '0'),
('1600358788', 70, NULL, 520, 1, '0'),
('1600358880', 71, NULL, 520, 1, '0'),
('1600358977', 72, NULL, 520, 1, '0'),
('1600359080', 73, NULL, 520, 1, '0'),
('1600359132', 74, NULL, 54, 1, '0'),
('1600359136', 75, NULL, 54, 1, '0'),
('1600359149', 76, NULL, 54, 1, '0'),
('1600359185', 77, NULL, 520, 1, '0'),
('1600360531', 78, NULL, 520, 1, '0'),
('1600396894', 118, NULL, 54, 1, '0'),
('1600396894', 118, NULL, 520, 1, '0'),
('1600396921', 119, NULL, 54, 1, '0'),
('1600396921', 119, NULL, 520, 1, '0'),
('1600396932', 120, NULL, 54, 1, '0'),
('1600396932', 120, NULL, 520, 1, '0'),
('1600396932', 120, NULL, 57, 1, '0'),
('1600396932', 120, NULL, 56, 1, '0'),
('1600396938', 121, NULL, 520, 1, '0'),
('1600396938', 121, NULL, 57, 1, '0'),
('1600396938', 121, NULL, 56, 1, '0'),
('1600398368', 129, NULL, 520, 1, '0'),
('1600398368', 129, NULL, 57, 1, '0'),
('1600398368', 129, NULL, 56, 1, '0'),
('1600398423', 131, NULL, 520, 1, '0'),
('1600398423', 131, NULL, 57, 1, '0'),
('1600398423', 131, NULL, 56, 1, '0'),
('1600398440', 132, NULL, 520, 1, '0'),
('1600398440', 132, NULL, 57, 1, '0'),
('1600398440', 132, NULL, 56, 1, '0'),
('1600398473', 133, NULL, 520, 1, '0'),
('1600398473', 133, NULL, 57, 1, '0'),
('1600398473', 133, NULL, 56, 1, '0'),
('1600398523', 135, NULL, 520, 1, '0'),
('1600398523', 135, NULL, 57, 1, '0'),
('1600398523', 135, NULL, 56, 1, '0'),
('1600399892', 137, NULL, 520, 1, '0'),
('1600487072', 138, NULL, 519, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `t_quotes`
--

CREATE TABLE `t_quotes` (
  `id` int(11) NOT NULL,
  `quotes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_quotes`
--

INSERT INTO `t_quotes` (`id`, `quotes`) VALUES
(1, 'Jangan lupa bahagia dan bersyukur :) -Developer'),
(2, 'Berfikir positif adalah cara terbaik ketika kita tidak punya opsi'),
(3, 'Tuhan adalah pembuat skenario terbaik yang pernah ada'),
(4, 'Ingatkan dirimu tidak apa untuk tidak menjadi orang yang sempurna karena pada dasarnya tidak ada yang sempurna'),
(5, 'Kamu hebat, sudah berjuang sejauh ini -Developer'),
(6, 'Semangat ya :) -Developer'),
(7, 'Alon Alon Waton Klakon\r\nPelan-pelan saja asal terlaksana, Bukan berarti hidup tanpa usaha, hanya mengikuti aliran air, Namun tetap berusaha sekuat tenaga tapi tidak memaksakan diri'),
(8, 'Urip iku Urup\r\nHidup itu nyala, hidup itu hendaknya memberikan manfaat bagi orang lain di sekitar kita, semakin besar manfaat yang bisa kita berikan tentu akan lebih baik'),
(9, 'Bukan tuhan tidak sayang, tapi hanya waktunya saja yang belum '),
(10, 'Satu-satunya kebijaksanaan sejati adalah mengetahui bahwa Anda tidak mengetahui apa-apa. -Socrates'),
(11, 'Cobalah dulu, baru cerita. Pahamilah dulu, baru menjawab. Pikirlah dulu, baru berkata. Dengarlah dulu, baru beri penilaian. Bekerjalah dulu, baru berharap. -Socrates'),
(12, 'Untuk menggerakan bumi, kau harus menggerakan dirimu terlebih dahulu. -Socrates'),
(13, 'Ketahuilah dirimu sendiri. -Socrates'),
(14, 'Kesejahteraaan memberikan peringatan, sedangkan bencana memberi nasihat. -Socrates'),
(15, 'Dalam hidup ini, ada hal-hal yang tak ingin Anda lanjutkan, namun Anda terlalu takut untuk mengakhirinya. -Socrates'),
(16, 'Hanya kepada orang yang halus perasaannya, keindahan dan rahasia alam ini dibukakan Tuhan untuknya. -Socrates'),
(17, 'Ilmu seperti udara. Ia begitu banyak di sekeliling kita. Kamu bisa mendapatkannya dimanapun dan kapanpun. -Socrates'),
(18, 'Cara untuk mendapatkan reputasi yang baik adalah dengan berusaha keras untuk menjadi apa yang Anda inginkan.-Socrates'),
(19, 'Belajar tanpa berpikir itu tidaklah berguna, tapi berpikir tanpa belajar itu sangatlah berbahaya! -Soekarno'),
(20, 'Bangsa yang besar adalah bangsa yang menghormati jasa pahlawannya. -Soekarno'),
(21, 'Barangsiapa ingin mutiara, harus berani terjun di lautan yang dalam. -Soekarno'),
(22, 'Jika kita memiliki keinginan yang kuat dari dalam hati, maka seluruh alam semesta akan bahu membahu mewujudkannya. -Soekarno'),
(23, 'Gantungkan cita-cita mu setinggi langit! Bermimpilah setinggi langit. Jika engkau jatuh, engkau akan jatuh di antara bintang-bintang. -Soekarno'),
(24, 'Bunga mawar tidak mempropagandakan harum semerbaknya, dengan sendirinya harum semerbaknya itu tersebar di sekelilingnya. -Soekarno'),
(25, 'Aku akan memuji apa yang baik, tak pandang sesuatu itu datangnya dari seorang komunis, islam, atau seorang Hopi Indian. -Soekarno'),
(26, 'Jadikan deritaku ini sebagai kesaksian bahwa kekuasaan seorang Presiden sekalipun ada batasnya. Karena kekuasaan yang langgeng hanya kekuasaan rakyat. Dan diatas segalanya adalah Kekuasaan Tuhan Yang Maha Esa. -Soekarno'),
(27, 'Perjuanganku lebih mudah karena mengusir penjajah, tapi perjuanganmu akan lebih sulit karena melawan bangsamu sendiri. -Soekarno'),
(28, 'Tulislah tentang aku dengan tinta hitam atau tinta putihmu. Biarlah sejarah membaca dan menjawabnya.  -Soekarno'),
(29, 'Aku lebih suka lukisan samudra yang gelombangnya menggebu-gebu daripada lukisan sawah yang adem ayem tentram. -Soekarno'),
(30, 'Di negeri yang baik, airmata tak pernah dihapus oleh tisu, tapi oleh tangan kekasih. -Sujiwo Tedjo'),
(31, 'Jangan pergi agar dicari, jangan sengaja lari agar dikejar. Berjuang tak sebercanda itu. -Sujiwo Tedjo'),
(32, 'Bagaimana kebiasaan akan kita ubah kalau kebiasaan itu sendiri sering tak kita sadari? -Sujiwo Tedjo'),
(33, 'Cintanya kepada sesama manusia cuma dalam rangka cintanya kepada Tuhan yang menciptakan manusia! -Sujiwo Tedjo'),
(34, 'Jika kegagalan adalah sukses yang tertunda, berarti bisa kita harapkan kebohongan adalah jujur yang tertunda. Mengapa kalian pesimistis? -Sujiwo Tedjo'),
(35, 'Tuhan menciptakan tangis perempuan agar laki-laki melupakan tangisnya sendiri. -Sujiwo Tedjo'),
(36, 'Hidup di alam fana adalah hidup di alam sandiwara. -Sujiwo Tedjo'),
(37, 'Bagaimana kalau uang jajan lebih besar ketimbang uang makan? -Sujiwo Tedjo'),
(38, 'Banyak yang yakin bahwa mawar cuma tumbuh di tanah. Padahal mawar juga bisa tumbuh di hati. -Sujiwo Tedjo'),
(39, 'Hidup itu seperti pergelaran wayang, dimana kamu menjadi dalang atas naskah semesta yang dituliskan oleh Tuhan mu. -Sujiwo Tedjo'),
(40, 'Aku sudah pernah merasakan semua kepahitan dalam hidup dan yang paling pahit ialah berharap kepada manusia. -Ali bin Abi Thalib'),
(41, 'Janganlah engkau mengucapkan perkataan yang engkau sendiri tak suka mendengarnya jika orang lain mengucapkannya kepadamu. -Ali bin Abi Thalib'),
(42, 'Kesabaran itu ada dua macam: sabar atas sesuatu yang tidak kau ingin dan sabar menahan diri dari sesuatu yang kau ingini. -Ali bin Abi Thalib'),
(43, 'Jangan menjelaskan tentang dirimu kepada siapapun, karena yang menyukaimu tidak butuh itu. Dan yang membencimu tidak percaya itu. -Ali bin Abi Thalib'),
(44, 'Barangsiapa menyalakan api fitnah, maka dia sendiri yang akan menjadi bahan bakarnya. -Ali bin Abi Thalib'),
(45, 'Ketahuilah bahwa sabar, jika dipandang dalam permasalahan seseorang adalah ibarat kepala dari suatu tubuh. Jika kepalanya hilang maka keseluruhan tubuh itu akan membusuk. Sama halnya, jika kesabaran hilang, maka seluruh permasalahan akan rusak. -Ali bin Abi Thalib'),
(46, 'Angin tidak berhembus untuk menggoyangkan pepohonan, melainkan menguji kekuatan akarnya. -Ali bin Abi Thalib'),
(47, 'Hati manusia adalah seperti binatang buas. Barangsiapa hendak menjinakkannya, akan diterkamnya. -Ali bin Abi Thalib'),
(48, 'Jangan berhenti berdoa untuk yang terbaik bagi orang yang kau cintai. -Ali bin Abi Thalib'),
(49, 'Balas dendam terbaik adalah menjadikan dirimu lebih baik. -Ali bin Abi Thalib'),
(50, ''),
(51, 'Saya tidak sedih kalau Anda telah membohongi saya, tapi saya justru sedih karena sejak saat itu saya tidak bisa percaya lagi kepada Anda. -Friedrich Nietzsche'),
(52, 'Ada terdapat lebih banyak kebijaksanaan dibalik tubuhmu daripada dibalik filosofi terdalammu. -Friedrich Nietzsche'),
(53, 'Orang harus tetap memiliki kekacauan dalam dirinya, untuk dapat melahirkan bintang yang menari. -Friedrich Nietzsche'),
(54, 'Ada satu hal yang harus dimiliki: apakah jiwa yang ceria karena alam, atau jiwa yang ceria karena seni atau pengetahuan. -Friedrich Nietzsche'),
(55, 'Apa yang tidak membunuh saya, membuat saya lebih kuat. -Friedrich Nietzsche'),
(56, 'Engkau harus membakar diri dalam apimu sendiri; bagaimana mungkin engkau bisa menjadi baru jika engkau tidak menjadi abu terlebih dahulu. -Friedrich Nietzsche'),
(57, 'Lebih baik tidak tahu apa-apa daripada tahu banyak hal tapi hanya setengah-setengah. -Friedrich Nietzsche');

-- --------------------------------------------------------

--
-- Table structure for table `t_revisi`
--

CREATE TABLE `t_revisi` (
  `id` int(11) NOT NULL,
  `id_suratkeluar` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1 = Dikembalikan / Revisi \r\n2. Selesai\r\n0. Selesai tidak di acc',
  `tanggal_revisi` datetime NOT NULL DEFAULT current_timestamp(),
  `catatan_revisi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_revisi`
--

INSERT INTO `t_revisi` (`id`, `id_suratkeluar`, `id_user`, `status`, `tanggal_revisi`, `catatan_revisi`) VALUES
(1, 23, NULL, 0, '2020-09-08 10:50:43', 'revisi gan'),
(2, 23, NULL, 1, '2020-09-08 10:51:57', 'revisi gan'),
(3, 25, NULL, 1, '2020-09-08 14:59:13', 'balikeun\r\n'),
(4, 28, NULL, 1, '2020-09-09 11:23:17', 'Revisi Cuk'),
(5, 30, NULL, 1, '2020-09-10 06:35:04', 'revisi '),
(6, 31, NULL, 1, '2020-09-10 06:47:57', 'dawdaw'),
(7, 39, NULL, 1, '2020-09-10 10:20:28', 'Revisi Deii OI'),
(8, 44, NULL, 1, '2020-09-10 13:38:17', 'revisi oi\r\n'),
(9, 36, NULL, 1, '2020-09-10 13:42:11', 'revisi oi oioiio'),
(10, 49, NULL, 1, '2020-09-10 13:44:23', 'rerere'),
(11, 10, NULL, 1, '2020-09-14 12:47:39', 'catatan revisina'),
(12, 8, NULL, 1, '2020-09-14 12:48:19', 'catatan revisina dikembalikan'),
(13, 30, NULL, 1, '2020-09-18 16:02:09', 'Ini catatannya'),
(14, 30, NULL, 1, '2020-09-18 16:02:35', 'Ini catatannya'),
(15, 30, NULL, 1, '2020-09-18 16:03:59', 'Ini catatannya'),
(16, 30, NULL, 1, '2020-09-18 16:08:36', 'Ini catatannya'),
(17, 30, NULL, 1, '2020-09-18 16:09:43', 'Ini catatannya'),
(18, 29, NULL, 1, '2020-09-18 16:30:47', 'ini catatan agan'),
(19, 36, NULL, 1, '2020-09-18 16:31:54', 'Revisi Lagi gan'),
(20, 28, NULL, 1, '2020-09-18 16:35:31', 'Percobaan Revisi Ini Gan'),
(21, 18, NULL, 1, '2020-09-18 16:35:47', 'Percobaan Revisi Ini Gan');

-- --------------------------------------------------------

--
-- Table structure for table `t_satuan`
--

CREATE TABLE `t_satuan` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_satuan` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_satuan`
--

INSERT INTO `t_satuan` (`id`, `id_upk`, `kode_satuan`, `satuan`, `keterangan`) VALUES
(6, 5, '01', 'satu', ''),
(7, 5, '02', 'dua', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_sifat`
--

CREATE TABLE `t_sifat` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_sifat` varchar(50) NOT NULL,
  `sifat` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_sifat`
--

INSERT INTO `t_sifat` (`id`, `id_upk`, `kode_sifat`, `sifat`, `keterangan`, `status`) VALUES
(7, 5, '01', 'Penting', '', '1'),
(8, 5, '02', 'Mendesak', '', '1'),
(9, 7, '01', 'SIfat', '', '1'),
(10, 8, '01', 'Penting', '', '1'),
(11, 8, '02', 'Mendesak', '', '1'),
(12, 5, '03', 'Biasa', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_staf`
--

CREATE TABLE `t_staf` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_staf` varchar(50) NOT NULL,
  `staf` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_status`
--

CREATE TABLE `t_status` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_status` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_status`
--

INSERT INTO `t_status` (`id`, `id_upk`, `kode_status`, `status`, `keterangan`) VALUES
(10, 5, '01', 'Proses', ''),
(11, 5, '02', 'Selesai', ''),
(12, 7, '01', 'Status', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_surat`
--

CREATE TABLE `t_surat` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `asal_surat` varchar(50) NOT NULL,
  `sifat_surat` int(11) NOT NULL,
  `jenis_surat` int(11) NOT NULL,
  `aksi_surat` int(11) NOT NULL,
  `disposisi` int(11) DEFAULT NULL COMMENT '1 = Disposisi, \r\n0 = Tidak Disposisi\r\n2 = Sudah DIsposisi',
  `disposisi_ke` text NOT NULL,
  `dikirim` text NOT NULL,
  `tujuan_kirim` text NOT NULL,
  `aksi_kirim` text NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `perihal` text NOT NULL,
  `isi_surat` text NOT NULL,
  `id_upk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'user yang membuat Surat',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = Aktif 0 = Tidak Akrif',
  `status_pengiriman` enum('1','2','0') NOT NULL DEFAULT '1' COMMENT '1 = disposisi\r\n2 = dikembalikan\r\n0 = selesai',
  `status_suratmasuk` int(11) DEFAULT NULL COMMENT '1 = status belum disposisi surat masuk\r\n0 = sudah selesai',
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp(),
  `notif` varchar(50) NOT NULL,
  `arsipkan` enum('1','0') DEFAULT '1' COMMENT '1 Dimasukan ke arsip\r\n0 Tidak dimasukan ke arsip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_surat`
--

INSERT INTO `t_surat` (`id`, `no_surat`, `tanggal_surat`, `tanggal_dibuat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `aksi_surat`, `disposisi`, `disposisi_ke`, `dikirim`, `tujuan_kirim`, `aksi_kirim`, `lampiran`, `perihal`, `isi_surat`, `id_upk`, `id_user`, `status`, `status_pengiriman`, `status_suratmasuk`, `waktu_dibuat`, `notif`, `arsipkan`) VALUES
(1, 'SM0001/PRM/05/IX2020', '2020-09-17', '2020-09-17', 'Stikes BTH', 12, 3, 5, 0, '', '', '54,', ', ', 'c35a8db338f9346cfa6b47ae150fe8d4.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:16:19', '1600323379', '1'),
(2, 'SM0002/BA/05/IX2020', '2020-09-17', '2020-09-17', 'Stikes BTH', 8, 12, 5, 0, '', '', '54,56,', ', ', 'c87196331e51af273894bea510737cf4.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:19:27', '1600323567', NULL),
(3, 'SM0002/BA/05/IX2020', '2020-09-17', '2020-09-17', 'Stikes BTH', 8, 12, 5, 0, '', '', '54,56,', ', ', '5f2e48b3f84d742110ecdc97b42b1103.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:19:45', '1600323585', NULL),
(4, 'SM0004/RK/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 14, 5, 0, '', '', '54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', 'eb50d6d824b717b3cb61dbf01116d431.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 13:21:23', '1600323683', NULL),
(5, 'SM0004/RK/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 14, 5, 0, '', '', '54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', 'e7cae031b71753b3c50d0184138386ff.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 13:24:00', '1600323840', NULL),
(6, 'SM0004/RK/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 14, 5, 0, '', '', '54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', '6eee24a6696c5dbef3f4a9855def6e7a.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 13:24:48', '1600323888', NULL),
(7, 'SM0004/RK/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 14, 5, 0, '', '', '54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', '6e2d97e4a99391cd938d221c811636ad.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 13:24:59', '1600323899', NULL),
(8, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,', ', ', '42aff020d5e11b633c0835bbff03ab82.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:28:58', '1600324138', NULL),
(9, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,', ', ', '620c21b6e28e5fe2e325b289bc64ff2d.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:29:16', '1600324156', NULL),
(10, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', 'f92c003c870515d1b4667d8ad75c9ce2.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:34:56', '1600324496', NULL),
(11, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', '7b4726fa4ced71738615150dba6908df.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:35:37', '1600324537', NULL),
(12, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', '975157b94ba758a4f13cf86acaf8b99f.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:35:48', '1600324548', NULL),
(13, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', '27223e9998f9bc57ef148ddf21e106c1.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:36:07', '1600324567', NULL),
(14, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', '626c151ee8dfb91c13191a6bedfd3997.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:36:29', '1600324589', NULL),
(15, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', '9f3fde55314d5a04800a269775410611.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:36:47', '1600324607', NULL),
(16, 'SM0008/RK/05/IX2020', '2020-09-18', '2020-09-17', 'Sekretariat Yayasan', 7, 14, 4, 0, '', '', '54,56,', ', ', 'a9e440ea42ff85e6221aeecd6463f132.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 13:37:04', '1600324624', NULL),
(17, '', '0000-00-00', '0000-00-00', '', 0, 0, 0, NULL, '', '', '', '', '0', '', '', 0, 0, '1', '1', NULL, '2020-09-17 13:38:34', '1600324714', NULL),
(18, 'SM0017/SKPHK/05/IX2020', '2020-09-17', '2020-09-17', 'Stikes BTH', 12, 21, 4, 0, '', '', '54,56,', ', ', '357da519c527a691f53dfd1eddfe182a.pdf', 'awdwa', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:29:12', '1600327752', NULL),
(19, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '493081bd3ff49224c7dffd0708f62304.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:29:58', '1600327798', NULL),
(20, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'fb0bd083f95e10611a410d1cf77cb216.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:30:10', '1600327810', NULL),
(21, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '56,', ', ', '429c33e8c01037e8e52b431eda078482.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:30:17', '1600327817', NULL),
(22, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '56,', ', ', 'c96fc68983c18a43626f8f663e9eae67.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:30:28', '1600327828', NULL),
(23, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '56,', ', ', 'fa9b89fe63ff31c3543e5108a1f98fc2.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:30:45', '1600327845', NULL),
(24, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '56,', ', ', 'e3f3e9071b6ba6bc8c49b72e0778e200.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:31:05', '1600327865', NULL),
(25, '', '0000-00-00', '0000-00-00', '', 0, 0, 0, NULL, '', '', '', '', '0', '', '', 0, 0, '1', '1', NULL, '2020-09-17 14:31:09', '1600327869', NULL),
(26, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '56,54,', ', ', '374d30e53c0d69ec08e3f0e7182d68e8.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:31:32', '1600327892', NULL),
(27, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,', ', ', '3b159a89e6589dc73e411ab4e75fe40c.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:32:08', '1600327928', NULL),
(28, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '2518edcfdb332e6c361bf4be5594e9db.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:32:36', '1600327956', NULL),
(29, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'de368583a6db0ab4f55c11e84c0b93bb.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:32:46', '1600327966', NULL),
(30, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'e22ce490f7f032b848ed49b44a869873.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:34:23', '1600328063', NULL),
(31, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '8ba9249d78c4bad55dcbee03f6a6b0b9.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:34:32', '1600328072', NULL),
(32, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'ea8164f5a460e271e65c3c255af6e7b7.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:35:15', '1600328115', NULL),
(33, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '2643486468fa1345efb22cadba296feb.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:35:36', '1600328136', NULL),
(34, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'd66de44b56b5f16ac926e556465257b0.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:36:05', '1600328165', NULL),
(35, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'a1d09c0584700a17b7800d92669fe4ba.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:37:14', '1600328234', NULL),
(36, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'a03c44c1c7b4fa741e535e43e4f7b6a1.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:37:53', '1600328273', NULL),
(37, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'c321a6542141a3450a4cfcb9e92ebc19.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:38:26', '1600328306', NULL),
(38, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '6603b5d8684283580929d1c0b3a59884.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:38:52', '1600328332', NULL),
(39, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '49bbdf083ccb65b6823d7cb6ef8a1726.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:40:26', '1600328426', NULL),
(40, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '14228629da5c687079786187f5b2efae.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:41:11', '1600328471', NULL),
(41, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '36b98ed0ac69d1d5f3840c6c6d771881.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:41:39', '1600328499', NULL),
(42, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '04e93192fbab4e66cf3ef9c8421ac356.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:43:26', '1600328606', NULL),
(43, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '2783be63488a713f018189cb1cc932bd.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:45:08', '1600328708', NULL),
(44, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', '164d2824896ee5bb8150d5baee25c782.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:45:20', '1600328720', NULL),
(45, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,', ', ', 'd88463d8970b3b7bcb1e8146e01e13e0.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:47:37', '1600328857', NULL),
(46, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,55,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', 'ec0f0fe7d7bd69f35bed5785b7b34407.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:52:43', '1600329163', NULL),
(47, 'SM0018/PKWT/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 26, 5, 0, '', '', '54,56,55,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', '0320a2470c1edcd1e23e9b948f4ecc2a.pdf', 'per', 'isi', 5, 506, '1', '1', 1, '2020-09-17 14:52:53', '1600329173', NULL),
(48, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '5e0721763fa008d9be2f2e4c05a71104.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:56:30', '1600329390', NULL),
(49, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '15c5efffcdb8a23d40bc96249cc14a7c.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:57:57', '1600329477', NULL),
(50, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '22aa8183665cdad19c01d9cee9c79221.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:58:10', '1600329490', NULL),
(51, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', 'fb594f98372ce949eec84292c5a51287.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:58:31', '1600329511', NULL),
(52, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '6383ebf9c7df822091e4a8822d2f92e0.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:58:40', '1600329520', NULL),
(53, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', 'b8e4479d25f1e2956ca114d0a697ab1c.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:59:15', '1600329555', NULL),
(54, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '262e8a01da3b271a4e52a60089c8788f.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:59:22', '1600329562', NULL),
(55, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '619730181ded03cb9dc0ce944db654da.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:59:42', '1600329582', NULL),
(56, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '5313243c25ce32adbf8f66887ffe816a.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 14:59:54', '1600329594', NULL),
(57, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '386d26b92e6e6b1cff232e05ac66006b.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:00:06', '1600329606', NULL),
(58, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '54ccffbd3b48d669d4fc91592add0eb4.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:00:17', '1600329617', NULL),
(59, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', 'ba52c558aae514a5b28f3fd6d7c20cc9.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:00:25', '1600329625', NULL),
(60, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', 'a833dde2997de02700adeb2b6501522b.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:00:52', '1600329652', NULL),
(61, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 5, 0, '', '', '54,57,56,', ', ', '5a338ee05b9ef6556d96c6b5f331e8c8.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:03:19', '1600329799', NULL),
(62, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 0, 0, 0, 0, '', '', '54,57,56,', ', ', '46e287952b880411727087e5e2185965.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:03:49', '1600329829', NULL),
(63, 'SM0046/BLS/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 0, 0, 0, 0, '', '', '54,57,56,', ', ', 'af7cb3c69f121e2daf252693c47db0bd.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:05:26', '1600329926', NULL),
(64, 'SM0062/FRL/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 27, 5, 0, '', '', '54,57,56,', ', ', '7d2f3de334caf827c2fe73611a7115be.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:05:43', '1600329943', NULL),
(65, 'SM0062/FRL/05/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 0, 0, 0, 0, '', '', '54,57,56,', ', ', '04f04e4309fa8298ea893c85a5c929d1.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 15:09:20', '1600330160', NULL),
(66, 'SM0064/BA/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 12, 4, 0, '', '', '520,57,56,', ', ', 'b719e045457c5e54a11562c1f3e986b1.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 22:48:16', '1600357696', NULL),
(67, 'SM0064/BA/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 12, 4, 0, '', '', '520,57,56,', ', ', 'c85e77f5a8d767de6dbaeafe48918274.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 22:49:53', '1600357793', NULL),
(68, 'SM0064/BA/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 12, 4, 0, '', '', '520,57,56,', ', ', 'cc1a3f1ecf8c0b0669bbd20f9089c444.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 22:51:09', '1600357869', NULL),
(69, 'SM0067/FRL/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 27, 5, 0, '', '', '520,57,56,', ', ', 'e805b00cd3bd6b6f73c42c3ca9630926.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 23:03:37', '1600358617', NULL),
(70, 'SM0068/SKPT/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 8, 20, 5, 0, '', '', '520,', ', ', 'b6d8a1e99bbd3806ee8a827fbce96fc8.pdf', 'perihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 23:06:28', '1600358788', NULL),
(71, 'SM0069/FRL/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 7, 27, 5, 0, '', '', '520,', ', ', '52cf461f7b25acf90047b386526c5a0e.pdf', 'adawdwa', 'awd', 5, 506, '1', '1', 1, '2020-09-17 23:08:00', '1600358880', NULL),
(72, 'SM0070/PTBI/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 7, 25, 5, 0, '', '', '520,', ', ', '64c9286d61a6e385ef65b850c0ebcc6d.pdf', 'pihawd', 'awd', 5, 506, '1', '1', 1, '2020-09-17 23:09:38', '1600358977', NULL),
(73, 'SM0071/PTBI/SY/IX2020', '2020-09-17', '2020-09-17', 'Stikes BTH', 12, 25, 5, 0, '', '', '520,', ', ', '05de0d33e17360c1823b033a51601336.pdf,b2de22872f8f1dfcb81bb05384cafd2d.pdf', 'awdawd', 'awdaw', 5, 506, '1', '1', 1, '2020-09-17 23:11:20', '1600359080', NULL),
(74, 'SM0072/SKDT/SY/IX2020', '2020-09-14', '2020-09-17', 'Sekretariat Yayasan', 12, 19, 5, 0, '', '', '54,', ', ', '52ba85c9aeb4dbfdcb63e6de72d9d27c.pdf', 'coba', 'isi', 5, 506, '1', '1', 1, '2020-09-17 23:12:12', '1600359132', NULL),
(75, 'SM0072/SKDT/SY/IX2020', '2020-09-14', '2020-09-17', 'Sekretariat Yayasan', 12, 19, 5, 0, '', '', '54,', ', ', '6e6939c764a175441952a6e45d3d3970.pdf', 'coba', 'isi', 5, 506, '1', '1', 1, '2020-09-17 23:12:16', '1600359136', NULL),
(76, 'SM0072/SKDT/SY/IX2020', '2020-09-14', '2020-09-17', 'Sekretariat Yayasan', 12, 19, 5, 0, '', '', '54,', ', ', 'ec8fcfabee12dc76f2bd90e874f9b6e8.pdf', 'coba', 'isi', 5, 506, '1', '1', 1, '2020-09-17 23:12:29', '1600359149', NULL),
(77, 'SM0075/PRM/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 3, 5, 0, '', '', '520,', ', ', '2ae3f0eb94b7bb2d1360ef2ca938ea44.pdf', 'awkawoawkoawkaowk', 'awkawoawkoawkaowk', 5, 506, '1', '1', 1, '2020-09-17 23:13:05', '1600359185', NULL),
(78, 'SM0076/FRL/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 27, 6, 0, '', '', '520,', ', ', '48318e27fdfedcc25536fa9ca546dad0.pdf', 'cobcoba erihal', 'isi', 5, 506, '1', '1', 1, '2020-09-17 23:35:31', '1600360531', NULL),
(79, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', '95638d1d32865c5cfc956f70c8a3303f.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:36:57', '1600360617', NULL),
(80, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', '318e89f78b699c8ea10f4722f3a60ae5.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:40:40', '1600360840', NULL),
(81, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', 'd04ca3c9590ac7ccfa4ca22a626d328b.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:40:48', '1600360848', NULL),
(82, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', '041ba199f33cef3744291b391fbea51a.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:41:01', '1600360861', NULL),
(83, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', 'aaa028cc563101bbe4c4a72423533dc9.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:41:08', '1600360868', NULL),
(84, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', 'b8f35e9e571a6c5f801a3d194effebdb.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:41:19', '1600360879', NULL),
(85, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', '125b9d3ed6eb5b03607bd66bd5cd2eab.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:41:43', '1600360903', NULL),
(86, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,', '35c609b51117749419104e6d18ed5bba.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:41:49', '1600360909', NULL),
(87, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '80714d6ac320d9e3869faaaf8ce86dc4.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:42:06', '1600360926', NULL),
(88, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '810fd7501fa8a713ef725128daeae224.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:42:47', '1600360967', NULL),
(89, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '29f86db6961d65dcc60229a4a6dd0437.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:43:10', '1600360990', NULL),
(90, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '1c7971ce7e82a61c6bf7a09de404d90b.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:45:02', '1600361102', NULL),
(91, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '13a36427774e01dd81948c6c7e5d9f0d.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:45:14', '1600361114', NULL),
(92, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '46929c881db1bb79b304f08c2ceb6676.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:45:27', '1600361127', NULL),
(93, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '7333bfc8da5eb0f1a7e6df79e53c6842.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:45:32', '1600361132', NULL),
(94, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '7b18d2a7915c9c7ed23456fe5c318373.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:46:14', '1600361174', NULL),
(95, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '5eabd145c39a8eb74f83dc9d1f851b75.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:46:26', '1600361186', NULL),
(96, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', 'b3867e0b0c391ad04f69e03c90d693ef.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:47:03', '1600361223', NULL),
(97, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '7b6234c8c5cca44d179503ac9e434837.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:47:08', '1600361228', NULL),
(98, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '475e42a7d14b9b608bc213c430fecc14.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:47:21', '1600361241', NULL),
(99, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', 'c79745c92386ce418395eed083052256.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:47:27', '1600361247', NULL),
(100, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '9e9b690789a90d772adf783481b0fb46.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:47:39', '1600361259', NULL),
(101, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', '4f161aedc228a8cffa8f82e305ba97ca.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:47:47', '1600361267', NULL),
(102, 'SM0077/BLS/SY/IX2020', '2020-09-17', '2020-09-17', 'Sekretariat Yayasan', 12, 11, 4, 1, '', '', ', ', '39,32,', 'ecd8004847907a23d2a786b9c556f016.pdf', 'periawdjaw', 'isiawidawidi', 5, 506, '1', '1', 1, '2020-09-17 23:48:01', '1600361281', NULL),
(103, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,', 'df3de2ef1c6ac792dc5a1f9dbd10562c.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:33:25', '1600396405', NULL),
(104, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '3a69d8323af154d6c78ebb097aa175b4.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:34:46', '1600396485', NULL),
(105, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '767b370bafdb9965d25d78ea65df7915.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:36:01', '1600396561', NULL),
(106, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', 'eaa6f327d580d7898f9dde0c96fcc699.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:36:09', '1600396569', NULL),
(107, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '927685c66960b2825d4b19ab479b06b4.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:36:41', '1600396601', NULL),
(108, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '401c9c59cb718130fd9916802b4593cb.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:37:03', '1600396623', NULL),
(109, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '6abd80e3f7cb3d9cdf22d2af4b7e65de.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:37:36', '1600396656', NULL),
(110, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '25380d33df332afd8c008519025d1862.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:38:48', '1600396728', NULL),
(111, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', 'b6562a4bf4063686d803ccfc6bcb0ed6.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:38:58', '1600396738', NULL),
(112, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '504586998bc454c5f4d7aad6d87bfe89.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:39:31', '1600396771', NULL),
(113, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', 'eb78a36b14898d6fc86e143b21ae39c4.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:40:00', '1600396800', NULL),
(114, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '84105de077ecdcfde9f3c215936ce8d5.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:40:09', '1600396809', NULL),
(115, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '1eafd9be91371579e63e6c67c061eb45.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:40:31', '1600396830', NULL),
(116, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', '33d3da4444301c68261c2816dc33cc4b.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:40:48', '1600396848', NULL),
(117, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 1, '', '', ', ', '39,31,', 'ca972c571bfdf947d6a7dc4be2fd9466.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:41:02', '1600396862', NULL),
(118, 'SM0101/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 7, 14, 6, 0, '', '', '54,520,', ', ', 'ba1f3b4952aff6a8d887cf5e22c6afc6.pdf', 'peri', 'isi', 5, 506, '1', '1', 1, '2020-09-18 09:41:34', '1600396894', NULL),
(119, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '54,520,', ', ', '7023069399576e9d2034b5f7843ea0ad.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-18 09:42:01', '1600396921', NULL),
(120, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '54,520,57,56,', ', ', 'aca2430b8ecb6f497827faf761fb4e3c.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-18 09:42:12', '1600396932', NULL),
(121, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '520,57,56,', ', ', 'c7aa7e2605d79c867d2b9a5b2bf3bcee.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-18 09:42:18', '1600396938', NULL),
(122, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 1, '', '', ', ', '31,39,', '588ee288a191ad0962ed882fdc2ef66c.pdf', 'awdawdawd', 'awdawdwa', 5, 506, '1', '1', 1, '2020-09-18 10:01:29', '1600398089', NULL),
(123, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 1, '', '', ', ', '31,39,', 'c4fb9e628402c645467632446b0c6b4c.pdf', 'awdawdawd', 'awdawdwa', 5, 506, '1', '1', 1, '2020-09-18 10:01:44', '1600398104', NULL),
(124, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 1, '', '', ', ', '31,39,', 'c682d33daa53c21a40e697a1d8abebd1.pdf', 'awdawdawd', 'awdawdwa', 5, 506, '1', '1', 1, '2020-09-18 10:03:22', '1600398202', NULL),
(125, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 2, '', '', ', ', '31,39,', 'b7a70a1b88e9c93e182aec12378dee74.pdf', 'kirim jabatatan ', 'awdawdwa', 5, 506, '1', '1', 0, '2020-09-18 10:03:37', '1600398217', NULL),
(126, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 2, '', '', ', ', '31,39,', 'c1239268a63938e0bb644ac9c4db989b.pdf', 'kirim jabatatan ', 'awdawdwa', 5, 506, '1', '1', 0, '2020-09-18 10:03:49', '1600398229', NULL),
(127, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 2, '', '', ', ', '31,39,', '0d436a02d25c31402c2f54a3f785c51c.pdf', 'kirim jabatatan ', 'awdawdwa', 5, 506, '1', '1', 1, '2020-09-18 10:03:54', '1600398234', NULL),
(128, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 2, '', '', ', ', '31,39,', 'df9e966e10f2dadbccbb7e052b3558f9.pdf', 'kirim jabatatan ', 'awdawdwa', 5, 506, '1', '1', 0, '2020-09-18 10:05:58', '1600398358', NULL),
(129, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '520,57,56,', ', ', '71964aa4c8cf2204302afed2921a454d.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-18 10:06:08', '1600398368', NULL),
(130, 'SM0120/RK/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 14, 5, 2, '', '', ', ', '31,39,', 'edf6581921802493865eed54eb906745.pdf', 'kirim jabatatan ', 'awdawdwa', 5, 506, '1', '1', 0, '2020-09-18 10:06:56', '1600398416', '1'),
(131, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '520,57,56,', ', ', '5c2bdb26005d5476b09cd42686534b7f.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-18 10:07:03', '1600398423', NULL),
(132, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '520,57,56,', ', ', '9121b5e5f6a242fc7f1e48d9537e29bf.pdf', 'kirim per orang', 'awd', 5, 506, '1', '1', 1, '2020-09-18 10:07:20', '1600398440', NULL),
(133, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '520,57,56,', ', ', 'efb4e24169da5099bbc2cd85494a7945.pdf', 'kirim per orang', 'awd', 5, 506, '1', '1', 1, '2020-09-18 10:07:53', '1600398473', NULL),
(134, 'SM0132/HMB/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 6, 4, 2, '', '', ', ', '31,39,', '8152a41801bdc0a4d69333a56892af15.pdf', 'kirim awdaw', 'awdawd', 5, 506, '1', '1', 0, '2020-09-18 10:08:14', '1600398494', NULL),
(135, 'SM0117/BLS/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 11, 4, 0, '', '', '520,57,56,', ', ', 'f306a1a17ecb4fc6df7b227b1264ee6e.pdf', 'kirim per orang', 'awd', 5, 506, '1', '1', 1, '2020-09-18 10:08:43', '1600398523', NULL),
(136, 'SM0132/HMB/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 8, 6, 4, 2, '', '', ', ', '31,39,', '7761adc7adfd9307cdb5e41435394cc5.pdf', 'kirim awdaw', 'awdawd', 5, 506, '1', '1', 0, '2020-09-18 10:08:52', '1600398532', '1'),
(137, 'SM0135/SKDT/SY/IX2020', '2020-09-18', '2020-09-18', 'Stikes BTH', 12, 19, 7, 0, '', '', '520,', ', ', '8e92bafacd8497023bbc202de877c158.pdf', '1user', '1user', 5, 506, '1', '1', 1, '2020-09-18 10:31:32', '1600399892', NULL),
(138, 'SM0136/PRM/SY/IX2020', '2020-09-19', '2020-09-19', 'Dinas Pendidikan', 12, 3, 6, 0, '', '', '519,', ', ', '847e15f00f04b043a578c156e7537537.pdf', 'perihal cok', 'awkoawkoawkawo', 5, 506, '1', '1', 1, '2020-09-19 10:44:32', '1600487072', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_suratkeluar`
--

CREATE TABLE `t_suratkeluar` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `asal_surat` int(11) NOT NULL,
  `sifat_surat` int(11) NOT NULL,
  `jenis_surat` int(11) NOT NULL,
  `perihal` text NOT NULL,
  `isi_surat` text NOT NULL,
  `id_upk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'user yang membuat Surat',
  `persetujuan` varchar(255) NOT NULL,
  `acc` varchar(255) DEFAULT NULL,
  `tanggal_konfirmasi` date NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = Aktif 0 = Tidak Akrif',
  `status_pengiriman` enum('1','2','0','4','5') NOT NULL DEFAULT '1' COMMENT '1 = proses \r\n2 = dikembalikan \r\n0 = selesai\r\n4 = Di tolak\r\n5 = Di setujui Ketua UPK',
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp(),
  `notif` varchar(50) NOT NULL,
  `arsipkan` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Dimasukan ke arsip \r\n0 Tidak dimasukan ke arsip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_suratkeluar`
--

INSERT INTO `t_suratkeluar` (`id`, `no_surat`, `tanggal_dibuat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `perihal`, `isi_surat`, `id_upk`, `id_user`, `persetujuan`, `acc`, `tanggal_konfirmasi`, `status`, `status_pengiriman`, `waktu_dibuat`, `notif`, `arsipkan`) VALUES
(1, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:29:04', '', '1'),
(2, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:29:09', '', '1'),
(3, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:36:07', '', '1'),
(4, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:37:18', '', '1'),
(5, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:37:26', '', '1'),
(6, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:37:52', '', '1'),
(7, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:38:36', '', '1'),
(8, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:39:28', '', '1'),
(9, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:42:26', '', '1'),
(10, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:42:42', '', '1'),
(11, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:43:15', '', '1'),
(12, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:43:56', '', '1'),
(13, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 10:46:13', '', '1'),
(14, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:16:10', '', '1'),
(15, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:18:10', '', '1'),
(16, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:18:25', '', '1'),
(17, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:18:38', '', '1'),
(18, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', '519,', '0000-00-00', '1', '2', '2020-09-18 11:19:15', '', '1'),
(19, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:19:27', '', '1'),
(20, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:20:18', '', '1'),
(21, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', '519,519,519,519,519,', '2020-09-18', '1', '0', '2020-09-18 11:20:30', '', '1'),
(22, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:20:59', '', '1'),
(23, 'SK0001/PKWT/SY/IX2020', '2020-09-18', 5, 8, 26, 'coba email', 'coba email', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:21:11', '', '1'),
(24, '', '2020-09-18', 5, 8, 26, 'coba surat keluar', 'coba surat keluar', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:22:25', '', '1'),
(25, '', '2020-09-18', 5, 8, 26, 'coba surat keluar', 'coba surat keluar', 5, 54, '60,519', NULL, '0000-00-00', '1', '1', '2020-09-18 11:22:56', '', '1'),
(26, 'SK0026/PTBI/SY/IX2020', '2020-09-18', 5, 12, 25, 'ttd upk', 'ttd upk', 5, 54, '519', '519,', '2020-09-18', '1', '0', '2020-09-18 14:16:19', '', '1'),
(27, 'SK0027/PRM/SY/IX2020', '2020-09-18', 5, 8, 3, 'coba surat keluar upk', 'coba surat keluar upk', 5, 520, '519', '519,519,519,519,', '2020-09-18', '1', '0', '2020-09-18 15:36:05', '', '1'),
(28, 'SK0028/PTN/SY/IX2020', '2020-09-18', 5, 8, 4, 'coba buat', 'coba buat', 5, 520, '519', '519,', '0000-00-00', '1', '2', '2020-09-18 15:48:38', '', '1'),
(29, 'SK0029/FRL/SY/IX2020', '2020-09-18', 0, 8, 0, 'Ini di revisi gan', 'Ini di revisi gan', 5, 520, '519', '519,', '0000-00-00', '0', '2', '2020-09-18 15:50:34', '', '1'),
(30, 'SK0030/FRL/SY/IX2020', '2020-09-18', 0, 8, 0, 'coba buatawdwa', 'coba buat', 5, 520, '519', '519,519,519,519,519,', '0000-00-00', '', '2', '2020-09-18 15:52:41', '', '1'),
(31, '', '2020-09-18', 5, 8, 27, 'coba buat histori', 'coba buat histori', 5, 520, '519', '519,', '0000-00-00', '1', '4', '2020-09-18 15:53:39', '', '1'),
(32, 'SK0032/PRT/SY/IX2020', '2020-09-18', 5, 8, 24, 'coba buat histori', 'coba buat histori', 5, 520, '519', '519,', '2020-09-18', '1', '0', '2020-09-18 15:55:10', '', '1'),
(33, 'SK0030/FRL/SY/IX2020', '2020-09-18', 0, 8, 0, 'coba buatawdwa', 'coba buat', 0, 520, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 16:22:01', '', '1'),
(34, 'SK0030/FRL/SY/IX2020', '2020-09-18', 0, 8, 0, 'coba buatawdwa', 'coba buat', 0, 520, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 16:25:43', '', '1'),
(35, 'SK0030/FRL/SY/IX2020', '2020-09-18', 0, 8, 0, 'coba buatawdwa', 'coba buat', 0, 520, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 16:26:23', '', '1'),
(36, 'SK0029/FRL/SY/IX2020', '2020-09-18', 0, 8, 0, 'Ini di revisi gan', 'Ini di revisi gan', 0, 520, '519', '519,', '0000-00-00', '1', '2', '2020-09-18 16:31:18', '', '1'),
(37, 'SK0037/KU/SY/IX2020', '2020-09-18', 5, 8, 7, 'cobacoba', 'cobacoba', 5, 520, '519', NULL, '0000-00-00', '1', '1', '2020-09-18 16:55:46', '', '1'),
(38, 'SK0038/27/LKSAA/IX2020', '2020-09-18', 8, 10, 108, 'coba ke zaenal', 'coba ke zaenal', 8, 517, '83', '83,', '2020-09-18', '1', '0', '2020-09-18 23:20:15', '', '1'),
(40, 'SK0039/04/LKSAA/IX2020', '2020-09-18', 8, 10, 85, 'coba ketua yayasan', 'coba ketua yayasan', 8, 517, '60,83', '83,60,', '2020-09-18', '1', '0', '2020-09-18 23:21:51', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_tujuan`
--

CREATE TABLE `t_tujuan` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_tujuan` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_tujuan`
--

INSERT INTO `t_tujuan` (`id`, `id_upk`, `kode_tujuan`, `tujuan`, `keterangan`) VALUES
(1, 7, '01', 'Tujuan', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_upk`
--

CREATE TABLE `t_upk` (
  `id` int(11) NOT NULL,
  `ketua_upk` int(11) NOT NULL,
  `kode_upk` varchar(50) NOT NULL,
  `upk` varchar(50) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `logo` text NOT NULL,
  `status` set('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_upk`
--

INSERT INTO `t_upk` (`id`, `ketua_upk`, `kode_upk`, `upk`, `keterangan`, `logo`, `status`) VALUES
(5, 519, 'SY', 'Sekretariat Yayasan', '', 'f3c5c33fde993c4638547d9ea6a19159.png', '1'),
(7, 0, 'SBTH', 'Stikes BTH', '', 'c1b9f28b6192b68a2a3e1540a56c48b6.png', '1'),
(8, 83, 'LKSAA', 'LKSA Amanah ', 'email : zaenal ', '6063122c728821da00fb574bec1d38ed.jpg', '1'),
(9, 95, 'BTHSH', 'BTH STUDENT HOUSE', '', '1efe52b60671a397b064196850f83512.jpeg', '1'),
(10, 54, 'KLKBTH', 'KLINIK BTH', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `gelar_depan` varchar(50) DEFAULT NULL,
  `nama_user` varchar(50) NOT NULL,
  `gelar_belakang` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `niy` varchar(50) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `id_satuan` int(11) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `level` enum('1','2','3','4') NOT NULL DEFAULT '2' COMMENT '1 untuk superadmin\r\n2 untuk adminupk\r\n3 untuk staff upk\r\n4 untuk admin persuratan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`, `id_upk`, `gelar_depan`, `nama_user`, `gelar_belakang`, `email`, `niy`, `status`, `id_satuan`, `id_jabatan`, `level`) VALUES
(7, 'admin', '580097c0183509887837571145ccc3ad', 0, '', 'Admin', '', 'admin', NULL, '1', 0, 0, '1'),
(47, 'klinik', '67ccb39f0ec81c363d058774c2a1598d', 10, '', 'KLINIK BTH', '', 'klinik', NULL, '1', NULL, NULL, '2'),
(48, 'bthstudenthouse', '67ccb39f0ec81c363d058774c2a1598d', 9, '', 'BTH Student House', '', 'bthstudnethouse', NULL, '1', NULL, NULL, '2'),
(49, 'lksaamanah', '67ccb39f0ec81c363d058774c2a1598d', 8, '', 'LKSA Amanah', '', 'lksa', NULL, '1', NULL, NULL, '2'),
(50, 'stikesbth', '67ccb39f0ec81c363d058774c2a1598d', 7, '', 'STIKES BTH', '', 'stikesbth', NULL, '1', NULL, NULL, '2'),
(51, 'yayasan', '67ccb39f0ec81c363d058774c2a1598d', 5, '', 'Yayasan', '', 'yayasan', NULL, '1', NULL, NULL, '2'),
(54, 'pandu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj', 'Agastya Pandu Satriya Utama', 'S.Kom, MM', 'pandu', NULL, '1', NULL, 39, '3'),
(55, 'yoris', '67ccb39f0ec81c363d058774c2a1598d', 5, 'H.', 'Yoris Rusamsi Ruswadi', 'SH, MH', '', NULL, '1', NULL, 30, '3'),
(56, 'wahyu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Wahyu Purwaganda', 'M.Sc', 'agastyapandu7@gmail.com', NULL, '1', NULL, 30, '3'),
(57, 'sadeli', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Sadeli Suganda', 'M.Kes.', 'sadeli', NULL, '1', NULL, 31, '3'),
(58, 'mulyana', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Drs. H. ', 'Mulyana', 'MM., M.Kes', 'agastyapandu7@gmail.com', NULL, '1', NULL, 31, '3'),
(59, 'neni', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj. ', 'Neni Heryani', 'S.Sos.', '', NULL, '1', NULL, 31, '3'),
(60, 'tati', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dra. Hj. ', 'Tati Dedah Nurdianah', 'M.Kes', 'tati', NULL, '1', NULL, 32, '3'),
(61, 'yayah', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dra. Hj. ', 'Yayah Syafariah', 'S.Kep., Ners. MM.', '', '880002', '1', NULL, 33, '3'),
(62, 'diana', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Diana Rahmadayanti', 'SE', 'dianarahmaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 34, '3'),
(63, 'aang', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Aang Anharto', NULL, '', NULL, '1', NULL, 35, '3'),
(64, 'asiyah', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Aisyah', NULL, '', NULL, '1', NULL, 35, '3'),
(65, 'asep', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Asep Supyan', 'S.Ked.', 'asepeoffice@stikes-bth.ac.id', NULL, '1', NULL, 36, '3'),
(66, 'dede', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Dede Yuda Wahyu N', 'SH., MH', 'dedeyudaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 37, '3'),
(67, 'deden', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Deden Wahyu', NULL, 'dedenwahyueoffice@stikes-bth.ac.id', NULL, '1', NULL, 38, '3'),
(68, 'furi', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Furi Furwani', 'A.Md', 'furi', NULL, '1', NULL, 39, '3'),
(69, 'ina', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Ina Nuraeni', 'SE', 'inanuraenieoffice@stikes-bth.ac.id', NULL, '1', NULL, 40, '3'),
(70, 'intan', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Intan Melinda', 'SE.Ak., CA', 'intanmelindaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 41, '3'),
(71, 'irvan', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Irvan Maulana', 'SE', 'irvaneoffice@stikes-bth.ac.id', NULL, '1', NULL, 42, '3'),
(72, 'jeffry', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Jeffry Nugraha', 'ST., MM.', 'jeffrynugrahaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 43, '3'),
(73, 'risna', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Risna Resita', 'S.ST', 'risnaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 44, '3'),
(74, 'rohmat', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Rohmat Noer Fajril', NULL, '', NULL, '1', NULL, 39, '3'),
(75, 'taufik', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Taufik Hudaya', 'S.Sn.', '', NULL, '1', NULL, 45, '3'),
(76, 'vinna', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Vinna Noor Afifah', 'ST.', 'vinnanooreoffice@stikes-bth.ac.id', NULL, '1', NULL, 46, '3'),
(77, 'yogasara', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Yogasara', 'ST.', '', NULL, '1', NULL, 39, '3'),
(78, 'wawan', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Drs.', 'Wawan Kuswara', 'M.Si.', '', '880003', '1', NULL, 47, '3'),
(79, 'ahmad', '67ccb39f0ec81c363d058774c2a1598d', 8, NULL, 'Ahmad Fathulloh', 'SH., M.Pd', '', NULL, '1', NULL, 48, '3'),
(80, 'dewi', '67ccb39f0ec81c363d058774c2a1598d', 8, NULL, 'Dewi Patimah', 'S.Pd.', '', NULL, '1', NULL, 48, '3'),
(81, 'risnanh', '67ccb39f0ec81c363d058774c2a1598d', 8, NULL, 'Risna Nasrul Haq', 'S.Tr.Bns', '', NULL, '1', NULL, 49, '3'),
(82, 'suryati', '67ccb39f0ec81c363d058774c2a1598d', 8, NULL, 'Suryati', NULL, '', NULL, '1', NULL, 50, '3'),
(83, 'zaenal', '67ccb39f0ec81c363d058774c2a1598d', 8, NULL, 'Zaenal Mutakin', 'S.Pd', 'zaenal', NULL, '1', NULL, 51, '3'),
(84, 'AbdulLatif', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Abdul Latif', NULL, '', NULL, '1', NULL, 52, '3'),
(85, 'Budiyanto', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Budiyanto', 'A.Md', '', NULL, '1', NULL, 53, '3'),
(86, 'Dadah', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Dadah', NULL, '', NULL, '1', NULL, 52, '3'),
(87, 'HenHen', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Hen Hen', NULL, '', NULL, '1', NULL, 54, '3'),
(88, 'HendraRahmatullah', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Hendra Rahmatullah', NULL, '', NULL, '1', NULL, 54, '3'),
(89, 'SantiRobianti', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Santi Robianti', 'S.Pd', '', NULL, '1', NULL, 55, '3'),
(90, 'SelametRiyadi', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Selamet Riyadi', 'S.Pd', '', NULL, '1', NULL, 56, '3'),
(91, 'Suherlan', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Suherlan', NULL, '', NULL, '1', NULL, 52, '3'),
(92, 'Titan', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Titan', NULL, '', NULL, '1', NULL, 52, '3'),
(93, 'AbdulAzisRamdani', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Abdul Azis Ramdani', NULL, '', NULL, '1', NULL, 57, '3'),
(94, 'AriefHidayat', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Arief Hidayat', 'SE', '', NULL, '1', NULL, 58, '3'),
(95, 'DewiAndini', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Dewi Andini', 'A.Md.Keb', '', NULL, '1', NULL, 59, '3'),
(96, 'EmupMuplihah', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Emup Muplihah', 'AM.Kep', 'emupeoffice@stikes-bth.ac.id', NULL, '1', NULL, 60, '3'),
(97, 'ErahSukaerah', '67ccb39f0ec81c363d058774c2a1598d', 10, 'Hj.', 'Erah Sukaerah', NULL, '', NULL, '1', NULL, 59, '3'),
(98, 'GunawanNugraha', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Gunawan Nugraha', NULL, '', NULL, '1', NULL, 57, '3'),
(99, 'HendroKasmanto', '67ccb39f0ec81c363d058774c2a1598d', 10, 'dr.', 'Hendro Kasmanto', 'M.KM', '', NULL, '1', NULL, 61, '3'),
(100, 'MochamadSigitAlinudin', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Mochamad Sigit Alinudin', NULL, '', NULL, '1', NULL, 62, '3'),
(101, 'ReniNuraeni', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Reni Nuraeni', 'S.Farm', '', NULL, '1', NULL, 62, '3'),
(102, 'SusiSusilawati', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Susi Susilawati', 'A.Md.AK', '', NULL, '1', NULL, 63, '3'),
(103, 'ZeaAhmadZakaria', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Zea Ahmad Zakaria', 'SH', '', NULL, '1', NULL, 64, '3'),
(354, 'AdeHerlan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ade Herlan', NULL, 'adeherlaneoffice@stikes-bth.ac.id', '880019', '1', NULL, 65, '3'),
(355, 'AdeKusmana', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ade Kusmana', 'S.Sos', '', NULL, '1', NULL, 66, '3'),
(356, 'AdeYeniAprillia', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ade Yeni Aprillia', 'S.Farm., M.Si', 'adeyenieoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(357, 'AiMeriYulianti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ai Meri Yulianti', 'A.Md.RO', '', NULL, '1', NULL, 68, '3'),
(358, 'AiNuraini', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ai Nuraini', 'A.Md.AK', 'ainuraenieoffice@stikes-bth.ac.id', NULL, '1', NULL, 69, '3'),
(359, 'AjengRahmiPratiwi', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ajeng Rahmi Pratiwi', 'A.Md.AK', '', NULL, '1', NULL, 69, '3'),
(360, 'AnasMukodas', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Anas Mukodas', NULL, 'anasmukodaseoffice@stikes-bth.ac.id', NULL, '1', NULL, 70, '3'),
(361, 'AnihKurnia', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Anih Kurnia', 'S.Kep., Ners., M.Kep.', 'anihkurniaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 71, '3'),
(362, 'AninditaTriKusumaPratita', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Anindita Tri Kusuma Pratita', 'ST., M.Si.', 'aninditatrieoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(363, 'AnisaPebiansyah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Anisa Pebiansyah', 'M.Farm., Apt', 'anisapebiansyaheoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(364, 'AnnaShintaPurwanti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Anna Shinta Purwanti', 'S.Farm', 'annashintaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 72, '3'),
(365, 'AnnaYuliana', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Dr. Hj.', 'Anna Yuliana', 'S.KM.,M.Si', 'annaeoffice@stikes-bth.ac.id', '880039', '1', NULL, 73, '3'),
(366, 'AnnisaNurHasanah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Annisa Nur Hasanah', 'S.Tr.Kes', '', NULL, '1', NULL, 74, '3'),
(367, 'AsepRobby', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Asep Robby', 'S.Kep.,M.Kep', 'aseprobbyeoffice@stikes-bth.ac.id', NULL, '1', NULL, 71, '3'),
(368, 'BeniSupriyadi', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Beni Supriyadi', NULL, 'benisupriyadieoffice@stikes-bth.ac.id', NULL, '1', NULL, 75, '3'),
(369, 'ChitaWidia', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Chita Widia', 'S.Pd., S.Kep.MKM', '', '880022', '1', NULL, 76, '3'),
(370, 'CucuNurpatonah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Cucu Nurpatonah', 'A.Md.,RO', 'cucunureoffice@stikes-bth.ac.id', NULL, '1', NULL, 77, '3'),
(371, 'CucupSupriadi', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Cucup Supriadi', NULL, 'cucupsupriadieoffice@stikes-bth.ac.id', NULL, '1', NULL, 79, '3'),
(372, 'DandiOkaSubantara', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Dandi Oka Subantara', 'S.Kep., Ners.', '', NULL, '1', NULL, 78, '3'),
(373, 'DedeRohmah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Dede Rohmah', NULL, 'dederohmaheoffice@stikes-bth.ac.id', '880007', '1', NULL, 65, '3'),
(374, 'DefriRisviana', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Defri Risviana', 'S.Farm', '', NULL, '1', NULL, 72, '3'),
(375, 'DeniKurniawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Deni Kurniawan', 'S.Kom', '', NULL, '1', NULL, 80, '3'),
(376, 'DeriIrawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Deri Irawan', NULL, '', NULL, '1', NULL, 81, '3'),
(377, 'DewiPetiVirgianti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Dewi Peti Virgianti', 'M.Si. ', 'dewipetieoffice@stikes-bth.ac.id', NULL, '1', NULL, 82, '3'),
(378, 'DianaSriZustika', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Diana Sri Zustika', 'S.Pd.,M.Si', 'dianasrieoffice@stikes-bth.ac.id', NULL, '1', NULL, 83, '3'),
(379, 'DichyNuryadinZain', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Dichy Nuryadin Zain', 'M.Farm., Apt', 'dichynuryadineoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(380, 'DinaFerdiani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Dina Ferdiani', 'S.Tr.Kes', '', NULL, '1', NULL, 74, '3'),
(381, 'DittaAtsnaNuriyaSalsabila', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ditta Atsna Nuriya Salsabila', 'A.Md.', '', NULL, '1', NULL, 72, '3'),
(382, 'EdiPrayitno', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Edi Prayitno', 'A.Md', 'edieoffice@stikes-bth.ac.id', NULL, '1', NULL, 84, '3'),
(383, 'EliKurniasih', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Eli Kurniasih', 'S.Pd., S.Kep, Ns.,M.KM', '', '880021', '1', NULL, 71, '3'),
(384, 'ElinMarlina', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Elin Marlina', NULL, 'elinmarlinaeoffice@stikes-bth.ac.id', '880016', '1', NULL, 85, '3'),
(385, 'Emi', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Emi', 'S.I.Kom', 'emieoffice@stikes-bth.ac.id', NULL, '1', NULL, 86, '3'),
(386, 'EncengSupardi', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Enceng Supardi', NULL, 'encengsupardieoffice@stikes-bth.ac.id', NULL, '1', NULL, 79, '3'),
(387, 'EnokNurliawati', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Hj.', 'Enok Nurliawati', 'S.Kp.,M.Kep', '', '880005', '1', NULL, 87, '3'),
(388, 'EpulSaepulMikdar', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Epul Saepul Mikdar', NULL, '', NULL, '1', NULL, 79, '3'),
(389, 'ErisRosidah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Eris Rosidah', NULL, '', NULL, '1', NULL, 88, '3'),
(390, 'EttyKomariahSambas', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Etty Komariah Sambas', 'S.Kp.,M.Kep', 'ettykomariaheoffice@stikes-bth.ac.id', NULL, '1', NULL, 89, '3'),
(391, 'EviIrmayanti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Evi Irmayanti', 'M.KM', 'eviirmayantieoffice@stikes-bth.ac.id', '880029', '1', NULL, 90, '3'),
(392, 'FajarSetiawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Fajar Setiawan', 'S.Farm., M.Farm.', 'fajarsetiawaneoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(393, 'FirmanGustaman', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Firman Gustaman', 'S.Farm., M.Farm.', 'firmangustamaneoffice@stikes-bth.ac.id', NULL, '1', NULL, 91, '3'),
(394, 'GatutAriWardani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Gatut Ari Wardani', 'S.Pd., M.Sc.', 'gatutarieoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(395, 'GittaPuspitasari', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Gitta Puspitasari', 'S.Kom', '', NULL, '1', NULL, 92, '3'),
(396, 'HannaNurulHusna', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Hanna Nurul Husna', 'M.Pd', 'hannanuruleoffice@stikes-bth.ac.id', NULL, '1', NULL, 93, '3'),
(397, 'HendySuhendy', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Hendy Suhendy', 'M.Si', 'hendyeoffice@stikes-bth.ac.id', NULL, '1', NULL, 94, '3'),
(398, 'HestyNitaHasanah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Hesty Nita Hasanah ', 'A.Md.AK', 'hestynitaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 69, '3'),
(399, 'HilmiNurhidayat', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Hilmi Nurhidayat', 'S.Farm.,Apt', '', NULL, '1', NULL, 95, '3'),
(400, 'IiSunSunarli', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ii Sun Sunarli', NULL, '', NULL, '1', NULL, 75, '3'),
(401, 'IisRahmawati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Iis Rahmawati', 'A.Md.RO', '', NULL, '1', NULL, 77, '3'),
(402, 'IisSitiAisyah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Iis Siti Aisyah', NULL, 'iissitieoffice@stikes-bth.ac.id', NULL, '1', NULL, 96, '3'),
(403, 'IlhamAlifiar', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ilham Alifiar ', 'S.Farm.,Apt.,M.Sc', 'ilhamalifiareoffice@stikes-bth.ac.id', NULL, '1', NULL, 97, '3'),
(404, 'Indra', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Indra', 'M.Si', 'indraeoffice@stikes-bth.ac.id', NULL, '1', NULL, 98, '3'),
(405, 'IntanRatnaPuri', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Intan Ratna Puri', 'S.Pd', 'intanratnaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 99, '3'),
(406, 'IraRahmiyani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ira Rahmiyani ', 'M.Si, Apt.', 'irarahmiyanieoffice@stikes-bth.ac.id', NULL, '1', NULL, 100, '3'),
(407, 'ItaRostianiHR', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ita Rostiani HR', NULL, 'itarostianieoffice@stikes-bth.ac.id', NULL, '1', NULL, 101, '3'),
(408, 'ItmamMilataka', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Itmam Milataka', 'A.Md.RO', '', NULL, '1', NULL, 68, '3'),
(409, 'JenalAripin', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Jenal Aripin', NULL, 'jenalaripineoffice@stikes-bth.ac.id', NULL, '1', NULL, 75, '3'),
(410, 'KeniIdacahyati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Keni Idacahyati', 'M.Farm., Apt', 'keniidacahyatieoffice@stikes-bth.ac.id', NULL, '1', NULL, 102, '3'),
(411, 'Khusnul', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Khusnul', 'M.Si', 'khusnuleoffice@stikes-bth.ac.id', NULL, '1', NULL, 103, '3'),
(412, 'KorryNovitriani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Korry Novitriani', 'S.Si., M.Si', 'korrynovitrianieoffice@stikes-bth.ac.id', '880040', '1', NULL, 82, '3'),
(413, 'LenaSitiNurjanah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Lena Siti Nurjanah', 'S.Farm', 'lenasitieoffice@stikes-bth.ac.id', NULL, '1', NULL, 72, '3'),
(414, 'LeniMayasari', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Leni Mayasari', 'S.IP', '', '880006', '1', NULL, 104, '3'),
(415, 'LilisTuslinah', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Dra. Hj.', 'Lilis Tuslinah', 'Apt.,M.Si', 'lilistuslinaheoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(416, 'LisnaNurotunnisa', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Lisna Nurotunnisa', 'A.Md.AK', 'lisnanurotunnisaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 69, '3'),
(417, 'LusiNurdianti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Lusi Nurdianti', 'M.Si.,Apt', 'lusinurdiantieoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(418, 'MuhammadAriefHidayatulFurqon', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Muhammad Arief Hidayatul Furqon', NULL, '', NULL, '1', NULL, 88, '3'),
(419, 'MamatRuhimat', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Mamat Ruhimat', NULL, 'mamatruhimateoffice@stikes-bth.ac.id', NULL, '1', NULL, 105, '3'),
(420, 'MasrulHayat', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Masrul Hayat', NULL, '', NULL, '1', NULL, 79, '3'),
(421, 'Meri', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Meri', 'S.KM., M.Imun', 'merieoffice@stikes-bth.ac.id', NULL, '1', NULL, 82, '3'),
(422, 'MetiKusmiati', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Hj.', 'Meti Kusmiati', 'M.Si', 'metieoffice@stikes-bth.ac.id', '880042', '1', NULL, 106, '3'),
(423, 'MochamadFathurohman', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Mochamad Fathurohman', 'ST., M.Si', 'mochamadfathurohmaneoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(424, 'MuhammadRidwan', '67ccb39f0ec81c363d058774c2a1598d', 7, 'H.', 'Muhammad Ridwan', 'Lc., M.Pd.I', '', NULL, '1', NULL, 71, '3'),
(425, 'MuhammadRaisMunix', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Muhammad Rais Munix', 'A.Md.A.B', '', NULL, '1', NULL, 107, '3'),
(426, 'MuharamPriatna', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Drs. H. E.', 'Muharam Priatna', 'Apt, M.Si.', 'muharampriatnaeoffice@stikes-bth.ac.id', '880045', '1', NULL, 67, '3'),
(427, 'NandangKamaludin', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Nandang Kamaludin', NULL, '', NULL, '1', NULL, 88, '3'),
(428, 'NellyHidayat', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Nelly Hidayat', NULL, '', NULL, '1', NULL, 88, '3'),
(429, 'NurLailiDwiHidayati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Nur Laili Dwi Hidayati', 'M.Si', 'nurlailieoffice@stikes-bth.ac.id', NULL, '1', NULL, 108, '3'),
(430, 'NurRahayuningsih', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Hj.', 'Nur Rahayuningsih', 'M.Si, Apt.', 'nurrahayueoffice@stikes-bth.ac.id', NULL, '1', NULL, 109, '3'),
(431, 'Nurdin', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Nurdin', NULL, '', NULL, '1', NULL, 88, '3'),
(432, 'NurulZakiatulJannahFitriani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Nurul Zakiatul Jannah Fitriani', 'A.Md.RO', '', NULL, '1', NULL, 68, '3'),
(433, 'OhanBurhan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ohan Burhan', NULL, 'ohanburhaneoffice@stikes-bth.ac.id', '880017', '1', NULL, 105, '3'),
(434, 'PanjiGamantara', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Panji Gamantara', 'SE', 'panjieoffice@stikes-bth.ac.id', NULL, '1', NULL, 96, '3'),
(435, 'Prasetyo', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Prasetyo', 'S.Kom', 'prasetyoeoffice@stikes-bth.ac.id', NULL, '1', NULL, 99, '3'),
(436, 'RatnaKomala', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ratna Komala', NULL, '', NULL, '1', NULL, 88, '3'),
(437, 'RiantiNurpalah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Rianti Nurpalah', 'S.KM.,M.Si', 'riantieoffice@stikes-bth.ac.id', '880035', '1', NULL, 110, '3'),
(438, 'RizkyRamdhani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Rizky Ramdhani', 'S.Farm., Apt', '', NULL, '1', NULL, 72, '3'),
(439, 'RochmanahSuhartati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Rochmanah Suhartati', 'S.Pd.M.Si', 'Suhartatieoffice@stikes-bth.ac.id', '880031', '1', NULL, 111, '3'),
(440, 'Rohyati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Rohyati', NULL, '', NULL, '1', NULL, 88, '3'),
(441, 'RosmayaDewi', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Rosmaya Dewi', 'S.Pd., M.Si.', '', NULL, '1', NULL, 112, '3'),
(442, 'RudiSetiawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Rudi Setiawan', NULL, '', NULL, '1', NULL, 88, '3'),
(443, 'RudyHidana', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Dr.', 'Rudy Hidana', 'M.Pd', 'rudieoffice@stikes-bth.ac.id', '880032', '1', NULL, 113, '3'),
(444, 'Ruswanto', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Dr.', 'Ruswanto', 'M.Si', 'ruswantoeoffice@stikes-bth.ac.id', NULL, '1', NULL, 76, '3'),
(445, 'SaefulAmin', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Dr.', 'Saeful Amin', 'Apt.,M.Si', 'saefulamineoffice@stikes-bth.ac.id', NULL, '1', NULL, 114, '3'),
(446, 'SherinTheresinaZaitun', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Sherin Theresina Zaitun', 'S.Pd', 'sherintheresinaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 86, '3'),
(447, 'SindiAji', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Sindi Aji', NULL, '', NULL, '1', NULL, 88, '3'),
(448, 'SitiDamayanti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Siti Damayanti', 'S.IP', '', '880012', '1', NULL, 115, '3'),
(449, 'SitiEfiShaefiyyah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Siti Efi Shaefiyyah', 'S.IP', 'sitieoffice@stikes-bth.ac.id', NULL, '1', NULL, 116, '3'),
(450, 'SoniHersoni', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Soni Hersoni', 'S. Sos., Ners., M.Kep.', '', '880026', '1', NULL, 117, '3'),
(451, 'Susanto', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Susanto', NULL, '', NULL, '1', NULL, 75, '3'),
(452, 'SyifaNursiswanti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Syifa Nursiswanti', 'A.Md.RO', '', NULL, '1', NULL, 77, '3'),
(453, 'TanendriArrizqiyani', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Tanendri Arrizqiyani', 'M.Si', 'tanendrieoffice@stikes-bth.ac.id', NULL, '1', NULL, 118, '3'),
(454, 'TaufikHidayat', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Taufik Hidayat', 'M.S.Farm.,Apt', 'taufikhidayateoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(455, 'Tenten', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Tenten', NULL, 'tenteneoffice@stikes-bth.ac.id', NULL, '1', NULL, 105, '3'),
(456, 'TetiAgustin', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Teti Agustin', 'S.Kp., M.Kep', '', '880010', '1', NULL, 119, '3'),
(457, 'TitaNofianti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Tita Nofianti', 'M.Si.,Apt', 'titanofiantieoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(458, 'TresnaLestari', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Tresna Lestari', 'S.Si.,Apt.,M.Si', 'tresnalestarieoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(459, 'TriUtami', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Tri Utami', 'A.Md.', '', NULL, '1', NULL, 107, '3'),
(460, 'UjangEnas', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ujang Enas', 'S. Sos., M.Si', '', '880025', '1', NULL, 120, '3'),
(461, 'Uju', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Uju', NULL, 'ujueoffice@stikes-bth.ac.id', NULL, '1', NULL, 81, '3'),
(462, 'UlfahHidayah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Ulfah Hidayah', 'ST', 'ulfaheoffice@stikes-bth.ac.id', NULL, '1', NULL, 116, '3'),
(463, 'UmmyMardiana', '67ccb39f0ec81c363d058774c2a1598d', 7, 'Dr.', 'Ummy Mardiana', 'M.Si', 'ummymardianaeoffice@stikes-bth.ac.id', '880027', '1', NULL, 82, '3'),
(464, 'VeraNurviana', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Vera Nurviana', 'M.Farm', 'veraeoffice@stikes-bth.ac.id', NULL, '1', NULL, 67, '3'),
(465, 'VianiSukmaNurAini', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Viani Sukma Nur\'aini', 'S.Farm', '', NULL, '1', NULL, 95, '3'),
(466, 'Wahidin', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Wahidin', NULL, '', '880018', '1', NULL, 121, '3'),
(467, 'WawanKurniawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Wawan Kurniawan', 'A.Md', 'wawankurniawaneoffice@stikes-bth.ac.id', '880033', '1', NULL, 123, '3'),
(468, 'WawanRismawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Wawan Rismawan', 'S.Kep.,M.Sc', '', NULL, '1', NULL, 71, '3'),
(469, 'Widaningsih', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Widaningsih', NULL, 'widaningsiheoffice@stikes-bth.ac.id', NULL, '1', NULL, 123, '3'),
(470, 'WindaTrisnaWulandari', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Winda Trisna Wulandari', 'S.Pd., M.Si', 'windatrisnaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 124, '3'),
(471, 'YaneLiswanti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yane Liswanti', 'M.KM.', 'yaneeoffice@stikes-bth.ac.id', '880043', '1', NULL, 122, '3'),
(472, 'YatiNurhayati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yati Nurhayati', NULL, '', NULL, '1', NULL, 88, '3'),
(473, 'YedyPurwandiSukmawan', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yedy Purwandi Sukmawan ', 'M.Si.,Apt', 'yedipurwandieoffice@stikes-bth.ac.id', NULL, '1', NULL, 91, '3'),
(474, 'YeliYulianti', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yeli Yulianti', 'S.Kep', '', NULL, '1', NULL, 78, '3'),
(475, 'Yuliawati', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yuliawati', NULL, '', NULL, '1', NULL, 88, '3'),
(476, 'YusufFirmansyahNurjamil', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yusuf Firmansyah Nurjamil', NULL, 'yusuffirmansyaheoffice@stikes-bth.ac.id', NULL, '1', NULL, 101, '3'),
(477, 'YusupMulyana', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Yusup Mulyana', 'A.Md., Ak.', '', NULL, '1', NULL, 69, '3'),
(478, 'ZakiTanshah', '67ccb39f0ec81c363d058774c2a1598d', 7, NULL, 'Zaki Tanshah', 'S.Kom', 'zakitanshaheoffice@stikes-bth.ac.id', NULL, '1', NULL, 105, '3'),
(506, 'adminpersuratan', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Admin Persuratan Yayasan', NULL, 'adminpersuratan', NULL, '1', NULL, NULL, '4'),
(510, '1597307838', '67ccb39f0ec81c363d058774c2a1598d', 21, 'UWU', 'WUWU', 'UWUW', 'email@email.com', '', '1', NULL, 126, '3'),
(511, '1597308007', '67ccb39f0ec81c363d058774c2a1598d', 21, NULL, 'WUWU', NULL, 'uwu', NULL, '1', NULL, NULL, '2'),
(512, '1597359759', '67ccb39f0ec81c363d058774c2a1598d', 10, NULL, 'Abdul Azis Ramdani', NULL, 'abdul@.com', NULL, '1', NULL, NULL, '2'),
(513, '1597360016', '67ccb39f0ec81c363d058774c2a1598d', 9, NULL, 'Hen Hen', NULL, 'hen@hen123.com', NULL, '1', NULL, NULL, '2'),
(514, '1597360541', '67ccb39f0ec81c363d058774c2a1598d', 23, '`', 'tes upk', '', 'tes@tes.comm', '', '1', NULL, NULL, '3'),
(515, '1597360560', '67ccb39f0ec81c363d058774c2a1598d', 23, NULL, 'tes upk', NULL, 'tes@admin.com', NULL, '1', NULL, NULL, '2'),
(517, 'lksauser', '67ccb39f0ec81c363d058774c2a1598d', 8, '', 'User LKSA Amanah', '', 'userlksa', NULL, '1', NULL, NULL, '3'),
(518, '1599015422', '67ccb39f0ec81c363d058774c2a1598d', 5, 'KH ', 'Agastya', 'Sarjana Komedian', 'agastya', NULL, '1', NULL, 35, '3'),
(519, '1599027866', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dr. KH.', 'IBNU', 'S.kom MT', 'agastypandu@gmail.com', '01010', '1', NULL, 31, '3'),
(520, 'titi', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Titi Lestia', 'M.Kes.', 'titilestiasriwahyuni@gmail.com', NULL, '1', NULL, 31, '3'),
(521, '1600445592', '67ccb39f0ec81c363d058774c2a1598d', 8, '', 'Admin Persuratan LKSA Amanah', '', 'adminpersuratanlksa', NULL, '1', NULL, 51, '4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_akses`
--
ALTER TABLE `t_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_aksi`
--
ALTER TABLE `t_aksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_changelog`
--
ALTER TABLE `t_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_config`
--
ALTER TABLE `t_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_disposisi`
--
ALTER TABLE `t_disposisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_histori`
--
ALTER TABLE `t_histori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_upk` (`id_upk`);

--
-- Indexes for table `t_jenis`
--
ALTER TABLE `t_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_notif`
--
ALTER TABLE `t_notif`
  ADD KEY `id_surat_masuk` (`id_surat_masuk`),
  ADD KEY `id_surat_keluar` (`id_surat_keluar`),
  ADD KEY `FK_t_notif_t_user` (`id_user`);

--
-- Indexes for table `t_quotes`
--
ALTER TABLE `t_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_revisi`
--
ALTER TABLE `t_revisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_satuan`
--
ALTER TABLE `t_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_sifat`
--
ALTER TABLE `t_sifat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_staf`
--
ALTER TABLE `t_staf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_status`
--
ALTER TABLE `t_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_surat`
--
ALTER TABLE `t_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tujuan`
--
ALTER TABLE `t_tujuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_upk` (`id_upk`);

--
-- Indexes for table `t_upk`
--
ALTER TABLE `t_upk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_upk` (`kode_upk`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_akses`
--
ALTER TABLE `t_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_aksi`
--
ALTER TABLE `t_aksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_changelog`
--
ALTER TABLE `t_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `t_config`
--
ALTER TABLE `t_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `t_disposisi`
--
ALTER TABLE `t_disposisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_histori`
--
ALTER TABLE `t_histori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `t_jenis`
--
ALTER TABLE `t_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `t_quotes`
--
ALTER TABLE `t_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `t_revisi`
--
ALTER TABLE `t_revisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `t_satuan`
--
ALTER TABLE `t_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_sifat`
--
ALTER TABLE `t_sifat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_staf`
--
ALTER TABLE `t_staf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_status`
--
ALTER TABLE `t_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_surat`
--
ALTER TABLE `t_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `t_tujuan`
--
ALTER TABLE `t_tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_upk`
--
ALTER TABLE `t_upk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
