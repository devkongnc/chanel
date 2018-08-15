-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th8 15, 2018 lúc 04:55 AM
-- Phiên bản máy phục vụ: 5.7.21
-- Phiên bản PHP: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chanel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_commentmeta`
--

DROP TABLE IF EXISTS `chanel_commentmeta`;
CREATE TABLE IF NOT EXISTS `chanel_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_comments`
--

DROP TABLE IF EXISTS `chanel_comments`;
CREATE TABLE IF NOT EXISTS `chanel_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_comments`
--

INSERT INTO `chanel_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-07-10 14:32:43', '2018-07-10 14:32:43', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_links`
--

DROP TABLE IF EXISTS `chanel_links`;
CREATE TABLE IF NOT EXISTS `chanel_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_options`
--

DROP TABLE IF EXISTS `chanel_options`;
CREATE TABLE IF NOT EXISTS `chanel_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_options`
--

INSERT INTO `chanel_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/chanel', 'yes'),
(2, 'home', 'http://localhost/chanel', 'yes'),
(3, 'blogname', 'Chanel', 'yes'),
(4, 'blogdescription', 'SHOP MAKEUP ONLINE', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'dev.kongnc@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:104:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:43:\"custom-post-type-ui/custom-post-type-ui.php\";i:2;s:41:\"navz-photo-gallery/navz-photo-gallery.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '7', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentyseventeen', 'yes'),
(41, 'stylesheet', 'vnconnect', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '5', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '32', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'initial_db_version', '38590', 'yes'),
(93, 'chanel_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(94, 'fresh_site', '0', 'yes'),
(95, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:\"title\";s:4:\"News\";s:6:\"number\";i:5;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:2:{i:0;s:14:\"recent-posts-2\";i:1;s:10:\"calendar-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:2:{i:2;a:1:{s:5:\"title\";s:8:\"Calendar\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'cron', 'a:5:{i:1534307563;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1534329267;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1534343563;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1534343575;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(111, 'theme_mods_twentyseventeen', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1531510577;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}s:18:\"nav_menu_locations\";a:1:{s:3:\"top\";i:2;}}', 'yes'),
(125, 'can_compress_scripts', '1', 'no'),
(141, 'current_theme', 'vnconnect', 'yes'),
(142, 'theme_mods_kale', 'a:9:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:6:\"header\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:21:\"kale_footer_copyright\";s:17:\"Copyright © 2018\";s:20:\"kale_example_content\";b:1;s:17:\"kale_sidebar_size\";b:0;s:21:\"kale_frontpage_banner\";s:6:\"Banner\";s:30:\"kale_frontpage_large_post_show\";b:1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1531504027;s:4:\"data\";a:11:{s:19:\"wp_inactive_widgets\";a:0:{}s:15:\"sidebar-default\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:24:\"sidebar-default-bordered\";a:0:{}s:17:\"header-row-1-left\";a:0:{}s:18:\"header-row-1-right\";a:0:{}s:18:\"footer-row-2-col-1\";a:0:{}s:18:\"footer-row-2-col-2\";a:0:{}s:18:\"footer-row-2-col-3\";a:0:{}s:18:\"footer-row-2-col-4\";a:0:{}s:18:\"footer-row-2-col-5\";a:0:{}s:19:\"footer-row-3-center\";a:0:{}}}}', 'yes'),
(143, 'theme_switched', '', 'yes'),
(167, 'recently_activated', 'a:0:{}', 'yes'),
(191, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(193, 'theme_mods_vnconnect', 'a:8:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:3:\"top\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:20:\"kale_image_logo_show\";b:0;s:12:\"header_image\";s:21:\"random-uploaded-image\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1531510573;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:15:\"sidebar-default\";a:0:{}}}s:11:\"custom_logo\";i:29;s:16:\"header_textcolor\";s:5:\"blank\";}', 'yes'),
(221, 'acf_version', '4.4.12', 'yes'),
(228, 'cptui_new_install', 'false', 'yes'),
(229, 'cptui_post_types', 'a:1:{s:7:\"product\";a:28:{s:4:\"name\";s:7:\"product\";s:5:\"label\";s:8:\"Products\";s:14:\"singular_label\";s:7:\"Product\";s:11:\"description\";s:0:\"\";s:6:\"public\";s:4:\"true\";s:18:\"publicly_queryable\";s:4:\"true\";s:7:\"show_ui\";s:4:\"true\";s:17:\"show_in_nav_menus\";s:4:\"true\";s:12:\"show_in_rest\";s:5:\"false\";s:9:\"rest_base\";s:0:\"\";s:11:\"has_archive\";s:5:\"false\";s:18:\"has_archive_string\";s:0:\"\";s:19:\"exclude_from_search\";s:5:\"false\";s:15:\"capability_type\";s:4:\"post\";s:12:\"hierarchical\";s:5:\"false\";s:7:\"rewrite\";s:4:\"true\";s:12:\"rewrite_slug\";s:0:\"\";s:17:\"rewrite_withfront\";s:4:\"true\";s:9:\"query_var\";s:4:\"true\";s:14:\"query_var_slug\";s:0:\"\";s:13:\"menu_position\";s:0:\"\";s:12:\"show_in_menu\";s:4:\"true\";s:19:\"show_in_menu_string\";s:0:\"\";s:9:\"menu_icon\";s:67:\"http://localhost/chanel/wp-content/uploads/2018/08/shopping-bag.png\";s:8:\"supports\";a:4:{i:0;s:5:\"title\";i:1;s:6:\"editor\";i:2;s:9:\"thumbnail\";i:3;s:7:\"excerpt\";}s:10:\"taxonomies\";a:2:{i:0;s:8:\"category\";i:1;s:8:\"post_tag\";}s:6:\"labels\";a:23:{s:9:\"menu_name\";s:0:\"\";s:9:\"all_items\";s:0:\"\";s:7:\"add_new\";s:0:\"\";s:12:\"add_new_item\";s:0:\"\";s:9:\"edit_item\";s:0:\"\";s:8:\"new_item\";s:0:\"\";s:9:\"view_item\";s:0:\"\";s:10:\"view_items\";s:0:\"\";s:12:\"search_items\";s:0:\"\";s:9:\"not_found\";s:0:\"\";s:18:\"not_found_in_trash\";s:0:\"\";s:17:\"parent_item_colon\";s:0:\"\";s:14:\"featured_image\";s:0:\"\";s:18:\"set_featured_image\";s:0:\"\";s:21:\"remove_featured_image\";s:0:\"\";s:18:\"use_featured_image\";s:0:\"\";s:8:\"archives\";s:0:\"\";s:16:\"insert_into_item\";s:0:\"\";s:21:\"uploaded_to_this_item\";s:0:\"\";s:17:\"filter_items_list\";s:0:\"\";s:21:\"items_list_navigation\";s:0:\"\";s:10:\"items_list\";s:0:\"\";s:10:\"attributes\";s:0:\"\";}s:15:\"custom_supports\";s:0:\"\";}}', 'yes'),
(281, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1534300409;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(306, '_site_transient_timeout_browser_a86483e46b670f7632c84374159a18f1', '1534304947', 'no'),
(307, '_site_transient_browser_a86483e46b670f7632c84374159a18f1', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"68.0.3440.84\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(322, 'WPLANG', '', 'yes'),
(323, 'new_admin_email', 'dev.kongnc@gmail.com', 'yes'),
(358, '_site_transient_timeout_browser_01fe6d96f512df15cc1b10345d6b37d9', '1534503721', 'no'),
(359, '_site_transient_browser_01fe6d96f512df15cc1b10345d6b37d9', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"68.0.3440.106\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(432, 'category_children', 'a:0:{}', 'yes'),
(439, '_transient_is_multi_author', '0', 'yes'),
(442, '_site_transient_timeout_theme_roots', '1534302210', 'no'),
(443, '_site_transient_theme_roots', 'a:2:{s:15:\"twentyseventeen\";s:7:\"/themes\";s:9:\"vnconnect\";s:7:\"/themes\";}', 'no'),
(444, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1534300412;s:7:\"checked\";a:2:{s:15:\"twentyseventeen\";s:3:\"1.6\";s:9:\"vnconnect\";s:3:\"0.1\";}s:8:\"response\";a:1:{s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.1.7.zip\";}}s:12:\"translations\";a:0:{}}', 'no'),
(445, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1534300414;s:7:\"checked\";a:6:{s:41:\"navz-photo-gallery/navz-photo-gallery.php\";s:5:\"1.6.3\";s:30:\"advanced-custom-fields/acf.php\";s:6:\"4.4.12\";s:19:\"akismet/akismet.php\";s:5:\"4.0.3\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:5:\"1.5.8\";s:9:\"hello.php\";s:3:\"1.7\";s:15:\"kirki/kirki.php\";s:6:\"3.0.33\";}s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.8\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:41:\"navz-photo-gallery/navz-photo-gallery.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:32:\"w.org/plugins/navz-photo-gallery\";s:4:\"slug\";s:18:\"navz-photo-gallery\";s:6:\"plugin\";s:41:\"navz-photo-gallery/navz-photo-gallery.php\";s:11:\"new_version\";s:5:\"1.6.3\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/navz-photo-gallery/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/navz-photo-gallery.1.6.3.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:71:\"https://ps.w.org/navz-photo-gallery/assets/icon-128x128.png?rev=1561241\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:73:\"https://ps.w.org/navz-photo-gallery/assets/banner-772x250.png?rev=1561242\";}s:11:\"banners_rtl\";a:0:{}}s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"4.4.12\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.4.4.12.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}}s:43:\"custom-post-type-ui/custom-post-type-ui.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:33:\"w.org/plugins/custom-post-type-ui\";s:4:\"slug\";s:19:\"custom-post-type-ui\";s:6:\"plugin\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:11:\"new_version\";s:5:\"1.5.8\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/custom-post-type-ui/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.5.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=1069557\";s:2:\"1x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=1069557\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=1069557\";s:2:\"1x\";s:74:\"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=1069557\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:15:\"kirki/kirki.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:19:\"w.org/plugins/kirki\";s:4:\"slug\";s:5:\"kirki\";s:6:\"plugin\";s:15:\"kirki/kirki.php\";s:11:\"new_version\";s:6:\"3.0.33\";s:3:\"url\";s:36:\"https://wordpress.org/plugins/kirki/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/kirki.3.0.33.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:58:\"https://ps.w.org/kirki/assets/icon-256x256.png?rev=1330852\";s:2:\"1x\";s:50:\"https://ps.w.org/kirki/assets/icon.svg?rev=1330186\";s:3:\"svg\";s:50:\"https://ps.w.org/kirki/assets/icon.svg?rev=1330186\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/kirki/assets/banner-1544x500.png?rev=1330852\";s:2:\"1x\";s:60:\"https://ps.w.org/kirki/assets/banner-772x250.png?rev=1330852\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_postmeta`
--

