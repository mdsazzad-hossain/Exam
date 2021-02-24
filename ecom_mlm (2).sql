-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 07:35 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_mlm`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ad_managers`
--

CREATE TABLE `ad_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `pur_price` decimal(8,2) DEFAULT NULL,
  `promo_price` decimal(8,2) DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `product_id`, `size`, `sale_price`, `pur_price`, `promo_price`, `discount`, `qty`, `stock`, `created_at`, `updated_at`) VALUES
(1, 2, 'x', '500.00', '400.00', '520.00', NULL, 10, 10, '2021-02-08 08:09:44', '2021-02-08 08:09:44'),
(2, 3, '250ml', '250.00', '200.00', '270.00', NULL, 10, 10, '2021-02-13 05:59:10', '2021-02-13 05:59:10'),
(3, 1, 'x', '250.00', '200.00', '270.00', NULL, NULL, 10, '2021-02-13 05:59:41', '2021-02-15 07:23:30'),
(4, 4, '250ml', '500.00', '400.00', '520.00', NULL, 10, 10, '2021-02-13 06:01:13', '2021-02-13 06:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `banars`
--

CREATE TABLE `banars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banars`
--

INSERT INTO `banars` (`id`, `image`, `product_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '872924547.jpg', NULL, '', 1, '2021-02-01 12:18:08', '2021-02-01 12:18:08'),
(2, '2051912518.jpg', NULL, '', 1, '2021-02-01 12:18:33', '2021-02-01 12:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `br_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `slug`, `br_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SAMSUNG', 'samsung', 'VALA bRAND', 1, '2021-02-02 12:17:36', '2021-02-02 12:17:36'),
(2, 'lotto', 'lotto', 'vala brand', 1, '2021-02-02 12:18:41', '2021-02-02 12:18:41'),
(3, 'Ponds', 'ponds', 'vala brand', 1, '2021-02-02 12:18:59', '2021-02-02 12:18:59'),
(4, 'Kappa', 'kappa', 'vala brand', 1, '2021-02-02 12:19:21', '2021-02-02 12:19:21'),
(5, 'Polo', 'polo', 'vala brand', 1, '2021-02-02 12:19:35', '2021-02-02 12:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `profit` decimal(10,2) DEFAULT NULL,
  `shipp_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `explor` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `slug`, `cover`, `explor`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Fashion', 'mens-fashion', '1920764271.jpg', 0, 1, '2021-02-02 12:10:46', '2021-02-02 12:10:46'),
(2, 'Health & Beauty', 'health-beauty', '542661288.png', 0, 1, '2021-02-02 12:11:14', '2021-02-02 12:11:14'),
(3, 'Electronics', 'electronics', '1043258948.jpg', 0, 1, '2021-02-02 12:11:30', '2021-02-02 12:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `child_categories`
--

CREATE TABLE `child_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `child_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_categories`
--

INSERT INTO `child_categories` (`id`, `category_id`, `child_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'T-shirt', 't-shirt', 1, '2021-02-02 12:13:00', '2021-02-02 12:13:00'),
(2, 1, 'Shoes', 'shoes', 1, '2021-02-02 12:13:10', '2021-02-02 12:13:10'),
(3, 2, 'Skin Care', 'skin-care', 1, '2021-02-02 12:13:20', '2021-02-02 12:13:20'),
(4, 2, 'Hair Care', 'hair-care', 1, '2021-02-02 12:13:28', '2021-02-02 12:13:28'),
(5, 3, 'Mobile', 'mobile', 1, '2021-02-02 12:13:34', '2021-02-02 12:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `commisions`
--

CREATE TABLE `commisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start` decimal(10,2) DEFAULT NULL,
  `end` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commision_details`
--

CREATE TABLE `commision_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1654524625, 'user', 2, 1, 'test', '8037d938-43f0-44e6-8b8a-704ae4f96068.jpg,fresh.jpg', 1, '2021-02-08 06:01:36', '2021-02-08 07:29:13'),
(1696226380, 'user', 1, 3, 'hellw holder1', NULL, 1, '2021-02-08 08:05:09', '2021-02-08 08:06:19'),
(1913019025, 'user', 1, 2, 'hellw holder..', NULL, 1, '2021-02-08 05:55:09', '2021-02-08 05:58:30'),
(2012640618, 'user', 1, 3, 'do you like it', 'cc23c1b2-d2ab-4919-98e8-22b34462afdf.jpeg,apex.jpeg', 1, '2021-02-08 08:05:26', '2021-02-08 08:06:19'),
(2331362417, 'user', 1, 2, 'madhu tmi ki atta khaw..', 'd76dd442-66e1-4a80-a6cc-2c1ee3739858.jpg,atta banar.jpg', 1, '2021-02-08 05:56:51', '2021-02-08 05:58:30');

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
(4, '2020_10_05_133820_create_banars_table', 1),
(5, '2020_10_05_164645_create_categories_table', 1),
(6, '2020_10_05_165019_create_child_categories_table', 1),
(7, '2020_10_05_165129_create_sub_child_categories_table', 1),
(8, '2020_10_07_111132_create_brands_table', 1),
(9, '2020_10_07_111207_create_products_table', 1),
(10, '2020_10_07_111238_create_product_avatars_table', 1),
(11, '2020_10_10_114048_create_ad_managers_table', 1),
(12, '2020_10_20_102950_create_wish_lists_table', 1),
(13, '2020_10_20_103232_create_carts_table', 1),
(14, '2020_10_22_151618_create_orders_table', 1),
(15, '2020_10_25_172102_create_order_details_table', 1),
(16, '2020_11_15_120715_create_newsletter_subscribers_table', 1),
(17, '2020_11_16_115621_create_attributes_table', 1),
(18, '2020_11_16_151041_create_settings_table', 1),
(21, '2020_12_17_162330_create_commisions_table', 1),
(24, '2020_12_22_124401_create_abouts_table', 1),
(25, '2020_12_22_124656_create_contacts_table', 1),
(26, '2021_02_01_151327_create_share_holder_relations_table', 1),
(27, '2020_12_08_154738_create_share_holders_table', 2),
(28, '2020_12_09_120549_create_nominees_table', 2),
(29, '2020_12_19_150442_create_share_holder_payment_histories_table', 2),
(31, '2020_12_19_112438_create_commision_details_table', 3),
(32, '2019_09_22_192348_create_messages_table', 4),
(33, '2019_10_16_211433_create_favorites_table', 4),
(34, '2019_10_18_223259_add_avatar_to_users', 4),
(35, '2019_10_20_211056_add_messenger_color_to_users', 4),
(36, '2019_10_22_000539_add_dark_mode_to_users', 4),
(37, '2019_10_25_214038_add_active_status_to_users', 4),
(38, '2021_02_13_153124_create_share_holder_levels_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nominees`
--

CREATE TABLE `nominees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `share_holder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nominee_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_nid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_image1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `total_emoney` decimal(8,2) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible_for_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `phone`, `amount`, `profit`, `total_emoney`, `address`, `delivery_status`, `status`, `transaction_id`, `visible_for_user`, `currency`, `payment`, `qty`, `created_at`, `updated_at`) VALUES
(5, 2, 'test test', 'test@gmail.com', '0987654321', '300.00', '100.00', '1.00', 'adsfsd', 'pending', 'delivered', '602781eb2f6ae', '0', 'BDT', 'cash on delivery', 1, '2021-02-13 07:38:19', '2021-02-15 09:08:32'),
(6, 1, 'test test2', 'test@gmail.com', '0987654321', '620.00', '100.00', '2.00', 'adsfsd', 'pending', 'Pending', '6027cb74780b0', NULL, 'BDT', NULL, 1, '2021-02-13 12:52:04', '2021-02-13 12:52:04'),
(7, 1, 'test testdfrhgfgg', 'test@gmail.com', '0987654321', '620.00', '100.00', '2.00', 'adsfsd', 'pending', 'Pending', '6028b2e39a0a6', NULL, 'BDT', NULL, 1, '2021-02-14 05:19:31', '2021-02-14 05:19:31'),
(8, 2, 'gggg', 'test@gmail.com', '0987654321', '350.00', '150.00', '1.00', 'adsfsd', 'pending', 'Processing', '602a1d8532c28', NULL, 'BDT', 'BKASH-BKash', 1, '2021-02-15 07:06:45', '2021-02-15 07:07:05'),
(9, 2, 'ddd', 'test@gmail.com', '0987654321', '550.00', '150.00', '1.00', 'adsfsd', 'pending', 'Processing', '602a207ab81a4', NULL, 'BDT', 'NAGAD-Nagad', 2, '2021-02-15 07:19:22', '2021-02-15 07:19:39'),
(10, 2, 'cccc', 'test@gmail.com', '0987654321', '850.00', '250.00', '1.00', 'adsfsd', 'pending', 'delivered', '602a2161e9e61', NULL, 'BDT', 'DBBLMOBILEB-Dbbl Mobile Banking', 3, '2021-02-15 07:23:14', '2021-02-15 10:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `profit` decimal(10,2) DEFAULT NULL,
  `shipp_charge` decimal(8,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `user_id`, `size`, `price`, `qty`, `total`, `profit`, `shipp_charge`, `status`, `created_at`, `updated_at`) VALUES
(2, 5, 1, 2, 'x', '250.00', 1, '250.00', '50.00', '50.00', 0, '2021-02-13 07:38:19', '2021-02-13 07:38:19'),
(3, 8, 1, 2, 'x', NULL, 1, '250.00', '50.00', '100.00', 0, '2021-02-15 07:07:05', '2021-02-15 07:07:05'),
(4, 9, 1, 2, 'x', '250.00', 2, '500.00', '100.00', '50.00', 0, '2021-02-15 07:19:39', '2021-02-15 07:19:39'),
(5, 10, 1, 2, 'x', '250.00', 3, '750.00', '150.00', '100.00', 0, '2021-02-15 07:23:30', '2021-02-15 07:23:30');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_child_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_money` decimal(15,2) DEFAULT NULL,
  `indoor_charge` decimal(15,2) DEFAULT NULL,
  `outdoor_charge` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `shipp_des` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `child_category_id`, `sub_child_category_id`, `product_name`, `slug`, `product_code`, `color`, `e_money`, `indoor_charge`, `outdoor_charge`, `description`, `total_price`, `shipp_des`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 1, 't-shirt', 't-shirt', '3520', 'white', '1.00', '50.00', '100.00', 'fffffffffffffffffffffffffffffffffffffff', NULL, NULL, 1, '2021-02-02 12:23:30', '2021-02-02 12:23:30'),
(2, 2, 1, 2, 3, 'shose', 'shose', '05250', 'white', '2.00', '100.00', '120.00', 'sssssssssssssssssssssssssssssssssssssssssssss', NULL, NULL, 1, '2021-02-02 12:25:01', '2021-02-02 12:25:01'),
(3, 3, 2, 3, 6, 'Lotion', 'lotion', 'l-001', 'white', '1.00', '100.00', '200.00', 'adfsdfdsf', NULL, NULL, 1, '2021-02-13 05:57:50', '2021-02-13 05:57:50'),
(4, 3, 2, 4, 5, 'Shampoo', 'shampoo', 's-001', 'white', '2.00', '100.00', '150.00', 'dfgfdgdfgdfg', NULL, NULL, 1, '2021-02-13 06:00:32', '2021-02-13 06:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_avatars`
--

CREATE TABLE `product_avatars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `front` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `back` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `left` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `right` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_avatars`
--

INSERT INTO `product_avatars` (`id`, `product_id`, `front`, `back`, `left`, `right`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1164390079.jpg', '', '', '', '1164390079.jpg', 1, '2021-02-02 12:23:51', '2021-02-02 12:23:51'),
(2, 2, '256331892.jpg', '', '', '', '256331892.jpg', 1, '2021-02-02 12:25:18', '2021-02-02 12:25:18'),
(3, 3, '1844654416.jpg', '', '', '', '1844654416.jpg', 1, '2021-02-13 05:58:16', '2021-02-13 05:58:16'),
(4, 4, '1672824311.jpg', '', '', '', '1672824311.jpg', 1, '2021-02-13 06:00:49', '2021-02-13 06:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitt_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_holders`
--

CREATE TABLE `share_holders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `share_holder_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sponsor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_front` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_back` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_holder_levels`
--

CREATE TABLE `share_holder_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cycle_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cycle_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cycle_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_holder_payment_histories`
--

CREATE TABLE `share_holder_payment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `share_holder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_money` decimal(10,2) DEFAULT NULL,
  `commision` decimal(10,2) DEFAULT NULL,
  `transaction_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_holder_relations`
--

CREATE TABLE `share_holder_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_child_categories`
--

CREATE TABLE `sub_child_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `child_category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_child_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_child_categories`
--

INSERT INTO `sub_child_categories` (`id`, `category_id`, `child_category_id`, `sub_child_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Kappa', 'kappa', 1, '2021-02-02 12:15:22', '2021-02-02 12:15:22'),
(2, 1, 1, 'Ladies', '', 1, '2021-02-02 12:15:40', '2021-02-02 12:20:34'),
(3, 1, 2, 'Casual', 'casual', 1, '2021-02-02 12:16:04', '2021-02-02 12:16:04'),
(4, 1, 2, 'Formal', 'formal', 1, '2021-02-02 12:16:16', '2021-02-02 12:16:16'),
(5, 2, 4, 'Shampoo', 'shampoo', 1, '2021-02-02 12:16:32', '2021-02-02 12:16:32'),
(6, 2, 3, 'Lotion', 'lotion', 1, '2021-02-02 12:16:48', '2021-02-02 12:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2180f3',
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_money` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commision` decimal(10,2) DEFAULT NULL,
  `verified` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` tinyint(1) DEFAULT NULL,
  `total_mem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `google_id`, `facebook_id`, `name`, `phn`, `email`, `active_status`, `dark_mode`, `messenger_color`, `address`, `avatar`, `e_money`, `commision`, `verified`, `verification_token`, `type`, `status`, `total_mem`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'admin', '01714603917', 'admin@admin.com', 0, 1, '#2180f3', 'admin', NULL, NULL, NULL, '1', 'BFs2LCl9DTuDmqYAigBhbJAvRS8U5HdL', 'super_admin', NULL, NULL, NULL, '$2y$10$9ufpZl5EqrG2td1zS0C3Y.6frwKn8A..ps5AXh4pMCvsuPuA6PI.e', NULL, '2021-02-01 09:48:13', '2021-02-08 09:40:18'),
(2, NULL, NULL, 'holder', '01684090806', 'holder@holder.com', 0, 0, '#FF9800', 'holder', 'ea910593-e4f8-476c-994d-47f22ccb01cc.png', '13', NULL, '1', 'ysMdvCtRY3Tf2dmw28485oRk1A9oNzmO', 'share_holder', NULL, '5', NULL, '$2y$10$c5dhNqczCjJXVIWdfKyt8uJPhRF1kT8jgzKOkDNCn6AgpSwG1BKGi', NULL, '2021-02-01 09:55:19', '2021-02-15 10:47:54'),
(3, NULL, NULL, 'holder1', '01716039170', 'holder1@holder.com', 0, 1, '#2180f3', 'holder1', '903780297.jpg', NULL, '180.00', '1', 'sDdhYuvpfarTKxSBaOBxCVpOKZCWV9kS', 'share_holder', NULL, '2', NULL, '$2y$10$KC1kBt.4/q0EYcazkJMDZ.FRnfUzmU.ekGCzvJPaxL3B3N2ifg6cW', NULL, '2021-02-02 06:59:09', '2021-02-15 13:37:50'),
(4, NULL, NULL, 'holder2', '1234567890', 'holder2@holder.com', 0, 0, '#2180f3', 'adsfsd', '873795594.jpg', NULL, '180.00', '1', '1vhp5cfOjJOwbKFzOfWiWKwrF4GJYsXu', 'share_holder', NULL, '1', NULL, '$2y$10$jb13IStfxjB3oAjeGlfCXOel.WLNyNu1Xa1OuldIzzJJ1dce87Gam', NULL, '2021-02-02 07:21:41', '2021-02-15 13:37:50'),
(5, NULL, NULL, 'holder3', '01714603917', 'holder3@holder.com', 0, 0, '#2180f3', 'adsfsd', '1328371287.jpg', '0', '300.00', '1', 'lJ0kfrw2D4Eus7k6lUTR5EVvovy2Qc7N', 'share_holder', NULL, '1', NULL, '$2y$10$KLFrb4e0/SdtGvYpmCJb8OilfcImd9UeaLLSB3O7bFQH30lYRtW4O', NULL, '2021-02-02 07:22:16', '2021-02-15 13:41:48'),
(6, NULL, NULL, 'holder4', '2345465464', 'holder4@holder.com', 0, 0, '#2180f3', 'adsfsd', '1013263782.jpg', NULL, '360.00', '1', 'L46opD4nlETYxv17i4zwcNNKiltQY42K', 'share_holder', NULL, NULL, NULL, '$2y$10$wuwm0dNfrSZuBkTNdWuyz.YJPMOFVnVPH.COCj4fj7IphLkB0ayva', NULL, '2021-02-02 07:22:47', '2021-02-15 13:37:50'),
(7, NULL, NULL, 'holder5', '01712990203', 'holder5@holder.com', 0, 0, '#2180f3', 'adsfsd', '413419251.jpg', NULL, '360.00', '1', 'kFeuTWGARiBQlKK6RYqlGeDM3aMfSdIY', 'share_holder', NULL, '1', NULL, '$2y$10$V5/H4.efWvslu4/w30VHP.0GU0Krr2M0LURG7vgO48.iArq/MTr0S', NULL, '2021-02-02 07:24:05', '2021-02-15 13:37:50'),
(8, NULL, NULL, 'holder6', '1234567890', 'holder6@holder.com', 0, 0, '#2180f3', 'dhaka', '61543820.jpg', NULL, '540.00', '1', 'bIbSlHkXUeGjiNfdwdl8MfyiAUN7uk7T', 'share_holder', NULL, NULL, NULL, '$2y$10$6vlg4A6rII9.EA3aVAcute99/vXpkQ0.mbslF7tTyQtohCfNQIyDG', NULL, '2021-02-02 10:59:06', '2021-02-15 13:37:50'),
(9, NULL, NULL, 'chat', '01684090806', 'chat@chat.com', 0, 0, '#2180f3', 'chat address', NULL, NULL, NULL, '1', 'jOgFbvZCs9xqdi7n25ufM5PsJtEDi6Q7', 'user', NULL, NULL, NULL, '$2y$10$60NVwVMXwXZw1mflrglnfO.xmdujA1WGzISK9llKtkqoj6irmuUni', NULL, '2021-02-07 06:30:14', '2021-02-07 06:30:14'),
(10, NULL, NULL, 'holder7', '01716039170', 'holder7@holder.com', 0, 0, '#2180f3', 'adsfsd', '724843792.webp', NULL, NULL, '1', '6CIewSbcEozZYGWRCC4d0ip7fTYQF73k', 'share_holder', NULL, NULL, NULL, '$2y$10$kqDFtL9Zcc.YNgNxUKaoNeVDVSVVLr7kjOLghmdqMJl1s5fSRYCgy', NULL, '2021-02-10 06:58:01', '2021-02-10 07:06:21'),
(11, NULL, NULL, 'hhh', '01714603917', 'h@holder.com', 0, 0, '#2180f3', 'dhaka', '197736116.png', NULL, NULL, '1', 'k1S3iqnskkn0YQgNVg1edBFdvQM888W7', 'share_holder', NULL, NULL, NULL, '$2y$10$XCF1jYSJay9KG.1h3QEslu9Ah2Cwb5.SC6r/1zB6mvYHmUqE7I/1q', NULL, '2021-02-16 05:53:52', '2021-02-16 06:09:58'),
(13, NULL, NULL, 'idea', '01712990203', 'ideatech.engineear@gmail.com', 0, 0, '#2180f3', 'dhaka', NULL, NULL, NULL, '1', '', 'user', NULL, NULL, NULL, '$2y$10$3ebqIgklYETaqLmL99g1Tuhwd/uhdMj14rcL4iEeAc/f85Q5r0aR2', NULL, '2021-02-16 06:29:23', '2021-02-16 06:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_managers`
--
ALTER TABLE `ad_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `banars`
--
ALTER TABLE `banars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `child_categories`
--
ALTER TABLE `child_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `child_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `commisions`
--
ALTER TABLE `commisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commision_details`
--
ALTER TABLE `commision_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commision_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nominees`
--
ALTER TABLE `nominees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nominees_share_holder_id_foreign` (`share_holder_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_child_category_id_foreign` (`child_category_id`),
  ADD KEY `products_sub_child_category_id_foreign` (`sub_child_category_id`);

--
-- Indexes for table `product_avatars`
--
ALTER TABLE `product_avatars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_avatars_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_holders`
--
ALTER TABLE `share_holders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `share_holders_user_id_foreign` (`user_id`);

--
-- Indexes for table `share_holder_levels`
--
ALTER TABLE `share_holder_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_holder_payment_histories`
--
ALTER TABLE `share_holder_payment_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `share_holder_payment_histories_share_holder_id_foreign` (`share_holder_id`);

--
-- Indexes for table `share_holder_relations`
--
ALTER TABLE `share_holder_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `share_holder_relations_parent_id_foreign` (`parent_id`),
  ADD KEY `share_holder_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `sub_child_categories`
--
ALTER TABLE `sub_child_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_child_categories_category_id_foreign` (`category_id`),
  ADD KEY `sub_child_categories_child_category_id_foreign` (`child_category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wish_lists_product_id_foreign` (`product_id`),
  ADD KEY `wish_lists_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ad_managers`
--
ALTER TABLE `ad_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banars`
--
ALTER TABLE `banars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `child_categories`
--
ALTER TABLE `child_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `commisions`
--
ALTER TABLE `commisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `commision_details`
--
ALTER TABLE `commision_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nominees`
--
ALTER TABLE `nominees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_avatars`
--
ALTER TABLE `product_avatars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `share_holders`
--
ALTER TABLE `share_holders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `share_holder_levels`
--
ALTER TABLE `share_holder_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `share_holder_payment_histories`
--
ALTER TABLE `share_holder_payment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `share_holder_relations`
--
ALTER TABLE `share_holder_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_child_categories`
--
ALTER TABLE `sub_child_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `child_categories`
--
ALTER TABLE `child_categories`
  ADD CONSTRAINT `child_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `commision_details`
--
ALTER TABLE `commision_details`
  ADD CONSTRAINT `commision_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `nominees`
--
ALTER TABLE `nominees`
  ADD CONSTRAINT `nominees_share_holder_id_foreign` FOREIGN KEY (`share_holder_id`) REFERENCES `share_holders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_child_category_id_foreign` FOREIGN KEY (`child_category_id`) REFERENCES `child_categories` (`id`),
  ADD CONSTRAINT `products_sub_child_category_id_foreign` FOREIGN KEY (`sub_child_category_id`) REFERENCES `sub_child_categories` (`id`);

--
-- Constraints for table `product_avatars`
--
ALTER TABLE `product_avatars`
  ADD CONSTRAINT `product_avatars_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `share_holders`
--
ALTER TABLE `share_holders`
  ADD CONSTRAINT `share_holders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `share_holder_payment_histories`
--
ALTER TABLE `share_holder_payment_histories`
  ADD CONSTRAINT `share_holder_payment_histories_share_holder_id_foreign` FOREIGN KEY (`share_holder_id`) REFERENCES `share_holders` (`id`);

--
-- Constraints for table `share_holder_relations`
--
ALTER TABLE `share_holder_relations`
  ADD CONSTRAINT `share_holder_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `share_holder_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_child_categories`
--
ALTER TABLE `sub_child_categories`
  ADD CONSTRAINT `sub_child_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `sub_child_categories_child_category_id_foreign` FOREIGN KEY (`child_category_id`) REFERENCES `child_categories` (`id`);

--
-- Constraints for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
