-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 24 Sep 2020 pada 12.37
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

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
-- Struktur dari tabel `doc_akses_file`
--

CREATE TABLE `doc_akses_file` (
  `id` int(11) NOT NULL,
  `akses` varchar(20) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `doc_akses_file`
--

INSERT INTO `doc_akses_file` (`id`, `akses`, `id_jabatan`) VALUES
(1, '1600926901', 5),
(2, '1600926901', 2),
(3, '1600926901', 4),
(4, '1600926901', 7),
(5, '1600926901', 3),
(6, '1600926901', 1),
(7, '1600942953', 7),
(8, '1600942953', 4),
(9, '1600944432', 4),
(10, '1600944432', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `doc_file`
--

CREATE TABLE `doc_file` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `akses` varchar(20) DEFAULT NULL,
  `judul` char(120) NOT NULL,
  `desc` text NOT NULL,
  `ori_file` char(120) NOT NULL,
  `tipe_file` char(5) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `doc_file`
--

INSERT INTO `doc_file` (`id`, `id_user`, `id_jenis`, `akses`, `judul`, `desc`, `ori_file`, `tipe_file`, `last_update`) VALUES
(1, 51, 5, '1600926901', 'Judul Berkas', 'Dekripsi Berkas', '5ddf0d94c0d5ee8fe090caf3e9f75d6fc00927b5.pdf', '.pdf', '2020-09-24 12:46:33'),
(2, 51, 5, NULL, 'Judul Berkas', 'Dekripsi Berkas', '4c893da61827ebbde04380ea26e941934c51b0e2.pdf', '.pdf', '2020-09-24 12:47:14'),
(3, 68, 5, '1600942953', 'Mouse Gamming', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Distinctio autem, nisi sapiente ab ex eveniet. Fugit repudiandae possimus atque necessitatibus minima. Impedit velit ullam excepturi ipsam explicabo harum ipsum quisquam nihil aut earum quos quidem cumque asperiores aperiam, accusamus optio quibusdam accusantium, recusandae maiores eveniet alias inventore id et veritatis. Tempore impedit ex quia repellat deleniti? Suscipit maxime saepe, magnam excepturi culpa sed natus consequatur quae nam expedita ratione, iusto amet dolores? Perferendis culpa quae excepturi earum quasi nobis numquam cumque quas nam porro obcaecati quod maiores cum facere libero corporis, saepe labore neque facilis! Saepe voluptatem labore sequi ipsa.', 'd2050606df05a5eefcc29ee3eac9a106934a9a81.pdf', '.pdf', '2020-09-24 17:14:58'),
(4, 54, 5, '1600944432', 'Untuk Fikri Mubaroq', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti, porro labore doloribus sapiente illum iusto aliquam eius beatae dignissimos laborum sed impedit officiis atque, at, dicta facere. Esse, omnis natus.', 'e478bc174a3fc6c5aecd8fdd33f85a87361b5929.pdf', '.pdf', '2020-09-24 17:36:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doc_jenis_file`
--

CREATE TABLE `doc_jenis_file` (
  `id` int(11) NOT NULL,
  `kode_upk` varchar(50) NOT NULL,
  `nama_jenis` varchar(100) NOT NULL,
  `is_aktif` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `doc_jenis_file`
--

INSERT INTO `doc_jenis_file` (`id`, `kode_upk`, `nama_jenis`, `is_aktif`) VALUES
(5, 'SY', 'Jenis Dokumen 1', '1'),
(8, 'SY', 'Jenis Dokumen 2', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_akses`
--

CREATE TABLE `t_akses` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_akses` varchar(50) NOT NULL,
  `akses` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_akses`
--

INSERT INTO `t_akses` (`id`, `id_upk`, `kode_akses`, `akses`, `keterangan`) VALUES
(1, 4, '01', 'Lihat Status Surat', ''),
(2, 4, '02', 'Lihat Posisi Surat', ''),
(3, 4, '03', 'Printout', ''),
(4, 7, '01', 'Akses', ''),
(5, 2, '12', '12', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_aksi`
--

CREATE TABLE `t_aksi` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_aksi` varchar(50) NOT NULL,
  `aksi` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_aksi`
--

INSERT INTO `t_aksi` (`id`, `id_upk`, `kode_aksi`, `aksi`, `keterangan`) VALUES
(4, 5, '01', 'ACC', ''),
(5, 5, '02', 'LAKSANAKAN', ''),
(6, 5, '03', 'SEGERA', ''),
(7, 5, '04', 'SIAPKAN', ''),
(8, 5, '05', 'TINDAK LANJUTI SEGERA', ''),
(9, 7, '01', 'Aksi', ''),
(10, 8, '01', 'ACC', ''),
(11, 8, '02', 'LAKSANAKAN', ''),
(12, 8, '03', 'SEGERA', ''),
(13, 8, '04', 'SIAPKAN', ''),
(14, 8, '05', 'TINDAK LANJUTI SEGERA', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_changelog`
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
-- Dumping data untuk tabel `t_changelog`
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
-- Struktur dari tabel `t_config`
--

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL,
  `config` varchar(50) NOT NULL,
  `value` longtext DEFAULT NULL,
  `extra` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_config`
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
-- Struktur dari tabel `t_disposisi`
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
-- Dumping data untuk tabel `t_disposisi`
--

INSERT INTO `t_disposisi` (`id`, `id_surat`, `id_user`, `user_tujuan`, `aksi`, `tgl_disposisi`, `isi_disposisi`, `catatan`, `status`) VALUES
(1, '21a224a4419347f64aeae6b448238698', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 6, '2020-09-02', 'hallo', 'hallo', 0),
(2, '318575da2fed5f44b4f8d55b18d7af3c', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 4, '2020-09-07', 'Isi disposisi aja', 'catatan disposisi', 0),
(3, 'd44254161c5f13d1f9cb071b95ee041b', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 5, '2020-09-09', 'isi', 'catatan', 0),
(4, '388483cca020e9e2d7808020454e7e13', 54, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', 5, '2020-09-09', 'isi disposisisisisisi', 'catkajd kawjdawd', 0),
(5, '59afa3280cb21cbc760e7430cbc45b32', 54, '32,33,', NULL, '2020-09-09', 'Isi disposisi / intruksi gan ', 'catatatan gan', 0),
(6, '7fd79eb2ab62666946f3d54d2c4906cf', 65, '36,39,32,31,', NULL, '2020-09-11', 'Isi ini gan', 'catatan ini gan', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_histori`
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
-- Dumping data untuk tabel `t_histori`
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
(18, 'SK0015/BLS/SY/IX2020', 'Tati Dedah Nurdianah', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'Tati Dedah Nurdianah Mengkonfirmasi Surat Keluar', '2020-09-14 13:00:05', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jabatan`
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
-- Dumping data untuk tabel `t_jabatan`
--

INSERT INTO `t_jabatan` (`id`, `id_upk`, `kode_jabatan`, `jabatan`, `parent`, `level`, `keterangan`, `status`) VALUES
(1, 5, '01', 'KEPALA YAYASAN', 0, 1, '', '1'),
(2, 5, '02', 'KETUA', 1, 2, '', '1'),
(3, 5, '03', 'WAKIL KETUA', 2, 2, '', '1'),
(4, 5, '04', 'SEKRETARIS', 3, 3, '', '1'),
(5, 5, '04', 'BENDAHARA\r\n', 3, 3, '', '1'),
(6, 10, '001', 'KETUA YAYASAN\r\n', 0, 1, '', '1'),
(7, 5, '04', 'TATA USAHA', 3, 3, '', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis`
--

CREATE TABLE `t_jenis` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_jenis` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `keterangan` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_jenis`
--

INSERT INTO `t_jenis` (`id`, `id_upk`, `kode_jenis`, `jenis`, `keterangan`) VALUES
(1, 5, 'UND', 'Undangan', ''),
(2, 5, 'PBN', 'Pemberitahuan ', ''),
(3, 5, 'PRM', 'Permohonan ', ''),
(4, 5, 'PTN', 'Pernyataan ', ''),
(5, 5, 'KT', 'Keterangan ', ''),
(6, 5, 'HMB', 'Himbauan ', ''),
(7, 5, 'KU', 'Kuasa ', ''),
(8, 5, 'SPK', 'Surat Perintah Kerja ', ''),
(9, 5, 'SMPK', 'Surat Perintah Mulai Kerja (internal) ', ''),
(10, 5, 'PNG', 'Pengumuman ', ''),
(11, 5, 'BLS', 'Balasan', ''),
(12, 5, 'BA', 'Berita acara ', ''),
(13, 5, 'PNT', 'Pengantar', ''),
(14, 5, 'RK', 'Rekomendasi ', ''),
(15, 5, 'ST', 'Surat Tugas ', ''),
(16, 5, 'MM', 'Memo ', ''),
(17, 5, 'SKU', 'Surat Keputusan (Umum)', ''),
(18, 5, 'SKSDM', 'Surat Keputusan SDM ', ''),
(19, 5, 'SKDT', 'SK Dosen Tetap ', ''),
(20, 5, 'SKPT', 'SK Pegawai Tetap ', ''),
(21, 5, 'SKPHK', 'SK PHK ', ''),
(22, 5, 'SKSK', 'SK Struktural ', ''),
(23, 5, 'SKPMK', 'SK Penghargaan Masa Kerja ', ''),
(24, 5, 'PRT', 'Peraturan ', ''),
(25, 5, 'PTBI', 'Perjanjian Tugas Belajar / Izin Belajar ', ''),
(26, 5, 'PKWT', 'Perjanjian Kerja Waktu Tertentu ', ''),
(27, 5, 'FRL', 'Formulir', ''),
(28, 10, '01', 'Undangan', ''),
(29, 10, '02', 'Pemberitahuan ', ''),
(30, 10, '03', 'Permohonan ', ''),
(31, 10, '04', 'Pernyataan ', ''),
(32, 10, '05', 'Keterangan ', ''),
(33, 10, '06', 'Himbauan ', ''),
(34, 10, '07', 'Kuasa ', ''),
(35, 10, '08', 'Surat Perintah Kerja ', ''),
(36, 10, '09', 'Surat Perintah Mulai Kerja (internal) ', ''),
(37, 10, '10', 'Pengumuman ', ''),
(38, 10, '11', 'Balasan', ''),
(39, 10, '12', 'Berita acara ', ''),
(40, 10, '13', 'Pengantar', ''),
(41, 10, '14', 'Rekomendasi ', ''),
(42, 10, '15', 'Surat Tugas ', ''),
(43, 10, '16', 'Memo ', ''),
(44, 10, '17', 'Surat Keputusan (Umum)', ''),
(45, 10, '18', 'Surat Keputusan SDM ', ''),
(46, 10, '19', 'SK Dosen Tetap ', ''),
(47, 10, '20', 'SK Pegawai Tetap ', ''),
(48, 10, '21', 'SK PHK ', ''),
(49, 10, '22', 'SK Struktural ', ''),
(50, 10, '23', 'SK Penghargaan Masa Kerja ', ''),
(51, 10, '24', 'Peraturan ', ''),
(52, 10, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', ''),
(53, 10, '26', 'Perjanjian Kerja Waktu Tertentu ', ''),
(54, 10, '27', 'Formulir', ''),
(55, 9, '01', 'Undangan', ''),
(56, 9, '02', 'Pemberitahuan ', ''),
(57, 9, '03', 'Permohonan ', ''),
(58, 9, '04', 'Pernyataan ', ''),
(59, 9, '05', 'Keterangan ', ''),
(60, 9, '06', 'Himbauan ', ''),
(61, 9, '07', 'Kuasa ', ''),
(62, 9, '08', 'Surat Perintah Kerja ', ''),
(63, 9, '09', 'Surat Perintah Mulai Kerja (internal) ', ''),
(64, 9, '10', 'Pengumuman ', ''),
(65, 9, '11', 'Balasan', ''),
(66, 9, '12', 'Berita acara ', ''),
(67, 9, '13', 'Pengantar', ''),
(68, 9, '14', 'Rekomendasi ', ''),
(69, 9, '15', 'Surat Tugas ', ''),
(70, 9, '16', 'Memo ', ''),
(71, 9, '17', 'Surat Keputusan (Umum)', ''),
(72, 9, '18', 'Surat Keputusan SDM ', ''),
(73, 9, '19', 'SK Dosen Tetap ', ''),
(74, 9, '20', 'SK Pegawai Tetap ', ''),
(75, 9, '21', 'SK PHK ', ''),
(76, 9, '22', 'SK Struktural ', ''),
(77, 9, '23', 'SK Penghargaan Masa Kerja ', ''),
(78, 9, '24', 'Peraturan ', ''),
(79, 9, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', ''),
(80, 9, '26', 'Perjanjian Kerja Waktu Tertentu ', ''),
(81, 9, '27', 'Formulir', ''),
(82, 8, '01', 'Undangan', ''),
(83, 8, '02', 'Pemberitahuan ', ''),
(84, 8, '03', 'Permohonan ', ''),
(85, 8, '04', 'Pernyataan ', ''),
(86, 8, '05', 'Keterangan ', ''),
(87, 8, '06', 'Himbauan ', ''),
(88, 8, '07', 'Kuasa ', ''),
(89, 8, '08', 'Surat Perintah Kerja ', ''),
(90, 8, '09', 'Surat Perintah Mulai Kerja (internal) ', ''),
(91, 8, '10', 'Pengumuman ', ''),
(92, 8, '11', 'Balasan', ''),
(93, 8, '12', 'Berita acara ', ''),
(94, 8, '13', 'Pengantar', ''),
(95, 8, '14', 'Rekomendasi ', ''),
(96, 8, '15', 'Surat Tugas ', ''),
(97, 8, '16', 'Memo ', ''),
(98, 8, '17', 'Surat Keputusan (Umum)', ''),
(99, 8, '18', 'Surat Keputusan SDM ', ''),
(100, 8, '19', 'SK Dosen Tetap ', ''),
(101, 8, '20', 'SK Pegawai Tetap ', ''),
(102, 8, '21', 'SK PHK ', ''),
(103, 8, '22', 'SK Struktural ', ''),
(104, 8, '23', 'SK Penghargaan Masa Kerja ', ''),
(105, 8, '24', 'Peraturan ', ''),
(106, 8, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', ''),
(107, 8, '26', 'Perjanjian Kerja Waktu Tertentu ', ''),
(108, 8, '27', 'Formulir', ''),
(109, 7, '01', 'Undangan', ''),
(110, 7, '02', 'Pemberitahuan ', ''),
(111, 7, '03', 'Permohonan ', ''),
(112, 7, '04', 'Pernyataan ', ''),
(113, 7, '05', 'Keterangan ', ''),
(114, 7, '06', 'Himbauan ', ''),
(115, 7, '07', 'Kuasa ', ''),
(116, 7, '08', 'Surat Perintah Kerja ', ''),
(117, 7, '09', 'Surat Perintah Mulai Kerja (internal) ', ''),
(118, 7, '10', 'Pengumuman ', ''),
(119, 7, '11', 'Balasan', ''),
(120, 7, '12', 'Berita acara ', ''),
(121, 7, '13', 'Pengantar', ''),
(122, 7, '14', 'Rekomendasi ', ''),
(123, 7, '15', 'Surat Tugas ', ''),
(124, 7, '16', 'Memo ', ''),
(125, 7, '17', 'Surat Keputusan (Umum)', ''),
(126, 7, '18', 'Surat Keputusan SDM ', ''),
(127, 7, '19', 'SK Dosen Tetap ', ''),
(128, 7, '20', 'SK Pegawai Tetap ', ''),
(129, 7, '21', 'SK PHK ', ''),
(130, 7, '22', 'SK Struktural ', ''),
(131, 7, '23', 'SK Penghargaan Masa Kerja ', ''),
(132, 7, '24', 'Peraturan ', ''),
(133, 7, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', ''),
(134, 7, '26', 'Perjanjian Kerja Waktu Tertentu ', ''),
(135, 7, '27', 'Formulir', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_notif`
--

CREATE TABLE `t_notif` (
  `id` int(11) NOT NULL,
  `id_surat_masuk` int(11) DEFAULT NULL,
  `id_surat_keluar` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `opened` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_notif`
--

INSERT INTO `t_notif` (`id`, `id_surat_masuk`, `id_surat_keluar`, `id_user`, `opened`) VALUES
(21, 1, NULL, 54, '0'),
(22, 2, NULL, 54, '0'),
(23, 2, NULL, 433, '0'),
(29, 2, NULL, 54, '0'),
(34, NULL, 7, 54, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_quotes`
--

CREATE TABLE `t_quotes` (
  `id` int(11) NOT NULL,
  `quotes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_quotes`
--

INSERT INTO `t_quotes` (`id`, `quotes`) VALUES
(1, 'Jangan lupa bahagia dan bersyukur :)'),
(2, 'Berfikir positif adalah cara terbaik ketika kita tidak punya opsi'),
(3, 'Tuhan adalah pembuat skenario terbaik yang pernah ada'),
(4, 'Ingatkan dirimu tidak apa untuk tidak menjadi orang yang sempurna'),
(5, 'Kamu hebat, sudah berjuang sejauh ini'),
(6, 'Semangat ya :)'),
(7, 'Alon Alon Waton Klakon\r\nPelan-pelan saja asal terlaksana, Bukan berarti hidup tanpa usaha, hanya mengikuti aliran air, Namun tetap berusaha sekuat tenaga tapi tidak memaksakan diri'),
(8, 'Urip iku Urup\r\nHidup itu nyala, hidup itu hendaknya memberikan manfaat bagi orang lain di sekitar kita, semakin besar manfaat yang bisa kita berikan tentu akan lebih baik'),
(9, 'Bukan tuhan tidak sayang, tapi hanya waktunya saja yang belum ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_revisi`
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
-- Dumping data untuk tabel `t_revisi`
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
(12, 8, NULL, 1, '2020-09-14 12:48:19', 'catatan revisina dikembalikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_satuan`
--

CREATE TABLE `t_satuan` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_satuan` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_satuan`
--

INSERT INTO `t_satuan` (`id`, `id_upk`, `kode_satuan`, `satuan`, `keterangan`) VALUES
(6, 5, '01', 'satu', ''),
(7, 5, '02', 'dua', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_sifat`
--

CREATE TABLE `t_sifat` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_sifat` varchar(50) NOT NULL,
  `sifat` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_sifat`
--

INSERT INTO `t_sifat` (`id`, `id_upk`, `kode_sifat`, `sifat`, `keterangan`) VALUES
(7, 5, '01', 'Penting', ''),
(8, 5, '02', 'Mendesak', ''),
(9, 7, '01', 'SIfat', ''),
(10, 8, '01', 'Penting', ''),
(11, 8, '02', 'Mendesak', ''),
(12, 5, '03', 'Biasa', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_staf`
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
-- Struktur dari tabel `t_status`
--

CREATE TABLE `t_status` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_status` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_status`
--

INSERT INTO `t_status` (`id`, `id_upk`, `kode_status`, `status`, `keterangan`) VALUES
(10, 5, '01', 'Proses', ''),
(11, 5, '02', 'Selesai', ''),
(12, 7, '01', 'Status', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_surat`
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
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_surat`
--

INSERT INTO `t_surat` (`id`, `no_surat`, `tanggal_surat`, `tanggal_dibuat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `aksi_surat`, `disposisi`, `disposisi_ke`, `dikirim`, `tujuan_kirim`, `aksi_kirim`, `lampiran`, `perihal`, `isi_surat`, `id_upk`, `id_user`, `status`, `status_pengiriman`, `status_suratmasuk`, `waktu_dibuat`) VALUES
(1, 'SM0001/BA/SY/IX2020', '2020-09-11', '2020-09-11', 'Dinas Pendidikan', 12, 12, 4, 0, '', '', '54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,518,519,', ', ', '3bb11777898e6762b0312436fd47f547.pdf', 'Surat Himbauan Covid-19 ', '-', 5, 506, '1', '1', 1, '2020-09-11 14:03:48'),
(2, 'SM0002/PKWT/SY/IX2020', '2020-09-11', '2020-09-11', 'DISKOMINFO', 7, 26, 8, 2, '', '', ', ', '36,39,', '2dbebd3937914be2a18c0e3e35204957.pdf', 'Ancaman Data di Media Sosial', '', 5, 506, '1', '1', 0, '2020-09-11 14:08:02'),
(3, 'SM0003/KT/SY/IX2020', '2020-09-12', '2020-09-12', 'Stikes BTH', 12, 5, 4, 1, '', '', ', ', '36,39,', 'e8bdbd19fcdfcd9c5a7e9308806d4cf0.pdf', 'Perihal isi', 'Isi Surat', 5, 506, '1', '1', 1, '2020-09-12 09:21:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_suratkeluar`
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
  `status_pengiriman` enum('1','2','0','4') NOT NULL DEFAULT '1' COMMENT '1 = proses \r\n2 = dikembalikan \r\n0 = selesai\r\n4 = Di tolak',
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_suratkeluar`
--

INSERT INTO `t_suratkeluar` (`id`, `no_surat`, `tanggal_dibuat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `perihal`, `isi_surat`, `id_upk`, `id_user`, `persetujuan`, `acc`, `tanggal_konfirmasi`, `status`, `status_pengiriman`, `waktu_dibuat`) VALUES
(1, 'SK0001/BA/SY/IX2020', '2020-09-11', 5, 8, 12, 'TTD Ketua UPK Success', 'TTD Ketua UPK Success', 5, 54, '519', '519,', '2020-09-11', '1', '0', '2020-09-11 13:43:23'),
(2, 'SK0002/FRL/SY/IX2020', '2020-09-11', 5, 8, 27, 'KETUA UPK', 'KETUA UPK', 5, 54, '60,519', '519,60,', '2020-09-11', '1', '0', '2020-09-11 16:38:03'),
(4, 'SK0004/PRT/SY/IX2020', '2020-09-13', 5, 8, 24, 'peri', 'cat', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-13 23:22:02'),
(5, 'SK0004/PRT/SY/IX2020', '2020-09-13', 5, 8, 24, 'peri', 'cat', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-13 23:22:07'),
(6, 'SK0004/PRT/SY/IX2020', '2020-09-13', 5, 8, 24, 'peri', 'cat', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-13 23:22:22'),
(7, 'SK0004/PRT/SY/IX2020', '2020-09-13', 5, 8, 24, 'peri', 'cat', 5, 54, '519', NULL, '0000-00-00', '1', '1', '2020-09-13 23:23:18'),
(8, 'SK0004/PRT/SY/IX2020', '2020-09-13', 5, 8, 24, 'peri', 'cat', 5, 54, '519', '519,', '0000-00-00', '1', '2', '2020-09-13 23:23:33'),
(9, 'SK0009/RK/SY/IX2020', '0000-00-00', 5, 8, 14, 'peri', 'cat', 5, 54, '519', '519,', '0000-00-00', '1', '4', '2020-09-13 23:24:10'),
(10, 'SK0013/RK/SY/IX2020', '2020-09-15', 0, 8, 0, 'periawwadadawd', 'catawdawdaw', 5, 54, '519', '519,', '0000-00-00', '0', '2', '2020-09-13 23:24:33'),
(11, 'SK00010/BA/SY/IX2020', '2020-09-14', 5, 12, 12, 'awdawd', 'awd', 5, 54, '60,519', '519,', '0000-00-00', '1', '4', '2020-09-13 23:25:03'),
(12, 'SK0011/SKDT/SY/IX2020', '2020-09-14', 5, 12, 19, 'TTD minta Ketua Yayasan', 'TTD minta ketua yayasan tes histori', 5, 54, '60,519', '519,', '2020-09-14', '1', '0', '2020-09-14 11:53:37'),
(13, 'SK0012/PRT/SY/IX2020', '2020-09-14', 5, 8, 24, 'buat surat keluar ttd upk', 'buat surat keluar ttd upk', 5, 54, '519', '519,', '2020-09-14', '1', '0', '2020-09-14 12:25:34'),
(15, 'SK0014/PNG/SY/IX2020', '2020-09-15', 5, 8, 10, 'Histori ttd upk acc', 'Histori ttd upk acc', 5, 54, '519', '519,', '2020-09-14', '1', '0', '2020-09-14 12:58:29'),
(16, 'SK0015/BLS/SY/IX2020', '2020-09-14', 5, 8, 11, 'Histori ttd yayasan acc', 'Histori ttd yayasan acc', 5, 54, '60,519', '519,60,', '2020-09-14', '1', '0', '2020-09-14 12:59:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tujuan`
--

CREATE TABLE `t_tujuan` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_tujuan` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_tujuan`
--

INSERT INTO `t_tujuan` (`id`, `id_upk`, `kode_tujuan`, `tujuan`, `keterangan`) VALUES
(1, 7, '01', 'Tujuan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_upk`
--

CREATE TABLE `t_upk` (
  `id` int(11) NOT NULL,
  `ketua_upk` int(11) NOT NULL,
  `kode_upk` varchar(50) NOT NULL,
  `upk` varchar(50) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_upk`
--

INSERT INTO `t_upk` (`id`, `ketua_upk`, `kode_upk`, `upk`, `keterangan`, `logo`) VALUES
(5, 519, 'SY', 'Sekretariat Yayasan', '', 'f3c5c33fde993c4638547d9ea6a19159.png'),
(7, 0, 'SBTH', 'Stikes BTH', '', 'c1b9f28b6192b68a2a3e1540a56c48b6.png'),
(8, 0, 'LKSAA', 'LKSA Amanah ', '', '6063122c728821da00fb574bec1d38ed.jpg'),
(9, 95, 'BTHSH', 'BTH STUDENT HOUSE', '', '1efe52b60671a397b064196850f83512.jpeg'),
(10, 54, 'KLKBTH', 'KLINIK BTH', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_user`
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
-- Dumping data untuk tabel `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`, `id_upk`, `gelar_depan`, `nama_user`, `gelar_belakang`, `email`, `niy`, `status`, `id_satuan`, `id_jabatan`, `level`) VALUES
(7, 'admin', '580097c0183509887837571145ccc3ad', 0, '', 'Admin', '', 'admin', NULL, '1', 0, 0, '1'),
(47, 'klinik', '67ccb39f0ec81c363d058774c2a1598d', 10, '', 'KLINIK BTH', '', 'klinik', NULL, '1', NULL, NULL, '2'),
(48, 'bthstudenthouse', '67ccb39f0ec81c363d058774c2a1598d', 9, '', 'BTH Student House', '', 'bthstudnethouse', NULL, '1', NULL, NULL, '2'),
(49, 'lksaamanah', '67ccb39f0ec81c363d058774c2a1598d', 8, '', 'LKSA Amanah', '', 'lksa', NULL, '1', NULL, NULL, '2'),
(50, 'stikesbth', '67ccb39f0ec81c363d058774c2a1598d', 7, '', 'STIKES BTH', '', 'stikesbth', NULL, '1', NULL, NULL, '2'),
(51, 'yayasan', '67ccb39f0ec81c363d058774c2a1598d', 5, '', 'Yayasan', '', 'yayasan', NULL, '1', NULL, NULL, '2'),
(54, 'pandu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj', 'Agastya Pandu Satriya Utama', 'S.Kom, MM', 'pandu', NULL, '1', NULL, 4, '3'),
(55, 'yoris', '67ccb39f0ec81c363d058774c2a1598d', 5, 'H.', 'Yoris Rusamsi Ruswadi', 'SH, MH', '', NULL, '1', NULL, 30, '3'),
(56, 'wahyu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Wahyu Purwaganda', 'M.Sc', '', NULL, '1', NULL, 30, '3'),
(57, 'sadeli', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Sadeli Suganda', 'M.Kes.', 'sadelisugandaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 31, '3'),
(58, 'mulyana', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Drs. H. ', 'Mulyana', 'MM., M.Kes', 'mulyanamulyanaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 31, '3'),
(59, 'neni', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj. ', 'Neni Heryani', 'S.Sos.', '', NULL, '1', NULL, 31, '3'),
(60, 'tati', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dra. Hj. ', 'Tati Dedah Nurdianah', 'M.Kes', 'tati', NULL, '1', NULL, 32, '3'),
(61, 'yayah', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dra. Hj. ', 'Yayah Syafariah', 'S.Kep., Ners. MM.', '', '880002', '1', NULL, 33, '3'),
(62, 'diana', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Diana Rahmadayanti', 'SE', 'dianarahmaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 34, '3'),
(63, 'aang', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Aang Anharto', NULL, '', NULL, '1', NULL, 35, '3'),
(64, 'asiyah', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Aisyah', NULL, '', NULL, '1', NULL, 35, '3'),
(65, 'asep', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Asep Supyan', 'S.Ked.', 'asepeoffice@stikes-bth.ac.id', NULL, '1', NULL, 36, '3'),
(66, 'dede', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Dede Yuda Wahyu N', 'SH., MH', 'dedeyudaeoffice@stikes-bth.ac.id', NULL, '1', NULL, 37, '3'),
(67, 'deden', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Deden Wahyu', NULL, 'dedenwahyueoffice@stikes-bth.ac.id', NULL, '1', NULL, 38, '3'),
(68, 'fikrim', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Fikri Mubaroq', 'A.Md', 'fikri', NULL, '1', NULL, 7, '3'),
(69, 'fikri', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Fikri Mubaroq', 'S.Kom', 'inanuraenieoffice@stikes-bth.ac.id', NULL, '1', NULL, 7, '3'),
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
(519, '1599027866', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dr. KH.', 'IBNU', 'S.kom MT', 'ibnu', '01010', '1', NULL, 31, '3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `doc_akses_file`
--
ALTER TABLE `doc_akses_file`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `doc_file`
--
ALTER TABLE `doc_file`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `doc_jenis_file`
--
ALTER TABLE `doc_jenis_file`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_akses`
--
ALTER TABLE `t_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_aksi`
--
ALTER TABLE `t_aksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_changelog`
--
ALTER TABLE `t_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_config`
--
ALTER TABLE `t_config`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_disposisi`
--
ALTER TABLE `t_disposisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_histori`
--
ALTER TABLE `t_histori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_jabatan`
--
ALTER TABLE `t_jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_upk` (`id_upk`);

--
-- Indeks untuk tabel `t_jenis`
--
ALTER TABLE `t_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_notif`
--
ALTER TABLE `t_notif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_surat_masuk` (`id_surat_masuk`),
  ADD KEY `id_surat_keluar` (`id_surat_keluar`),
  ADD KEY `FK_t_notif_t_user` (`id_user`);

--
-- Indeks untuk tabel `t_quotes`
--
ALTER TABLE `t_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_revisi`
--
ALTER TABLE `t_revisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_satuan`
--
ALTER TABLE `t_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_sifat`
--
ALTER TABLE `t_sifat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_staf`
--
ALTER TABLE `t_staf`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_status`
--
ALTER TABLE `t_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_surat`
--
ALTER TABLE `t_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_tujuan`
--
ALTER TABLE `t_tujuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_upk` (`id_upk`);

--
-- Indeks untuk tabel `t_upk`
--
ALTER TABLE `t_upk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_upk` (`kode_upk`);

--
-- Indeks untuk tabel `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `doc_akses_file`
--
ALTER TABLE `doc_akses_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `doc_file`
--
ALTER TABLE `doc_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `doc_jenis_file`
--
ALTER TABLE `doc_jenis_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `t_akses`
--
ALTER TABLE `t_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `t_aksi`
--
ALTER TABLE `t_aksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `t_changelog`
--
ALTER TABLE `t_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `t_config`
--
ALTER TABLE `t_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT untuk tabel `t_disposisi`
--
ALTER TABLE `t_disposisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `t_histori`
--
ALTER TABLE `t_histori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `t_jabatan`
--
ALTER TABLE `t_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_jenis`
--
ALTER TABLE `t_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT untuk tabel `t_notif`
--
ALTER TABLE `t_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `t_quotes`
--
ALTER TABLE `t_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `t_revisi`
--
ALTER TABLE `t_revisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `t_satuan`
--
ALTER TABLE `t_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_sifat`
--
ALTER TABLE `t_sifat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `t_staf`
--
ALTER TABLE `t_staf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_status`
--
ALTER TABLE `t_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `t_surat`
--
ALTER TABLE `t_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `t_tujuan`
--
ALTER TABLE `t_tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `t_upk`
--
ALTER TABLE `t_upk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=520;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_notif`
--
ALTER TABLE `t_notif`
  ADD CONSTRAINT `FK_t_notif_t_surat` FOREIGN KEY (`id_surat_masuk`) REFERENCES `t_surat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_t_notif_t_suratkeluar` FOREIGN KEY (`id_surat_keluar`) REFERENCES `t_suratkeluar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_t_notif_t_user` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
