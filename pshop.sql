-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 
-- 伺服器版本： 8.0.17
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `pshop`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `customer_id` int(5) NOT NULL,
  `commodity_id` int(20) UNSIGNED NOT NULL,
  `amount` int(17) UNSIGNED NOT NULL,
  `price` int(17) UNSIGNED NOT NULL,
  `order_id` int(5) NOT NULL,
  `confirm_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `cart`
--

INSERT INTO `cart` (`customer_id`, `commodity_id`, `amount`, `price`, `order_id`, `confirm_status`) VALUES
(1, 1, 1, 11900, 1, 2),
(1, 1, 1, 11900, 4, 2),
(2, 1, 1, 11900, 6, -1),
(2, 1, 1, 11900, 7, -1),
(2, 1, 1, 11900, 8, -1),
(2, 1, 1, 11900, 9, -1),
(2, 1, 1, 11900, 10, -1),
(2, 1, 1, 11900, 11, -1),
(2, 1, 1, 11900, 12, -1),
(2, 1, 1, 11900, 13, -1),
(2, 1, 1, 11900, 14, -1),
(2, 1, 1, 11900, 15, -1),
(2, 1, 1, 11900, 16, -1),
(2, 1, 1, 11900, 17, -1),
(2, 1, 1, 11900, 18, -1),
(2, 1, 1, 11900, 19, -1),
(2, 1, 1, 11900, 20, -1),
(2, 1, 1, 11900, 21, -1),
(2, 1, 1, 11900, 22, -1),
(2, 1, 1, 11900, 23, -1),
(2, 1, 1, 11900, 24, -1),
(2, 1, 1, 11900, 25, -1),
(2, 1, 1, 11900, 26, -1),
(2, 1, 1, 11900, 27, -1),
(2, 1, 1, 11900, 28, -1),
(2, 1, 1, 11900, 29, -1),
(2, 1, 1, 11900, 30, -1),
(2, 1, 1, 11900, 31, -1),
(2, 1, 1, 11900, 32, -1),
(2, 1, 1, 11900, 33, -1),
(2, 1, 1, 11900, 34, -1),
(2, 1, 1, 11900, 36, -1),
(2, 1, 1, 11900, 37, -1),
(2, 1, 1, 11900, 38, -1),
(2, 1, 1, 11900, 39, -1),
(2, 1, 1, 11900, 40, -1),
(2, 1, 1, 11900, 41, -1),
(2, 1, 1, 11900, 42, -1),
(2, 1, 1, 11900, 43, -1),
(2, 1, 1, 11900, 44, 2),
(2, 2, 1, 500, 45, -1),
(2, 2, 1, 500, 46, -1),
(2, 2, 1, 500, 47, -1),
(2, 2, 1, 500, 48, -1),
(2, 2, 1, 500, 49, -1),
(2, 2, 1, 500, 50, -1),
(2, 2, 1, 500, 51, 2),
(2, 2, 1, 500, 52, -1),
(2, 2, 1, 500, 53, 1),
(2, 2, 1, 500, 54, 2),
(2, 1, 1, 11900, 55, 1),
(2, 1, 1, 11900, 56, 2),
(2, 1, 1, 11900, 57, 2),
(2, 2, 2, 500, 58, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `commodity`
--

CREATE TABLE `commodity` (
  `id` int(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int(20) UNSIGNED NOT NULL,
  `amount` int(17) UNSIGNED NOT NULL,
  `sold` int(17) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `opinion` int(3) UNSIGNED NOT NULL,
  `opNum` int(20) UNSIGNED NOT NULL,
  `photoName` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `commodity`
--

INSERT INTO `commodity` (`id`, `name`, `price`, `amount`, `sold`, `date`, `opinion`, `opNum`, `photoName`, `deleted`) VALUES
(1, 'Apple Watch', 11900, 14, 6, '2022-04-28', 0, 0, 'f0a6ff4d6c7e4349f781ca9774d47a59.jpg', 0),
(2, 'Apple pancil', 500, 97, 3, '2022-05-03', 0, 0, '23b0bde7e591c11b036ee6f70ad64934.jpg', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(5) NOT NULL,
  `eng_name` varchar(255) NOT NULL DEFAULT '',
  `cht_name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL,
  `type` char(10) NOT NULL DEFAULT '',
  `discount` decimal(15,4) DEFAULT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `date_start` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `uses_total` int(11) NOT NULL DEFAULT '0',
  `uses_limit` int(11) NOT NULL DEFAULT '-1',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `eng_name`, `cht_name`, `code`, `type`, `discount`, `shipping`, `date_start`, `date_end`, `uses_total`, `uses_limit`, `available`, `date_added`) VALUES
