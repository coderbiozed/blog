-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2021 at 05:27 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'bPH7M9HOZwDRXQFwxkFFdAJDWNZ8QgfZ', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `name`, `expired_at`, `location`, `key`, `image`, `url`, `clicked`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Panel Ads', '2026-03-15 00:00:00', 'panel-ads', 'UANG7YMCQCAZ', 'banners/1.jpg', 'https://botble.com', 0, 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, 'Sidebar Ads', '2026-03-15 00:00:00', 'top-sidebar-ads', 'BOH1QQW2GLGT', 'banners/2.jpg', 'https://botble.com', 0, 2, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '127.0.0.1', 0, 1, 'Steven Madden', 'info', '2021-06-05 07:25:15', '2021-06-05 07:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 0, 'Labore quis dignissimos est eos quos id architecto. Architecto incidunt distinctio maxime nemo aspernatur. Quibusdam fugit sit sit dolorem itaque eos esse.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(2, 'Travel', 0, 'Nam quasi aut necessitatibus. Error saepe voluptate iure est et expedita consequatur. Sed vero dolorem corrupti et tempore nihil explicabo.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'Guides', 2, 'Labore iusto vel magnam sit cupiditate tempora. Sunt dicta voluptates eveniet sit perspiciatis. Ut odit dolores accusantium aliquam ipsum deserunt rerum. Commodi magnam totam quo aspernatur.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'Destination', 0, 'Doloribus possimus recusandae nisi eum. Occaecati ex nobis at adipisci sint tenetur quo. Commodi tenetur ut labore voluptatem enim ut ut. Nesciunt quia sit quia.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, 'Food', 4, 'Facere omnis ad doloremque aut eum. Sint voluptas cum ut iste odit voluptate. Voluptatem provident ut qui neque est quis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(6, 'Hotels', 0, 'Accusantium explicabo non est sequi. Ut ut ad doloremque ut sit soluta. Laboriosam veniam aliquam quia natus. Voluptas beatae aut voluptas rem voluptate optio.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(7, 'Review', 6, 'Tempora blanditiis sint et consequatur dolor. Amet quia dolore eius saepe. Aut sapiente veritatis esse cum enim quod totam.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(8, 'Healthy', 0, 'Explicabo consequatur quo ut non sit et eaque corrupti. Et quisquam nam quia non quia nihil. Distinctio doloremque saepe ut et repudiandae. Ea sed assumenda perferendis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(9, 'Lifestyle', 0, 'Laboriosam reiciendis placeat voluptatem tempora quia labore nesciunt voluptatem. Et impedit minima dolor. Voluptatem vero iste odio aliquid dolorem similique.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(10, 'Không phân loại', 0, 'Impedit nihil et minus distinctio. Possimus ad voluptate in sint quia quaerat. Eos omnis ut voluptatibus.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(11, 'Du lịch', 0, 'In et sit neque at qui consectetur voluptatibus. Sit voluptas vel voluptatem quia magnam accusantium. Ut est voluptas id sed debitis id. Ducimus corrupti ut ut ex aut excepturi rerum.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(12, 'Hướng dẫn', 11, 'Ex eaque sed fugit voluptatem non aut. Odio et non veritatis et voluptas explicabo. Et et optio voluptatem. Et amet soluta ratione quia qui fuga.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(13, 'Điểm đến', 0, 'Aliquid deserunt dolorum a neque natus recusandae nihil. Quibusdam ut officiis consectetur id eaque sed tempore. Harum velit ad optio laboriosam architecto quos quidem. Voluptatem ad qui dolor.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(14, 'Đồ ăn', 13, 'Ea ex rerum distinctio recusandae. Pariatur voluptatem dolorum veritatis maxime.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(15, 'Khách sạn', 0, 'Labore aspernatur est autem sunt magnam sint totam. Nam omnis eveniet necessitatibus aut quia sit consectetur. Sit sapiente ut soluta.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(16, 'Đánh giá', 15, 'Aliquid eligendi corporis quo ut. Et illo blanditiis minus aut optio dolor voluptas temporibus. Ea est est officiis incidunt. Et enim eos hic modi.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(17, 'Sức khỏe', 0, 'Impedit tenetur quibusdam et aliquid. Minus ea dolorum quasi. Est voluptatum repellendus quisquam placeat corrupti sit. Blanditiis aut non qui unde perspiciatis modi repellendus perferendis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(18, 'Phong cách sống', 0, 'Quod ullam deserunt occaecati itaque officiis aut. Enim odit unde ut quidem suscipit quas. Similique alias quae quas repudiandae.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Marshall Hayes', 'ehahn@example.org', '1-963-203-3366', '1783 Satterfield Mission Suite 458\nHowellmouth, NC 25919', 'Iure earum illo perferendis sit unde aut.', 'Animi ratione sed rerum velit natus. Repellat minima iste beatae soluta et quo magni. Atque et non quia omnis aspernatur. Quo veniam et dignissimos nesciunt. Voluptatem facilis eius incidunt laboriosam. Consequatur consectetur et placeat fugit perspiciatis. Nesciunt quisquam qui dolores ipsam. Qui doloremque rerum iste inventore debitis illo est. Cupiditate molestias culpa eaque consequatur aliquam.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'Kenya Lemke', 'freida.kunde@example.com', '(757) 963-7830', '82941 Keyon Stravenue\nMillsfort, OK 69495-4355', 'Error numquam autem labore ut modi.', 'Corrupti alias pariatur repellendus quasi dolor possimus est labore. Explicabo recusandae reprehenderit a repellendus. Nisi voluptas suscipit ut ut corporis non. Sunt et asperiores placeat ratione placeat. Aliquid impedit vel placeat et. Natus culpa illum qui corrupti ad. Debitis quia et accusamus. Placeat sed nihil commodi incidunt omnis qui. Autem rerum eum nulla voluptatem.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'Miss Brandy Senger', 'leopoldo.hahn@example.net', '337.722.3178', '47826 Brennan Ferry Suite 308\nVestaburgh, TN 13109', 'Numquam quam ducimus illo qui mollitia.', 'Et minima non ut adipisci. Voluptas earum nostrum et dicta doloribus. Ipsa quam reiciendis iusto dolor. Ex nesciunt corrupti vel nobis nulla. Ea non minus ut voluptatem. Quaerat eum et dolor nostrum et. Et enim deleniti totam et voluptates quaerat. Unde veritatis delectus iste optio repellendus esse. Fugiat est quia commodi eius aut distinctio laboriosam. Rerum voluptates quis dolorum quidem. Quidem omnis nihil provident laborum ut accusamus.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'Alex Veum', 'enid24@example.net', '(995) 353-9078', '334 Schroeder Crossroad Apt. 281\nNew Antone, OH 37299', 'Necessitatibus rem quis quos et itaque quaerat.', 'Eum id perferendis rem atque laboriosam porro. Harum repellendus sed sit molestias dolor possimus autem. Est et ea consectetur eveniet nihil. Molestiae est quia corrupti suscipit natus omnis ipsam. Eaque recusandae quis aperiam laborum et non nesciunt. Molestias officiis cupiditate eaque dolor eum. Minima ex nisi perferendis sit inventore omnis voluptatibus.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'Vivian Purdy', 'qoconner@example.com', '+16528104497', '6545 Hartmann Fork\nRafaelaport, MN 39120', 'Excepturi magni et et. Eos et nihil quia sint.', 'Excepturi libero est quo perferendis velit ut. Asperiores quasi ipsa aut labore. Voluptatum dolorem beatae dolorem omnis debitis dolores doloribus. Vero minima recusandae dolor voluptate voluptatibus molestiae voluptates quia. Quidem ea sit numquam est consequuntur quia excepturi. Et optio est dolor sed corporis non libero. Iste pariatur quidem rerum culpa. Rem saepe omnis accusantium ipsam rerum molestiae. Fugit rerum sint optio qui harum rerum.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'Matilda Sanford', 'mcglynn.domenic@example.com', '490-204-7585', '825 Rigoberto Canyon\nReillyhaven, WA 95847', 'Qui doloremque laboriosam consectetur eos vel.', 'Ea quia officia odio aut fugit odit eum. Itaque iure nihil ullam iusto aliquam deleniti assumenda. Similique sed sit illo sed. Iusto quo cupiditate corrupti tenetur consectetur consectetur qui. Sit tenetur facilis et ea. Ea cumque temporibus tenetur rem ad tempore. Quae rerum ex illo alias molestiae. Expedita voluptatibus magnam sit placeat.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'Kendra Barrows', 'ivah.witting@example.com', '525-932-8787', '277 Hintz Plain Apt. 756\nSpencerborough, MA 75676-7284', 'Assumenda est quod beatae dolore voluptas et.', 'Facere et qui ut dicta. Aliquam incidunt eius maxime. Laboriosam ad suscipit sed eveniet nesciunt ipsam nesciunt similique. A voluptatem amet ipsam et tempora. Sit recusandae atque earum et ratione labore fuga. Et quas et explicabo a. Ut rerum natus accusantium voluptatem sed qui doloribus. Assumenda sit natus tenetur.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'Prof. Torey Howe', 'tad.powlowski@example.com', '(404) 851-6468', '250 Hane Hollow Suite 481\nLake Darion, LA 40039', 'Perspiciatis rerum officia libero alias.', 'Consequatur ea vel quia alias qui. Totam vel rerum voluptatem error voluptatem distinctio quae. Eligendi eius pariatur qui neque temporibus provident. Dolore quae voluptatem veniam. Aspernatur ab omnis sunt optio aut laboriosam doloribus. Dolores aut repudiandae sed facilis voluptatibus sunt dolor. Facere iste tempora amet eligendi qui. Magni doloribus omnis reprehenderit maxime doloremque. Consectetur id nesciunt incidunt occaecati nisi non. Qui possimus minima harum qui voluptatem velit.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'Elenor Lynch', 'cheyanne84@example.net', '+1-868-646-4461', '898 Baby Mission\nIsabelfort, WI 01335', 'Nulla fugiat odit non ullam est.', 'Quis quia praesentium et eos iusto. Voluptates id et iure nihil nulla. Quo consequatur ut unde magnam ut fuga et. Repellendus voluptatibus qui voluptatem sint. Illum ullam quisquam placeat fuga porro atque maiores. Et necessitatibus perspiciatis velit ab amet assumenda vero. Sequi ut atque fugiat laboriosam. Aspernatur dolores autem qui tempore quis quo. Quasi sed quaerat est ab quas veniam.', 'read', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'Magali Flatley', 'vernon.abernathy@example.org', '+1-921-313-1337', '8899 Dickinson Mount\nRowefurt, MN 23596-9215', 'Quia adipisci perspiciatis at aut quo.', 'Ipsam odio dignissimos autem voluptas. Ea odit et voluptate doloremque aperiam. Minus nihil nisi vel modi asperiores. Ab eius corrupti ad enim quas accusantium accusamus. Natus sed eveniet eveniet quasi nobis. Ipsa non ipsa distinctio et doloribus et facilis. Labore qui repudiandae adipisci repellendus.', 'unread', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_themes', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(2, 'widget_total_users', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(3, 'widget_total_pages', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(4, 'widget_total_plugins', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(5, 'widget_analytics_general', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(6, 'widget_analytics_page', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(7, 'widget_analytics_browser', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(8, 'widget_posts_recent', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(9, 'widget_analytics_referrer', '2021-06-05 07:25:15', '2021-06-05 07:25:15'),
(10, 'widget_audit_logs', '2021-06-05 07:25:15', '2021-06-05 07:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Perfect', 'Molestiae facere aut consequatur nostrum illum officiis enim. Quo placeat qui quo voluptatem dicta. Occaecati nihil incidunt laboriosam sit dolorem.', 1, 0, 'galleries/1.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, 'New Day', 'Dolorum laborum magnam eius. Sed earum quam accusantium aut et debitis nostrum quod. Possimus consequatur velit deserunt error.', 1, 0, 'galleries/2.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(3, 'Happy Day', 'Rerum quos culpa officia corrupti est qui. Quam ea unde eum ut dolor. Ut consequatur sint corrupti quis voluptatem.', 1, 0, 'galleries/3.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(4, 'Nature', 'Aut ut consequatur consequatur error nihil. Sed et quidem voluptatem. Voluptatem perspiciatis quas rerum dolores cumque.', 1, 0, 'galleries/4.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(5, 'Morning', 'Adipisci hic magni voluptatem cum dolores. Ut tempore sunt est et. Labore numquam quod non repudiandae dignissimos.', 1, 0, 'galleries/5.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(6, 'Photography', 'Aut voluptatibus omnis omnis eaque tenetur. Nam dignissimos hic vero. Est mollitia repellendus quia impedit voluptas id aperiam.', 1, 0, 'galleries/6.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(7, 'Hoàn hảo', 'Ullam qui voluptatem aut. Natus itaque et aperiam quis dolores velit. Labore atque et quia et a.', 1, 0, 'galleries/1.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(8, 'Ngày mới', 'Et maxime distinctio quo magni recusandae aliquam. Est aut qui quaerat earum nemo rerum vitae. Quaerat ipsa doloremque dolores iusto quis magnam.', 1, 0, 'galleries/2.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(9, 'Ngày hạnh phúc', 'Exercitationem voluptas omnis porro unde incidunt facilis. Facilis non ducimus sint ut. Modi hic qui dolorem quia maiores.', 1, 0, 'galleries/3.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(10, 'Thiên nhiên', 'Nihil iusto facilis eius tempora commodi nam. Ea est ab et est libero. Nemo tenetur in nesciunt voluptas repellendus et itaque.', 1, 0, 'galleries/4.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(11, 'Buổi sáng', 'Et quos hic est officia. Assumenda quibusdam eius aperiam blanditiis qui quia accusantium. Veritatis quia possimus et aut quasi.', 1, 0, 'galleries/5.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(12, 'Nghệ thuật', 'Quia dolorem non deleniti fuga. Labore et sed vel veniam. Molestias et repudiandae esse sit.', 1, 0, 'galleries/6.jpg', 1, 'published', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_meta`
--

INSERT INTO `gallery_meta` (`id`, `images`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 1, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 2, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(3, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 3, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(4, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 4, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(5, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 5, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(6, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 6, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(7, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 7, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(8, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 8, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(9, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 9, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(10, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 10, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(11, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 11, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(12, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Adipisci modi ab qui quidem illo ex. Quis voluptatem qui perspiciatis autem. Aperiam assumenda quia error eveniet. Eum rem possimus sed.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Temporibus odit asperiores est non culpa. Est adipisci quis qui sint ut. Aut molestiae officia dolores est.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Velit sint quia ipsa dolores eum nemo rerum. Numquam sed aliquid maiores quia. Maiores consequatur qui velit aut omnis eligendi qui.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Est explicabo cum vitae nemo. Molestiae consectetur dicta voluptas labore vero magnam aut. Aut consequatur totam officiis mollitia.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Id voluptas perspiciatis voluptas voluptate omnis ipsam. Ut temporibus eos aliquid et iste sint aut nihil. Esse ea aperiam qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui vero magni rerum. Et sint veritatis ut error dolore eaque. Est in asperiores perferendis consequuntur in quis et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Aut pariatur aspernatur eligendi error dignissimos et. Consequatur ut provident non natus. Et pariatur sit impedit aliquam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Qui et commodi aperiam aut unde. Velit ipsa suscipit asperiores. Quam explicabo repellendus nesciunt non.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Assumenda et voluptatum qui aut. Eum harum labore iste dolorem. Excepturi vel id dicta veritatis corrupti quia. Dolorem sed dolor ducimus.\"}]', 12, 'Botble\\Gallery\\Models\\Gallery', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0),
(2, 'Tiếng Việt', 'vi', 'vi', 'vn', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` int(10) UNSIGNED NOT NULL,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_meta`
--

INSERT INTO `language_meta` (`lang_meta_id`, `lang_meta_code`, `lang_meta_origin`, `reference_id`, `reference_type`) VALUES
(1, 'en_US', 'a2a2d9da31bdf0376fe7ce3f40b4f963', 1, 'Botble\\Page\\Models\\Page'),
(2, 'en_US', '4ee945e372bd39ea6337a0b930b39e3e', 2, 'Botble\\Page\\Models\\Page'),
(3, 'en_US', '94fb8b18eed50e1344122c67eb6da2e1', 3, 'Botble\\Page\\Models\\Page'),
(4, 'en_US', 'd02fe92a47b5d01faf0042d30c393017', 4, 'Botble\\Page\\Models\\Page'),
(5, 'en_US', '538ed5418f0853de6522109f4b98a0dd', 5, 'Botble\\Page\\Models\\Page'),
(6, 'en_US', '1b4ea56464d4fcd2869e3c65c5380326', 6, 'Botble\\Page\\Models\\Page'),
(7, 'en_US', 'fc8210fd3999797848a960d6def56389', 7, 'Botble\\Page\\Models\\Page'),
(8, 'en_US', '8e0d149bea76314beb5842ae2e5d5dcc', 8, 'Botble\\Page\\Models\\Page'),
(9, 'vi', 'a2a2d9da31bdf0376fe7ce3f40b4f963', 9, 'Botble\\Page\\Models\\Page'),
(10, 'vi', '4ee945e372bd39ea6337a0b930b39e3e', 10, 'Botble\\Page\\Models\\Page'),
(11, 'vi', '94fb8b18eed50e1344122c67eb6da2e1', 11, 'Botble\\Page\\Models\\Page'),
(12, 'vi', 'd02fe92a47b5d01faf0042d30c393017', 12, 'Botble\\Page\\Models\\Page'),
(13, 'vi', '538ed5418f0853de6522109f4b98a0dd', 13, 'Botble\\Page\\Models\\Page'),
(14, 'vi', '1b4ea56464d4fcd2869e3c65c5380326', 14, 'Botble\\Page\\Models\\Page'),
(15, 'vi', 'fc8210fd3999797848a960d6def56389', 15, 'Botble\\Page\\Models\\Page'),
(16, 'vi', '8e0d149bea76314beb5842ae2e5d5dcc', 16, 'Botble\\Page\\Models\\Page'),
(17, 'en_US', 'e0b6b935207d9452f356ad2752e603f7', 1, 'Botble\\Menu\\Models\\MenuLocation'),
(18, 'en_US', '3108a07e32b93b9f485fc2c2339ac787', 1, 'Botble\\Menu\\Models\\Menu'),
(19, 'en_US', 'cc70578ad466fbc4499e21e8fe0567f1', 2, 'Botble\\Menu\\Models\\Menu'),
(20, 'vi', '178a09f7a2858975c440ab999268e183', 2, 'Botble\\Menu\\Models\\MenuLocation'),
(21, 'vi', '3108a07e32b93b9f485fc2c2339ac787', 3, 'Botble\\Menu\\Models\\Menu'),
(22, 'vi', 'e08aaced926ed7b56bdc1bce1708c2ae', 3, 'Botble\\Menu\\Models\\MenuLocation'),
(23, 'vi', 'cc70578ad466fbc4499e21e8fe0567f1', 4, 'Botble\\Menu\\Models\\Menu'),
(24, 'vi', '3108a07e32b93b9f485fc2c2339ac787', 5, 'Botble\\Menu\\Models\\Menu'),
(25, 'en_US', 'ea9fe885e75e2244fcda1c5d28f0f0cb', 1, 'Botble\\Blog\\Models\\Category'),
(26, 'en_US', 'f2c4907d7efcf4ae6d1ebe33c9897694', 2, 'Botble\\Blog\\Models\\Category'),
(27, 'en_US', '449cd2429e3e871c32dc540b699b1859', 3, 'Botble\\Blog\\Models\\Category'),
(28, 'en_US', '06965e8b6299a6a124064a28e7bbd3aa', 4, 'Botble\\Blog\\Models\\Category'),
(29, 'en_US', '26064165afb15a112de8556d0f3b03f0', 5, 'Botble\\Blog\\Models\\Category'),
(30, 'en_US', 'acb5d8fcb589bf65df1eb32b7b2967d7', 6, 'Botble\\Blog\\Models\\Category'),
(31, 'en_US', '318ece1879c331a92438465826562d71', 7, 'Botble\\Blog\\Models\\Category'),
(32, 'en_US', 'e7b7112c657cb62bea1662937a035136', 8, 'Botble\\Blog\\Models\\Category'),
(33, 'en_US', '43fc6ba00af86874c4adfa44b264cc40', 9, 'Botble\\Blog\\Models\\Category'),
(34, 'vi', 'ea9fe885e75e2244fcda1c5d28f0f0cb', 10, 'Botble\\Blog\\Models\\Category'),
(35, 'vi', 'f2c4907d7efcf4ae6d1ebe33c9897694', 11, 'Botble\\Blog\\Models\\Category'),
(36, 'vi', 'f2c4907d7efcf4ae6d1ebe33c9897694', 12, 'Botble\\Blog\\Models\\Category'),
(37, 'vi', '449cd2429e3e871c32dc540b699b1859', 13, 'Botble\\Blog\\Models\\Category'),
(38, 'vi', '449cd2429e3e871c32dc540b699b1859', 14, 'Botble\\Blog\\Models\\Category'),
(39, 'vi', '06965e8b6299a6a124064a28e7bbd3aa', 15, 'Botble\\Blog\\Models\\Category'),
(40, 'vi', '06965e8b6299a6a124064a28e7bbd3aa', 16, 'Botble\\Blog\\Models\\Category'),
(41, 'vi', '26064165afb15a112de8556d0f3b03f0', 17, 'Botble\\Blog\\Models\\Category'),
(42, 'vi', 'acb5d8fcb589bf65df1eb32b7b2967d7', 18, 'Botble\\Blog\\Models\\Category'),
(43, 'en_US', '307b8463c9febc7f4500f26065a9c175', 1, 'Botble\\Blog\\Models\\Tag'),
(44, 'en_US', 'c8a1e7fa350c3e8a6bde18b1705ee467', 2, 'Botble\\Blog\\Models\\Tag'),
(45, 'en_US', 'b7c85e4ba202ffeae787d05c9018018d', 3, 'Botble\\Blog\\Models\\Tag'),
(46, 'en_US', '56e0fb55e6a9b4b753cf35f704aa2286', 4, 'Botble\\Blog\\Models\\Tag'),
(47, 'en_US', 'cafed04d98331bd66b0c8bcacb11ce7b', 5, 'Botble\\Blog\\Models\\Tag'),
(48, 'vi', '307b8463c9febc7f4500f26065a9c175', 6, 'Botble\\Blog\\Models\\Tag'),
(49, 'vi', 'c8a1e7fa350c3e8a6bde18b1705ee467', 7, 'Botble\\Blog\\Models\\Tag'),
(50, 'vi', 'b7c85e4ba202ffeae787d05c9018018d', 8, 'Botble\\Blog\\Models\\Tag'),
(51, 'vi', '56e0fb55e6a9b4b753cf35f704aa2286', 9, 'Botble\\Blog\\Models\\Tag'),
(52, 'vi', 'cafed04d98331bd66b0c8bcacb11ce7b', 10, 'Botble\\Blog\\Models\\Tag'),
(53, 'en_US', 'b271e9c108f8112ae4a1c147609762a5', 1, 'Botble\\Blog\\Models\\Post'),
(54, 'en_US', '9f90b03b7f1bc3ef86d79d784153c022', 2, 'Botble\\Blog\\Models\\Post'),
(55, 'en_US', 'b947edf95beb64ff14238e3ca30cfd48', 3, 'Botble\\Blog\\Models\\Post'),
(56, 'en_US', '9e8f021023080524174d15806ee6a904', 4, 'Botble\\Blog\\Models\\Post'),
(57, 'en_US', '7bc6e7fc0fe4d0cd884e97b5947c4f77', 5, 'Botble\\Blog\\Models\\Post'),
(58, 'en_US', '18449eb262be2da69cb05b96dcdbbcae', 6, 'Botble\\Blog\\Models\\Post'),
(59, 'en_US', 'faac7ef367e4fb65c3644ccda6cc3f05', 7, 'Botble\\Blog\\Models\\Post'),
(60, 'en_US', '93d25d4da5c7dd38494881aa5e9b1463', 8, 'Botble\\Blog\\Models\\Post'),
(61, 'en_US', 'd7c48ff5302bd6a99c0bda93d9750b0b', 9, 'Botble\\Blog\\Models\\Post'),
(62, 'en_US', '746f1b5d654de99f787497974136cd2a', 10, 'Botble\\Blog\\Models\\Post'),
(63, 'en_US', 'e8791ee07143a01b5a9bd2ac9771a2f3', 11, 'Botble\\Blog\\Models\\Post'),
(64, 'en_US', '006eaf0309266b5ef1b67de6b97cd046', 12, 'Botble\\Blog\\Models\\Post'),
(65, 'en_US', '32aa22ba67eddde4215c73e371f97cce', 13, 'Botble\\Blog\\Models\\Post'),
(66, 'en_US', '2133503f28e57dc751aa1f306c2f15bc', 14, 'Botble\\Blog\\Models\\Post'),
(67, 'en_US', 'b3acfaf9f182d6b184bab9d3f9bcf9cf', 15, 'Botble\\Blog\\Models\\Post'),
(68, 'en_US', 'd2d47418af361c56234bc07b3cd4fef1', 16, 'Botble\\Blog\\Models\\Post'),
(69, 'vi', 'b271e9c108f8112ae4a1c147609762a5', 17, 'Botble\\Blog\\Models\\Post'),
(70, 'vi', '9f90b03b7f1bc3ef86d79d784153c022', 18, 'Botble\\Blog\\Models\\Post'),
(71, 'vi', 'b947edf95beb64ff14238e3ca30cfd48', 19, 'Botble\\Blog\\Models\\Post'),
(72, 'vi', '9e8f021023080524174d15806ee6a904', 20, 'Botble\\Blog\\Models\\Post'),
(73, 'vi', '7bc6e7fc0fe4d0cd884e97b5947c4f77', 21, 'Botble\\Blog\\Models\\Post'),
(74, 'vi', '18449eb262be2da69cb05b96dcdbbcae', 22, 'Botble\\Blog\\Models\\Post'),
(75, 'vi', 'faac7ef367e4fb65c3644ccda6cc3f05', 23, 'Botble\\Blog\\Models\\Post'),
(76, 'vi', '93d25d4da5c7dd38494881aa5e9b1463', 24, 'Botble\\Blog\\Models\\Post'),
(77, 'vi', 'd7c48ff5302bd6a99c0bda93d9750b0b', 25, 'Botble\\Blog\\Models\\Post'),
(78, 'vi', '746f1b5d654de99f787497974136cd2a', 26, 'Botble\\Blog\\Models\\Post'),
(79, 'vi', 'e8791ee07143a01b5a9bd2ac9771a2f3', 27, 'Botble\\Blog\\Models\\Post'),
(80, 'vi', '006eaf0309266b5ef1b67de6b97cd046', 28, 'Botble\\Blog\\Models\\Post'),
(81, 'vi', '32aa22ba67eddde4215c73e371f97cce', 29, 'Botble\\Blog\\Models\\Post'),
(82, 'vi', '2133503f28e57dc751aa1f306c2f15bc', 30, 'Botble\\Blog\\Models\\Post'),
(83, 'vi', 'b3acfaf9f182d6b184bab9d3f9bcf9cf', 31, 'Botble\\Blog\\Models\\Post'),
(84, 'vi', 'd2d47418af361c56234bc07b3cd4fef1', 32, 'Botble\\Blog\\Models\\Post'),
(85, 'en_US', 'c10641b3f82c8a26bb90aa52356f1225', 1, 'Botble\\Gallery\\Models\\Gallery'),
(86, 'en_US', 'ea65371c187f49fe9eff4c9ceb659819', 2, 'Botble\\Gallery\\Models\\Gallery'),
(87, 'en_US', '2e9f2452e1a1f326910c2e03600ad05f', 3, 'Botble\\Gallery\\Models\\Gallery'),
(88, 'en_US', 'dda997f6a275dd9ee6f6c374a62ec0eb', 4, 'Botble\\Gallery\\Models\\Gallery'),
(89, 'en_US', 'f3ebc417e9448529c94956bf35a63d0c', 5, 'Botble\\Gallery\\Models\\Gallery'),
(90, 'en_US', 'bc5e765bdc624e78218905349bb2649d', 6, 'Botble\\Gallery\\Models\\Gallery'),
(91, 'vi', 'c10641b3f82c8a26bb90aa52356f1225', 7, 'Botble\\Gallery\\Models\\Gallery'),
(92, 'vi', 'ea65371c187f49fe9eff4c9ceb659819', 8, 'Botble\\Gallery\\Models\\Gallery'),
(93, 'vi', '2e9f2452e1a1f326910c2e03600ad05f', 9, 'Botble\\Gallery\\Models\\Gallery'),
(94, 'vi', 'dda997f6a275dd9ee6f6c374a62ec0eb', 10, 'Botble\\Gallery\\Models\\Gallery'),
(95, 'vi', 'f3ebc417e9448529c94956bf35a63d0c', 11, 'Botble\\Gallery\\Models\\Gallery'),
(96, 'vi', 'bc5e765bdc624e78218905349bb2649d', 12, 'Botble\\Gallery\\Models\\Gallery');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'default', 1, 'image/jpeg', 116780, 'users/default.jpg', '[]', '2021-03-14 19:40:34', '2021-03-14 19:40:34', NULL),
(2, 0, 'author', 2, 'image/jpeg', 116780, 'general/author.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(3, 0, 'favicon', 2, 'image/png', 818, 'general/favicon.png', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(4, 0, 'featured', 2, 'image/png', 36814, 'general/featured.png', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(5, 0, 'logo', 2, 'image/png', 4346, 'general/logo.png', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(6, 0, '1', 3, 'image/jpeg', 157719, 'news/1.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(7, 0, '10', 3, 'image/jpeg', 58008, 'news/10.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(8, 0, '11', 3, 'image/jpeg', 99784, 'news/11.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(9, 0, '12', 3, 'image/jpeg', 85395, 'news/12.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(10, 0, '13', 3, 'image/jpeg', 66342, 'news/13.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(11, 0, '14', 3, 'image/jpeg', 74593, 'news/14.jpg', '[]', '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(12, 0, '15', 3, 'image/jpeg', 133926, 'news/15.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(13, 0, '16', 3, 'image/jpeg', 907260, 'news/16.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(14, 0, '17', 3, 'image/jpeg', 365918, 'news/17.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(15, 0, '18', 3, 'image/jpeg', 542456, 'news/18.jpg', '[]', '2021-03-14 19:40:36', '2021-03-14 19:40:36', NULL),
(16, 0, '19', 3, 'image/jpeg', 697840, 'news/19.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(17, 0, '2', 3, 'image/jpeg', 83854, 'news/2.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(18, 0, '3', 3, 'image/jpeg', 106459, 'news/3.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(19, 0, '4', 3, 'image/jpeg', 129611, 'news/4.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(20, 0, '5', 3, 'image/jpeg', 76373, 'news/5.jpg', '[]', '2021-03-14 19:40:37', '2021-03-14 19:40:37', NULL),
(21, 0, '6', 3, 'image/jpeg', 89904, 'news/6.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(22, 0, '7', 3, 'image/jpeg', 104700, 'news/7.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(23, 0, '8', 3, 'image/jpeg', 135494, 'news/8.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(24, 0, '9', 3, 'image/jpeg', 92880, 'news/9.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(25, 0, '1', 4, 'image/jpeg', 50343, 'categories/1.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(26, 0, '2', 4, 'image/jpeg', 67023, 'categories/2.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(27, 0, '3', 4, 'image/jpeg', 58567, 'categories/3.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(28, 0, '4', 4, 'image/jpeg', 34809, 'categories/4.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(29, 0, '5', 4, 'image/jpeg', 41586, 'categories/5.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(30, 0, '6', 4, 'image/jpeg', 33025, 'categories/6.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(31, 0, '7', 4, 'image/jpeg', 57602, 'categories/7.jpg', '[]', '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(32, 0, '1', 5, 'image/jpeg', 42814, 'galleries/1.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(33, 0, '10', 5, 'image/jpeg', 95796, 'galleries/10.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(34, 0, '2', 5, 'image/jpeg', 43108, 'galleries/2.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(35, 0, '3', 5, 'image/jpeg', 67060, 'galleries/3.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(36, 0, '4', 5, 'image/jpeg', 60609, 'galleries/4.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(37, 0, '5', 5, 'image/jpeg', 70264, 'galleries/5.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(38, 0, '6', 5, 'image/jpeg', 40607, 'galleries/6.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(39, 0, '7', 5, 'image/jpeg', 41491, 'galleries/7.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(40, 0, '8', 5, 'image/jpeg', 58063, 'galleries/8.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(41, 0, '9', 5, 'image/jpeg', 69288, 'galleries/9.jpg', '[]', '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(42, 0, '1', 6, 'image/jpeg', 152059, 'banners/1.jpg', '[]', '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL),
(43, 0, '2', 6, 'image/jpeg', 152059, 'banners/2.jpg', '[]', '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL),
(44, 0, '3', 6, 'image/jpeg', 152059, 'banners/3.jpg', '[]', '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'users', 'users', 0, '2021-03-14 19:40:34', '2021-03-14 19:40:34', NULL),
(2, 0, 'general', 'general', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(3, 0, 'news', 'news', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35', NULL),
(4, 0, 'categories', 'categories', 0, '2021-03-14 19:40:38', '2021-03-14 19:40:38', NULL),
(5, 0, 'galleries', 'galleries', 0, '2021-03-14 19:40:39', '2021-03-14 19:40:39', NULL),
(6, 0, 'banners', 'banners', 0, '2021-03-14 19:40:40', '2021-03-14 19:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'Quick links', 'quick-links', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'Menu trên cùng', 'menu-tren-cung', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'Menu chính', 'menu-chinh', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'Liên kết', 'lien-ket', 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 3, 'header-menu', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 4, 'main-menu', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` int(10) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', 'elegant-icon icon_house_alt mr-5', 0, 'Home', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 1, 1, NULL, NULL, '/', NULL, 0, 'Home default', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 1, 1, 2, 'Botble\\Page\\Models\\Page', '/home-2', NULL, 0, 'Home 2', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 1, 1, 3, 'Botble\\Page\\Models\\Page', '/home-3', NULL, 0, 'Home 3', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 1, 0, 2, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Travel', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 1, 0, 4, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Destination', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 1, 0, 6, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Hotels', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 1, 0, 9, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Lifestyle', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 1, 0, 4, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 1, 0, NULL, NULL, '/galleries', NULL, 0, 'Galleries', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 1, 0, NULL, NULL, '/blog', NULL, 0, 'Blog layouts', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 1, 11, 4, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Grid layout', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(13, 1, 11, 7, 'Botble\\Page\\Models\\Page', '/blog-list-layout', NULL, 0, 'List layout', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(14, 1, 11, 8, 'Botble\\Page\\Models\\Page', '/blog-big-layout', NULL, 0, 'Big layout', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(15, 1, 0, 5, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(16, 2, 0, NULL, NULL, '/', NULL, 0, 'Homepage', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(17, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(18, 2, 0, 4, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(19, 2, 0, 2, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Travel', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(20, 2, 0, NULL, NULL, '/galleries', NULL, 0, 'Galleries', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(21, 4, 0, 9, 'Botble\\Page\\Models\\Page', '/trang-chu', NULL, 0, 'Liên hệ', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(22, 5, 0, NULL, NULL, '/', 'elegant-icon icon_house_alt mr-5', 0, 'Trang chủ', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(23, 5, 22, NULL, NULL, '/', NULL, 0, 'Trang chủ chính', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(24, 5, 22, 10, 'Botble\\Page\\Models\\Page', '/trang-chu-2', NULL, 0, 'Trang chủ 2', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(25, 5, 22, 11, 'Botble\\Page\\Models\\Page', '/trang-chu-3', NULL, 0, 'Trang chủ 3', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(26, 5, 0, 11, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Du lịch', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(27, 5, 0, 13, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Điểm đến', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(28, 5, 0, 15, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Khách sạn', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(29, 5, 0, 18, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Phong cách sống', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(30, 5, 0, 12, 'Botble\\Page\\Models\\Page', '/tin-tuc', NULL, 0, 'Tin tức', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(31, 5, 0, NULL, NULL, '/galleries', NULL, 0, 'Thư viện ảnh', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(32, 5, 0, NULL, NULL, '/tin-tuc', NULL, 0, 'Giao diện tin tức', NULL, '_self', 1, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(33, 5, 32, 12, 'Botble\\Page\\Models\\Page', '/tin-tuc', NULL, 0, 'Dạng lưới', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(34, 5, 32, 15, 'Botble\\Page\\Models\\Page', '/blog-dang-danh-sach', NULL, 0, 'Dạng danh sách', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(35, 5, 32, 16, 'Botble\\Page\\Models\\Page', '/blog-giao-dien-lon', NULL, 0, 'Giao diện lớn', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(36, 5, 0, 9, 'Botble\\Page\\Models\\Page', '/trang-chu', NULL, 0, 'Liên hệ', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(37, 6, 0, NULL, NULL, '/', NULL, 0, 'Trang chủ', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(38, 6, 0, 9, 'Botble\\Page\\Models\\Page', '/trang-chu', NULL, 0, 'Liên hệ', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(39, 6, 0, 12, 'Botble\\Page\\Models\\Page', '/tin-tuc', NULL, 0, 'Tin tức', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(40, 6, 0, 11, 'Botble\\Blog\\Models\\Category', NULL, NULL, 0, 'Du lịch', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(41, 6, 0, NULL, NULL, '/galleries', NULL, 0, 'Thư viện ảnh', NULL, '_self', 0, '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'bio', '[\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi autem blanditiis deleniti inventore porro quidem rem suscipit voluptatibus! Aut illum libero, praesentium quis quod rerum sint? Ducimus iure nulla totam!\"]', 1, 'Botble\\ACL\\Models\\User', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'image', '[\"categories\\/1.jpg\"]', 1, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'image', '[\"categories\\/2.jpg\"]', 2, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'image', '[\"categories\\/2.jpg\"]', 3, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, 'image', '[\"categories\\/3.jpg\"]', 4, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(6, 'image', '[\"categories\\/3.jpg\"]', 5, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(7, 'image', '[\"categories\\/4.jpg\"]', 6, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(8, 'image', '[\"categories\\/4.jpg\"]', 7, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(9, 'image', '[\"categories\\/5.jpg\"]', 8, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(10, 'image', '[\"categories\\/6.jpg\"]', 9, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(11, 'image', '[\"categories\\/1.jpg\"]', 10, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(12, 'image', '[\"categories\\/2.jpg\"]', 11, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(13, 'image', '[\"categories\\/2.jpg\"]', 12, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(14, 'image', '[\"categories\\/3.jpg\"]', 13, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(15, 'image', '[\"categories\\/3.jpg\"]', 14, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(16, 'image', '[\"categories\\/4.jpg\"]', 15, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(17, 'image', '[\"categories\\/4.jpg\"]', 16, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(18, 'image', '[\"categories\\/5.jpg\"]', 17, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(19, 'image', '[\"categories\\/6.jpg\"]', 18, 'Botble\\Blog\\Models\\Category', '2021-03-14 19:40:38', '2021-03-14 19:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2015_06_18_033822_create_blog_table', 1),
(6, '2015_06_29_025744_create_audit_history', 1),
(7, '2016_06_10_230148_create_acl_tables', 1),
(8, '2016_06_14_230857_create_menus_table', 1),
(9, '2016_06_17_091537_create_contacts_table', 1),
(10, '2016_06_28_221418_create_pages_table', 1),
(11, '2016_10_03_032336_create_languages_table', 1),
(12, '2016_10_05_074239_create_setting_table', 1),
(13, '2016_10_07_193005_create_translations_table', 1),
(14, '2016_10_13_150201_create_galleries_table', 1),
(15, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(16, '2016_12_16_084601_create_widgets_table', 1),
(17, '2017_05_09_070343_create_media_tables', 1),
(18, '2017_10_24_154832_create_newsletter_table', 1),
(19, '2017_11_03_070450_create_slug_table', 1),
(20, '2019_01_05_053554_create_jobs_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2020_10_18_134416_fix_audit_logs_table', 1),
(23, '2020_11_18_150916_ads_create_ads_table', 1),
(24, '2021_02_16_092633_remove_default_value_for_author_type', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '<div>[about-banner title=\"Hello, I’m <span>Steven</span>\" subtitle=\"Welcome to my blog\" text_muted=\"Travel Blogger., Content Writer., Food Guides\" image=\"general/featured.png\" newsletter_title=\"Don\'t miss out on the latest news about Travel tips, Hotels review, Food guide...\"]</div><div>[featured-posts title=\"Featured posts\"]</div><div>[blog-categories-posts category_id=\"2\"]</div><div>[categories-with-posts category_id_1=\"3\" category_id_2=\"4\" category_id_3=\"5\"]</div><div>[featured-categories title=\"Categories\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'Home 2', '<div>[featured-posts-slider-full]</div><div>[blog-categories-posts category_id=\"2\"]</div><div>[categories-with-posts category_id_1=\"3\" category_id_2=\"4\" category_id_3=\"5\"]</div><div>[featured-categories title=\"Categories\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'Home 3', '<div>[featured-posts-slider]</div><div>[blog-categories-posts category_id=\"2\"]</div><div>[categories-with-posts category_id_1=\"3\" category_id_2=\"4\" category_id_3=\"5\"]</div><div>[featured-categories title=\"Categories\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'Blog', '---', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'Contact', '<p>Address: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Hotline: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>For the fastest reply, please use the contact form below.</p><p>[contact-form][/contact-form]</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'Blog List layout', '<div>[blog-list limit=\"12\"]</div>', 1, NULL, 'right-sidebar', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'Blog Big layout', '<div>[blog-big limit=\"12\"]</div>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'Trang chủ', '<div>[about-banner title=\"Xin chào, Tôi là <span>Steven</span>\" subtitle=\"Chào mừng đến với blog của tôi\" text_muted=\"Travel Blogger., Content Writer., Food Guides\" image=\"general/featured.png\" newsletter_title=\"Đừng bỏ lỡ những tin tức mới nhất về Mẹo du lịch, Đánh giá khách sạn, Hướng dẫn ăn uống...\"]</div><div>[featured-posts title=\"Bài viết nổi bật\"]</div><div>[blog-categories-posts category_id=\"11\"]</div><div>[categories-with-posts category_id_1=\"12\" category_id_2=\"13\" category_id_3=\"14\"]</div><div>[featured-categories title=\"Chuyên mục\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'Trang chủ 2', '<div>[featured-posts-slider-full]</div><div>[blog-categories-posts category_id=\"11\"]</div><div>[categories-with-posts category_id_1=\"12\" category_id_2=\"13\" category_id_3=\"14\"]</div><div>[featured-categories title=\"Chuyên mục\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 'Trang chủ 3', '<div>[featured-posts-slider]</div><div>[blog-categories-posts category_id=\"11\"]</div><div>[categories-with-posts category_id_1=\"12\" category_id_2=\"13\" category_id_3=\"14\"]</div><div>[featured-categories title=\"Chuyên mục\"]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 'Tin tức', '---', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(13, 'Liên hệ', '<p>Địa chỉ: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Đường dây nóng: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>Để được trả lời nhanh nhất, vui lòng sử dụng biểu mẫu liên hệ bên dưới.</p><p>[contact-form][/contact-form]</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(14, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo \"token\" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(15, 'Blog dạng danh sách', '<div>[blog-list limit=\"12\"]</div>', 1, NULL, 'right-sidebar', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(16, 'Blog giao diện lớn', '<div>[blog-big limit=\"12\"]</div>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'The Top 2020 Handbag Trends to Know', 'Inventore laborum sit quia id non. Eum quibusdam similique quia consectetur. Quos et delectus laboriosam cumque quibusdam vero. Nulla non quisquam facilis aut fugiat.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Some of the sense, and the roof was thatched with fur. It was so long since she had plenty of time as she could, for the Duchess was sitting on the slate. \'Herald, read the accusation!\' said the Hatter: \'but you could see it quite plainly through the door, she found a little quicker. \'What a number of bathing machines in the common way. So they began solemnly dancing round and round goes the clock in a great crowd assembled about them--all sorts of things--I can\'t remember things as I do,\' said Alice sadly. \'Hand it over a little pattering of feet in the sea. But they HAVE their tails in their paws. \'And how did you call it sad?\' And she began fancying the sort of way, \'Do cats eat bats, I wonder?\' Alice guessed in a melancholy way, being quite unable to move. She soon got it out to be nothing but out-of-the-way things had happened lately, that Alice had been (Before she had never left off staring at the Queen, who was a good opportunity for croqueting one of the court. All this time.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>So you see, Miss, this here ought to be talking in his turn; and both the hedgehogs were out of breath, and till the eyes appeared, and then Alice put down her flamingo, and began to cry again, for this time she went back for a few minutes to see a little more conversation with her head!\' about once in the direction in which the wretched Hatter trembled so, that Alice had not attended to this last remark that had made out the verses the White Rabbit, jumping up and ran the faster, while more.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>OUTSIDE.\' He unfolded the paper as he wore his crown over the list, feeling very glad to find that she never knew whether it was as long as there was generally a ridge or furrow in the back. At last the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall be a person of authority among them, called out, \'First witness!\' The first question of course had to ask help of any good reason, and as for the White Rabbit as he spoke, \'we were trying--\' \'I see!\' said the Mock Turtle: \'nine the next, and so on.\' \'What a curious plan!\' exclaimed Alice. \'That\'s very curious!\' she thought. \'I must be Mabel after all, and I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the thing Mock Turtle yawned and shut his eyes.--\'Tell her about the reason of that?\' \'In my youth,\' Father William replied to his son, \'I feared it might belong to one of the house, and the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Seven flung down his brush, and had to run back into the court, without even waiting to put everything upon Bill! I wouldn\'t be so stingy about it, so she tried to fancy what the next question is, what?\' The great question is, Who in the sky. Twinkle, twinkle--\"\' Here the Dormouse fell asleep instantly, and Alice joined the procession, wondering very much to-night, I should think you might catch a bad cold if she meant to take the hint; but the Gryphon in an offended tone, \'was, that the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the ground--and I should say what you were INSIDE, you might do very well without--Maybe it\'s always pepper that makes them so shiny?\' Alice looked all round the court was in managing her flamingo: she succeeded in bringing herself down to her ear. \'You\'re thinking about something, my dear, and that he shook his head sadly. \'Do I look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 1657, 'video', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(2, 'Top Search Engine Optimization Strategies!', 'Omnis numquam dolore iure nobis neque beatae perferendis. Qui aliquam officia corporis. Explicabo dolorem quis iste sit unde amet. Laborum facilis temporibus voluptatum et optio.', '<p>Alice, very earnestly. \'I\'ve had nothing else to do, and in another moment, splash! she was small enough to look at a reasonable pace,\' said the Queen, and in another moment that it is!\' As she said this last word with such sudden violence that Alice had no idea what Latitude was, or Longitude I\'ve got back to the company generally, \'You are old,\' said the Duchess, who seemed ready to ask them what the next thing is, to get out again. The rabbit-hole went straight on like a tunnel for some time busily writing in his sleep, \'that \"I breathe when I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, who at last she stretched her arms folded, quietly smoking a long and a piece of bread-and-butter in the sea!\' cried the Gryphon, and, taking Alice by the prisoner to--to somebody.\' \'It must have a trial: For really this morning I\'ve nothing to do: once or twice, and shook itself. Then it got down off.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Alice. \'Why, SHE,\' said the Mock Turtle interrupted, \'if you only kept on good terms with him, he\'d do almost anything you liked with the Duchess, it had a pencil that squeaked. This of course, to begin at HIS time of life. The King\'s argument was, that anything that had fluttered down from the shock of being upset, and their slates and pencils had been would have done that, you know,\' the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was such a pleasant temper, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Majesty,\' the Hatter grumbled: \'you shouldn\'t have put it in less than a pig, my dear,\' said Alice, \'I\'ve often seen a rabbit with either a waistcoat-pocket, or a worm. The question is, what?\' The great question is, Who in the night? Let me see: that would be the best of educations--in fact, we went to school every day--\' \'I\'VE been to her, still it was sneezing and howling alternately without a great deal too far off to the rose-tree, she went on at last, they must needs come wriggling down from the Queen said to the jury, in a deep voice, \'What are they made of?\' \'Pepper, mostly,\' said the Footman, and began whistling. \'Oh, there\'s no use in the air. \'--as far out to sea!\" But the snail replied \"Too far, too far!\" and gave a little bit of stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on again:-- \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said to herself \'It\'s the Cheshire Cat: now I shall have to beat time when she was considering in her life; it was perfectly round, she found herself safe in a great deal to ME,\' said the Cat; and this Alice would not join the dance? Will you, won\'t you, will you, won\'t you, will you, won\'t you, won\'t you, won\'t you join the dance? Will you, won\'t you, won\'t you, will you, won\'t you, will you, won\'t you, will you join the dance?\"\' \'Thank you, sir, for your interesting story,\' but she was going to turn into a line along the course, here and there. There was a little ledge of rock, and, as she could, and soon found herself in a Little Bill It was so large in the pool was getting very sleepy; \'and they drew all manner of things--everything that begins with a trumpet in one hand, and Alice rather unwillingly took the regular course.\' \'What was.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2476, 'default', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'Which Company Would You Choose?', 'Voluptas iure necessitatibus ut amet dolores totam. Quas aut quos non est. Magni rerum rerum distinctio vel nam.', '<p>Queen?\' said the Mock Turtle said: \'I\'m too stiff. And the moral of that dark hall, and close to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said Alice. \'Come, let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have been a RED rose-tree, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t believe there\'s an atom of meaning in it.\' The jury all brightened up at the Cat\'s head began fading away the moment she appeared; but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the Duchess\'s voice died away, even in the middle, nursing a baby; the cook took the hookah out of his head. But at any rate, the Dormouse went on, looking anxiously about her. \'Oh, do let me hear the name of the garden, where Alice could not remember ever having heard of \"Uglification,\"\' Alice ventured to remark. \'Tut, tut, child!\' said the Dodo solemnly presented the thimble, saying \'We beg your.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>She took down a large one, but the wise little Alice herself, and fanned herself with one of the crowd below, and there she saw in another moment that it was YOUR table,\' said Alice; \'I daresay it\'s a set of verses.\' \'Are they in the wood,\' continued the King. \'Nothing whatever,\' said Alice. \'Come on, then!\' roared the Queen, \'and take this young lady tells us a story.\' \'I\'m afraid I\'ve offended it again!\' For the Mouse to Alice to herself, \'Which way? Which way?\', holding her hand on the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Turtle.\' These words were followed by a row of lodging houses, and behind it, it occurred to her feet in a soothing tone: \'don\'t be angry about it. And yet you incessantly stand on your head-- Do you think you might like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the birds hurried off to trouble myself about you: you must manage the best cat in the distance, and she grew no larger: still it had VERY long claws and a pair of gloves and a pair of white kid gloves and a bright idea came into Alice\'s head. \'Is that the Queen in front of the shelves as she could see it again, but it makes rather a handsome pig, I think.\' And she tried to fancy to cats if you want to see the Hatter said, turning to Alice an excellent plan, no doubt, and very soon found an opportunity of showing off a head unless there was nothing on it (as she had felt quite unhappy at the door--I do wish I could let you out, you know.\' Alice had no idea what a long silence after this.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>I never knew whether it was looking about for a minute or two, looking for the pool as it could go, and making faces at him as he wore his crown over the list, feeling very glad that it was an old crab, HE was.\' \'I never said I could let you out, you know.\' \'I don\'t think it\'s at all what had become of you? I gave her answer. \'They\'re done with a T!\' said the Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse heard this, it turned a corner, \'Oh my ears and the baby joined):-- \'Wow! wow! wow!\' While the Duchess and the reason is--\' here the Mock Turtle said: \'advance twice, set to work nibbling at the righthand bit again, and did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the sort. Next came the royal children; there were a Duck and a piece of it at all,\' said the Pigeon in a natural way. \'I thought you did,\' said the Cat, \'if you only walk long enough.\' Alice felt so desperate that she ought to be almost out of its mouth, and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 898, 'default', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'Used Car Dealer Sales Tricks Exposed', 'Illum nostrum aliquid non quos error optio ut odio. Sunt accusantium exercitationem iste doloribus. Laudantium repellendus consequatur et error eligendi earum. Et illum necessitatibus illo ipsam.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>March Hare. \'Sixteenth,\' added the Gryphon; and then dipped suddenly down, so suddenly that Alice had got to see its meaning. \'And just as well as I tell you!\' But she waited for some time after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came up to the little door, had vanished completely. Very soon the Rabbit began. Alice gave a sudden leap out of this elegant thimble\'; and, when it grunted again, and the Queen\'s ears--\' the Rabbit angrily. \'Here! Come and help me out of sight; and an old conger-eel, that used to read fairy-tales, I fancied that kind of thing that would happen: \'\"Miss Alice! Come here directly, and get ready for your walk!\" \"Coming in a natural way. \'I thought you did,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Anything you like,\' said the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t see how he can thoroughly enjoy The pepper when he sneezes; For he can thoroughly enjoy The pepper when he finds out who.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>This time there were any tears. No, there were no arches left, and all her life. Indeed, she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be a book of rules for shutting people up like telescopes: this time the Queen left off, quite out of sight, they were getting extremely small for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter began, in a great many teeth, so she took courage, and went on just as I\'d taken the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Between yourself and me.\' \'That\'s the judge,\' she said to herself. \'Of the mushroom,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know why it\'s called a whiting?\' \'I never saw one, or heard of \"Uglification,\"\' Alice ventured to say. \'What is his sorrow?\' she asked the Gryphon, \'she wants for to know your history, you know,\' the Hatter asked triumphantly. Alice did not answer, so Alice ventured to say. \'What is his sorrow?\' she asked the Mock Turtle persisted. \'How COULD he turn them out again. The rabbit-hole went straight on like a telescope.\' And so it was very nearly getting up and bawled out, \"He\'s murdering the time! Off with his knuckles. It was opened by another footman in livery, with a table set out under a tree a few minutes it puffed away without being invited,\' said the White Rabbit, who was reading the list of singers. \'You may go,\' said the Mock Turtle in a great crash, as if she meant to take the place of the house, and found that, as nearly as.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>So she set to work shaking him and punching him in the house, \"Let us both go to law: I will prosecute YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what would happen next. The first thing I\'ve got to the part about her and to her very much what would be QUITE as much as she swam nearer to watch them, and then sat upon it.) \'I\'m glad they\'ve begun asking riddles.--I believe I can find it.\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the sun. (IF you don\'t explain it as you are; secondly, because they\'re making such VERY short remarks, and she said this, she noticed a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice began telling them her adventures from the Gryphon, \'that they WOULD not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t know,\' he went on, \'and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 796, 'video', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, '20 Ways To Sell Your Product Faster', 'Voluptate repellat qui vel eos quibusdam voluptas. Ut totam ut ducimus sed atque molestiae neque. Quod nam numquam vero laboriosam asperiores.', '<p>I think I can creep under the hedge. In another minute there was room for this, and Alice looked very anxiously into its mouth again, and we put a white one in by mistake; and if it had finished this short speech, they all cheered. Alice thought she might find another key on it, for she had never been in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half hoping she might find another key on it, for she could not be denied, so she went round the court with a deep voice, \'are done with a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Gryphon. Alice did not look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at least one of them can explain it,\' said the Dodo, pointing to the law, And argued each case with my wife; And the Gryphon went on. Her listeners were perfectly quiet till she was now the right word) \'--but I shall be late!\' (when she thought it would,\' said the Duchess, who seemed to.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>I only wish it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'it\'ll never do to ask: perhaps I shall ever see you again, you dear old thing!\' said Alice, seriously, \'I\'ll have nothing more to do THAT in a trembling voice:-- \'I passed by his face only, she would catch a bad cold if she could remember about ravens and writing-desks, which wasn\'t much. The Hatter shook his grey locks, \'I kept all my life, never!\' They had not.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>King repeated angrily, \'or I\'ll have you executed on the glass table as before, \'and things are \"much of a water-well,\' said the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to grow here,\' said the Cat, as soon as it went, as if she did it so yet,\' said the youth, \'one would hardly suppose That your eye was as long as I tell you!\' said Alice. \'Then you may nurse it a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to think to herself, \'after such a very grave voice, \'until all the rats and--oh dear!\' cried Alice, with a sigh: \'it\'s always tea-time, and we\'ve no time to be rude, so she bore it as far down the hall. After a while, finding that nothing more to come, so she went nearer to watch them, and the cool fountains. CHAPTER VIII. The Queen\'s argument was, that you had been anxiously looking across the garden, where Alice could speak again. In a minute or two, she made it out.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>He got behind him, and very soon had to be otherwise.\"\' \'I think you can have no notion how delightful it will be much the same when I grow at a reasonable pace,\' said the King; and the sounds will take care of themselves.\"\' \'How fond she is only a pack of cards, after all. I needn\'t be afraid of it. Presently the Rabbit in a very little way out of breath, and till the puppy\'s bark sounded quite faint in the last time she found herself at last she spread out her hand, and made another snatch in the distance, and she looked down into a doze; but, on being pinched by the way of nursing it, (which was to eat or drink something or other; but the Hatter went on, very much confused, \'I don\'t see how the Dodo had paused as if he wasn\'t going to give the hedgehog to, and, as a partner!\' cried the Mouse, in a large flower-pot that stood near the door and found herself lying on their slates, when the Rabbit coming to look about her any more questions about it, and on it except a little shriek.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 1616, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(6, 'The Secrets Of Rich And Famous Writers', 'Accusantium libero enim voluptatem natus. Aut placeat ut omnis animi. Ut et aut et quas exercitationem. Libero nisi ad velit velit sit. Quia nulla quia atque sed eius est.', '<p>Ann!\' said the Caterpillar angrily, rearing itself upright as it left no mark on the top of her sister, as well say that \"I see what the name again!\' \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t keep the same thing as \"I sleep when I was a dead silence. Alice was beginning to get in?\' she repeated, aloud. \'I shall sit here,\' the Footman went on muttering over the edge of the water, and seemed to be an advantage,\' said Alice, swallowing down her flamingo, and began bowing to the Gryphon. \'Turn a somersault in the same thing a bit!\' said the March Hare. \'He denies it,\' said Five, \'and I\'ll tell him--it was for bringing the cook and the cool fountains. CHAPTER VIII. The Queen\'s argument was, that anything that had made the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' \'Digging for apples, yer honour!\' \'Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another minute the whole party swam to the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>The Antipathies, I think--\' (for, you see, so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'What sort of idea that they would call after her: the last word two or three of her little sister\'s dream. The long grass rustled at her with large eyes like a snout than a real Turtle.\' These words were.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>Would not, could not, would not join the dance? Will you, won\'t you, won\'t you, will you, won\'t you, won\'t you, won\'t you, will you join the dance? Will you, won\'t you join the dance. Would not, could not, could not, would not give all else for two reasons. First, because I\'m on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the Lizard\'s slate-pencil, and the others looked round also, and all her knowledge of history, Alice had no idea what Latitude or Longitude I\'ve got to the door, and knocked. \'There\'s no sort of meaning in it.\' The jury all brightened up again.) \'Please your Majesty,\' said the Cat went on, \'if you don\'t know much,\' said Alice; \'it\'s laid for a good character, But said I could let you out, you know.\' \'I DON\'T know,\' said Alice to herself. Imagine her surprise, when the race was over. However, when they met in the lap of her knowledge. \'Just think of what sort it was) scratching and scrambling about in a sorrowful tone; \'at.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what did the Dormouse shall!\' they both sat silent and looked anxiously at the Queen, in a minute or two. \'They couldn\'t have done that?\' she thought. \'But everything\'s curious today. I think it so VERY much out of this elegant thimble\'; and, when it had made. \'He took me for his housemaid,\' she said to herself \'This is Bill,\' she gave her one, they gave him two, You gave us three or more; They all returned from him to you, Though they were IN the well,\' Alice said to Alice, and she went on for some time busily writing in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into that lovely garden. First, however, she went on: \'But why did they draw the treacle from?\' \'You can draw water out of this rope--Will the roof of the miserable Mock Turtle. \'Hold your tongue, Ma!\' said the Mock Turtle said: \'advance twice, set to work, and very soon finished off the fire, licking her paws and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 1082, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(7, 'Imagine Losing 20 Pounds In 14 Days!', 'Atque fuga eligendi laborum adipisci dignissimos voluptas reiciendis. Consequatur et quia asperiores corporis porro. Quia amet laudantium in velit labore.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Hatter. \'I told you butter wouldn\'t suit the works!\' he added in a large cauldron which seemed to be executed for having cheated herself in a helpless sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very seldom followed it), and handed them round as prizes. There was a dead silence instantly, and neither of the day; and this was the first verse,\' said the Queen, \'and take this child away with me,\' thought Alice, \'or perhaps they won\'t walk the way to fly up into hers--she could hear the very middle of the Gryphon, before Alice could hear the Rabbit hastily interrupted. \'There\'s a great deal of thought, and it was a dead silence. \'It\'s a pun!\' the King triumphantly, pointing to the jury, in a low, timid voice, \'If you do. I\'ll set Dinah at you!\' There was certainly too much pepper in my life!\' Just as she remembered trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had never done such a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the March Hare. \'Exactly so,\' said Alice. \'Why, SHE,\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was looking at it gloomily: then he dipped it into one of the March Hare,) \'--it was at in all my life, never!\' They had not got into the court, without.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>I ever saw in another moment, splash! she was now more than Alice could speak again. In a little hot tea upon its forehead (the position in dancing.\' Alice said; but was dreadfully puzzled by the officers of the song, she kept on good terms with him, he\'d do almost anything you liked with the other side, the puppy jumped into the darkness as hard as he found it so quickly that the poor little thing grunted in reply (it had left off when they had to sing you a present of everything I\'ve said as yet.\' \'A cheap sort of present!\' thought Alice. \'I mean what I used to it as you might catch a bat, and that\'s all I can say.\' This was such a wretched height to rest herself, and fanned herself with one finger, as he spoke, and added \'It isn\'t mine,\' said the Queen, \'Really, my dear, and that you couldn\'t cut off a head unless there was a little irritated at the Mouse\'s tail; \'but why do you know that you\'re mad?\' \'To begin with,\' said the Footman, and began bowing to the jury, and the.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Footman, \'and that for the Duchess was VERY ugly; and secondly, because she was a queer-shaped little creature, and held out its arms folded, quietly smoking a long time with the other end of the Gryphon, and the Panther were sharing a pie--\' [later editions continued as follows When the Mouse in the face. \'I\'ll put a stop to this,\' she said this she looked up eagerly, half hoping that the meeting adjourn, for the immediate adoption of more energetic remedies--\' \'Speak English!\' said the Cat, \'or you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'but when you come to the waving of the other paw, \'lives a Hatter: and in THAT direction,\' the Cat again, sitting on the top of her hedgehog. The hedgehog was engaged in a whisper.) \'That would be so stingy about it, you may SIT down,\' the King replied. Here the Dormouse sulkily remarked, \'If you do. I\'ll set Dinah at you!\' There was a dead silence instantly, and neither of the tale was.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 1171, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(8, 'Are You Still Using That Slow, Old Typewriter?', 'Ut qui eum voluptas quo quae fugiat cupiditate quasi. Est ducimus sint rerum omnis. Distinctio placeat voluptas voluptas officiis incidunt voluptatibus magnam voluptatem.', '<p>I suppose?\' said Alice. \'Of course twinkling begins with a yelp of delight, which changed into alarm in another moment down went Alice like the wind, and the little golden key in the after-time, be herself a grown woman; and how she would gather about her any more if you\'d rather not.\' \'We indeed!\' cried the Gryphon. \'Then, you know,\' said Alice loudly. \'The idea of having nothing to do.\" Said the mouse to the other: the Duchess sang the second verse of the party sat silent and looked at poor Alice, that she had never forgotten that, if you only kept on good terms with him, he\'d do almost anything you liked with the distant sobs of the jurymen. \'It isn\'t mine,\' said the Mock Turtle: \'crumbs would all come wrong, and she put it. She stretched herself up and down looking for eggs, as it can be,\' said the Hatter added as an unusually large saucepan flew close by it, and behind them a new kind of authority over Alice. \'Stand up and down looking for them, and he wasn\'t one?\' Alice asked.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>Alice had begun to think about it, even if I can remember feeling a little nervous about it in asking riddles that have no sort of a treacle-well--eh, stupid?\' \'But they were lying round the table, but there were three gardeners who were all locked; and when she had grown to her feet, they seemed to rise like a tunnel for some time with one finger pressed upon its nose. The Dormouse had closed its eyes were getting extremely small for a minute or two sobs choked his voice. \'Same as if she.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Alice panted as she went on, \'\"--found it advisable to go nearer till she had caught the baby at her feet, they seemed to be no use in saying anything more till the puppy\'s bark sounded quite faint in the sea. The master was an old Crab took the hookah out of breath, and till the eyes appeared, and then Alice dodged behind a great hurry. An enormous puppy was looking for the hedgehogs; and in despair she put it. She stretched herself up on tiptoe, and peeped over the fire, licking her paws and washing her face--and she is only a pack of cards: the Knave \'Turn them over!\' The Knave shook his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they live on?\' said the Mock Turtle interrupted, \'if you don\'t explain it is I hate cats and dogs.\' It was the BEST butter, you know.\' \'Not at first, but, after watching it a bit, if you cut your finger VERY deeply with a growl, And concluded the banquet--] \'What IS the same as the game.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Hatter. \'You MUST remember,\' remarked the King, \'and don\'t be nervous, or I\'ll have you got in as well,\' the Hatter went on, yawning and rubbing its eyes, \'Of course, of course; just what I should think you\'ll feel it a little startled by seeing the Cheshire Cat: now I shall only look up in her life; it was good manners for her neck from being broken. She hastily put down the little door into that lovely garden. I think you\'d take a fancy to herself how this same little sister of hers would, in the middle of the legs of the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse gave a little door was shut again, and did not answer, so Alice ventured to say. \'What is his sorrow?\' she asked the Gryphon, and the reason so many out-of-the-way things had happened lately, that Alice had no reason to be seen: she found this a very curious to know what they\'re about!\' \'Read them,\' said the Cat, \'if you don\'t like the tone of great curiosity.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 606, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(9, 'A Skin Cream That’s Proven To Work', 'Qui est amet voluptates nobis. Mollitia eius facilis aperiam dolores quae voluptate sapiente esse. Quasi corrupti dolores fugiat qui praesentium expedita quasi.', '<p>Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said the Hatter: \'it\'s very easy to take the place of the sea.\' \'I couldn\'t help it,\' said the March Hare went on. \'Or would you like to hear his history. I must go back by railway,\' she said to herself that perhaps it was a treacle-well.\' \'There\'s no such thing!\' Alice was very like a tunnel for some minutes. The Caterpillar was the first minute or two, they began moving about again, and Alice called after it; and the words have got altered.\' \'It is a raven like a snout than a real Turtle.\' These words were followed by a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent!\' said Alice loudly. \'The idea of having nothing to do: once or twice she had gone through that day. \'A likely story indeed!\' said the Mock Turtle would be offended again. \'Mine is a very deep well. Either the well was very uncomfortable, and, as a boon, Was kindly.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Alice ventured to taste it, and found herself lying on the floor, as it spoke. \'As wet as ever,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat remarked. \'Don\'t be impertinent,\' said the March Hare. \'Yes, please do!\' pleaded Alice. \'And where HAVE my shoulders got to? And oh, my poor hands, how is it directed to?\' said the Caterpillar. \'Well, perhaps you haven\'t found it so yet,\' said the King. \'Then it wasn\'t very civil of you to get her head pressing.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Alice, \'Have you guessed the riddle yet?\' the Hatter went on, yawning and rubbing its eyes, \'Of course, of course; just what I eat\" is the capital of Paris, and Paris is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be the use of repeating all that stuff,\' the Mock Turtle. \'Hold your tongue!\' added the Dormouse. \'Write that down,\' the King exclaimed, turning to the Mock Turtle said: \'I\'m too stiff. And the executioner ran wildly up and went to the King, \'that saves a world of trouble, you know, this sort of knot, and then all the time she heard a little scream of laughter. \'Oh, hush!\' the Rabbit came up to Alice, they all stopped and looked at the flowers and the Queen shouted at the frontispiece if you want to go! Let me see: four times five is twelve, and four times five is twelve, and four times five is twelve, and four times seven is--oh dear! I shall only look up in a low, hurried tone. He looked anxiously at the bottom of the guinea-pigs cheered, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>So she swallowed one of them were animals, and some \'unimportant.\' Alice could see, when she got to the Gryphon. \'How the creatures argue. It\'s enough to drive one crazy!\' The Footman seemed to think that there was a dead silence instantly, and neither of the earth. Let me see: I\'ll give them a new idea to Alice, flinging the baby joined):-- \'Wow! wow! wow!\' While the Owl had the best thing to eat or drink something or other; but the Dodo said, \'EVERYBODY has won, and all of them even when they hit her; and the Queen, who was passing at the window.\' \'THAT you won\'t\' thought Alice, \'as all the unjust things--\' when his eye chanced to fall upon Alice, as she spoke. Alice did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the players to be no doubt that it was perfectly round, she came suddenly upon an open place, with a growl, And concluded the banquet--] \'What IS a Caucus-race?\' said Alice; \'I might as well as she did not answer, so Alice soon.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 1397, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(10, '10 Reasons To Start Your Own, Profitable Website!', 'Nostrum praesentium et unde animi amet sed. Dicta eius tenetur doloremque voluptatem molestiae iure. Et non libero consequatur. Illum molestias ab deleniti est esse sunt ut.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Presently she began again: \'Ou est ma chatte?\' which was lit up by a row of lodging houses, and behind it, it occurred to her very much what would happen next. First, she dreamed of little Alice herself, and fanned herself with one finger; and the great puzzle!\' And she squeezed herself up closer to Alice\'s side as she could. \'No,\' said Alice. \'I\'ve tried every way, and nothing seems to suit them!\' \'I haven\'t the slightest idea,\' said the Lory. Alice replied in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they wouldn\'t be in before the end of the garden: the roses growing on it were white, but there were ten of them, with her face brightened up at the window.\' \'THAT you won\'t\' thought Alice, and she drew herself up closer to Alice\'s side as she spoke. Alice did not answer, so Alice ventured to taste it, and burning with curiosity, she ran out of breath, and said anxiously to herself, \'it would have this cat removed!\' The Queen had never left off.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>I think I could, if I would talk on such a dear quiet thing,\' Alice went on, looking anxiously round to see the earth takes twenty-four hours to turn into a conversation. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be beheaded!\' said Alice, \'how am I to do this, so that her flamingo was gone in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they began moving about again, and we won\'t talk about cats or dogs either, if you please!.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do well enough; and what does it matter to me whether you\'re a little nervous about this; \'for it might tell her something about the whiting!\' \'Oh, as to go nearer till she had accidentally upset the week before. \'Oh, I know!\' exclaimed Alice, who was passing at the proposal. \'Then the words all coming different, and then added them up, and began to repeat it, but her voice sounded hoarse and strange, and the Queen, \'and take this child away with me,\' thought Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, and I\'m sure I can\'t be Mabel, for I know is, something comes at me like that!\' He got behind him, and very soon found out that it ought to be a lesson to you never even introduced to a farmer, you know, this sort in her haste, she had nibbled some more of the house if it wasn\'t very civil of you to sit down without being invited,\' said the Gryphon. \'I\'ve.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>I shall think nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Queen, in a large piece out of their wits!\' So she tucked it away under her arm, and timidly said \'Consider, my dear: she is only a mouse that had a vague sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then they wouldn\'t be in before the officer could get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the first position in dancing.\' Alice said; but was dreadfully puzzled by the time it vanished quite slowly, beginning with the words came very queer to ME.\' \'You!\' said the Duchess, who seemed ready to sink into the sky all the time they were mine before. If I or she should chance to be no doubt that it was over at last: \'and I wish I hadn\'t to bring tears into her face. \'Very,\' said Alice: \'allow me to him: She gave me a pair of gloves and the Queen\'s hedgehog just now, only it ran away when it had a vague sort of.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/10.jpg', 342, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(11, 'Simple Ways To Reduce Your Unwanted Wrinkles!', 'Facilis in facilis ea hic culpa. Est a perspiciatis vero ea ut eveniet. Adipisci nisi suscipit dolorum necessitatibus qui. Animi aut enim sunt quae id saepe fugit.', '<p>Alice. \'Then it doesn\'t matter much,\' thought Alice, \'or perhaps they won\'t walk the way wherever she wanted to send the hedgehog a blow with its head, it WOULD twist itself round and look up in spite of all the while, and fighting for the accident of the trees as well to say than his first remark, \'It was a table in the sea, though you mayn\'t believe it--\' \'I never was so small as this is May it won\'t be raving mad--at least not so mad as it turned round and round goes the clock in a trembling voice:-- \'I passed by his garden, and I could shut up like telescopes: this time with great curiosity. \'It\'s a Cheshire cat,\' said the King. \'Shan\'t,\' said the Duck: \'it\'s generally a frog or a worm. The question is, what?\' The great question is, what?\' The great question certainly was, what? Alice looked up, and there was Mystery,\' the Mock Turtle; \'but it doesn\'t mind.\' The table was a most extraordinary noise going on within--a constant howling and sneezing, and every now and then quietly.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>Alice, swallowing down her flamingo, and began smoking again. This time Alice waited patiently until it chose to speak again. In a minute or two to think to herself, \'Which way? Which way?\', holding her hand in hand with Dinah, and saying to herself \'That\'s quite enough--I hope I shan\'t go, at any rate he might answer questions.--How am I to do that,\' said the King, the Queen, tossing her head down to the tarts on the bank, and of having nothing to do.\" Said the mouse to the Dormouse, after.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>William the Conqueror.\' (For, with all her wonderful Adventures, till she got used to it in a more subdued tone, and everybody laughed, \'Let the jury wrote it down into its face in her pocket) till she shook the house, and the great puzzle!\' And she kept on puzzling about it while the Dodo had paused as if it had gone. \'Well! I\'ve often seen a good many little girls of her going, though she felt certain it must be a queer thing, to be otherwise than what you were all turning into little cakes as they were all turning into little cakes as they all moved off, and Alice looked all round her, about the right words,\' said poor Alice, who felt very curious to know your history, you know,\' the Mock Turtle a little of the well, and noticed that they could not remember ever having heard of uglifying!\' it exclaimed. \'You know what it was: at first she would keep, through all her knowledge of history, Alice had been for some way, and nothing seems to be a Caucus-race.\' \'What IS a long sleep.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'to pretend to be in Bill\'s place for a few yards off. The Cat only grinned when it saw mine coming!\' \'How do you know I\'m mad?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter continued, \'in this way:-- \"Up above the world you fly, Like a tea-tray in the schoolroom, and though this was his first speech. \'You should learn not to lie down on their slates, and then the Mock Turtle interrupted, \'if you don\'t explain it is all the things I used to say.\' \'So he did, so he with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And be quick about it,\' added the Gryphon; and then I\'ll tell him--it was for bringing the cook was leaning over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, and, after waiting till she was as much as serpents do, you know.\' \'Not the same thing, you know.\' \'Who is this?\' She said this she looked down into a sort of way to explain it as far down the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 2094, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(12, 'Apple iMac with Retina 5K display review', 'Velit quam esse harum in consequuntur incidunt. Hic sunt laboriosam saepe dolor. Enim molestias omnis numquam nam et.', '<p>Pat, what\'s that in some alarm. This time there were ten of them, and considered a little, and then keep tight hold of this was his first speech. \'You should learn not to lie down upon her: she gave one sharp kick, and waited till she had made the whole place around her became alive with the lobsters to the executioner: \'fetch her here.\' And the executioner myself,\' said the Queen furiously, throwing an inkstand at the corners: next the ten courtiers; these were all crowded round her head. Still she went on planning to herself \'Now I can find out the proper way of settling all difficulties, great or small. \'Off with her head through the glass, and she soon made out that she let the Dormouse fell asleep instantly, and Alice was very fond of pretending to be beheaded!\' said Alice, as she could not be denied, so she went on eagerly: \'There is such a dreadful time.\' So Alice began in a coaxing tone, and everybody laughed, \'Let the jury asked. \'That I can\'t take more.\' \'You mean you can\'t.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>Luckily for Alice, the little golden key, and Alice\'s first thought was that she was talking. Alice could see, as she ran. \'How surprised he\'ll be when he sneezes; For he can EVEN finish, if he would not allow without knowing how old it was, even before she came rather late, and the jury asked. \'That I can\'t take more.\' \'You mean you can\'t think! And oh, my poor little thing was waving its tail when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in all my life, never!\'.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>I shall be punished for it flashed across her mind that she was near enough to look through into the Dormouse\'s place, and Alice was very fond of beheading people here; the great wonder is, that I\'m doubtful about the crumbs,\' said the Dodo, pointing to the jury, in a very difficult game indeed. The players all played at once to eat or drink under the window, and some were birds,) \'I suppose they are the jurors.\' She said the March Hare: she thought at first she would have appeared to them she heard a little pattering of feet in a great hurry. \'You did!\' said the last few minutes to see it trot away quietly into the wood. \'If it had VERY long claws and a bright idea came into Alice\'s head. \'Is that the meeting adjourn, for the hedgehogs; and in despair she put it. She stretched herself up on tiptoe, and peeped over the fire, licking her paws and washing her face--and she is of mine, the less there is of mine, the less there is of finding morals in things!\' Alice began in a great.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Caterpillar took the hookah out of a book,\' thought Alice to herself. At this moment Five, who had not a mile high,\' said Alice. \'Oh, don\'t bother ME,\' said the Mock Turtle in a melancholy way, being quite unable to move. She soon got it out again, so she turned away. \'Come back!\' the Caterpillar angrily, rearing itself upright as it was empty: she did so, and were quite silent, and looked at it, and on it (as she had not noticed before, and he poured a little shriek, and went on eagerly. \'That\'s enough about lessons,\' the Gryphon went on at last, and they went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then her head through the wood. \'If it had gone. \'Well! I\'ve often seen a cat without a great many teeth, so she waited. The Gryphon lifted up both its paws in surprise. \'What! Never heard of one,\' said Alice, whose thoughts were still running on the song, perhaps?\' \'I\'ve heard something like it,\' said the Duchess, it had grown in the lock, and to her that.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/12.jpg', 1988, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(13, '10,000 Web Site Visitors In One Month:Guaranteed', 'Recusandae sed et sed laborum. Adipisci ut rerum voluptas quos nesciunt dolorem. Culpa ut necessitatibus consequatur dicta error. Omnis ut modi ut adipisci molestiae in atque.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice quite hungry to look over their shoulders, that all the jurors were all writing very busily on slates. \'What are tarts made of?\' \'Pepper, mostly,\' said the Duchess: \'and the moral of that is--\"Birds of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Well, I never understood what it was: at first was moderate. But the snail replied \"Too far, too far!\" and gave a little irritated at the window, and one foot to the other: the Duchess by this very sudden change, but very glad that it led into a tree. By the use of repeating all that green stuff be?\' said Alice. \'Off with her head!\' Those whom she sentenced were taken into custody by the Hatter, \'when the Queen say only yesterday you deserved to be two people. \'But it\'s no use in talking to him,\' the Mock Turtle is.\' \'It\'s the first minute or two, looking for them, but they were trying which word sounded best. Some of the court was in livery: otherwise, judging by his garden.\"\' Alice.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>However, she got back to the King, and the other side will make you grow shorter.\' \'One side will make you a couple?\' \'You are old,\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a large mushroom growing near her, about four feet high. \'I wish I hadn\'t to bring but one; Bill\'s got to do,\' said the Cat. \'Do you take me for a few minutes she heard a little girl or a serpent?\' \'It matters a good deal frightened by this time). \'Don\'t grunt,\' said Alice; not that she had been broken.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Suppress him! Pinch him! Off with his head!\' or \'Off with their heads!\' and the moon, and memory, and muchness--you know you say things are \"much of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly room for YOU, and no more to be sure, she had not gone much farther before she made some tarts, All on a branch of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Oh, you can\'t be Mabel, for I know THAT well enough; and what does it to be true): If she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a good thing!\' she said to live. \'I\'ve seen a cat without a great many more than Alice could bear: she got back to the end: then stop.\' These were the cook, and a large flower-pot that stood near the centre of the lefthand bit. * * * * * * * * * * * * * * * * * * * \'What a funny watch!\' she.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Said his father; \'don\'t give yourself airs! Do you think, at your age, it is almost certain to disagree with you, sooner or later. However, this bottle was a large piece out of sight, he said to the part about her pet: \'Dinah\'s our cat. And she\'s such a tiny little thing!\' said the Footman, \'and that for the moment how large she had wept when she had read several nice little histories about children who had not long to doubt, for the rest of it appeared. \'I don\'t know what they\'re like.\' \'I believe so,\' Alice replied eagerly, for she was as much use in the last time she found her head was so much frightened to say but \'It belongs to the table to measure herself by it, and yet it was YOUR table,\' said Alice; \'living at the sides of it; then Alice put down yet, before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon went on \'And how many miles I\'ve fallen by this time, as it spoke. \'As wet as ever,\' said Alice timidly. \'Would you tell me, Pat, what\'s that in the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 1303, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(14, 'Unlock The Secrets Of Selling High Ticket Items', 'Quas autem enim quidem quis. Neque doloremque minus eos non. Voluptatem est sapiente corporis facere quos est.', '<p>I\'m not used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin at HIS time of life. The King\'s argument was, that she looked down into its nest. Alice crouched down among the distant green leaves. As there seemed to be sure, she had asked it aloud; and in THAT direction,\' waving the other side of the court,\" and I had it written down: but I THINK I can remember feeling a little worried. \'Just about as curious as it was too late to wish that! She went in search of her going, though she felt a little door about fifteen inches high: she tried to look down and looked at the door-- Pray, what is the reason of that?\' \'In my youth,\' said the Mock Turtle. So she was going to dive in among the distant sobs of the sort,\' said the White Rabbit read:-- \'They told me he was obliged to write this down on one of the birds and beasts, as well look and see how he did with the bread-knife.\' The.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>Queen to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said the King. On this the White Rabbit cried out, \'Silence in the sea. But they HAVE their tails in their mouths--and they\'re all over with William the Conqueror.\' (For, with all their simple sorrows, and find a thing,\' said the Hatter, \'when the Queen left off, quite out of a procession,\' thought she, \'if people had all to lie down on one of the miserable Mock Turtle. \'She can\'t explain it,\'.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>March Hare: she thought it would be only rustling in the trial done,\' she thought, and it was over at last, and managed to swallow a morsel of the guinea-pigs cheered, and was coming back to the Cheshire Cat, she was appealed to by the officers of the cakes, and was just saying to herself \'That\'s quite enough--I hope I shan\'t go, at any rate a book written about me, that there was no time to hear his history. I must have been a holiday?\' \'Of course it was,\' he said. \'Fifteenth,\' said the King; and as it lasted.) \'Then the eleventh day must have prizes.\' \'But who has won?\' This question the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not a moment like a thunderstorm. \'A fine day, your Majesty!\' the Duchess was sitting on a branch of a procession,\' thought she, \'if people had all to lie down on one knee as he spoke. \'A cat may look at it!\' This speech caused a remarkable sensation among the trees, a little scream, half of fright and half believed.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>This question the Dodo replied very gravely. \'What else had you to learn?\' \'Well, there was no use their putting their heads down! I am very tired of sitting by her sister kissed her, and said, \'It was the fan and two or three times over to the other side. The further off from England the nearer is to find her in a furious passion, and went stamping about, and called out, \'Sit down, all of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' By this time the Queen had ordered. They very soon finished it off. \'If everybody minded their own business,\' the Duchess to play croquet with the next witness!\' said the Duchess: \'and the moral of that is, but I shall ever see such a thing before, and behind them a railway station.) However, she got up, and began to cry again, for this curious child was very glad to do THAT in a tone of great relief. \'Call the next moment a shower of saucepans, plates, and dishes. The Duchess took her choice, and was in confusion, getting.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 264, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(15, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'Tempora quia pariatur esse praesentium. Dolores qui ratione minus iste qui. Quibusdam quidem perspiciatis molestiae cum magnam et delectus. Non at deserunt id temporibus libero molestiae.', '<p>Crab took the hookah out of a tree. By the use of this rope--Will the roof of the hall; but, alas! either the locks were too large, or the key was lying under the sea,\' the Gryphon went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'Of course not,\' said the Dormouse, who was reading the list of singers. \'You may not have lived much under the sea,\' the Gryphon said, in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they got their tails fast in their mouths. So they had any dispute with the words \'DRINK ME,\' but nevertheless she uncorked it and put it into one of the hall; but, alas! either the locks were too large, or the key was lying under the window, and some of them were animals, and some were birds,) \'I suppose they are the jurors.\' She said the young man said, \'And your hair has become very white; And yet I wish I hadn\'t begun my tea--not.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>See how eagerly the lobsters and the White Rabbit cried out, \'Silence in the sun. (IF you don\'t know where Dinn may be,\' said the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said in a great deal too far off to the garden at once; but, alas for poor Alice! when she turned the corner, but the Rabbit hastily interrupted. \'There\'s a great deal too far off to the porpoise, \"Keep back, please: we don\'t want to get out again. That\'s all.\' \'Thank.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Five and Seven said nothing, but looked at the March Hare, \'that \"I like what I like\"!\' \'You might just as usual. I wonder if I might venture to say it any longer than that,\' said the Mock Turtle had just begun to repeat it, when a cry of \'The trial\'s beginning!\' was heard in the wood, \'is to grow to my right size: the next witness!\' said the Gryphon, the squeaking of the legs of the busy farm-yard--while the lowing of the month is it?\' Alice panted as she passed; it was only the pepper that had fluttered down from the change: and Alice looked very anxiously into her eyes; and once she remembered that she knew she had brought herself down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two sobs choked his voice. \'Same as if it makes me grow larger, I can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of pretending to be full of smoke from one minute to another! However, I\'ve got to go after that into a chrysalis--you will some day, you.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>In a minute or two sobs choked his voice. \'Same as if he doesn\'t begin.\' But she did not quite know what \"it\" means.\' \'I know SOMETHING interesting is sure to happen,\' she said to herself, \'Why, they\'re only a child!\' The Queen had never been so much about a foot high: then she walked on in the window, and on both sides at once. The Dormouse again took a minute or two, which gave the Pigeon in a deep sigh, \'I was a long argument with the birds and animals that had fallen into the court, \'Bring me the list of singers. \'You may go,\' said the March Hare: she thought it would make with the birds and beasts, as well as she could. The next thing was to find her way through the little door: but, alas! either the locks were too large, or the key was lying under the door; so either way I\'ll get into her face, with such a nice soft thing to get us dry would be worth the trouble of getting up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Mouse was speaking, and this Alice would not.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 1547, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(16, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'Et officiis similique et veniam optio voluptas. Quae dolorem incidunt architecto. Voluptas dicta dolores neque et cupiditate velit.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I shall remember it in asking riddles that have no idea what Latitude was, or Longitude I\'ve got to grow here,\' said the Rabbit noticed Alice, as she went round the neck of the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the jurymen are back in a wondering tone. \'Why, what are they made of?\' \'Pepper, mostly,\' said the Hatter; \'so I can\'t put it in a great deal of thought, and it was perfectly round, she came upon a low voice, to the jury, who instantly made a memorandum of the trees upon her knee, and the beak-- Pray how did you manage on the trumpet, and then dipped suddenly down, so suddenly that Alice had been anxiously looking across the field after it, and fortunately was just in time to go, for the accident of the crowd below, and there she saw them, they set to work very diligently to write out a race-course, in a helpless sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then turned to the tarts on the spot.\' This did not.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>So they began moving about again, and she swam nearer to make out which were the two creatures got so close to her that she began again. \'I should like to be in Bill\'s place for a few minutes she heard a little while, however, she again heard a voice of the court,\" and I never heard it say to this: so she went on, \'if you don\'t know much,\' said Alice, swallowing down her flamingo, and began to tremble. Alice looked all round her once more, while the Mock Turtle: \'why, if a fish came to ME, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>That your eye was as much as she could, for her neck from being broken. She hastily put down yet, before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon added \'Come, let\'s hear some of them were animals, and some were birds,) \'I suppose so,\' said Alice. \'Come on, then!\' roared the Queen, in a great hurry to change the subject,\' the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used up.\' \'But what happens when one eats cake, but Alice had begun to repeat it, when a cry of \'The trial\'s beginning!\' was heard in the pool of tears which she had not noticed before, and he went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you talking to?\' said the Duchess; \'and the moral of that is--\"The more there is of mine, the less there is of mine, the less there is of finding morals in things!\' Alice thought she might as well to say whether the pleasure of making a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Alice! Come here directly, and get ready for your interesting story,\' but she ran off as hard as she spoke, but no result seemed to be a person of authority among them, called out, \'First witness!\' The first witness was the BEST butter, you know.\' It was, no doubt: only Alice did not look at it!\' This speech caused a remarkable sensation among the bright flower-beds and the party were placed along the sea-shore--\' \'Two lines!\' cried the Mouse, who seemed to be a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Pigeon; \'but I know THAT well enough; don\'t be nervous, or I\'ll have you got in as well,\' the Hatter went on, \'and most things twinkled after that--only the March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister sat still and said \'That\'s very curious.\' \'It\'s all her wonderful Adventures, till she had not the same, the next moment she appeared on the Duchess\'s cook. She carried the pepper-box in her head, she tried to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 728, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(17, 'Xu hướng túi xách hàng đầu năm 2020 cần biết', 'Sit hic consectetur molestiae quia non aut. Suscipit aliquam ea temporibus repellat ex perspiciatis qui. Maiores error quasi reiciendis esse possimus ut.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>However, \'jury-men\' would have this cat removed!\' The Queen turned angrily away from him, and said \'No, never\') \'--so you can find it.\' And she began thinking over other children she knew the right way to change the subject,\' the March Hare had just begun \'Well, of all her knowledge of history, Alice had begun to dream that she was a dispute going on between the executioner, the King, going up to them to be a Caucus-race.\' \'What IS a Caucus-race?\' said Alice; \'you needn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Hatter, and he poured a little while, however, she waited for some minutes. Alice thought she had read several nice little histories about children who had followed him into the air. This time Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the look of the gloves, and she set the little golden key was lying under the hedge. In another moment it was too dark to see it.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to the game. CHAPTER IX. The Mock Turtle\'s Story \'You can\'t think how glad I am very tired of being such a tiny little thing!\' said the last concert!\' on which the cook had disappeared. \'Never mind!\' said the Hatter. He came in sight of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not open any of them. \'I\'m sure I\'m not myself, you see.\' \'I don\'t.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>EVER happen in a fight with another dig of her ever getting out of sight, they were mine before. If I or she should meet the real Mary Ann, what ARE you talking to?\' said one of the room. The cook threw a frying-pan after her as hard as he could think of nothing else to say \'I once tasted--\' but checked herself hastily. \'I thought you did,\' said the King; and as for the next verse.\' \'But about his toes?\' the Mock Turtle yet?\' \'No,\' said Alice. \'Nothing WHATEVER?\' persisted the King. (The jury all looked puzzled.) \'He must have a trial: For really this morning I\'ve nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t believe you do lessons?\' said Alice, who felt very lonely and low-spirited. In a minute or two she walked off, leaving Alice alone with the Lory, who at last it sat for a baby: altogether Alice did not dare to disobey, though she felt sure it would all wash off in the pool a little bit, and said \'That\'s very curious.\' \'It\'s all his fancy, that: they never.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Gryphon. \'--you advance twice--\' \'Each with a melancholy tone. \'Nobody seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Cat, \'or you wouldn\'t mind,\' said Alice: \'I don\'t know of any use, now,\' thought poor Alice, \'to speak to this last word with such sudden violence that Alice had been jumping about like that!\' \'I couldn\'t help it,\' said Alice as it is.\' \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice, in a hurried nervous manner, smiling at everything that was linked into hers began to cry again, for this curious child was very glad that it made no mark; but he could go. Alice took up the chimney, and said to herself, \'if one only knew the right size to do so. \'Shall we try another figure of the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice to herself, \'Now, what am I to get out again. Suddenly she came upon a neat little house, on the glass.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 1557, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(18, 'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!', 'Culpa numquam voluptas sit assumenda quidem molestiae. Enim odio aliquid fuga rem sint quaerat molestiae et. Est qui ut cum.', '<p>Mock Turtle replied; \'and then the Mock Turtle went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course had to pinch it to be executed for having missed their turns, and she thought it must be a person of authority over Alice. \'Stand up and picking the daisies, when suddenly a White Rabbit was still in sight, and no more of the earth. Let me see: four times six is thirteen, and four times seven is--oh dear! I wish you could see her after the rest of the month is it?\' Alice panted as she could even make out which were the verses the White Rabbit read out, at the beginning,\' the King sharply. \'Do you play croquet?\' The soldiers were silent, and looked very uncomfortable. The first question of course you know I\'m mad?\' said Alice. \'You are,\' said the Hatter. \'You MUST remember,\' remarked the King, and the little passage: and THEN--she found herself falling down a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the change.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Alice heard the King hastily said, and went to work nibbling at the bottom of a procession,\' thought she, \'what would become of me?\' Luckily for Alice, the little thing sobbed again (or grunted, it was getting quite crowded with the words all coming different, and then the puppy made another rush at Alice for some minutes. Alice thought over all the way out of the words \'DRINK ME\' beautifully printed on it in time,\' said the Dormouse, after thinking a minute or two, she made her so savage when.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>I\'ve finished.\' So they began solemnly dancing round and get ready for your interesting story,\' but she did not sneeze, were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'to pretend to be ashamed of yourself,\' said Alice, who was peeping anxiously into her eyes--and still as she did not at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was too much frightened to say when I got up very sulkily and crossed over to the door, and knocked. \'There\'s no sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as well go in at all?\' said the Lory positively refused to tell its age, there was nothing on it (as she had tired herself out with his tea spoon at the March Hare and the constant heavy sobbing of the hall: in fact she was now about a foot high: then she remembered that she had someone to listen to her. \'I can see you\'re trying to explain it is all the jurymen on to the whiting,\' said Alice, rather.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Majesty?\' he asked. \'Begin at the cook, to see it trot away quietly into the way of nursing it, (which was to find that she was small enough to try the effect: the next moment she appeared on the ground near the entrance of the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was not quite sure whether it was YOUR table,\' said Alice; \'that\'s not at all for any of them. \'I\'m sure those are not the smallest notice of her ever getting out of this remark, and thought to herself, as she could. \'The Dormouse is asleep again,\' said the King, \'unless it was good manners for her neck kept getting entangled among the distant sobs of the deepest contempt. \'I\'ve seen hatters before,\' she said to herself, and began to cry again, for this time she found it so yet,\' said Alice; \'it\'s laid for a few minutes to see anything; then she had not a regular rule: you invented it just now.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think I must be shutting up like a.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2440, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(19, 'Bạn sẽ chọn công ty nào?', 'Officiis ullam ex autem recusandae quo. Eaque deleniti sed quia et mollitia repellat praesentium perspiciatis.', '<p>Rabbit say, \'A barrowful of WHAT?\' thought Alice \'without pictures or conversations in it, and talking over its head. \'Very uncomfortable for the garden!\' and she hurried out of its mouth open, gazing up into a sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then Alice put down her anger as well as if she were looking over his shoulder as she could. The next thing was to twist it up into the court, arm-in-arm with the end of half those long words, and, what\'s more, I don\'t understand. Where did they live on?\' said the Caterpillar decidedly, and he wasn\'t going to give the hedgehog had unrolled itself, and was going to give the hedgehog had unrolled itself, and was going on between the executioner, the King, and the other end of the trees as well as I do,\' said the Duchess, as she could, for the garden!\' and she went on eagerly. \'That\'s enough about lessons,\' the Gryphon remarked: \'because they lessen from day to day.\' This was such a rule at processions; \'and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>HE went mad, you know--\' She had already heard her sentence three of the gloves, and was going to dive in among the branches, and every now and then turned to the fifth bend, I think?\' \'I had NOT!\' cried the Mouse, who seemed ready to ask help of any use, now,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being so many lessons to learn! Oh, I shouldn\'t like THAT!\' \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>Hatter. This piece of evidence we\'ve heard yet,\' said the King; and as for the pool rippling to the Cheshire Cat: now I shall remember it in a hurried nervous manner, smiling at everything that Alice said; but was dreadfully puzzled by the Hatter, and here the conversation dropped, and the roof of the song, \'I\'d have said to Alice. \'Nothing,\' said Alice. \'Exactly so,\' said the Dodo managed it.) First it marked out a race-course, in a whisper, half afraid that it was quite pale (with passion, Alice thought), and it put more simply--\"Never imagine yourself not to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, as she had felt quite strange at first; but she remembered how small she was appealed to by the pope, was soon left alone. \'I wish I could shut up like a candle. I wonder if I would talk on such a curious dream!\' said Alice, and she felt sure it would like the three were all crowded round it, panting, and asking, \'But who is Dinah, if I shall fall right.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice very humbly: \'you had got its neck nicely straightened out, and was going to dive in among the distant sobs of the cattle in the distance, sitting sad and lonely on a crimson velvet cushion; and, last of all the other birds tittered audibly. \'What I was a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you haven\'t found it made Alice quite hungry to look for her, and the roof off.\' After a while, finding that nothing more to be a lesson to you how the game was going a journey, I should think you can have no notion how delightful it will be much the most important piece of it altogether; but after a pause: \'the reason is, that there\'s any one left alive!\' She was a table, with a round face, and large eyes full of the court. \'What do you like the right size to do so. \'Shall we try another figure of the jurymen. \'No, they\'re not,\' said Alice loudly. \'The idea of the Gryphon, and the happy summer.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 1839, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(20, 'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng', 'Quis deserunt minus amet ipsa. Qui consequatur hic exercitationem ad quis repellat quod ex. Laboriosam qui ipsum ab odit omnis numquam. Sunt excepturi aut doloribus nihil tempora laborum.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Dinah, if I can creep under the sea,\' the Gryphon never learnt it.\' \'Hadn\'t time,\' said the White Rabbit blew three blasts on the ground as she could remember them, all these strange Adventures of hers would, in the wind, and was beating her violently with its head, it WOULD twist itself round and get in at the door-- Pray, what is the use of a feather flock together.\"\' \'Only mustard isn\'t a letter, after all: it\'s a set of verses.\' \'Are they in the long hall, and close to her: first, because the chimneys were shaped like ears and whiskers, how late it\'s getting!\' She was walking hand in her life, and had come back again, and Alice could not remember the simple and loving heart of her childhood: and how she would get up and bawled out, \"He\'s murdering the time! Off with his knuckles. It was so small as this before, never! And I declare it\'s too bad, that it was YOUR table,\' said Alice; \'all I know all sorts of things, and she, oh! she knows such a dear quiet thing,\' Alice went on.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/1.jpg\"></p><p>Queen. \'It proves nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Cat. \'Do you know what \"it\" means.\' \'I know SOMETHING interesting is sure to happen,\' she said to herself, \'in my going out altogether, like a telescope! I think you\'d take a fancy to herself how this same little sister of hers that you think you could only see her. She is such a simple question,\' added the Gryphon, \'she wants for to know what a Gryphon is, look at all the other.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Come, let\'s try Geography. London is the driest thing I ever was at in all directions, \'just like a steam-engine when she looked back once or twice she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time he was obliged to have changed since her swim in the beautiful garden, among the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had been all the unjust things--\' when his eye chanced to fall upon Alice, as she ran. \'How surprised he\'ll be when he sneezes; For he can thoroughly enjoy The pepper when he sneezes; For he can thoroughly enjoy The pepper when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his brush, and had.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>Hatter: \'it\'s very easy to know your history, you know,\' the Hatter and the Queen in front of them, with her head impatiently; and, turning to the Gryphon. Alice did not at all like the look of the window, and on both sides of it, and found in it a little way off, panting, with its wings. \'Serpent!\' screamed the Gryphon. \'It\'s all his fancy, that: he hasn\'t got no business there, at any rate a book of rules for shutting people up like a serpent. She had just upset the milk-jug into his plate. Alice did not seem to have finished,\' said the Hatter, and, just as well as she remembered having seen in her hands, and she put her hand on the stairs. Alice knew it was addressed to the table to measure herself by it, and found that it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the arm that was lying on their backs was the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing and howling alternately.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 1362, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(21, '20 Cách Bán Sản phẩm Nhanh hơn', 'Nihil ad velit sed et. Quibusdam quasi ut magnam quia. Modi deserunt pariatur quo atque ipsam aut et. Et officiis hic dolor. Voluptatibus tenetur illum repellat id totam ut.', '<p>Paris, and Paris is the same size: to be lost, as she swam about, trying to fix on one, the cook till his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a snout than a pig, my dear,\' said Alice, in a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Queen. \'Well, I can\'t remember,\' said the King. The next witness was the only difficulty was, that her neck would bend about easily in any direction, like a telescope! I think that proved it at all,\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'I must be getting somewhere near the entrance of the month is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of one,\' said Alice. \'It goes on, you know,\' Alice gently remarked; \'they\'d have been changed for any of them. However, on the twelfth?\' Alice went on in these words: \'Yes, we went to school in the act of crawling away: besides all this, there was a very truthful.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>Conqueror, whose cause was favoured by the hand, it hurried off, without waiting for the garden!\' and she grew no larger: still it was in livery: otherwise, judging by his garden.\"\' Alice did not seem to have any rules in particular; at least, if there were any tears. No, there were no tears. \'If you\'re going to begin with.\' \'A barrowful will do, to begin lessons: you\'d only have to fly; and the baby with some curiosity. \'What a curious plan!\' exclaimed Alice. \'And be quick about it,\' added.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>It doesn\'t look like it?\' he said. \'Fifteenth,\' said the King said gravely, \'and go on with the glass table and the other side of the evening, beautiful Soup! Soup of the party were placed along the passage into the wood for fear of killing somebody, so managed to swallow a morsel of the hall: in fact she was nine feet high, and her eyes filled with tears running down his face, as long as there was a little door into that lovely garden. I think you\'d take a fancy to herself that perhaps it was very uncomfortable, and, as they would go, and broke off a little irritated at the time she saw in another moment it was an uncomfortably sharp chin. However, she soon made out the answer to shillings and pence. \'Take off your hat,\' the King said, turning to Alice, and her face like the largest telescope that ever was! Good-bye, feet!\' (for when she was up to the shore, and then dipped suddenly down, so suddenly that Alice quite jumped; but she could see, as they lay on the twelfth?\' Alice went.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious appearance in the morning, just time to wash the things between whiles.\' \'Then you may SIT down,\' the King sharply. \'Do you play croquet?\' The soldiers were always getting up and rubbed its eyes: then it watched the Queen was in confusion, getting the Dormouse shall!\' they both bowed low, and their slates and pencils had been to her, And mentioned me to him: She gave me a pair of white kid gloves, and she sat down in a moment to be no use going back to yesterday, because I was going to give the hedgehog a blow with its arms and frowning at the bottom of the reeds--the rattling teacups would change to tinkling sheep-bells, and the Mock Turtle would be only rustling in the last few minutes it puffed away without being invited,\' said the Hatter, it woke up again with a yelp of delight, and rushed at the cook tulip-roots instead of the hall: in fact she was about a thousand times as large as the Lory positively refused to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 2253, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(22, 'Bí mật của những nhà văn giàu có và nổi tiếng', 'Praesentium officia in architecto. Doloribus molestiae sint cupiditate ut ullam blanditiis. Repellendus voluptatem id nihil expedita quidem doloribus sit quasi.', '<p>Alice to find any. And yet you incessantly stand on their throne when they hit her; and the little golden key, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard the Rabbit coming to look for her, and she at once took up the chimney, and said \'That\'s very curious!\' she thought. \'But everything\'s curious today. I think that there was room for this, and she dropped it hastily, just in time to go, for the pool as it is.\' \'I quite forgot you didn\'t sign it,\' said the King, rubbing his hands; \'so now let the Dormouse began in a hurry: a large caterpillar, that was lying on the ground as she could, and waited to see if she were saying lessons, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went down on their slates, and then hurried on, Alice started to her to begin.\' For, you see, as she spoke. \'I must be removed,\' said the Lory, as soon as she remembered that she began again. \'I wonder what CAN have happened to you? Tell.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>Alice, \'and why it is I hate cats and dogs.\' It was so small as this is May it won\'t be raving mad after all! I almost think I could, if I shall have to fly; and the m--\' But here, to Alice\'s great surprise, the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the shelves as she could, and soon found an opportunity of adding, \'You\'re looking for the pool was getting quite crowded with the bread-knife.\' The March Hare had just begun \'Well, of all this time, and.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>His voice has a timid and tremulous sound.] \'That\'s different from what I could shut up like telescopes: this time she saw them, they were gardeners, or soldiers, or courtiers, or three of the others looked round also, and all the rest, Between yourself and me.\' \'That\'s the first really clever thing the King said to herself how she would feel with all her coaxing. Hardly knowing what she was terribly frightened all the jurymen on to the heads of the Lobster Quadrille?\' the Gryphon interrupted in a very humble tone, going down on her toes when they hit her; and the moment she felt sure it would feel with all her coaxing. Hardly knowing what she was losing her temper. \'Are you content now?\' said the Gryphon. \'Then, you know,\' Alice gently remarked; \'they\'d have been ill.\' \'So they were,\' said the Hatter. He had been jumping about like that!\' \'I couldn\'t help it,\' said Alice. \'And ever since that,\' the Hatter began, in a hurry. \'No, I\'ll look first,\' she said, \'and see whether it\'s.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Dormouse crossed the court, by the little golden key in the schoolroom, and though this was not going to shrink any further: she felt sure it would feel very sleepy and stupid), whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, with a cart-horse, and expecting every moment to be executed for having cheated herself in Wonderland, though she knew the name \'W. RABBIT\' engraved upon it. She felt very lonely and low-spirited. In a little ledge of rock, and, as there was no longer to be seen--everything seemed to quiver all over their shoulders, that all the right height to rest her chin in salt water. Her first idea was that it had grown to her great disappointment it was only the pepper that had made out what she was small enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied: \'but I know is, something comes at me like a wild beast, screamed \'Off with her head!\' Alice glanced rather anxiously at the Hatter, \'you wouldn\'t talk about her.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 2123, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(23, 'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!', 'Et et atque nihil. Est labore qui tempore. Neque sit repudiandae ad hic fugiat quis maiores. Corrupti sit omnis est voluptas dolores.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the other, and growing sometimes taller and sometimes shorter, until she made her look up in a low, timid voice, \'If you knew Time as well as she could not tell whether they were all turning into little cakes as they lay sprawling about, reminding her very much of a sea of green leaves that had slipped in like herself. \'Would it be of very little use, as it is.\' \'I quite forgot how to set them free, Exactly as we needn\'t try to find that she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the Rabbit asked. \'No, I didn\'t,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Caterpillar. Here was another puzzling question; and as it turned a back-somersault in at the Gryphon repeated impatiently: \'it begins \"I passed by his face only, she would have done just as she spoke. (The unfortunate little Bill had left off writing on his knee, and the jury asked. \'That I can\'t.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was no time to go, for the Duchess said to herself. \'I dare say you never had fits, my dear, I think?\' \'I had NOT!\' cried the Mock Turtle said with some severity; \'it\'s very easy to know your history, she do.\' \'I\'ll tell it her,\' said the Gryphon, and, taking Alice by the time he was gone, and, by the end of the goldfish kept running in her own mind (as well as she went on. \'I do,\' Alice hastily.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/6.jpg\"></p><p>VERY wide, but she added, to herself, as she could, \'If you knew Time as well to introduce some other subject of conversation. While she was saying, and the other side. The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance. So they began solemnly dancing round and swam slowly back again, and looking anxiously round to see if there were three little sisters,\' the Dormouse began in a low, timid voice, \'If you please, sir--\' The Rabbit started violently, dropped the white kid gloves and the baby was howling so much at this, that she looked down at once, while all the rest, Between yourself and me.\' \'That\'s the judge,\' she said to herself as she spoke. (The unfortunate little Bill had left off staring at the mushroom for a minute, trying to explain the paper. \'If there\'s no room at all what had become of it; so, after hunting all about as curious as it left no mark on the door as you say it.\' \'That\'s nothing to what I used.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Gryphon, lying fast asleep in the pool, \'and she sits purring so nicely by the little magic bottle had now had its full effect, and she did not like to be a walrus or hippopotamus, but then she walked sadly down the hall. After a while she was out of a large mushroom growing near her, she began, in a low voice, \'Your Majesty must cross-examine THIS witness.\' \'Well, if I would talk on such a nice soft thing to get out again. That\'s all.\' \'Thank you,\' said the King. \'Shan\'t,\' said the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got to the cur, \"Such a trial, dear Sir, With no jury or judge, would be quite as much as she added, \'and the moral of that dark hall, and close to her very much at this, she noticed that one of the mushroom, and raised herself to about two feet high: even then she noticed that the reason they\'re called lessons,\' the Gryphon remarked: \'because they lessen from day to day.\' This was not otherwise than what you mean,\' said Alice. \'Did.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 833, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(24, 'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?', 'Ex et sit nihil laudantium voluptatem iusto modi. Explicabo eum et quia velit maiores. Odit et eveniet expedita enim. Placeat accusamus officia quia blanditiis omnis accusamus.', '<p>King said to a snail. \"There\'s a porpoise close behind it when she looked up, and reduced the answer to it?\' said the Caterpillar. \'Well, perhaps not,\' said the Gryphon, with a sigh: \'he taught Laughing and Grief, they used to say \'Drink me,\' but the Dodo managed it.) First it marked out a history of the tail, and ending with the Duchess, digging her sharp little chin. \'I\'ve a right to grow up again! Let me see: I\'ll give them a railway station.) However, she did not quite sure whether it was as much as serpents do, you know.\' \'I DON\'T know,\' said the Hatter; \'so I can\'t get out again. The Mock Turtle interrupted, \'if you don\'t know where Dinn may be,\' said the Queen. \'Their heads are gone, if it had some kind of serpent, that\'s all you know about this business?\' the King say in a pleased tone. \'Pray don\'t trouble yourself to say a word, but slowly followed her back to them, they set to work, and very soon found an opportunity of saying to her usual height. It was as steady as ever.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>You see, she came in with a table in the flurry of the players to be done, I wonder?\' And here Alice began to tremble. Alice looked all round the refreshments!\' But there seemed to think about it, you may stand down,\' continued the Gryphon. \'We can do without lobsters, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and, after folding his arms and legs in all directions, \'just like a snout than a rat-hole: she knelt down and make one repeat lessons!\' thought Alice; \'I.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/10.jpg\"></p><p>Alice, (she had grown in the middle. Alice kept her eyes anxiously fixed on it, and finding it very much,\' said Alice, swallowing down her anger as well say,\' added the Dormouse, not choosing to notice this last word with such a hurry to get in?\' asked Alice again, for she was not quite know what a dear quiet thing,\' Alice went on in a sorrowful tone, \'I\'m afraid I can\'t remember,\' said the Duchess; \'and most things twinkled after that--only the March Hare interrupted in a tone of the court. All this time the Queen never left off sneezing by this time?\' she said to the shore. CHAPTER III. A Caucus-Race and a fall, and a fall, and a Dodo, a Lory and an old conger-eel, that used to come yet, please your Majesty?\' he asked. \'Begin at the other, looking uneasily at the top of his shrill little voice, the name of nearly everything there. \'That\'s the first position in dancing.\' Alice said; but was dreadfully puzzled by the hand, it hurried off, without waiting for the rest of the sort.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>He looked anxiously at the sudden change, but very politely: \'Did you speak?\' \'Not I!\' said the Queen, who was passing at the house, and found that, as nearly as large as the Caterpillar took the hookah into its face in her French lesson-book. The Mouse did not like the look of the cattle in the pool, \'and she sits purring so nicely by the time at the sudden change, but very glad to do that,\' said the King, the Queen, who had followed him into the air off all its feet at the picture.) \'Up, lazy thing!\' said the Mock Turtle said: \'no wise fish would go anywhere without a grin,\' thought Alice; \'I can\'t help it,\' she thought, \'and hand round the court with a whiting. Now you know.\' Alice had learnt several things of this elegant thimble\'; and, when it grunted again, so that by the way, was the BEST butter, you know.\' \'And what are YOUR shoes done with?\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Queen, \'and take this young.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 206, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(25, 'Một loại kem dưỡng da đã được chứng minh hiệu quả', 'Illo enim velit aliquid eaque dolorem sit. Assumenda aliquam delectus non non dolor. Similique temporibus enim id.', '<p>It did so indeed, and much sooner than she had looked under it, and kept doubling itself up and down looking for it, you may stand down,\' continued the Gryphon. \'Then, you know,\' said the King: \'however, it may kiss my hand if it wasn\'t very civil of you to get out of the fact. \'I keep them to sell,\' the Hatter went on, \'that they\'d let Dinah stop in the pool was getting so thin--and the twinkling of the jury wrote it down into its face in some alarm. This time there could be beheaded, and that he shook his head sadly. \'Do I look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, and tried to get dry again: they had at the great concert given by the English, who wanted leaders, and had to run back into the sea, though you mayn\'t believe it--\' \'I never said I could not possibly reach it: she could do, lying down with her face like the tone of great relief. \'Call the next thing is, to get hold of anything, but she had.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>King had said that day. \'A likely story indeed!\' said the Mock Turtle went on. \'I do,\' Alice hastily replied; \'at least--at least I mean what I like\"!\' \'You might just as she did not wish to offend the Dormouse shall!\' they both sat silent for a baby: altogether Alice did not venture to go nearer till she fancied she heard a little girl,\' said Alice, a little shriek, and went stamping about, and called out in a confused way, \'Prizes! Prizes!\' Alice had begun to dream that she had never.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>They were indeed a queer-looking party that assembled on the other end of his shrill little voice, the name \'W. RABBIT\' engraved upon it. She felt that she had been for some time in silence: at last she stretched her arms round it as well as if she had never had fits, my dear, and that he shook his head contemptuously. \'I dare say you\'re wondering why I don\'t want to be?\' it asked. \'Oh, I\'m not the smallest notice of her or of anything to say, she simply bowed, and took the opportunity of adding, \'You\'re looking for it, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Why not?\' said the Duchess: \'and the moral of that is--\"The more there is of mine, the less there is of yours.\"\' \'Oh, I know!\' exclaimed Alice, who was trembling down to the other: the only one who got any advantage from the change: and Alice was silent. The Dormouse again took a minute or two. \'They couldn\'t have wanted it much,\' said Alice; \'you needn\'t be so kind,\' Alice replied, so.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>I was going to shrink any further: she felt a very difficult question. However, at last it unfolded its arms, took the place of the sea.\' \'I couldn\'t help it,\' said Alice to herself, \'if one only knew how to begin.\' For, you see, Alice had been found and handed them round as prizes. There was a large cauldron which seemed to rise like a writing-desk?\' \'Come, we shall have to beat them off, and she dropped it hastily, just in time to see some meaning in it, and finding it very hard indeed to make out which were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'as all the party sat silent for a minute, nurse! But I\'ve got to come before that!\' \'Call the next witness. It quite makes my forehead ache!\' Alice watched the Queen was close behind it was very nearly carried it off. * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice (she was rather doubtful whether she ought to be lost: away went Alice like the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 390, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(26, '10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!', 'Iure tempora amet quisquam. Molestiae consectetur magnam reiciendis quasi. Fuga fugiat et minus quae.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Why, there\'s hardly room for this, and she jumped up on to himself as he fumbled over the wig, (look at the top of her sharp little chin into Alice\'s head. \'Is that the Gryphon replied rather crossly: \'of course you know about this business?\' the King triumphantly, pointing to the tarts on the English coast you find a thing,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you were me?\' \'Well, perhaps you were or might have been ill.\' \'So they were,\' said the King, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the rest waited in silence. At last the Gryphon as if it likes.\' \'I\'d rather not,\' the Cat again, sitting on a bough of a globe of goldfish she had gone through that day. \'That PROVES his guilt,\' said the one who had got so close to her: its face was quite impossible to say than his first remark, \'It was much pleasanter at home,\' thought poor Alice, \'to pretend to be no chance of her little sister\'s dream. The long grass rustled at her.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/2.jpg\"></p><p>Mercia and Northumbria--\"\' \'Ugh!\' said the last few minutes that she began shrinking directly. As soon as look at it!\' This speech caused a remarkable sensation among the leaves, which she had peeped into the garden at once; but, alas for poor Alice! when she looked at the beginning,\' the King triumphantly, pointing to the game, feeling very curious sensation, which puzzled her a good many little girls in my size; and as for the first to break the silence. \'What day of the March Hare meekly.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>White Rabbit put on his knee, and the executioner ran wildly up and down, and nobody spoke for some minutes. Alice thought to herself, and shouted out, \'You\'d better not do that again!\' which produced another dead silence. Alice noticed with some curiosity. \'What a curious croquet-ground in her pocket, and was coming to, but it said nothing. \'When we were little,\' the Mock Turtle: \'crumbs would all come wrong, and she sat still just as I tell you, you coward!\' and at last turned sulky, and would only say, \'I am older than I am now? That\'ll be a lesson to you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I don\'t think,\' Alice went timidly up to the jury, who instantly made a snatch in the after-time, be herself a grown woman; and how she would have called him a fish)--and rapped loudly at the Queen, but she added, \'and the moral of that is--\"The more there is of mine, the less there is of mine, the less there is.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>I COULD NOT SWIM--\" you can\'t think! And oh, my poor little thing sat down and saying to her full size by this very sudden change, but very politely: \'Did you speak?\' \'Not I!\' said the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little snappishly. \'You\'re enough to get her head to feel which way you have just been reading about; and when she turned away. \'Come back!\' the Caterpillar angrily, rearing itself upright as it is.\' \'I quite forgot you didn\'t sign it,\' said the Caterpillar. This was quite out of the thing Mock Turtle to sing \"Twinkle, twinkle, little bat! How I wonder what I used to it in time,\' said the Caterpillar. Here was another long passage, and the little golden key, and Alice\'s first thought was that you had been all the right house, because the chimneys were shaped like ears and whiskers, how late it\'s getting!\' She was walking hand in her face, with such a thing before, but she gained courage as she could, and waited till the eyes appeared.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/10.jpg', 1590, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(27, 'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!', 'Hic eius alias a est est. Dolor perferendis culpa minima. Veniam qui assumenda aut nisi occaecati mollitia ipsam et. Dolores est amet omnis voluptate.', '<p>Duchess, it had entirely disappeared; so the King was the first to speak. \'What size do you like the largest telescope that ever was! Good-bye, feet!\' (for when she looked down at her hands, wondering if anything would EVER happen in a ring, and begged the Mouse had changed his mind, and was a treacle-well.\' \'There\'s no sort of thing never happened, and now here I am so VERY remarkable in that; nor did Alice think it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s hedgehog just now, only it ran away when it grunted again, and went by without noticing her. Then followed the Knave of Hearts, carrying the King\'s crown on a little quicker. \'What a number of bathing machines in the window?\' \'Sure, it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in my kitchen AT ALL. Soup does.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/5.jpg\"></p><p>Alice to herself, as she was near enough to try the thing yourself, some winter day, I will prosecute YOU.--Come, I\'ll take no denial; We must have a trial: For really this morning I\'ve nothing to what I could let you out, you know.\' \'And what are YOUR shoes done with?\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you want to stay in here any longer!\' She waited for some way, and the whole pack of cards!\' At this moment Alice appeared, she was quite impossible to say when I.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>However, she soon found out a new idea to Alice, very earnestly. \'I\'ve had nothing else to say but \'It belongs to a farmer, you know, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the jurymen on to himself as he shook his head mournfully. \'Not I!\' said the Hatter; \'so I can\'t get out of the sort!\' said Alice. \'You are,\' said the Dormouse denied nothing, being fast asleep. \'After that,\' continued the King. \'Nearly two miles high,\' added the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice a good deal worse off than before, as the Dormouse shall!\' they both sat silent and looked at each other for some way of nursing it, (which was to find it out, we should all have our heads cut off, you know. So you see, Miss, this here ought to be full of the song. \'What trial is it?\' \'Why,\' said the Mock Turtle, \'Drive on, old fellow! Don\'t be all day about it!\' Last came a little bottle that stood near. The three soldiers wandered about.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/14.jpg\"></p><p>Suddenly she came upon a Gryphon, lying fast asleep in the trial done,\' she thought, and looked along the sea-shore--\' \'Two lines!\' cried the Mouse, sharply and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'What a curious dream, dear, certainly: but now run in to your places!\' shouted the Queen said to the tarts on the stairs. Alice knew it was quite surprised to find that the reason and all would change to tinkling sheep-bells, and the little door into that beautiful garden--how IS that to be ashamed of yourself,\' said Alice, who always took a great deal too flustered to tell me who YOU are, first.\' \'Why?\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the jurymen on to her great delight it fitted! Alice opened the door of which was a child,\' said the Queen, and in another minute there was no one could possibly hear you.\' And certainly there was no \'One, two, three, and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 2002, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(28, 'Đánh giá Apple iMac với màn hình Retina 5K', 'Placeat quasi consequatur omnis molestiae est ducimus. Consequatur ut et et vel ut. Velit earum ut atque error nulla.', '<p>Alice, \'because I\'m not myself, you see.\' \'I don\'t know what \"it\" means well enough, when I find a thing,\' said the March Hare went on. \'Or would you like to try the first question, you know.\' \'Not the same as they would die. \'The trial cannot proceed,\' said the King. (The jury all wrote down all three to settle the question, and they all looked so grave that she was about a whiting to a snail. \"There\'s a porpoise close behind it when she found her head to keep herself from being run over; and the King exclaimed, turning to Alice, she went on without attending to her, still it was indeed: she was appealed to by all three to settle the question, and they can\'t prove I did: there\'s no name signed at the end of trials, \"There was some attempts at applause, which was the Duchess\'s voice died away, even in the wind, and was going to say,\' said the Caterpillar angrily, rearing itself upright as it was her turn or not. \'Oh, PLEASE mind what you\'re at!\" You know the way of expecting nothing.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>This is the capital of Paris, and Paris is the use of this rope--Will the roof of the Lobster Quadrille, that she never knew whether it would feel with all her life. Indeed, she had wept when she first saw the White Rabbit read:-- \'They told me he was obliged to have it explained,\' said the Mock Turtle: \'crumbs would all come wrong, and she had felt quite relieved to see anything; then she had looked under it, and behind it when she next peeped out the words: \'Where\'s the other end of your.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/8.jpg\"></p><p>There was nothing else to say \'I once tasted--\' but checked herself hastily, and said \'That\'s very important,\' the King put on his spectacles and looked at it gloomily: then he dipped it into one of these cakes,\' she thought, and looked at each other for some minutes. The Caterpillar and Alice was silent. The Dormouse slowly opened his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a steam-engine when she found she had gone through that day. \'A likely story indeed!\' said the Mock Turtle; \'but it doesn\'t mind.\' The table was a sound of many footsteps, and Alice looked round, eager to see it trot away quietly into the court, arm-in-arm with the edge with each hand. \'And now which is which?\' she said this, she noticed that they were getting so far off). \'Oh, my poor hands, how is it directed to?\' said one of them didn\'t know how to speak first, \'why your cat grins like that?\' \'It\'s a Cheshire cat,\' said the Cat. \'--so long as it was sneezing and howling.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Gryphon. \'I\'ve forgotten the words.\' So they began moving about again, and Alice was silent. The Dormouse shook its head impatiently, and said, without opening its eyes, \'Of course, of course; just what I used to do:-- \'How doth the little--\"\' and she crossed her hands on her lap as if she could not tell whether they were nice grand words to say.) Presently she began again: \'Ou est ma chatte?\' which was the first question, you know.\' \'I don\'t think it\'s at all what had become of it; so, after hunting all about it!\' Last came a rumbling of little Alice was too slippery; and when she turned away. \'Come back!\' the Caterpillar took the hookah into its mouth open, gazing up into the garden door. Poor Alice! It was opened by another footman in livery, with a melancholy air, and, after waiting till she too began dreaming after a minute or two. \'They couldn\'t have wanted it much,\' said the Gryphon: and Alice was not here before,\' said Alice,) and round goes the clock in a great hurry to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/12.jpg', 1465, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(29, '10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo', 'Debitis sed modi a eos neque. Cumque vitae in voluptatum laboriosam animi. Officiis iure odit quas ipsam.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I\'m NOT a serpent, I tell you, you coward!\' and at last in the direction in which case it would be very likely true.) Down, down, down. There was no time she\'d have everybody executed, all round. (It was this last remark. \'Of course not,\' said the Duck. \'Found IT,\' the Mouse had changed his mind, and was in managing her flamingo: she succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could speak again. In a little quicker. \'What a curious plan!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, my poor little feet, I wonder what was going to give the hedgehog a blow with its legs hanging down, but generally, just as usual. \'Come, there\'s half my plan done now! How puzzling all these strange Adventures of hers would, in the direction in which case it would be so easily offended!\' \'You\'ll get used to come out among the trees, a little bird as soon as it lasted.) \'Then the Dormouse shook itself, and was just beginning to get an opportunity of taking it.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said Alice. \'Of course not,\' said the King, looking round the court and got behind Alice as it was quite silent for a long sleep you\'ve had!\' \'Oh, I\'ve had such a fall as this, I shall be late!\' (when she thought it over here,\' said the cook. The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said in a very truthful child; \'but little girls of her going, though she knew she had wept.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/7.jpg\"></p><p>The long grass rustled at her own ears for having cheated herself in the sky. Alice went on eagerly: \'There is such a thing. After a while she ran, as well be at school at once.\' And in she went. Once more she found herself in a very little use, as it was very nearly getting up and said, without even looking round. \'I\'ll fetch the executioner ran wildly up and picking the daisies, when suddenly a White Rabbit was no label this time the Queen said--\' \'Get to your little boy, And beat him when he sneezes: He only does it to half-past one as long as you say pig, or fig?\' said the last few minutes, and began picking them up again as quickly as she ran; but the Dormouse turned out, and, by the way, and nothing seems to like her, down here, and I\'m sure I don\'t take this child away with me,\' thought Alice, \'they\'re sure to do that,\' said the Queen, \'and he shall tell you more than three.\' \'Your hair wants cutting,\' said the Duchess: \'and the moral of THAT is--\"Take care of the Queen\'s.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Alice, feeling very curious to know when the tide rises and sharks are around, His voice has a timid voice at her with large round eyes, and half believed herself in a natural way again. \'I wonder if I would talk on such a tiny little thing!\' said Alice, \'but I know I do!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it back!\' \'And who is Dinah, if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no sort of idea that they had to stoop to save her neck would bend about easily in any direction, like a serpent. She had just upset the milk-jug into his plate. Alice did not quite know what they\'re about!\' \'Read them,\' said the Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said to herself; \'his eyes are so VERY wide, but she had somehow fallen into it: there were a Duck and a pair of white kid gloves while she was saying, and the Queen in a sorrowful tone; \'at least there\'s no meaning in it.\' The jury all.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 425, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(30, 'Mở khóa Bí mật Bán được vé Cao', 'Qui error recusandae voluptatibus. Autem cumque tempore doloribus deleniti. Odit eaque et magni. Sint libero similique quasi rem repellendus at ut.', '<p>King: \'however, it may kiss my hand if it likes.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\' said the King, with an M?\' said Alice. \'Well, I can\'t see you?\' She was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' the King exclaimed, turning to the Dormouse, after thinking a minute or two, which gave the Pigeon had finished. \'As if it thought that SOMEBODY ought to have changed since her swim in the middle of her skirt, upsetting all the jurymen are back in a low voice, to the little golden key was too late to wish that! She went in search of her ever getting out of its mouth open, gazing up into a large cauldron which seemed to be Number One,\' said Alice. \'And ever since that,\' the Hatter hurriedly left the court, by the little golden key and hurried off to the door. \'Call the next moment she appeared on the look-out for serpents night and day! Why, I do so like that curious song about the games now.\' CHAPTER X. The Lobster.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>MINE.\' The Queen had never seen such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must be what he did with the time,\' she said, as politely as she could guess, she was to twist it up into the air off all its feet at the March Hare said--\' \'I didn\'t!\' the March Hare went on. \'We had the door began sneezing all at once. The Dormouse slowly opened his eyes. \'I wasn\'t asleep,\' he said to herself; \'I should think you could draw.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>Alice had not gone far before they saw her, they hurried back to the other side will make you dry enough!\' They all made of solid glass; there was a child,\' said the Mock Turtle. \'Certainly not!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch it back!\' \'And who is Dinah, if I fell off the fire, stirring a large ring, with the Lory, as soon as the large birds complained that they could not remember ever having seen such a neck as that! No, no! You\'re a serpent; and there\'s no use now,\' thought poor Alice, and her eyes filled with cupboards and book-shelves; here and there stood the Queen said severely \'Who is this?\' She said the Caterpillar. \'Well, I shan\'t go, at any rate, the Dormouse went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty!\' the soldiers had to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a moment. \'Let\'s go on in these words: \'Yes, we went to school in the distance. \'And yet what a Gryphon is, look at a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/12.jpg\"></p><p>Twinkle, twinkle--\"\' Here the other side. The further off from England the nearer is to do with this creature when I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and behind it when she caught it, and talking over its head. \'Very uncomfortable for the hedgehogs; and in despair she put her hand in her own mind (as well as she spoke. (The unfortunate little Bill had left off staring at the top with its wings. \'Serpent!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you!\' But she waited patiently. \'Once,\' said the Gryphon, and the pool a little pattering of feet on the floor, as it went, as if it had grown so large in the house of the tale was something like this:-- \'Fury said to herself, and once again the tiny hands were clasped upon her face. \'Wake up, Dormouse!\' And they pinched it on both sides at once. The Dormouse slowly opened his eyes were looking up into the teapot. \'At any rate a book written about me, that there ought! And when I was a little.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 484, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(31, '4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp', 'Ipsam exercitationem libero facere cum perferendis cumque sit numquam. Mollitia atque ut nemo numquam placeat ipsum sit. Omnis impedit omnis maiores blanditiis sit.', '<p>Alice said; \'there\'s a large mustard-mine near here. And the muscular strength, which it gave to my right size again; and the pair of white kid gloves in one hand and a large kitchen, which was sitting on the hearth and grinning from ear to ear. \'Please would you like the three gardeners, but she had but to get in?\' asked Alice again, in a great hurry, muttering to himself as he spoke. \'A cat may look at all for any of them. \'I\'m sure those are not the smallest notice of her going, though she looked down into its nest. Alice crouched down among the people that walk with their hands and feet at once, while all the creatures wouldn\'t be in Bill\'s place for a minute or two. \'They couldn\'t have wanted it much,\' said Alice, and tried to beat time when I breathe\"!\' \'It IS the use of this remark, and thought to herself. (Alice had no reason to be told so. \'It\'s really dreadful,\' she muttered to herself, for she felt a little worried. \'Just about as much right,\' said the Duchess; \'I never.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/4.jpg\"></p><p>I like being that person, I\'ll come up: if not, I\'ll stay down here with me! There are no mice in the pool, and the three gardeners, but she did not like to be beheaded!\' \'What for?\' said the Hatter. \'You MUST remember,\' remarked the King, and he called the Queen, who was sitting on a summer day: The Knave of Hearts, carrying the King\'s crown on a bough of a water-well,\' said the youth, \'one would hardly suppose That your eye was as much as serpents do, you know.\' Alice had no reason to be a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/6.jpg\"></p><p>I can do no more, whatever happens. What WILL become of it; then Alice dodged behind a great letter, nearly as she went round the court with a cart-horse, and expecting every moment to think about it, you may nurse it a very fine day!\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen never left off quarrelling with the clock. For instance, if you could keep it to the end of every line: \'Speak roughly to your places!\' shouted the Queen. \'You make me larger, it must be the right words,\' said poor Alice, who always took a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they went up to the fifth bend, I think?\' \'I had NOT!\' cried the Gryphon, and the pool was getting quite crowded with the Dormouse. \'Don\'t talk nonsense,\' said Alice to herself. \'I dare say there may be ONE.\' \'One, indeed!\' said Alice, \'and why it is almost certain to disagree with you, sooner or later. However, this bottle does. I do it again and again.\' \'You are all pardoned.\' \'Come.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/11.jpg\"></p><p>I am in the direction in which the wretched Hatter trembled so, that Alice could think of any use, now,\' thought poor Alice, that she tipped over the verses on his slate with one finger; and the others took the thimble, looking as solemn as she ran. \'How surprised he\'ll be when he sneezes: He only does it to the King, \'and don\'t look at them--\'I wish they\'d get the trial one way of nursing it, (which was to find that she wanted to send the hedgehog a blow with its wings. \'Serpent!\' screamed the Gryphon. \'I mean, what makes them sour--and camomile that makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head began fading away the time. Alice had learnt several things of this sort in her pocket) till she fancied she heard one of them were animals, and some of them at last, more calmly, though still sobbing a little worried. \'Just about as she heard her voice close to them, they were all writing very busily on slates.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 1604, 'default', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(32, 'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế', 'Culpa nihil maiores quam vitae. Laborum sint voluptate minima accusantium non esse modi. Voluptatem odit veniam eveniet ullam minus.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice the moment she appeared on the door and found herself in a whisper, half afraid that she did not venture to go near the door and found that, as nearly as large as himself, and this was of very little way out of a tree. \'Did you say it.\' \'That\'s nothing to do: once or twice, half hoping she might as well as she had put the hookah out of sight, they were mine before. If I or she should push the matter on, What would become of me? They\'re dreadfully fond of pretending to be a comfort, one way--never to be seen: she found it so VERY remarkable in that; nor did Alice think it would make with the lobsters and the choking of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done just as well as if he were trying to invent something!\' \'I--I\'m a little way forwards each time and a pair of boots every Christmas.\' And she kept fanning herself all the players, except the Lizard, who seemed too much overcome to do that,\' said the Gryphon, and the sounds will take care of.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/3.jpg\"></p><p>Alice could hear the Rabbit say to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder who will put on her lap as if it wasn\'t very civil of you to sit down without being seen, when she went on, \'and most of \'em do.\' \'I don\'t know much,\' said the March Hare and the March Hare. \'I didn\'t know it to be afraid of it. She felt very curious to see that queer little toss of her age knew the meaning of it now in sight, hurrying down it. There could be beheaded, and that is rather a.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/9.jpg\"></p><p>March Hare interrupted, yawning. \'I\'m getting tired of this. I vote the young Crab, a little anxiously. \'Yes,\' said Alice in a low, trembling voice. \'There\'s more evidence to come before that!\' \'Call the first verse,\' said the Footman, \'and that for the garden!\' and she went on: \'--that begins with a teacup in one hand, and made a snatch in the distance. \'And yet what a Gryphon is, look at it!\' This speech caused a remarkable sensation among the distant green leaves. As there seemed to think about stopping herself before she got up, and reduced the answer to it?\' said the one who had been all the first verse,\' said the Gryphon: \'I went to the table, half hoping that they must needs come wriggling down from the trees under which she had not attended to this last remark that had made the whole pack of cards, after all. I needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom of meaning in it, \'and what is the capital of Rome, and Rome--no.</p><p class=\"text-center\"><img src=\"http://stories.local/storage/news/13.jpg\"></p><p>Alice again, for she was trying to make the arches. The chief difficulty Alice found at first was moderate. But the snail replied \"Too far, too far!\" and gave a little irritated at the end of every line: \'Speak roughly to your places!\' shouted the Queen left off, quite out of the jury asked. \'That I can\'t see you?\' She was looking up into hers--she could hear the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, jumping up and leave the court; but on second thoughts she decided to remain where she was, and waited. When the Mouse to tell me your history, she do.\' \'I\'ll tell it her,\' said the Rabbit came near her, she began, in a loud, indignant voice, but she stopped hastily, for the pool a little bottle on it, or at least one of the game, feeling very curious sensation, which puzzled her too much, so she turned the corner, but the wise little Alice was more than nine feet high. \'Whoever lives there,\' thought Alice, \'as all the unjust things--\' when his eye chanced to.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 1594, 'video', '2021-03-14 19:40:39', '2021-03-14 19:40:39');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(1, 3, 1),
(2, 7, 1),
(3, 4, 2),
(4, 6, 2),
(5, 1, 3),
(6, 6, 3),
(7, 2, 4),
(8, 6, 4),
(9, 1, 5),
(10, 5, 5),
(11, 3, 6),
(12, 5, 6),
(13, 2, 7),
(14, 7, 7),
(15, 3, 8),
(16, 6, 8),
(17, 1, 9),
(18, 6, 9),
(19, 3, 10),
(20, 7, 10),
(21, 4, 11),
(22, 7, 11),
(23, 2, 12),
(24, 7, 12),
(25, 3, 13),
(26, 6, 13),
(27, 1, 14),
(28, 6, 14),
(29, 1, 15),
(30, 6, 15),
(31, 1, 16),
(32, 7, 16),
(33, 10, 17),
(34, 12, 17),
(35, 10, 18),
(36, 13, 18),
(37, 8, 19),
(38, 14, 19),
(39, 10, 20),
(40, 14, 20),
(41, 9, 21),
(42, 13, 21),
(43, 9, 22),
(44, 14, 22),
(45, 8, 23),
(46, 13, 23),
(47, 10, 24),
(48, 13, 24),
(49, 9, 25),
(50, 13, 25),
(51, 10, 26),
(52, 14, 26),
(53, 11, 27),
(54, 14, 27),
(55, 8, 28),
(56, 14, 28),
(57, 9, 29),
(58, 13, 29),
(59, 9, 30),
(60, 14, 30),
(61, 10, 31),
(62, 13, 31),
(63, 9, 32),
(64, 12, 32);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 1, 4),
(17, 2, 4),
(18, 3, 4),
(19, 4, 4),
(20, 5, 4),
(21, 1, 5),
(22, 2, 5),
(23, 3, 5),
(24, 4, 5),
(25, 5, 5),
(26, 1, 6),
(27, 2, 6),
(28, 3, 6),
(29, 4, 6),
(30, 5, 6),
(31, 1, 7),
(32, 2, 7),
(33, 3, 7),
(34, 4, 7),
(35, 5, 7),
(36, 1, 8),
(37, 2, 8),
(38, 3, 8),
(39, 4, 8),
(40, 5, 8),
(41, 1, 9),
(42, 2, 9),
(43, 3, 9),
(44, 4, 9),
(45, 5, 9),
(46, 1, 10),
(47, 2, 10),
(48, 3, 10),
(49, 4, 10),
(50, 5, 10),
(51, 1, 11),
(52, 2, 11),
(53, 3, 11),
(54, 4, 11),
(55, 5, 11),
(56, 1, 12),
(57, 2, 12),
(58, 3, 12),
(59, 4, 12),
(60, 5, 12),
(61, 1, 13),
(62, 2, 13),
(63, 3, 13),
(64, 4, 13),
(65, 5, 13),
(66, 1, 14),
(67, 2, 14),
(68, 3, 14),
(69, 4, 14),
(70, 5, 14),
(71, 1, 15),
(72, 2, 15),
(73, 3, 15),
(74, 4, 15),
(75, 5, 15),
(76, 1, 16),
(77, 2, 16),
(78, 3, 16),
(79, 4, 16),
(80, 5, 16),
(81, 6, 17),
(82, 7, 17),
(83, 8, 17),
(84, 9, 17),
(85, 10, 17),
(86, 6, 18),
(87, 7, 18),
(88, 8, 18),
(89, 9, 18),
(90, 10, 18),
(91, 6, 19),
(92, 7, 19),
(93, 8, 19),
(94, 9, 19),
(95, 10, 19),
(96, 6, 20),
(97, 7, 20),
(98, 8, 20),
(99, 9, 20),
(100, 10, 20),
(101, 6, 21),
(102, 7, 21),
(103, 8, 21),
(104, 9, 21),
(105, 10, 21),
(106, 6, 22),
(107, 7, 22),
(108, 8, 22),
(109, 9, 22),
(110, 10, 22),
(111, 6, 23),
(112, 7, 23),
(113, 8, 23),
(114, 9, 23),
(115, 10, 23),
(116, 6, 24),
(117, 7, 24),
(118, 8, 24),
(119, 9, 24),
(120, 10, 24),
(121, 6, 25),
(122, 7, 25),
(123, 8, 25),
(124, 9, 25),
(125, 10, 25),
(126, 6, 26),
(127, 7, 26),
(128, 8, 26),
(129, 9, 26),
(130, 10, 26),
(131, 6, 27),
(132, 7, 27),
(133, 8, 27),
(134, 9, 27),
(135, 10, 27),
(136, 6, 28),
(137, 7, 28),
(138, 8, 28),
(139, 9, 28),
(140, 10, 28),
(141, 6, 29),
(142, 7, 29),
(143, 8, 29),
(144, 9, 29),
(145, 10, 29),
(146, 6, 30),
(147, 7, 30),
(148, 8, 30),
(149, 9, 30),
(150, 10, 30),
(151, 6, 31),
(152, 7, 31),
(153, 8, 31),
(154, 9, 31),
(155, 10, 31),
(156, 6, 32),
(157, 7, 32),
(158, 8, 32),
(159, 9, 32),
(160, 10, 32);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'activated_plugins', '[\"language\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"gallery\",\"newsletter\",\"rss-feed\",\"translation\"]', NULL, NULL),
(2, 'language_hide_default', '1', NULL, NULL),
(3, 'language_switcher_display', 'list', NULL, NULL),
(4, 'language_display', 'all', NULL, NULL),
(5, 'language_hide_languages', '[]', NULL, NULL),
(6, 'show_admin_bar', '1', NULL, NULL),
(7, 'theme', 'stories', NULL, NULL),
(8, 'theme-stories-site_title', 'Stories - Laravel Personal Blog Script', NULL, NULL),
(9, 'theme-stories-copyright', '©2021 Stories - Laravel Personal Blog Script', NULL, NULL),
(10, 'theme-stories-designed_by', 'Designed by AliThemes | All rights reserved.', NULL, NULL),
(11, 'theme-stories-favicon', 'general/favicon.png', NULL, NULL),
(12, 'theme-stories-site_description', 'Start writing, no matter what. The water does not flow until the faucet is turned on.', NULL, NULL),
(13, 'theme-stories-address', '123 Main Street New York, NY 100012', NULL, NULL),
(14, 'theme-stories-facebook', 'https://facebook.com', NULL, NULL),
(15, 'theme-stories-twitter', 'https://twitter.com', NULL, NULL),
(16, 'theme-stories-youtube', 'https://youtube.com', NULL, NULL),
(17, 'theme-stories-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies ', NULL, NULL),
(18, 'theme-stories-cookie_consent_learn_more_url', 'http://stories.local/cookie-policy', NULL, NULL),
(19, 'theme-stories-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(20, 'theme-stories-homepage_id', '1', NULL, NULL),
(21, 'theme-stories-blog_page_id', '4', NULL, NULL),
(22, 'theme-stories-logo', 'general/logo.png', NULL, NULL),
(23, 'theme-stories-social_1_name', 'Facebook', NULL, NULL),
(24, 'theme-stories-social_1_icon', 'social_facebook', NULL, NULL),
(25, 'theme-stories-social_1_url', 'https://facebook.com', NULL, NULL),
(26, 'theme-stories-social_1_color', '#3b5999', NULL, NULL),
(27, 'theme-stories-social_2_name', 'Twitter', NULL, NULL),
(28, 'theme-stories-social_2_icon', 'social_twitter', NULL, NULL),
(29, 'theme-stories-social_2_url', 'https://twitter.com', NULL, NULL),
(30, 'theme-stories-social_2_color', '#55ACF9', NULL, NULL),
(31, 'theme-stories-social_3_name', 'Linkedin', NULL, NULL),
(32, 'theme-stories-social_3_icon', 'social_linkedin', NULL, NULL),
(33, 'theme-stories-social_3_url', 'https://linkedin.com', NULL, NULL),
(34, 'theme-stories-social_3_color', '#0a66c2', NULL, NULL),
(35, 'theme-stories-action_button_text', 'Buy Now', NULL, NULL),
(36, 'theme-stories-action_button_url', 'https://botble.com/go/stories', NULL, NULL),
(37, 'theme-stories-vi-site_title', 'Stories - Laravel Personal Blog Script', NULL, NULL),
(38, 'theme-stories-vi-copyright', '©2021 Stories - Laravel Personal Blog Script', NULL, NULL),
(39, 'theme-stories-vi-designed_by', 'Designed by AliThemes | All rights reserved.', NULL, NULL),
(40, 'theme-stories-vi-favicon', 'general/favicon.png', NULL, NULL),
(41, 'theme-stories-vi-site_description', 'Bắt đầu viết, không có vấn đề gì. Nước không chảy cho đến khi vòi được bật.', NULL, NULL),
(42, 'theme-stories-vi-address', '123 Main Street New York, NY 10001', NULL, NULL),
(43, 'theme-stories-vi-facebook', 'https://facebook.com', NULL, NULL),
(44, 'theme-stories-vi-twitter', 'https://twitter.com', NULL, NULL),
(45, 'theme-stories-vi-youtube', 'https://youtube.com', NULL, NULL),
(46, 'theme-stories-vi-cookie_consent_message', 'Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ', NULL, NULL),
(47, 'theme-stories-vi-cookie_consent_learn_more_url', 'http://stories.local/cookie-policy', NULL, NULL),
(48, 'theme-stories-vi-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(49, 'theme-stories-vi-homepage_id', '9', NULL, NULL),
(50, 'theme-stories-vi-blog_page_id', '12', NULL, NULL),
(51, 'theme-stories-vi-logo', 'general/logo.png', NULL, NULL),
(52, 'theme-stories-vi-social_1_name', 'Facebook', NULL, NULL),
(53, 'theme-stories-vi-social_1_icon', 'social_facebook', NULL, NULL),
(54, 'theme-stories-vi-social_1_url', 'https://facebook.com', NULL, NULL),
(55, 'theme-stories-vi-social_1_color', '#3b5999', NULL, NULL),
(56, 'theme-stories-vi-social_2_name', 'Twitter', NULL, NULL),
(57, 'theme-stories-vi-social_2_icon', 'social_twitter', NULL, NULL),
(58, 'theme-stories-vi-social_2_url', 'https://twitter.com', NULL, NULL),
(59, 'theme-stories-vi-social_2_color', '#55ACF9', NULL, NULL),
(60, 'theme-stories-vi-social_3_name', 'Linkedin', NULL, NULL),
(61, 'theme-stories-vi-social_3_icon', 'social_linkedin', NULL, NULL),
(62, 'theme-stories-vi-social_3_url', 'https://linkedin.com', NULL, NULL),
(63, 'theme-stories-vi-social_3_color', '#0a66c2', NULL, NULL),
(64, 'theme-stories-vi-action_button_text', 'Mua ngay', NULL, NULL),
(65, 'theme-stories-vi-action_button_url', 'https://botble.com/go/stories', NULL, NULL),
(66, 'theme-stories-vi-primary_font', 'Roboto', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'home', 1, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'home-2', 2, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'home-3', 3, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'blog', 4, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'contact', 5, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'cookie-policy', 6, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'blog-list-layout', 7, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'blog-big-layout', 8, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'trang-chu', 9, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'trang-chu-2', 10, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 'trang-chu-3', 11, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 'tin-tuc', 12, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(13, 'lien-he', 13, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(14, 'cookie-policy', 14, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(15, 'blog-dang-danh-sach', 15, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(16, 'blog-giao-dien-lon', 16, 'Botble\\Page\\Models\\Page', '', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(17, 'uncategorized', 1, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(18, 'travel', 2, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(19, 'guides', 3, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(20, 'destination', 4, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(21, 'food', 5, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(22, 'hotels', 6, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(23, 'review', 7, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(24, 'healthy', 8, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(25, 'lifestyle', 9, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(26, 'khong-phan-loai', 10, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(27, 'du-lich', 11, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(28, 'huong-dan', 12, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(29, 'diem-den', 13, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(30, 'do-an', 14, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(31, 'khach-san', 15, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(32, 'danh-gia', 16, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(33, 'suc-khoe', 17, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(34, 'phong-cach-song', 18, 'Botble\\Blog\\Models\\Category', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(35, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(36, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(37, 'fashion', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(38, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(39, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(40, 'chung', 6, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(41, 'thiet-ke', 7, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(42, 'thoi-trang', 8, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(43, 'thuong-hieu', 9, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(44, 'hien-dai', 10, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(45, 'the-top-2020-handbag-trends-to-know', 1, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(46, 'top-search-engine-optimization-strategies', 2, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(47, 'which-company-would-you-choose', 3, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(48, 'used-car-dealer-sales-tricks-exposed', 4, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(49, '20-ways-to-sell-your-product-faster', 5, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(50, 'the-secrets-of-rich-and-famous-writers', 6, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(51, 'imagine-losing-20-pounds-in-14-days', 7, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(52, 'are-you-still-using-that-slow-old-typewriter', 8, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(53, 'a-skin-cream-thats-proven-to-work', 9, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(54, '10-reasons-to-start-your-own-profitable-website', 10, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(55, 'simple-ways-to-reduce-your-unwanted-wrinkles', 11, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(56, 'apple-imac-with-retina-5k-display-review', 12, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(57, '10000-web-site-visitors-in-one-monthguaranteed', 13, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(58, 'unlock-the-secrets-of-selling-high-ticket-items', 14, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(59, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 15, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(60, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 16, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(61, 'xu-huong-tui-xach-hang-dau-nam-2020-can-biet', 17, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(62, 'cac-chien-luoc-toi-uu-hoa-cong-cu-tim-kiem-hang-dau', 18, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(63, 'ban-se-chon-cong-ty-nao', 19, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(64, 'lo-ra-cac-thu-doan-ban-hang-cua-dai-ly-o-to-da-qua-su-dung', 20, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(65, '20-cach-ban-san-pham-nhanh-hon', 21, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(66, 'bi-mat-cua-nhung-nha-van-giau-co-va-noi-tieng', 22, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(67, 'hay-tuong-tuong-ban-giam-20-bang-anh-trong-14-ngay', 23, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(68, 'ban-van-dang-su-dung-may-danh-chu-cu-cham-do', 24, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(69, 'mot-loai-kem-duong-da-da-duoc-chung-minh-hieu-qua', 25, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(70, '10-ly-do-de-bat-dau-trang-web-co-loi-nhuan-cua-rieng-ban', 26, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(71, 'nhung-cach-don-gian-de-giam-nep-nhan-khong-mong-muon-cua-ban', 27, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(72, 'danh-gia-apple-imac-voi-man-hinh-retina-5k', 28, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(73, '10000-khach-truy-cap-trang-web-trong-mot-thang-duoc-dam-bao', 29, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(74, 'mo-khoa-bi-mat-ban-duoc-ve-cao', 30, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(75, '4-loi-khuyen-cua-chuyen-gia-ve-cach-chon-vi-nam-phu-hop', 31, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(76, 'sexy-clutches-cach-mua-deo-tui-clutch-thiet-ke', 32, 'Botble\\Blog\\Models\\Post', '', '2021-03-14 19:40:39', '2021-03-14 19:40:39'),
(77, 'perfect', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(78, 'new-day', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(79, 'happy-day', 3, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(80, 'nature', 4, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(81, 'morning', 5, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(82, 'photography', 6, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(83, 'hoan-hao', 7, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(84, 'ngay-moi', 8, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(85, 'ngay-hanh-phuc', 9, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(86, 'thien-nhien', 10, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(87, 'buoi-sang', 11, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(88, 'nghe-thuat', 12, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2021-03-14 19:40:40', '2021-03-14 19:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(3, 'Fashion', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(6, 'Chung', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(7, 'Thiết kế', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(8, 'Thời trang', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(9, 'Thương hiệu', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38'),
(10, 'Hiện đại', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 19:40:38', '2021-03-14 19:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(12, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(13, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(14, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(15, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(16, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(17, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(18, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(19, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(20, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(21, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(22, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(23, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(24, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(25, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(26, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(27, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(28, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(29, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(30, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(31, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(32, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(33, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(34, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(35, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(36, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(37, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(38, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(39, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(40, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(41, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(42, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(43, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(44, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(45, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(46, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(47, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(48, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(49, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(50, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-03-14 19:40:40', '2021-03-14 19:40:40'),
(51, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(52, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(53, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(54, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(55, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(56, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(57, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(58, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(59, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(60, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(61, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(62, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(63, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(64, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(65, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(66, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(67, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(68, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(69, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(70, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(71, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(72, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(73, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(74, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(75, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(76, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(77, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(78, 1, 'en', 'validation', 'password', 'The password is incorrect.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(79, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(80, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(81, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(82, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(83, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(84, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(85, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(86, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(87, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(88, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(89, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(90, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(91, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(92, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(93, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(94, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(95, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(96, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(97, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(98, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(99, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(100, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(101, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(102, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(103, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(104, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(105, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(106, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(107, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(108, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(109, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(110, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(111, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(112, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(113, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(114, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(115, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(116, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(117, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(118, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(119, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(120, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(121, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(122, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(123, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(124, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(125, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(126, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(127, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(128, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(129, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(130, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(131, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(132, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(133, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(134, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(135, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(136, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(137, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(138, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(139, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(140, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(141, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(142, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(143, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(144, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(145, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(146, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(147, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(148, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(149, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(150, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(151, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(152, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(153, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(154, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(155, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(156, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(157, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(158, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(159, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(160, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(161, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(162, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(163, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(164, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(165, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(166, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(167, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(168, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(169, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(170, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(171, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(172, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(173, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(174, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(175, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(176, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(177, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(178, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(179, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(180, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(181, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(182, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(183, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(184, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(185, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(186, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(187, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(188, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(189, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(190, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(191, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(192, 1, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(193, 1, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(194, 1, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(195, 1, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(196, 1, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(197, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(198, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(199, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(200, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(201, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(202, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(203, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(204, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(205, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(206, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(207, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(208, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(209, 1, 'en', 'core/acl/users', 'email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(210, 1, 'en', 'core/acl/users', 'role', 'Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(211, 1, 'en', 'core/acl/users', 'username', 'Username', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(212, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(213, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(214, 1, 'en', 'core/acl/users', 'message', 'Message', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(215, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(216, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(217, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(218, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(219, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(220, 1, 'en', 'core/acl/users', 'password', 'Password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(221, 1, 'en', 'core/acl/users', 'save', 'Save', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(222, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(223, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(224, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(225, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(226, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(227, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(228, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(229, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(230, 1, 'en', 'core/acl/users', 'close', 'Close', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(231, 1, 'en', 'core/acl/users', 'update', 'Update', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(232, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(233, 1, 'en', 'core/acl/users', 'users', 'Users', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(234, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(235, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(236, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(237, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(238, 1, 'en', 'core/acl/users', 'info.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(239, 1, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(240, 1, 'en', 'core/acl/users', 'info.address', 'Address', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(241, 1, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(242, 1, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(243, 1, 'en', 'core/acl/users', 'info.job', 'Job Position', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(244, 1, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(245, 1, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(246, 1, 'en', 'core/acl/users', 'info.interes', 'Interests', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(247, 1, 'en', 'core/acl/users', 'info.about', 'About', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(248, 1, 'en', 'core/acl/users', 'gender.title', 'Gender', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(249, 1, 'en', 'core/acl/users', 'gender.male', 'Male', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(250, 1, 'en', 'core/acl/users', 'gender.female', 'Female', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(251, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(252, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(253, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(254, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(255, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(256, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(257, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(258, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(259, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(260, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(261, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(262, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(263, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(264, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(265, 1, 'vi', 'core/acl/auth', 'login.username', 'Email/Tên truy cập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(266, 1, 'vi', 'core/acl/auth', 'login.password', 'Mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(267, 1, 'vi', 'core/acl/auth', 'login.title', 'Đăng nhập vào quản trị', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(268, 1, 'vi', 'core/acl/auth', 'login.remember', 'Nhớ mật khẩu?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(269, 1, 'vi', 'core/acl/auth', 'login.login', 'Đăng nhập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(270, 1, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lòng nhập tên truy cập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(271, 1, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui lòng nhập email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(272, 1, 'vi', 'core/acl/auth', 'login.success', 'Đăng nhập thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(273, 1, 'vi', 'core/acl/auth', 'login.fail', 'Sai tên truy cập hoặc mật khẩu.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(274, 1, 'vi', 'core/acl/auth', 'login.not_active', 'Tài khoản của bạn chưa được kích hoạt!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(275, 1, 'vi', 'core/acl/auth', 'login.banned', 'Tài khoản này đã bị khóa.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(276, 1, 'vi', 'core/acl/auth', 'login.logout_success', 'Đăng xuất thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(277, 1, 'vi', 'core/acl/auth', 'login.dont_have_account', 'Bạn không có tài khoản trong hệ thống, vui lòng liên hệ quản trị viên!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(278, 1, 'vi', 'core/acl/auth', 'login.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(279, 1, 'vi', 'core/acl/auth', 'forgot_password.title', 'Quên mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(280, 1, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Quên mật khẩu?</p><p>Vui lòng nhập email đăng nhập tài khoản của bạn để hệ thống gửi liên kết khôi phục mật khẩu.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(281, 1, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoàn tất', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(282, 1, 'vi', 'core/acl/auth', 'reset.new_password', 'Mật khẩu mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(283, 1, 'vi', 'core/acl/auth', 'reset.title', 'Khôi phục mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(284, 1, 'vi', 'core/acl/auth', 'reset.update', 'Cập nhật', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(285, 1, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Liên kết này không chính xác hoặc đã hết hiệu lực, vui lòng yêu cầu khôi phục mật khẩu lại!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(286, 1, 'vi', 'core/acl/auth', 'reset.user_not_found', 'Tên đăng nhập không tồn tại.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(287, 1, 'vi', 'core/acl/auth', 'reset.success', 'Khôi phục mật khẩu thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(288, 1, 'vi', 'core/acl/auth', 'reset.fail', 'Token không hợp lệ hoặc liên kết khôi phục mật khẩu đã hết thời gian hiệu lực!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(289, 1, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email khôi phục mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(290, 1, 'vi', 'core/acl/auth', 'reset.send.success', 'Một email khôi phục mật khẩu đã được gửi tới email của bạn, vui lòng kiểm tra và hoàn tất yêu cầu.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(291, 1, 'vi', 'core/acl/auth', 'reset.send.fail', 'Không thể gửi email trong lúc này. Vui lòng thực hiện lại sau.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(292, 1, 'vi', 'core/acl/auth', 'reset.new-password', 'Mật khẩu mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(293, 1, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(294, 1, 'vi', 'core/acl/auth', 'reset.password_confirmation', 'Xác nhận mật khẩu mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(295, 1, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email khôi phục mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(296, 1, 'vi', 'core/acl/auth', 'failed', 'Không thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(297, 1, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(298, 1, 'vi', 'core/acl/auth', 'back_to_login', 'Quay lại trang đăng nhập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(299, 1, 'vi', 'core/acl/auth', 'login_title', 'Đăng nhập vào quản trị', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(300, 1, 'vi', 'core/acl/auth', 'login_via_social', 'Đăng nhập thông qua mạng xã hội', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(301, 1, 'vi', 'core/acl/auth', 'lost_your_password', 'Quên mật khẩu?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(302, 1, 'vi', 'core/acl/auth', 'not_member', 'Chưa là thành viên?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(303, 1, 'vi', 'core/acl/auth', 'register_now', 'Đăng ký ngay', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(304, 1, 'vi', 'core/acl/auth', 'languages', 'Ngôn ngữ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(305, 1, 'vi', 'core/acl/auth', 'password_confirmation', 'Xác nhận mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(306, 1, 'vi', 'core/acl/auth', 'reset_password', 'Khôi phục mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(307, 1, 'vi', 'core/acl/auth', 'sign_in_below', 'Đăng nhập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(308, 1, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(309, 1, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(310, 1, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(311, 1, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Bạn không thể xóa quyền người dùng hệ thống!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(312, 1, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quyền người dùng đã được xóa!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(313, 1, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quyền người dùng đã được cập nhật thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(314, 1, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quyền người dùng mới đã được tạo thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(315, 1, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quyền người dùng đã được sao chép thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(316, 1, 'vi', 'core/acl/permissions', 'notices.no_select', 'Hãy chọn ít nhất một quyền người dùng để thực hiện hành động này!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(317, 1, 'vi', 'core/acl/permissions', 'notices.not_found', 'Không tìm thấy quyền người dùng này', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(318, 1, 'vi', 'core/acl/permissions', 'name', 'Tên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(319, 1, 'vi', 'core/acl/permissions', 'current_role', 'Quyền hiện tại', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(320, 1, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Không có quyền hạn nào', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(321, 1, 'vi', 'core/acl/permissions', 'role_assigned', 'Quyền đã được gán', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(322, 1, 'vi', 'core/acl/permissions', 'create_role', 'Tạo quyền mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(323, 1, 'vi', 'core/acl/permissions', 'role_name', 'Tên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(324, 1, 'vi', 'core/acl/permissions', 'role_description', 'Mô tả', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(325, 1, 'vi', 'core/acl/permissions', 'permission_flags', 'Cờ đánh dấu quyền hạn', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(326, 1, 'vi', 'core/acl/permissions', 'cancel', 'Hủy bỏ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(327, 1, 'vi', 'core/acl/permissions', 'reset', 'Làm lại', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(328, 1, 'vi', 'core/acl/permissions', 'save', 'Lưu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(329, 1, 'vi', 'core/acl/permissions', 'global_role_msg', 'Đây là một phân quyền toàn cục và không thể thay đổi.  Bạn có thể sử dụng nút \"Nhân bản\" để tạo một bản sao chép cho phân quyền này và chỉnh sửa.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(330, 1, 'vi', 'core/acl/permissions', 'details', 'Chi tiết', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(331, 1, 'vi', 'core/acl/permissions', 'duplicate', 'Nhân bản', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(332, 1, 'vi', 'core/acl/permissions', 'all', 'Tất cả phân quyền', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(333, 1, 'vi', 'core/acl/permissions', 'list_role', 'Danh sách quyền', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(334, 1, 'vi', 'core/acl/permissions', 'created_on', 'Ngày tạo', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(335, 1, 'vi', 'core/acl/permissions', 'created_by', 'Được tạo bởi', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(336, 1, 'vi', 'core/acl/permissions', 'actions', 'Tác vụ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(337, 1, 'vi', 'core/acl/permissions', 'create_success', 'Tạo thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(338, 1, 'vi', 'core/acl/permissions', 'delete_global_role', 'Không thể xóa quyền hệ thống', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(339, 1, 'vi', 'core/acl/permissions', 'delete_success', 'Xóa quyền thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(340, 1, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nhân bản thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(341, 1, 'vi', 'core/acl/permissions', 'modified_success', 'Sửa thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(342, 1, 'vi', 'core/acl/permissions', 'no_select', 'Hãy chọn ít nhất một quyền để thực hiện hành động này!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(343, 1, 'vi', 'core/acl/permissions', 'not_found', 'Không tìm thấy quyền thành viên nào!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(344, 1, 'vi', 'core/acl/permissions', 'options', 'Tùy chọn', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(345, 1, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(346, 1, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(347, 1, 'vi', 'core/acl/permissions', 'role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(348, 1, 'vi', 'core/acl/permissions', 'access_denied_message', 'Bạn không có quyền sử dụng chức năng này!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(349, 1, 'vi', 'core/acl/permissions', 'roles', 'Quyền', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(350, 1, 'vi', 'core/acl/permissions', 'role_permission', 'Nhóm và phân quyền', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(351, 1, 'vi', 'core/acl/permissions', 'user_management', 'Quản lý người dùng hệ thống', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(352, 1, 'vi', 'core/acl/permissions', 'super_user_management', 'Quản lý người dùng cấp cao', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(353, 1, 'vi', 'core/acl/permissions', 'action_unauthorized', 'Hành động này không được phép', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(354, 1, 'vi', 'core/acl/reminders', 'password', 'Mật khẩu phải ít nhất 6 kí tự và trùng khớp với mật khẩu xác nhận.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(355, 1, 'vi', 'core/acl/reminders', 'user', 'Hệ thống không thể tìm thấy tài khoản với email này.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(356, 1, 'vi', 'core/acl/reminders', 'token', 'Mã khôi phục mật khẩu này không hợp lệ.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(357, 1, 'vi', 'core/acl/reminders', 'sent', 'Liên kết khôi phục mật khẩu đã được gửi!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(358, 1, 'vi', 'core/acl/reminders', 'reset', 'Mật khẩu đã được thay đổi!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(359, 1, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Không thể xóa người dùng đang đăng nhập hệ thống!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(360, 1, 'vi', 'core/acl/users', 'no_select', 'Hãy chọn ít nhất một trường để thực hiện hành động này!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(361, 1, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Không thể khóa người dùng đang đăng nhập hệ thống!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(362, 1, 'vi', 'core/acl/users', 'update_success', 'Cập nhật trạng thái thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(363, 1, 'vi', 'core/acl/users', 'save_setting_failed', 'Có lỗi xảy ra trong quá trình lưu cài đặt của người dùng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(364, 1, 'vi', 'core/acl/users', 'not_found', 'Không tìm thấy người dùng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(365, 1, 'vi', 'core/acl/users', 'email_exist', 'Email này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(366, 1, 'vi', 'core/acl/users', 'username_exist', 'Tên đăng nhập này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(367, 1, 'vi', 'core/acl/users', 'update_profile_success', 'Thông tin tài khoản của bạn đã được cập nhật thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(368, 1, 'vi', 'core/acl/users', 'password_update_success', 'Cập nhật mật khẩu thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(369, 1, 'vi', 'core/acl/users', 'current_password_not_valid', 'Mật khẩu hiện tại không chính xác', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(370, 1, 'vi', 'core/acl/users', 'user_exist_in', 'Người dùng đã là thành viên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(371, 1, 'vi', 'core/acl/users', 'email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(372, 1, 'vi', 'core/acl/users', 'username', 'Tên đăng nhập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(373, 1, 'vi', 'core/acl/users', 'role', 'Phân quyền', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(374, 1, 'vi', 'core/acl/users', 'first_name', 'Họ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(375, 1, 'vi', 'core/acl/users', 'last_name', 'Tên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(376, 1, 'vi', 'core/acl/users', 'message', 'Thông điệp', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(377, 1, 'vi', 'core/acl/users', 'cancel_btn', 'Hủy bỏ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(378, 1, 'vi', 'core/acl/users', 'password', 'Mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(379, 1, 'vi', 'core/acl/users', 'new_password', 'Mật khẩu mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(380, 1, 'vi', 'core/acl/users', 'save', 'Lưu', '2021-03-14 19:40:41', '2021-03-14 19:40:41');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(381, 1, 'vi', 'core/acl/users', 'confirm_new_password', 'Xác nhận mật khẩu mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(382, 1, 'vi', 'core/acl/users', 'deleted', 'Xóa thành viên thành công', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(383, 1, 'vi', 'core/acl/users', 'cannot_delete', 'Không thể xóa thành viên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(384, 1, 'vi', 'core/acl/users', 'last_login', 'Lần cuối đăng nhập', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(385, 1, 'vi', 'core/acl/users', 'error_update_profile_image', 'Có lỗi trong quá trình đổi ảnh đại diện', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(386, 1, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin chào :name</h3><p>Hệ thống vừa nhận được yêu cầu khôi phục mật khẩu cho tài khoản của bạn, để hoàn tất tác vụ này vui lòng click vào đường link bên dưới.</p><p><a href=\":link\">Khôi phục mật khẩu</a></p><p>Nếu không phải bạn yêu cầu khôi phục mật khẩu, vui lòng bỏ qua email này.</p><p>Email này có giá trị trong vòng 60 phút kể từ lúc nhận được email.</p>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(387, 1, 'vi', 'core/acl/users', 'change_profile_image', 'Thay đổi ảnh đại diện', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(388, 1, 'vi', 'core/acl/users', 'new_image', 'Ảnh mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(389, 1, 'vi', 'core/acl/users', 'loading', 'Đang tải', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(390, 1, 'vi', 'core/acl/users', 'close', 'Đóng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(391, 1, 'vi', 'core/acl/users', 'update', 'Cập nhật', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(392, 1, 'vi', 'core/acl/users', 'read_image_failed', 'Không đọc được nội dung của hình ảnh', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(393, 1, 'vi', 'core/acl/users', 'update_avatar_success', 'Cập nhật ảnh đại diện thành công!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(394, 1, 'vi', 'core/acl/users', 'users', 'Quản trị viên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(395, 1, 'vi', 'core/acl/users', 'info.title', 'Thông tin người dùng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(396, 1, 'vi', 'core/acl/users', 'info.first_name', 'Họ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(397, 1, 'vi', 'core/acl/users', 'info.last_name', 'Tên', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(398, 1, 'vi', 'core/acl/users', 'info.email', 'Email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(399, 1, 'vi', 'core/acl/users', 'info.second_email', 'Email dự phòng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(400, 1, 'vi', 'core/acl/users', 'info.address', 'Địa chỉ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(401, 1, 'vi', 'core/acl/users', 'info.second_address', 'Địa chỉ dự phòng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(402, 1, 'vi', 'core/acl/users', 'info.birth_day', 'Ngày sinh', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(403, 1, 'vi', 'core/acl/users', 'info.job', 'Nghề nghiệp', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(404, 1, 'vi', 'core/acl/users', 'info.mobile_number', 'Số điện thoại di động', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(405, 1, 'vi', 'core/acl/users', 'info.second_mobile_number', 'Số điện thoại dự phòng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(406, 1, 'vi', 'core/acl/users', 'info.interes', 'Sở thích', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(407, 1, 'vi', 'core/acl/users', 'info.about', 'Giới thiệu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(408, 1, 'vi', 'core/acl/users', 'gender.title', 'Giới tính', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(409, 1, 'vi', 'core/acl/users', 'gender.male', 'nam', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(410, 1, 'vi', 'core/acl/users', 'gender.female', 'nữ', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(411, 1, 'vi', 'core/acl/users', 'statuses.activated', 'Đang hoạt động', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(412, 1, 'vi', 'core/acl/users', 'statuses.deactivated', 'Đã khoá', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(413, 1, 'vi', 'core/acl/users', 'change_password', 'Thay đổi mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(414, 1, 'vi', 'core/acl/users', 'current_password', 'Mật khẩu hiện tại', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(415, 1, 'vi', 'core/acl/users', 'make_super', 'Thiết lập quyền cao nhất', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(416, 1, 'vi', 'core/acl/users', 'remove_super', 'Loại bỏ quyền cao nhất', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(417, 1, 'vi', 'core/acl/users', 'is_super', 'Quyền cao nhất?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(418, 1, 'vi', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(419, 1, 'vi', 'core/acl/users', 'password_confirmation', 'Nhập lại mật khẩu', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(420, 1, 'vi', 'core/acl/users', 'select_role', 'Chọn nhóm', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(421, 1, 'vi', 'core/acl/users', 'create_new_user', 'Tạo tài khoản quản trị viên mới', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(422, 1, 'vi', 'core/acl/users', 'cannot_delete_super_user', 'Vượt quyền hạn, không thể xoá quản trị viên cấp cao nhất!', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(423, 1, 'vi', 'core/acl/users', 'assigned_role', 'Cấp quyền', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(424, 1, 'vi', 'core/acl/users', 'total_users', 'Tổng số người dùng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(425, 1, 'vi', 'core/acl/users', 'view_user_profile', 'Xem thông tin người dùng', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(426, 1, 'vi', 'core/acl/users', 'no_role_assigned', 'Chưa có quyền nào', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(427, 1, 'en', 'core/base/base', 'yes', 'Yes', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(428, 1, 'en', 'core/base/base', 'no', 'No', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(429, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(430, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(431, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(432, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(433, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(434, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(435, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(436, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(437, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(438, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(439, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(440, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(441, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(442, 1, 'en', 'core/base/base', 'image', 'Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(443, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(444, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(445, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(446, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(447, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(448, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(449, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(450, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(451, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(452, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(453, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(454, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(455, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(456, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(457, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(458, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(459, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(460, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(461, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(462, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(463, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(464, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(465, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(466, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(467, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(468, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(469, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(470, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(471, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(472, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(473, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(474, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://stories.local/admin\">clicking here</a>.', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(475, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(476, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(477, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(478, 1, 'en', 'core/base/forms', 'save', 'Save', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(479, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(480, 1, 'en', 'core/base/forms', 'image', 'Image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(481, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(482, 1, 'en', 'core/base/forms', 'create', 'Create', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(483, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(484, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(485, 1, 'en', 'core/base/forms', 'ok', 'OK', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(486, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(487, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(488, 1, 'en', 'core/base/forms', 'template', 'Template', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(489, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(490, 1, 'en', 'core/base/forms', 'file', 'File', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(491, 1, 'en', 'core/base/forms', 'content', 'Content', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(492, 1, 'en', 'core/base/forms', 'description', 'Description', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(493, 1, 'en', 'core/base/forms', 'name', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(494, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(495, 1, 'en', 'core/base/forms', 'title', 'Title', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(496, 1, 'en', 'core/base/forms', 'value', 'Value', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(497, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(498, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(499, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(500, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(501, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(502, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(503, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(504, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(505, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(506, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(507, 1, 'en', 'core/base/forms', 'update', 'Update', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(508, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(509, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2021-03-14 19:40:41', '2021-03-14 19:40:41'),
(510, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(511, 1, 'en', 'core/base/forms', 'order', 'Order', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(512, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(513, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(514, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(515, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(516, 1, 'en', 'core/base/forms', 'add', 'Add', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(517, 1, 'en', 'core/base/forms', 'link', 'Link', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(518, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(519, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(520, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(521, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(522, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(523, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(524, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(525, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(526, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(527, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(528, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(529, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(530, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(531, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(532, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(533, 1, 'en', 'core/base/layouts', 'home', 'Home', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(534, 1, 'en', 'core/base/layouts', 'search', 'Search', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(535, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(536, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(537, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(538, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(539, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(540, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(541, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(542, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(543, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(544, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(545, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(546, 1, 'en', 'core/base/notices', 'error', 'Error!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(547, 1, 'en', 'core/base/notices', 'success', 'Success!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(548, 1, 'en', 'core/base/notices', 'info', 'Info!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(549, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(550, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(551, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(552, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(553, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(554, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(555, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(556, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(557, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(558, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(559, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(560, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(561, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(562, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(563, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(564, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(565, 1, 'en', 'core/base/system', 'user.email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(566, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(567, 1, 'en', 'core/base/system', 'user.username', 'Username', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(568, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(569, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(570, 1, 'en', 'core/base/system', 'user.create', 'Create', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(571, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(572, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(573, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(574, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(575, 1, 'en', 'core/base/system', 'options.info', 'System information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(576, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(577, 1, 'en', 'core/base/system', 'info.title', 'System information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(578, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(579, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(580, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(581, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(582, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(583, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(584, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(585, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(586, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(587, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(588, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(589, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(590, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(591, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(592, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(593, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(594, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(595, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(596, 1, 'en', 'core/base/system', 'database', 'Database', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(597, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(598, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(599, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(600, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(601, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(602, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(603, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(604, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(605, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(606, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(607, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(608, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(609, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(610, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(611, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(612, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(613, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(614, 1, 'en', 'core/base/system', 'version', 'Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(615, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(616, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(617, 1, 'en', 'core/base/tables', 'id', 'ID', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(618, 1, 'en', 'core/base/tables', 'name', 'Name', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(619, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(620, 1, 'en', 'core/base/tables', 'title', 'Title', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(621, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(622, 1, 'en', 'core/base/tables', 'order', 'Order', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(623, 1, 'en', 'core/base/tables', 'status', 'Status', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(624, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(625, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(626, 1, 'en', 'core/base/tables', 'description', 'Description', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(627, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(628, 1, 'en', 'core/base/tables', 'url', 'URL', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(629, 1, 'en', 'core/base/tables', 'author', 'Author', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(630, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(631, 1, 'en', 'core/base/tables', 'column', 'Column', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(632, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(633, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(634, 1, 'en', 'core/base/tables', 'views', 'Views', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(635, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(636, 1, 'en', 'core/base/tables', 'session', 'Session', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(637, 1, 'en', 'core/base/tables', 'activated', 'activated', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(638, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(639, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(640, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(641, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(642, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(643, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(644, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(645, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(646, 1, 'en', 'core/base/tables', 'export', 'Export', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(647, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(648, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(649, 1, 'en', 'core/base/tables', 'print', 'Print', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(650, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(651, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(652, 1, 'en', 'core/base/tables', 'display', 'Display', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(653, 1, 'en', 'core/base/tables', 'all', 'All', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(654, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(655, 1, 'en', 'core/base/tables', 'action', 'Actions', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(656, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(657, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(658, 1, 'en', 'core/base/tables', 'save', 'Save', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(659, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(660, 1, 'en', 'core/base/tables', 'to', 'to', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(661, 1, 'en', 'core/base/tables', 'in', 'in', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(662, 1, 'en', 'core/base/tables', 'records', 'records', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(663, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(664, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(665, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(666, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(667, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(668, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(669, 1, 'en', 'core/base/tables', 'template', 'Template', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(670, 1, 'en', 'core/base/tables', 'email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(671, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(672, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(673, 1, 'en', 'core/base/tables', 'image', 'Image', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(674, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(675, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(676, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(677, 1, 'en', 'core/base/tabs', 'file', 'Files', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(678, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(679, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(680, 1, 'vi', 'core/base/base', 'yes', 'Có', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(681, 1, 'vi', 'core/base/base', 'no', 'Không', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(682, 1, 'vi', 'core/base/base', 'is_default', 'Mặc định?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(683, 1, 'vi', 'core/base/base', 'proc_close_disabled_error', 'Hàm proc_close() đã bị tắt. Vui lòng liên hệ nhà cung cấp hosting để mở hàm này. Hoặc có thể thêm vào .env: CAN_EXECUTE_COMMAND=false để tắt tính năng này.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(684, 1, 'vi', 'core/base/base', 'add_image', 'Thêm ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(685, 1, 'vi', 'core/base/base', 'change_image', 'Đổi ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(686, 1, 'vi', 'core/base/base', 'delete_image', 'Xóa ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(687, 1, 'vi', 'core/base/base', 'email_template.date_time', 'Ngày giờ hiện tại', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(688, 1, 'vi', 'core/base/base', 'email_template.date_year', 'Năm hiện tại', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(689, 1, 'vi', 'core/base/base', 'email_template.footer', 'Mẫu chân trang email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(690, 1, 'vi', 'core/base/base', 'email_template.header', 'Mẫu đầu trang email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(691, 1, 'vi', 'core/base/base', 'email_template.site_admin_email', 'Email quản trị viên', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(692, 1, 'vi', 'core/base/base', 'email_template.site_logo', 'Logo của trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(693, 1, 'vi', 'core/base/base', 'email_template.site_title', 'Tiêu đề trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(694, 1, 'vi', 'core/base/base', 'email_template.site_url', 'URL trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(695, 1, 'vi', 'core/base/base', 'image', 'Hình ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(696, 1, 'vi', 'core/base/base', 'preview_image', 'Ảnh xem trước', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(697, 1, 'vi', 'core/base/base', 'select_image', 'Chọn ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(698, 1, 'vi', 'core/base/base', 'to_add_more_image', 'để thêm hình ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(699, 1, 'vi', 'core/base/base', 'using_button', 'Sử dụng nút', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(700, 1, 'vi', 'core/base/cache', 'cache_management', 'Quản lý bộ nhớ đệm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(701, 1, 'vi', 'core/base/cache', 'cache_commands', 'Các lệnh xoá bộ nhớ đệm cơ bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(702, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'Xóa tất cả bộ đệm hiện có của ứng dụng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(703, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'Xóa các bộ nhớ đệm của ứng dụng: cơ sở dữ liệu, nội dung tĩnh... Chạy lệnh này khi bạn thử cập nhật dữ liệu nhưng giao diện không thay đổi', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(704, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Bộ đệm đã được xóa', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(705, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Làm mới bộ đệm giao diện', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(706, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Làm mới bộ đệm giao diện giúp phần giao diện luôn mới nhất', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(707, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Bộ đệm giao diện đã được làm mới', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(708, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'Xóa bộ nhớ đệm của phần cấu hình', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(709, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'Bạn cần làm mới bộ đệm cấu hình khi bạn tạo ra sự thay đổi nào đó ở môi trường thành phẩm.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(710, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Bộ đệm cấu hình đã được xóa', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(711, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xoá cache đường dẫn', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(712, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'Cần thực hiện thao tác này khi thấy không xuất hiện đường dẫn mới.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(713, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'Bộ đệm điều hướng đã bị xóa', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(714, 1, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xoá lịch sử lỗi', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(715, 1, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'Lịch sử lỗi đã được làm sạch', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(716, 1, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xoá lịch sử lỗi', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(717, 1, 'vi', 'core/base/enums', 'statuses.draft', 'Bản nháp', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(718, 1, 'vi', 'core/base/enums', 'statuses.pending', 'Đang chờ xử lý', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(719, 1, 'vi', 'core/base/enums', 'statuses.published', 'Đã xuất bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(720, 1, 'vi', 'core/base/errors', '401_title', 'Bạn không có quyền truy cập trang này', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(721, 1, 'vi', 'core/base/errors', '401_msg', '<li>Bạn không được cấp quyền truy cập bởi quản trị viên.</li>\n	                <li>Bạn sử dụng sai loại tài khoản.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(722, 1, 'vi', 'core/base/errors', '404_title', 'Không tìm thấy trang yêu cầu', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(723, 1, 'vi', 'core/base/errors', '404_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(724, 1, 'vi', 'core/base/errors', '500_title', 'Không thể tải trang', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(725, 1, 'vi', 'core/base/errors', '500_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(726, 1, 'vi', 'core/base/errors', 'reasons', 'Điều này có thể xảy ra vì nhiều lý do.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(727, 1, 'vi', 'core/base/errors', 'try_again', 'Vui lòng thử lại trong vài phút, hoặc quay trở lại trang chủ bằng cách <a href=\"http://cms.local/admin\"> nhấn vào đây </a>.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(728, 1, 'vi', 'core/base/errors', 'not_found', 'Không tìm thấy', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(729, 1, 'vi', 'core/base/forms', 'choose_image', 'Chọn ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(730, 1, 'vi', 'core/base/forms', 'actions', 'Tác vụ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(731, 1, 'vi', 'core/base/forms', 'save', 'Lưu', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(732, 1, 'vi', 'core/base/forms', 'save_and_continue', 'Lưu & chỉnh sửa', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(733, 1, 'vi', 'core/base/forms', 'image', 'Hình ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(734, 1, 'vi', 'core/base/forms', 'image_placeholder', 'Chèn đường dẫn hình ảnh hoặc nhấn nút để chọn hình', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(735, 1, 'vi', 'core/base/forms', 'create', 'Tạo mới', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(736, 1, 'vi', 'core/base/forms', 'edit', 'Sửa', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(737, 1, 'vi', 'core/base/forms', 'permalink', 'Đường dẫn', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(738, 1, 'vi', 'core/base/forms', 'ok', 'OK', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(739, 1, 'vi', 'core/base/forms', 'cancel', 'Hủy bỏ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(740, 1, 'vi', 'core/base/forms', 'character_remain', 'kí tự còn lại', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(741, 1, 'vi', 'core/base/forms', 'template', 'Template', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(742, 1, 'vi', 'core/base/forms', 'choose_file', 'Chọn tập tin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(743, 1, 'vi', 'core/base/forms', 'file', 'Tập tin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(744, 1, 'vi', 'core/base/forms', 'content', 'Nội dung', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(745, 1, 'vi', 'core/base/forms', 'description', 'Mô tả', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(746, 1, 'vi', 'core/base/forms', 'name', 'Tên', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(747, 1, 'vi', 'core/base/forms', 'name_placeholder', 'Nhập tên', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(748, 1, 'vi', 'core/base/forms', 'description_placeholder', 'Mô tả ngắn', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(749, 1, 'vi', 'core/base/forms', 'parent', 'Cha', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(750, 1, 'vi', 'core/base/forms', 'icon', 'Biểu tượng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(751, 1, 'vi', 'core/base/forms', 'order_by', 'Sắp xếp', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(752, 1, 'vi', 'core/base/forms', 'order_by_placeholder', 'Sắp xếp', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(753, 1, 'vi', 'core/base/forms', 'slug', 'Slug', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(754, 1, 'vi', 'core/base/forms', 'is_featured', 'Nổi bật?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(755, 1, 'vi', 'core/base/forms', 'is_default', 'Mặc định?', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(756, 1, 'vi', 'core/base/forms', 'icon_placeholder', 'Ví dụ: fa fa-home', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(757, 1, 'vi', 'core/base/forms', 'update', 'Cập nhật', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(758, 1, 'vi', 'core/base/forms', 'publish', 'Xuất bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(759, 1, 'vi', 'core/base/forms', 'remove_image', 'Xoá ảnh', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(760, 1, 'vi', 'core/base/forms', 'add', 'Thêm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(761, 1, 'vi', 'core/base/forms', 'add_short_code', 'Thêm shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(762, 1, 'vi', 'core/base/forms', 'alias', 'Mã thay thế', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(763, 1, 'vi', 'core/base/forms', 'alias_placeholder', 'Mã thay thế', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(764, 1, 'vi', 'core/base/forms', 'basic_information', 'Thông tin cơ bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(765, 1, 'vi', 'core/base/forms', 'link', 'Liên kết', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(766, 1, 'vi', 'core/base/forms', 'order', 'Thứ tự', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(767, 1, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(768, 1, 'vi', 'core/base/forms', 'title', 'Tiêu đề', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(769, 1, 'vi', 'core/base/forms', 'value', 'Giá trị', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(770, 1, 'vi', 'core/base/forms', 'show_hide_editor', 'Ẩn/Hiện trình soạn thảo', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(771, 1, 'vi', 'core/base/forms', 'basic_info_title', 'Thông tin cơ bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(772, 1, 'vi', 'core/base/forms', 'remove_file', 'Xóa tập tin', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(773, 1, 'vi', 'core/base/layouts', 'platform_admin', 'Quản trị hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(774, 1, 'vi', 'core/base/layouts', 'dashboard', 'Bảng điều khiển', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(775, 1, 'vi', 'core/base/layouts', 'widgets', 'Tiện ích', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(776, 1, 'vi', 'core/base/layouts', 'plugins', 'Tiện ích mở rộng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(777, 1, 'vi', 'core/base/layouts', 'settings', 'Cài đặt', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(778, 1, 'vi', 'core/base/layouts', 'setting_general', 'Cơ bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(779, 1, 'vi', 'core/base/layouts', 'system_information', 'Thông tin hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(780, 1, 'vi', 'core/base/layouts', 'theme', 'Giao diện', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(781, 1, 'vi', 'core/base/layouts', 'copyright', 'Bản quyền :year &copy; :company. Phiên bản: <span>:version</span>', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(782, 1, 'vi', 'core/base/layouts', 'profile', 'Thông tin cá nhân', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(783, 1, 'vi', 'core/base/layouts', 'logout', 'Đăng xuất', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(784, 1, 'vi', 'core/base/layouts', 'no_search_result', 'Không có kết quả tìm kiếm, hãy thử lại với từ khóa khác.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(785, 1, 'vi', 'core/base/layouts', 'home', 'Trang chủ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(786, 1, 'vi', 'core/base/layouts', 'search', 'Tìm kiếm', '2021-03-14 19:40:42', '2021-03-14 19:40:42');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(787, 1, 'vi', 'core/base/layouts', 'add_new', 'Thêm mới', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(788, 1, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(789, 1, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang tải xong trong', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(790, 1, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngoài', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(791, 1, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(792, 1, 'vi', 'core/base/notices', 'create_success_message', 'Tạo thành công', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(793, 1, 'vi', 'core/base/notices', 'update_success_message', 'Cập nhật thành công', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(794, 1, 'vi', 'core/base/notices', 'delete_success_message', 'Xóa thành công', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(795, 1, 'vi', 'core/base/notices', 'success_header', 'Thành công!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(796, 1, 'vi', 'core/base/notices', 'error_header', 'Lỗi!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(797, 1, 'vi', 'core/base/notices', 'no_select', 'Chọn ít nhất 1 trường để thực hiện hành động này!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(798, 1, 'vi', 'core/base/notices', 'processing_request', 'Hệ thống đang xử lý yêu cầu.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(799, 1, 'vi', 'core/base/notices', 'error', 'Lỗi!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(800, 1, 'vi', 'core/base/notices', 'success', 'Thành công!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(801, 1, 'vi', 'core/base/notices', 'info', 'Thông tin!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(802, 1, 'vi', 'core/base/notices', 'enum.validate_message', 'Giá trị của :attribute không hợp lệ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(803, 1, 'vi', 'core/base/system', 'no_select', 'Hãy chọn ít nhất 1 trường để thực hiện hành động này!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(804, 1, 'vi', 'core/base/system', 'cannot_find_user', 'Không thể tải được thông tin người dùng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(805, 1, 'vi', 'core/base/system', 'supper_revoked', 'Quyền quản trị viên cao nhất đã được gỡ bỏ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(806, 1, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Không thể gỡ bỏ quyền quản trị cấp cao của chính bạn!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(807, 1, 'vi', 'core/base/system', 'cant_remove_supper', 'Bạn không có quyền xóa quản trị viên cấp cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(808, 1, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Không thể tìm thấy người dùng với email này', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(809, 1, 'vi', 'core/base/system', 'supper_granted', 'Quyền quản trị cao nhất đã được gán', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(810, 1, 'vi', 'core/base/system', 'delete_log_success', 'Xóa tập tin log thành công!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(811, 1, 'vi', 'core/base/system', 'get_member_success', 'Hiển thị danh sách thành viên thành công', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(812, 1, 'vi', 'core/base/system', 'error_occur', 'Có lỗi dưới đây', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(813, 1, 'vi', 'core/base/system', 'role_and_permission', 'Phân quyền hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(814, 1, 'vi', 'core/base/system', 'role_and_permission_description', 'Quản lý những phân quyền trong hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(815, 1, 'vi', 'core/base/system', 'user.list_super', 'Danh sách quản trị viên cấp cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(816, 1, 'vi', 'core/base/system', 'user.username', 'Tên đăng nhập', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(817, 1, 'vi', 'core/base/system', 'user.email', 'Email', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(818, 1, 'vi', 'core/base/system', 'user.last_login', 'Đăng nhập lần cuối	', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(819, 1, 'vi', 'core/base/system', 'user.add_user', 'Thêm quản trị viên cấp cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(820, 1, 'vi', 'core/base/system', 'user.cancel', 'Hủy bỏ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(821, 1, 'vi', 'core/base/system', 'user.create', 'Thêm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(822, 1, 'vi', 'core/base/system', 'options.features', 'Kiểm soát truy cập các tính năng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(823, 1, 'vi', 'core/base/system', 'options.feature_description', 'Bật/tắt các tính năng.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(824, 1, 'vi', 'core/base/system', 'options.manage_super', 'Quản lý quản trị viên cấp cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(825, 1, 'vi', 'core/base/system', 'options.manage_super_description', 'Thêm/xóa quản trị viên cấp cao', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(826, 1, 'vi', 'core/base/system', 'options.info', 'Thông tin hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(827, 1, 'vi', 'core/base/system', 'options.info_description', 'Những thông tin về cấu hình hiện tại của hệ thống.', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(828, 1, 'vi', 'core/base/system', 'info.title', 'Thông tin hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(829, 1, 'vi', 'core/base/system', 'info.cache', 'Bộ nhớ đệm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(830, 1, 'vi', 'core/base/system', 'info.environment', 'Môi trường', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(831, 1, 'vi', 'core/base/system', 'info.locale', 'Ngôn ngữ hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(832, 1, 'vi', 'core/base/system', 'user_management', 'Quản lý thành viên', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(833, 1, 'vi', 'core/base/system', 'user_management_description', 'Quản lý người dùng trong hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(834, 1, 'vi', 'core/base/system', 'app_size', 'Kích thước ứng dụng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(835, 1, 'vi', 'core/base/system', 'cache_dir_writable', 'Có thể ghi bộ nhớ đệm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(836, 1, 'vi', 'core/base/system', 'cache_driver', 'Loại lưu trữ bộ nhớ đệm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(837, 1, 'vi', 'core/base/system', 'copy_report', 'Sao chép báo cáo', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(838, 1, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(839, 1, 'vi', 'core/base/system', 'database', 'Hệ thống dữ liệu', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(840, 1, 'vi', 'core/base/system', 'debug_mode', 'Chế độ sửa lỗi', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(841, 1, 'vi', 'core/base/system', 'dependency_name', 'Tên gói', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(842, 1, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(843, 1, 'vi', 'core/base/system', 'extra_information', 'Thông tin mở rộng', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(844, 1, 'vi', 'core/base/system', 'extra_stats', 'Thống kê thêm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(845, 1, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(846, 1, 'vi', 'core/base/system', 'framework_version', 'Phiên bản framework', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(847, 1, 'vi', 'core/base/system', 'get_system_report', 'Lấy thông tin hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(848, 1, 'vi', 'core/base/system', 'installed_packages', 'Các gói đã cài đặt và phiên bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(849, 1, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(850, 1, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(851, 1, 'vi', 'core/base/system', 'package_name', 'Tên gói', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(852, 1, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(853, 1, 'vi', 'core/base/system', 'php_version', 'Phiên bản PHP', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(854, 1, 'vi', 'core/base/system', 'report_description', 'Vui lòng chia sẻ thông tin này nhằm mục đích điều tra nguyên nhân gây lỗi', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(855, 1, 'vi', 'core/base/system', 'server_environment', 'Môi trường máy chủ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(856, 1, 'vi', 'core/base/system', 'server_os', 'Hệ điều hành của máy chủ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(857, 1, 'vi', 'core/base/system', 'server_software', 'Phần mềm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(858, 1, 'vi', 'core/base/system', 'session_driver', 'Loại lưu trữ phiên làm việc', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(859, 1, 'vi', 'core/base/system', 'ssl_installed', 'Đã cài đặt chứng chỉ SSL', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(860, 1, 'vi', 'core/base/system', 'storage_dir_writable', 'Có thể lưu trữ dữ liệu tạm', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(861, 1, 'vi', 'core/base/system', 'system_environment', 'Môi trường hệ thống', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(862, 1, 'vi', 'core/base/system', 'timezone', 'Múi giờ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(863, 1, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(864, 1, 'vi', 'core/base/system', 'version', 'Phiên bản', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(865, 1, 'vi', 'core/base/system', 'cms_version', 'Phiên bản CMS', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(866, 1, 'vi', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(867, 1, 'vi', 'core/base/system', 'disabled_in_demo_mode', 'Bạn không thể thực hiện hành động này ở chế độ demo!', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(868, 1, 'vi', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(869, 1, 'vi', 'core/base/system', 'php_version_error', 'Phiên bản PHP phải >= :version', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(870, 1, 'vi', 'core/base/tables', 'id', 'ID', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(871, 1, 'vi', 'core/base/tables', 'name', 'Tên', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(872, 1, 'vi', 'core/base/tables', 'order_by', 'Thứ tự', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(873, 1, 'vi', 'core/base/tables', 'status', 'Trạng thái', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(874, 1, 'vi', 'core/base/tables', 'created_at', 'Ngày tạo', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(875, 1, 'vi', 'core/base/tables', 'updated_at', 'Ngày cập nhật', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(876, 1, 'vi', 'core/base/tables', 'operations', 'Tác vụ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(877, 1, 'vi', 'core/base/tables', 'url', 'URL', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(878, 1, 'vi', 'core/base/tables', 'author', 'Người tạo', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(879, 1, 'vi', 'core/base/tables', 'column', 'Cột', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(880, 1, 'vi', 'core/base/tables', 'origin', 'Bản cũ', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(881, 1, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay đổi', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(882, 1, 'vi', 'core/base/tables', 'notes', 'Ghi chú', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(883, 1, 'vi', 'core/base/tables', 'activated', 'kích hoạt', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(884, 1, 'vi', 'core/base/tables', 'browser', 'Trình duyệt', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(885, 1, 'vi', 'core/base/tables', 'deactivated', 'hủy kích hoạt', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(886, 1, 'vi', 'core/base/tables', 'description', 'Mô tả', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(887, 1, 'vi', 'core/base/tables', 'session', 'Phiên', '2021-03-14 19:40:42', '2021-03-14 19:40:42'),
(888, 1, 'vi', 'core/base/tables', 'views', 'Lượt xem', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(889, 1, 'vi', 'core/base/tables', 'restore', 'Khôi phục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(890, 1, 'vi', 'core/base/tables', 'edit', 'Sửa', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(891, 1, 'vi', 'core/base/tables', 'delete', 'Xóa', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(892, 1, 'vi', 'core/base/tables', 'action', 'Hành động', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(893, 1, 'vi', 'core/base/tables', 'activate', 'Kích hoạt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(894, 1, 'vi', 'core/base/tables', 'add_new', 'Thêm mới', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(895, 1, 'vi', 'core/base/tables', 'all', 'Tất cả', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(896, 1, 'vi', 'core/base/tables', 'cancel', 'Hủy bỏ', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(897, 1, 'vi', 'core/base/tables', 'confirm_delete', 'Xác nhận xóa', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(898, 1, 'vi', 'core/base/tables', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xóa bản ghi này?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(899, 1, 'vi', 'core/base/tables', 'csv', 'CSV', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(900, 1, 'vi', 'core/base/tables', 'deactivate', 'Hủy kích hoạt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(901, 1, 'vi', 'core/base/tables', 'delete_entry', 'Xóa bản ghi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(902, 1, 'vi', 'core/base/tables', 'display', 'Hiển thị', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(903, 1, 'vi', 'core/base/tables', 'excel', 'Excel', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(904, 1, 'vi', 'core/base/tables', 'export', 'Xuất bản', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(905, 1, 'vi', 'core/base/tables', 'in', 'trong tổng số', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(906, 1, 'vi', 'core/base/tables', 'no_data', 'Không có dữ liệu để hiển thị', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(907, 1, 'vi', 'core/base/tables', 'no_record', 'Không có dữ liệu', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(908, 1, 'vi', 'core/base/tables', 'pdf', 'PDF', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(909, 1, 'vi', 'core/base/tables', 'print', 'In', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(910, 1, 'vi', 'core/base/tables', 'records', 'bản ghi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(911, 1, 'vi', 'core/base/tables', 'reload', 'Tải lại', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(912, 1, 'vi', 'core/base/tables', 'reset', 'Làm mới', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(913, 1, 'vi', 'core/base/tables', 'save', 'Lưu', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(914, 1, 'vi', 'core/base/tables', 'show_from', 'Hiển thị từ', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(915, 1, 'vi', 'core/base/tables', 'template', 'Giao diện', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(916, 1, 'vi', 'core/base/tables', 'to', 'đến', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(917, 1, 'vi', 'core/base/tables', 'view', 'Xem chi tiết', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(918, 1, 'vi', 'core/base/tables', 'email', 'Email', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(919, 1, 'vi', 'core/base/tables', 'image', 'Hình ảnh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(920, 1, 'vi', 'core/base/tables', 'is_featured', 'Nổi bật', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(921, 1, 'vi', 'core/base/tables', 'last_login', 'Lần cuối đăng nhập', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(922, 1, 'vi', 'core/base/tables', 'order', 'Thứ tự', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(923, 1, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(924, 1, 'vi', 'core/base/tables', 'slug', 'Slug', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(925, 1, 'vi', 'core/base/tables', 'title', 'Tiêu đề', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(926, 1, 'vi', 'core/base/tables', 'bulk_changes', 'Thay đổi hàng loạt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(927, 1, 'vi', 'core/base/tables', 'confirm_delete_many_msg', 'Bạn có chắc chắn muốn xóa những bản ghi này?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(928, 1, 'vi', 'core/base/tables', 'submit', 'Hoàn tất', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(929, 1, 'vi', 'core/base/tabs', 'detail', 'Chi tiết', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(930, 1, 'vi', 'core/base/tabs', 'file', 'Tập tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(931, 1, 'vi', 'core/base/tabs', 'record_note', 'Ghi chú', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(932, 1, 'vi', 'core/base/tabs', 'revision', 'Lịch sử thay đổi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(933, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(934, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(935, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(936, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(937, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(938, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(939, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(940, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(941, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(942, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(943, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(944, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(945, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(946, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(947, 1, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Hủy bỏ', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(948, 1, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'Mở rộng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(949, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'Bạn có chắc?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(950, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Vâng, ẩn tiện ích này', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(951, 1, 'vi', 'core/dashboard/dashboard', 'hide', 'Ẩn', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(952, 1, 'vi', 'core/dashboard/dashboard', 'hide_message', 'Bạn có chắc chắn muốn ẩn tiện ích này? Nó sẽ không được hiển thị trên trang chủ nữa!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(953, 1, 'vi', 'core/dashboard/dashboard', 'hide_success', 'Ẩn tiện ích thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(954, 1, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Quản lý tiện ích', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(955, 1, 'vi', 'core/dashboard/dashboard', 'reload', 'Làm mới', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(956, 1, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'Lưu tiện ích thành công', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(957, 1, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'Cập nhật vị trí tiện ích thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(958, 1, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Tiện ích này không tồn tại!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(959, 1, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'Toàn màn hình', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(960, 1, 'vi', 'core/dashboard/dashboard', 'title', 'Trang quản trị', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(961, 1, 'en', 'core/media/media', 'filter', 'Filter', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(962, 1, 'en', 'core/media/media', 'everything', 'Everything', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(963, 1, 'en', 'core/media/media', 'image', 'Image', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(964, 1, 'en', 'core/media/media', 'video', 'Video', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(965, 1, 'en', 'core/media/media', 'document', 'Document', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(966, 1, 'en', 'core/media/media', 'view_in', 'View in', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(967, 1, 'en', 'core/media/media', 'all_media', 'All media', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(968, 1, 'en', 'core/media/media', 'trash', 'Trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(969, 1, 'en', 'core/media/media', 'recent', 'Recent', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(970, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(971, 1, 'en', 'core/media/media', 'upload', 'Upload', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(972, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(973, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(974, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(975, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(976, 1, 'en', 'core/media/media', 'sort', 'Sort', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(977, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(978, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(979, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(980, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(981, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(982, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(983, 1, 'en', 'core/media/media', 'actions', 'Actions', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(984, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(985, 1, 'en', 'core/media/media', 'insert', 'Insert', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(986, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(987, 1, 'en', 'core/media/media', 'create', 'Create', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(988, 1, 'en', 'core/media/media', 'rename', 'Rename', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(989, 1, 'en', 'core/media/media', 'close', 'Close', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(990, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(991, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(992, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(993, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(994, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(995, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(996, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(997, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(998, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(999, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1000, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1001, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1002, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1003, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1004, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1005, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1006, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1007, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1008, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1009, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1010, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1011, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1012, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1013, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1014, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1015, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1016, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1017, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1018, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1019, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1020, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1021, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1022, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1023, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1024, 1, 'en', 'core/media/media', 'add', 'Add media', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1025, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1026, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1027, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1028, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1029, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1030, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1031, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1032, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1033, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1034, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1035, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1036, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1037, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1038, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1039, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1040, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1041, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1042, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1043, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1044, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1045, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1046, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1047, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1048, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1049, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1050, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1051, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1052, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1053, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1054, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1055, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1056, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1057, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1058, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1059, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1060, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1061, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1062, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1063, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1064, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1065, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1066, 1, 'vi', 'core/media/media', 'filter', 'Lọc', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1067, 1, 'vi', 'core/media/media', 'everything', 'Tất cả', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1068, 1, 'vi', 'core/media/media', 'image', 'Hình ảnh', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1069, 1, 'vi', 'core/media/media', 'video', 'Phim', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1070, 1, 'vi', 'core/media/media', 'document', 'Tài liệu', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1071, 1, 'vi', 'core/media/media', 'view_in', 'Chế độ xem', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1072, 1, 'vi', 'core/media/media', 'all_media', 'Tất cả tập tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1073, 1, 'vi', 'core/media/media', 'trash', 'Thùng rác', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1074, 1, 'vi', 'core/media/media', 'recent', 'Gần đây', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1075, 1, 'vi', 'core/media/media', 'favorites', 'Được gắn dấu sao', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1076, 1, 'vi', 'core/media/media', 'upload', 'Tải lên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1077, 1, 'vi', 'core/media/media', 'create_folder', 'Tạo thư mục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1078, 1, 'vi', 'core/media/media', 'refresh', 'Làm mới', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1079, 1, 'vi', 'core/media/media', 'empty_trash', 'Dọn thùng rác', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1080, 1, 'vi', 'core/media/media', 'search_file_and_folder', 'Tìm kiếm tập tin và thư mục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1081, 1, 'vi', 'core/media/media', 'sort', 'Sắp xếp', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1082, 1, 'vi', 'core/media/media', 'file_name_asc', 'Tên tập tin - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1083, 1, 'vi', 'core/media/media', 'file_name_desc', 'Tên tập tin - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1084, 1, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ngày tải lên - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1085, 1, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ngày tải lên - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1086, 1, 'vi', 'core/media/media', 'size_asc', 'Kích thước - ASC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1087, 1, 'vi', 'core/media/media', 'size_desc', 'Kích thước - DESC', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1088, 1, 'vi', 'core/media/media', 'actions', 'Hành động', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1089, 1, 'vi', 'core/media/media', 'nothing_is_selected', 'Không có tập tin nào được chọn', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1090, 1, 'vi', 'core/media/media', 'insert', 'Chèn', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1091, 1, 'vi', 'core/media/media', 'folder_name', 'Tên thư mục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1092, 1, 'vi', 'core/media/media', 'create', 'Tạo', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1093, 1, 'vi', 'core/media/media', 'rename', 'Đổi tên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1094, 1, 'vi', 'core/media/media', 'close', 'Đóng', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1095, 1, 'vi', 'core/media/media', 'save_changes', 'Lưu thay đổi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1096, 1, 'vi', 'core/media/media', 'move_to_trash', 'Đưa vào thùng rác', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1097, 1, 'vi', 'core/media/media', 'confirm_trash', 'Bạn có chắc chắn muốn bỏ những tập tin này vào thùng rác?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1098, 1, 'vi', 'core/media/media', 'confirm', 'Xác nhận', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1099, 1, 'vi', 'core/media/media', 'confirm_delete', 'Xóa tập tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1100, 1, 'vi', 'core/media/media', 'confirm_delete_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn xóa các tập tin này?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1101, 1, 'vi', 'core/media/media', 'empty_trash_title', 'Dọn sạch thùng rác', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1102, 1, 'vi', 'core/media/media', 'empty_trash_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn dọn sạch thùng rác?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1103, 1, 'vi', 'core/media/media', 'up_level', 'Quay lại một cấp', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1104, 1, 'vi', 'core/media/media', 'upload_progress', 'Tiến trình tải lên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1105, 1, 'vi', 'core/media/media', 'folder_created', 'Tạo thư mục thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1106, 1, 'vi', 'core/media/media', 'gallery', 'Thư viện tập tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1107, 1, 'vi', 'core/media/media', 'trash_error', 'Có lỗi khi xóa tập tin/thư mục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1108, 1, 'vi', 'core/media/media', 'trash_success', 'Xóa tập tin/thư mục thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1109, 1, 'vi', 'core/media/media', 'restore_error', 'Có lỗi trong quá trình khôi phục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1110, 1, 'vi', 'core/media/media', 'restore_success', 'Khôi phục thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1111, 1, 'vi', 'core/media/media', 'copy_success', 'Sao chép thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1112, 1, 'vi', 'core/media/media', 'delete_success', 'Xóa thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1113, 1, 'vi', 'core/media/media', 'favorite_success', 'Thêm dấu sao thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1114, 1, 'vi', 'core/media/media', 'remove_favorite_success', 'Bỏ dấu sao thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1115, 1, 'vi', 'core/media/media', 'rename_error', 'Có lỗi trong quá trình đổi tên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1116, 1, 'vi', 'core/media/media', 'rename_success', 'Đổi tên thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1117, 1, 'vi', 'core/media/media', 'invalid_action', 'Hành động không hợp lệ!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1118, 1, 'vi', 'core/media/media', 'file_not_exists', 'Tập tin không tồn tại!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1119, 1, 'vi', 'core/media/media', 'download_file_error', 'Có lỗi trong quá trình tải xuống tập tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1120, 1, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'Hãy bật ZipArchive extension để tải tập tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1121, 1, 'vi', 'core/media/media', 'can_not_download_file', 'Không thể tải tập tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1122, 1, 'vi', 'core/media/media', 'invalid_request', 'Yêu cầu không hợp lệ!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1123, 1, 'vi', 'core/media/media', 'add_success', 'Thêm thành công!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1124, 1, 'vi', 'core/media/media', 'file_too_big', 'Tập tin quá lớn. Giới hạn tải lên là :size bytes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1125, 1, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Loại tập tin không hợp lệ hoặc không thể xác định loại tập tin!', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1126, 1, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1127, 1, 'vi', 'core/media/media', 'menu_name', 'Quản lý tập tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1128, 1, 'vi', 'core/media/media', 'add', 'Thêm tập tin', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1129, 1, 'vi', 'core/media/media', 'javascript.name', 'Tên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1130, 1, 'vi', 'core/media/media', 'javascript.url', 'Đường dẫn', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1131, 1, 'vi', 'core/media/media', 'javascript.full_url', 'Đường dẫn tuyệt đối', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1132, 1, 'vi', 'core/media/media', 'javascript.size', 'Kích thước', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1133, 1, 'vi', 'core/media/media', 'javascript.mime_type', 'Loại', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1134, 1, 'vi', 'core/media/media', 'javascript.created_at', 'Được tải lên lúc', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1135, 1, 'vi', 'core/media/media', 'javascript.updated_at', 'Được chỉnh sửa lúc', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1136, 1, 'vi', 'core/media/media', 'javascript.nothing_selected', 'Bạn chưa chọn tập tin nào', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1137, 1, 'vi', 'core/media/media', 'javascript.visit_link', 'Mở liên kết', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1138, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1139, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'Bạn có thể kéo thả tập tin vào đây để tải lên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1140, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Hoặc có thể bấm nút Tải lên ở phía trên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1141, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1142, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hiện tại không có tập tin nào trong thùng rác', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1143, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'Xóa tập tin sẽ đem tập tin lưu vào thùng rác. Xóa tập tin trong thùng rác sẽ xóa vĩnh viễn.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1144, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1145, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'Bạn chưa đặt tập tin nào vào mục yêu thích', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1146, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Thêm tập tin vào mục yêu thích để tìm kiếm chúng dễ dàng sau này.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1147, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1148, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'Bạn chưa mở tập tin nào.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1149, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'Mục này hiển thị các tập tin bạn đã xem gần đây.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1150, 1, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1151, 1, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Thư mục trống', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1152, 1, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Thư mục này chưa có tập tin nào', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1153, 1, 'vi', 'core/media/media', 'javascript.clipboard.success', 'Đường dẫn của các tập tin đã được sao chép vào clipboard', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1154, 1, 'vi', 'core/media/media', 'javascript.message.error_header', 'Lỗi', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1155, 1, 'vi', 'core/media/media', 'javascript.message.success_header', 'Thành công', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1156, 1, 'vi', 'core/media/media', 'javascript.download.error', 'Bạn chưa chọn tập tin nào hoặc tập tin này không cho phép tải về', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1157, 1, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem trước', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1158, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao chép đường dẫn', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1159, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', 'Đổi tên', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1160, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nhân bản', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1161, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Yêu thích', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1162, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Xóa khỏi mục yêu thích', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1163, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'Tải xuống', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1164, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuyển vào thùng rác', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1165, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'Xóa hoàn toàn', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1166, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Khôi phục', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1167, 1, 'vi', 'core/media/media', 'empty_trash_success', 'Dọn sạch thùng rác thành công', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1168, 1, 'vi', 'core/media/media', 'name_invalid', 'Tên thư mục chứa ký tự không hợp lệ', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1169, 1, 'vi', 'core/media/media', 'path_invalid', 'Vui lòng cung cấp 1 đường dẫn hợp lệ', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1170, 1, 'vi', 'core/media/media', 'url_invalid', 'Vui lòng cung cấp 1 đường dẫn hợp lệ', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1171, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1172, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1173, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1174, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1175, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1176, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1177, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1178, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1179, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1180, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1181, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1182, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1183, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1184, 1, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-03-14 19:40:43', '2021-03-14 19:40:43');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1185, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1186, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1187, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1188, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1189, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1190, 1, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1191, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1192, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1193, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1194, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1195, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1196, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1197, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1198, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1199, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1200, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1201, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1202, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1203, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1204, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1205, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1206, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1207, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1208, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1209, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1210, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1211, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1212, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1213, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1214, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1215, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1216, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1217, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Language direction', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1218, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1219, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1220, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1221, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1222, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1223, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1224, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1225, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1226, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2021-03-14 19:40:43', '2021-03-14 19:40:43'),
(1227, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1228, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1229, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1230, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1231, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1232, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1233, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1234, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1235, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1236, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1237, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1238, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1239, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1240, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1241, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1242, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1243, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1244, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1245, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1246, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1247, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1248, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1249, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1250, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1251, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1252, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1253, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1254, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1255, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1256, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1257, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1258, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1259, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1260, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1261, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1262, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1263, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1264, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1265, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1266, 1, 'en', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1267, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1268, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1269, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1270, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1271, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1272, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1273, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1274, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1275, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1276, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1277, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1278, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1279, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1280, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1281, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1282, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1283, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1284, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1285, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1286, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1287, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1288, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1289, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1290, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1291, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1292, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1293, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1294, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1295, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1296, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1297, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1298, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1299, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1300, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1301, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1302, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1303, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1304, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1305, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1306, 1, 'en', 'core/setting/setting', 'template', 'Template', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1307, 1, 'en', 'core/setting/setting', 'description', 'Description', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1308, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1309, 1, 'en', 'core/setting/setting', 'send', 'Send', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1310, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1311, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1312, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1313, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1314, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1315, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1316, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1317, 1, 'vi', 'core/setting/setting', 'title', 'Cài đặt', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1318, 1, 'vi', 'core/setting/setting', 'general.theme', 'Giao diện', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1319, 1, 'vi', 'core/setting/setting', 'general.description', 'Cấu hình những thông tin cài đặt website.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1320, 1, 'vi', 'core/setting/setting', 'general.title', 'Thông tin chung', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1321, 1, 'vi', 'core/setting/setting', 'general.general_block', 'Thông tin chung', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1322, 1, 'vi', 'core/setting/setting', 'general.site_title', 'Tên trang', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1323, 1, 'vi', 'core/setting/setting', 'general.admin_email', 'Email quản trị viên', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1324, 1, 'vi', 'core/setting/setting', 'general.seo_block', 'Cấu hình SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1325, 1, 'vi', 'core/setting/setting', 'general.seo_title', 'Tiêu đề SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1326, 1, 'vi', 'core/setting/setting', 'general.seo_description', 'Mô tả SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1327, 1, 'vi', 'core/setting/setting', 'general.seo_keywords', 'Từ khoá SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1328, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1329, 1, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1330, 1, 'vi', 'core/setting/setting', 'general.enable_captcha', 'Sử dụng Captcha?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1331, 1, 'vi', 'core/setting/setting', 'general.contact_block', 'Thông tin liên hệ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1332, 1, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'Tên trang (tối đa 120 kí tự)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1333, 1, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1334, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'Ví dụ: UA-42767940-2', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1335, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Mã xác nhận trang web dùng cho Google Webmaster Tool', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1336, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Tiêu đề SEO (tối đa 120 kí tự)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1337, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'Mô tả SEO (tối đa 120 kí tự)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1338, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_keywords', 'Từ khoá SEO (tối đa 60 kí tự, phân cách từ khóa bằng dấu phẩy)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1339, 1, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho phép thay đổi giao diện quản trị?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1340, 1, 'vi', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Cho phép thay đổi ngôn ngữ trang quản trị?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1341, 1, 'vi', 'core/setting/setting', 'general.enable', 'Bật', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1342, 1, 'vi', 'core/setting/setting', 'general.disable', 'Tắt', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1343, 1, 'vi', 'core/setting/setting', 'general.enable_cache', 'Bật bộ nhớ đệm?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1344, 1, 'vi', 'core/setting/setting', 'general.cache_time', 'Thời gian lưu bộ nhớ đệm (phút)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1345, 1, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Thời gian lưu sơ đồ trang trong bộ nhớ đệm', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1346, 1, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang quản trị', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1347, 1, 'vi', 'core/setting/setting', 'general.admin_title', 'Tiêu đề trang quản trị', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1348, 1, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Tiêu đề hiển thị trên thẻ trình duyệt', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1349, 1, 'vi', 'core/setting/setting', 'general.rich_editor', 'Bộ soạn thảo văn bản', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1350, 1, 'vi', 'core/setting/setting', 'general.cache_block', 'Bộ nhớ đệm', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1351, 1, 'vi', 'core/setting/setting', 'general.yes', 'Bật', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1352, 1, 'vi', 'core/setting/setting', 'general.no', 'Tắt', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1353, 1, 'vi', 'core/setting/setting', 'general.locale', 'Ngôn ngữ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1354, 1, 'vi', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1355, 1, 'vi', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1356, 1, 'vi', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1357, 1, 'vi', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1358, 1, 'vi', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1359, 1, 'vi', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1360, 1, 'vi', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1361, 1, 'vi', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1362, 1, 'vi', 'core/setting/setting', 'general.locale_direction', 'Hướng chữ viết', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1363, 1, 'vi', 'core/setting/setting', 'general.select', '-- Lựa chọn --', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1364, 1, 'vi', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1365, 1, 'vi', 'core/setting/setting', 'general.show_on_front', 'Thiết lập trang chủ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1366, 1, 'vi', 'core/setting/setting', 'general.show_site_name', 'Hiển thị tên trang web sau tiêu đề trang, tách biệt bằng \"-\"?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1367, 1, 'vi', 'core/setting/setting', 'general.time_zone', 'Múi giờ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1368, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_description', 'Công cụ quản trị trang web của Google (GWT) là phần mềm miễn phí giúp bạn quản lý khía cạnh kỹ thuật của trang web của mình', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1369, 1, 'vi', 'core/setting/setting', 'email.subject', 'Tiêu đề', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1370, 1, 'vi', 'core/setting/setting', 'email.content', 'Nội dung', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1371, 1, 'vi', 'core/setting/setting', 'email.title', 'Cấu hình email template', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1372, 1, 'vi', 'core/setting/setting', 'email.description', 'Cấu trúc file template sử dụng HTML và các biến trong hệ thống.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1373, 1, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Khôi phục về mặc định', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1374, 1, 'vi', 'core/setting/setting', 'email.back', 'Trở lại trang cài đặt', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1375, 1, 'vi', 'core/setting/setting', 'email.reset_success', 'Khôi phục mặc định thành công', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1376, 1, 'vi', 'core/setting/setting', 'email.confirm_reset', 'Xác nhận khôi phục mặc định?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1377, 1, 'vi', 'core/setting/setting', 'email.confirm_message', 'Bạn có chắc chắn muốn khôi phục về bản mặc định?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1378, 1, 'vi', 'core/setting/setting', 'email.continue', 'Tiếp tục', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1379, 1, 'vi', 'core/setting/setting', 'email.sender_name', 'Tên người gửi', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1380, 1, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'Tên', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1381, 1, 'vi', 'core/setting/setting', 'email.sender_email', 'Email của người gửi', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1382, 1, 'vi', 'core/setting/setting', 'email.mailer', 'Loại', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1383, 1, 'vi', 'core/setting/setting', 'email.port', 'Cổng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1384, 1, 'vi', 'core/setting/setting', 'email.port_placeholder', 'Ví dụ: 587', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1385, 1, 'vi', 'core/setting/setting', 'email.host', 'Máy chủ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1386, 1, 'vi', 'core/setting/setting', 'email.host_placeholder', 'Ví dụ: smtp.gmail.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1387, 1, 'vi', 'core/setting/setting', 'email.username', 'Tên đăng nhập', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1388, 1, 'vi', 'core/setting/setting', 'email.username_placeholder', 'Tên đăng nhập vào máy chủ mail', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1389, 1, 'vi', 'core/setting/setting', 'email.password', 'Mật khẩu', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1390, 1, 'vi', 'core/setting/setting', 'email.password_placeholder', 'Mật khẩu đăng nhập vào máy chủ mail', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1391, 1, 'vi', 'core/setting/setting', 'email.encryption', 'Mã hoá', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1392, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'Tên miền', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1393, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Tên miền', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1394, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chuỗi bí mật', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1395, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chuỗi bí mật', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1396, 1, 'vi', 'core/setting/setting', 'email.template_title', 'Mẫu giao diện email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1397, 1, 'vi', 'core/setting/setting', 'email.template_description', 'Giao diện mặc định cho tất cả email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1398, 1, 'vi', 'core/setting/setting', 'email.template_header', 'Mẫu cho phần trên của email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1399, 1, 'vi', 'core/setting/setting', 'email.template_header_description', 'Phần trên của tất cả email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1400, 1, 'vi', 'core/setting/setting', 'email.template_footer', 'Mẫu cho phần dưới của email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1401, 1, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Phần dưới của tất cả email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1402, 1, 'vi', 'core/setting/setting', 'email.default', 'Mặc định', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1403, 1, 'vi', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1404, 1, 'vi', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1405, 1, 'vi', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1406, 1, 'vi', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1407, 1, 'vi', 'core/setting/setting', 'email.encryption_placeholder', 'Kiểu mã hóa: ssl hoặc tls', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1408, 1, 'vi', 'core/setting/setting', 'email.log_channel', 'Phương thức log', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1409, 1, 'vi', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1410, 1, 'vi', 'core/setting/setting', 'email.ses_key', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1411, 1, 'vi', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1412, 1, 'vi', 'core/setting/setting', 'email.ses_region', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1413, 1, 'vi', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1414, 1, 'vi', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1415, 1, 'vi', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1416, 1, 'vi', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Sử dụng job queue để gửi email (Trước tiên phải thiết lập Queue https://laravel.com/docs/queues#supervisor-configuration)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1417, 1, 'vi', 'core/setting/setting', 'save_settings', 'Lưu cài đặt', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1418, 1, 'vi', 'core/setting/setting', 'template', 'Mẫu', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1419, 1, 'vi', 'core/setting/setting', 'description', 'Mô tả', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1420, 1, 'vi', 'core/setting/setting', 'enable', 'Bật', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1421, 1, 'vi', 'core/setting/setting', 'test_send_mail', 'Gửi thử nghiệm', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1422, 1, 'vi', 'core/setting/setting', 'email_setting_title', 'Cấu hình email', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1423, 1, 'vi', 'core/setting/setting', 'field_type_not_exists', 'Loại field này không được hỗ trợ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1424, 1, 'vi', 'core/setting/setting', 'test_email_description', 'Để gửi email thử nghiệm, hãy đảm bảo rằng bạn đã cập nhật cấu hình để gửi thư!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1425, 1, 'vi', 'core/setting/setting', 'test_email_input_placeholder', 'Nhập email mà bạn muốn gửi email thử nghiệm.', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1426, 1, 'vi', 'core/setting/setting', 'test_email_modal_title', 'Gửi một email thử nghiệm', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1427, 1, 'vi', 'core/setting/setting', 'test_email_send_success', 'Gửi email thành công!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1428, 1, 'vi', 'core/setting/setting', 'send', 'Gửi', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1429, 1, 'vi', 'core/setting/setting', 'license.buyer', 'Tên đăng nhập', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1430, 1, 'vi', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1431, 1, 'vi', 'core/setting/setting', 'locale_direction_ltr', 'Trái sang phải', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1432, 1, 'vi', 'core/setting/setting', 'locale_direction_rtl', 'Phải sang trái', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1433, 1, 'vi', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1434, 1, 'vi', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1435, 1, 'vi', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1436, 1, 'vi', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1437, 1, 'vi', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1438, 1, 'vi', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1439, 1, 'vi', 'core/setting/setting', 'media.chunk_size_placeholder', 'Mặc định: 1048576 ~ 1MB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1440, 1, 'vi', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1441, 1, 'vi', 'core/setting/setting', 'media.description', 'Cài đặt cho media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1442, 1, 'vi', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1443, 1, 'vi', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Bật DO Spaces CDN?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1444, 1, 'vi', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1445, 1, 'vi', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1446, 1, 'vi', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1447, 1, 'vi', 'core/setting/setting', 'media.driver', 'Driver', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1448, 1, 'vi', 'core/setting/setting', 'media.enable_chunk', 'Bật chunk size upload?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1449, 1, 'vi', 'core/setting/setting', 'media.enable_watermark', 'Bật watermark?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1450, 1, 'vi', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1451, 1, 'vi', 'core/setting/setting', 'media.max_file_size_placeholder', 'Mặc định: 1048576 ~ 1GB', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1452, 1, 'vi', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1453, 1, 'vi', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://ten-mien-cua-ban.com', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1454, 1, 'vi', 'core/setting/setting', 'media.title', 'Media', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1455, 1, 'vi', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1456, 1, 'vi', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Mặc định: 70 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1457, 1, 'vi', 'core/setting/setting', 'media.watermark_position', 'Vị trí watermark', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1458, 1, 'vi', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bên trái dưới cùng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1459, 1, 'vi', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bên phải dưới cùng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1460, 1, 'vi', 'core/setting/setting', 'media.watermark_position_center', 'Chính giữa', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1461, 1, 'vi', 'core/setting/setting', 'media.watermark_position_top_left', 'Bên trái trên cùng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1462, 1, 'vi', 'core/setting/setting', 'media.watermark_position_top_right', 'Bên phải trên cùng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1463, 1, 'vi', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1464, 1, 'vi', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1465, 1, 'vi', 'core/setting/setting', 'media.watermark_size', 'Kích thước của watermark (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1466, 1, 'vi', 'core/setting/setting', 'media.watermark_size_placeholder', 'Mặc định: 10 (%)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1467, 1, 'vi', 'core/setting/setting', 'media.watermark_source', 'Hình ảnh watermark', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1468, 1, 'en', 'core/table/table', 'operations', 'Operations', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1469, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1470, 1, 'en', 'core/table/table', 'display', 'Display', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1471, 1, 'en', 'core/table/table', 'all', 'All', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1472, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1473, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1474, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1475, 1, 'en', 'core/table/table', 'to', 'to', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1476, 1, 'en', 'core/table/table', 'in', 'in', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1477, 1, 'en', 'core/table/table', 'records', 'records', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1478, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1479, 1, 'en', 'core/table/table', 'no_record', 'No record', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1480, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1481, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1482, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1483, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1484, 1, 'en', 'core/table/table', 'delete', 'Delete', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1485, 1, 'en', 'core/table/table', 'close', 'Close', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1486, 1, 'en', 'core/table/table', 'contains', 'Contains', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1487, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1488, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1489, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1490, 1, 'en', 'core/table/table', 'value', 'Value', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1491, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1492, 1, 'en', 'core/table/table', 'reset', 'Reset', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1493, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1494, 1, 'en', 'core/table/table', 'apply', 'Apply', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1495, 1, 'en', 'core/table/table', 'filters', 'Filters', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1496, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1497, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1498, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1499, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1500, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1501, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1502, 1, 'en', 'core/table/table', 'search', 'Search...', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1503, 1, 'vi', 'core/table/table', 'operations', 'Hành động', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1504, 1, 'vi', 'core/table/table', 'loading_data', 'Đang tải dữ liệu từ hệ thống', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1505, 1, 'vi', 'core/table/table', 'display', 'Hiển thị', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1506, 1, 'vi', 'core/table/table', 'all', 'Tất cả', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1507, 1, 'vi', 'core/table/table', 'edit_entry', 'Sửa', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1508, 1, 'vi', 'core/table/table', 'delete_entry', 'Xoá', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1509, 1, 'vi', 'core/table/table', 'show_from', 'Hiển thị từ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1510, 1, 'vi', 'core/table/table', 'to', 'đến', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1511, 1, 'vi', 'core/table/table', 'in', 'trong tổng số', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1512, 1, 'vi', 'core/table/table', 'records', 'bản ghi', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1513, 1, 'vi', 'core/table/table', 'no_data', 'Không có dữ liệu để hiển thị', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1514, 1, 'vi', 'core/table/table', 'no_record', 'không có bản ghi nào', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1515, 1, 'vi', 'core/table/table', 'loading', 'Đang tải dữ liệu từ hệ thống', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1516, 1, 'vi', 'core/table/table', 'confirm_delete', 'Xác nhận xoá', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1517, 1, 'vi', 'core/table/table', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xoá bản ghi này?', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1518, 1, 'vi', 'core/table/table', 'cancel', 'Huỷ bỏ', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1519, 1, 'vi', 'core/table/table', 'delete', 'Xoá', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1520, 1, 'vi', 'core/table/table', 'close', 'Đóng', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1521, 1, 'vi', 'core/table/table', 'is_equal_to', 'Bằng với', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1522, 1, 'vi', 'core/table/table', 'greater_than', 'Lớn hơn', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1523, 1, 'vi', 'core/table/table', 'less_than', 'Nhỏ hơn', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1524, 1, 'vi', 'core/table/table', 'value', 'Giá trị', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1525, 1, 'vi', 'core/table/table', 'select_field', 'Chọn trường', '2021-03-14 19:40:44', '2021-03-14 19:40:44'),
(1526, 1, 'vi', 'core/table/table', 'reset', 'Làm mới', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1527, 1, 'vi', 'core/table/table', 'add_additional_filter', 'Thêm bộ lọc', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1528, 1, 'vi', 'core/table/table', 'apply', 'Áp dụng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1529, 1, 'vi', 'core/table/table', 'select_option', 'Lựa chọn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1530, 1, 'vi', 'core/table/table', 'filters', 'Lọc dữ liệu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1531, 1, 'vi', 'core/table/table', 'bulk_change', 'Thay đổi hàng loạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1532, 1, 'vi', 'core/table/table', 'bulk_actions', 'Hành động', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1533, 1, 'vi', 'core/table/table', 'contains', 'Bao gồm', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1534, 1, 'vi', 'core/table/table', 'filtered', '(đã được lọc từ _MAX_ bản ghi)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1535, 1, 'vi', 'core/table/table', 'please_select_record', 'Vui lòng chọn ít nhất 1 bản ghi để thực hiện hành động này!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1536, 1, 'vi', 'core/table/table', 'save_bulk_change_success', 'Cập nhật dữ liệu cho các bản ghi thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1537, 1, 'vi', 'core/table/table', 'search', 'Tìm kiếm...', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1538, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1539, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1540, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1541, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1542, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1543, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1544, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1545, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1546, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1547, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1548, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1549, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1550, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1551, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1552, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1553, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1554, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1555, 1, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1556, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1557, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1558, 1, 'vi', 'packages/menu/menu', 'name', 'Trình đơn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1559, 1, 'vi', 'packages/menu/menu', 'cancel', 'Hủy bỏ', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1560, 1, 'vi', 'packages/menu/menu', 'add_link', 'Thêm liên kết', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1561, 1, 'vi', 'packages/menu/menu', 'add_to_menu', 'Thêm vào trình đơn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1562, 1, 'vi', 'packages/menu/menu', 'basic_info', 'Thông tin cơ bản', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1563, 1, 'vi', 'packages/menu/menu', 'blank_open_link', 'Mở liên kết trong tab mới', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1564, 1, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1565, 1, 'vi', 'packages/menu/menu', 'custom_link', 'Liên kết tùy chọn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1566, 1, 'vi', 'packages/menu/menu', 'icon', 'Biểu tượng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1567, 1, 'vi', 'packages/menu/menu', 'key_name', 'Tên menu (key::key)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1568, 1, 'vi', 'packages/menu/menu', 'remove', 'Xóa', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1569, 1, 'vi', 'packages/menu/menu', 'self_open_link', 'Mở liên kết trong tab hiện tại', '2021-03-14 19:40:45', '2021-03-14 19:40:45');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1570, 1, 'vi', 'packages/menu/menu', 'structure', 'Cấu trúc trình đơn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1571, 1, 'vi', 'packages/menu/menu', 'target', 'Target', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1572, 1, 'vi', 'packages/menu/menu', 'title', 'Tiêu đề', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1573, 1, 'vi', 'packages/menu/menu', 'url', 'URL', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1574, 1, 'vi', 'packages/menu/menu', 'create', 'Tạo trình đơn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1575, 1, 'vi', 'packages/menu/menu', 'edit', 'Sửa trình đơn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1576, 1, 'vi', 'packages/menu/menu', 'display_location', 'Vị trí hiển thị', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1577, 1, 'vi', 'packages/menu/menu', 'menu_settings', 'Cấu hình menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1578, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1579, 1, 'en', 'packages/page/pages', 'edit', 'Edit page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1580, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1581, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1582, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1583, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1584, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1585, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1586, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1587, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1588, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1589, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1590, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1591, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1592, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1593, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1594, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1595, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1596, 1, 'vi', 'packages/page/pages', 'create', 'Thêm trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1597, 1, 'vi', 'packages/page/pages', 'edit', 'Sửa trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1598, 1, 'vi', 'packages/page/pages', 'form.name', 'Tiêu đề trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1599, 1, 'vi', 'packages/page/pages', 'form.note', 'Nội dung ghi chú', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1600, 1, 'vi', 'packages/page/pages', 'form.name_placeholder', 'Tên trang (tối đa 120 kí tự)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1601, 1, 'vi', 'packages/page/pages', 'form.content', 'Nội dung', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1602, 1, 'vi', 'packages/page/pages', 'notices.no_select', 'Chọn ít nhất 1 trang để thực hiện hành động này!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1603, 1, 'vi', 'packages/page/pages', 'notices.update_success_message', 'Cập nhật thành công', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1604, 1, 'vi', 'packages/page/pages', 'deleted', 'Xóa trang thành công', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1605, 1, 'vi', 'packages/page/pages', 'cannot_delete', 'Không thể xóa trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1606, 1, 'vi', 'packages/page/pages', 'menu', 'Trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1607, 1, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1608, 1, 'vi', 'packages/page/pages', 'edit_this_page', 'Sửa trang này', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1609, 1, 'vi', 'packages/page/pages', 'pages', 'Trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1610, 1, 'vi', 'packages/page/pages', 'front_page', 'Trang chủ', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1611, 1, 'vi', 'packages/page/pages', 'settings.select', '-- Lựa chọn --', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1612, 1, 'vi', 'packages/page/pages', 'settings.show_on_front', 'Lựa chọn trang chủ', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1613, 1, 'vi', 'packages/page/pages', 'total_pages', 'Tổng số trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1614, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1615, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1616, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1617, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1618, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1619, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1620, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1621, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1622, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1623, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1624, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1625, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1626, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1627, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1628, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1629, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1630, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1631, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1632, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1633, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1634, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1635, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1636, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1637, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1638, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin is removed!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1639, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1640, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1641, 1, 'vi', 'packages/plugin-management/plugin', 'activate', 'Kích hoạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1642, 1, 'vi', 'packages/plugin-management/plugin', 'author', 'Tác giả', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1643, 1, 'vi', 'packages/plugin-management/plugin', 'version', 'Phiên bản', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1644, 1, 'vi', 'packages/plugin-management/plugin', 'activated', 'Đã kích hoạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1645, 1, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'Hủy kích hoạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1646, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated', 'Đã vô hiệu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1647, 1, 'vi', 'packages/plugin-management/plugin', 'enabled', 'Kích hoạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1648, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'Gói mở rộng không hợp lệ', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1649, 1, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Cập nhật trạng thái gói mở rộng thành công', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1650, 1, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui lòng kích hoạt các gói mở rộng :plugins trước khi kích hoạt gói này', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1651, 1, 'vi', 'packages/plugin-management/plugin', 'plugins', 'Gói mở rộng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1652, 1, 'vi', 'packages/plugin-management/plugin', 'remove', 'Xoá', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1653, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Xoá thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1654, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin', 'Xoá gói mở rộng', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1655, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Bạn có chắc chắn muốn xoá plugin này?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1656, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Có, xoá!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1657, 1, 'vi', 'packages/plugin-management/plugin', 'total_plugins', 'Tất cả plugins', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1658, 1, 'vi', 'packages/plugin-management/plugin', 'activate_success', 'Kích hoạt thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1659, 1, 'vi', 'packages/plugin-management/plugin', 'activated_already', 'Gói mở rộng này đã được kích hoạt rồi!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1660, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated_already', 'Gói mở rộng này đã được hủy kích hoạt rồi!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1661, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated_success', 'Hủy kích hoạt thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1662, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_json', 'Sai cấu hình plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1663, 1, 'vi', 'packages/plugin-management/plugin', 'missing_json_file', 'Thiếu tập tin cấu hình plugin.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1664, 1, 'vi', 'packages/plugin-management/plugin', 'plugin_invalid', 'Gói mở rộng không hợp lệ!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1665, 1, 'vi', 'packages/plugin-management/plugin', 'plugin_not_exist', 'Gói mở rộng không tồn tại', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1666, 1, 'vi', 'packages/plugin-management/plugin', 'plugin_removed', 'Gói mở rộng đã bị xóa!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1667, 1, 'vi', 'packages/plugin-management/plugin', 'published_assets_success', 'Xuất bản assets cho gói mở rộng thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1668, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1669, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1670, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1671, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1672, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1673, 1, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Tối ưu hoá bộ máy tìm kiếm (SEO)', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1674, 1, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Chỉnh sửa SEO', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1675, 1, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thiết lập các thẻ mô tả giúp người dùng dễ dàng tìm thấy trên công cụ tìm kiếm như Google.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1676, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Tiêu đề trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1677, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'Mô tả trang', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1678, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1679, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1680, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1681, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1682, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1683, 1, 'vi', 'packages/slug/slug', 'permalink_settings', 'Liên kết cố định', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1684, 1, 'vi', 'packages/slug/slug', 'preview', 'Xem trước', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1685, 1, 'vi', 'packages/slug/slug', 'settings.description', 'Quản lý liên kết cố định cho các module.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1686, 1, 'vi', 'packages/slug/slug', 'settings.preview', 'Xem trước', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1687, 1, 'vi', 'packages/slug/slug', 'settings.title', 'Cài đặt liên kết cố định', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1688, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1689, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1690, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1691, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1692, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1693, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1694, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1695, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1696, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1697, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1698, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1699, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1700, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1701, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1702, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1703, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1704, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1705, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1706, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1707, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1708, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1709, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1710, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1711, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1712, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1713, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1714, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1715, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1716, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1717, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1718, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1719, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1720, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1721, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1722, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1723, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1724, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1725, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1726, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1727, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1728, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1729, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1730, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1731, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1732, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1733, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1734, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1735, 1, 'vi', 'packages/theme/theme', 'name', 'Giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1736, 1, 'vi', 'packages/theme/theme', 'activated', 'Đã kích hoạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1737, 1, 'vi', 'packages/theme/theme', 'active', 'Kích hoạt', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1738, 1, 'vi', 'packages/theme/theme', 'active_success', 'Kích hoạt giao diện thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1739, 1, 'vi', 'packages/theme/theme', 'author', 'Tác giả', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1740, 1, 'vi', 'packages/theme/theme', 'description', 'Mô tả', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1741, 1, 'vi', 'packages/theme/theme', 'appearance', 'Hiển thị', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1742, 1, 'vi', 'packages/theme/theme', 'theme', 'Giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1743, 1, 'vi', 'packages/theme/theme', 'theme_options', 'Tuỳ chọn giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1744, 1, 'vi', 'packages/theme/theme', 'version', 'Phiên bản', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1745, 1, 'vi', 'packages/theme/theme', 'save_changes', 'Lưu thay đổi', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1746, 1, 'vi', 'packages/theme/theme', 'developer_mode', 'Đang kích hoạt chế độ thử nghiệm', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1747, 1, 'vi', 'packages/theme/theme', 'custom_css', 'Tuỳ chỉnh CSS', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1748, 1, 'vi', 'packages/theme/theme', 'remove', 'Xóa', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1749, 1, 'vi', 'packages/theme/theme', 'remove_theme', 'Xóa giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1750, 1, 'vi', 'packages/theme/theme', 'remove_theme_confirm_message', 'Bạn có chắc chắn muốn xóa giao diện này?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1751, 1, 'vi', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Vâng, xác nhận xóa!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1752, 1, 'vi', 'packages/theme/theme', 'remove_theme_success', 'Xóa giao diện thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1753, 1, 'vi', 'packages/theme/theme', 'settings.description', 'Cài đặt giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1754, 1, 'vi', 'packages/theme/theme', 'settings.title', 'Giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1755, 1, 'vi', 'packages/theme/theme', 'show_admin_bar', 'Hiển thị admin bar (khi admin đã đăng nhập, vẫn hiển thị admin bar trên website)?', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1756, 1, 'vi', 'packages/theme/theme', 'total_themes', 'Tổng số giao diện', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1757, 1, 'vi', 'packages/theme/theme', 'add_new', 'Thêm mới', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1758, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1759, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1760, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1761, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1762, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1763, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1764, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1765, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1766, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1767, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1768, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1769, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1770, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1771, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1772, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1773, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1774, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1775, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1776, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1777, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1778, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1779, 1, 'vi', 'packages/widget/widget', 'name', 'Widgets', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1780, 1, 'vi', 'packages/widget/widget', 'create', 'New widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1781, 1, 'vi', 'packages/widget/widget', 'edit', 'Edit widget', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1782, 1, 'vi', 'packages/widget/widget', 'available', 'Tiện ích có sẵn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1783, 1, 'vi', 'packages/widget/widget', 'delete', 'Xóa', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1784, 1, 'vi', 'packages/widget/widget', 'instruction', 'Để kích hoạt tiện ích, hãy kéo nó vào sidebar hoặc nhấn vào nó. Để hủy kích hoạt tiện ích và xóa các thiết lập của tiện ích, kéo nó quay trở lại.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1785, 1, 'vi', 'packages/widget/widget', 'number_post_display', 'Số bài viết sẽ hiển thị', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1786, 1, 'vi', 'packages/widget/widget', 'number_tag_display', 'Số thẻ sẽ hiển thị', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1787, 1, 'vi', 'packages/widget/widget', 'select_menu', 'Lựa chọn trình đơn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1788, 1, 'vi', 'packages/widget/widget', 'widget_custom_menu', 'Menu tùy chỉnh', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1789, 1, 'vi', 'packages/widget/widget', 'widget_custom_menu_description', 'Thêm menu tùy chỉnh vào khu vực tiện ích của bạn', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1790, 1, 'vi', 'packages/widget/widget', 'widget_recent_post', 'Bài viết gần đây', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1791, 1, 'vi', 'packages/widget/widget', 'widget_recent_post_description', 'Tiện ích bài viết gần đây', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1792, 1, 'vi', 'packages/widget/widget', 'widget_tag', 'Thẻ', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1793, 1, 'vi', 'packages/widget/widget', 'widget_tag_description', 'Thẻ phổ biến, sử dụng nhiều', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1794, 1, 'vi', 'packages/widget/widget', 'widget_text', 'Văn bản', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1795, 1, 'vi', 'packages/widget/widget', 'widget_text_description', 'Văn bản tùy ý hoặc HTML.', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1796, 1, 'vi', 'packages/widget/widget', 'delete_success', 'Xoá tiện ích thành công', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1797, 1, 'vi', 'packages/widget/widget', 'save_success', 'Lưu tiện ích thành công!', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1798, 1, 'en', 'plugins/ads/ads', 'name', 'Ads', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1799, 1, 'en', 'plugins/ads/ads', 'create', 'New ads', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1800, 1, 'en', 'plugins/ads/ads', 'edit', 'Edit ads', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1801, 1, 'en', 'plugins/ads/ads', 'location', 'Location', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1802, 1, 'en', 'plugins/ads/ads', 'url', 'URL', '2021-03-14 19:40:45', '2021-03-14 19:40:45'),
(1803, 1, 'en', 'plugins/ads/ads', 'expired_at', 'Expired at', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1804, 1, 'en', 'plugins/ads/ads', 'key', 'Key', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1805, 1, 'en', 'plugins/ads/ads', 'shortcode', 'Shortcode', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1806, 1, 'en', 'plugins/ads/ads', 'clicked', 'Clicked', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1807, 1, 'en', 'plugins/ads/ads', 'not_set', 'Not set', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1808, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1809, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1810, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1811, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1812, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1813, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1814, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1815, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1816, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1817, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1818, 1, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1819, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1820, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1821, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1822, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1823, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1824, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1825, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1826, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1827, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1828, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1829, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1830, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1831, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1832, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1833, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1834, 1, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung bình', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1835, 1, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'Tỉ lệ thoát', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1836, 1, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phiên', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1837, 1, 'vi', 'plugins/analytics/analytics', 'pageviews', 'Lượt xem', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1838, 1, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phiên', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1839, 1, 'vi', 'plugins/analytics/analytics', 'views', 'lượt xem', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1840, 1, 'vi', 'plugins/analytics/analytics', 'visitors', 'Người truy cập', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1841, 1, 'vi', 'plugins/analytics/analytics', 'visits', 'lượt ghé thăm', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1842, 1, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Thông tin cài đặt không hợp lệ. Tài liệu hướng dẫn tại đây: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1843, 1, 'vi', 'plugins/analytics/analytics', 'new_users', 'Lượt khách mới', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1844, 1, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'Tỉ lệ khách mới', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1845, 1, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ngày bắt đầu :start_date không thể sau ngày kết thúc :end_date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1846, 1, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'Bạn phải cung cấp View ID hợp lê. Tài liệu hướng dẫn tại đây: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1847, 1, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', 'Để xem dữ liệu thống kê Google Analytics, bạn cần lấy thông tin Client ID và thêm nó vào trong phần cài đặt. Bạn cũng cần thông tin xác thực dạng JSON. Tài liệu hướng dẫn tại đây: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1848, 1, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1849, 1, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1850, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1851, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1852, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1853, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1854, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1855, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1856, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Trình duyệt truy cập nhiều', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1857, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Thống kê truy cập', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1858, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang được xem nhiều nhất', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1859, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang giới thiệu nhiều', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1860, 1, 'en', 'plugins/api/api', 'api_clients', 'API Clients', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1861, 1, 'en', 'plugins/api/api', 'create_new_client', 'Create new client', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1862, 1, 'en', 'plugins/api/api', 'create_new_client_success', 'Create new client successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1863, 1, 'en', 'plugins/api/api', 'edit_client', 'Edit client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1864, 1, 'en', 'plugins/api/api', 'edit_client_success', 'Updated client successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1865, 1, 'en', 'plugins/api/api', 'delete_success', 'Deleted client successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1866, 1, 'en', 'plugins/api/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1867, 1, 'en', 'plugins/api/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1868, 1, 'en', 'plugins/api/api', 'cancel_delete', 'No', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1869, 1, 'en', 'plugins/api/api', 'continue_delete', 'Yes, let\'s delete it!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1870, 1, 'en', 'plugins/api/api', 'name', 'Name', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1871, 1, 'en', 'plugins/api/api', 'cancel', 'Cancel', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1872, 1, 'en', 'plugins/api/api', 'save', 'Save', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1873, 1, 'en', 'plugins/api/api', 'edit', 'Edit', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1874, 1, 'en', 'plugins/api/api', 'delete', 'Delete', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1875, 1, 'en', 'plugins/api/api', 'client_id', 'Client ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1876, 1, 'en', 'plugins/api/api', 'secret', 'Secret', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1877, 1, 'vi', 'plugins/api/api', 'api_clients', 'API Clients', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1878, 1, 'vi', 'plugins/api/api', 'create_new_client', 'Tạo client mới', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1879, 1, 'vi', 'plugins/api/api', 'create_new_client_success', 'Tạo client mới thành công!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1880, 1, 'vi', 'plugins/api/api', 'edit_client', 'Sửa client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1881, 1, 'vi', 'plugins/api/api', 'edit_client_success', 'Cập nhật client thành công!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1882, 1, 'vi', 'plugins/api/api', 'delete_success', 'Xoá client thành công!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1883, 1, 'vi', 'plugins/api/api', 'confirm_delete_title', 'Xoá client \":name\"', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1884, 1, 'vi', 'plugins/api/api', 'confirm_delete_description', 'Bạn có chắc chắn muốn xoá client \":name\"?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1885, 1, 'vi', 'plugins/api/api', 'cancel_delete', 'Không', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1886, 1, 'vi', 'plugins/api/api', 'continue_delete', 'Có, tiếp tục xoá!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1887, 1, 'vi', 'plugins/api/api', 'name', 'Tên', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1888, 1, 'vi', 'plugins/api/api', 'cancel', 'Huỷ bỏ', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1889, 1, 'vi', 'plugins/api/api', 'save', 'Lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1890, 1, 'vi', 'plugins/api/api', 'edit', 'Sửa', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1891, 1, 'vi', 'plugins/api/api', 'delete', 'Xoá', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1892, 1, 'vi', 'plugins/api/api', 'client_id', 'Client ID', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1893, 1, 'vi', 'plugins/api/api', 'secret', 'Chuỗi bí mật', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1894, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1895, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1896, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1897, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1898, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1899, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1900, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1901, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1902, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1903, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1904, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1905, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1906, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1907, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1908, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1909, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1910, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1911, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1912, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1913, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1914, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1915, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1916, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1917, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1918, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1919, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1920, 1, 'vi', 'plugins/audit-log/history', 'name', 'Lịch sử hoạt động', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1921, 1, 'vi', 'plugins/audit-log/history', 'created', ' đã tạo', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1922, 1, 'vi', 'plugins/audit-log/history', 'updated', ' đã cập nhật', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1923, 1, 'vi', 'plugins/audit-log/history', 'deleted', ' đã xóa', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1924, 1, 'vi', 'plugins/audit-log/history', 'attached', 'đính kèm', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1925, 1, 'vi', 'plugins/audit-log/history', 'backup', 'sao lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1926, 1, 'vi', 'plugins/audit-log/history', 'category', 'danh mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1927, 1, 'vi', 'plugins/audit-log/history', 'changed password', 'thay đổi mật khẩu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1928, 1, 'vi', 'plugins/audit-log/history', 'contact', 'liên hệ', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1929, 1, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung mở rộng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1930, 1, 'vi', 'plugins/audit-log/history', 'logged in', 'đăng nhập', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1931, 1, 'vi', 'plugins/audit-log/history', 'logged out', 'đăng xuất', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1932, 1, 'vi', 'plugins/audit-log/history', 'menu', 'trình đơn', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1933, 1, 'vi', 'plugins/audit-log/history', 'of the system', 'khỏi hệ thống', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1934, 1, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1935, 1, 'vi', 'plugins/audit-log/history', 'post', 'bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1936, 1, 'vi', 'plugins/audit-log/history', 'shared', 'đã chia sẻ', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1937, 1, 'vi', 'plugins/audit-log/history', 'tag', 'thẻ', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1938, 1, 'vi', 'plugins/audit-log/history', 'to the system', 'vào hệ thống', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1939, 1, 'vi', 'plugins/audit-log/history', 'updated profile', 'cập nhật tài khoản', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1940, 1, 'vi', 'plugins/audit-log/history', 'user', 'thành viên', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1941, 1, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'Lịch sử hoạt động', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1942, 1, 'vi', 'plugins/audit-log/history', 'system', 'Hệ thống', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1943, 1, 'vi', 'plugins/audit-log/history', 'action', 'Hành động', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1944, 1, 'vi', 'plugins/audit-log/history', 'delete_all', 'Xóa tất cả bản ghi', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1945, 1, 'vi', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1946, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1947, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1948, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1949, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1950, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1951, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1952, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1953, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1954, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1955, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1956, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1957, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1958, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1959, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1960, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1961, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1962, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1963, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1964, 1, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao lưu cơ sở dữ liệu và thư mục /uploads', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1965, 1, 'vi', 'plugins/backup/backup', 'create', 'Tạo bản sao lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1966, 1, 'vi', 'plugins/backup/backup', 'create_backup_success', 'Tạo bản sao lưu thành công!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1967, 1, 'vi', 'plugins/backup/backup', 'create_btn', 'Tạo', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1968, 1, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'Xóa bản sao lưu thành công!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1969, 1, 'vi', 'plugins/backup/backup', 'generate_btn', 'Tạo sao lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1970, 1, 'vi', 'plugins/backup/backup', 'name', 'Sao lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1971, 1, 'vi', 'plugins/backup/backup', 'restore', 'Khôi phục bản sao lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1972, 1, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Khôi phục bản sao lưu thành công', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1973, 1, 'vi', 'plugins/backup/backup', 'restore_btn', 'Khôi phục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1974, 1, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'Bạn có chắc chắn muốn khôi phục hệ thống về thời điểm tạo bản sao lưu này?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1975, 1, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Khôi phục bản sao lưu này', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1976, 1, 'vi', 'plugins/backup/backup', 'download_database', 'Tải về bản sao lưu CSDL', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1977, 1, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'Tải về bản sao lưu thư mục uploads', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1978, 1, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao lưu', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1979, 1, 'vi', 'plugins/backup/backup', 'demo_alert', 'Chào khách, nếu bạn thấy trang demo bị phá hoại, hãy tới <a href=\":link\">trang sao lưu</a> và khôi phục bản sao lưu cuối cùng. Cảm ơn bạn nhiều!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1980, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1981, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1982, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1983, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1984, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1985, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1986, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1987, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1988, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1989, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1990, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1991, 1, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1992, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1993, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1994, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1995, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1996, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1997, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1998, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(1999, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2000, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2001, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2002, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2003, 1, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2004, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2005, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2006, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2007, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2008, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2009, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2010, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2011, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2012, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2013, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2014, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2015, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2016, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2017, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2018, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2019, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2020, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2021, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2022, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2023, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2024, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2025, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2026, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2027, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2028, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2029, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2030, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2031, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2032, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2033, 1, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2034, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2035, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2036, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2037, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2038, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2039, 1, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2040, 1, 'vi', 'plugins/blog/base', 'blog_page', 'Trang Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2041, 1, 'vi', 'plugins/blog/base', 'select', '-- Lựa chọn --', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2042, 1, 'vi', 'plugins/blog/base', 'blog_page_id', 'Trang Blog', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2043, 1, 'vi', 'plugins/blog/categories', 'create', 'Thêm danh mục mới', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2044, 1, 'vi', 'plugins/blog/categories', 'edit', 'Sửa danh mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2045, 1, 'vi', 'plugins/blog/categories', 'menu', 'Danh mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2046, 1, 'vi', 'plugins/blog/categories', 'edit_this_category', 'Sửa danh mục này', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2047, 1, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2048, 1, 'vi', 'plugins/blog/categories', 'none', 'Không', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2049, 1, 'vi', 'plugins/blog/member', 'dob', 'Born :date', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2050, 1, 'vi', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2051, 1, 'vi', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2052, 1, 'vi', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2053, 1, 'vi', 'plugins/blog/member', 'posts', 'Posts', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2054, 1, 'vi', 'plugins/blog/member', 'write_post', 'Write a post', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2055, 1, 'vi', 'plugins/blog/posts', 'create', 'Thêm bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2056, 1, 'vi', 'plugins/blog/posts', 'edit', 'Sửa bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2057, 1, 'vi', 'plugins/blog/posts', 'form.name', 'Tên', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2058, 1, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'Tên bài viết (Tối đa 120 kí tự)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2059, 1, 'vi', 'plugins/blog/posts', 'form.description', 'Mô tả', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2060, 1, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'Mô tả ngắn cho bài viết (Tối đa 400 kí tự)', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2061, 1, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuyên mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2062, 1, 'vi', 'plugins/blog/posts', 'form.tags', 'Từ khóa', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2063, 1, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Thêm từ khóa', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2064, 1, 'vi', 'plugins/blog/posts', 'form.content', 'Nội dung', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2065, 1, 'vi', 'plugins/blog/posts', 'form.is_featured', 'Bài viết nổi bật?', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2066, 1, 'vi', 'plugins/blog/posts', 'form.note', 'Nội dung ghi chú', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2067, 1, 'vi', 'plugins/blog/posts', 'form.format_type', 'Định dạng', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2068, 1, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xóa bài viết thành công', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2069, 1, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Không thể xóa bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2070, 1, 'vi', 'plugins/blog/posts', 'menu_name', 'Bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2071, 1, 'vi', 'plugins/blog/posts', 'edit_this_post', 'Sửa bài viết này', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2072, 1, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hiện tại không có bài viết mới!', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2073, 1, 'vi', 'plugins/blog/posts', 'posts', 'Bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2074, 1, 'vi', 'plugins/blog/posts', 'post', 'Bài viết', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2075, 1, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'Bài viết gần đây', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2076, 1, 'vi', 'plugins/blog/posts', 'author', 'Tác giả', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2077, 1, 'vi', 'plugins/blog/posts', 'categories', 'Danh mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2078, 1, 'vi', 'plugins/blog/posts', 'category', 'Danh mục', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2079, 1, 'vi', 'plugins/blog/tags', 'create', 'Thêm thẻ mới', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2080, 1, 'vi', 'plugins/blog/tags', 'edit', 'Sửa thẻ', '2021-03-14 19:40:46', '2021-03-14 19:40:46'),
(2081, 1, 'vi', 'plugins/blog/tags', 'form.name', 'Tên', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2082, 1, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'Tên thẻ (Tối đa 120 kí tự)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2083, 1, 'vi', 'plugins/blog/tags', 'form.description', 'Mô tả', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2084, 1, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'Mô tả ngắn cho tag (Tối đa 400 kí tự)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2085, 1, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuyên mục', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2086, 1, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Chọn ít nhất 1 bài viết để thực hiện hành động này!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2087, 1, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Không thể xóa thẻ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2088, 1, 'vi', 'plugins/blog/tags', 'deleted', 'Xóa thẻ thành công', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2089, 1, 'vi', 'plugins/blog/tags', 'menu_name', 'Thẻ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2090, 1, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'Sửa thẻ này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2091, 1, 'vi', 'plugins/blog/tags', 'menu', 'Thẻ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2092, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2093, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2094, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2095, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2096, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2097, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2098, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2099, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2100, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2101, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2102, 1, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2103, 1, 'vi', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2104, 1, 'vi', 'plugins/captcha/captcha', 'settings.description', 'Cài đặt cho Google Captcha', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2105, 1, 'vi', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2106, 1, 'vi', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2107, 1, 'vi', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Bật Captcha?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2108, 1, 'vi', 'plugins/captcha/captcha', 'settings.helper', 'Truy cập https://www.google.com/recaptcha/admin#list để lấy thông tin về Site key và Secret.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2109, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2110, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2111, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2112, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2113, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2114, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2115, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2116, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2117, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2118, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2119, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2120, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2121, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2122, 1, 'en', 'plugins/contact/contact', 'email.success', 'Send message successfully!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2123, 1, 'en', 'plugins/contact/contact', 'email.failed', 'Can\'t send message on this time, please try again later!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2124, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2125, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2126, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2127, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2128, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2129, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2130, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2131, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2132, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2133, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2134, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2135, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2136, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2137, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2138, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2139, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2140, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2141, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2142, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2143, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2144, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2145, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2146, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2147, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2148, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2149, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2150, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2151, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2152, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2153, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2154, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2155, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2156, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2157, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2158, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2159, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2160, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2161, 1, 'vi', 'plugins/contact/contact', 'menu', 'Liên hệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2162, 1, 'vi', 'plugins/contact/contact', 'edit', 'Xem liên hệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2163, 1, 'vi', 'plugins/contact/contact', 'tables.phone', 'Điện thoại', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2164, 1, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2165, 1, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Họ tên', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2166, 1, 'vi', 'plugins/contact/contact', 'tables.time', 'Thời gian', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2167, 1, 'vi', 'plugins/contact/contact', 'tables.address', 'Địa địa chỉ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2168, 1, 'vi', 'plugins/contact/contact', 'tables.subject', 'Tiêu đề', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2169, 1, 'vi', 'plugins/contact/contact', 'tables.content', 'Nội dung', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2170, 1, 'vi', 'plugins/contact/contact', 'contact_information', 'Thông tin liên hệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2171, 1, 'vi', 'plugins/contact/contact', 'email.title', 'Thông tin liên hệ mới', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2172, 1, 'vi', 'plugins/contact/contact', 'email.success', 'Gửi tin nhắn thành công!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2173, 1, 'vi', 'plugins/contact/contact', 'email.failed', 'Có lỗi trong quá trình gửi tin nhắn!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2174, 1, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2175, 1, 'vi', 'plugins/contact/contact', 'form.name.required', 'Tên là bắt buộc', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2176, 1, 'vi', 'plugins/contact/contact', 'form.email.required', 'Email là bắt buộc', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2177, 1, 'vi', 'plugins/contact/contact', 'form.email.email', 'Địa chỉ email không hợp lệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2178, 1, 'vi', 'plugins/contact/contact', 'form.content.required', 'Nội dung là bắt buộc', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2179, 1, 'vi', 'plugins/contact/contact', 'form.g-recaptcha-response.required', 'Hãy xác minh không phải là robot trước khi gửi tin nhắn.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2180, 1, 'vi', 'plugins/contact/contact', 'form.g-recaptcha-response.captcha', 'Bạn chưa xác minh không phải là robot thành công.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2181, 1, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Liên hệ này được gửi từ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2182, 1, 'vi', 'plugins/contact/contact', 'form_address', 'Địa chỉ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2183, 1, 'vi', 'plugins/contact/contact', 'form_email', 'Thư điện tử', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2184, 1, 'vi', 'plugins/contact/contact', 'form_message', 'Thông điệp', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2185, 1, 'vi', 'plugins/contact/contact', 'form_name', 'Họ tên', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2186, 1, 'vi', 'plugins/contact/contact', 'form_phone', 'Số điện thoại', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2187, 1, 'vi', 'plugins/contact/contact', 'message_content', 'Nội dung thông điệp', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2188, 1, 'vi', 'plugins/contact/contact', 'required_field', 'Những trường có dấu (<span style=\"color: red\">*</span>) là bắt buộc.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2189, 1, 'vi', 'plugins/contact/contact', 'send_btn', 'Gửi tin nhắn', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2190, 1, 'vi', 'plugins/contact/contact', 'sender', 'Người gửi', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2191, 1, 'vi', 'plugins/contact/contact', 'sender_address', 'Địa chỉ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2192, 1, 'vi', 'plugins/contact/contact', 'sender_email', 'Thư điện tử', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2193, 1, 'vi', 'plugins/contact/contact', 'sender_phone', 'Số điện thoại', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2194, 1, 'vi', 'plugins/contact/contact', 'sent_from', 'Thư được gửi từ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2195, 1, 'vi', 'plugins/contact/contact', 'address', 'Địa chỉ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2196, 1, 'vi', 'plugins/contact/contact', 'message', 'Liên hệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2197, 1, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'Bạn có <span class=\"bold\">:count</span> tin nhắn mới', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2198, 1, 'vi', 'plugins/contact/contact', 'phone', 'Điện thoại', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2199, 1, 'vi', 'plugins/contact/contact', 'statuses.read', 'Đã đọc', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2200, 1, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Chưa đọc', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2201, 1, 'vi', 'plugins/contact/contact', 'view_all', 'Xem tất cả', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2202, 1, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Liên hệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2203, 1, 'vi', 'plugins/contact/contact', 'settings.email.description', 'Cấu hình thông tin cho mục liên hệ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2204, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Thông báo tới admin', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2205, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Mẫu nội dung email gửi tới admin khi có liên hệ mới', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2206, 1, 'vi', 'plugins/contact/contact', 'replies', 'Trả lời', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2207, 1, 'vi', 'plugins/contact/contact', 'form_subject', 'Tiêu đề', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2208, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2209, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2210, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2211, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2212, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2213, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2214, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2215, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2216, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2217, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2218, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2219, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2220, 1, 'en', 'plugins/gallery/gallery', 'create', 'Create new gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2221, 1, 'en', 'plugins/gallery/gallery', 'edit', 'Edit gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2222, 1, 'en', 'plugins/gallery/gallery', 'galleries', 'Galleries', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2223, 1, 'en', 'plugins/gallery/gallery', 'item', 'Gallery item', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2224, 1, 'en', 'plugins/gallery/gallery', 'select_image', 'Select images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2225, 1, 'en', 'plugins/gallery/gallery', 'reset', 'Reset gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2226, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description', 'Update photo\'s description', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2227, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description_placeholder', 'Photo\'s description...', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2228, 1, 'en', 'plugins/gallery/gallery', 'delete_photo', 'Delete this photo', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2229, 1, 'en', 'plugins/gallery/gallery', 'gallery_box', 'Gallery images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2230, 1, 'en', 'plugins/gallery/gallery', 'by', 'By', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2231, 1, 'en', 'plugins/gallery/gallery', 'menu_name', 'Galleries', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2232, 1, 'en', 'plugins/gallery/gallery', 'gallery_images', 'Gallery images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2233, 1, 'en', 'plugins/gallery/gallery', 'add_gallery_short_code', 'Add a gallery', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2234, 1, 'en', 'plugins/gallery/gallery', 'shortcode_name', 'Gallery images', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2235, 1, 'en', 'plugins/gallery/gallery', 'limit_display', 'Limit number display', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2236, 1, 'vi', 'plugins/gallery/gallery', 'create', 'Tạo mới thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2237, 1, 'vi', 'plugins/gallery/gallery', 'edit', 'Sửa thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2238, 1, 'vi', 'plugins/gallery/gallery', 'delete_photo', 'Xóa ảnh này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2239, 1, 'vi', 'plugins/gallery/gallery', 'galleries', 'Thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2240, 1, 'vi', 'plugins/gallery/gallery', 'item', 'Ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2241, 1, 'vi', 'plugins/gallery/gallery', 'reset', 'Làm mới thư viện', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2242, 1, 'vi', 'plugins/gallery/gallery', 'select_image', 'Lựa chọn hình ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2243, 1, 'vi', 'plugins/gallery/gallery', 'update_photo_description', 'Cập nhật mô tả cho hình ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2244, 1, 'vi', 'plugins/gallery/gallery', 'update_photo_description_placeholder', 'Mô tả của hình ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2245, 1, 'vi', 'plugins/gallery/gallery', 'by', 'Bởi', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2246, 1, 'vi', 'plugins/gallery/gallery', 'gallery_box', 'Thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2247, 1, 'vi', 'plugins/gallery/gallery', 'menu_name', 'Thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2248, 1, 'vi', 'plugins/gallery/gallery', 'add_gallery_short_code', 'Thêm thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2249, 1, 'vi', 'plugins/gallery/gallery', 'gallery_images', 'Thư viện ảnh', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2250, 1, 'en', 'plugins/language/language', 'name', 'Languages', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2251, 1, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2252, 1, 'en', 'plugins/language/language', 'select_language', 'Select language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2253, 1, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2254, 1, 'en', 'plugins/language/language', 'language_name', 'Language name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2255, 1, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2256, 1, 'en', 'plugins/language/language', 'locale', 'Locale', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2257, 1, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2258, 1, 'en', 'plugins/language/language', 'language_code', 'Language code', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2259, 1, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2260, 1, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2261, 1, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2262, 1, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2263, 1, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2264, 1, 'en', 'plugins/language/language', 'flag', 'Flag', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2265, 1, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2266, 1, 'en', 'plugins/language/language', 'order', 'Order', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2267, 1, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2268, 1, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2269, 1, 'en', 'plugins/language/language', 'code', 'Code', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2270, 1, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2271, 1, 'en', 'plugins/language/language', 'actions', 'Actions', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2272, 1, 'en', 'plugins/language/language', 'translations', 'Translations', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2273, 1, 'en', 'plugins/language/language', 'edit', 'Edit', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2274, 1, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2275, 1, 'en', 'plugins/language/language', 'delete', 'Delete', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2276, 1, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2277, 1, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2278, 1, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2279, 1, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2280, 1, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2281, 1, 'en', 'plugins/language/language', 'settings', 'Settings', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2282, 1, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2283, 1, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2284, 1, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2285, 1, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2286, 1, 'en', 'plugins/language/language', 'language_display', 'Language display', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2287, 1, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2288, 1, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2289, 1, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2290, 1, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2291, 1, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2292, 1, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2293, 1, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2294, 1, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2295, 1, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2296, 1, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2297, 1, 'en', 'plugins/language/language', 'show_all', 'Show all', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2298, 1, 'en', 'plugins/language/language', 'change_language', 'Language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2299, 1, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2300, 1, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2301, 1, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2302, 1, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2303, 1, 'vi', 'plugins/language/language', 'name', 'Ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2304, 1, 'vi', 'plugins/language/language', 'choose_language', 'Chọn một ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2305, 1, 'vi', 'plugins/language/language', 'select_language', 'Chọn ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2306, 1, 'vi', 'plugins/language/language', 'choose_language_helper', 'Bạn có thể chọn 1 ngôn ngữ trong danh sách hoặc nhập trực tiếp nội dung xuống các mục dưới', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2307, 1, 'vi', 'plugins/language/language', 'language_name', 'Tên đầy đủ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2308, 1, 'vi', 'plugins/language/language', 'language_name_helper', 'Tên ngôn ngữ sẽ được hiển thị trên website (ví dụ: Tiếng Anh).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2309, 1, 'vi', 'plugins/language/language', 'locale', 'Locale', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2310, 1, 'vi', 'plugins/language/language', 'locale_helper', 'Laravel Locale cho ngôn ngữ này (ví dụ: <code>en</code>).', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2311, 1, 'vi', 'plugins/language/language', 'language_code', 'Mã ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2312, 1, 'vi', 'plugins/language/language', 'language_code_helper', 'Mã ngôn ngữ - ưu tiên dạng 2-kí tự theo chuẩn ISO 639-1 (ví dụ: en)', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2313, 1, 'vi', 'plugins/language/language', 'text_direction', 'Hướng viết chữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2314, 1, 'vi', 'plugins/language/language', 'text_direction_helper', 'Chọn hướng viết chữ cho ngôn ngữ này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2315, 1, 'vi', 'plugins/language/language', 'left_to_right', 'Trái qua phải', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2316, 1, 'vi', 'plugins/language/language', 'right_to_left', 'Phải qua trái', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2317, 1, 'vi', 'plugins/language/language', 'flag', 'Cờ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2318, 1, 'vi', 'plugins/language/language', 'flag_helper', 'Chọn 1 cờ cho ngôn ngữ này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2319, 1, 'vi', 'plugins/language/language', 'order', 'Sắp xếp', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2320, 1, 'vi', 'plugins/language/language', 'order_helper', 'Vị trí của ngôn ngữ hiển thị trong mục chuyển đổi ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2321, 1, 'vi', 'plugins/language/language', 'add_new_language', 'Thêm ngôn ngữ mới', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2322, 1, 'vi', 'plugins/language/language', 'code', 'Mã', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2323, 1, 'vi', 'plugins/language/language', 'default_language', 'Ngôn ngữ mặc định', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2324, 1, 'vi', 'plugins/language/language', 'actions', 'Hành động', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2325, 1, 'vi', 'plugins/language/language', 'translations', 'Dịch', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2326, 1, 'vi', 'plugins/language/language', 'edit', 'Sửa', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2327, 1, 'vi', 'plugins/language/language', 'edit_tooltip', 'Sửa ngôn ngữ này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2328, 1, 'vi', 'plugins/language/language', 'delete', 'Xóa', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2329, 1, 'vi', 'plugins/language/language', 'delete_tooltip', 'Xóa ngôn ngữ này và các dữ liệu liên quan', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2330, 1, 'vi', 'plugins/language/language', 'choose_default_language', 'Chọn :language làm ngôn ngữ mặc định', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2331, 1, 'vi', 'plugins/language/language', 'add_language_for_item', 'Thêm ngôn ngữ khác cho bản ghi này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2332, 1, 'vi', 'plugins/language/language', 'current_language', 'Ngôn ngữ hiện tại của bản ghi', '2021-03-14 19:40:47', '2021-03-14 19:40:47');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2333, 1, 'vi', 'plugins/language/language', 'edit_related', 'Sửa bản ngôn ngữ khác của bản ghi này', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2334, 1, 'vi', 'plugins/language/language', 'confirm-change-language', 'Xác nhận thay đổi ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2335, 1, 'vi', 'plugins/language/language', 'confirm-change-language-btn', 'Xác nhận thay đổi', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2336, 1, 'vi', 'plugins/language/language', 'confirm-change-language-message', 'Bạn có chắc chắn muốn thay đổi ngôn ngữ sang tiếng \"<strong class=\"change_to_language_text\"></strong>\" ? Điều này sẽ ghi đè bản ghi tiếng \"<strong class=\"change_to_language_text\"></strong>\" nếu nó đã tồn tại!', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2337, 1, 'vi', 'plugins/language/language', 'current_language_edit_notification', 'Bạn đang chỉnh sửa phiên bản tiếng \"<strong class=\"current_language_text\">:language</strong>\"', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2338, 1, 'vi', 'plugins/language/language', 'hide_languages', 'Ẩn ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2339, 1, 'vi', 'plugins/language/language', 'hide_languages_description', 'Bạn có thể hoàn toàn ẩn ngôn ngữ cụ thể đối với người truy cập và công cụ tìm kiếm, nhưng sẽ vẫn hiển thị trong trang quản trị. Điều này cho phép bạn biết những ngôn ngữ nào đang được xử lý.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2340, 1, 'vi', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} Tất cả ngôn ngữ đang được hiển thị.|{1} :language đang bị ẩn đối với người truy cập.|[2, Inf]  :language đang bị ẩn đối với người truy cập.', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2341, 1, 'vi', 'plugins/language/language', 'language_display', 'Hiển thị ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2342, 1, 'vi', 'plugins/language/language', 'language_display_all', 'Hiển thị cả cờ và tên ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2343, 1, 'vi', 'plugins/language/language', 'language_display_flag_only', 'Chỉ hiển thị cờ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2344, 1, 'vi', 'plugins/language/language', 'language_display_name_only', 'Chỉ hiển thị tên', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2345, 1, 'vi', 'plugins/language/language', 'language_hide_default', 'Ẩn ngôn ngữ mặc định trên URL', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2346, 1, 'vi', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2347, 1, 'vi', 'plugins/language/language', 'language_switcher_display_list', 'Danh sách', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2348, 1, 'vi', 'plugins/language/language', 'settings', 'Cài đặt', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2349, 1, 'vi', 'plugins/language/language', 'switcher_display', 'Hiển thị bộ chuyển đổi ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2350, 1, 'vi', 'plugins/language/language', 'change_language', 'Ngôn ngữ', '2021-03-14 19:40:47', '2021-03-14 19:40:47'),
(2351, 1, 'vi', 'plugins/language/language', 'show_all', 'Hiển thị tất cả', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2352, 1, 'vi', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Hiển thị bản ghi ở ngôn ngữ mặc định nếu phiên bản cho ngôn ngữ hiện tại chưa có', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2353, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2354, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2355, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2356, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2357, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2358, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2359, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2360, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2361, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2362, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2363, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2364, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2365, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2366, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2367, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2368, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2369, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2370, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2371, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2372, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2373, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2374, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2375, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2376, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2377, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2378, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2379, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Admin translations', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2380, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2381, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2382, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2383, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2384, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2385, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2386, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2387, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2388, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2389, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2390, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2391, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2392, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2393, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2394, 1, 'vi', 'plugins/translation/translation', 'append_translation', 'Tiếp nối bản dịch', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2395, 1, 'vi', 'plugins/translation/translation', 'back', 'Quay lại', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2396, 1, 'vi', 'plugins/translation/translation', 'choose_a_group', 'Chọn một nhóm', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2397, 1, 'vi', 'plugins/translation/translation', 'choose_group_msg', 'Chọn một nhóm để hiển thị nhóm dịch thuật. Nếu nhóm không có sẵn, hãy chắc chắn là bạn đã chạy migrations và nhập dữ liệu dịch thuật.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2398, 1, 'vi', 'plugins/translation/translation', 'confirm_publish_group', 'Bạn có chắc muốn xuất bản nhóm \":group\"? Điều này sẽ ghi đè tập tin ngôn ngữ hiện tại.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2399, 1, 'vi', 'plugins/translation/translation', 'done_publishing', 'Xuất bản nhóm dịch thuật thành công', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2400, 1, 'vi', 'plugins/translation/translation', 'edit_title', 'Nhập nội dung dịch', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2401, 1, 'vi', 'plugins/translation/translation', 'export_warning', 'Cảnh báo, bản dịch sẽ không có sẵn cho đến khi chúng được xuất bản lại vào thư mục /resources/lang, sử dụng lệnh \'php artisan cms:translations:export\' hoặc sử dụng nút xuất bản', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2402, 1, 'vi', 'plugins/translation/translation', 'import_done', 'Nhập hoàn thành, đã xử lý :counter bản ghi!  ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2403, 1, 'vi', 'plugins/translation/translation', 'import_group', 'Nhập nhóm', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2404, 1, 'vi', 'plugins/translation/translation', 'publish_translations', 'Xuất bản dịch thuật', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2405, 1, 'vi', 'plugins/translation/translation', 'replace_translation', 'Thay thế bản dịch hiện tại', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2406, 1, 'vi', 'plugins/translation/translation', 'translation_manager', 'Quản lý dịch thuật', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2407, 1, 'vi', 'plugins/translation/translation', 'translations', 'Dịch thuật', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2408, 1, 'vi', 'plugins/translation/translation', 'translations_description', 'Dịch tất cả các từ trong hệ thống', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2409, 1, 'vi', 'plugins/translation/translation', 'actions', 'Hành động', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2410, 1, 'vi', 'plugins/translation/translation', 'add_new_language', 'Thêm ngôn ngữ mới', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2411, 1, 'vi', 'plugins/translation/translation', 'admin-translations', 'Dịch trang quản trị', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2412, 1, 'vi', 'plugins/translation/translation', 'choose_language', 'Chọn ngôn ngữ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2413, 1, 'vi', 'plugins/translation/translation', 'default_locale', 'Ngôn ngữ mặc định', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2414, 1, 'vi', 'plugins/translation/translation', 'delete', 'Xóa', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2415, 1, 'vi', 'plugins/translation/translation', 'edit', 'Sửa', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2416, 1, 'vi', 'plugins/translation/translation', 'flag', 'Cờ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2417, 1, 'vi', 'plugins/translation/translation', 'locale', 'Ngôn ngữ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2418, 1, 'vi', 'plugins/translation/translation', 'locales', 'Ngôn ngữ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2419, 1, 'vi', 'plugins/translation/translation', 'name', 'Tên', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2420, 1, 'vi', 'plugins/translation/translation', 'no_other_languages', 'Không còn ngôn ngữ nào khác để dịch!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2421, 1, 'vi', 'plugins/translation/translation', 'select_language', 'Lựa chọn ngôn ngữ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2422, 1, 'vi', 'plugins/translation/translation', 'theme-translations', 'Dịch giao diện', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2423, 1, 'vi', 'plugins/translation/translation', 'to', 'sang', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2424, 1, 'vi', 'plugins/translation/translation', 'translate_from', 'Dịch từ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2425, 1, 'vi', 'auth', 'failed', 'Không tìm thấy thông tin đăng nhập hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2426, 1, 'vi', 'auth', 'throttle', 'Đăng nhập không đúng quá nhiều lần. Vui lòng thử lại sau :seconds giây.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2427, 1, 'vi', 'auth', 'password', 'Mật khẩu không chính xác', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2428, 1, 'vi', 'pagination', 'previous', '&laquo; Trước', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2429, 1, 'vi', 'pagination', 'next', 'Sau &raquo;', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2430, 1, 'vi', 'passwords', 'reset', 'Mật khẩu đã được cập nhật!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2431, 1, 'vi', 'passwords', 'sent', 'Chúng tôi đã gửi cho bạn đường dẫn thay đổi mật khẩu!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2432, 1, 'vi', 'passwords', 'token', 'Mã xác nhận mật khẩu không hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2433, 1, 'vi', 'passwords', 'user', 'Không tìm thấy thành viên với địa chỉ email này.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2434, 1, 'vi', 'validation', 'accepted', 'Trường :attribute phải được chấp nhận.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2435, 1, 'vi', 'validation', 'active_url', 'Trường :attribute không phải là một URL hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2436, 1, 'vi', 'validation', 'after', 'Trường :attribute phải là một ngày sau ngày :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2437, 1, 'vi', 'validation', 'after_or_equal', 'Trường :attribute phải là một ngày sau hoặc bằng ngày :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2438, 1, 'vi', 'validation', 'alpha', 'Trường :attribute chỉ có thể chứa các chữ cái.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2439, 1, 'vi', 'validation', 'alpha_dash', 'Trường :attribute chỉ có thể chứa chữ cái, số và dấu gạch ngang.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2440, 1, 'vi', 'validation', 'alpha_num', 'Trường :attribute chỉ có thể chứa chữ cái và số.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2441, 1, 'vi', 'validation', 'array', 'Kiểu dữ liệu của trường :attribute phải là dạng mảng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2442, 1, 'vi', 'validation', 'before', 'Trường :attribute phải là một ngày trước ngày :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2443, 1, 'vi', 'validation', 'before_or_equal', 'Trường :attribute phải là một ngày trước hoặc bằng ngày :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2444, 1, 'vi', 'validation', 'between.numeric', 'Trường :attribute phải nằm trong khoảng :min - :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2445, 1, 'vi', 'validation', 'between.file', 'Dung lượng tập tin trong trường :attribute phải từ :min - :max kB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2446, 1, 'vi', 'validation', 'between.string', 'Trường :attribute phải từ :min - :max ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2447, 1, 'vi', 'validation', 'between.array', 'Trường :attribute phải có từ :min - :max phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2448, 1, 'vi', 'validation', 'boolean', 'Trường :attribute phải là true hoặc false.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2449, 1, 'vi', 'validation', 'confirmed', 'Giá trị xác nhận trong trường :attribute không khớp.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2450, 1, 'vi', 'validation', 'date', 'Trường :attribute không phải là định dạng của ngày-tháng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2451, 1, 'vi', 'validation', 'date_equals', 'Trường :attribute phải là một ngày bằng với :date.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2452, 1, 'vi', 'validation', 'date_format', 'Trường :attribute không giống với định dạng :format.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2453, 1, 'vi', 'validation', 'different', 'Trường :attribute và :other phải khác nhau.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2454, 1, 'vi', 'validation', 'digits', 'Độ dài của trường :attribute phải gồm :digits chữ số.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2455, 1, 'vi', 'validation', 'digits_between', 'Độ dài của trường :attribute phải nằm trong khoảng :min and :max chữ số.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2456, 1, 'vi', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2457, 1, 'vi', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2458, 1, 'vi', 'validation', 'email', 'Trường :attribute phải là một địa chỉ email hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2459, 1, 'vi', 'validation', 'ends_with', 'Trường :attribute phải kết thúc bằng một trong những giá trị sau: :values', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2460, 1, 'vi', 'validation', 'exists', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2461, 1, 'vi', 'validation', 'file', 'Trường :attribute phải là một tập tin.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2462, 1, 'vi', 'validation', 'filled', 'Trường :attribute không được bỏ trống.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2463, 1, 'vi', 'validation', 'gt.numeric', 'Trường :attribute phải lớn hơn :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2464, 1, 'vi', 'validation', 'gt.file', 'Dung lượng tập tin trong trường :attribute phải lớn hơn :max KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2465, 1, 'vi', 'validation', 'gt.string', 'Trường :attribute phải lớn hơn :max ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2466, 1, 'vi', 'validation', 'gt.array', 'Trường :attribute phải lớn hơn :max phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2467, 1, 'vi', 'validation', 'gte.numeric', 'Trường :attribute phải lớn hơn hoặc bằng :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2468, 1, 'vi', 'validation', 'gte.file', 'Dung lượng tập tin trong trường :attribute phải lớn hơn hoặc bằng :max KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2469, 1, 'vi', 'validation', 'gte.string', 'Trường :attribute phải lớn hơn hoặc bằng :max ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2470, 1, 'vi', 'validation', 'gte.array', 'Trường :attribute phải lớn hơn hoặc bằng :max phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2471, 1, 'vi', 'validation', 'image', 'Các tập tin trong trường :attribute phải là định dạng hình ảnh.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2472, 1, 'vi', 'validation', 'in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2473, 1, 'vi', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2474, 1, 'vi', 'validation', 'integer', 'Trường :attribute phải là một số nguyên.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2475, 1, 'vi', 'validation', 'ip', 'Trường :attribute phải là một địa chỉa IP.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2476, 1, 'vi', 'validation', 'ipv4', 'Trường :attribute phải là địa chỉ IPv4 hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2477, 1, 'vi', 'validation', 'ipv6', 'Trường :attribute phải là địa chỉ IPv6 hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2478, 1, 'vi', 'validation', 'json', 'Trường :attribute phải là chuỗi JSON hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2479, 1, 'vi', 'validation', 'lt.numeric', 'Trường :attribute phải nhỏ hơn là :min.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2480, 1, 'vi', 'validation', 'lt.file', 'Dung lượng tập tin trong trường :attribute phải nhỏ hơn :min KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2481, 1, 'vi', 'validation', 'lt.string', 'Trường :attribute phải có nhỏ hơn :min ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2482, 1, 'vi', 'validation', 'lt.array', 'Trường :attribute phải có nhỏ hơn :min phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2483, 1, 'vi', 'validation', 'lte.numeric', 'Trường :attribute phải nhỏ hơn hoặc bằng là :min.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2484, 1, 'vi', 'validation', 'lte.file', 'Dung lượng tập tin trong trường :attribute phải nhỏ hơn hoặc bằng :min KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2485, 1, 'vi', 'validation', 'lte.string', 'Trường :attribute phải có nhỏ hơn hoặc bằng :min ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2486, 1, 'vi', 'validation', 'lte.array', 'Trường :attribute phải có nhỏ hơn hoặc bằng :min phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2487, 1, 'vi', 'validation', 'max.numeric', 'Trường :attribute không được lớn hơn :max.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2488, 1, 'vi', 'validation', 'max.file', 'Dung lượng tập tin trong trường :attribute không được lớn hơn :max KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2489, 1, 'vi', 'validation', 'max.string', 'Trường :attribute không được lớn hơn :max ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2490, 1, 'vi', 'validation', 'max.array', 'Trường :attribute không được lớn hơn :max phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2491, 1, 'vi', 'validation', 'mimes', 'Trường :attribute phải là một tập tin có định dạng: :values.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2492, 1, 'vi', 'validation', 'mimetypes', 'Trường :attribute phải là một tệp có định dạng là: :values.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2493, 1, 'vi', 'validation', 'min.numeric', 'Trường :attribute phải tối thiểu là :min.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2494, 1, 'vi', 'validation', 'min.file', 'Dung lượng tập tin trong trường :attribute phải tối thiểu :min KB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2495, 1, 'vi', 'validation', 'min.string', 'Trường :attribute phải có tối thiểu :min ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2496, 1, 'vi', 'validation', 'min.array', 'Trường :attribute phải có tối thiểu :min phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2497, 1, 'vi', 'validation', 'not_in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2498, 1, 'vi', 'validation', 'not_regex', 'Trường :attribute định dạng không hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2499, 1, 'vi', 'validation', 'numeric', 'Trường :attribute phải là một số.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2500, 1, 'vi', 'validation', 'password', 'Mật khẩu không đúng.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2501, 1, 'vi', 'validation', 'present', 'The :attribute field must be present.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2502, 1, 'vi', 'validation', 'regex', 'Định dạng trường :attribute không hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2503, 1, 'vi', 'validation', 'required', 'Trường :attribute không được bỏ trống.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2504, 1, 'vi', 'validation', 'required_if', 'Trường :attribute không được bỏ trống khi trường :other là :value.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2505, 1, 'vi', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2506, 1, 'vi', 'validation', 'required_with', 'Trường :attribute không được bỏ trống khi trường :values có giá trị.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2507, 1, 'vi', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2508, 1, 'vi', 'validation', 'required_without', 'Trường :attribute không được bỏ trống khi trường :values không có giá trị.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2509, 1, 'vi', 'validation', 'required_without_all', 'Trường :attribute không được bỏ trống khi tất cả :values không có giá trị.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2510, 1, 'vi', 'validation', 'same', 'Trường :attribute và :other phải giống nhau.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2511, 1, 'vi', 'validation', 'size.numeric', 'Trường :attribute phải bằng :size.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2512, 1, 'vi', 'validation', 'size.file', 'Dung lượng tập tin trong trường :attribute phải bằng :size kB.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2513, 1, 'vi', 'validation', 'size.string', 'Trường :attribute phải chứa :size ký tự.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2514, 1, 'vi', 'validation', 'size.array', 'Trường :attribute phải chứa :size phần tử.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2515, 1, 'vi', 'validation', 'starts_with', 'Trường :attribute phải được bắt đầu bằng một trong những giá trị sau: :values', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2516, 1, 'vi', 'validation', 'string', 'Trường :attribute phải là một chuỗi.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2517, 1, 'vi', 'validation', 'timezone', 'Trường :attribute phải là một múi giờ hợp lệ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2518, 1, 'vi', 'validation', 'unique', 'Trường :attribute đã có trong hệ thống.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2519, 1, 'vi', 'validation', 'uploaded', 'Trường :attribute không thể tải lên.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2520, 1, 'vi', 'validation', 'url', 'Trường :attribute không giống với định dạng một URL.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2521, 1, 'vi', 'validation', 'uuid', 'Trường :attribute không phải là một chuỗi UUID hợp lẹ.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2522, 1, 'vi', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2523, 1, 'vi', 'validation', 'attributes.name', 'tên', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2524, 1, 'vi', 'validation', 'attributes.username', 'tên đăng nhập', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2525, 1, 'vi', 'validation', 'attributes.email', 'email', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2526, 1, 'vi', 'validation', 'attributes.first_name', 'tên', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2527, 1, 'vi', 'validation', 'attributes.last_name', 'họ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2528, 1, 'vi', 'validation', 'attributes.password', 'mật khẩu', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2529, 1, 'vi', 'validation', 'attributes.password_confirmation', 'xác nhận mật khẩu', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2530, 1, 'vi', 'validation', 'attributes.city', 'thành phố', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2531, 1, 'vi', 'validation', 'attributes.country', 'quốc gia', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2532, 1, 'vi', 'validation', 'attributes.address', 'địa chỉ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2533, 1, 'vi', 'validation', 'attributes.phone', 'số điện thoại', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2534, 1, 'vi', 'validation', 'attributes.mobile', 'di động', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2535, 1, 'vi', 'validation', 'attributes.age', 'tuổi', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2536, 1, 'vi', 'validation', 'attributes.sex', 'giới tính', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2537, 1, 'vi', 'validation', 'attributes.gender', 'giới tính', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2538, 1, 'vi', 'validation', 'attributes.year', 'năm', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2539, 1, 'vi', 'validation', 'attributes.month', 'tháng', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2540, 1, 'vi', 'validation', 'attributes.day', 'ngày', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2541, 1, 'vi', 'validation', 'attributes.hour', 'giờ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2542, 1, 'vi', 'validation', 'attributes.minute', 'phút', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2543, 1, 'vi', 'validation', 'attributes.second', 'giây', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2544, 1, 'vi', 'validation', 'attributes.title', 'tiêu đề', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2545, 1, 'vi', 'validation', 'attributes.content', 'nội dung', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2546, 1, 'vi', 'validation', 'attributes.body', 'nội dung', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2547, 1, 'vi', 'validation', 'attributes.description', 'mô tả', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2548, 1, 'vi', 'validation', 'attributes.excerpt', 'trích dẫn', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2549, 1, 'vi', 'validation', 'attributes.date', 'ngày', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2550, 1, 'vi', 'validation', 'attributes.time', 'thời gian', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2551, 1, 'vi', 'validation', 'attributes.subject', 'tiêu đề', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2552, 1, 'vi', 'validation', 'attributes.message', 'lời nhắn', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2553, 1, 'vi', 'validation', 'attributes.available', 'có sẵn', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2554, 1, 'vi', 'validation', 'attributes.size', 'kích thước', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2555, 1, 'vi', '_json', '-- select --', '-- lựa chọn --', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2556, 1, 'vi', '_json', '404 - Not found', '404 - Không tìm thấy trang yêu cầu', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2557, 1, 'vi', '_json', 'About banner', 'About banner', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2558, 1, 'vi', '_json', 'About me', 'Về tôi', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2559, 1, 'vi', '_json', 'Action button URL', 'Action button URL', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2560, 1, 'vi', '_json', 'Action button text', 'Action button text', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2561, 1, 'vi', '_json', 'Add a custom menu to your widget area.', 'Add a custom menu to your widget area.', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2562, 1, 'vi', '_json', 'Add blog posts big', 'Add blog posts big', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2563, 1, 'vi', '_json', 'Add blog posts list', 'Add blog posts list', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2564, 1, 'vi', '_json', 'Add featured categories', 'Add featured categories', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2565, 1, 'vi', '_json', 'Add featured posts', 'Add featured posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2566, 1, 'vi', '_json', 'Add youtube video', 'Add youtube video', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2567, 1, 'vi', '_json', 'Addition Information', 'Addition Information', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2568, 1, 'vi', '_json', 'Address', 'Địa chỉ', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2569, 1, 'vi', '_json', 'Advertise banner', 'Advertise banner', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2570, 1, 'vi', '_json', 'An Error Occurred: Internal Server Error', 'An Error Occurred: Internal Server Error', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2571, 1, 'vi', '_json', 'Author', 'Author', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2572, 1, 'vi', '_json', 'Blog big', 'Blog big', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2573, 1, 'vi', '_json', 'Blog categories posts', 'Blog categories posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2574, 1, 'vi', '_json', 'Blog list', 'Blog list', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2575, 1, 'vi', '_json', 'Blog sidebar', 'Blog sidebar', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2576, 1, 'vi', '_json', 'Bottom Sidebar Ads', 'Bottom Sidebar Ads', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2577, 1, 'vi', '_json', 'By', 'By', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2578, 1, 'vi', '_json', 'Categories', 'Categories', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2579, 1, 'vi', '_json', 'Categories with Posts', 'Categories with Posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2580, 1, 'vi', '_json', 'Category', 'Category', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2581, 1, 'vi', '_json', 'Change copyright', 'Change copyright', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2582, 1, 'vi', '_json', 'Color', 'Color', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2583, 1, 'vi', '_json', 'Copyright', 'Copyright', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2584, 1, 'vi', '_json', 'Copyright on footer of site', 'Copyright on footer of site', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2585, 1, 'vi', '_json', 'Custom Menu', 'Custom Menu', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2586, 1, 'vi', '_json', 'Custom map', 'Custom map', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2587, 1, 'vi', '_json', 'Danger color', 'Danger color', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2588, 1, 'vi', '_json', 'Designed by', 'Designed by', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2589, 1, 'vi', '_json', 'Don\'t miss', 'Don\'t miss', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2590, 1, 'vi', '_json', 'Email', 'Email', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2591, 1, 'vi', '_json', 'Enable Facebook chat?', 'Enable Facebook chat?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2592, 1, 'vi', '_json', 'Enable Facebook comment in post detail page?', 'Enable Facebook comment in post detail page?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2593, 1, 'vi', '_json', 'Enable Preloader?', 'Enable Preloader?', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2594, 1, 'vi', '_json', 'Enter your email', 'Enter your email', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2595, 1, 'vi', '_json', 'Envato username must not a URL. Please try with username \":username\"!', 'Envato username must not a URL. Please try with username \":username\"!', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2596, 1, 'vi', '_json', 'Facebook page ID', 'Facebook page ID', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2597, 1, 'vi', '_json', 'Featured categories', 'Featured categories', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2598, 1, 'vi', '_json', 'Featured posts', 'Featured posts', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2599, 1, 'vi', '_json', 'Featured posts slider', 'Featured posts slider', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2600, 1, 'vi', '_json', 'Featured posts slider full', 'Featured posts slider full', '2021-03-14 19:40:48', '2021-03-14 19:40:48'),
(2601, 1, 'vi', '_json', 'Follow me', 'Theo dõi tôi', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2602, 1, 'vi', '_json', 'Footer sidebar', 'Footer sidebar', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2603, 1, 'vi', '_json', 'Full width', 'Full width', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2604, 1, 'vi', '_json', 'Galleries', 'Galleries', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2605, 1, 'vi', '_json', 'Google map', 'Google map', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2606, 1, 'vi', '_json', 'Header', 'Header', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2607, 1, 'vi', '_json', 'Header config', 'Header config', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2608, 1, 'vi', '_json', 'Home', 'Home', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2609, 1, 'vi', '_json', 'Homepage', 'Homepage', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2610, 1, 'vi', '_json', 'Hot tags', 'Hot tags', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2611, 1, 'vi', '_json', 'Hot topics', 'Hot topics', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2612, 1, 'vi', '_json', 'Icon', 'Icon', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2613, 1, 'vi', '_json', 'Image', 'Image', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2614, 1, 'vi', '_json', 'Introduction about the author of this blog', 'Introduction about the author of this blog', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2615, 1, 'vi', '_json', 'Latest posts', 'Bài viết mới nhất', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2616, 1, 'vi', '_json', 'Maintenance mode', 'Chế độ bảo trì', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2617, 1, 'vi', '_json', 'Message', 'Nội dung', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2618, 1, 'vi', '_json', 'Name', 'Tên', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2619, 1, 'vi', '_json', 'Not found', 'Not found', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2620, 1, 'vi', '_json', 'Number gallery to display', 'Number gallery to display', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2621, 1, 'vi', '_json', 'Number posts to display', 'Number posts to display', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2622, 1, 'vi', '_json', 'Number tags to display', 'Number tags to display', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2623, 1, 'vi', '_json', 'Oops! An Error Occurred', 'Oops! An Error Occurred', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2624, 1, 'vi', '_json', 'Panel Ads', 'Panel Ads', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2625, 1, 'vi', '_json', 'Phone', 'Điện thoại', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2626, 1, 'vi', '_json', 'Popular tags', 'Popular tags', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2627, 1, 'vi', '_json', 'Primary color', 'Primary color', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2628, 1, 'vi', '_json', 'Primary font', 'Primary font', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2629, 1, 'vi', '_json', 'Related posts', 'Related posts', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2630, 1, 'vi', '_json', 'Right sidebar', 'Right sidebar', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2631, 1, 'vi', '_json', 'Search', 'Tìm kiếm', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2632, 1, 'vi', '_json', 'Search result for:', 'Search result for:', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2633, 1, 'vi', '_json', 'Search stories, places and people', 'Tìm câu chuyện, địa điểm và con người', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2634, 1, 'vi', '_json', 'Secondary color', 'Secondary color', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2635, 1, 'vi', '_json', 'Select a category', 'Select a category', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2636, 1, 'vi', '_json', 'Select menu', 'Select menu', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2637, 1, 'vi', '_json', 'Send', 'Gửi', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2638, 1, 'vi', '_json', 'Send message successfully!', 'Gửi tin nhắn thành công', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2639, 1, 'vi', '_json', 'Share on Facebook', 'Share on Facebook', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2640, 1, 'vi', '_json', 'Share on Linkedin', 'Share on Linkedin', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2641, 1, 'vi', '_json', 'Share this', 'Share this', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2642, 1, 'vi', '_json', 'Sidebar in blog page', 'Sidebar in blog page', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2643, 1, 'vi', '_json', 'Sidebar in the footer of page', 'Sidebar in the footer of page', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2644, 1, 'vi', '_json', 'Social', 'Social', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2645, 1, 'vi', '_json', 'Social links', 'Social links', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2646, 1, 'vi', '_json', 'Something is broken. Please let us know what you were doing when this error occurred. We will fix it as soon as possible. Sorry for any inconvenience caused.', 'Something is broken. Please let us know what you were doing when this error occurred. We will fix it as soon as possible. Sorry for any inconvenience caused.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2647, 1, 'vi', '_json', 'Sorry, we are doing some maintenance. Please check back soon.', 'Sorry, we are doing some maintenance. Please check back soon.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2648, 1, 'vi', '_json', 'Subject', 'Subject', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2649, 1, 'vi', '_json', 'Submit', 'Submit', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2650, 1, 'vi', '_json', 'Subscribe', 'Subscribe', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2651, 1, 'vi', '_json', 'Subscribe to newsletter successfully!', 'Subscribe to newsletter successfully!', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2652, 1, 'vi', '_json', 'Subscribe to our newsletter and get our newest updates right on your inbox.', 'Đăng ký bản tin của chúng tôi và nhận các cập nhật mới nhất của chúng tôi ngay trong hộp thư đến của bạn.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2653, 1, 'vi', '_json', 'Tags', 'Tags', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2654, 1, 'vi', '_json', 'The field with (<span style=\"color:#FF0000;\">*</span>) is required.', 'The field with (<span style=\"color:#FF0000;\">*</span>) is required.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2655, 1, 'vi', '_json', 'The link you clicked may be broken or the page may have been removed.', 'The link you clicked may be broken or the page may have been removed.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2656, 1, 'vi', '_json', 'The server returned a \"403 Forbidden\".', 'The server returned a \"403 Forbidden\".', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2657, 1, 'vi', '_json', 'The server returned a \"500 Internal Server Error\".', 'The server returned a \"500 Internal Server Error\".', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2658, 1, 'vi', '_json', 'There is no data to display!', 'There is no data to display!', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2659, 1, 'vi', '_json', 'Top Sidebar Ads', 'Top Sidebar Ads', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2660, 1, 'vi', '_json', 'Tweet now', 'Tweet now', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2661, 1, 'vi', '_json', 'URL', 'URL', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2662, 1, 'vi', '_json', 'Uncategorized', 'Uncategorized', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2663, 1, 'vi', '_json', 'Unsubscribe to newsletter successfully', 'Unsubscribe to newsletter successfully', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2664, 1, 'vi', '_json', 'Widget to display galleries', 'Widget to display galleries', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2665, 1, 'vi', '_json', 'Widget to display newsletter form', 'Widget to display newsletter form', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2666, 1, 'vi', '_json', 'Widget to display popular posts', 'Widget to display popular posts', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2667, 1, 'vi', '_json', 'You might be interested in', 'You might be interested in', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2668, 1, 'vi', '_json', 'Your email', 'Your email', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2669, 1, 'vi', '_json', 'Your email does not exist in the system or you have unsubscribed already!', 'Your email does not exist in the system or you have unsubscribed already!', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2670, 1, 'vi', '_json', 'Your name', 'Your name', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2671, 1, 'vi', '_json', 'Youtube URL is invalid.', 'Youtube URL is invalid.', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2672, 1, 'vi', '_json', 'Youtube video', 'Youtube video', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2673, 1, 'vi', '_json', 'here', 'here', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2674, 1, 'vi', '_json', 'mins read', 'mins read', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2675, 1, 'vi', '_json', 'views', 'views', '2021-03-14 19:40:49', '2021-03-14 19:40:49'),
(2676, 1, 'vi', '_json', 'visit the', 'visit the', '2021-03-14 19:40:49', '2021-03-14 19:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'admin@campcodes.com', NULL, '$2b$10$Q8cCvubfsa.3k.7JtifzweM4jAi5gfBg6I/32URsLqUArEODLdqTK', 'sQRIUtDszfu8Ga2prb3ZuUSlxmOc6uFPb4uFI7lWAPHlkFdf5TfspkbDLqNo', '2021-03-14 19:40:35', '2021-06-05 07:25:15', 'Steven', 'Madden', 'botble', 1, 1, 1, NULL, '2021-06-05 07:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'CustomMenuWidget', 'footer_sidebar', 'stories', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(2, 'TagsWidget', 'footer_sidebar', 'stories', 1, '{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(3, 'NewsletterWidget', 'footer_sidebar', 'stories', 2, '{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(4, 'AboutWidget', 'primary_sidebar', 'stories', 0, '{\"id\":\"AboutWidget\",\"name\":\"Hello, I\'m Steven\",\"description\":\"Hi, I\\u2019m Steven, a Florida native, who left my career in corporate wealth management six years ago to embark on a summer of soul searching that would change the course of my life forever.\",\"image\":\"general\\/author.jpg\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(5, 'PopularPostsWidget', 'primary_sidebar', 'stories', 1, '{\"id\":\"PopularPostsWidget\",\"name\":\"Most popular\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(6, 'GalleriesWidget', 'primary_sidebar', 'stories', 2, '{\"id\":\"GalleriesWidget\",\"name\":\"Galleries\",\"number_display\":6}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(7, 'CustomMenuWidget', 'footer_sidebar', 'stories-vi', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Li\\u00ean k\\u1ebft nhanh\",\"menu_id\":\"lien-ket\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(8, 'TagsWidget', 'footer_sidebar', 'stories-vi', 1, '{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(9, 'NewsletterWidget', 'footer_sidebar', 'stories-vi', 2, '{\"id\":\"NewsletterWidget\",\"name\":\"\\u0110\\u0103ng k\\u00fd b\\u1ea3n tin\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(10, 'AboutWidget', 'primary_sidebar', 'stories-vi', 0, '{\"id\":\"AboutWidget\",\"name\":\"Xin ch\\u00e0o, t\\u00f4i l\\u00e0 Steven\",\"description\":\"Xin ch\\u00e0o, t\\u00f4i l\\u00e0 Steven, ng\\u01b0\\u1eddi g\\u1ed1c Florida, ng\\u01b0\\u1eddi \\u0111\\u00e3 r\\u1eddi b\\u1ecf s\\u1ef1 nghi\\u1ec7p qu\\u1ea3n l\\u00fd t\\u00e0i s\\u1ea3n doanh nghi\\u1ec7p c\\u00e1ch \\u0111\\u00e2y 6 n\\u0103m \\u0111\\u1ec3 b\\u1eaft \\u0111\\u1ea7u m\\u1ed9t m\\u00f9a h\\u00e8 t\\u00ecm ki\\u1ebfm t\\u00e2m h\\u1ed3n s\\u1ebd thay \\u0111\\u1ed5i cu\\u1ed9c \\u0111\\u1eddi t\\u00f4i m\\u00e3i m\\u00e3i.\",\"image\":\"general\\/author.jpg\"}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(11, 'PopularPostsWidget', 'primary_sidebar', 'stories-vi', 1, '{\"id\":\"PopularPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft n\\u1ed5i b\\u1eadt\",\"number_display\":5}', '2021-03-14 19:40:35', '2021-03-14 19:40:35'),
(12, 'GalleriesWidget', 'primary_sidebar', 'stories-vi', 2, '{\"id\":\"GalleriesWidget\",\"name\":\"Th\\u01b0 vi\\u1ec7n \\u1ea3nh\",\"number_display\":6}', '2021-03-14 19:40:35', '2021-03-14 19:40:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ads_key_unique` (`key`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2677;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
