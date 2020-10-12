-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 25 Sep 2020 pada 04.45
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
(10, '1600944432', 7),
(11, '1601002037', 33);

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
(4, 54, 5, '1600944432', 'Untuk Fikri Mubaroq', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti, porro labore doloribus sapiente illum iusto aliquam eius beatae dignissimos laborum sed impedit officiis atque, at, dicta facere. Esse, omnis natus.', 'e478bc174a3fc6c5aecd8fdd33f85a87361b5929.pdf', '.pdf', '2020-09-24 17:36:20'),
(5, 68, 5, '1601002037', 'Contoh Dokumen 1', 'Isi dokumen', 'e8c08a53ae04f84cf58d5b5321d42a650d2b0c3b.pdf', '.pdf', '2020-09-25 09:45:17');

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
  `keterangan` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_aksi`
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
  `id_user_jabatan` int(11) DEFAULT NULL,
  `user_tujuan` text NOT NULL,
  `jabatan_terkait` text NOT NULL,
  `aksi` int(11) DEFAULT NULL,
  `tgl_disposisi` date NOT NULL,
  `isi_disposisi` text NOT NULL,
  `catatan` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_disposisi`
--

INSERT INTO `t_disposisi` (`id`, `id_surat`, `id_user`, `id_user_jabatan`, `user_tujuan`, `jabatan_terkait`, `aksi`, `tgl_disposisi`, `isi_disposisi`, `catatan`, `status`) VALUES
(1, '21a224a4419347f64aeae6b448238698', 54, NULL, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', 6, '2020-09-02', 'hallo', 'hallo', 0),
(2, '318575da2fed5f44b4f8d55b18d7af3c', 54, NULL, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', 4, '2020-09-07', 'Isi disposisi aja', 'catatan disposisi', 0),
(3, 'd44254161c5f13d1f9cb071b95ee041b', 54, NULL, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', 5, '2020-09-09', 'isi', 'catatan', 0),
(4, '388483cca020e9e2d7808020454e7e13', 54, NULL, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', 5, '2020-09-09', 'isi disposisisisisisi', 'catkajd kawjdawd', 0),
(5, '59afa3280cb21cbc760e7430cbc45b32', 54, NULL, '32,33,', '', NULL, '2020-09-09', 'Isi disposisi / intruksi gan ', 'catatatan gan', 0),
(6, '7fd79eb2ab62666946f3d54d2c4906cf', 65, NULL, '36,39,32,31,', '', NULL, '2020-09-11', 'Isi ini gan', 'catatan ini gan', 0),
(7, '4b2b220aba7752d0950f0dc2a6d53def', 54, NULL, '31,39,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', NULL, '2020-09-18', 'awdwa', 'adawdwa', 0),
(8, '1e449642c44b7c1d040469c3bb783596', 54, NULL, '31,39,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', NULL, '2020-09-18', 'coba dispsisi', 'awdawdaw', 0),
(9, '9f98d0d2fb8db2ce749b706f8534ad8e', 54, NULL, '31,39,39,', '', NULL, '2020-09-18', 'awokawoawk', 'awwokawokawo', 0),
(10, '243451c8573414ef8b1fe1c9bb359f09', 54, NULL, '30,', '', NULL, '2020-09-18', 'isi', 'catatan', 0),
(11, '613f82c1951af9891773c47e1a38ea7d', 54, NULL, '30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,', '', NULL, '2020-09-18', 'adawd', 'awdawd', 0),
(12, '6f2a24626d19faa7af7396735927e9c6', 54, NULL, '31,39,', '', NULL, '2020-09-18', 'akoawkaowkwao', 'aowkaowkawooawk', 0),
(13, '6f2a24626d19faa7af7396735927e9c6', 54, NULL, '31,', '', NULL, '2020-09-18', 'coba aja', 'coba aja', 0),
(14, 'a7545e654b251b539c4cd3f5452d9ded', 54, NULL, '31,', '', NULL, '2020-09-18', 'percobaan', 'percobaan', 0),
(15, '077fd42f65ca7e14d52e21b28d1b6163', 54, NULL, '32,', '', NULL, '2020-09-23', 'isi ke keta yayasan', 'isi ke keta yayasan', 0),
(16, '077fd42f65ca7e14d52e21b28d1b6163', 54, NULL, '30,31,', '30,31,', NULL, '2020-09-23', 'awokokawo', 'awkoakawoaw', 0),
(17, '077fd42f65ca7e14d52e21b28d1b6163', 54, NULL, '32,', '32,', NULL, '2020-09-23', 'kirim ketua', 'kirim ketua', 0),
(18, '2', 54, 39, '32,', '32,', 8, '2020-09-24', '<p>awokawoawk</p>', '<p>aowkawokaw</p>', 0),
(19, '2', 54, 39, '31,', '31,', 6, '2020-09-24', '<p>awdawd</p>', '<p>asdwa</p>', 0),
(20, '2', 0, 39, '31,', '31,', 6, '0000-00-00', '<p>awdawd</p>', '<p>asdwa</p>', 0),
(21, '318575da2fed5f44b4f8d55b18d7af3c', 54, 39, '31,', '31,', 5, '2020-09-24', '<p>awkoawkaow</p>', '<p>awwowakoawko</p>', 0);

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
  `catatan_revisi` text NOT NULL,
  `tipe` int(11) DEFAULT NULL COMMENT '1. Buat Surat Keluar\r\n2. Revisi Surat Keluar\r\n3. Surat Keluar di Tolak\r\n0. Selesai\r\n4. Surat Dikembalikan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_histori`
--

INSERT INTO `t_histori` (`id`, `no_surat`, `nama_user`, `aksi`, `status_pengiriman`, `keterangan`, `waktu_dibuat`, `perihal`, `isi_surat`, `catatan_revisi`, `tipe`) VALUES
(1, 'SK0001/PTBI/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-22 16:48:53', 'ie oi', 'ie oi', '', 1),
(2, 'SK0001/PTBI/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-22 16:49:13', NULL, NULL, 'revisi oi', 4),
(3, 'SK0001/PTBI/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Agastya Pandu Satriya Utama Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-22 16:49:28', NULL, NULL, '', 2),
(4, 'SK0001/PTBI/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-22 16:49:45', NULL, NULL, 'salah keneh', 4),
(5, 'SK0001/PBN/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Agastya Pandu Satriya Utama Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-22 16:50:06', NULL, NULL, '', 2),
(6, 'SK0001/PBN/SY/IX2020', 'IBNU', 'Approval Surat Keluar', 'Surat Di konfirmasi', 'IBNU Mengkonfirmasi Surat Keluar', '2020-09-22 16:50:18', NULL, NULL, '', 0),
(7, 'SK0003/PTBI/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-22 16:53:01', 'di tolak', 'di tolak', '', 1),
(8, 'SK0004/HMB/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-22 16:56:20', 'adawd', 'awd', '', 1),
(9, 'SK0003/PTBI/SY/IX2020', 'IBNU', 'Surat Keluar Di Tolak', 'Surat Di tolak', 'IBNU Menolak Surat Keluar', '2020-09-22 17:09:09', NULL, NULL, '', 3),
(10, 'SK0005/BA/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-23 12:44:20', 'minta ketua upk', 'minta ketua upk', '', 1),
(11, 'SK0005/BA/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-23 12:45:11', NULL, NULL, 'revisi oi', 4),
(12, 'SK0005/BA/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Agastya Pandu Satriya Utama Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-23 13:36:44', NULL, NULL, '', 2),
(13, 'SK0005/BA/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-23 13:36:57', NULL, NULL, 'hwhwhheh', 4),
(14, 'SK0005/BA/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Agastya Pandu Satriya Utama Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-23 13:37:18', NULL, NULL, '', 2),
(15, 'SK0005/BA/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-23 13:37:29', NULL, NULL, 'akoawkawokaoawk', 4),
(16, 'SK0005/BA/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Merevisi Surat Keluar', 'Mengirim Ulang Surat Keluar / Melakukan Revisi', 'Agastya Pandu Satriya Utama Mengirim Ulang / Melakukan Revisi pada Surat Keluar', '2020-09-23 14:00:53', NULL, NULL, '', 2),
(17, 'SK0005/BA/SY/IX2020', 'IBNU', 'Mengembalikan Surat Keluar', 'Surat Dikembalikan / Revisi', 'IBNU Mengembalikan Surat Keluar', '2020-09-23 14:01:20', NULL, NULL, 'whehehehe', 4),
(18, 'SK0001/PTBI/SY/IX2020', 'Agastya Pandu Satriya Utama', 'Buat Surat', ' Membuat Surat Keluar', 'Agastya Pandu Satriya Utama Membuat Surat Keluar', '2020-09-23 17:31:41', 'awdawd', 'awd', '', 1);

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
-- Struktur dari tabel `t_jenis`
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
-- Dumping data untuk tabel `t_jenis`
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
-- Struktur dari tabel `t_notif`
--

CREATE TABLE `t_notif` (
  `id` int(11) NOT NULL,
  `notif` varchar(50) NOT NULL,
  `id_surat_masuk` int(11) DEFAULT NULL,
  `id_surat_keluar` int(11) DEFAULT NULL,
  `id_revisi` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `tipe` int(11) NOT NULL,
  `opened` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_notif`
--

INSERT INTO `t_notif` (`id`, `notif`, `id_surat_masuk`, `id_surat_keluar`, `id_revisi`, `id_user`, `tipe`, `opened`) VALUES
(1, '1600857071', 1, NULL, NULL, 519, 1, '1'),
(2, '1600857101', NULL, 1, NULL, 519, 2, '1'),
(3, '1600861051', 2, NULL, NULL, 519, 1, '1'),
(4, '1600929215', 4, NULL, NULL, 54, 1, '0');

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
-- Struktur dari tabel `t_revisi`
--

CREATE TABLE `t_revisi` (
  `id` int(11) NOT NULL,
  `id_suratkeluar` int(11) NOT NULL,
  `id_user_revisi` int(11) DEFAULT NULL COMMENT 'Revisi Berasal Dari Siapa',
  `status` int(11) NOT NULL COMMENT '1 = Dikembalikan / Revisi \r\n2. Selesai\r\n0. Selesai tidak di acc',
  `tanggal_revisi` datetime NOT NULL DEFAULT current_timestamp(),
  `catatan_revisi` text NOT NULL,
  `notif` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_revisi`
--

INSERT INTO `t_revisi` (`id`, `id_suratkeluar`, `id_user_revisi`, `status`, `tanggal_revisi`, `catatan_revisi`, `notif`) VALUES
(53, 55, NULL, 1, '2020-09-22 12:55:20', 'revisi oi', '1600753689'),
(54, 56, NULL, 1, '2020-09-22 13:01:56', 'awwaokowaawo', '1600753958'),
(55, 59, NULL, 1, '2020-09-22 13:03:22', 'revisi nya', '1600754591'),
(56, 60, NULL, 1, '2020-09-22 13:11:11', 'again', ''),
(57, 1, NULL, 1, '2020-09-22 13:40:17', 'revisi back', '1600755427'),
(58, 2, NULL, 1, '2020-09-22 14:00:34', 'cobaan revisi', '1600757236'),
(59, 1, NULL, 1, '2020-09-22 14:22:47', 'cobaan revisi', '1600757227'),
(60, 1, NULL, 1, '2020-09-22 14:30:37', 'awkawoawkoaw revisi', '1600757227'),
(61, 3, NULL, 1, '2020-09-22 14:35:32', 'awkawoawkoaw revisi', ''),
(62, 5, NULL, 1, '2020-09-22 14:35:41', 'awkawoawkoaw revisi ', ''),
(63, 7, NULL, 1, '2020-09-22 14:43:00', 'reviisaiwdaw oi', '1600760300'),
(64, 8, NULL, 1, '2020-09-22 15:09:46', 'revisi deii oioioi', ''),
(65, 9, NULL, 1, '2020-09-22 15:10:25', 'revisi deii oioioi', '1600762213'),
(66, 11, NULL, 1, '2020-09-22 15:19:19', 'asdwa', ''),
(67, 12, NULL, 1, '2020-09-22 15:25:30', 'asdwaawd', '1600763120'),
(68, 14, NULL, 1, '2020-09-22 16:04:55', 'aowkoaawko revisi', ''),
(69, 1, NULL, 1, '2020-09-22 16:49:13', 'revisi oi', '1600768133'),
(70, 2, NULL, 1, '2020-09-22 16:49:45', 'salah keneh', ''),
(71, 6, NULL, 1, '2020-09-23 12:45:11', 'revisi oi', '1600839859'),
(72, 7, 519, 1, '2020-09-23 13:36:57', 'hwhwhheh', ''),
(73, 8, 519, 1, '2020-09-23 13:37:29', 'akoawkawokaoawk', ''),
(74, 9, 519, 1, '2020-09-23 14:01:20', 'whehehehe', '');

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
  `keterangan` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_sifat`
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
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp(),
  `notif` varchar(50) NOT NULL,
  `arsipkan` enum('1','0') DEFAULT '0' COMMENT '1 Dimasukan ke arsip\r\n0 Tidak dimasukan ke arsip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_surat`
--

INSERT INTO `t_surat` (`id`, `no_surat`, `tanggal_surat`, `tanggal_dibuat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `aksi_surat`, `disposisi`, `disposisi_ke`, `dikirim`, `tujuan_kirim`, `aksi_kirim`, `lampiran`, `perihal`, `isi_surat`, `id_upk`, `id_user`, `status`, `status_pengiriman`, `status_suratmasuk`, `waktu_dibuat`, `notif`, `arsipkan`) VALUES
(1, 'SM0001/FRL/SY/IX2020', '2020-09-23', '2020-09-23', 'Sekretariat Yayasan', 8, 27, 8, 0, '', '', '519,', ', ', 'cd9843aca503d9c6008d192d27730b6d.pdf', 'awd', 'awd', 5, 506, '1', '1', 1, '2020-09-23 17:31:11', '1600857071', '0'),
(2, 'SM0002/PNT/SY/IX2020', '2020-09-23', '2020-09-23', 'Stikes BTH', 12, 13, 5, 0, '', '', '519,', ', ', 'd6f75131dcb680b11c6306685b3d0cbc.pdf', '12312', '123123', 5, 506, '1', '1', 1, '2020-09-23 18:37:31', '1600861051', '0'),
(3, 'SM0003/PTN/SY/IX2020', '2020-09-22', '2020-09-24', 'LKSA Amanah ', 8, 4, 0, 2, '', '', ', ', '39,', '24cae95ed75fc4a428900ad9f75c2fa3.pdf,9aa07315c532dcb79d44a245618067c0.pdf', 'adawdawd', '', 5, 506, '1', '1', 0, '2020-09-24 13:10:15', '1600927814', '0'),
(4, 'SM0003/PTN/SY/IX2020', '2020-09-22', '2020-09-24', 'Sekretariat Yayasan', 8, 4, 0, 1, '', '', '54,', ', ', '61b4b7376606e99b73266503174e23bd.pdf,8b9071b51b0680bc791b88f6f2fc662e.pdf', 'adawdawd', '', 5, 506, '1', '1', 1, '2020-09-24 13:33:35', '1600929215', '0');

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
  `status_lampiran` int(11) DEFAULT NULL COMMENT '1. Lampiran Tersedia\r\n0. Lampiran tidak tersedia ',
  `jenis_lampiran` int(11) DEFAULT NULL COMMENT '1. Hardcopy\r\n2. Softcopy',
  `lampiran` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 = Aktif 0 = Tidak Akrif',
  `status_pengiriman` enum('1','2','0','4','5') NOT NULL DEFAULT '1' COMMENT '1 = proses \r\n2 = dikembalikan \r\n0 = selesai\r\n4 = Di tolak\r\n5 = Di setujui Ketua UPK',
  `waktu_dibuat` datetime NOT NULL DEFAULT current_timestamp(),
  `notif` varchar(50) NOT NULL,
  `arsipkan` enum('1','0') NOT NULL DEFAULT '0' COMMENT '1 Dimasukan ke arsip \r\n0 Tidak dimasukan ke arsip',
  `tembusan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `t_suratkeluar`
--

INSERT INTO `t_suratkeluar` (`id`, `no_surat`, `tanggal_dibuat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `perihal`, `isi_surat`, `id_upk`, `id_user`, `persetujuan`, `acc`, `tanggal_konfirmasi`, `status_lampiran`, `jenis_lampiran`, `lampiran`, `status`, `status_pengiriman`, `waktu_dibuat`, `notif`, `arsipkan`, `tembusan`) VALUES
(1, 'SK0001/PTBI/SY/IX2020', '2020-09-23', 5, 8, 25, 'awdawd', 'awd', 5, 54, '519', NULL, '0000-00-00', NULL, NULL, '', '1', '1', '2020-09-23 17:31:41', '1600857101', '0', NULL);

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
  `logo` text NOT NULL,
  `format_surat_keluar` varchar(255) NOT NULL,
  `format_surat_masuk` varchar(255) NOT NULL,
  `status` set('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_upk`
--

INSERT INTO `t_upk` (`id`, `ketua_upk`, `kode_upk`, `upk`, `keterangan`, `logo`, `format_surat_keluar`, `format_surat_masuk`, `status`) VALUES
(5, 519, 'SY', 'Sekretariat Yayasan', 'email : ibnu', 'f3c5c33fde993c4638547d9ea6a19159.png', 'SK{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', 'SM{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', '1'),
(7, 0, 'SBTH', 'Stikes BTH', '', 'c1b9f28b6192b68a2a3e1540a56c48b6.png', 'SK{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', 'SM{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', '1'),
(8, 83, 'LKSAA', 'LKSA Amanah ', 'email : zaenal ', '6063122c728821da00fb574bec1d38ed.jpg', 'SK{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', 'SM{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', '1'),
(9, 95, 'BTHSH', 'BTH STUDENT HOUSE', '', '1efe52b60671a397b064196850f83512.jpeg', 'SK{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', 'SM{{NO_URUT}}/{{JENIS_SURAT}}/{{UPK}}/{{BULAN}}/{{TAHUN}}', '1'),
(10, 54, 'KLKBTH', 'KLINIK BTH', '', '', '', '', '1');

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
(54, 'pandu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj', 'Agastya Pandu Satriya Utama', 'S.Kom, MM', 'pandu', NULL, '1', NULL, 33, '3'),
(55, 'yoris', '67ccb39f0ec81c363d058774c2a1598d', 5, 'H.', 'Yoris Rusamsi Ruswadi', 'SH, MH', '', NULL, '1', NULL, 30, '3'),
(56, 'wahyu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Wahyu Purwaganda', 'M.Sc', 'agastyapandu7@gmail.com', NULL, '1', NULL, 30, '3'),
(57, 'sadeli', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Sadeli Suganda', 'M.Kes.', 'sadeli', NULL, '1', NULL, 31, '3'),
(58, 'mulyana', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Drs. H. ', 'Mulyana', 'MM., M.Kes', 'agastyapandu7@gmail.com', NULL, '1', NULL, 31, '3'),
(59, 'neni', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj. ', 'Neni Heryani', 'S.Sos.', '', NULL, '1', NULL, 31, '3'),
(60, 'tati', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dra. Hj. ', 'Tati Dedah Nurdianah', 'M.Kes', 'tati', NULL, '1', NULL, 32, '3'),
(61, 'yayah', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dra. Hj. ', 'Yayah Syafariah', 'S.Kep., Ners. MM.', '', '880002', '1', NULL, 33, '3'),
(62, 'diana', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Diana Rahmadayanti', 'SE', NULL, NULL, '1', NULL, 34, '3'),
(63, 'aang', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Aang Anharto', NULL, '', NULL, '1', NULL, 35, '3'),
(64, 'asiyah', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Aisyah', NULL, '', NULL, '1', NULL, 35, '3'),
(65, 'asep', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Asep Supyan', 'S.Ked.', NULL, NULL, '1', NULL, 36, '3'),
(66, 'dede', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Dede Yuda Wahyu N', 'SH., MH', NULL, NULL, '1', NULL, 37, '3'),
(67, 'deden', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Deden Wahyu', NULL, NULL, NULL, '1', NULL, 38, '3'),
(68, 'furi', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Furi Furwani', 'A.Md', 'furi', NULL, '1', NULL, 39, '3'),
(69, 'ina', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Ina Nuraeni', 'SE', NULL, NULL, '1', NULL, 40, '3'),
(70, 'intan', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Intan Melinda', 'SE.Ak., CA', NULL, NULL, '1', NULL, 41, '3'),
(71, 'irvan', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Irvan Maulana', 'SE', NULL, NULL, '1', NULL, 42, '3'),
(72, 'jeffry', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Jeffry Nugraha', 'ST., MM.', NULL, NULL, '1', NULL, 43, '3'),
(73, 'risna', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Risna Resita', 'S.ST', NULL, NULL, '1', NULL, 44, '3'),
(74, 'rohmat', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Rohmat Noer Fajril', NULL, '', NULL, '1', NULL, 39, '3'),
(75, 'taufik', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Taufik Hudaya', 'S.Sn.', '', NULL, '1', NULL, 45, '3'),
(76, 'vinna', '67ccb39f0ec81c363d058774c2a1598d', 5, NULL, 'Vinna Noor Afifah', 'ST.', NULL, NULL, '1', NULL, 46, '3'),
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
(519, '1599027866', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Dr. KH.', 'IBNU', 'S.kom MT', 'ibnu', '01010', '1', NULL, 31, '3'),
(520, 'titi', '67ccb39f0ec81c363d058774c2a1598d', 5, 'dr. H. ', 'Titi Lestia', 'M.Kes.', 'titilestiasriwahyuni@gmail.com', NULL, '1', NULL, 31, '3'),
(521, '1600445592', '67ccb39f0ec81c363d058774c2a1598d', 8, '', 'Admin Persuratan LKSA Amanah', '', 'adminpersuratanlksa', NULL, '1', NULL, 51, '4');

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
  ADD KEY `id_user` (`id_user`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `doc_file`
--
ALTER TABLE `doc_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `t_histori`
--
ALTER TABLE `t_histori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `t_jabatan`
--
ALTER TABLE `t_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `t_jenis`
--
ALTER TABLE `t_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT untuk tabel `t_notif`
--
ALTER TABLE `t_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_quotes`
--
ALTER TABLE `t_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `t_revisi`
--
ALTER TABLE `t_revisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_suratkeluar`
--
ALTER TABLE `t_suratkeluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `t_tujuan`
--
ALTER TABLE `t_tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `t_upk`
--
ALTER TABLE `t_upk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_notif`
--
ALTER TABLE `t_notif`
  ADD CONSTRAINT `FK_t_notif_t_user` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