(1, 'Carbon coin:10%Token Discount', '碳幣:10%代幣折扣', 'Carboncoin1', 'none', '10.0000', 1, '2022-04-28', '2022-05-28', 3, 100, 1, '2022-04-28 10:52:15');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_used`
--

CREATE TABLE `coupon_used` (
  `order_id` int(5) NOT NULL,
  `coupon_id` int(5) NOT NULL,
  `befor_final_price` int(17) UNSIGNED NOT NULL DEFAULT '0',
  `after_final_price` int(17) UNSIGNED NOT NULL DEFAULT '0',
  `discount` int(17) UNSIGNED NOT NULL DEFAULT '0',
  `used_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `coupon_used`
--

INSERT INTO `coupon_used` (`order_id`, `coupon_id`, `befor_final_price`, `after_final_price`, `discount`, `used_date`) VALUES
(4, 1, 11960, 10770, 1190, '2022-04-28 21:10:56'),
(53, 1, 560, 510, 50, '2022-05-09 22:50:53'),
(57, 1, 11980, 10790, 1190, '2022-05-19 14:12:02');

-- --------------------------------------------------------

--
-- 資料表結構 `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://127.0.0.1/PShop-master', 'yes'),
(2, 'sitename', '碳商城', 'yes'),
(3, 'sitedescription', 'Carbon Coin Shop購物車！', 'yes'),
(4, 'users_can_register', '1', 'yes'),
(5, 'admin_email', 'putai50329@gmail.com', 'no'),
(6, 'results_per_page', '15', 'yes');

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `order_id` int(5) NOT NULL,
  `customer_id` int(6) NOT NULL,
  `payment_id` int(5) DEFAULT NULL,
  `confirm_status` tinyint(1) DEFAULT NULL,
  `previous_confirm_status` tinyint(4) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `inventory` tinyint(1) NOT NULL DEFAULT '0',
  `paid` varchar(10) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `ship_id` int(6) DEFAULT NULL,
  `ship_date` datetime DEFAULT NULL,
  `freight` varchar(30) DEFAULT NULL,
  `freight_price` int(17) UNSIGNED DEFAULT NULL,
  `coupon` char(20) DEFAULT NULL,
  `coupon_price` int(17) UNSIGNED DEFAULT NULL,
  `total_price` int(17) UNSIGNED DEFAULT NULL,
  `final_price` int(17) UNSIGNED DEFAULT NULL,
  `finished_date` datetime DEFAULT NULL,
  `all_finished_date` datetime DEFAULT NULL,
  `require_data` int(6) DEFAULT NULL,
  `errmsg` varchar(50) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `TransactionHash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `order`
--

