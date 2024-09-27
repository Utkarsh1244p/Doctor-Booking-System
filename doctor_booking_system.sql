-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 09:23 PM
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
  `appointment_date` datetime NOT NULL,
  `status` enum('appointed','pending','cancelled','expired','rejected') NOT NULL,
  `appointment_updated_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `appointment_date`, `status`, `appointment_updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
('2495e493-8ea4-4f33-8da9-cb521c29538e', '97c41381-b2f3-4d78-a7e8-ed8e7406ca23', '8e61bfaf-2443-4589-80a7-c1ff1c4f2572', '2024-10-29 21:20:00', 'pending', NULL, '2024-09-27 13:46:40', '2024-09-27 13:46:40', NULL),
('8bba79fc-ebe9-4850-891d-3b050ec8738e', '97c41381-b2f3-4d78-a7e8-ed8e7406ca23', '8e61bfaf-2443-4589-80a7-c1ff1c4f2572', '2024-10-30 21:20:00', 'pending', NULL, '2024-09-27 13:46:26', '2024-09-27 13:46:26', NULL),
('a22cfe44-778b-4c6d-a1e3-67744ce40617', '97c41381-b2f3-4d78-a7e8-ed8e7406ca23', '8e61bfaf-2443-4589-80a7-c1ff1c4f2572', '2024-10-28 21:20:00', 'pending', NULL, '2024-09-27 13:46:45', '2024-09-27 13:46:45', NULL);

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
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`) VALUES
(1, 'Mumbai', 1),
(2, 'Nashik', 1),
(3, 'Nasik', 1),
(4, 'Nashik', 1),
(5, 'Nagpur', 1),
(6, 'Nashik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `phonecode`) VALUES
(1, 'IN', 'India', 91);

-- --------------------------------------------------------

--
-- Table structure for table `country_state_city`
--

CREATE TABLE `country_state_city` (
  `id` char(36) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `status` enum('active','nonactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '2024_09_27_133728_roles', 2),
(3, '2024_09_27_125621_countries', 3),
(4, '2024_09_27_130423_states', 4),
(5, '2024_09_27_131501_cities', 5),
(6, '2014_10_12_000000_create_users_table', 6),
(7, '2024_09_26_111122_create_personal_access_tokens_table', 6),
(8, '2024_09_27_132735_country_state_city', 6),
(9, '2024_09_27_135516_appointments', 6);

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

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('78df7da3-7cff-11ef-8f63-8bc51d8bad01', 'patient', 'active', NULL, NULL, NULL),
('78df950a-7cff-11ef-8f63-8bc51d8bad01', 'doctor', 'active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`) VALUES
(1, 'Maharashtra', 1);

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
  `address2` varchar(255) DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address1`, `address2`, `contact`, `country_id`, `state_id`, `city_id`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('132c24aa-6cc8-4579-b190-275c13424351', 'Tikesh Kannake', 'tikesh@gmail.com', '$2y$12$dK.cV9WT2pok691lA0fn3ueYTkuOS6NssuGffmIFoaX9l/Svik0fC', 'Chandrapur', NULL, '9899898989', 1, 1, 1, '78df7da3-7cff-11ef-8f63-8bc51d8bad01', 'active', NULL, '2024-09-27 13:40:52', '2024-09-27 13:40:52', NULL),
('3a8566d6-d319-4088-ad21-61602073e094', 'Dr. Pandeyy', 'pandeyy@gmail.com', '$2y$12$7MHd/wqjHoXg4zaiqVfCDuNsAlLytDvkGEAQ/Oh0kLyOgmlGDHkGa', 'Andheri', NULL, '9899898989', 1, 1, 1, '78df950a-7cff-11ef-8f63-8bc51d8bad01', 'active', NULL, '2024-09-27 13:43:50', '2024-09-27 13:43:50', NULL),
('4ba39537-8d5a-49af-93a8-fdd888d54432', 'Vinayak Kotwala', 'vinayak@gmail.com', '$2y$12$wXgTw7i0Rbcf79KV8FKTWuqi51imnkiQG/EYfPwV3lK.Oyt8cWV9W', 'palava', 'casa rio', '9899898989', 1, 1, 1, '78df7da3-7cff-11ef-8f63-8bc51d8bad01', 'active', NULL, '2024-09-27 13:36:48', '2024-09-27 13:36:48', NULL),
('8e61bfaf-2443-4589-80a7-c1ff1c4f2572', 'Dr. Sharma', 'sharma@gmail.com', '$2y$12$RRLTIaqu7OuP0W/zHiHDZ.YyXjVuoBYzw1AwTkAvy2aPjhd14AJ9i', 'Andheri', NULL, '9899898989', 1, 1, 1, '78df950a-7cff-11ef-8f63-8bc51d8bad01', 'active', NULL, '2024-09-27 13:43:15', '2024-09-27 13:43:15', NULL),
('97c41381-b2f3-4d78-a7e8-ed8e7406ca23', 'Manish Chavan', 'mainsh@gmail.com', '$2y$12$4WjtZ456sOSqCYEaydwARO5iARErl9VpPHkj7oXywSx3ReH0/l76y', 'Andheri', NULL, '9899898989', 1, 1, 1, '78df7da3-7cff-11ef-8f63-8bc51d8bad01', 'active', NULL, '2024-09-27 13:41:58', '2024-09-27 13:41:59', NULL),
('99288653-2f83-459a-ab64-fc9ed75acec8', 'Dr. Verma', 'verma@gmail.com', '$2y$12$AswXHAPvGiKAjA8kEMVTx.qEyThQTI8eyCNC2BRdLHdDDLs4toXie', 'Andheri', NULL, '9899898989', 1, 1, 1, '78df950a-7cff-11ef-8f63-8bc51d8bad01', 'active', NULL, '2024-09-27 13:43:31', '2024-09-27 13:43:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_appointment_updated_by_foreign` (`appointment_updated_by`);

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
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_id_index` (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_id_index` (`id`);

--
-- Indexes for table `country_state_city`
--
ALTER TABLE `country_state_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_city_country_id_foreign` (`country_id`),
  ADD KEY `country_state_city_state_id_foreign` (`state_id`),
  ADD KEY `country_state_city_city_id_foreign` (`city_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_id_index` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_state_id_foreign` (`state_id`),
  ADD KEY `users_city_id_foreign` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_appointment_updated_by_foreign` FOREIGN KEY (`appointment_updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `country_state_city`
--
ALTER TABLE `country_state_city`
  ADD CONSTRAINT `country_state_city_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `country_state_city_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `country_state_city_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