DROP TABLE IF EXISTS `chanel_postmeta`;
CREATE TABLE IF NOT EXISTS `chanel_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_postmeta`
--

INSERT INTO `chanel_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(3, 5, '_edit_last', '1'),
(4, 5, '_edit_lock', '1534249322:1'),
(5, 5, '_wp_page_template', 'default'),
(6, 5, '_page_options_meta', 'a:1:{s:14:\"featured_image\";s:6:\"Banner\";}'),
(24, 14, '_edit_last', '1'),
(25, 14, '_edit_lock', '1533714446:1'),
(26, 14, '_wp_page_template', 'default'),
(27, 14, '_page_options_meta', 'a:1:{s:14:\"featured_image\";s:7:\"Default\";}'),
(28, 16, '_edit_last', '1'),
(29, 16, '_edit_lock', '1534250859:1'),
(30, 16, '_wp_page_template', 'default'),
(31, 16, '_page_options_meta', 'a:1:{s:14:\"featured_image\";s:7:\"Default\";}'),
(77, 23, '_menu_item_type', 'post_type'),
(78, 23, '_menu_item_menu_item_parent', '0'),
(79, 23, '_menu_item_object_id', '5'),
(80, 23, '_menu_item_object', 'page'),
(81, 23, '_menu_item_target', ''),
(82, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(83, 23, '_menu_item_xfn', ''),
(84, 23, '_menu_item_url', ''),
(90, 26, '_wp_attached_file', '2018/07/banner.png'),
(91, 26, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2018/07/banner.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"banner-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"banner-300x94.png\";s:5:\"width\";i:300;s:6:\"height\";i:94;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"banner-768x240.png\";s:5:\"width\";i:768;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:19:\"banner-1024x320.png\";s:5:\"width\";i:1024;s:6:\"height\";i:320;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:18:\"banner-760x400.png\";s:5:\"width\";i:760;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"kale-slider\";a:4:{s:4:\"file\";s:19:\"banner-1200x550.png\";s:5:\"width\";i:1200;s:6:\"height\";i:550;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"kale-thumbnail\";a:4:{s:4:\"file\";s:18:\"banner-760x400.png\";s:5:\"width\";i:760;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(98, 28, '_wp_attached_file', '2018/07/logo.png'),
(99, 28, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:500;s:6:\"height\";i:83;s:4:\"file\";s:16:\"2018/07/logo.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"logo-150x83.png\";s:5:\"width\";i:150;s:6:\"height\";i:83;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"logo-300x50.png\";s:5:\"width\";i:300;s:6:\"height\";i:50;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:15:\"logo-100x83.png\";s:5:\"width\";i:100;s:6:\"height\";i:83;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(100, 29, '_wp_attached_file', '2018/07/cropped-logo.png'),
(101, 29, '_wp_attachment_context', 'custom-logo'),
(102, 29, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1506;s:6:\"height\";i:250;s:4:\"file\";s:24:\"2018/07/cropped-logo.png\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"cropped-logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"cropped-logo-300x50.png\";s:5:\"width\";i:300;s:6:\"height\";i:50;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:24:\"cropped-logo-768x127.png\";s:5:\"width\";i:768;s:6:\"height\";i:127;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:25:\"cropped-logo-1024x170.png\";s:5:\"width\";i:1024;s:6:\"height\";i:170;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:24:\"cropped-logo-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(104, 31, '_wp_attached_file', '2018/07/fabicon.png'),
(105, 31, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:19:\"2018/07/fabicon.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"fabicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"fabicon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:19:\"fabicon-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(106, 32, '_wp_attached_file', '2018/07/cropped-fabicon.png'),
(107, 32, '_wp_attachment_context', 'site-icon'),
(108, 32, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:27:\"2018/07/cropped-fabicon.png\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"cropped-fabicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"cropped-fabicon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:27:\"cropped-fabicon-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:27:\"cropped-fabicon-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:27:\"cropped-fabicon-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:27:\"cropped-fabicon-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:25:\"cropped-fabicon-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(111, 33, '_edit_last', '1'),
(112, 33, '_edit_lock', '1534249352:1'),
(113, 35, '_edit_last', '1'),
(114, 35, '_edit_lock', '1534249407:1'),
(133, 40, '_edit_last', '1'),
(134, 40, '_edit_lock', '1534165393:1'),
(135, 41, '_wp_attached_file', '2018/07/base-lumiere.jpg'),
(136, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:24:\"2018/07/base-lumiere.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"base-lumiere-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"base-lumiere-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:24:\"base-lumiere-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(137, 40, '_thumbnail_id', '41'),
(138, 42, '_edit_last', '1'),
(139, 42, '_edit_lock', '1534129496:1'),
(140, 43, '_wp_attached_file', '2018/07/joues-contraste.jpg'),
(141, 43, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:27:\"2018/07/joues-contraste.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"joues-contraste-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"joues-contraste-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:27:\"joues-contraste-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(142, 42, '_thumbnail_id', '43'),
(143, 45, '_wp_attached_file', '2018/07/le-blanc-de-chanel.jpg'),
(144, 45, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:30:\"2018/07/le-blanc-de-chanel.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"le-blanc-de-chanel-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"le-blanc-de-chanel-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:30:\"le-blanc-de-chanel-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(145, 44, '_edit_last', '1'),
(146, 44, '_thumbnail_id', '45'),
(147, 44, '_edit_lock', '1534129481:1'),
(148, 46, '_edit_last', '1'),
(149, 46, 'field_5b4906024eb9b', 'a:15:{s:3:\"key\";s:19:\"field_5b4906024eb9b\";s:5:\"label\";s:5:\"Price\";s:4:\"name\";s:5:\"price\";s:4:\"type\";s:6:\"number\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"1\";s:13:\"default_value\";s:1:\"0\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:4:\"step\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),
(151, 46, 'position', 'normal'),
(152, 46, 'layout', 'no_box'),
(153, 46, 'hide_on_screen', ''),
(154, 46, '_edit_lock', '1533898850:1'),
(155, 46, 'field_5b5dacde0c1aa', 'a:9:{s:3:\"key\";s:19:\"field_5b5dacde0c1aa\";s:5:\"label\";s:15:\"Product Gallery\";s:4:\"name\";s:15:\"product_gallery\";s:4:\"type\";s:13:\"photo_gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:10:\"edit_modal\";s:7:\"Default\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),
(157, 44, 'price', '85'),
(158, 44, '_price', 'field_5b4906024eb9b'),
(159, 48, '_wp_attached_file', '2018/08/shopping-bag.png'),
(160, 48, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:20;s:6:\"height\";i:20;s:4:\"file\";s:24:\"2018/08/shopping-bag.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(161, 2, '_wp_trash_meta_status', 'publish'),
(162, 2, '_wp_trash_meta_time', '1533714104'),
(163, 2, '_wp_desired_post_slug', 'sample-page'),
(164, 50, '_edit_last', '1'),
(165, 50, '_edit_lock', '1533728285:1'),
(166, 52, '_edit_last', '1'),
(167, 52, '_edit_lock', '1534251047:1'),
(168, 50, '_wp_page_template', 'template-cart.php'),
(169, 46, 'rule', 'a:5:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"product\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),
(170, 42, 'price', '0'),
(171, 42, '_price', 'field_5b4906024eb9b'),
(172, 40, 'price', '0'),
(173, 40, '_price', 'field_5b4906024eb9b'),
(174, 1, '_edit_lock', '1533899030:1'),
(175, 52, '_wp_page_template', 'default'),
(176, 33, '_wp_page_template', 'default'),
(177, 35, '_wp_page_template', 'default'),
(181, 60, '_menu_item_type', 'taxonomy'),
(182, 60, '_menu_item_menu_item_parent', '0'),
(183, 60, '_menu_item_object_id', '4'),
(184, 60, '_menu_item_object', 'category'),
(185, 60, '_menu_item_target', ''),
(186, 60, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(187, 60, '_menu_item_xfn', ''),
(188, 60, '_menu_item_url', ''),
(190, 61, '_menu_item_type', 'taxonomy'),
(191, 61, '_menu_item_menu_item_parent', '0'),
(192, 61, '_menu_item_object_id', '3'),
(193, 61, '_menu_item_object', 'category'),
(194, 61, '_menu_item_target', ''),
(195, 61, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(196, 61, '_menu_item_xfn', ''),
(197, 61, '_menu_item_url', ''),
(199, 62, '_menu_item_type', 'taxonomy'),
(200, 62, '_menu_item_menu_item_parent', '0'),
(201, 62, '_menu_item_object_id', '5'),
(202, 62, '_menu_item_object', 'category'),
(203, 62, '_menu_item_target', ''),
(204, 62, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(205, 62, '_menu_item_xfn', ''),
(206, 62, '_menu_item_url', ''),
(208, 63, '_menu_item_type', 'taxonomy'),
(209, 63, '_menu_item_menu_item_parent', '0'),
(210, 63, '_menu_item_object_id', '1'),
(211, 63, '_menu_item_object', 'category'),
(212, 63, '_menu_item_target', ''),
(213, 63, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(214, 63, '_menu_item_xfn', ''),
(215, 63, '_menu_item_url', ''),
(217, 64, '_menu_item_type', 'post_type'),
(218, 64, '_menu_item_menu_item_parent', '0'),
(219, 64, '_menu_item_object_id', '52'),
(220, 64, '_menu_item_object', 'page'),
(221, 64, '_menu_item_target', ''),
(222, 64, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(223, 64, '_menu_item_xfn', ''),
(224, 64, '_menu_item_url', ''),
(226, 66, '_wp_attached_file', '2018/08/7-ageLOC-Galvanic-Body-Spa-Pack-1-Body-Spa-2-Body-Shaping-Gels-1-Moisture-Mist.png'),
(227, 66, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:90:\"2018/08/7-ageLOC-Galvanic-Body-Spa-Pack-1-Body-Spa-2-Body-Shaping-Gels-1-Moisture-Mist.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:90:\"7-ageLOC-Galvanic-Body-Spa-Pack-1-Body-Spa-2-Body-Shaping-Gels-1-Moisture-Mist-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:90:\"7-ageLOC-Galvanic-Body-Spa-Pack-1-Body-Spa-2-Body-Shaping-Gels-1-Moisture-Mist-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:90:\"7-ageLOC-Galvanic-Body-Spa-Pack-1-Body-Spa-2-Body-Shaping-Gels-1-Moisture-Mist-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(234, 65, '_edit_last', '1'),
(235, 65, '_edit_lock', '1534256640:1'),
(236, 65, '_thumbnail_id', '66'),
(237, 65, 'price', '0'),
(238, 65, '_price', 'field_5b4906024eb9b');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_posts`
--

