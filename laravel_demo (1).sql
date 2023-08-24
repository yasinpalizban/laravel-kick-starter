-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 24, 2023 at 10:41 AM
-- Server version: 8.0.33-0ubuntu0.22.04.2
-- PHP Version: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(300) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `name`, `description`, `link`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ee', 'ee', 'eee', 1, '2022-08-25 07:48:27', '2022-08-26 07:48:27', '2022-08-26 07:48:27'),
(2, 'advertisementTwo', '               You can put anything you want inside of these side widgets. They are easy to use, and feature the new               Bootstrap 4 card containers!', '--', 1, '2021-09-02 13:16:07', '2022-01-28 01:03:13', NULL),
(3, 'advertisementOne', '               You can put anything you want inside of these side widgets. They are easy to use, and feature the new               Bootstrap 4 card containers!', '--', 1, '2022-01-10 12:24:42', '2022-01-28 02:14:09', NULL),
(4, 'advertisementThree', '               You can put anything you want inside of these side widgets. They are easy to use, and feature the new               Bootstrap 4 card containers!', '-', 1, '2022-04-28 19:46:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_media`
--

CREATE TABLE `advertisement_media` (
  `id` int UNSIGNED NOT NULL,
  `advertisement_id` int UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `advertisement_media`
--

INSERT INTO `advertisement_media` (`id`, `advertisement_id`, `path`) VALUES
(15, 3, 'public/upload/advertisement/image/1643351373.png'),
(17, 2, 'public/upload/advertisement/image/1643351459.png'),
(18, 4, 'public/upload/advertisement/image/1643351460.jpg'),
(25, 1, 'public/upload/advertisement/image/1680288865.jpg'),
(26, 1, 'public/upload/advertisement/image/1680288934.jpg'),
(28, 1, 'public/upload/advertisement/image/1680288974.jpg'),
(30, 1, 'public/upload/advertisement/image/168028970145.jpg'),
(32, 1, 'public/upload/advertisement/image/168028977326.jpg'),
(33, 1, 'public/upload/advertisement/image/168028977350.jpg'),
(34, 1, 'public/upload/advertisement/image/16802899090.jpg'),
(35, 1, 'public/upload/advertisement/image/16802899091.jpg'),
(36, 1, 'public/upload/advertisement/image/16802899650.jpg'),
(37, 1, 'public/upload/advertisement/image/16802899651.jpg'),
(38, 1, 'public/upload/advertisement/image/16802899652.jpg'),
(39, 1, 'public/upload/advertisement/image/16802901301.jpg'),
(40, 1, 'public/upload/advertisement/image/16802901302.jpg'),
(41, 1, 'public/upload/advertisement/image/16802901303.jpg'),
(42, 1, 'public/upload/advertisement/image/16802903021.jpg'),
(43, 1, 'public/upload/advertisement/image/16802903022.jpg'),
(44, 1, 'public/upload/advertisement/image/16802903023.jpg'),
(45, 1, 'public/upload/advertisement/image/16802903211.jpg'),
(46, 1, 'public/upload/advertisement/image/16802903212.jpg'),
(47, 1, 'public/upload/advertisement/image/16802903213.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'admin'),
(2, 'coworker', 'coworker'),
(3, 'blogger', 'blogger'),
(4, 'member', 'member'),
(5, 'contractor', 'Contractor');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `id` int NOT NULL,
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '0',
  `actions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`id`, `group_id`, `permission_id`, `actions`) VALUES
(1, 1, 1, '-get'),
(2, 1, 2, '-post-get-put-delete'),
(5, 1, 3, '-get'),
(6, 1, 5, '-get'),
(7, 1, 4, '-get'),
(8, 1, 6, '-get');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`id`, `group_id`, `user_id`) VALUES
(1, 1, 1),
(7, 1, 9),
(6, 2, 3),
(4, 3, 5),
(2, 4, 6),
(3, 4, 7),
(5, 4, 8),
(8, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `login`, `user_agent`, `user_id`, `date`, `success`, `type`) VALUES
(24, '::1', NULL, 'admin', NULL, '2021-08-28 14:33:11', 0, ''),
(25, '::1', NULL, 'admin', NULL, '2021-08-28 14:34:27', 1, ''),
(26, '::1', 'pussies@fucitnttug.comy', 'jijouuyyt', NULL, '2021-08-28 16:01:36', 0, ''),
(27, '::1', 'pussies@fucitnttug.comy', 'jijouuyyt', NULL, '2021-08-28 16:02:00', 1, ''),
(28, '::1', 'pussies@fucitnttug.comy', 'jijouuyyt', NULL, '2021-08-28 16:02:21', 0, ''),
(29, '::1', 'pussies@fucitnttug.comy', 'jijouuyyt', NULL, '2021-08-28 16:04:24', 0, ''),
(30, '::1', 'pussies@fucitnttug.comy', 'jijouuyyt', NULL, '2021-08-28 16:04:35', 0, ''),
(31, '::1', 'pussies@fucitnttug.comy', 'jijouuyyt', NULL, '2021-08-28 16:04:38', 1, ''),
(32, '::1', NULL, 'admin', NULL, '2021-08-28 18:06:22', 1, ''),
(33, '::1', NULL, 'admin', NULL, '2021-08-28 18:09:04', 1, ''),
(34, '::1', NULL, 'admin', NULL, '2021-08-28 18:09:39', 1, ''),
(35, '::1', NULL, 'admin', NULL, '2021-08-28 18:10:37', 1, ''),
(36, '::1', NULL, 'admin', NULL, '2021-08-29 13:19:38', 1, ''),
(37, '::1', NULL, 'admin', 1, '2021-08-29 15:58:34', 1, ''),
(38, '::1', NULL, 'admin', 1, '2021-08-29 16:01:31', 1, ''),
(39, '::1', NULL, 'admin', 1, '2021-08-29 16:07:57', 1, ''),
(40, '::1', NULL, 'admin', 1, '2021-08-29 16:08:19', 1, ''),
(41, '::1', NULL, 'admin', NULL, '2021-08-29 16:14:23', 1, ''),
(42, '::1', NULL, 'admin', 1, '2021-08-29 16:27:42', 1, ''),
(43, '::1', NULL, 'admin', 1, '2021-08-30 12:49:10', 1, ''),
(44, '::1', NULL, 'admin', NULL, '2021-08-30 14:32:44', 1, ''),
(45, '::1', NULL, 'admin', NULL, '2021-08-30 14:34:17', 1, ''),
(46, '::1', NULL, 'admin', NULL, '2021-08-30 14:38:14', 1, ''),
(47, '::1', NULL, 'admin', NULL, '2021-08-30 14:38:23', 1, ''),
(48, '::1', NULL, 'admin', NULL, '2021-08-30 14:38:38', 1, ''),
(49, '::1', NULL, 'admin', NULL, '2021-08-30 14:38:55', 1, ''),
(50, '::1', NULL, 'admin', NULL, '2021-08-30 14:40:32', 1, ''),
(51, '::1', NULL, 'admin', NULL, '2021-08-30 14:40:47', 1, ''),
(52, '::1', NULL, 'admin', NULL, '2021-08-30 14:46:30', 1, ''),
(53, '::1', NULL, 'admin', NULL, '2021-08-30 14:46:55', 1, ''),
(54, '::1', NULL, 'admin', NULL, '2021-08-30 14:51:36', 1, ''),
(55, '::1', NULL, 'admin', 1, '2021-08-30 16:48:59', 1, ''),
(56, '::1', NULL, 'admin', 1, '2021-08-30 16:50:15', 1, ''),
(57, '::1', NULL, 'admin', 1, '2021-08-31 12:23:42', 1, ''),
(58, '::1', NULL, 'admin', 1, '2021-08-31 12:32:53', 1, ''),
(59, '::1', NULL, 'admin', 1, '2021-08-31 12:46:00', 1, ''),
(60, '::1', NULL, 'admin', NULL, '2021-08-31 12:47:44', 1, ''),
(61, '::1', NULL, 'admin', NULL, '2021-08-31 12:49:43', 1, ''),
(62, '::1', NULL, 'admin', NULL, '2021-08-31 12:49:58', 1, ''),
(63, '::1', NULL, 'admin', NULL, '2021-08-31 12:50:17', 1, ''),
(64, '::1', NULL, 'admin', NULL, '2021-08-31 12:52:01', 1, ''),
(65, '::1', NULL, 'admin', NULL, '2021-08-31 12:52:42', 1, ''),
(66, '::1', NULL, 'admin', NULL, '2021-08-31 13:01:50', 1, ''),
(67, '::1', NULL, 'admin', NULL, '2021-08-31 13:02:24', 1, ''),
(68, '::1', NULL, 'admin', 1, '2021-08-31 13:19:12', 1, ''),
(69, '::1', NULL, 'admin', NULL, '2021-08-31 14:15:49', 1, ''),
(70, '::1', NULL, 'admin', NULL, '2021-08-31 14:41:29', 1, ''),
(71, '::1', NULL, 'admin', NULL, '2021-08-31 14:45:01', 1, ''),
(72, '::1', NULL, 'admin', NULL, '2021-08-31 14:47:25', 1, ''),
(73, '::1', NULL, 'admin', 1, '2021-09-01 08:58:42', 1, ''),
(74, '::1', NULL, 'admin', NULL, '2021-09-01 09:10:02', 1, ''),
(75, '::1', NULL, 'uuu', NULL, '2021-09-02 08:39:43', 0, ''),
(76, '::1', NULL, 'admin', NULL, '2021-09-02 08:43:11', 1, ''),
(77, '::1', NULL, 'admin', NULL, '2021-09-02 08:44:11', 1, ''),
(78, '::1', NULL, 'admin', NULL, '2021-09-02 09:06:30', 1, ''),
(79, '::1', NULL, 'admin', NULL, '2021-09-02 09:10:02', 1, ''),
(80, '::1', NULL, 'admin', NULL, '2021-09-02 09:20:40', 1, ''),
(81, '::1', NULL, 'admin', NULL, '2021-09-02 09:23:15', 1, ''),
(82, '::1', NULL, 'admin', NULL, '2021-09-02 10:07:59', 1, ''),
(83, '::1', NULL, 'admin', NULL, '2021-09-02 10:08:36', 1, ''),
(84, '::1', NULL, 'admin', NULL, '2021-09-03 04:34:49', 0, ''),
(85, '::1', NULL, 'admin', NULL, '2021-09-03 04:34:54', 0, ''),
(86, '::1', NULL, 'admin', NULL, '2021-09-03 04:35:39', 0, ''),
(87, '::1', NULL, 'admin', NULL, '2021-09-03 04:35:51', 1, ''),
(88, '::1', NULL, 'admin', NULL, '2021-09-04 06:15:43', 0, ''),
(89, '::1', NULL, 'admin', NULL, '2021-09-04 06:16:23', 0, ''),
(90, '::1', NULL, 'admin', NULL, '2021-09-04 06:17:12', 1, ''),
(91, '::1', NULL, 'admin', NULL, '2021-09-04 14:18:02', 0, ''),
(92, '::1', NULL, 'admin', NULL, '2021-09-04 14:18:16', 0, ''),
(93, '::1', NULL, 'admin', NULL, '2021-09-04 14:18:26', 0, ''),
(94, '::1', 'admin@admin.com', NULL, NULL, '2021-09-04 14:18:36', 0, ''),
(95, '::1', 'admin@admin.com', NULL, NULL, '2021-09-04 14:23:21', 0, ''),
(96, '::1', 'admin@admin.com', NULL, NULL, '2021-09-04 14:24:17', 1, ''),
(97, '::1', NULL, 'admin', NULL, '2021-09-04 14:28:58', 1, ''),
(98, '::1', 'admin@admin.com', NULL, NULL, '2021-09-05 14:41:23', 1, ''),
(99, '::1', NULL, 'admin', NULL, '2021-09-05 15:24:17', 1, ''),
(100, '::1', NULL, 'admin', NULL, '2021-09-05 15:47:46', 1, ''),
(101, '::1', NULL, 'admin', NULL, '2021-09-06 12:18:35', 1, ''),
(102, '::1', NULL, 'admin', 1, '2021-09-06 12:58:07', 1, ''),
(103, '::1', 'admin@admin.com', NULL, NULL, '2021-09-06 13:17:45', 1, ''),
(104, '::1', 'admin@admin.com', NULL, NULL, '2021-09-06 13:20:44', 1, ''),
(105, '::1', NULL, 'uuu', NULL, '2021-09-09 11:37:44', 0, ''),
(106, '::1', NULL, 'admin', NULL, '2021-09-09 11:37:56', 0, ''),
(107, '::1', NULL, 'admin', NULL, '2021-09-09 11:41:05', 0, ''),
(108, '::1', NULL, 'admin', NULL, '2021-09-09 11:41:15', 0, ''),
(109, '::1', NULL, 'admin', NULL, '2021-09-09 11:41:22', 1, ''),
(110, '::1', NULL, 'admin', NULL, '2021-09-09 13:57:50', 1, ''),
(111, '::1', 'admin@admin.com', NULL, NULL, '2021-09-16 02:36:12', 1, ''),
(112, '::1', 'admin@admin.com', NULL, NULL, '2021-09-16 02:36:24', 1, ''),
(113, '::1', NULL, 'admin', 1, '2021-09-16 03:31:58', 1, ''),
(114, '::1', NULL, 'admin', 1, '2021-09-16 03:49:36', 1, ''),
(115, '::1', 'admin@admin.com', NULL, NULL, '2021-09-16 03:49:59', 1, ''),
(116, '::1', NULL, 'uuu', NULL, '2021-09-17 15:54:54', 0, ''),
(117, '::1', NULL, 'admin', NULL, '2021-09-17 15:55:06', 1, ''),
(118, '::1', 'admin@admin.com', NULL, NULL, '2021-09-18 12:41:07', 1, ''),
(119, '::1', 'admin@admin.com', NULL, NULL, '2021-09-20 14:05:45', 1, ''),
(120, '::1', 'admin@admin.com', NULL, NULL, '2021-09-24 16:00:19', 1, ''),
(121, '::1', 'admin@admin.com', NULL, NULL, '2021-09-24 16:14:56', 1, ''),
(122, '::1', 'admin@admin.com', NULL, NULL, '2021-09-24 16:14:59', 1, ''),
(123, '::1', 'admin@admin.com', NULL, NULL, '2021-09-24 18:04:02', 1, ''),
(124, '::1', NULL, 'uuu', NULL, '2021-09-25 13:57:59', 0, ''),
(125, '::1', NULL, 'admin', NULL, '2021-09-25 13:58:13', 1, ''),
(126, '::1', 'admin@admin.com', NULL, NULL, '2021-09-25 14:03:39', 1, ''),
(127, '::1', 'admin@admin.com', NULL, NULL, '2021-09-25 17:58:10', 1, ''),
(128, '::1', 'admin@admin.com', NULL, NULL, '2021-09-26 14:13:26', 1, ''),
(129, '::1', 'admin@admin.com', NULL, NULL, '2021-09-26 14:18:46', 1, ''),
(130, '127.0.0.1', NULL, 'admin', NULL, '2021-09-27 16:56:27', 1, ''),
(131, '::1', NULL, 'admin', NULL, '2021-09-29 12:18:53', 1, ''),
(132, '::1', NULL, 'admin', NULL, '2021-10-03 12:42:06', 1, ''),
(133, '::1', 'developpers@gmail.com', NULL, NULL, '2022-04-24 03:48:25', 1, ''),
(134, '::1', 'developpers@gmail.com', NULL, NULL, '2022-04-24 20:58:12', 1, ''),
(135, '::1', 'developpers@gmail.com', NULL, NULL, '2022-04-25 08:22:04', 1, ''),
(136, '::1', 'maggio.margarita@nicolas.info', NULL, NULL, '2022-04-25 09:53:01', 1, ''),
(137, '::1', 'yaasiii44@gmail.com', NULL, NULL, '2022-04-25 09:58:47', 1, ''),
(138, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:24:51', 0, 'sign-in'),
(139, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:30:59', 0, 'sign-in'),
(140, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:43:28', 0, 'sign-in'),
(141, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:43:59', 0, 'sign-in'),
(142, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:53:27', 1, 'sign-in'),
(143, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:54:13', 1, 'sign-in'),
(144, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:55:02', 1, 'sign-in'),
(145, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:55:19', 1, 'sign-in'),
(146, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:56:04', 1, 'sign-in'),
(147, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:56:37', 1, 'sign-in'),
(148, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:57:04', 1, 'sign-in'),
(149, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:57:35', 1, 'sign-in'),
(150, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:57:54', 1, 'sign-in'),
(151, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:58:04', 1, 'sign-in'),
(152, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:58:34', 1, 'sign-in'),
(153, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:58:44', 1, 'sign-in'),
(154, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:59:05', 1, 'sign-in'),
(155, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 05:59:49', 1, 'sign-in'),
(156, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:00:21', 1, 'sign-in'),
(157, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:00:47', 1, 'sign-in'),
(158, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:02:14', 1, 'sign-in'),
(159, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:02:47', 1, 'sign-in'),
(160, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:03:22', 1, 'sign-in'),
(161, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:04:11', 1, 'sign-in'),
(162, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:04:34', 1, 'sign-in'),
(163, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:04:41', 1, 'sign-in'),
(164, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:04:42', 1, 'sign-in'),
(165, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:04:43', 1, 'sign-in'),
(166, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:05:14', 1, 'sign-in'),
(167, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:06:03', 1, 'sign-in'),
(168, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:06:43', 1, 'sign-in'),
(169, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:08:00', 1, 'sign-in'),
(170, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:08:05', 1, 'sign-in'),
(171, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:08:19', 1, 'sign-in'),
(172, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:08:21', 1, 'sign-in'),
(173, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 06:09:46', 1, 'sign-in'),
(174, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 09:51:24', 1, 'sign-in'),
(175, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-06 17:27:14', 1, 'sign-in'),
(176, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-07 05:41:00', 1, 'sign-in'),
(177, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-07 08:09:38', 1, 'sign-in'),
(178, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-07 10:25:54', 1, 'sign-in'),
(179, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-07 15:54:58', 1, 'sign-in'),
(180, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-07 18:34:58', 1, 'sign-in'),
(181, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 03:30:03', 1, 'sign-in'),
(182, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 05:32:07', 1, 'sign-in'),
(183, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 06:39:25', 1, 'sign-in'),
(184, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 08:45:56', 1, 'sign-in'),
(185, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 09:21:15', 1, 'sign-in'),
(186, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 09:21:27', 1, 'sign-in'),
(187, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-08 10:43:03', 1, 'sign-in'),
(188, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 09:46:32', 1, 'sign-in'),
(189, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 11:55:11', 1, 'sign-in'),
(190, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:05:26', 1, 'sign-in'),
(191, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:11:44', 1, 'sign-in'),
(192, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:12:49', 1, 'sign-in'),
(193, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:13:22', 1, 'sign-in'),
(194, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:13:55', 1, 'sign-in'),
(195, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:15:54', 1, 'sign-in'),
(196, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:16:11', 1, 'sign-in'),
(197, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:16:54', 1, 'sign-in'),
(198, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:19:59', 1, 'sign-in'),
(199, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:21:09', 1, 'sign-in'),
(200, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:22:19', 1, 'sign-in'),
(201, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:23:41', 1, 'sign-in'),
(202, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:24:06', 1, 'sign-in'),
(203, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:24:26', 1, 'sign-in'),
(204, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:24:37', 1, 'sign-in'),
(205, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-11 16:24:57', 1, 'sign-in'),
(206, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 03:29:54', 1, 'sign-in'),
(207, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 03:48:24', 1, 'sign-in'),
(208, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 03:50:12', 1, 'sign-in'),
(209, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:07:13', 1, 'sign-in'),
(210, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:09:01', 1, 'sign-in'),
(211, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:10:14', 1, 'sign-in'),
(212, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:12:30', 1, 'sign-in'),
(213, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:13:49', 1, 'sign-in'),
(214, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:21:05', 1, 'sign-in'),
(215, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:21:35', 1, 'sign-in'),
(216, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:24:54', 1, 'sign-in'),
(217, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:25:29', 1, 'sign-in'),
(218, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:26:49', 1, 'sign-in'),
(219, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:27:47', 1, 'sign-in'),
(220, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:28:12', 1, 'sign-in'),
(221, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:29:35', 1, 'sign-in'),
(222, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:30:10', 1, 'sign-in'),
(223, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:31:15', 1, 'sign-in'),
(224, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 04:34:07', 1, 'sign-in'),
(225, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:34:43', 1, 'sign-in'),
(226, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:35:15', 1, 'sign-in'),
(227, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:36:13', 1, 'sign-in'),
(228, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:38:09', 1, 'sign-in'),
(229, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:39:03', 1, 'sign-in'),
(230, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:39:18', 1, 'sign-in'),
(231, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:39:29', 1, 'sign-in'),
(232, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:39:42', 1, 'sign-in'),
(233, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:39:57', 1, 'sign-in'),
(234, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:40:13', 1, 'sign-in'),
(235, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:40:25', 1, 'sign-in'),
(236, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:48:47', 1, 'sign-in'),
(237, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:54:32', 1, 'sign-in'),
(238, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:57:38', 1, 'sign-in'),
(239, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:58:36', 1, 'sign-in'),
(240, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 04:59:37', 1, 'sign-in'),
(241, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 05:02:08', 1, 'sign-in'),
(242, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 05:02:43', 1, 'sign-in'),
(243, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 06:34:32', 1, 'sign-in'),
(244, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1, '2022-08-12 07:03:40', 1, 'sign-in'),
(245, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-12 08:41:32', 1, 'sign-in'),
(246, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-24 13:18:30', 1, 'sign-in'),
(247, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-24 16:46:23', 1, 'sign-in'),
(248, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-25 02:38:56', 1, 'sign-in'),
(249, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-25 03:25:37', 1, 'sign-in'),
(250, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-25 05:29:27', 1, 'sign-in'),
(251, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-25 10:38:46', 1, 'sign-in'),
(252, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-26 05:47:39', 1, 'sign-in'),
(253, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-26 08:20:13', 1, 'sign-in'),
(254, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2022-08-26 10:22:12', 1, 'sign-in'),
(255, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-14 07:38:18', 1, 'sign-in'),
(256, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-14 08:19:48', 1, 'sign-in'),
(257, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-14 08:23:10', 1, 'sign-in'),
(258, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-14 08:26:31', 1, 'sign-in'),
(259, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-14 08:27:37', 1, 'sign-in'),
(260, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-14 08:27:57', 1, 'sign-in'),
(261, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-14 08:34:31', 1, 'sign-in'),
(262, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-14 08:36:15', 1, 'sign-in'),
(263, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-14 08:37:00', 1, 'sign-in'),
(264, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-14 08:37:47', 1, 'sign-in'),
(265, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-14 08:38:01', 1, 'sign-in'),
(266, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-29 16:04:05', 1, 'sign-in'),
(267, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-29 16:40:42', 1, 'sign-in'),
(268, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-29 18:59:07', 1, 'sign-in'),
(269, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-29 19:03:08', 1, 'sign-in'),
(270, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-30 03:17:20', 1, 'sign-in'),
(271, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-30 03:55:29', 1, 'sign-in'),
(272, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-30 05:30:51', 1, 'sign-in'),
(273, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-30 05:56:04', 1, 'sign-in'),
(274, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 07:13:26', 1, 'sign-in'),
(275, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0', 1, '2023-03-30 07:50:03', 1, 'sign-in'),
(276, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-30 10:00:08', 1, 'sign-in'),
(277, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-30 10:56:21', 1, 'sign-in'),
(278, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 11:20:20', 0, 'sign-in'),
(279, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 11:20:25', 0, 'sign-in'),
(280, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 11:20:48', 1, 'sign-in'),
(281, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-30 11:48:08', 1, 'sign-in'),
(282, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 11:52:27', 1, 'sign-in'),
(283, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-30 12:04:04', 1, 'sign-in'),
(284, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 13:01:54', 1, 'sign-in'),
(285, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-30 14:09:20', 1, 'sign-in'),
(286, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 15:12:04', 1, 'sign-in'),
(287, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-30 17:13:07', 1, 'sign-in'),
(288, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 10, '2023-03-30 17:13:22', 1, 'sign-in'),
(289, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-30 17:23:16', 1, 'sign-in'),
(290, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-31 13:13:34', 1, 'sign-in'),
(291, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-31 15:13:51', 1, 'sign-in'),
(292, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-03-31 17:14:22', 1, 'sign-in'),
(293, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-03-31 18:51:25', 1, 'sign-in'),
(294, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-01 07:29:02', 1, 'sign-in'),
(295, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-01 07:32:32', 1, 'sign-in'),
(296, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-01 08:09:16', 1, 'sign-in'),
(297, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-01 15:16:08', 1, 'sign-in'),
(298, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-01 17:49:40', 1, 'sign-in'),
(299, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-02 14:30:15', 1, 'sign-in'),
(300, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-02 14:36:21', 1, 'sign-in'),
(301, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-02 14:57:15', 1, 'sign-in'),
(302, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-02 17:15:44', 1, 'sign-in'),
(303, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-04-02 17:51:38', 1, 'sign-in'),
(304, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-03 14:48:16', 1, 'sign-in'),
(305, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-04-03 14:49:00', 1, 'sign-in'),
(306, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-03 15:53:48', 1, 'sign-in'),
(307, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-04-03 17:03:55', 1, 'sign-in'),
(308, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-04-04 14:34:42', 1, 'sign-in'),
(309, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-04 15:35:19', 1, 'sign-in'),
(310, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-04 17:26:35', 1, 'sign-in'),
(311, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-05 16:49:54', 1, 'sign-in'),
(312, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-06 04:25:04', 1, 'sign-in'),
(313, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-06 04:42:17', 1, 'sign-in'),
(314, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-04-06 16:22:09', 1, 'sign-in'),
(315, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-07 12:15:48', 1, 'sign-in'),
(316, '127.0.0.1', NULL, 'PostmanRuntime/7.29.2', 1, '2023-04-08 14:54:52', 1, 'sign-in'),
(317, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 1, '2023-04-09 15:18:59', 1, 'sign-in'),
(318, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0', 1, '2023-04-09 16:34:26', 1, 'sign-in'),
(319, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-07-07 18:08:42', 1, 'sign-in'),
(320, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-07-08 17:19:52', 1, 'sign-in'),
(321, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-08-17 05:41:39', 1, 'sign-in'),
(322, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:37:45', 1, 'sign-in'),
(323, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:47:50', 1, 'sign-in'),
(324, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:52:49', 1, 'sign-in'),
(325, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:53:17', 1, 'sign-in'),
(326, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:54:20', 1, 'sign-in'),
(327, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:58:07', 1, 'sign-in'),
(328, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 06:58:53', 1, 'sign-in'),
(329, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:01:08', 1, 'sign-in'),
(330, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:01:19', 1, 'sign-in'),
(331, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:04:59', 1, 'sign-in'),
(332, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:05:52', 1, 'sign-in'),
(333, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:06:11', 1, 'sign-in'),
(334, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:07:14', 1, 'sign-in'),
(335, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:08:59', 1, 'sign-in'),
(336, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:10:05', 1, 'sign-in'),
(337, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:33:20', 1, 'sign-in'),
(338, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:33:40', 1, 'sign-in'),
(339, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-17 07:34:22', 1, 'sign-in'),
(340, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 13:36:23', 0, 'sign-in'),
(341, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 13:41:31', 0, 'sign-in'),
(342, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 0, '2023-08-19 13:43:54', 0, 'sign-in'),
(343, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 0, '2023-08-19 13:48:30', 0, 'sign-in'),
(344, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 0, '2023-08-19 13:48:40', 0, 'sign-in'),
(345, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 13:58:37', 0, 'sign-in'),
(346, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 18:31:57', 1, 'sign-in'),
(347, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 18:32:28', 1, 'sign-in'),
(348, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 18:35:07', 1, 'sign-in'),
(349, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-19 18:43:41', 1, 'sign-in'),
(350, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-20 15:19:34', 1, 'sign-in'),
(351, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-21 11:59:57', 1, 'sign-in'),
(352, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-21 16:09:09', 0, 'sign-in'),
(353, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-21 16:09:31', 0, 'sign-in'),
(354, '127.0.0.1', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 1, '2023-08-21 16:09:36', 1, 'sign-in'),
(355, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-08-23 16:27:10', 0, 'sign-in'),
(356, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-08-23 16:32:38', 0, 'sign-in'),
(357, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-08-23 16:33:05', 0, 'sign-in'),
(358, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-08-23 16:33:30', 1, 'sign-in'),
(359, '127.0.0.1', NULL, 'PostmanRuntime/7.29.3', 1, '2023-08-23 16:34:45', 1, 'sign-in');

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`, `active`) VALUES
(1, 'user', 'manage controller user', 1),
(2, 'setting', 'manage controller setting', 1),
(3, 'permission', 'manage controller permission', 1),
(4, 'permissionGroup', 'manage controller permission user', 1),
(5, 'permissionUser', 'manage controller permission group', 1),
(6, 'group', 'manage controller group', 1),
(7, 'jobPost', 'fast food psot manage ctl', 0),
(8, 'jobBalance', 'fastFoodPost ctl', 0),
(9, 'jobCategory', 'fastFoodPost ctl', 0),
(10, 'jobApply', 'fastFoodComment ctl ', 0),
(11, 'jobSubCategory', 'fastFoodMedia ctl', 0),
(12, 'overView', 'overView ctl', 0),
(13, 'graph', 'graph ctl', 0),
(14, 'JobTransaction', 'fastFoodTransaction ctl', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '0',
  `actions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_users_permissions`
--

INSERT INTO `auth_users_permissions` (`id`, `user_id`, `permission_id`, `actions`) VALUES
(1, 1, 1, '-get-post-put-delete'),
(2, 1, 3, '-get-post-put-delete'),
(3, 1, 4, '-get-post-put-delete'),
(4, 1, 5, '-get-post-put-delete'),
(6, 1, 6, '-get-post-put-delete');

-- --------------------------------------------------------

--
-- Table structure for table `chat_private`
--

CREATE TABLE `chat_private` (
  `id` int UNSIGNED NOT NULL,
  `user_sender_id` int UNSIGNED NOT NULL,
  `user_receiver_id` int UNSIGNED NOT NULL,
  `message` text,
  `reply_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chat_private_media`
--

CREATE TABLE `chat_private_media` (
  `id` int UNSIGNED NOT NULL,
  `chat_private_id` int UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room`
--

CREATE TABLE `chat_room` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `message` text,
  `reply_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_media`
--

CREATE TABLE `chat_room_media` (
  `id` int UNSIGNED NOT NULL,
  `chat_room_id` int UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `message` text,
  `reply` text,
  `phone` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `title`, `email`, `name`, `message`, `reply`, `phone`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '11', 'dfd@ssf.com', 'sdsds', 'dfdf', 'dfdfdfdf', 9178, 1, '2021-08-30 00:18:55', '2021-08-30 00:23:35', NULL),
(2, 'dfdfdfd', 'dfd@ssf.com', 'sdsds', 'dfdf', '2wewewqe', 9178, 1, '2021-08-30 00:20:04', '2021-08-30 00:22:37', NULL),
(4, 'gfhfgh', 'tyt@dfdf.com', 'gfhfhg', '<p>dfgdfgdfgdfgdfgdf</p>\n', '<p>fdrgtergtre eretertert</p>\n', 4354534, 1, '2022-01-10 21:42:40', '2022-01-10 21:52:23', NULL),
(5, 'rterter', 'yasinpalizbandeveloper@gmail.com', 'advertisementTwo', 'rterteterter', NULL, 45345, 0, '2022-01-28 12:22:37', NULL, NULL),
(6, 'erwr', 'yasinpalizban10@gmail.com', 'hello-world', 'ewrewrewrewr', NULL, 932432423, 0, '2023-04-02 03:54:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_media`
--

CREATE TABLE `contact_media` (
  `id` int UNSIGNED NOT NULL,
  `contact_id` int UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `contact_media`
--

INSERT INTO `contact_media` (`id`, `contact_id`, `path`) VALUES
(1, 4, 'public/upload/contact/1653502559565.jpg'),
(3, 4, 'public/upload/contact/1641838362.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `job_apply`
--

CREATE TABLE `job_apply` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `message` varchar(300) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_apply`
--

INSERT INTO `job_apply` (`id`, `post_id`, `user_id`, `message`, `resume`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(2, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(3, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(4, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(5, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(6, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(7, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(8, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(9, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(10, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(11, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(12, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(13, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(14, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(15, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(16, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(17, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(18, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(19, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(20, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(21, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(22, 1, 1, 'rtret', 'retrter', 0, '2023-03-29 16:16:48', NULL, NULL),
(23, 2, 10, 'rtret', 'retrter', 1, '2023-03-29 16:16:48', '2023-03-30 14:09:07', NULL),
(25, 1, 1, 'sdsdsdere ewrew ewrewrewrewre', NULL, 0, '2023-03-30 05:31:46', NULL, NULL),
(26, 1, 1, 'sdsdsd', NULL, 0, '2023-03-30 05:32:03', NULL, NULL),
(27, 1, 1, 'sdsdsd', NULL, 0, '2023-03-30 05:33:30', NULL, NULL),
(28, 1, 1, 'sdsdsd', NULL, 0, '2023-03-30 05:33:48', NULL, NULL),
(29, 1, 1, 'sdsdsd', NULL, 0, '2023-03-30 05:35:05', NULL, NULL),
(32, 2, 1, NULL, 'public/upload/resume/1680459188.pdf', 0, '2023-04-02 18:13:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_balance`
--

CREATE TABLE `job_balance` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `price_id` int UNSIGNED NOT NULL,
  `receipt` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_balance`
--

INSERT INTO `job_balance` (`id`, `user_id`, `price_id`, `receipt`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 10, 2, '70', 1, '2023-03-30 17:20:16', '2023-03-30 17:22:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_category`
--

CREATE TABLE `job_category` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_category`
--

INSERT INTO `job_category` (`id`, `name`, `icon`, `language`) VALUES
(1, 'Health Care', 'bi-heart-pulse', 'En'),
(2, 'Information techoogy', 'bi bi-code-slash', 'En'),
(3, 'فن آوری اظلاعات', 'bi bi-code-slash', 'Fa'),
(4, 'سلامت', 'bi-heart-pulse', 'Fa'),
(5, 'Architecture and Construction', 'bi bi-house', 'En'),
(6, 'ساخت ساز', 'bi bi-house', 'Fa'),
(7, 'Education and Training', 'bi bi-book', 'En'),
(8, 'آموزش و تعلیمات', 'bi bi-book', 'Fa'),
(9, 'Business and Finance', 'bi bi-currency-dollar', 'En'),
(10, 'تجارت و سرمایه گزاری', 'bi bi-currency-dollar', 'Fa'),
(11, 'Government and Public Administration', 'bi bi-globe', 'En'),
(12, 'دولت  ومراکز عمومی', 'bi bi-globe', 'Fa');

-- --------------------------------------------------------

--
-- Table structure for table `job_post`
--

CREATE TABLE `job_post` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `sub_category_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `state_id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `gender` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `contract` varchar(255) NOT NULL,
  `visit` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_post`
--

INSERT INTO `job_post` (`id`, `category_id`, `sub_category_id`, `user_id`, `state_id`, `title`, `body`, `status`, `gender`, `salary`, `contract`, `visit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 10, 3, 'Viverra alique', '<p>Lorem ipsum dolor sit amet, eum an invenire cotidieque. Sit dolores singulis ad, no suscipit perpetua duo. Est et scripta tibique</p>\n\n<p>perfecto, magna salutandi interesset et eum. Eros integre an sed, duo omnis liber ut, veritus invidunt ex vis. Malorum abhorreant in usu, qui probo laudem ad.</p>\n\n<p>Ut mel vitae nostrud voluptatum, ei altera legendos eleifend pro. Iudico inermis</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>', 1, 'none', '200', 'part time', 0, '2023-03-29 16:12:36', '2023-04-03 15:57:41', NULL),
(2, 1, 3, 10, 4, ' commodo', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>', 1, 'female', '90000', 'long Term', 0, '2023-03-29 16:19:28', '2023-04-03 16:08:51', NULL),
(3, 5, 12, 10, 6, 'Consequat mauris ', '<p>Lorem ipsum dolor sit amet, eum an invenire cotidieque. Sit dolores singulis ad, no suscipit perpetua duo. Est et scripta tibique</p>\n\n<p>perfecto, magna salutandi interesset et eum. Eros integre an sed, duo omnis liber ut, veritus invidunt ex vis. Malorum abhorreant in usu, qui probo laudem ad.</p>\n\n<p>Ut mel vitae nostrud voluptatum, ei altera legendos eleifend pro. Iudico inermis</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>', 1, 'male', '60000', 'full-time', 0, '2023-04-03 16:12:16', NULL, NULL),
(4, 9, 19, 10, 5, 'eget dolor morbi ', 'Malesuada fames ac turpis egestas maecenas pharetra convallis posuere. Etiam tempor orci eu lobortis elementum nibh tellus molestie nunc. Nisi est sit amet facilisis magna. Elementum integer enim neque volutpat ac tincidunt vitae. Viverra aliquet eget sit amet. Odio ut sem nulla pharetra diam. Metus aliquam eleifend mi in nulla posuere sollicitudin aliquam. Convallis tellus id interdum velit laoreet id donec. Cras fermentum odio eu feugiat pretium nibh ipsum consequat. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Id interdum velit laoreet id donec', 1, 'female', '70000', 'full-time', 0, '2023-04-03 16:15:19', NULL, NULL),
(5, 11, 25, 1, 5, 'get lorem. Justo done', '<p>Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Phasellus vestibulum lorem sed risus. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Egestas tellus rutrum tellus pellentesque. Interdum velit laoreet id donec ultrices tincidunt. Morbi tincidunt augue interdum velit. Vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt. Pretium quam vulputate dignissim suspendisse in est ante in. Scelerisque felis imperdiet proin fermentum leo vel&nbsp;</p>', 1, 'female', '80000', 'full-time', 0, '2023-04-03 16:22:03', NULL, NULL),
(6, 11, 23, 1, 5, 'Justo done', '<p>Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Phasellus vestibulum lorem sed risus. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Egestas tellus rutrum tellus pellentesque. Interdum velit laoreet id donec ultrices tincidunt. Morbi tincidunt augue interdum velit. Vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt. Pretium quam vulputate dignissim suspendisse in est ante in. Scelerisque felis imperdiet proin fermentum leo vel&nbsp;</p>', 1, 'female', '40000', 'full-time', 0, '2023-04-03 16:22:20', '2023-04-03 16:27:17', NULL),
(7, 2, 1, 1, 5, 'get lorem. Justo done', '<p>Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Phasellus vestibulum lorem sed risus. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Egestas tellus rutrum tellus pellentesque. Interdum velit laoreet id donec ultrices tincidunt. Morbi tincidunt augue interdum velit. Vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt. Pretium quam vulputate dignissim suspendisse in est ante in. Scelerisque felis imperdiet proin fermentum leo vel&nbsp;</p>', 1, 'female', '60000', 'full-time', 0, '2023-04-03 16:23:06', '2023-04-03 16:32:07', NULL),
(12, 7, 15, 1, 4, 'business and the', '<p>Typographers of yore didn&#39;t come up with the concept of dummy copy because people thought that content is inconsequential window dressing, only there to be used by designers who can&rsquo;t be bothered to read. Lorem Ipsum is needed because words matter, a lot. Just fill up a page with draft copy about the client&rsquo;s business and they will actually read it and comment on it. They will be drawn to it, fiercely. Do it the wrong way and draft copy can derail you</p>', 1, 'female', '50000', 'full-time', 0, '2023-04-03 16:56:45', NULL, NULL),
(13, 5, 11, 1, 6, 'Quis necessitatibus', '<p>perspiciatis animi vel consequatur earum sed blanditiis blanditiis non quia quia qui quas autem eum perferendis doloribus. Est omnis voluptatem et debitis reiciendis At dicta impedit aut voluptas officia qui voluptatem amet.</p>\n\n<p>Est soluta ipsam ut Quis necessitatibus et perspiciatis minus ea similique veritatis id voluptat</p>', 1, 'none', '57000', 'part-time', 0, '2023-04-03 17:03:06', NULL, NULL),
(14, 12, 24, 1, 2, 'ی با تولید سادگی نامفهوم از صن', '<p>کنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تما</p>', 1, 'female', '50000', 'سالنه', 0, '2023-04-03 17:18:06', NULL, NULL),
(15, 3, 5, 1, 2, 'ا و متون بلکه روزنام', '<p>وع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچ</p>', 1, 'female', '40000', 'سالنه', 0, '2023-04-03 17:19:08', NULL, NULL),
(16, 10, 21, 1, 1, 'و با استفاده از طرا', '<p>&nbsp;کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایج</p>', 1, 'none', '50000', 'سالنه', 0, '2023-04-03 17:20:45', NULL, NULL),
(17, 8, 18, 1, 8, 'بیشتری را برای طراحان رایانه', '<p>رآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری</p>', 1, 'none', '70000', 'سالنه', 0, '2023-04-03 17:21:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_price`
--

CREATE TABLE `job_price` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `value` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_price`
--

INSERT INTO `job_price` (`id`, `name`, `value`, `description`, `language`, `price`) VALUES
(1, 'Bronze', 10, 'Bronze    plan', 'En', 5),
(2, 'Silver', 20, 'Silver plan', 'En', 7),
(3, 'برنزی', 10, 'پلن برونزی', 'Fa', 10),
(4, 'نقره تی', 20, 'پلن نقره ای', 'FA', 15),
(5, 'Golden', 30, 'Golden plan', 'En', 9),
(6, 'ظلایی', 30, 'پلن ظلای', 'FA', 20);

-- --------------------------------------------------------

--
-- Table structure for table `job_state`
--

CREATE TABLE `job_state` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_state`
--

INSERT INTO `job_state` (`id`, `name`, `language`) VALUES
(1, 'تهران', 'Fa'),
(2, 'ایلام', 'Fa'),
(3, 'queenland', 'En'),
(4, ' Western Australia', 'En'),
(5, 'Victoria', 'En'),
(6, 'South Australia', 'En'),
(7, 'خوزستان', 'Fa'),
(8, 'کرمانشاه', 'Fa');

-- --------------------------------------------------------

--
-- Table structure for table `job_sub_category`
--

CREATE TABLE `job_sub_category` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_sub_category`
--

INSERT INTO `job_sub_category` (`id`, `category_id`, `name`) VALUES
(1, 2, ' Developer'),
(2, 2, '3d Worker'),
(3, 1, 'Treatment'),
(4, 1, 'Care'),
(5, 3, 'توسعه دهنده '),
(6, 3, 'سه بعدی کار'),
(7, 4, 'درمانی'),
(8, 4, 'مراقبتی'),
(9, 6, 'خانه '),
(10, 6, 'آپارتمان'),
(11, 5, 'houses'),
(12, 5, 'Buildings'),
(15, 7, ' Teacher'),
(16, 7, 'Institute'),
(17, 8, 'معلم '),
(18, 8, 'آموزشگاه'),
(19, 9, 'Investment'),
(20, 9, 'Financial Manager'),
(21, 10, 'سرمایه گزاری'),
(22, 10, 'مدریت مالی'),
(23, 11, 'Chief Officer'),
(24, 12, 'مدریتی'),
(25, 11, 'Law enforcement and public safety'),
(26, 12, 'نیرو انتظامی\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `job_tag`
--

CREATE TABLE `job_tag` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `name` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_tag`
--

INSERT INTO `job_tag` (`id`, `post_id`, `name`) VALUES
(1, 1, 'get lorem. Justo done'),
(2, 1, 'get lorem. Justo done'),
(3, 2, 'Lorem ipsum'),
(4, 2, 'Lorem ipsum'),
(5, 2, 'Lorem ipsum'),
(6, 6, 'get lorem. Justo done'),
(7, 6, 'get lorem. Justo done'),
(8, 5, 'Summing up,'),
(9, 5, 'Summing up,'),
(10, 7, 'Summing up,'),
(11, 7, 'Lorem Ipsum'),
(12, 12, 'business and the'),
(13, 12, 'business and the'),
(14, 12, 'business and the'),
(15, 13, 'Quis necessitatibus'),
(16, 13, 'Quis necessitatibus'),
(17, 13, 'Quis necessitatibus'),
(18, 14, 'ی با تولید سادگی نامفهوم از صن'),
(19, 14, 'ی با تولید سادگی نامفهوم از صن'),
(20, 14, 'ی با تولید سادگی نامفهوم از صن'),
(21, 15, 'ا و متون بلکه روزنام'),
(22, 15, 'ا و متون بلکه روزنام'),
(23, 16, 'ا استفاده از طرا'),
(24, 16, 'ا استفاده از طرا'),
(25, 16, 'استفاده از طرا'),
(26, 17, 'بیشتری را برای طراحان رایانه'),
(27, 17, 'بیشتری را برای طراحان رایانه');

-- --------------------------------------------------------

--
-- Table structure for table `job_transaction`
--

CREATE TABLE `job_transaction` (
  `id` int UNSIGNED NOT NULL,
  `balance_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `job_transaction`
--

INSERT INTO `job_transaction` (`id`, `balance_id`, `user_id`, `amount`, `reference`, `authority`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 4, 10, '2', 'bbbbbbbbbb', 'aaaaaaa', 0, '2023-03-30 17:20:19', NULL, NULL),
(6, 4, 10, '2', 'bbbbbbbbbb', 'aaaaaaa', 0, '2023-03-30 17:21:07', NULL, NULL),
(7, 4, 10, '2', 'bbbbbbbbbb', 'aaaaaaa', 0, '2023-03-30 17:22:13', NULL, NULL),
(8, 4, 10, '1', 'bbbbbbbbbb', 'aaaaaaa', 0, '2023-03-30 17:22:34', NULL, NULL),
(9, 4, 10, '2', 'bbbbbbbbbb', 'aaaaaaa', 0, '2023-03-30 17:22:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE `news_category` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`id`, `name`, `language`) VALUES
(1, 'Travel', 'En'),
(2, 'مسافرت', 'Fa'),
(3, ' Entertainment', 'En'),
(4, 'سرگرمی', 'Fa'),
(28, 'Business', 'En'),
(29, 'تجاری', 'Fa'),
(30, 'Technology', 'En'),
(31, 'تکنولوژی', 'Fa'),
(32, 'Politics', 'En'),
(33, 'سیاسی', 'Fa');

-- --------------------------------------------------------

--
-- Table structure for table `news_comment`
--

CREATE TABLE `news_comment` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `reply_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `news_comment`
--

INSERT INTO `news_comment` (`id`, `post_id`, `user_id`, `reply_id`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 21, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', '2022-01-20 13:54:37', NULL, NULL),
(5, 21, 9, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-20 13:54:37', NULL, NULL),
(6, 21, 10, 4, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', '2022-01-20 13:54:37', NULL, NULL),
(7, 21, 5, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.', '2022-01-20 13:54:37', NULL, NULL),
(8, 10, 5, 4, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 15:30:15', '2022-01-27 15:30:15', NULL),
(9, 10, 4, 7, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 15:30:15', '2022-01-27 15:30:15', NULL),
(10, 20, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 09:24:22', NULL, NULL),
(11, 20, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 09:31:26', NULL, NULL),
(12, 20, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 09:45:41', NULL, NULL),
(14, 20, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a\n', '2022-01-27 09:49:36', NULL, NULL),
(15, 14, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 09:51:03', NULL, NULL),
(16, 14, 1, 0, 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.a', '2022-01-27 09:51:12', NULL, NULL),
(17, 63, 1, 0, 'erwer', '2023-03-30 04:02:42', NULL, NULL),
(18, 63, 1, 0, 'sdsdsdsd', '2023-03-30 04:07:48', NULL, NULL),
(19, 47, 1, 0, 'sadasdasdasdas', '2023-04-04 15:39:05', NULL, NULL),
(20, 47, 1, 0, 'sadsdasdasdasds', '2023-04-04 15:39:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_media`
--

CREATE TABLE `news_media` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `news_media`
--

INSERT INTO `news_media` (`id`, `post_id`, `image`, `thumbnail`, `video`) VALUES
(3, 6, 'public/upload/news/image/1648567729.jpg', 'public/upload/news/thumbnail/1648567729.jpg', ''),
(4, 7, 'public/upload/news/image/1648566222.png', 'public/upload/news/thumbnail/1648566222.png', ''),
(5, 8, 'public/upload/news/image/1648567062.jpg', 'public/upload/news/thumbnail/1648567062.jpg', ''),
(6, 9, 'public/upload/news/image/1642268273.jpg', 'public/upload/news/thumbnail/1642268273.jpg', ''),
(7, 10, 'public/upload/news/image/1648567142.jpg', 'public/upload/news/thumbnail/1648567142.jpg', ''),
(8, 11, 'public/upload/news/image/1648567516.jpg', 'public/upload/news/thumbnail/1648567516.jpg', ''),
(9, 14, 'public/upload/news/image/1642268344.jpg', 'public/upload/news/thumbnail/1642268344.jpg', ''),
(10, 15, 'public/upload/news/image/1648566647.jpg', 'public/upload/news/thumbnail/1648566647.jpg', ''),
(11, 19, 'public/upload/news/image/1648567219.jpg', 'public/upload/news/thumbnail/1648567219.jpg', ''),
(12, 20, 'public/upload/news/image/1648567385.jpg', 'public/upload/news/thumbnail/1648567385.jpg', ''),
(13, 21, 'public/upload/news/image/1648565539.png', 'public/upload/news/thumbnail/1648565539.png', ''),
(14, 22, 'public/upload/news/image/1642268654.jpg', 'public/upload/news/thumbnail/1642268654.jpg', ''),
(15, 23, 'public/upload/news/image/1648566456.jpg', 'public/upload/news/thumbnail/1648566456.jpg', ''),
(16, 24, 'public/upload/news/image/1648565468.png', 'public/upload/news/thumbnail/1648565468.png', ''),
(17, 25, 'public/upload/news/image/1649691193.jpg', 'public/upload/news/thumbnail/1649691193.jpg', ''),
(18, 26, 'public/upload/news/image/1647616903.png', 'public/upload/news/thumbnail/1647616903.png', ''),
(19, 27, 'public/upload/news/image/1647616995.png', 'public/upload/news/thumbnail/1647616995.png', ''),
(20, 28, 'public/upload/news/image/1651062852.jpg', 'public/upload/news/thumbnail/1651062852.jpg', ''),
(21, 29, 'public/upload/news/image/1651063041.jpg', 'public/upload/news/thumbnail/1651063041.jpg', ''),
(22, 30, 'public/upload/news/image/1651063055.jpg', 'public/upload/news/thumbnail/1651063055.jpg', ''),
(23, 31, 'public/upload/news/image/1651063066.jpg', 'public/upload/news/thumbnail/1651063066.jpg', ''),
(24, 32, 'public/upload/news/image/1651163570.jpg', 'public/upload/news/thumbnail/1651163570.jpg', ''),
(25, 33, 'public/upload/news/image/1651163647.jpg', 'public/upload/news/thumbnail/1651163647.jpg', ''),
(26, 34, 'public/upload/news/image/1651163703.jpg', 'public/upload/news/thumbnail/1651163703.jpg', ''),
(27, 35, 'public/upload/news/image/1651163769.jpg', 'public/upload/news/thumbnail/1651163769.jpg', ''),
(28, 36, 'public/upload/news/image/1651166441.jpg', 'public/upload/news/thumbnail/1651166441.jpg', ''),
(29, 37, 'public/upload/news/image/1651166518.jpg', 'public/upload/news/thumbnail/1651166518.jpg', ''),
(30, 38, 'public/upload/news/image/1651166594.jpg', 'public/upload/news/thumbnail/1651166594.jpg', ''),
(31, 39, 'public/upload/news/image/1651166652.jpg', 'public/upload/news/thumbnail/1651166652.jpg', ''),
(32, 40, 'public/upload/news/image/1651201849.jpg', 'public/upload/news/thumbnail/1651201849.jpg', ''),
(33, 41, 'public/upload/news/image/1651201909.jpg', 'public/upload/news/thumbnail/1651201909.jpg', ''),
(34, 42, 'public/upload/news/image/1651201966.jpg', 'public/upload/news/thumbnail/1651201966.jpg', ''),
(35, 43, 'public/upload/news/image/1651202032.jpg', 'public/upload/news/thumbnail/1651202032.jpg', ''),
(36, 44, 'public/upload/news/image/1651202429.jpg', 'public/upload/news/thumbnail/1651202429.jpg', ''),
(37, 45, 'public/upload/news/image/1651202444.jpg', 'public/upload/news/thumbnail/1651202444.jpg', ''),
(38, 46, 'public/upload/news/image/1651202461.jpg', 'public/upload/news/thumbnail/1651202461.jpg', ''),
(39, 47, 'public/upload/news/image/1651202476.jpg', 'public/upload/news/thumbnail/1651202476.jpg', ''),
(40, 48, 'public/upload/news/image/1651218580.jpg', 'public/upload/news/thumbnail/1651218580.jpg', ''),
(41, 49, 'public/upload/news/image/1651218591.jpg', 'public/upload/news/thumbnail/1651218591.jpg', ''),
(42, 50, 'public/upload/news/image/1651218600.jpg', 'public/upload/news/thumbnail/1651218600.jpg', ''),
(43, 51, 'public/upload/news/image/1651218611.jpg', 'public/upload/news/thumbnail/1651218611.jpg', ''),
(44, 52, 'public/upload/news/image/1651221884.jpg', 'public/upload/news/thumbnail/1651221884.jpg', ''),
(45, 53, 'public/upload/news/image/1651221899.jpg', 'public/upload/news/thumbnail/1651221899.jpg', ''),
(46, 54, 'public/upload/news/image/1651221913.jpg', 'public/upload/news/thumbnail/1651221913.jpg', ''),
(47, 55, 'public/upload/news/image/1651221927.jpg', 'public/upload/news/thumbnail/1651221927.jpg', ''),
(48, 56, 'public/upload/news/image/1651222074.jpg', 'public/upload/news/thumbnail/1651222074.jpg', ''),
(49, 57, 'public/upload/news/image/1651222085.jpg', 'public/upload/news/thumbnail/1651222085.jpg', ''),
(50, 58, 'public/upload/news/image/1651222112.jpg', 'public/upload/news/thumbnail/1651222112.jpg', ''),
(51, 59, 'public/upload/news/image/1651222129.jpg', 'public/upload/news/thumbnail/1651222129.jpg', ''),
(52, 60, 'public/upload/news/image/1651222313.jpg', 'public/upload/news/thumbnail/1651222313.jpg', ''),
(53, 60, 'public/upload/news/image/1651222420.jpg', 'public/upload/news/thumbnail/1651222420.jpg', ''),
(54, 61, 'public/upload/news/image/1651222430.jpg', 'public/upload/news/thumbnail/1651222430.jpg', ''),
(55, 62, 'public/upload/news/image/1651222440.jpg', 'public/upload/news/thumbnail/1651222440.jpg', ''),
(56, 63, 'public/upload/news/image/1651222451.jpg', 'public/upload/news/thumbnail/1651222451.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `news_post`
--

CREATE TABLE `news_post` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `sub_category_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `picture` varchar(255) NOT NULL,
  `visit` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `news_post`
--

INSERT INTO `news_post` (`id`, `category_id`, `sub_category_id`, `user_id`, `title`, `body`, `status`, `picture`, `visit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 3, 4, 1, 'THE TRADITIONAL WAY-1', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>', 1, 'public/upload/news/image/1648567729.jpg', 3, '2022-01-11 10:39:11', '2023-03-31 13:52:37', NULL),
(7, 4, 3, 1, 'روش سنتی', '<p>ها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال</p>\n', 1, 'public/upload/news/image/1648566222.png', 0, '2022-01-11 10:41:38', '2022-03-29 10:06:11', NULL),
(8, 3, 4, 1, 'THE TRADITIONAL WAY-2', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1648567062.jpg', 2, '2022-01-15 11:29:46', '2022-03-29 10:18:11', NULL),
(9, 3, 4, 1, 'THE TRADITIONAL WAY-3', '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Neque at numquam, asperiores aut praesentium facilis ratione!</p>\n', 1, 'public/upload/news/image/1642268273.jpg', 1, '2022-01-15 11:30:51', '2022-03-29 10:12:01', NULL),
(10, 1, 4, 1, 'THE TRADITIONAL WAY-4', '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Neque at numquam, asperiores aut praesentium facilis ratione!</p>\n', 1, 'public/upload/news/image/1648567142.jpg', 14, '2022-01-15 18:32:02', '2022-03-29 10:19:17', '2022-01-15 18:32:02'),
(11, 1, 4, 1, 'THE TRADITIONAL WAY-5', '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Neque at numquam, asperiores aut praesentium facilis ratione!</p>\n', 1, 'public/upload/news/image/1648567516.jpg', 3, '2022-01-15 18:32:02', '2022-03-29 10:25:32', '2022-01-15 18:32:02'),
(14, 3, 4, 1, 'THE TRADITIONAL WAY-6', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1642268344.jpg', 7, '2022-01-15 18:35:23', '2022-03-29 10:11:33', '2022-01-15 18:35:23'),
(15, 3, 4, 1, 'THE TRADITIONAL WAY-7', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1648566647.jpg', 9, '2022-01-15 18:35:23', '2022-03-29 10:11:04', '2022-01-15 18:35:23'),
(19, 3, 4, 1, 'THE TRADITIONAL WAY-8', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1648567219.jpg', 4, '2022-01-15 18:36:07', '2022-03-29 10:20:39', '2022-01-15 18:36:07'),
(20, 3, 4, 1, 'THE TRADITIONAL WAY-9', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1648567385.jpg', 4, '2022-01-15 18:36:08', '2022-03-29 10:23:33', '2022-01-15 18:36:08'),
(21, 3, 4, 1, 'THE TRADITIONAL WAY-10', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1648565539.png', 6, '2022-01-15 18:36:08', '2022-03-29 09:52:51', '2022-01-15 18:36:08'),
(22, 4, 3, 1, 'روش سنتی -2', '<p>ها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال<br />\n&nbsp;</p>\n', 1, 'public/upload/news/image/1642268654.jpg', 2, '2022-01-15 11:43:50', '2022-03-29 10:00:56', NULL),
(23, 4, 3, 1, 'روش سنتی -3', '<p>ها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال<br />\n<br />\n&nbsp;</p>\n', 1, 'public/upload/news/image/1648566456.jpg', 11, '2022-01-15 11:49:40', '2022-03-29 10:08:16', NULL),
(24, 3, 4, 1, 'THE TRADITIONAL WAY-11', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1648565468.png', 4, '2022-02-02 21:35:58', '2022-03-29 09:51:32', NULL),
(25, 3, 4, 1, 'THE TRADITIONAL WAY-12', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followed no o</p>\n', 1, 'public/upload/news/image/1649691193.jpg', 5, '2022-02-02 21:36:51', '2022-04-11 10:33:32', NULL),
(26, 3, 4, 1, 'THE TRADITIONAL WAY-13', '<p>asture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected he me. Engaged its was evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began of cause an scale. Subjects he prospect elegance followe</p>\n', 1, 'public/upload/news/image/1647616903.png', 2, '2022-02-02 21:37:40', '2022-03-23 12:31:37', NULL),
(27, 2, 6, 1, 'روش سنتی -4', '<p>&nbsp;تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اص</p>\n', 0, 'public/upload/news/image/1647616995.png', 3, '2022-03-18 09:48:31', '2022-03-29 10:00:18', NULL),
(28, 3, 1, 1, 'American live music lorem ipsum dolor sit amet consectetur', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proi</p>\n', 0, 'public/upload/news/image/1651062852.jpg', 8, '2022-04-27 07:31:41', '2022-04-27 07:34:53', NULL),
(29, 3, 4, 1, 'IMG Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proi</p>\n', 1, 'public/upload/news/image/1651063041.jpg', 8, '2022-04-27 07:35:55', '2022-04-27 07:38:10', NULL),
(30, 3, 4, 1, 'Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proi</p>\n', 1, 'public/upload/news/image/1651063055.jpg', 8, '2022-04-27 07:36:37', '2022-04-27 07:38:01', NULL),
(31, 3, 1, 1, ' Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proi</p>\n', 1, 'public/upload/news/image/1651063066.jpg', 7, '2022-04-27 07:36:58', '2022-04-27 07:37:55', NULL),
(32, 1, 50, 1, 'You wish lorem ipsum dolor sit amet consectetur', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651163570.jpg', 2, '2022-04-28 11:30:46', '2022-04-28 11:33:00', NULL),
(33, 1, 50, 1, ' Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651163647.jpg', 0, '2022-04-28 11:33:38', '2022-04-28 11:34:13', NULL),
(34, 1, 5, 1, 'Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651163703.jpg', 4, '2022-04-28 11:34:43', '2022-04-28 11:35:16', NULL),
(35, 1, 5, 1, ' Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651163769.jpg', 3, '2022-04-28 11:35:49', '2022-04-28 11:36:14', NULL),
(36, 28, 52, 1, 'Bitcoin lorem ipsum dolor sit amet consectetur', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651166441.jpg', 0, '2022-04-28 12:19:57', '2022-04-28 12:20:50', NULL),
(37, 28, 52, 1, 'Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651166518.jpg', 0, '2022-04-28 12:21:21', '2022-04-28 12:22:11', NULL),
(38, 28, 49, 1, 'Donec metus orci, malesuada et lectus vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651166594.jpg', 1, '2022-04-28 12:22:41', '2022-04-28 12:23:25', NULL),
(39, 28, 49, 1, 'Lorem ipsum dolor sit amet, consectetur a', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt</p>\n', 0, 'public/upload/news/image/1651166652.jpg', 0, '2022-04-28 12:23:55', '2022-04-28 12:24:25', NULL),
(40, 32, 43, 1, ' fugiat nulla pariatur. Excepteur ', '<p>um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt i</p>\n', 0, 'public/upload/news/image/1651201849.jpg', 4, '2022-04-28 22:10:10', '2022-04-28 22:10:58', NULL),
(41, 32, 43, 1, 'ulla pariatur. Excepteur sint o', '<p>um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt i</p>\n', 0, 'public/upload/news/image/1651201909.jpg', 0, '2022-04-28 22:11:37', '2022-04-28 22:11:56', NULL),
(42, 32, 42, 1, 'ullamco laboris nisi ut aliqui', '<p>um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt i</p>\n', 0, 'public/upload/news/image/1651201966.jpg', 0, '2022-04-28 22:12:35', '2022-04-28 22:12:58', NULL),
(43, 32, 42, 1, 'cupidatat non proident, sunt i', '<p>um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt i</p>\n', 0, 'public/upload/news/image/1651202032.jpg', 1, '2022-04-28 22:13:36', '2022-04-28 22:14:07', NULL),
(44, 30, 54, 1, 'sit amet, consectetur adipiscing eli', '<p>um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt i</p>\n', 0, 'public/upload/news/image/1651202429.jpg', 0, '2022-04-28 22:18:27', '2022-04-28 22:22:02', NULL),
(45, 30, 54, 1, 'um dolor sit amet', '<p>um dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt i</p>\n', 0, 'public/upload/news/image/1651202444.jpg', 2, '2022-04-28 22:18:57', '2022-04-28 22:21:45', NULL),
(46, 30, 46, 1, 'us. Risus viverra adipiscin', '<p>acus. Risus viverra adipiscing at in. Viverra nibh cras pulvinar mattis. Gravida in fermentum et sollicitudin ac orci phasellus. Est ultricies integer quis auctor elit sed vulputate mi. Sit amet consectetur adipiscing elit duis. Sed vulputate odio ut enim blandit. Massa sed elementum tempus egestas sed sed risus pretium quam. Pellentesque elit ullamcorper</p>\n', 0, 'public/upload/news/image/1651202461.jpg', 102, '2022-04-28 22:19:36', '2022-04-28 22:21:36', NULL),
(47, 30, 46, 1, 'acus. Risus viverra adipiscing at in. Viverra nib', '<p>acus. Risus viverra adipiscing at in. Viverra nibh cras pulvinar mattis. Gravida in fermentum et sollicitudin ac orci phasellus. Est ultricies integer quis auctor elit sed vulputate mi. Sit amet consectetur adipiscing elit duis. Sed vulputate odio ut enim blandit. Massa sed elementum tempus egestas sed sed risus pretium quam. Pellentesque elit ullamcorper</p>\n', 0, 'public/upload/news/image/1651202476.jpg', 104, '2022-04-28 22:20:05', '2022-04-28 22:21:26', NULL),
(48, 33, 45, 1, 'قلم‌ها و اندازه‌بندی‌ها چگونه در نظر گرفته', '<p>معمولا طراحان گرافیک برای صفحه&zwnj;آرایی، نخست از متن&zwnj;های آزمایشی و بی&zwnj;معنی استفاده می&zwnj;کنند تا صرفا به مشتری یا صاحب کار خود نشان دهند</p>\n', 0, 'public/upload/news/image/1651218580.jpg', 0, '2022-04-29 02:47:52', '2022-04-29 02:50:35', NULL),
(49, 33, 45, 1, 'قلم‌ها و اندازه‌بندی‌ها چگونه در نظر گرفته', '<p>که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می&zwnj;باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه&zwnj;آرایی می&zwnj;کنند تا مرحله طراحی و صفحه&zwnj;بندی را به پایان برند.</p>\n', 0, 'public/upload/news/image/1651218591.jpg', 0, '2022-04-29 02:48:34', '2022-04-29 02:50:44', NULL),
(50, 33, 44, 1, 'آنها با استفاده از محتویات ساختگی،', '<p>که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می&zwnj;باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه&zwnj;آرایی می&zwnj;کنند تا مرحله طراحی و صفحه&zwnj;بندی را به پایان برند.</p>\n', 0, 'public/upload/news/image/1651218600.jpg', 0, '2022-04-29 02:48:59', '2022-04-29 02:50:52', NULL),
(51, 33, 44, 1, 'رافیکی خود را صفحه‌آرایی می‌کنند ', '<p>که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می&zwnj;باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه&zwnj;آرایی می&zwnj;کنند تا مرحله طراحی و صفحه&zwnj;بندی را به پایان برند.</p>\n', 0, 'public/upload/news/image/1651218611.jpg', 0, '2022-04-29 02:49:26', '2022-04-29 02:51:02', NULL),
(52, 31, 55, 1, 'ی را برای طراحان رایانه ای ', '<p>ای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ&nbsp;</p>\n', 0, 'public/upload/news/image/1651221884.jpg', 0, '2022-04-29 03:42:47', '2022-04-29 03:49:46', NULL),
(53, 31, 55, 1, 'ی را برای طراحان رایانه ای ع', '<p>ای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ&nbsp;</p>\n', 0, 'public/upload/news/image/1651221899.jpg', 0, '2022-04-29 03:43:07', '2022-04-29 03:49:58', NULL),
(54, 31, 47, 1, 'موجود در ارائه راهکارها و ش', '<p>موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>\n', 0, 'public/upload/news/image/1651221913.jpg', 0, '2022-04-29 03:43:40', '2022-04-29 03:50:07', NULL),
(55, 31, 47, 1, 'موجود در ارائه راهکارها و ش', '<p>موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>\n', 0, 'public/upload/news/image/1651221927.jpg', 0, '2022-04-29 03:43:59', '2022-04-29 03:50:18', NULL),
(56, 29, 53, 1, 'موجود در ارائه راهکارها و ش', '<p>موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>\n', 0, 'public/upload/news/image/1651222074.jpg', 3, '2022-04-29 03:46:10', '2022-04-29 03:51:03', NULL),
(57, 29, 53, 1, 'موجود در ارائه راهکارها و ش', '<p>موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>\n', 0, 'public/upload/news/image/1651222085.jpg', 1, '2022-04-29 03:46:27', '2022-04-29 03:50:36', NULL),
(58, 29, 48, 1, ' شصت و سه درصد ', '<p>موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.</p>\n', 0, 'public/upload/news/image/1651222112.jpg', 5, '2022-04-29 03:46:55', '2022-04-29 03:50:52', NULL),
(59, 29, 48, 1, ' شصت و سه درصد ', '<p>&nbsp;و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی</p>\n', 0, 'public/upload/news/image/1651222129.jpg', 0, '2022-04-29 03:47:29', '2022-04-29 03:50:44', NULL),
(60, 4, 2, 1, 'یط سخت تایپ به پایان ', '<p>&nbsp;و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی</p>\n', 0, 'public/upload/news/image/1651222313.jpg', 7, '2022-04-29 03:51:45', '2022-04-29 03:51:59', NULL),
(61, 2, 51, 1, 'یط سخت تایپ به پایان ', '<p>&nbsp;و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی</p>\n', 0, 'public/upload/news/image/1651222430.jpg', 0, '2022-04-29 03:52:22', '2022-04-29 03:54:36', NULL),
(62, 2, 6, 1, '      و شرایط سخت تایپ به پایان رسد و                                                                                                                                                                    ', '<p>&nbsp;و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی</p>\n', 0, 'public/upload/news/image/1651222440.jpg', 0, '2022-04-29 03:52:57', '2022-04-29 03:54:26', NULL),
(63, 2, 6, 1, 'و شرایط سخت تایپ به پایان رسد و', '<p>درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگ</p>\n', 0, 'public/upload/news/image/1651222451.jpg', 0, '2022-04-29 03:53:25', '2022-04-29 03:54:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_sub_category`
--

CREATE TABLE `news_sub_category` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `news_sub_category`
--

INSERT INTO `news_sub_category` (`id`, `category_id`, `name`) VALUES
(1, 3, 'BirthDay'),
(2, 4, 'تولد'),
(3, 4, 'سال نو'),
(4, 3, 'New  Year'),
(5, 1, 'food'),
(6, 2, 'غذا'),
(42, 32, 'presidential '),
(43, 32, 'congress'),
(44, 33, 'ریاست جمهوری'),
(45, 33, 'کنگره'),
(46, 30, 'Hight Teck'),
(47, 31, 'های تک'),
(48, 29, 'سهام بورس'),
(49, 28, 'Stock Market'),
(50, 1, 'advancture'),
(51, 2, 'ماجراجوی'),
(52, 28, 'Marketing'),
(53, 29, 'بازارها'),
(54, 30, 'Space'),
(55, 31, 'فضایی');

-- --------------------------------------------------------

--
-- Table structure for table `request_category`
--

CREATE TABLE `request_category` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `request_category`
--

INSERT INTO `request_category` (`id`, `name`, `language`) VALUES
(1, 'رزرو', 'Fa'),
(2, 'Reserve', 'En');

-- --------------------------------------------------------

--
-- Table structure for table `request_post`
--

CREATE TABLE `request_post` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `request_post`
--

INSERT INTO `request_post` (`id`, `user_id`, `category_id`, `title`, `status`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'orem ipsum', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fug', '2021-08-24 14:38:19', '2021-08-24 14:39:21', '0000-00-00 00:00:00'),
(3, 6, 2, ' incididunt ut labore et dolore', 0, '<p>te irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserun</p>\n', '2022-02-17 01:00:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `request_reply`
--

CREATE TABLE `request_reply` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reply_id` int NOT NULL,
  `message` varchar(300) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `request_reply`
--

INSERT INTO `request_reply` (`id`, `post_id`, `user_id`, `reply_id`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 0, ' incididunt ut labore et dolore', '2021-08-24 15:02:55', '2021-09-02 13:05:40', '0000-00-00 00:00:00'),
(2, 1, 1, 0, ' incididunt ut labore et dolore', '2021-09-02 13:05:02', '2021-09-02 13:05:48', '0000-00-00 00:00:00'),
(3, 1, 1, 0, ' incididunt ut labore et dolore', '2021-09-02 13:05:28', '2021-09-02 13:06:11', '0000-00-00 00:00:00'),
(4, 1, 1, 0, ' incididunt ut labore et dolore', '2021-09-02 13:08:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 1, 0, ' incididunt ut labore et dolore', '2021-09-02 13:08:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `key`, `value`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'latitude', '33.6350', 'latitude of  market palce', 1, '2021-12-26 19:28:38', '2021-12-26 19:28:38', '2021-12-26 19:28:38'),
(2, 'longitude', '46.4153', 'logitude of market palce', 1, '2021-09-02 10:20:14', '2021-09-02 13:03:39', NULL),
(3, 'toman', '30000', 'exchange rate toman to dollar', 1, '1998-06-09 00:00:00', NULL, NULL),
(4, 'euro', '1.5', 'exchange uro to dollar', 1, '2005-01-03 00:00:00', NULL, NULL),
(5, 'instagram', '8 AM  -  10 PM', ' time work', 1, '2022-01-11 19:55:33', '2022-01-11 19:55:33', '2022-01-11 19:55:33'),
(6, 'facebook', '8 AM  -  10 PM', ' time work', 1, '2022-01-11 19:55:33', '2022-01-11 19:55:33', '2022-01-11 19:55:33'),
(7, 'twitter', '8 AM  -  10 PM', ' time work', 1, '2022-01-11 19:55:33', '2022-01-11 19:55:33', '2022-01-11 19:55:33'),
(8, 'googlePlus', '8 AM  -  10 PM', ' time work', 1, '2022-01-11 19:55:33', '2022-01-11 19:55:33', '2022-01-11 19:55:33'),
(12, 'phone', '+987456145', '', 1, '2022-01-11 20:09:14', '2022-01-11 20:09:14', '2022-01-11 20:09:14'),
(13, 'address', 'iran ilam st mother', '', 1, '2022-01-11 20:09:14', '2022-01-11 20:09:14', '2022-01-11 20:09:14'),
(14, 'email', 'example@emaple.com', '', 1, '2022-01-11 20:09:14', '2022-01-11 20:09:14', '2022-01-11 20:09:14'),
(15, 'linkLocation', '46.25038146972656%2C33.54740371504616%2C46.57173156738282%2C33.72405411343989&amp;layer=mapnik&amp;marker=33.63580999717037%2C46.41097060000004', 'link to your location', 1, '2022-01-20 15:57:57', '2022-01-20 15:57:57', '2022-01-20 15:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `active_token` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `active_expires` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'public/upload/profile/default-avatar.jpg',
  `gender` set('male','female') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'N/A',
  `city` varchar(255) NOT NULL DEFAULT 'N/A',
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bio` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `reset_token`, `reset_at`, `reset_expires`, `active_token`, `status`, `status_message`, `active`, `active_expires`, `created_at`, `updated_at`, `deleted_at`, `first_name`, `last_name`, `image`, `gender`, `birthday`, `country`, `city`, `address`, `phone`, `title`, `bio`) VALUES
(1, 'admin@admin.com', 'admin', '$2y$10$Nh1NK7LT3SuF5xKSlGuC/OYf0NCupHe3r6fMQMDsfcukbxVWp6jly', NULL, NULL, NULL, NULL, '0', NULL, 1, '0000-00-00 00:00:00', '2022-01-01 22:32:29', '2023-08-21 12:12:49', NULL, 'mark', 'antony', 'public/upload/profile/default-avatar.jpg', 'male', '0000-00-00', 'iran', 'ilam', 'perozi', '0918843100', 'mater 3d Designer', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus fuga ratione molestiae unde provident quibusdam sunt, doloremque. Error omnis mollitia, ex dolor sequi. Et, quibusdam excepturi. Animi assumenda, consequuntur dolorum odio sit inventore aliquid, optio fugiat alias. Veritatis minima, dicta quam repudiandae repellat non sit, distinctio, impedit, expedita tempora numquam?'),
(3, 'jijo99@gmail.com', 'jijo99', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, '1657778bbbca032c105bb2424c278797', '0', NULL, 1, '0000-00-00 00:00:00', '2021-08-28 15:37:32', '2021-08-28 15:37:32', NULL, 'admam', 'smith', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'N/A', 'N/A', '', '0918843200', 'mater 3d Designer', ''),
(4, 'jijou00@gmail.com', 'god773', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, 'd5e152607f8cc7279ec6e1484252f9fe', '1', NULL, 1, '0000-00-00 00:00:00', '2021-08-28 15:40:52', '2021-08-28 15:40:52', NULL, 'kevin', 'bad', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'N/A', 'N/A', '', '0918843300', '', ''),
(5, 'jijouuyy@gmail.comy', 'opse33', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, '624e65f9b84c54c1658493ef905d4560', '0', NULL, 1, '0000-00-00 00:00:00', '2021-08-28 15:55:05', '2021-08-28 15:55:05', NULL, 'johon', 'copper', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'N/A', 'N/A', '', '0918843400', '', ''),
(6, 'hiking22@gmail.comy', 'flash100', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, '00179a8eb812fe5d69e9d3c0cda1021e', '0', NULL, 1, '0000-00-00 00:00:00', '2021-08-28 15:56:40', NULL, NULL, 'david', 'ryan', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'N/A', 'N/A', '', '0918843500', '', ''),
(7, 'developpers@gmail.com', 'hirzon44', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, NULL, '0', NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, 'rob', 'stark', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'N/A', 'N/A', '', '0918846100', '', ''),
(8, 'yaasiii44@gmail.com', 'skypalizban', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, NULL, '0', NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, 'sara', 'dorti', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'N/A', 'N/A', '', '0918843700', '', ''),
(9, 'cormier.laverna@yahoo.com', 'tbashirian', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, NULL, NULL, NULL, 1, '0000-00-00 00:00:00', NULL, NULL, NULL, 'Retha', 'Erdman', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'Montserrat', 'South Cornellmouth', '6775 Agustina Hill\nNew Cletus, NH 28496', '(820) 265-4', '', ''),
(10, 'maggio.margarita@nicolas.info', 'qhuel', '$2y$10$bzxjafXzNQse9FZyvNvtBe2h9I8yUYWYWbJ0w7lkwxfQTOTEdZWam', NULL, NULL, NULL, NULL, '0', NULL, 1, '0000-00-00 00:00:00', NULL, '2023-03-30 11:14:36', NULL, 'Maud', 'Homenick', 'public/upload/profile/default-avatar.jpg', '', '0000-00-00', 'Djibouti', 'Port Ludwig', '8732 Graciela Hollow\nMarianport, UT 09855', '1-440-295-8', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `view_media`
--

CREATE TABLE `view_media` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `view_option_id` int UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `view_media`
--

INSERT INTO `view_media` (`id`, `title`, `language`, `description`, `view_option_id`, `path`) VALUES
(43, 'Your Lightning Fast Recruitment', 'En', 'Facere distinctio molestiae nisi fugit tenetur repellat non praesentium nesciunt optio quis sit odio nemo quisquam. eius quos reiciendis eum vel eum voluptatem eum maiores eaque id optio ullam occaecati odio est possimus vel reprehenderit', 4, 'public/upload/view/image/16803625401.svg'),
(45, 'پیدا کردن سریع نیرو', 'Fa', 'دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 4, 'public/upload/view/image/16803626241.svg'),
(46, 'about us', 'En', 'Dolor iure expedita id fuga asperiores qui sunt consequatur minima. Quidem voluptas deleniti. Sit quia molestiae quia quas qui magnam itaque veritatis dolores. Corrupti totam ut eius incidunt reiciendis veritatis asperiores placeat.', 6, 'public/upload/view/image/16803628721.png'),
(47, 'درباره ما', 'Fa', 'ا هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی', 6, 'public/upload/view/image/16803629341.png');

-- --------------------------------------------------------

--
-- Table structure for table `view_option`
--

CREATE TABLE `view_option` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `view_option`
--

INSERT INTO `view_option` (`id`, `name`) VALUES
(4, 'banner'),
(6, 'about');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `ip`, `country`, `city`, `os`, `lat`, `lang`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1.1.1.1.', 'n/a', 'n/a', 'Unknown Platform', 'n/a', 'n/a', '2021-08-23 15:06:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '::2', 'n/a', 'n/a', 'iOS', 'n/a', 'n/a', '2022-02-28 18:53:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '127.0.0.1', 'n/a', 'n/a', 'Windows 10', 'n/a', 'n/a', '2022-04-24 04:11:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '127.0.0.1', 'n/a', 'n/a', 'PostmanRuntime/7.29.2', 'n/a', 'n/a', '2023-04-02 03:52:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_media`
--
ALTER TABLE `advertisement_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_media_advertisement_id_foreign` (`advertisement_id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`login`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `chat_private`
--
ALTER TABLE `chat_private`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_private_user_sender_id_foreign` (`user_sender_id`),
  ADD KEY `chat_private_user_receiver_id_foreign` (`user_receiver_id`);

--
-- Indexes for table `chat_private_media`
--
ALTER TABLE `chat_private_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_private_media_chat_private_id_foreign` (`chat_private_id`);

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_room_group_id_foreign` (`group_id`),
  ADD KEY `chat_room_user_id_foreign` (`user_id`);

--
-- Indexes for table `chat_room_media`
--
ALTER TABLE `chat_room_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_room_media_chat_room_id_foreign` (`chat_room_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_media`
--
ALTER TABLE `contact_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_file_contact_id_foreign` (`contact_id`);

--
-- Indexes for table `job_apply`
--
ALTER TABLE `job_apply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `job_balance`
--
ALTER TABLE `job_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `job_category`
--
ALTER TABLE `job_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `job_post_ibfk_3` (`sub_category_id`);

--
-- Indexes for table `job_price`
--
ALTER TABLE `job_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_state`
--
ALTER TABLE `job_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_sub_category`
--
ALTER TABLE `job_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `job_tag`
--
ALTER TABLE `job_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `job_transaction`
--
ALTER TABLE `job_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `balance_id` (`balance_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_comment`
--
ALTER TABLE `news_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_comment_news_post_id_foreign` (`post_id`),
  ADD KEY `news_comment_user_id_foreign` (`user_id`);

--
-- Indexes for table `news_media`
--
ALTER TABLE `news_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_media_news_post_id_foreign` (`post_id`);

--
-- Indexes for table `news_post`
--
ALTER TABLE `news_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_post_user_id_foreign` (`user_id`),
  ADD KEY `sub_category_id` (`sub_category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `news_sub_category`
--
ALTER TABLE `news_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_sub_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `request_category`
--
ALTER TABLE `request_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_post`
--
ALTER TABLE `request_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_reply`
--
ALTER TABLE `request_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `view_media`
--
ALTER TABLE `view_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_media_view_option_id_foreign` (`view_option_id`);

--
-- Indexes for table `view_option`
--
ALTER TABLE `view_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `advertisement_media`
--
ALTER TABLE `advertisement_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_private`
--
ALTER TABLE `chat_private`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat_private_media`
--
ALTER TABLE `chat_private_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `chat_room_media`
--
ALTER TABLE `chat_room_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_media`
--
ALTER TABLE `contact_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_apply`
--
ALTER TABLE `job_apply`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `job_balance`
--
ALTER TABLE `job_balance`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `job_price`
--
ALTER TABLE `job_price`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `job_state`
--
ALTER TABLE `job_state`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `job_sub_category`
--
ALTER TABLE `job_sub_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `job_tag`
--
ALTER TABLE `job_tag`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `job_transaction`
--
ALTER TABLE `job_transaction`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `news_comment`
--
ALTER TABLE `news_comment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `news_media`
--
ALTER TABLE `news_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `news_post`
--
ALTER TABLE `news_post`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `news_sub_category`
--
ALTER TABLE `news_sub_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `request_category`
--
ALTER TABLE `request_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request_post`
--
ALTER TABLE `request_post`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request_reply`
--
ALTER TABLE `request_reply`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `view_media`
--
ALTER TABLE `view_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `view_option`
--
ALTER TABLE `view_option`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement_media`
--
ALTER TABLE `advertisement_media`
  ADD CONSTRAINT `advertisement_media_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisement` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_private`
--
ALTER TABLE `chat_private`
  ADD CONSTRAINT `chat_private_user_receiver_id_foreign` FOREIGN KEY (`user_receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_private_user_sender_id_foreign` FOREIGN KEY (`user_sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_private_media`
--
ALTER TABLE `chat_private_media`
  ADD CONSTRAINT `chat_private_media_chat_private_id_foreign` FOREIGN KEY (`chat_private_id`) REFERENCES `chat_private` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD CONSTRAINT `chat_room_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`),
  ADD CONSTRAINT `chat_room_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_room_media`
--
ALTER TABLE `chat_room_media`
  ADD CONSTRAINT `chat_room_media_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_media`
--
ALTER TABLE `contact_media`
  ADD CONSTRAINT `contact_file_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_apply`
--
ALTER TABLE `job_apply`
  ADD CONSTRAINT `job_apply_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `job_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_apply_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_balance`
--
ALTER TABLE `job_balance`
  ADD CONSTRAINT `job_balance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_balance_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `job_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_post`
--
ALTER TABLE `job_post`
  ADD CONSTRAINT `job_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_post_ibfk_3` FOREIGN KEY (`sub_category_id`) REFERENCES `job_sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_post_ibfk_4` FOREIGN KEY (`state_id`) REFERENCES `job_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_sub_category`
--
ALTER TABLE `job_sub_category`
  ADD CONSTRAINT `job_sub_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_tag`
--
ALTER TABLE `job_tag`
  ADD CONSTRAINT `job_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `job_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_transaction`
--
ALTER TABLE `job_transaction`
  ADD CONSTRAINT `job_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_transaction_ibfk_2` FOREIGN KEY (`balance_id`) REFERENCES `job_balance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_comment`
--
ALTER TABLE `news_comment`
  ADD CONSTRAINT `news_comment_news_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `news_post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_comment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_media`
--
ALTER TABLE `news_media`
  ADD CONSTRAINT `news_media_news_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `news_post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_post`
--
ALTER TABLE `news_post`
  ADD CONSTRAINT `news_post_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `news_sub_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_sub_category`
--
ALTER TABLE `news_sub_category`
  ADD CONSTRAINT `news_sub_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `view_media`
--
ALTER TABLE `view_media`
  ADD CONSTRAINT `views_media_view_option_id_foreign` FOREIGN KEY (`view_option_id`) REFERENCES `view_option` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