INSERT INTO `order` (`order_id`, `customer_id`, `payment_id`, `confirm_status`, `previous_confirm_status`, `order_date`, `inventory`, `paid`, `payment_method`, `payment_date`, `ship_id`, `ship_date`, `freight`, `freight_price`, `coupon`, `coupon_price`, `total_price`, `final_price`, `finished_date`, `all_finished_date`, `require_data`, `errmsg`, `deleted`, `TransactionHash`) VALUES
(1, 1, NULL, 5, 5, '2022-04-28 18:00:47', 1, '1', 'transfer', '2022-04-28 18:28:23', 1, '2022-04-28 18:24:39', 'mailing', 80, NULL, 0, 11980, 11980, '2022-04-28 18:28:29', '2022-04-28 18:29:59', NULL, NULL, 0, NULL),
(4, 1, NULL, 5, 5, '2022-04-28 21:10:56', 1, '1', 'pickup', '2022-04-28 21:12:11', 2, '2022-04-28 21:12:15', '711', 60, 'Carboncoin1', 1190, 11960, 10770, '2022-04-30 00:00:38', '2022-04-30 00:00:55', NULL, NULL, 0, NULL),
(5, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(41, 2, NULL, -1, 1, '2022-05-02 22:53:27', 0, '0', 'transfer', NULL, 37, NULL, 'mailing', 80, NULL, 0, 11980, 11980, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0xeba6b287dd2f683862c757b36e607ca8ef8bdb5584489b93f1ac06733c5de967'),
(42, 2, NULL, -1, 1, '2022-05-02 22:56:12', 0, '0', 'CarbonCoin', NULL, 38, NULL, 'mailing', 80, NULL, 0, 11980, 11980, NULL, NULL, NULL, NULL, 0, NULL),
(43, 2, NULL, -1, 1, '2022-05-02 23:04:58', 0, '0', 'CarbonCoin', NULL, 39, NULL, 'mailing', 80, NULL, 0, 11980, 11980, NULL, NULL, NULL, NULL, 0, NULL),
(44, 2, NULL, 3, 3, '2022-05-02 23:32:19', 1, '1', 'CarbonCoin', '2022-05-02 23:41:47', 40, '2022-05-03 00:40:07', 'mailing', 80, NULL, 0, 11980, 11980, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0xf509faa8575829c1d48dbe289c7796181f05c7fc7d4f573fbe90ac9565c74b6a'),
(45, 2, NULL, -1, 1, '2022-05-03 01:45:55', 0, '0', 'CarbonCoin', NULL, 41, NULL, '711', 60, NULL, 0, 560, 560, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x29c40bfdb346114aedd78b0f865041754cb7d19d5abf66cf27fa1c2e37ef5664'),
(46, 2, NULL, -1, 1, '2022-05-03 02:24:36', 0, '0', 'CarbonCoin', NULL, 42, NULL, 'mailing', 80, NULL, 0, 580, 580, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x101cf595e12a9f973ea6f05efac487a9d37ee0a17c158585b93f521cbe657c01'),
(47, 2, NULL, -1, 1, '2022-05-03 02:38:22', 0, '0', 'CarbonCoin', NULL, 43, NULL, 'mailing', 80, NULL, 0, 580, 580, NULL, NULL, NULL, NULL, 0, ''),
(48, 2, NULL, -1, 1, '2022-05-03 13:18:26', 0, '0', 'CarbonCoin', NULL, 44, NULL, 'mailing', 80, NULL, 0, 580, 580, NULL, NULL, NULL, NULL, 0, ''),
(49, 2, NULL, -1, 1, '2022-05-03 13:37:37', 0, '0', 'transfer', NULL, 45, NULL, '711', 60, NULL, 0, 560, 560, NULL, NULL, NULL, NULL, 0, ''),
(50, 2, NULL, -1, 1, '2022-05-03 13:45:56', 0, '0', 'CarbonCoin', NULL, 46, NULL, '711', 60, NULL, 0, 560, 560, NULL, NULL, NULL, NULL, 0, ''),
(51, 2, NULL, 5, 5, '2022-05-03 13:47:42', 1, '1', 'CarbonCoin', '2022-05-03 16:30:33', 47, '2022-05-03 16:30:35', '711', 60, NULL, 0, 560, 560, '2022-05-09 01:52:30', '2022-05-09 01:52:40', NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x40f2b4b95ad7150c7b0a5ae158c6fcb4dca2f706ad0ce2cb96580f12c9decd5f'),
(52, 2, NULL, -1, 1, '2022-05-09 18:33:49', 0, '0', 'CarbonCoin', NULL, 48, NULL, '711', 60, NULL, 0, 560, 560, NULL, NULL, NULL, NULL, 0, ''),
(53, 2, NULL, 1, NULL, '2022-05-09 22:50:53', 1, '0', 'CarbonCoin', NULL, 49, NULL, '711', 60, 'Carboncoin1', 50, 560, 510, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0xdddc382f92be25ddc9ea99a28d01acc926030fbc59e99ca1fdcb20707ab2b824'),
(54, 2, NULL, 2, 2, '2022-05-10 23:35:58', 1, '1', 'CarbonCoin', '2022-05-11 20:25:23', 50, NULL, 'mailing', 80, NULL, 0, 580, 580, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x3980a3f682f907456a63bdf585a701e2516d7a4ab32cc5b0e93d9a1436d99e53'),
(55, 2, NULL, 1, NULL, '2022-05-11 21:25:53', 1, '0', 'transfer', NULL, 51, NULL, 'mailing', 80, NULL, 0, 11980, 11980, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x0865d327dc77314b0eb95b393dc02ad2835cf3e34c8ef701323211e8130989cb'),
(56, 2, NULL, 2, 2, '2022-05-11 21:29:44', 1, '1', 'CarbonCoin', '2022-06-02 03:30:43', 52, NULL, 'mailing', 80, NULL, 0, 11980, 11980, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x433c0aeb4a062d3eced4e6aaf17913dff8dd033ea33703c7c020b6309405ce24'),
(57, 2, NULL, 2, 2, '2022-05-19 14:12:02', 1, '1', 'CarbonCoin', '2022-05-19 19:02:20', 53, NULL, 'mailing', 80, 'Carboncoin1', 1190, 11980, 10790, NULL, NULL, NULL, NULL, 0, 'https://ropsten.etherscan.io/tx/0x07440b64d0113c3d2b7d43535ce13ca7235f45a5067d9049ddd5a5d0104ee4a5'),
(58, 2, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `ship`
--

CREATE TABLE `ship` (
  `ship_id` int(5) NOT NULL,
  `order_id` int(5) NOT NULL,
  `freight` varchar(30) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_address` varchar(60) NOT NULL,
  `customer_phone` varchar(30) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `ship_status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `ship`
--

INSERT INTO `ship` (`ship_id`, `order_id`, `freight`, `customer_id`, `customer_name`, `customer_address`, `customer_phone`, `customer_email`, `ship_status`) VALUES
(1, 1, 'mailing', 1, 'jack', '彰化縣', '0963051160', 'putai50329@gmail.com', '商品已出貨'),
(2, 4, '711', 1, 'test', '台北市', '0978354746', 'putai50329@gmail.com', '商品已出貨'),
(39, 43, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(40, 44, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '商品已出貨'),
(41, 45, '711', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(42, 46, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(43, 47, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(44, 48, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(45, 49, '711', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(46, 50, '711', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(47, 51, '711', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '商品已出貨'),
(48, 52, '711', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(49, 53, '711', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(50, 54, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(51, 55, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(52, 56, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0'),
(53, 57, 'mailing', 2, 'test', '台北市', '0911753216', 'aa12473@gmail.com', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `ship_status`
--

CREATE TABLE `ship_status` (
  `ship_id` int(5) NOT NULL,
  `timestamp` datetime NOT NULL,
  `current_status` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `ship_status`
--

INSERT INTO `ship_status` (`ship_id`, `timestamp`, `current_status`) VALUES
(1, '2022-04-28 18:00:47', '訂單已成立'),
(1, '2022-04-28 18:24:39', '商品已出貨'),
(1, '2022-04-28 18:28:23', '已將訂單細節通知賣家'),
(1, '2022-04-28 18:28:29', '取件成功'),
(2, '2022-04-28 21:10:56', '訂單已成立'),
(2, '2022-04-28 21:12:11', '已將訂單細節通知賣家'),
(2, '2022-04-28 21:12:15', '商品已出貨'),
(2, '2022-04-30 00:00:38', '取件成功'),
(3, '2022-05-01 18:23:27', '訂單已成立'),
(4, '2022-05-01 18:25:05', '訂單已成立'),
(5, '2022-05-01 18:32:46', '訂單已成立'),
(6, '2022-05-01 18:37:12', '訂單已成立'),
(7, '2022-05-01 18:42:20', '訂單已成立'),
(8, '2022-05-01 19:02:16', '訂單已成立'),
(9, '2022-05-01 19:06:41', '訂單已成立'),
(10, '2022-05-01 19:19:41', '訂單已成立'),
(11, '2022-05-01 19:20:42', '訂單已成立'),
(12, '2022-05-01 19:25:13', '訂單已成立'),
(13, '2022-05-01 19:35:24', '訂單已成立'),
(14, '2022-05-01 19:39:04', '訂單已成立'),
(15, '2022-05-01 22:34:30', '訂單已成立'),
(16, '2022-05-01 22:43:46', '訂單已成立'),
(17, '2022-05-01 22:45:27', '訂單已成立'),
(18, '2022-05-01 22:47:07', '訂單已成立'),
(19, '2022-05-01 22:47:28', '訂單已成立'),
(20, '2022-05-01 22:50:14', '訂單已成立'),
(21, '2022-05-01 22:51:36', '訂單已成立'),
(22, '2022-05-01 23:03:18', '訂單已成立'),
(23, '2022-05-01 23:04:46', '訂單已成立'),
(24, '2022-05-01 23:25:44', '訂單已成立'),
(25, '2022-05-01 23:26:27', '訂單已成立'),
(26, '2022-05-01 23:28:16', '訂單已成立'),
(27, '2022-05-01 23:31:43', '訂單已成立'),
(28, '2022-05-01 23:39:45', '訂單已成立'),
(29, '2022-05-01 23:42:16', '訂單已成立'),
(30, '2022-05-01 23:46:21', '訂單已成立'),
(31, '2022-05-01 23:47:45', '訂單已成立'),
(32, '2022-05-02 22:07:53', '訂單已成立'),
(33, '2022-05-02 22:22:07', '訂單已成立'),
(34, '2022-05-02 22:28:20', '訂單已成立'),
(35, '2022-05-02 22:42:36', '訂單已成立'),
(36, '2022-05-02 22:44:47', '訂單已成立'),
(37, '2022-05-02 22:53:27', '訂單已成立'),
(38, '2022-05-02 22:56:12', '訂單已成立'),
(39, '2022-05-02 23:04:58', '訂單已成立'),
(40, '2022-05-02 23:32:19', '訂單已成立'),
(40, '2022-05-02 23:41:47', '已將訂單細節通知賣家'),
(40, '2022-05-03 00:40:07', '商品已出貨'),
(41, '2022-05-03 01:45:55', '訂單已成立'),
(42, '2022-05-03 02:24:36', '訂單已成立'),
(43, '2022-05-03 02:38:22', '訂單已成立'),
(44, '2022-05-03 13:18:26', '訂單已成立'),
(45, '2022-05-03 13:37:37', '訂單已成立'),
(46, '2022-05-03 13:45:56', '訂單已成立'),
(47, '2022-05-03 13:47:42', '訂單已成立'),
(47, '2022-05-03 16:30:33', '已將訂單細節通知賣家'),
(47, '2022-05-03 16:30:35', '商品已出貨'),
(47, '2022-05-09 01:52:16', '取件成功'),
(47, '2022-05-09 01:52:26', '取件成功'),
(47, '2022-05-09 01:52:30', '取件成功'),
(48, '2022-05-09 18:33:49', '訂單已成立'),
(49, '2022-05-09 22:50:53', '訂單已成立'),
(50, '2022-05-10 23:35:58', '訂單已成立'),
(50, '2022-05-11 20:25:23', '已將訂單細節通知賣家'),
(51, '2022-05-11 21:25:53', '訂單已成立'),
(52, '2022-05-11 21:29:44', '訂單已成立'),
(53, '2022-05-19 14:12:02', '訂單已成立'),
(53, '2022-05-19 19:02:20', '已將訂單細節通知賣家'),
(52, '2022-06-02 03:30:43', '已將訂單細節通知賣家');

-- --------------------------------------------------------

--
-- 資料表結構 `terms`
--

CREATE TABLE `terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `taxonomy` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'category',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `terms`
--

INSERT INTO `terms` (`term_id`, `name`, `slug`, `taxonomy`, `count`) VALUES
(1, '未分類', 'uncategorized', 'category', 0),
(2, '電子產品', 'Apple', 'category', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `term_relationships`
--

CREATE TABLE `term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `term_relationships`
--

INSERT INTO `term_relationships` (`object_id`, `term_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(6) UNSIGNED NOT NULL,
  `account` varchar(30) NOT NULL,
  `account_password` varchar(120) NOT NULL,
  `email` varchar(50) NOT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `user_address` varchar(60) DEFAULT NULL,
  `authority` varchar(10) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `userinfo`
--

INSERT INTO `userinfo` (`id`, `account`, `account_password`, `email`, `userName`, `phone_number`, `user_address`, `authority`) VALUES
(1, 'Jackhung', 'usYeaWtu0wVZY', 'putai50329@gmail.com', 'Jackhung', '0963051160', '彰化市', 'admin'),
(2, 'test', 'usrJkICrJcGeY', 'aa12473@gmail.com', 'test', '0911753216', '台北市', 'user');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- 資料表索引 `coupon_used`
--
ALTER TABLE `coupon_used`
  ADD PRIMARY KEY (`order_id`);

--
-- 資料表索引 `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- 資料表索引 `ship`
--
ALTER TABLE `ship`
  ADD PRIMARY KEY (`ship_id`,`order_id`);

--
-- 資料表索引 `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- 資料表索引 `term_relationships`
--
ALTER TABLE `term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_id`),
  ADD KEY `term_id` (`term_id`);

--
-- 資料表索引 `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `commodity`
--
ALTER TABLE `commodity`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ship`
--
ALTER TABLE `ship`
  MODIFY `ship_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