DROP TABLE IF EXISTS `chanel_posts`;
CREATE TABLE IF NOT EXISTS `chanel_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_posts`
--

INSERT INTO `chanel_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-07-10 14:32:43', '2018-07-10 14:32:43', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-07-10 14:32:43', '2018-07-10 14:32:43', '', 0, 'http://localhost/chanel/?p=1', 0, 'post', '', 1),
(2, 1, '2018-07-10 14:32:43', '2018-07-10 14:32:43', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/chanel/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2018-08-08 14:41:44', '2018-08-08 07:41:44', '', 0, 'http://localhost/chanel/?page_id=2', 0, 'page', '', 0),
(5, 1, '2018-07-11 10:34:58', '2018-07-11 10:34:58', '', 'Home', '', 'publish', 'closed', 'closed', '', 'trang-chu', '', '', '2018-08-14 19:24:25', '2018-08-14 12:24:25', '', 0, 'http://localhost/chanel/?page_id=5', 0, 'page', '', 0),
(6, 1, '2018-07-11 10:34:58', '2018-07-11 10:34:58', '', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-07-11 10:34:58', '2018-07-11 10:34:58', '', 5, 'http://localhost/chanel/2018/07/11/5-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2018-07-13 17:02:33', '2018-07-13 17:02:33', '', 'Liên hệ', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2018-08-08 14:49:49', '2018-08-08 07:49:49', '', 0, 'http://localhost/chanel/?page_id=14', 0, 'page', '', 0),
(15, 1, '2018-07-13 17:02:33', '2018-07-13 17:02:33', '', 'Liên hệ', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2018-07-13 17:02:33', '2018-07-13 17:02:33', '', 14, 'http://localhost/chanel/2018/07/13/14-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2018-07-13 17:02:55', '2018-07-13 17:02:55', '', 'Tin tức', '', 'publish', 'closed', 'closed', '', 'news', '', '', '2018-08-08 14:50:02', '2018-08-08 07:50:02', '', 0, 'http://localhost/chanel/?page_id=16', 0, 'page', '', 0),
(17, 1, '2018-07-13 17:02:55', '2018-07-13 17:02:55', '', 'Tin tức', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-07-13 17:02:55', '2018-07-13 17:02:55', '', 16, 'http://localhost/chanel/2018/07/13/16-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2018-07-13 17:03:45', '2018-07-13 17:03:45', ' ', '', '', 'publish', 'closed', 'closed', '', '23', '', '', '2018-08-14 19:54:30', '2018-08-14 12:54:30', '', 0, 'http://localhost/chanel/?p=23', 1, 'nav_menu_item', '', 0),
(26, 1, '2018-07-13 17:37:17', '2018-07-13 17:37:17', '', 'banner', '', 'inherit', 'open', 'closed', '', 'banner', '', '', '2018-07-13 17:37:17', '2018-07-13 17:37:17', '', 0, 'http://localhost/chanel/wp-content/uploads/2018/07/banner.png', 0, 'attachment', 'image/png', 0),
(28, 1, '2018-07-13 17:59:13', '2018-07-13 17:59:13', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2018-07-13 17:59:13', '2018-07-13 17:59:13', '', 0, 'http://localhost/chanel/wp-content/uploads/2018/07/logo.png', 0, 'attachment', 'image/png', 0),
(29, 1, '2018-07-13 17:59:27', '2018-07-13 17:59:27', 'http://localhost/chanel/wp-content/uploads/2018/07/cropped-logo.png', 'cropped-logo.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo-png', '', '', '2018-07-13 17:59:27', '2018-07-13 17:59:27', '', 0, 'http://localhost/chanel/wp-content/uploads/2018/07/cropped-logo.png', 0, 'attachment', 'image/png', 0),
(31, 1, '2018-07-13 18:01:58', '2018-07-13 18:01:58', '', 'fabicon', '', 'inherit', 'open', 'closed', '', 'fabicon', '', '', '2018-07-13 18:01:58', '2018-07-13 18:01:58', '', 0, 'http://localhost/chanel/wp-content/uploads/2018/07/fabicon.png', 0, 'attachment', 'image/png', 0),
(32, 1, '2018-07-13 18:02:00', '2018-07-13 18:02:00', 'http://localhost/chanel/wp-content/uploads/2018/07/cropped-fabicon.png', 'cropped-fabicon.png', '', 'inherit', 'open', 'closed', '', 'cropped-fabicon-png', '', '', '2018-07-13 18:02:00', '2018-07-13 18:02:00', '', 0, 'http://localhost/chanel/wp-content/uploads/2018/07/cropped-fabicon.png', 0, 'attachment', 'image/png', 0),
(33, 1, '2018-07-13 19:09:44', '2018-07-13 19:09:44', '', 'Facial', '', 'publish', 'closed', 'closed', '', 'facial', '', '', '2018-08-14 19:51:28', '2018-08-14 12:51:28', '', 0, 'http://localhost/chanel/?page_id=33', 0, 'page', '', 0),
(34, 1, '2018-07-13 19:09:44', '2018-07-13 19:09:44', '', 'Mỹ phẩm', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2018-07-13 19:09:44', '2018-07-13 19:09:44', '', 33, 'http://localhost/chanel/2018/07/13/33-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2018-07-13 19:10:55', '2018-07-13 19:10:55', '', 'Body', '', 'publish', 'closed', 'closed', '', 'body', '', '', '2018-08-14 19:25:50', '2018-08-14 12:25:50', '', 0, 'http://localhost/chanel/?page_id=35', 0, 'page', '', 0),
(36, 1, '2018-07-13 19:10:55', '2018-07-13 19:10:55', '', 'Lumi Skin', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2018-07-13 19:10:55', '2018-07-13 19:10:55', '', 35, 'http://localhost/chanel/2018/07/13/35-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2018-07-13 19:59:32', '2018-07-13 19:59:32', '<h5 class=\"heading is-5\">PRODUCT</h5>\r\nA fresh, oil-free makeup base that evens out skin tone and illuminates the complexion.\r\n<h5 class=\"heading is-5\">COMPOSITION</h5>\r\nThe hydrating gel formula minimizes the appearance of imperfections with a beautifully smooth finish that extends foundation wear, hour after hour.\r\n<h5 class=\"heading is-6\">HOW TO APPLY</h5>\r\nApply BASE LUMIÈRE to desired areas in a downward sweeping motion, starting from the center of the face. Use fingertips, Foundation Brush #6, Blending Foundation Brush #7 or a sponge for application.', 'BASE LUMIÈRE', 'Illuminating Makeup Base', 'publish', 'closed', 'closed', '', 'base-lumiere', '', '', '2018-08-13 10:06:45', '2018-08-13 03:06:45', '', 0, 'http://localhost/chanel/?post_type=product&#038;p=40', 0, 'product', '', 0),
(41, 1, '2018-07-13 19:59:12', '2018-07-13 19:59:12', '', 'base-lumiere', '', 'inherit', 'open', 'closed', '', 'base-lumiere', '', '', '2018-07-13 19:59:12', '2018-07-13 19:59:12', '', 40, 'http://localhost/chanel/wp-content/uploads/2018/07/base-lumiere.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2018-07-13 20:01:32', '2018-07-13 20:01:32', '<h5 class=\"heading is-5\">PRODUCT</h5>\r\nThis powder blush, available in a variety of limited-edition shades, offers seamless colour in a silky, delicate texture. Buildable coverage allows for tailored effects, from natural to dramatic, and imparts a radiant glow, beautifully suited to the season. Applied high on the cheekbones or near to the eyes, it instantly “lifts” and softens the face for a more youthful look.\r\n<h5 class=\"heading is-6\">HOW TO APPLY</h5>\r\nUse the integrated brush to apply a highlighting touch of JOUES CONTRASTE to cheeks or accentuate the contours of the face.', 'JOUES CONTRASTE', 'Powder Blush', 'publish', 'closed', 'closed', '', 'joues-contraste', '', '', '2018-08-13 10:07:19', '2018-08-13 03:07:19', '', 0, 'http://localhost/chanel/?post_type=product&#038;p=42', 0, 'product', '', 0),
(43, 1, '2018-07-13 20:00:42', '2018-07-13 20:00:42', '', 'joues-contraste', '', 'inherit', 'open', 'closed', '', 'joues-contraste', '', '', '2018-07-13 20:00:42', '2018-07-13 20:00:42', '', 42, 'http://localhost/chanel/wp-content/uploads/2018/07/joues-contraste.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2018-07-13 20:03:11', '2018-07-13 20:03:11', '<h5 class=\"heading is-5\">PRODUCT</h5>\r\nAn ingenious, oil-free, multi-tasking foundation base that illuminates and evens the complexion while minimizing the appearance of pores. Adds subtle contour and radiance to the face.\r\n<h5 class=\"heading is-5\">COMPOSITION</h5>\r\nA unique blend of powders provides a smooth, even, flawless finish. Witch Hazel and Licorice Extract prime skin for makeup by minimizing the appearance of pores and evening skin tone.\r\n<h5 class=\"heading is-6\">HOW TO APPLY</h5>\r\nStarting at the center of the face in a downward sweeping motion, apply LE BLANC DE CHANEL to the forehead, cheeks, nose and chin with a combination of fingers, Foundation Brush #6 or a sponge. Can be worn alone, under foundation or on top for a fresh, radiant result.', 'LE BLANC DE CHANEL', 'Multi-Use Illuminating Base', 'publish', 'closed', 'closed', '', 'le-blanc-de-chanel', '', '', '2018-08-13 10:07:04', '2018-08-13 03:07:04', '', 0, 'http://localhost/chanel/?post_type=product&#038;p=44', 0, 'product', '', 0),
(45, 1, '2018-07-13 20:03:06', '2018-07-13 20:03:06', '', 'le-blanc-de-chanel', '', 'inherit', 'open', 'closed', '', 'le-blanc-de-chanel', '', '', '2018-07-13 20:03:06', '2018-07-13 20:03:06', '', 44, 'http://localhost/chanel/wp-content/uploads/2018/07/le-blanc-de-chanel.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2018-07-13 20:13:09', '2018-07-13 20:13:09', '', 'Products Group', '', 'publish', 'closed', 'closed', '', 'acf_products-group', '', '', '2018-08-10 18:03:10', '2018-08-10 11:03:10', '', 0, 'http://localhost/chanel/?post_type=acf&#038;p=46', 0, 'acf', '', 0),
(47, 1, '2018-08-08 03:49:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-08 03:49:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/chanel/?p=47', 0, 'post', '', 0),
(48, 1, '2018-08-08 10:56:26', '2018-08-08 03:56:26', '', 'shopping-bag', '', 'inherit', 'open', 'closed', '', 'shopping-bag', '', '', '2018-08-08 10:56:26', '2018-08-08 03:56:26', '', 0, 'http://localhost/chanel/wp-content/uploads/2018/08/shopping-bag.png', 0, 'attachment', 'image/png', 0),
(49, 1, '2018-08-08 14:41:44', '2018-08-08 07:41:44', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/chanel/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-08-08 14:41:44', '2018-08-08 07:41:44', '', 2, 'http://localhost/chanel/2-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2018-08-08 14:43:51', '2018-08-08 07:43:51', '', 'Giỏ hàng', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2018-08-08 15:54:10', '2018-08-08 08:54:10', '', 0, 'http://localhost/chanel/?page_id=50', 0, 'page', '', 0),
(51, 1, '2018-08-08 14:43:51', '2018-08-08 07:43:51', '', 'Cart', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2018-08-08 14:43:51', '2018-08-08 07:43:51', '', 50, 'http://localhost/chanel/50-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2018-08-08 14:44:01', '2018-08-08 07:44:01', '', 'Payment', '', 'publish', 'closed', 'closed', '', 'payment', '', '', '2018-08-14 19:53:10', '2018-08-14 12:53:10', '', 0, 'http://localhost/chanel/?page_id=52', 0, 'page', '', 0),
(53, 1, '2018-08-08 14:44:01', '2018-08-08 07:44:01', '', 'Checkout', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2018-08-08 14:44:01', '2018-08-08 07:44:01', '', 52, 'http://localhost/chanel/52-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2018-08-08 14:45:00', '2018-08-08 07:45:00', '', 'Giỏ hàng', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2018-08-08 14:45:00', '2018-08-08 07:45:00', '', 50, 'http://localhost/chanel/50-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2018-08-08 14:45:18', '2018-08-08 07:45:18', '', 'Thanh toán', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2018-08-08 14:45:18', '2018-08-08 07:45:18', '', 52, 'http://localhost/chanel/52-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2018-08-14 19:24:25', '2018-08-14 12:24:25', '', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-08-14 19:24:25', '2018-08-14 12:24:25', '', 5, 'http://localhost/chanel/5-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2018-08-14 19:24:52', '2018-08-14 12:24:52', '', 'Facial', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2018-08-14 19:24:52', '2018-08-14 12:24:52', '', 33, 'http://localhost/chanel/33-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2018-08-14 19:25:50', '2018-08-14 12:25:50', '', 'Body', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2018-08-14 19:25:50', '2018-08-14 12:25:50', '', 35, 'http://localhost/chanel/35-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2018-08-14 19:52:50', '2018-08-14 12:52:50', '', 'Payment', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2018-08-14 19:52:50', '2018-08-14 12:52:50', '', 52, 'http://localhost/chanel/52-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2018-08-14 19:54:01', '2018-08-14 12:54:01', ' ', '', '', 'publish', 'closed', 'closed', '', '60', '', '', '2018-08-14 19:54:30', '2018-08-14 12:54:30', '', 0, 'http://localhost/chanel/?p=60', 3, 'nav_menu_item', '', 0),
(61, 1, '2018-08-14 19:54:01', '2018-08-14 12:54:01', ' ', '', '', 'publish', 'closed', 'closed', '', '61', '', '', '2018-08-14 19:54:30', '2018-08-14 12:54:30', '', 0, 'http://localhost/chanel/?p=61', 2, 'nav_menu_item', '', 0),
(62, 1, '2018-08-14 19:54:01', '2018-08-14 12:54:01', ' ', '', '', 'publish', 'closed', 'closed', '', '62', '', '', '2018-08-14 19:54:30', '2018-08-14 12:54:30', '', 0, 'http://localhost/chanel/?p=62', 4, 'nav_menu_item', '', 0),
(63, 1, '2018-08-14 19:54:01', '2018-08-14 12:54:01', ' ', '', '', 'publish', 'closed', 'closed', '', '63', '', '', '2018-08-14 19:54:30', '2018-08-14 12:54:30', '', 0, 'http://localhost/chanel/?p=63', 5, 'nav_menu_item', '', 0),
(64, 1, '2018-08-14 19:54:30', '2018-08-14 12:54:30', ' ', '', '', 'publish', 'closed', 'closed', '', '64', '', '', '2018-08-14 19:54:30', '2018-08-14 12:54:30', '', 0, 'http://localhost/chanel/?p=64', 6, 'nav_menu_item', '', 0),
(65, 1, '2018-08-14 21:15:33', '2018-08-14 14:15:33', 'PRODUCT\r\nAn ingenious, oil-free, multi-tasking foundation base that illuminates and evens the complexion while minimizing the appearance of pores. Adds subtle contour and radiance to the face.\r\n\r\nCOMPOSITION\r\nA unique blend of powders provides a smooth, even, flawless finish. Witch Hazel and Licorice Extract prime skin for makeup by minimizing the appearance of pores and evening skin tone.\r\n\r\nHOW TO APPLY\r\nStarting at the center of the face in a downward sweeping motion, apply LE BLANC DE CHANEL to the forehead, cheeks, nose and chin with a combination of fingers, Foundation Brush #6 or a sponge. Can be worn alone, under foundation or on top for a fresh, radiant result.', 'Body Shaping Gels', 'An ingenious, oil-free, multi-tasking foundation base', 'publish', 'closed', 'closed', '', 'body-shaping-gels', '', '', '2018-08-14 21:15:33', '2018-08-14 14:15:33', '', 0, 'http://localhost/chanel/?post_type=product&#038;p=65', 0, 'product', '', 0),
(66, 1, '2018-08-14 21:13:44', '2018-08-14 14:13:44', '', '7-ageLOC Galvanic Body Spa Pack (1 Body Spa, 2 Body Shaping Gels, 1 Moisture Mist)', '', 'inherit', 'open', 'closed', '', '7-ageloc-galvanic-body-spa-pack-1-body-spa-2-body-shaping-gels-1-moisture-mist', '', '', '2018-08-14 21:13:44', '2018-08-14 14:13:44', '', 65, 'http://localhost/chanel/wp-content/uploads/2018/08/7-ageLOC-Galvanic-Body-Spa-Pack-1-Body-Spa-2-Body-Shaping-Gels-1-Moisture-Mist.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_termmeta`
--

