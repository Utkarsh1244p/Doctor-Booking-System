-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 05:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` char(36) NOT NULL,
  `patient_id` char(36) NOT NULL,
  `doctor_id` char(36) NOT NULL,
  `appointment_date` timestamp NULL DEFAULT NULL,
  `status` enum('appointed','pending','cancelled','expired','rejected') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `appointment_updated_by` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `appointment_date`, `status`, `created_at`, `updated_at`, `deleted_at`, `appointment_updated_by`) VALUES
('0b8e74e0-0fab-4b94-aded-0a45d6a4d413', '4889057f-24dc-4b34-91fc-7d35fdae5baa', 'f2865395-5263-42a7-8315-71d49db29a18', '2024-10-02 15:50:00', 'pending', '2024-09-27 05:03:56', '2024-09-27 14:58:54', NULL, '4889057f-24dc-4b34-91fc-7d35fdae5baa'),
('19dd395b-1b83-4b14-b184-d6a5fd2ffc69', '5a50667c-be0b-4b51-9783-926739a7f701', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:22:31', 'appointed', '2024-09-26 16:04:56', '2024-09-26 16:04:56', NULL, NULL),
('1c75f411-b5e7-4e0b-b597-5b3bab3d9e13', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 08:30:00', 'appointed', '2024-09-26 07:27:23', '2024-09-26 07:27:23', NULL, NULL),
('1f7e3ede-ef8a-4e53-bf0f-88bea798d8a7', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 15:55:00', 'pending', '2024-09-26 15:47:28', '2024-09-26 15:47:28', NULL, NULL),
('294622a5-4af3-440d-b07f-47d20961e7f9', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 15:50:00', 'appointed', '2024-09-26 14:36:37', '2024-09-26 14:36:37', NULL, NULL),
('2a4ddf70-24af-4bcd-b567-fb1a75baf9ac', '5a50667c-be0b-4b51-9783-926739a7f701', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-28 15:50:00', 'pending', '2024-09-26 16:16:49', '2024-09-27 14:31:24', NULL, '6c4680ed-90b8-4e34-9e79-d1c88c68225b'),
('4143ae44-fe5e-4e81-b37b-06c4afdb6bcd', '5a50667c-be0b-4b51-9783-926739a7f701', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:09:20', 'appointed', '2024-09-26 16:08:41', '2024-09-26 16:08:41', NULL, NULL),
('42f9f3ff-6a5d-4b13-b108-b2534a633897', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 12:30:00', 'appointed', '2024-09-26 07:27:08', '2024-09-26 07:27:08', NULL, NULL),
('4672da1e-4484-4cfb-9896-936f8d707c74', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:21:32', 'appointed', '2024-09-26 16:18:34', '2024-09-26 16:18:34', NULL, NULL),
('4f787de3-042e-4468-9acf-32b4f01fc7e1', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2025-10-30 15:50:00', 'pending', '2024-09-26 16:24:04', '2024-09-27 14:51:49', NULL, '4889057f-24dc-4b34-91fc-7d35fdae5baa'),
('5095cf1e-14cc-440f-a9c4-16b0edd7ed85', '5a50667c-be0b-4b51-9783-926739a7f701', 'fcf40eae-07a4-4e53-b16b-8b1a471e2b1a', '2024-10-30 15:50:00', 'pending', '2024-09-27 12:16:08', '2024-09-27 14:52:35', NULL, '5a50667c-be0b-4b51-9783-926739a7f701'),
('57e6bec2-ef3c-40a8-81c3-030c34e2ef5e', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:20:23', 'appointed', '2024-09-26 15:56:09', '2024-09-26 15:56:09', NULL, NULL),
('6f81ad99-086d-424b-9b12-d2ec5ac762e9', '5a50667c-be0b-4b51-9783-926739a7f701', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2025-10-30 15:50:00', 'pending', '2024-09-26 16:09:33', '2024-09-27 14:50:47', NULL, '5a50667c-be0b-4b51-9783-926739a7f701'),
('76a05e78-874f-4d87-adff-63fd88a362dc', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 15:30:00', 'appointed', '2024-09-26 14:16:07', '2024-09-26 14:16:07', NULL, NULL),
('847d0ec6-db3d-4c5c-a63e-29f5405a57ab', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-27 15:50:00', 'pending', '2024-09-26 15:57:25', '2024-09-27 14:03:41', NULL, '6c4680ed-90b8-4e34-9e79-d1c88c68225b'),
('8ba1cc0a-9c28-4452-8fd2-8661c4e6194b', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 15:56:49', 'appointed', '2024-09-26 15:56:32', '2024-09-26 15:56:32', NULL, NULL),
('9299079e-05ba-40e1-9be4-645aebd0741f', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-27 06:31:30', 'appointed', '2024-09-26 07:24:51', '2024-09-26 07:24:51', NULL, NULL),
('982609bd-6c07-4cb6-b79c-da3aad82c7b5', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 10:30:00', 'appointed', '2024-09-26 07:28:14', '2024-09-26 07:28:14', NULL, NULL),
('987a7661-d0eb-4d96-af2d-4dc93181dbe1', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:02:14', 'appointed', '2024-09-26 15:57:28', '2024-09-26 15:57:28', NULL, NULL),
('9fa7c1d7-53ae-45c0-ba5d-8b31c0c8cfd9', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:19:15', 'appointed', '2024-09-26 16:18:40', '2024-09-26 16:18:40', NULL, NULL),
('a0e71bf8-254c-4aa8-bfd2-ec8f48d7a52b', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-29 15:50:00', 'pending', '2024-09-26 15:56:54', '2024-09-27 13:30:22', NULL, '4889057f-24dc-4b34-91fc-7d35fdae5baa'),
('ad8e4328-5fc4-4b1e-b0bd-a6df0a7507e2', '4889057f-24dc-4b34-91fc-7d35fdae5baa', 'f2865395-5263-42a7-8315-71d49db29a18', '2024-10-22 15:50:00', 'pending', '2024-09-26 16:23:44', '2024-09-27 15:12:31', NULL, 'f2865395-5263-42a7-8315-71d49db29a18'),
('b3bd4073-7c74-4db1-ac07-864bd6f77ddc', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 15:56:28', 'appointed', '2024-09-26 15:56:05', '2024-09-26 15:56:05', NULL, NULL),
('b9176da3-3339-4a33-9777-d13d8f6508fd', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-27 15:50:00', 'rejected', '2024-09-26 16:05:18', '2024-09-27 14:24:38', NULL, '4889057f-24dc-4b34-91fc-7d35fdae5baa'),
('bf88761c-c6b3-4069-a4b7-e8a0a0abd7ce', '5a50667c-be0b-4b51-9783-926739a7f701', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:09:27', 'appointed', '2024-09-26 16:08:39', '2024-09-26 16:08:39', NULL, NULL),
('c0b839f4-a42c-471b-bf2a-7683b1627f7e', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 14:40:14', 'appointed', '2024-09-26 14:39:37', '2024-09-26 14:39:37', NULL, NULL),
('d1bb1ac3-572b-4347-86eb-478e10a7b562', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:19:46', 'appointed', '2024-09-26 16:19:20', '2024-09-26 16:19:20', NULL, NULL),
('d2106658-1d57-479a-9fba-1268131e10ca', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 14:45:24', 'appointed', '2024-09-26 14:39:48', '2024-09-26 14:39:48', NULL, NULL),
('f680ea80-a8e5-4ea9-bddb-1b65963ba34e', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-26 16:08:11', 'appointed', '2024-09-26 16:05:20', '2024-09-26 16:05:20', NULL, NULL),
('fca359b2-d1bf-434b-920b-aa90da8cacdd', '4889057f-24dc-4b34-91fc-7d35fdae5baa', '6c4680ed-90b8-4e34-9e79-d1c88c68225b', '2024-09-27 06:31:30', 'appointed', '2024-09-26 07:19:13', '2024-09-26 07:19:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_state_city`
--

