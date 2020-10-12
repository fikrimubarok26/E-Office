-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2020 at 04:29 PM
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
(4, 7, '01', 'Akses', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_aksi`
--

CREATE TABLE `t_aksi` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_aksi` varchar(50) NOT NULL,
  `aksi` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_aksi`
--

INSERT INTO `t_aksi` (`id`, `id_upk`, `kode_aksi`, `aksi`, `keterangan`) VALUES
(4, 5, '01', 'ACC', ''),
(5, 5, '02', 'LAKSANAKAN', ''),
(6, 5, '03', 'SEGERA', ''),
(7, 5, '04', 'SIAPKAN', ''),
(8, 5, '05', 'TINDAK LANJUTI SEGERA', ''),
(9, 7, '01', 'Aksi', '');

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
(1, 'logo', 'f0499c6be3c399f1e09697ddd409fe08.png', ''),
(2, 'nama', 'STIKES BTH', ''),
(3, 'alamat', 'Setiajaya Kecamatan Cibeureum Jl. Cilolohan No. 36 Kel. Kahuripan Tawang, Kota, Kec, Tasikmalaya, Jawa Barat 46115', ''),
(4, 'no_telp_1', '0265334740', ''),
(5, 'no_telp_2', '08', ''),
(6, 'email', 'mail@stikes-bth.ac.id', ''),
(7, 'logo-05', '', ''),
(9, 'logo-01', NULL, NULL),
(10, 'logo-02', NULL, NULL),
(11, 'logo-03', NULL, NULL),
(12, 'logo-04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_disposisi`
--

CREATE TABLE `t_disposisi` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user_tujuan` int(11) NOT NULL,
  `tgl_disposisi` int(11) NOT NULL,
  `isi_disposisi` text NOT NULL,
  `catatan` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_jabatan`
--

CREATE TABLE `t_jabatan` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_jabatan` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `parent` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_jabatan`
--

INSERT INTO `t_jabatan` (`id`, `id_upk`, `kode_jabatan`, `jabatan`, `parent`, `level`, `keterangan`) VALUES
(30, 5, '01', 'Pembina Yayasan', 0, 1, ''),
(31, 5, '02', 'Pengawas Yayasan', 30, 1, ''),
(32, 5, '03', 'Ketua Yayasan', 0, 1, ''),
(33, 5, '04', 'Sekretaris Yayasan', 32, 1, ''),
(34, 5, '05', 'Bendahara Yayasan', 33, 1, ''),
(35, 5, '06', 'Pekarya', 0, 1, ''),
(36, 5, '07', 'Kepala Badan Perencanaan, Pengembangan, dan kerjas', 0, 1, ''),
(37, 5, '08', 'Kabid SDM', 0, 1, ''),
(38, 5, '09', 'Sopir', 0, 1, ''),
(39, 5, '10', 'Staf TIK', 0, 1, ''),
(40, 5, '11', 'Staf Anggaran dan Pengeluaran', 0, 1, ''),
(41, 5, '12', 'Kasubid Akunting dan Pajak', 0, 1, ''),
(42, 5, '13', 'Staf Adm Pengawas', 0, 1, ''),
(43, 5, '14', 'Staf Adm Sarpras dan Lingkungan', 0, 1, ''),
(44, 5, '15', 'Staf Akunting, anggaran dan Pajak', 0, 1, ''),
(45, 5, '16', 'Staf Adminstrasi dan Umum', 0, 1, ''),
(46, 5, '17', 'Staf TU dan SDM', 0, 1, ''),
(47, 5, '18', 'Kabid Sarpras', 0, 1, ''),
(48, 8, '01', 'Seksi Rumah Tangga', 0, 1, ''),
(49, 8, '02', 'Adm Umum dan Keuangan', 0, 1, ''),
(50, 8, '03', 'Pekarya', 0, 1, ''),
(51, 8, '04', 'Ketua LKSA', 0, 1, ''),
(52, 9, '01', 'Pekarya', 0, 1, ''),
(53, 9, '02', 'Adm Umum dan Keuangan', 0, 1, ''),
(54, 9, '03', 'Satpam', 0, 1, ''),
(55, 9, '04', 'Pembimbing Resident', 0, 1, ''),
(56, 9, '05', 'Sarana dan Prasarana', 0, 1, ''),
(57, 10, '01', 'Pekarya', 0, 1, ''),
(58, 10, '02', 'Adm Umum dan Keuangan', 0, 1, ''),
(59, 10, '03', 'Bidan', 0, 1, ''),
(60, 10, '04', 'Perawat', 0, 1, ''),
(61, 10, '05', 'Ketua Klinik', 0, 1, ''),
(62, 10, '06', 'Ass. Apoteker', 0, 1, ''),
(63, 10, '06', 'Laboran', 0, 1, ''),
(64, 10, '07', 'Terapi Komplementer Psikolog', 0, 1, ''),
(65, 7, '01', 'Cleaning Service', 0, 1, ''),
(66, 7, '02', 'Staf Pusat Karier PMB', 0, 1, ''),
(67, 7, '03', 'Dosen Farmasi', 0, 1, ''),
(68, 7, '04', 'Asisten Praktikum RO', 0, 1, ''),
(69, 7, '05', 'Laboran Analis', 0, 1, ''),
(70, 7, '06', 'Kabag Sarpras', 0, 1, ''),
(71, 7, '07', 'Dosen Keperawatan', 0, 1, ''),
(72, 7, '08', 'Laboran Farmasi', 0, 1, ''),
(73, 7, '09', 'Kepala UPT Perpustakaan', 0, 1, ''),
(74, 7, '10', 'Calon Dosen Analis', 0, 1, ''),
(75, 7, '11', 'Sopir', 0, 1, ''),
(76, 7, '12', 'Dosen', 0, 1, ''),
(77, 7, '13', 'Laboran R O', 0, 1, ''),
(78, 7, '14', 'Laboran Keperawatan', 0, 1, ''),
(79, 7, '15', 'Satpam', 0, 1, ''),
(80, 7, '16', 'Staf TIK', 0, 1, ''),
(81, 7, '17', 'Staf Teknis Lab Analis', 0, 1, ''),
(82, 7, '18', 'Dosen Analis', 0, 1, ''),
(83, 7, '19', 'Wk. Ketua 2', 0, 1, ''),
(84, 7, '20', 'Staff BAA', 0, 1, ''),
(85, 7, '21', 'Staf Teknis Lab Keperawatan', 0, 1, ''),
(86, 7, '22', 'Pustakawan', 0, 1, ''),
(87, 7, '23', 'Ketua STIKes BTH', 0, 1, ''),
(88, 7, '24', 'Pekarya', 0, 1, ''),
(89, 7, '25', 'Sekprod Keperawatan', 0, 1, ''),
(90, 7, '26', 'Kabag BAA', 0, 1, ''),
(91, 7, '27', 'Dosen PSPPA', 0, 1, ''),
(92, 7, '28', 'Staf TU', 0, 1, ''),
(93, 7, '29', 'Sekprod RO', 0, 1, ''),
(94, 7, '30', 'Sekretaris P3M', 0, 1, ''),
(95, 7, '31', 'Laboran PSPPA', 0, 1, ''),
(96, 7, '32', 'Staff Keuangan', 0, 1, ''),
(97, 7, '33', 'Ketua Komisi KEPK', 0, 1, ''),
(98, 7, '34', 'Ketua Prodi Farmasi', 0, 1, ''),
(99, 7, '35', 'Staf BAA', 0, 1, ''),
(100, 7, '36', 'Sekprod Farmasi', 0, 1, ''),
(101, 7, '37', 'Staf Teknis Lab Farmasi', 0, 1, ''),
(102, 7, '38', 'Sekprod PSPPA', 0, 1, ''),
(103, 7, '39', 'Kabag SDM', 0, 1, ''),
(104, 7, '40', 'Kabag Keuangan', 0, 1, ''),
(105, 7, '41', 'Staf Sarana dan Prasarana', 0, 1, ''),
(106, 7, '42', 'Ketua Prodi Analis Kesehatan', 0, 1, ''),
(107, 7, '43', 'Staf Administrasi', 0, 1, ''),
(108, 7, '44', 'Ketua Prodi RO', 0, 1, ''),
(109, 7, '45', 'Ketua Prodi PSPPA', 0, 1, ''),
(110, 7, '46', 'Sekprodi Analis', 0, 1, ''),
(111, 7, '47', 'Ketua BPM', 0, 1, ''),
(112, 7, '48', 'Dosen Farmasi (Dpk)', 0, 1, ''),
(113, 7, '49', 'Ketua LSP', 0, 1, ''),
(114, 7, '50', 'Wk. Ketua 1', 0, 1, ''),
(115, 7, '51', 'Kabag Tata Usaha dan Kerjasama', 0, 1, ''),
(116, 7, '52', 'Staf Keuangan', 0, 1, ''),
(117, 7, '53', 'Wk. Ketua III', 0, 1, ''),
(118, 7, '54', 'Ketua P3M', 0, 1, ''),
(119, 7, '55', 'Ketua Prodi Keperawatan', 0, 1, ''),
(120, 7, '56', 'Kabag Kemahasiswaan', 0, 1, ''),
(121, 7, '57', 'Staf SDM', 0, 1, ''),
(122, 7, '58', 'Staff Kemahasiswaan', 0, 1, ''),
(123, 7, '59', 'Resepsionis', 0, 1, ''),
(124, 7, '60', 'Staf BPM', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis`
--

CREATE TABLE `t_jenis` (
  `id` int(11) NOT NULL,
  `id_upk` int(11) NOT NULL,
  `kode_jenis` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `keterangan` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_jenis`
--

INSERT INTO `t_jenis` (`id`, `id_upk`, `kode_jenis`, `jenis`, `keterangan`) VALUES
(1, 5, '01', 'Undangan', ''),
(2, 5, '02', 'Pemberitahuan ', ''),
(3, 5, '03', 'Permohonan ', ''),
(4, 5, '04', 'Pernyataan ', ''),
(5, 5, '05', 'Keterangan ', ''),
(6, 5, '06', 'Himbauan ', ''),
(7, 5, '07', 'Kuasa ', ''),
(8, 5, '08', 'Surat Perintah Kerja ', ''),
(9, 5, '09', 'Surat Perintah Mulai Kerja (internal) ', ''),
(10, 5, '10', 'Pengumuman ', ''),
(11, 5, '11', 'Balasan', ''),
(12, 5, '12', 'Berita acara ', ''),
(13, 5, '13', 'Pengantar', ''),
(14, 5, '14', 'Rekomendasi ', ''),
(15, 5, '15', 'Surat Tugas ', ''),
(16, 5, '16', 'Memo ', ''),
(17, 5, '17', 'Surat Keputusan (Umum)', ''),
(18, 5, '18', 'Surat Keputusan SDM ', ''),
(19, 5, '19', 'SK Dosen Tetap ', ''),
(20, 5, '20', 'SK Pegawai Tetap ', ''),
(21, 5, '21', 'SK PHK ', ''),
(22, 5, '22', 'SK Struktural ', ''),
(23, 5, '23', 'SK Penghargaan Masa Kerja ', ''),
(24, 5, '24', 'Peraturan ', ''),
(25, 5, '25', 'Perjanjian Tugas Belajar / Izin Belajar ', ''),
(26, 5, '26', 'Perjanjian Kerja Waktu Tertentu ', ''),
(27, 5, '27', 'Formulir', ''),
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
-- Table structure for table `t_notif`
--

CREATE TABLE `t_notif` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_sifat` int(11) NOT NULL,
  `opened` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_notif`
--

INSERT INTO `t_notif` (`id`, `id_surat`, `id_user`, `id_sifat`, `opened`) VALUES
(1, 1, 1, 7, '0'),
(2, 1, 1, 7, '0'),
(3, 1, 1, 8, '0'),
(4, 1, 1, 8, '0'),
(5, 1, 1, 8, '0'),
(6, 1, 1, 8, '0'),
(7, 1, 1, 8, '0'),
(8, 1, 1, 8, '0'),
(9, 1, 1, 8, '0'),
(10, 1, 1, 8, '0'),
(11, 1, 1, 8, '0'),
(12, 1, 1, 8, '0'),
(13, 1, 1, 8, '0'),
(14, 1, 1, 8, '0'),
(15, 1, 1, 8, '0'),
(16, 1, 1, 8, '0'),
(17, 1, 1, 8, '0'),
(18, 1, 1, 8, '0'),
(19, 1, 1, 8, '0'),
(20, 1, 1, 8, '0');

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
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_sifat`
--

INSERT INTO `t_sifat` (`id`, `id_upk`, `kode_sifat`, `sifat`, `keterangan`) VALUES
(7, 5, '01', 'Penting', ''),
(8, 5, '02', 'Mendesak', ''),
(9, 7, '01', 'SIfat', '');

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
  `no_surat` varchar(50) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `asal_surat` varchar(50) NOT NULL,
  `sifat_surat` int(11) NOT NULL,
  `jenis_surat` int(11) NOT NULL,
  `aksi_surat` int(11) NOT NULL,
  `dikirim` int(11) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `perihal` text NOT NULL,
  `catatan` text NOT NULL,
  `jenis_kirim` enum('1','0') NOT NULL COMMENT '1 = surat masuk\r\n0 = surat keluar',
  `id_upk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_surat`
--

INSERT INTO `t_surat` (`id`, `no_surat`, `tanggal_surat`, `asal_surat`, `sifat_surat`, `jenis_surat`, `aksi_surat`, `dikirim`, `lampiran`, `perihal`, `catatan`, `jenis_kirim`, `id_upk`) VALUES
(2, '1', '0000-00-00', '1', 1, 1, 1, 0, '', '1', '1', '1', 0),
(3, '1', '0000-00-00', '1', 1, 1, 1, 0, '', '1', '1', '1', 0),
(4, '', '0000-00-00', '', 0, 0, 0, 0, '', '1', '1', '1', 0),
(5, '', '0000-00-00', '', 0, 0, 0, 0, '', '1', '1', '1', 0),
(6, '', '0000-00-00', '', 0, 0, 0, 0, '', '1', '1', '1', 0),
(7, '', '0000-00-00', '', 0, 0, 0, 0, '', '1', '1', '1', 0),
(8, '', '0000-00-00', '', 0, 0, 0, 0, '', '1', '1', '1', 0),
(9, '', '0000-00-00', '', 0, 0, 0, 0, '', '1', '1', '1', 0),
(10, 'w', '0000-00-00', 'w', 0, 0, 0, 0, '', 'w', 'w', '1', 0);

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
  `kode_upk` varchar(50) NOT NULL,
  `upk` varchar(50) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_upk`
--

INSERT INTO `t_upk` (`id`, `kode_upk`, `upk`, `keterangan`) VALUES
(5, '05', 'Sekretariat Yayasan', ''),
(7, '01', 'Stikes BTH', ''),
(8, '02', 'LKSA Amanah ', ''),
(9, '03', 'BTH STUDENT HOUSE', ''),
(10, '04', 'KLINIK BTH', '');

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
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `id_satuan` int(11) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `level` enum('1','2','3') NOT NULL DEFAULT '2' COMMENT '1 untuk superadmin\r\n2 untuk adminupk\r\n3 untuk staff upk'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`, `id_upk`, `gelar_depan`, `nama_user`, `gelar_belakang`, `status`, `id_satuan`, `id_jabatan`, `level`) VALUES
(7, 'admin', '580097c0183509887837571145ccc3ad', 0, '', 'Admin', '', '1', 0, 0, '1'),
(47, 'klinik', '67ccb39f0ec81c363d058774c2a1598d', 10, '', 'KLINIK BTH', '', '1', NULL, NULL, '2'),
(48, 'bthstudenthouse', '67ccb39f0ec81c363d058774c2a1598d', 9, '', 'BTH Student House', '', '1', NULL, NULL, '2'),
(49, 'lksaamanah', '67ccb39f0ec81c363d058774c2a1598d', 8, '', 'LKSA Amanah', '', '1', NULL, NULL, '2'),
(50, 'stikesbth', '67ccb39f0ec81c363d058774c2a1598d', 7, '', 'STIKES BTH', '', '1', NULL, NULL, '2'),
(51, 'yayasan', '67ccb39f0ec81c363d058774c2a1598d', 5, '', 'Yayasan', '', '1', NULL, NULL, '2'),
(54, 'pandu', '67ccb39f0ec81c363d058774c2a1598d', 5, 'Hj', 'Agastya Pandu Satriya Utama', 'S.Kom, MM', '1', NULL, 12, '3'),
(55, 'yoris', '580097c0183509887837571145ccc3ad', 5, 'H.', 'Yoris Rusamsi Ruswadi', 'SH, MH', '0', NULL, 30, '3'),
(56, 'wahyu', '580097c0183509887837571145ccc3ad', 5, 'dr. H. ', 'Wahyu Purwaganda', 'M.Sc', '0', NULL, 30, '3'),
(57, 'sadeli', '580097c0183509887837571145ccc3ad', 5, 'dr. H. ', 'Sadeli Suganda', 'M.Kes.', '0', NULL, 31, '3'),
(58, 'mulyana', '580097c0183509887837571145ccc3ad', 5, 'Drs. H. ', 'Mulyana', 'MM., M.Kes', '0', NULL, 31, '3'),
(59, 'neni', '580097c0183509887837571145ccc3ad', 5, 'Hj. ', 'Neni Heryani', 'S.Sos.', '0', NULL, 31, '3'),
(60, 'tati', '580098c0183509887837571145ccc3ad', 5, 'Dra. Hj. ', 'Tati Dedah Nurdianah', 'M.Kes', '0', NULL, 32, '3'),
(61, 'yayah', '580098c0183509887837571145ccc3ad', 5, 'Dra. Hj. ', 'Yayah Syafariah', 'S.Kep., Ners. MM.', '0', NULL, 33, '3'),
(62, 'diana', '580098c0183509887837571145ccc3ad', 5, NULL, 'Diana Rahmadayanti', 'SE', '0', NULL, 34, '3'),
(63, 'aang', '580098c0183509887837571145ccc3ad', 5, NULL, 'Aang Anharto', NULL, '0', NULL, 35, '3'),
(64, 'asiyah', '580098c0183509887837571145ccc3ad', 5, NULL, 'Aisyah', NULL, '0', NULL, 35, '3'),
(65, 'asep', '580099c0183509887837571145ccc3ad', 5, NULL, 'Asep Supyan', 'S.Ked.', '0', NULL, 36, '3'),
(66, 'dede', '580099c0183509887837571145ccc3ad', 5, NULL, 'Dede Yuda Wahyu N', 'SH., MH', '0', NULL, 37, '3'),
(67, 'deden', '580099c0183509887837571145ccc3ad', 5, NULL, 'Deden Wahyu', NULL, '0', NULL, 38, '3'),
(68, 'furi', '580099c0183509887837571145ccc3ad', 5, NULL, 'Furi Furwani', 'A.Md', '0', NULL, 39, '3'),
(69, 'ina', '580099c0183509887837571145ccc3ad', 5, NULL, 'Ina Nuraeni', 'SE', '0', NULL, 40, '3'),
(70, 'intan', '580100c0183509887837571145ccc3ad', 5, NULL, 'Intan Melinda', 'SE.Ak., CA', '0', NULL, 41, '3'),
(71, 'irvan', '580100c0183509887837571145ccc3ad', 5, NULL, 'Irvan Maulana', 'SE', '0', NULL, 42, '3'),
(72, 'jeffry', '580100c0183509887837571145ccc3ad', 5, NULL, 'Jeffry Nugraha', 'ST., MM.', '0', NULL, 43, '3'),
(73, 'risna', '580100c0183509887837571145ccc3ad', 5, NULL, 'Risna Resita', 'S.ST', '0', NULL, 44, '3'),
(74, 'rohmat', '580100c0183509887837571145ccc3ad', 5, NULL, 'Rohmat Noer Fajril', NULL, '0', NULL, 39, '3'),
(75, 'taufik', '580101c0183509887837571145ccc3ad', 5, NULL, 'Taufik Hudaya', 'S.Sn.', '0', NULL, 45, '3'),
(76, 'vinna', '580101c0183509887837571145ccc3ad', 5, NULL, 'Vinna Noor Afifah', 'ST.', '0', NULL, 46, '3'),
(77, 'yogasara', '580101c0183509887837571145ccc3ad', 5, NULL, 'Yogasara', 'ST.', '0', NULL, 39, '3'),
(78, 'wawan', '580101c0183509887837571145ccc3ad', 5, 'Drs.', 'Wawan Kuswara', 'M.Si.', '0', NULL, 47, '3'),
(79, 'ahmad', '580100c0183509887837571145ccc3ad', 8, NULL, 'Ahmad Fathulloh', 'SH., M.Pd', '0', NULL, 48, '3'),
(80, 'dewi', '580100c0183509887837571145ccc3ad', 8, NULL, 'Dewi Patimah', 'S.Pd.', '0', NULL, 48, '3'),
(81, 'risnanh', '580100c0183509887837571145ccc3ad', 8, NULL, 'Risna Nasrul Haq', 'S.Tr.Bns', '0', NULL, 49, '3'),
(82, 'suryati', '580100c0183509887837571145ccc3ad', 8, NULL, 'Suryati', NULL, '0', NULL, 50, '3'),
(83, 'zaenal', '580100c0183509887837571145ccc3ad', 8, NULL, 'Zaenal Mutakin', 'S.Pd', '0', NULL, 51, '3'),
(84, 'AbdulLatif', '580097c0183509887837571145ccc3ad', 9, NULL, 'Abdul Latif', NULL, '0', NULL, 52, '3'),
(85, 'Budiyanto', '580097c0183509887837571145ccc3ad', 9, NULL, 'Budiyanto', 'A.Md', '0', NULL, 53, '3'),
(86, 'Dadah', '580097c0183509887837571145ccc3ad', 9, NULL, 'Dadah', NULL, '0', NULL, 52, '3'),
(87, 'HenHen', '580097c0183509887837571145ccc3ad', 9, NULL, 'Hen Hen', NULL, '0', NULL, 54, '3'),
(88, 'HendraRahmatullah', '580097c0183509887837571145ccc3ad', 9, NULL, 'Hendra Rahmatullah', NULL, '0', NULL, 54, '3'),
(89, 'SantiRobianti', '580097c0183509887837571145ccc3ad', 9, NULL, 'Santi Robianti', 'S.Pd', '0', NULL, 55, '3'),
(90, 'SelametRiyadi', '580097c0183509887837571145ccc3ad', 9, NULL, 'Selamet Riyadi', 'S.Pd', '0', NULL, 56, '3'),
(91, 'Suherlan', '580097c0183509887837571145ccc3ad', 9, NULL, 'Suherlan', NULL, '0', NULL, 52, '3'),
(92, 'Titan', '580097c0183509887837571145ccc3ad', 9, NULL, 'Titan', NULL, '0', NULL, 52, '3'),
(93, 'AbdulAzisRamdani', '580097c0183509887837571145ccc3ad', 10, NULL, 'Abdul Azis Ramdani', NULL, '0', NULL, 57, '3'),
(94, 'AriefHidayat', '580097c0183509887837571145ccc3ad', 10, NULL, 'Arief Hidayat', 'SE', '0', NULL, 58, '3'),
(95, 'DewiAndini', '580097c0183509887837571145ccc3ad', 10, NULL, 'Dewi Andini', 'A.Md.Keb', '0', NULL, 59, '3'),
(96, 'EmupMuplihah', '580097c0183509887837571145ccc3ad', 10, NULL, 'Emup Muplihah', 'AM.Kep', '0', NULL, 60, '3'),
(97, 'ErahSukaerah', '580097c0183509887837571145ccc3ad', 10, 'Hj.', 'Erah Sukaerah', NULL, '0', NULL, 59, '3'),
(98, 'GunawanNugraha', '580097c0183509887837571145ccc3ad', 10, NULL, 'Gunawan Nugraha', NULL, '0', NULL, 57, '3'),
(99, 'HendroKasmanto', '580097c0183509887837571145ccc3ad', 10, 'dr.', 'Hendro Kasmanto', 'M.KM', '0', NULL, 61, '3'),
(100, 'MochamadSigitAlinudin', '580097c0183509887837571145ccc3ad', 10, NULL, 'Mochamad Sigit Alinudin', NULL, '0', NULL, 62, '3'),
(101, 'ReniNuraeni', '580097c0183509887837571145ccc3ad', 10, NULL, 'Reni Nuraeni', 'S.Farm', '0', NULL, 62, '3'),
(102, 'SusiSusilawati', '580097c0183509887837571145ccc3ad', 10, NULL, 'Susi Susilawati', 'A.Md.AK', '0', NULL, 63, '3'),
(103, 'ZeaAhmadZakaria', '580097c0183509887837571145ccc3ad', 10, NULL, 'Zea Ahmad Zakaria', 'SH', '0', NULL, 64, '3'),
(354, 'AdeHerlan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ade Herlan', NULL, '0', NULL, 65, '3'),
(355, 'AdeKusmana', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ade Kusmana', 'S.Sos', '0', NULL, 66, '3'),
(356, 'AdeYeniAprillia', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ade Yeni Aprillia', 'S.Farm., M.Si', '0', NULL, 67, '3'),
(357, 'AiMeriYulianti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ai Meri Yulianti', 'A.Md.RO', '0', NULL, 68, '3'),
(358, 'AiNuraini', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ai Nuraini', 'A.Md.AK', '0', NULL, 69, '3'),
(359, 'AjengRahmiPratiwi', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ajeng Rahmi Pratiwi', 'A.Md.AK', '0', NULL, 69, '3'),
(360, 'AnasMukodas', '580097c0183509887837571145ccc3ad', 7, NULL, 'Anas Mukodas', NULL, '0', NULL, 70, '3'),
(361, 'AnihKurnia', '580097c0183509887837571145ccc3ad', 7, NULL, 'Anih Kurnia', 'S.Kep., Ners., M.Kep.', '0', NULL, 71, '3'),
(362, 'AninditaTriKusumaPratita', '580097c0183509887837571145ccc3ad', 7, NULL, 'Anindita Tri Kusuma Pratita', 'ST., M.Si.', '0', NULL, 67, '3'),
(363, 'AnisaPebiansyah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Anisa Pebiansyah', 'M.Farm., Apt', '0', NULL, 67, '3'),
(364, 'AnnaShintaPurwanti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Anna Shinta Purwanti', 'S.Farm', '0', NULL, 72, '3'),
(365, 'AnnaYuliana', '580097c0183509887837571145ccc3ad', 7, 'Dr. Hj.', 'Anna Yuliana', 'S.KM.,M.Si', '0', NULL, 73, '3'),
(366, 'AnnisaNurHasanah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Annisa Nur Hasanah', 'S.Tr.Kes', '0', NULL, 74, '3'),
(367, 'AsepRobby', '580097c0183509887837571145ccc3ad', 7, NULL, 'Asep Robby', 'S.Kep.,M.Kep', '0', NULL, 71, '3'),
(368, 'BeniSupriyadi', '580097c0183509887837571145ccc3ad', 7, NULL, 'Beni Supriyadi', NULL, '0', NULL, 75, '3'),
(369, 'ChitaWidia', '580097c0183509887837571145ccc3ad', 7, NULL, 'Chita Widia', 'S.Pd., S.Kep.MKM', '0', NULL, 76, '3'),
(370, 'CucuNurpatonah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Cucu Nurpatonah', 'A.Md.,RO', '0', NULL, 77, '3'),
(371, 'CucupSupriadi', '580097c0183509887837571145ccc3ad', 7, NULL, 'Cucup Supriadi', NULL, '0', NULL, 79, '3'),
(372, 'DandiOkaSubantara', '580097c0183509887837571145ccc3ad', 7, NULL, 'Dandi Oka Subantara', 'S.Kep., Ners.', '0', NULL, 78, '3'),
(373, 'DedeRohmah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Dede Rohmah', NULL, '0', NULL, 65, '3'),
(374, 'DefriRisviana', '580097c0183509887837571145ccc3ad', 7, NULL, 'Defri Risviana', 'S.Farm', '0', NULL, 72, '3'),
(375, 'DeniKurniawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Deni Kurniawan', 'S.Kom', '0', NULL, 80, '3'),
(376, 'DeriIrawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Deri Irawan', NULL, '0', NULL, 81, '3'),
(377, 'DewiPetiVirgianti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Dewi Peti Virgianti', 'M.Si. ', '0', NULL, 82, '3'),
(378, 'DianaSriZustika', '580097c0183509887837571145ccc3ad', 7, NULL, 'Diana Sri Zustika', 'S.Pd.,M.Si', '0', NULL, 83, '3'),
(379, 'DichyNuryadinZain', '580097c0183509887837571145ccc3ad', 7, NULL, 'Dichy Nuryadin Zain', 'M.Farm., Apt', '0', NULL, 67, '3'),
(380, 'DinaFerdiani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Dina Ferdiani', 'S.Tr.Kes', '0', NULL, 74, '3'),
(381, 'DittaAtsnaNuriyaSalsabila', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ditta Atsna Nuriya Salsabila', 'A.Md.', '0', NULL, 72, '3'),
(382, 'EdiPrayitno', '580097c0183509887837571145ccc3ad', 7, NULL, 'Edi Prayitno', 'A.Md', '0', NULL, 84, '3'),
(383, 'EliKurniasih', '580097c0183509887837571145ccc3ad', 7, NULL, 'Eli Kurniasih', 'S.Pd., S.Kep, Ns.,M.KM', '0', NULL, 71, '3'),
(384, 'ElinMarlina', '580097c0183509887837571145ccc3ad', 7, NULL, 'Elin Marlina', NULL, '0', NULL, 85, '3'),
(385, 'Emi', '580097c0183509887837571145ccc3ad', 7, NULL, 'Emi', 'S.I.Kom', '0', NULL, 86, '3'),
(386, 'EncengSupardi', '580097c0183509887837571145ccc3ad', 7, NULL, 'Enceng Supardi', NULL, '0', NULL, 79, '3'),
(387, 'EnokNurliawati', '580097c0183509887837571145ccc3ad', 7, 'Hj.', 'Enok Nurliawati', 'S.Kp.,M.Kep', '0', NULL, 87, '3'),
(388, 'EpulSaepulMikdar', '580097c0183509887837571145ccc3ad', 7, NULL, 'Epul Saepul Mikdar', NULL, '0', NULL, 79, '3'),
(389, 'ErisRosidah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Eris Rosidah', NULL, '0', NULL, 88, '3'),
(390, 'EttyKomariahSambas', '580097c0183509887837571145ccc3ad', 7, NULL, 'Etty Komariah Sambas', 'S.Kp.,M.Kep', '0', NULL, 89, '3'),
(391, 'EviIrmayanti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Evi Irmayanti', 'M.KM', '0', NULL, 90, '3'),
(392, 'FajarSetiawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Fajar Setiawan', 'S.Farm., M.Farm.', '0', NULL, 67, '3'),
(393, 'FirmanGustaman', '580097c0183509887837571145ccc3ad', 7, NULL, 'Firman Gustaman', 'S.Farm., M.Farm.', '0', NULL, 91, '3'),
(394, 'GatutAriWardani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Gatut Ari Wardani', 'S.Pd., M.Sc.', '0', NULL, 67, '3'),
(395, 'GittaPuspitasari', '580097c0183509887837571145ccc3ad', 7, NULL, 'Gitta Puspitasari', 'S.Kom', '0', NULL, 92, '3'),
(396, 'HannaNurulHusna', '580097c0183509887837571145ccc3ad', 7, NULL, 'Hanna Nurul Husna', 'M.Pd', '0', NULL, 93, '3'),
(397, 'HendySuhendy', '580097c0183509887837571145ccc3ad', 7, NULL, 'Hendy Suhendy', 'M.Si', '0', NULL, 94, '3'),
(398, 'HestyNitaHasanah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Hesty Nita Hasanah ', 'A.Md.AK', '0', NULL, 69, '3'),
(399, 'HilmiNurhidayat', '580097c0183509887837571145ccc3ad', 7, NULL, 'Hilmi Nurhidayat', 'S.Farm.,Apt', '0', NULL, 95, '3'),
(400, 'IiSunSunarli', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ii Sun Sunarli', NULL, '0', NULL, 75, '3'),
(401, 'IisRahmawati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Iis Rahmawati', 'A.Md.RO', '0', NULL, 77, '3'),
(402, 'IisSitiAisyah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Iis Siti Aisyah', NULL, '0', NULL, 96, '3'),
(403, 'IlhamAlifiar', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ilham Alifiar ', 'S.Farm.,Apt.,M.Sc', '0', NULL, 97, '3'),
(404, 'Indra', '580097c0183509887837571145ccc3ad', 7, NULL, 'Indra', 'M.Si', '0', NULL, 98, '3'),
(405, 'IntanRatnaPuri', '580097c0183509887837571145ccc3ad', 7, NULL, 'Intan Ratna Puri', 'S.Pd', '0', NULL, 99, '3'),
(406, 'IraRahmiyani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ira Rahmiyani ', 'M.Si, Apt.', '0', NULL, 100, '3'),
(407, 'ItaRostianiHR', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ita Rostiani HR', NULL, '0', NULL, 101, '3'),
(408, 'ItmamMilataka', '580097c0183509887837571145ccc3ad', 7, NULL, 'Itmam Milataka', 'A.Md.RO', '0', NULL, 68, '3'),
(409, 'JenalAripin', '580097c0183509887837571145ccc3ad', 7, NULL, 'Jenal Aripin', NULL, '0', NULL, 75, '3'),
(410, 'KeniIdacahyati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Keni Idacahyati', 'M.Farm., Apt', '0', NULL, 102, '3'),
(411, 'Khusnul', '580097c0183509887837571145ccc3ad', 7, NULL, 'Khusnul', 'M.Si', '0', NULL, 103, '3'),
(412, 'KorryNovitriani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Korry Novitriani', 'S.Si., M.Si', '0', NULL, 82, '3'),
(413, 'LenaSitiNurjanah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Lena Siti Nurjanah', 'S.Farm', '0', NULL, 72, '3'),
(414, 'LeniMayasari', '580097c0183509887837571145ccc3ad', 7, NULL, 'Leni Mayasari', 'S.IP', '0', NULL, 104, '3'),
(415, 'LilisTuslinah', '580097c0183509887837571145ccc3ad', 7, 'Dra. Hj.', 'Lilis Tuslinah', 'Apt.,M.Si', '0', NULL, 67, '3'),
(416, 'LisnaNurotunnisa', '580097c0183509887837571145ccc3ad', 7, NULL, 'Lisna Nurotunnisa', 'A.Md.AK', '0', NULL, 69, '3'),
(417, 'LusiNurdianti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Lusi Nurdianti', 'M.Si.,Apt', '0', NULL, 67, '3'),
(418, 'MuhammadAriefHidayatulFurqon', '580097c0183509887837571145ccc3ad', 7, NULL, 'Muhammad Arief Hidayatul Furqon', NULL, '0', NULL, 88, '3'),
(419, 'MamatRuhimat', '580097c0183509887837571145ccc3ad', 7, NULL, 'Mamat Ruhimat', NULL, '0', NULL, 105, '3'),
(420, 'MasrulHayat', '580097c0183509887837571145ccc3ad', 7, NULL, 'Masrul Hayat', NULL, '0', NULL, 79, '3'),
(421, 'Meri', '580097c0183509887837571145ccc3ad', 7, NULL, 'Meri', 'S.KM., M.Imun', '0', NULL, 82, '3'),
(422, 'MetiKusmiati', '580097c0183509887837571145ccc3ad', 7, 'Hj.', 'Meti Kusmiati', 'M.Si', '0', NULL, 106, '3'),
(423, 'MochamadFathurohman', '580097c0183509887837571145ccc3ad', 7, NULL, 'Mochamad Fathurohman', 'ST., M.Si', '0', NULL, 67, '3'),
(424, 'MuhammadRidwan', '580097c0183509887837571145ccc3ad', 7, 'H.', 'Muhammad Ridwan', 'Lc., M.Pd.I', '0', NULL, 71, '3'),
(425, 'MuhammadRaisMunix', '580097c0183509887837571145ccc3ad', 7, NULL, 'Muhammad Rais Munix', 'A.Md.A.B', '0', NULL, 107, '3'),
(426, 'MuharamPriatna', '580097c0183509887837571145ccc3ad', 7, 'Drs. H. E.', 'Muharam Priatna', 'Apt, M.Si.', '0', NULL, 67, '3'),
(427, 'NandangKamaludin', '580097c0183509887837571145ccc3ad', 7, NULL, 'Nandang Kamaludin', NULL, '0', NULL, 88, '3'),
(428, 'NellyHidayat', '580097c0183509887837571145ccc3ad', 7, NULL, 'Nelly Hidayat', NULL, '0', NULL, 88, '3'),
(429, 'NurLailiDwiHidayati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Nur Laili Dwi Hidayati', 'M.Si', '0', NULL, 108, '3'),
(430, 'NurRahayuningsih', '580097c0183509887837571145ccc3ad', 7, 'Hj.', 'Nur Rahayuningsih', 'M.Si, Apt.', '0', NULL, 109, '3'),
(431, 'Nurdin', '580097c0183509887837571145ccc3ad', 7, NULL, 'Nurdin', NULL, '0', NULL, 88, '3'),
(432, 'NurulZakiatulJannahFitriani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Nurul Zakiatul Jannah Fitriani', 'A.Md.RO', '0', NULL, 68, '3'),
(433, 'OhanBurhan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ohan Burhan', NULL, '0', NULL, 105, '3'),
(434, 'PanjiGamantara', '580097c0183509887837571145ccc3ad', 7, NULL, 'Panji Gamantara', 'SE', '0', NULL, 96, '3'),
(435, 'Prasetyo', '580097c0183509887837571145ccc3ad', 7, NULL, 'Prasetyo', 'S.Kom', '0', NULL, 99, '3'),
(436, 'RatnaKomala', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ratna Komala', NULL, '0', NULL, 88, '3'),
(437, 'RiantiNurpalah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Rianti Nurpalah', 'S.KM.,M.Si', '0', NULL, 110, '3'),
(438, 'RizkyRamdhani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Rizky Ramdhani', 'S.Farm., Apt', '0', NULL, 72, '3'),
(439, 'RochmanahSuhartati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Rochmanah Suhartati', 'S.Pd.M.Si', '0', NULL, 111, '3'),
(440, 'Rohyati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Rohyati', NULL, '0', NULL, 88, '3'),
(441, 'RosmayaDewi', '580097c0183509887837571145ccc3ad', 7, NULL, 'Rosmaya Dewi', 'S.Pd., M.Si.', '0', NULL, 112, '3'),
(442, 'RudiSetiawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Rudi Setiawan', NULL, '0', NULL, 88, '3'),
(443, 'RudyHidana', '580097c0183509887837571145ccc3ad', 7, 'Dr.', 'Rudy Hidana', 'M.Pd', '0', NULL, 113, '3'),
(444, 'Ruswanto', '580097c0183509887837571145ccc3ad', 7, 'Dr.', 'Ruswanto', 'M.Si', '0', NULL, 76, '3'),
(445, 'SaefulAmin', '580097c0183509887837571145ccc3ad', 7, 'Dr.', 'Saeful Amin', 'Apt.,M.Si', '0', NULL, 114, '3'),
(446, 'SherinTheresinaZaitun', '580097c0183509887837571145ccc3ad', 7, NULL, 'Sherin Theresina Zaitun', 'S.Pd', '0', NULL, 86, '3'),
(447, 'SindiAji', '580097c0183509887837571145ccc3ad', 7, NULL, 'Sindi Aji', NULL, '0', NULL, 88, '3'),
(448, 'SitiDamayanti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Siti Damayanti', 'S.IP', '0', NULL, 115, '3'),
(449, 'SitiEfiShaefiyyah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Siti Efi Shaefiyyah', 'S.IP', '0', NULL, 116, '3'),
(450, 'SoniHersoni', '580097c0183509887837571145ccc3ad', 7, NULL, 'Soni Hersoni', 'S. Sos., Ners., M.Kep.', '0', NULL, 117, '3'),
(451, 'Susanto', '580097c0183509887837571145ccc3ad', 7, NULL, 'Susanto', NULL, '0', NULL, 75, '3'),
(452, 'SyifaNursiswanti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Syifa Nursiswanti', 'A.Md.RO', '0', NULL, 77, '3'),
(453, 'TanendriArrizqiyani', '580097c0183509887837571145ccc3ad', 7, NULL, 'Tanendri Arrizqiyani', 'M.Si', '0', NULL, 118, '3'),
(454, 'TaufikHidayat', '580097c0183509887837571145ccc3ad', 7, NULL, 'Taufik Hidayat', 'M.S.Farm.,Apt', '0', NULL, 67, '3'),
(455, 'Tenten', '580097c0183509887837571145ccc3ad', 7, NULL, 'Tenten', NULL, '0', NULL, 105, '3'),
(456, 'TetiAgustin', '580097c0183509887837571145ccc3ad', 7, NULL, 'Teti Agustin', 'S.Kp., M.Kep', '0', NULL, 119, '3'),
(457, 'TitaNofianti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Tita Nofianti', 'M.Si.,Apt', '0', NULL, 67, '3'),
(458, 'TresnaLestari', '580097c0183509887837571145ccc3ad', 7, NULL, 'Tresna Lestari', 'S.Si.,Apt.,M.Si', '0', NULL, 67, '3'),
(459, 'TriUtami', '580097c0183509887837571145ccc3ad', 7, NULL, 'Tri Utami', 'A.Md.', '0', NULL, 107, '3'),
(460, 'UjangEnas', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ujang Enas', 'S. Sos., M.Si', '0', NULL, 120, '3'),
(461, 'Uju', '580097c0183509887837571145ccc3ad', 7, NULL, 'Uju', NULL, '0', NULL, 81, '3'),
(462, 'UlfahHidayah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Ulfah Hidayah', 'ST', '0', NULL, 116, '3'),
(463, 'UmmyMardiana', '580097c0183509887837571145ccc3ad', 7, 'Dr.', 'Ummy Mardiana', 'M.Si', '0', NULL, 82, '3'),
(464, 'VeraNurviana', '580097c0183509887837571145ccc3ad', 7, NULL, 'Vera Nurviana', 'M.Farm', '0', NULL, 67, '3'),
(465, 'VianiSukmaNurAini', '580097c0183509887837571145ccc3ad', 7, NULL, 'Viani Sukma Nur\'aini', 'S.Farm', '0', NULL, 95, '3'),
(466, 'Wahidin', '580097c0183509887837571145ccc3ad', 7, NULL, 'Wahidin', NULL, '0', NULL, 121, '3'),
(467, 'WawanKurniawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Wawan Kurniawan', 'A.Md', '0', NULL, 123, '3'),
(468, 'WawanRismawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Wawan Rismawan', 'S.Kep.,M.Sc', '0', NULL, 71, '3'),
(469, 'Widaningsih', '580097c0183509887837571145ccc3ad', 7, NULL, 'Widaningsih', NULL, '0', NULL, 123, '3'),
(470, 'WindaTrisnaWulandari', '580097c0183509887837571145ccc3ad', 7, NULL, 'Winda Trisna Wulandari', 'S.Pd., M.Si', '0', NULL, 124, '3'),
(471, 'YaneLiswanti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yane Liswanti', 'M.KM.', '0', NULL, 122, '3'),
(472, 'YatiNurhayati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yati Nurhayati', NULL, '0', NULL, 88, '3'),
(473, 'YedyPurwandiSukmawan', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yedy Purwandi Sukmawan ', 'M.Si.,Apt', '0', NULL, 91, '3'),
(474, 'YeliYulianti', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yeli Yulianti', 'S.Kep', '0', NULL, 78, '3'),
(475, 'Yuliawati', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yuliawati', NULL, '0', NULL, 88, '3'),
(476, 'YusufFirmansyahNurjamil', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yusuf Firmansyah Nurjamil', NULL, '0', NULL, 101, '3'),
(477, 'YusupMulyana', '580097c0183509887837571145ccc3ad', 7, NULL, 'Yusup Mulyana', 'A.Md., Ak.', '0', NULL, 69, '3'),
(478, 'ZakiTanshah', '580097c0183509887837571145ccc3ad', 7, NULL, 'Zaki Tanshah', 'S.Kom', '0', NULL, 105, '3');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_aksi`
--
ALTER TABLE `t_aksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_config`
--
ALTER TABLE `t_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_disposisi`
--
ALTER TABLE `t_disposisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `t_jenis`
--
ALTER TABLE `t_jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `t_notif`
--
ALTER TABLE `t_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_satuan`
--
ALTER TABLE `t_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_sifat`
--
ALTER TABLE `t_sifat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_tujuan`
--
ALTER TABLE `t_tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_upk`
--
ALTER TABLE `t_upk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=479;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
