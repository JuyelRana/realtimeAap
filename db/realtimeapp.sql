-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 23, 2020 at 10:24 PM
-- Server version: 5.7.26
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtimeapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'nulla', 'nulla-24166354', '2020-06-22 04:52:02', '2020-10-25 15:46:34'),
(2, 'quasi', 'quasi', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(3, 'ipsum', 'ipsum', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(4, 'nihil', 'nihil', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(5, 'natus2', 'natus2-41510965', '2020-06-22 04:52:02', '2020-10-25 15:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reply_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `reply_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(2, 2, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(3, 3, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(4, 4, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(5, 5, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(6, 6, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(7, 7, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(8, 8, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(9, 9, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(10, 10, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(11, 11, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(12, 12, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(13, 13, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(14, 14, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(15, 15, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(16, 16, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(17, 17, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(18, 18, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(19, 19, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(20, 20, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(21, 21, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(22, 22, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(23, 23, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(24, 24, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(25, 25, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(26, 26, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(27, 27, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(28, 28, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(29, 29, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(30, 30, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(31, 31, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(32, 32, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(33, 33, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(34, 34, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(35, 35, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(36, 36, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(37, 37, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(38, 38, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(39, 39, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(40, 40, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(41, 41, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(42, 42, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(43, 43, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(44, 44, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(45, 45, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(46, 46, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(47, 47, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(48, 48, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(49, 49, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(50, 50, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(51, 9, 8, '2020-10-25 15:46:20', '2020-10-25 15:46:20'),
(53, 53, 9, '2020-12-23 16:14:30', '2020-12-23 16:14:30'),
(54, 54, 9, '2020-12-23 16:15:03', '2020-12-23 16:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_resets_table', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2020_05_12_185930_create_questions_table', 1),
(29, '2020_05_12_190047_create_replies_table', 1),
(30, '2020_05_12_190119_create_categories_table', 1),
(31, '2020_05_12_190142_create_likes_table', 1),
(32, '2020_06_01_173207_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('43644809-d32b-4d56-96ea-3031e3d06910', 'App\\Notifications\\Reply\\NewReplyNotification', 'App\\User', 5, '{\"replyBy\":\"Md Juyel Rana\",\"question\":\"Quam a temporibus velit recusandae fugiat omnis.\",\"path\":\"questions\\/quam-a-temporibus-velit-recusandae-fugiat-omnis\"}', NULL, '2020-06-22 04:56:31', '2020-06-22 04:56:31'),
('88344aaa-312e-4d28-a0da-02330294ad6b', 'App\\Notifications\\Reply\\NewReplyNotification', 'App\\User', 1, '{\"replyBy\":\"Rana\",\"question\":\"Nisi distinctio voluptas vel deserunt maiores a vitae.\",\"path\":\"questions\\/nisi-distinctio-voluptas-vel-deserunt-maiores-a-vitae\"}', NULL, '2020-10-25 15:47:33', '2020-10-25 15:47:33'),
('ed3b8eb2-9bee-4ab2-ad98-fd75f8b09b66', 'App\\Notifications\\Reply\\NewReplyNotification', 'App\\User', 7, '{\"replyBy\":\"Md Juyel\",\"question\":\"This is question from mjuyelrana@gmail.com\",\"path\":\"questions\\/this-is-question-from-mjuyelrana-at-gmailcom-875352825\"}', NULL, '2020-12-23 16:13:46', '2020-12-23 16:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `slug`, `body`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Amet dolor quia officia quo vel in aut.', 'amet-dolor-quia-officia-quo-vel-in-aut', 'Quasi officiis ipsam eos magni ut quo. Quas odio doloribus totam. Temporibus nulla possimus quia qui et incidunt non sit. Mollitia aspernatur saepe accusantium sapiente deleniti.', 5, 5, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(2, 'Quam a temporibus velit recusandae fugiat omnis.', 'quam-a-temporibus-velit-recusandae-fugiat-omnis', 'Suscipit iusto corporis deleniti et veniam ab consequuntur enim. Modi officia provident aut quo laborum. Necessitatibus perferendis sapiente commodi et et quia.', 4, 5, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(3, 'Ipsa labore id quo saepe culpa.', 'ipsa-labore-id-quo-saepe-culpa', 'Velit quia neque aut. Natus voluptate accusantium temporibus aut suscipit quisquam eos. Nemo id et voluptates incidunt ullam.', 1, 3, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(4, 'Consequatur itaque vel suscipit amet ullam et.', 'consequatur-itaque-vel-suscipit-amet-ullam-et', 'Eos aut modi architecto. Fuga mollitia autem quidem repellat aspernatur eveniet aut. Eum autem ut sapiente ab nihil corrupti pariatur. Natus esse ut quis error debitis laudantium dolorum.', 5, 4, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(5, 'Dolores est esse et non aliquam.', 'dolores-est-esse-et-non-aliquam', 'Dolorum vitae voluptates commodi et quis iste fuga. Quaerat aut incidunt rerum ut qui atque provident. Fugiat voluptas laborum qui voluptas.', 4, 1, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(6, 'Voluptatem voluptates non quibusdam deserunt molestias.', 'voluptatem-voluptates-non-quibusdam-deserunt-molestias', 'Et vel doloribus est accusantium minima pariatur. Vero a exercitationem quos. Nostrum nemo magni eveniet dolor.', 3, 1, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(7, 'Repellendus et dolores nam repudiandae distinctio et.', 'repellendus-et-dolores-nam-repudiandae-distinctio-et', 'Nobis eius neque alias dolores et est. Quia consectetur expedita id quia.', 2, 3, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(8, 'Nulla quis est quia quis sapiente ex maiores.', 'nulla-quis-est-quia-quis-sapiente-ex-maiores', 'Praesentium nostrum excepturi qui est qui. Id et odio voluptas ea omnis. Odit sint libero perspiciatis aut id eveniet velit. Praesentium ex voluptas aut vel.', 2, 2, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(9, 'Et ea odit in inventore.', 'et-ea-odit-in-inventore', 'Ipsa omnis occaecati deserunt culpa autem eaque. Reiciendis maiores dolores ducimus non sed quidem. Aliquam nostrum possimus impedit non. Adipisci itaque eos qui modi aut voluptatem.', 1, 5, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(10, 'Nisi distinctio voluptas vel deserunt maiores a vitae.', 'nisi-distinctio-voluptas-vel-deserunt-maiores-a-vitae', 'Dolores ipsum magni blanditiis voluptates error. Quod accusantium rerum aut doloribus voluptatem eligendi. Temporibus aliquam et pariatur nam et sit provident.', 3, 1, '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(11, 'Test Question', 'test-question-6262878', 'What is your problem![](http://)', 3, 8, '2020-10-25 15:49:04', '2020-10-25 15:49:04'),
(12, 'This is question from mjuyelrana@gmail.com', 'this-is-question-from-mjuyelrana-at-gmailcom-875352825', 'What is your name ?', 1, 7, '2020-12-23 16:12:59', '2020-12-23 16:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_question_id_foreign` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `body`, `question_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nihil veritatis quaerat dolore minima. Soluta a aliquid laborum et nam explicabo. Neque labore debitis ea aspernatur voluptatum quis.', 3, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(2, 'Perspiciatis enim magnam excepturi deserunt minima molestias. Eaque id atque quisquam distinctio in est. Et minima aut praesentium quos facilis qui nihil magni.', 7, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(3, 'Adipisci occaecati aut et tempore dignissimos voluptate. Ut quia sint nam. Omnis odit velit optio deleniti.', 2, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(4, 'Molestiae explicabo sapiente sit possimus sint. Et maxime sit qui ullam qui. Culpa possimus sunt et aut.', 7, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(5, 'Hic maiores libero praesentium voluptatibus. Molestias velit qui qui velit voluptas omnis deserunt dolor. Sunt cupiditate qui quia quibusdam illum molestias.', 6, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(6, 'Nihil deleniti dolores iste voluptates dolor dolorem. Illum distinctio et minus consequatur quasi. Quam recusandae eveniet aut ipsum praesentium. Quo saepe fuga ad nobis eum animi et autem.', 10, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(7, 'Sed sequi consequuntur quis non consequatur ipsam. Quod doloribus tempora qui voluptatem rerum. Doloremque iste voluptatibus corporis.', 8, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(8, 'Molestiae rem odit perspiciatis asperiores nihil a qui. Itaque recusandae natus voluptas harum et odio. Incidunt hic et modi possimus quae et. Distinctio dolor et voluptas et fugiat quaerat.', 2, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(9, 'Et fugit id commodi quas provident rem id autem. Iure error est temporibus accusamus recusandae quia. Voluptatem consequatur ipsam mollitia incidunt nobis officia.', 1, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(10, 'Omnis eos minima magni. Sed assumenda commodi aut consequuntur sapiente maiores. Numquam ut qui aut corporis ea.', 8, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(11, 'Fugit aut repellat ad dicta numquam qui. Esse occaecati est est est. Excepturi dolor eius aut praesentium deserunt omnis.', 10, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(12, 'Ea excepturi saepe minima. Aliquid pariatur odio a et impedit nam. Sit molestiae error id. Officia velit non laboriosam velit beatae.', 8, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(13, 'Id eius sequi sit eligendi id. Nihil quisquam delectus qui labore placeat vel. Eos neque repellat quisquam quas porro fugiat et ut.', 4, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(14, 'Qui porro cupiditate soluta et voluptas magnam autem. Quaerat quo adipisci eum voluptatem enim omnis. Voluptas culpa quidem quos tempora quidem delectus.', 10, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(15, 'Doloribus at hic dolor cupiditate ipsa. Corrupti enim perspiciatis laborum et id architecto rerum. Reprehenderit aliquam illo corporis.', 10, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(16, 'Est nisi facilis sunt ut placeat. Voluptatem non dolorem placeat.', 3, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(17, 'Exercitationem eligendi voluptatem expedita. Ut itaque et impedit aut earum expedita. Perferendis illum qui molestiae. Laboriosam ipsa tenetur dolorum officiis consequatur harum.', 10, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(18, 'Eos quidem eos dolores doloribus facilis rerum facilis. Deleniti aut sit omnis. A adipisci doloremque iusto a assumenda placeat.', 1, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(19, 'Amet et ex nostrum quo sint dolore. Soluta impedit sequi odit voluptatum harum doloribus. Debitis dolorem dolores ut sint mollitia.', 4, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(20, 'Quis debitis fuga sunt nostrum facilis voluptas. Dolores perferendis labore quia expedita. Est eos a velit natus sint maxime possimus.', 10, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(21, 'Ea consequuntur ex distinctio ut. Tempora iure mollitia hic facere voluptates facere vero. Vel nobis eos quis eum porro.', 5, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(22, 'Magni magni enim nisi ducimus. Expedita qui animi provident eum culpa dolor molestias. Vel sed vel perspiciatis voluptas. Eos sed veniam officia animi eaque facere delectus.', 1, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(23, 'Quidem dolor iste id qui qui inventore ea. Blanditiis ratione laboriosam sed quibusdam delectus dolorem officia. Deleniti optio dolor ut sequi et hic. Non veniam et exercitationem vel.', 4, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(24, 'Quia rerum officia delectus maiores repudiandae in temporibus. Maiores dolore inventore harum accusantium omnis libero ut error. Magnam autem sint at ut deleniti.', 1, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(25, 'Autem voluptatem illo asperiores voluptatem. Ipsa vero voluptas illum laborum. Quis laudantium numquam molestiae sapiente corrupti quia vel.', 10, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(26, 'Voluptatem praesentium voluptatem itaque qui dolorem. Voluptate velit eligendi rem non rerum. Ipsam explicabo voluptatem ipsam asperiores.', 9, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(27, 'Incidunt sunt quis magnam laudantium vitae doloribus repellendus. In aut corrupti in nesciunt et sit exercitationem. Explicabo harum numquam et vel nisi vel quo. Nobis eaque officia molestias dolor.', 2, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(28, 'Ipsa voluptates harum unde exercitationem repudiandae qui voluptas. Nihil sed et consequatur mollitia quam. Quasi voluptatum hic et qui qui commodi velit ut.', 9, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(29, 'Dolores in eligendi est atque saepe ut voluptates. Iste autem incidunt necessitatibus eligendi sed. Consectetur eum fugit sit cum soluta ut.', 6, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(30, 'Voluptas corrupti laborum ad placeat harum ea saepe. Et laudantium rerum ipsum id ullam ratione. Facere iusto cumque et velit qui in.', 10, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(31, 'Quia temporibus nobis est natus omnis odio. Ipsum est unde velit ea impedit. Vel repudiandae tempora dolorem at.', 2, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(32, 'Doloremque est explicabo omnis illum quia dolorem magnam corporis. Sequi ipsum illo officiis id quae qui cupiditate ducimus. Id voluptatem qui recusandae libero molestiae quisquam.', 4, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(33, 'Sint explicabo voluptatem et ipsam quia. Omnis quos in et nihil. Quam quis molestias temporibus ab fugiat et. Et rerum occaecati dolor impedit repellendus.', 8, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(34, 'Qui quia hic velit officia tempora. Dolore impedit vel aut aut praesentium facilis in quo. Est aut beatae nihil ut quia architecto blanditiis.', 8, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(35, 'Assumenda sit modi unde molestias non quas sed. Qui voluptatem voluptas labore non ut nisi. Ut qui vel delectus voluptas corporis eum. Iusto dolore eos sed itaque recusandae.', 5, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(36, 'Consectetur ut qui nihil voluptatem dolorum maiores. Minus eum quia architecto hic praesentium. Dolorem aliquam omnis libero perspiciatis hic. Sint deleniti voluptatem sed sed enim.', 2, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(37, 'Laborum omnis ratione laborum sequi necessitatibus. Voluptas facere modi saepe et id ipsa. Iste id non numquam blanditiis eveniet.', 7, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(38, 'Aut quae voluptate officiis eveniet non. Et tempore consequuntur blanditiis et quos. Minus quaerat itaque veniam et commodi ea est.', 3, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(39, 'Modi tenetur nihil qui itaque. Commodi officia nesciunt non. Illo consectetur excepturi earum perferendis quasi.', 3, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(40, 'Voluptatem dolorum sed impedit. Similique deserunt magni unde ut enim. Assumenda doloribus aliquam ipsa at natus perferendis nobis. Nihil quia atque doloribus modi molestiae.', 9, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(41, 'Aut velit dolore magnam. Soluta facere quas ipsam ut est enim debitis. Saepe est ut deleniti ea est.', 8, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(42, 'Id provident architecto sunt mollitia maxime et illum. Libero cumque ratione incidunt numquam quidem.', 9, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(43, 'Temporibus nulla voluptas quod fuga. Inventore occaecati doloremque est nihil cumque saepe a nesciunt. Repudiandae perferendis harum rerum blanditiis. Omnis molestias aut esse assumenda.', 10, 3, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(44, 'Amet magni quia quis eius accusamus aperiam. Aut ut quisquam incidunt quia rerum quam aspernatur. Ut dolorum dolor ducimus aut.', 5, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(45, 'Vero enim quis vel corporis voluptas amet. Est ut non numquam incidunt vitae doloribus. Quas cumque natus iste et qui ut reiciendis.', 9, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(46, 'Illo unde ab aut recusandae corporis commodi possimus. Perspiciatis nobis qui repellat. Ut modi nihil dolores nesciunt aut rem et.', 8, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(47, 'Alias facilis quis rerum tempore ea. Est doloremque architecto minima voluptate. Qui consequatur dolore sunt ipsam. Repellat in provident amet.', 10, 2, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(48, 'Nihil aliquam odio ipsa repudiandae et. Voluptas totam mollitia esse aut est totam. Iste quidem voluptatum aliquam. Voluptatum quod tempore voluptas cumque.', 10, 5, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(49, 'Et earum fuga voluptate. Aut et cumque sit est. Minus nostrum quis eveniet sit. Id consequatur explicabo est quis architecto harum. Praesentium at odio doloremque laudantium quisquam.', 9, 4, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(50, 'Dolorem fugiat ratione et veniam. Illo aut ullam dolorum perspiciatis. Reprehenderit quibusdam et suscipit.', 5, 1, '2020-06-22 04:52:03', '2020-06-22 04:52:03'),
(53, 'My name is Juyel Rana.\nWhat is your name?', 12, 9, '2020-12-23 16:13:44', '2020-12-23 16:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Clyde Pacocha Sr.', 'kameron.klein@example.org', '2020-06-22 04:52:02', '$2y$10$Oas7p8EPrsvJ.Dsxhi2BFOAcaw.LBvvRJPdHQG4LtR.9ccjAZvtEC', 'BfhDQzbGtt', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(2, 'Gustave Rowe', 'hardy26@example.org', '2020-06-22 04:52:02', '$2y$10$LHH1IaId4yFA82ZoWLORN.tfL.9AdSvPv./A8DqZ2wDN/CTx1Z4wO', 'HJpo0xhLHc', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(3, 'Dr. Christ Cummings', 'wkirlin@example.net', '2020-06-22 04:52:02', '$2y$10$NuhW84xeuAw3KzNbDZJsLOb4tKU7oGEOW4nP9S/oQ2eDSa9pPZd1m', 'STeFvmVPyM', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(4, 'Donnie Schamberger', 'zella87@example.com', '2020-06-22 04:52:02', '$2y$10$Sr29hstk3J.3ZfHU8xS/BOkwl7qpmMxqfhufYpTp/Ack5YLbPqw1C', 'U6TJ5kHj3b', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(5, 'Tania Lesch', 'haylee.schinner@example.org', '2020-06-22 04:52:02', '$2y$10$wKhG91elA6MnLhJkxTnIjOrT7F2TUuaXVGKF8SY2H9EoWCo2gd.b2', 'nzNkflWCDI', '2020-06-22 04:52:02', '2020-06-22 04:52:02'),
(7, 'Md Juyel Rana', 'mjuyelrana@gmail.com', NULL, '$2y$12$jVgbwbCRCmLo9RI8s3daB.cshK3yW3HG9.8UmpBvQ12SyaSpNAWGG', NULL, '2020-10-11 12:17:06', '2020-10-11 12:17:06'),
(8, 'Rana', 'rana@gmail.com', NULL, '$2y$10$4uCG3Rzp5s6RrG6fIxrjle25mr4n0Rf18ishTALRXaNIRmX81Cgm6', NULL, '2020-10-25 15:46:03', '2020-10-25 15:46:03'),
(9, 'Md Juyel', 'juyel.desktopit@gmail.com', NULL, '$2y$10$re3TE7DF3u0ZlutYjMoP.eKchHMbdttwRz.pS1K3MYLhKms0WkfGe', NULL, '2020-12-23 16:10:07', '2020-12-23 16:10:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
