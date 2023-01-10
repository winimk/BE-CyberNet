-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 10, 2023 at 02:13 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be_cybernet`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `id_user` int(20) NOT NULL COMMENT 'id usernya admin (role 1)',
  `nama_paket` text NOT NULL,
  `kecepatan` int(11) NOT NULL,
  `harga` double NOT NULL COMMENT 'harga satuan paket',
  `disc` int(3) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL COMMENT '1=publish,2=draft',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `id_user`, `nama_paket`, `kecepatan`, `harga`, `disc`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Paket DEF', 25, 230000, 8, 1, '2023-01-08 12:36:15', '2023-01-08 06:00:48'),
(2, 1, 'Paket Tahun Baru', 30, 350000, 10, 1, '2023-01-08 05:53:16', '2023-01-08 05:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 2, 'auth_token', '314bcdf6bfee003f05c1d559120e965c101affe4ae24fc9985637ca8f6f4cbff', '[\"*\"]', NULL, '2023-01-07 18:14:25', '2023-01-07 18:14:25'),
(3, 'App\\Models\\User', 3, 'auth_token', '87b0076e3c7092bf517c1fe1f39f55b45a052f2875804d696c1414a9878ab2d2', '[\"*\"]', NULL, '2023-01-07 18:16:07', '2023-01-07 18:16:07'),
(7, 'App\\Models\\User', 1, 'auth_token', '65664c9ede998c0e01c2e6eea5645a6951f76dfa6f09d491fe6b3eb66b4714be', '[\"*\"]', '2023-01-10 01:40:40', '2023-01-09 18:36:22', '2023-01-10 01:40:40'),
(8, 'App\\Models\\User', 1, 'auth_token', 'f8b1a2d7ef592cf2dcf084c22b9e596834c68981a5723aef308f27a315643d70', '[\"*\"]', '2023-01-10 02:13:05', '2023-01-10 01:49:01', '2023-01-10 02:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'id usernya customer (role 2)',
  `nama_user` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL COMMENT 'histori email',
  `alamat` text NOT NULL COMMENT 'histori alamat',
  `no_tlp` varchar(20) NOT NULL DEFAULT '0' COMMENT 'histori no tlp',
  `tgl_transaksi` datetime NOT NULL,
  `nama_paket` text NOT NULL COMMENT 'histrori nama paket',
  `kecepatan` int(11) NOT NULL COMMENT 'histori kecepatan',
  `harga` double NOT NULL COMMENT 'histori harga satuan paket',
  `disc` int(3) NOT NULL COMMENT 'histori diskon paket',
  `lama` int(11) NOT NULL COMMENT 'langganan berapa bulan',
  `total` double NOT NULL COMMENT 'histori total nominal pembelian',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_paket`, `id_user`, `nama_user`, `email`, `alamat`, `no_tlp`, `tgl_transaksi`, `nama_paket`, `kecepatan`, `harga`, `disc`, `lama`, `total`, `created_at`, `updated_at`) VALUES
(2, 1, 3, 'Muthia', 'muthia@gmail.com', '', '0', '2023-01-09 09:21:28', 'Paket DEF', 25, 230000, 8, 3, 524400, '2023-01-09 09:21:28', '2023-01-09 09:21:28'),
(3, 1, 3, 'Muthia', 'muthia@gmail.com', '', '0', '2023-01-09 09:22:10', 'Paket DEF', 25, 230000, 8, 3, 524400, '2023-01-09 09:22:10', '2023-01-09 09:22:10'),
(4, 1, 3, 'Muthia', 'muthia@gmail.com', '', '0', '2023-01-09 16:24:47', 'Paket DEF', 25, 230000, 8, 3, 524400, '2023-01-09 09:24:47', '2023-01-09 09:24:47'),
(5, 1, 3, 'Muthia', 'muthia@gmail.com', '', '0', '2023-01-10 08:31:06', 'Paket DEF', 25, 230000, 8, 3, 524400, '2023-01-10 01:31:06', '2023-01-10 01:31:06'),
(6, 1, 3, 'Muthia', 'muthia@gmail.com', '', '0', '2023-01-10 08:31:25', 'Paket DEF', 25, 230000, 8, 3, 524400, '2023-01-10 01:31:25', '2023-01-10 08:52:47'),
(7, 1, 3, 'Muthia', 'muthia@gmail.com', '', '0', '2023-01-10 08:40:40', 'Paket DEF', 25, 230000, 8, 3, 524400, '2023-01-10 08:40:40', '2023-01-10 08:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(1) NOT NULL DEFAULT '2' COMMENT '1=admin,2=customer',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `alamat`, `no_tlp`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Wini MK', 'wini@gmail.com', 1, '', '0', NULL, '$2y$10$UFLjtPnHoft2akynMiSe8O794yYXWePkxkGVD85MTjg9ueByI6.6.', NULL, '2023-01-07 18:12:48', '2023-01-07 18:12:48'),
(3, 'Muthia', 'muthia@gmail.com', 2, '', '0', NULL, '$2y$10$z6bRcZJ7DO.55lG7jfuFau2a7Owosa.Ede30Omrl1Dxh0VaUgndoO', NULL, '2023-01-07 18:16:07', '2023-01-07 18:16:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