CREATE TABLE `country_state_city` (
  `id` char(36) NOT NULL,
  `country_id` char(36) NOT NULL,
  `state_id` char(36) NOT NULL,
  `city_id` char(36) NOT NULL,
  `status` enum('active','nonactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_26_095136_countries', 2),
(5, '2024_09_26_095147_states', 3),
(6, '2024_09_26_095142_cities', 4),
(7, '2024_09_26_095206_country_state_city', 5),
(9, '2024_09_26_095714_roles', 6),
(10, '0001_01_01_000000_create_users_table', 7),
(11, '2024_09_26_095222_appointments', 8),
(12, '2024_09_26_095127_doctors', 9),
(13, '2024_09_26_111122_create_personal_access_tokens_table', 9),
(16, '2024_09_27_151827_test', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `role_name` enum('patient','doctor') NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('uVG9JqJN3TPD7gU8J3gXq2JRz9SqMpK1nFistz7b', NULL, '127.0.0.1', 'PostmanRuntime/7.41.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnI0ZDhUVzlnc3cwNDVsbTEzQXJCcDZ1WHlGN2hJelBSc1dxS05TNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1727356473);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` char(36) NOT NULL,
  `country_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `country_state_city_id` char(36) NOT NULL,
  `contact` varchar(225) NOT NULL,
  `role_id` char(36) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address1`, `address2`, `country_state_city_id`, `contact`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('3f728c73-de3a-4f42-bc9d-efab43c88133', 'Vinayak Kambale', 'vinayakkamblae@gmail.com', '$2y$12$3jQG3RfTAeJtmN37V81AVOlJeuefI4s3dpGMjE5u0yzQnNxGnW9g.', 'palavaa', 'casa rio0', '2', '9899898988', '2', 'active', NULL, '2024-09-27 11:55:34', '2024-09-27 11:58:26', NULL),
('4889057f-24dc-4b34-91fc-7d35fdae5baa', 'Utkarsh', 'utkarsh@gmail.com', '$2y$12$yJHs5Xi/tT7eOA4LhgjSDuA2hZrDeFzkvxFVWP0H1QCQhNAY7nyWq', 'palava', 'casa rio', '1', '9899898989', '1', 'active', NULL, '2024-09-26 06:31:30', '2024-09-26 06:31:30', NULL),
('5a50667c-be0b-4b51-9783-926739a7f701', 'Sonu', 'sonu@gmail.com', '$2y$12$zO1bA9jN7y6FNLBPfCNJZenFqgG2JF8uJ38UHCHDpw1MdJXbCpaB6', 'palava', 'casa rio', '1', '9899898989', '1', 'active', NULL, '2024-09-26 06:31:05', '2024-09-26 06:31:05', NULL),
('6c4680ed-90b8-4e34-9e79-d1c88c68225b', 'Dr Himanshu', 'himanshu@gmail.com', '$2y$12$Ze51OZOvTxxsv.6blByDzuiWK/zvU8NQk3uahAC78swo.0Lpay1PK', 'palava', 'casa rio', '1', '9899898989', '2', 'active', NULL, '2024-09-26 06:32:37', '2024-09-26 06:32:37', NULL),
('8476159e-460f-4722-88a3-ed5224089e2b', 'Sonam', 'sonam@gmail.com', '$2y$12$4CHNNwU1zyOws.dv99zQKeYhD9iCday2vBtStbi0es8nd9/rYtgI2', 'palava', 'casa rio', '1', '9899898989', '1', 'active', NULL, '2024-09-26 06:32:56', '2024-09-26 06:32:56', NULL),
('da2198de-04c6-4fe3-88c1-eca5c3375957', 'Varsha Sahu', 'varshasahu@gmail.com', '$2y$12$HEUPXT6bhv56479gcJA/r.IjSh8BQbMAgklM.reAXoNJqvGzrlLLa', 'palavaa', 'casa rio0', '2', '9899898988', '2', 'active', NULL, '2024-09-26 06:07:54', '2024-09-26 06:29:29', NULL),
('f2865395-5263-42a7-8315-71d49db29a18', 'Dr Chintu', 'chintu@gmail.com', '$2y$12$7RnEdhRn1R.Rsp3pTaM59ei70x5rHRHOAE.FRL625C5l.zgNlmbaS', 'palava', 'casa rio', '1', '9899898989', '2', 'active', NULL, '2024-09-26 06:32:24', '2024-09-26 06:32:24', NULL),
('fcf40eae-07a4-4e53-b16b-8b1a471e2b1a', 'Dr Upadhaya', 'updaya@gmail.com', '$2y$12$joPx0EPgMtQUX1nTTyBARuFpIc15lrSJowQvJU7NYMRqn2cTNCqG6', 'palava', 'casa rio', '1', '9899898989', '2', 'active', NULL, '2024-09-26 06:32:00', '2024-09-26 06:32:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor` (`doctor_id`),
  ADD KEY `fk_patient` (`patient_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_country_id_foreign` (`country_id`);

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