DROP TABLE IF EXISTS `chanel_termmeta`;
CREATE TABLE IF NOT EXISTS `chanel_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_terms`
--

DROP TABLE IF EXISTS `chanel_terms`;
CREATE TABLE IF NOT EXISTS `chanel_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_terms`
--

INSERT INTO `chanel_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Other', 'other', 0),
(2, 'Man menu', 'man-menu', 0),
(3, 'Facial', 'facial', 0),
(4, 'Body', 'body', 0),
(5, 'Makeup', 'makeup', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_term_relationships`
--

DROP TABLE IF EXISTS `chanel_term_relationships`;
CREATE TABLE IF NOT EXISTS `chanel_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_term_relationships`
--

INSERT INTO `chanel_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(23, 2, 0),
(60, 2, 0),
(61, 2, 0),
(62, 2, 0),
(63, 2, 0),
(64, 2, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_term_taxonomy`
--

DROP TABLE IF EXISTS `chanel_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `chanel_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_term_taxonomy`
--

INSERT INTO `chanel_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 6),
(3, 3, 'category', '', 0, 0),
(4, 4, 'category', '', 0, 0),
(5, 5, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_usermeta`
--

DROP TABLE IF EXISTS `chanel_usermeta`;
CREATE TABLE IF NOT EXISTS `chanel_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_usermeta`
--

INSERT INTO `chanel_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'kongnc'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'chanel_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'chanel_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'chanel_dashboard_quick_press_last_post_id', '47'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(20, 1, 'closedpostboxes_page', 'a:0:{}'),
(21, 1, 'metaboxhidden_page', 'a:6:{i:0;s:11:\"postexcerpt\";i:1;s:10:\"postcustom\";i:2;s:16:\"commentstatusdiv\";i:3;s:11:\"commentsdiv\";i:4;s:7:\"slugdiv\";i:5;s:9:\"authordiv\";}'),
(22, 1, 'chanel_user-settings', 'libraryContent=browse&editor=html'),
(23, 1, 'chanel_user-settings-time', '1534129601'),
(24, 1, 'session_tokens', 'a:2:{s:64:\"72875a2c340a5461667ab7264ca82c725f78fec96de3334dded5c73e34c5b0ab\";a:4:{s:10:\"expiration\";i:1534302231;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\";s:5:\"login\";i:1534129431;}s:64:\"1ed70c8056fe4a72dc34fe9e2c545c82377f94ad28ea2c6a1225819deaeb01be\";a:4:{s:10:\"expiration\";i:1534421233;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\";s:5:\"login\";i:1534248433;}}'),
(25, 1, 'nav_menu_recently_edited', '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chanel_users`
--

DROP TABLE IF EXISTS `chanel_users`;
CREATE TABLE IF NOT EXISTS `chanel_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `chanel_users`
--

INSERT INTO `chanel_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'kongnc', '$P$BkTwNby6ZXFo26WeD7XqS/HjKUOtHy/', 'kongnc', 'dev.kongnc@gmail.com', '', '2018-07-10 14:32:43', '', 0, 'kongnc');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
