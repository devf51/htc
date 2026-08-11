-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2026 at 02:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `htc_insights`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `admin_id`, `action`, `target_type`, `target_id`, `reason`, `created_at`) VALUES
(1, 1, 'approve_post', 'post', 5, NULL, '2026-08-08 13:55:01'),
(2, 1, 'approve_post', 'post', 6, NULL, '2026-08-08 13:55:02'),
(3, 1, 'approve_post', 'post', 7, NULL, '2026-08-08 13:55:03'),
(4, 1, 'approve_post', 'post', 4, NULL, '2026-08-08 13:55:04'),
(5, 1, 'approve_post', 'post', 3, NULL, '2026-08-08 13:55:04'),
(6, 1, 'approve_post', 'post', 2, NULL, '2026-08-08 13:55:04'),
(7, 1, 'approve_post', 'post', 1, NULL, '2026-08-08 13:55:05'),
(8, 1, 'update_report_resolved', 'report', 1, NULL, '2026-08-08 13:56:33'),
(9, 1, 'update_user_role', 'user', 3, 'Changed role from student to admin', '2026-08-08 14:00:29'),
(10, 1, 'update_user_role', 'user', 3, 'Changed role from admin to student', '2026-08-08 14:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `community_comments`
--

CREATE TABLE `community_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `is_anonymous` tinyint(1) DEFAULT NULL,
  `anon_identity_enc` varchar(500) DEFAULT NULL,
  `is_best_answer` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community_likes`
--

CREATE TABLE `community_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_likes`
--

INSERT INTO `community_likes` (`id`, `user_id`, `post_id`, `comment_id`, `created_at`) VALUES
(3, 1, 1, NULL, '2026-08-07 14:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `community_posts`
--

CREATE TABLE `community_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('experience','qa','tips','team') NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_anonymous` tinyint(1) DEFAULT NULL,
  `anon_identity_enc` varchar(500) DEFAULT NULL,
  `is_pinned` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `rejection_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_posts`
--

INSERT INTO `community_posts` (`id`, `user_id`, `type`, `department`, `title`, `content`, `is_anonymous`, `anon_identity_enc`, `is_pinned`, `created_at`, `status`, `rejection_reason`) VALUES
(1, 1, 'experience', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'ffffffffffffffffffffffffffffffffffffffffff', 'ffffffffffffffffffffffffffffffffffffffffff', 1, 'gAAAAABqdeXeXqllSbLEEipBDGAPF1UQAFi1a-ipDaiX-0XPndmcrs2YaHhWhA0iygxaXxdDr1Gy5EV8n-aTaL_caP62LSNZ_Q==', 0, '2026-08-07 14:04:14', 'approved', NULL),
(2, 1, 'experience', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'ไม่พบสถานที่ฝึกงานที่ตรงตามเงื่อนไข', 'ไม่พบสถานที่ฝึกงานที่ตรงตามเงื่อนไข', 1, 'gAAAAABqdzJcHscDSfIMZFG3d4Bg0U0te9iCpvnlJaddg8RqXn7tzoCJ9GYVKSxeYAvYvED8NJu_QZ_BFe3Yvgp4O4Mf9j-BIw==', 0, '2026-08-08 13:42:52', 'approved', NULL),
(3, 1, 'experience', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'ไม่พบสถานที่ฝึกงานที่ตรงตามเงื่อนไข', 'ไม่พบสถานที่ฝึกงานที่ตรงตามเงื่อนไข', 1, 'gAAAAABqdzJs3B7W_faM5wIFnWV7-6riWsHPkABb2JO2kv1P7DNqTQN43zEyaCc0NO30MzqfscznuBcY6ahK9SLiT_lS3cy37Q==', 0, '2026-08-08 13:43:08', 'approved', NULL),
(4, 1, 'experience', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'มีรถรับส่ง/เดินทางสะดวก', 'มีรถรับส่ง/เดินทางสะดวกมีรถรับส่ง/เดินทางสะดวกมีรถรับส่ง/เดินทางสะดวกมีรถรับส่ง/เดินทางสะดวก', 1, 'gAAAAABqdzOAHzrluFQARBvO2fDzixH1-FvfXUalGUMjtqf5-CFOSYnDBap6wo_ItbawypX9vaKYAtmnos4ELGENZeLwEtRpJQ==', 0, '2026-08-08 13:47:44', 'approved', NULL),
(5, 1, 'experience', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'มีรถรับส่ง/เดินทางสะดวก', 'มีรถรับส่ง/เดินทางสะดวก', 1, 'gAAAAABqdzOZrRb6EcMCuXNr1DhaQPYuX_v9VDS83w_rCKb5-fuhMGZGrzAXLklFrzsP3pKFTazXvTjR5I96d1oWP_kU8qliuA==', 0, '2026-08-08 13:48:09', 'approved', NULL),
(6, 2, 'qa', 'แผนกวิชาเทคโนโลยีสารสนเทศ', 'สอบถามเรื่องการสมัครฝึกงาน IT', 'อยากสอบถามพี่ๆ เรื่องการเตรียมตัวสมัครฝึกงานตำแหน่งไอทีครับ ต้องเตรียมพอร์ตยังไงบ้าง', 0, NULL, 0, '2026-08-08 13:48:58', 'approved', NULL),
(7, 1, 'experience', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'หัวข้อกระทู้*', 'เนื้อหากระทู้*', 1, 'gAAAAABqdzRdD7e1tawrSa0Eog0BesgZXCGtu5lSpqGxi4P8qA8hgDcXizDRhXVfhT_gHbEWNq-rR5H8MSk6GNexaClEjoZo0g==', 0, '2026-08-08 13:51:25', 'approved', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `website` varchar(500) DEFAULT NULL,
  `cover_image_url` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `industry`, `lat`, `lng`, `is_verified`, `employer_id`, `created_at`, `phone`, `website`, `cover_image_url`, `description`) VALUES
(1, 'ศูนย์นวัตกรรมและเทคโนโลยี หาดใหญ่', 'ถนนกาญจนวณิชย์ ต.คอหงส์ อ.หาดใหญ่ จ.สงขลา 90110', NULL, 7.0084, 100.477, 0, NULL, '2026-08-05 15:42:10', '0649659240', 'https://htc.ac.th', 'https://lh3.googleusercontent.com/gps-cs-s/AHRPTWm7pSM4DqavaAmgz4NJw8fyM0983g14bFchiZW4jFbfzDpuOxXBMoLdDwJc8q0n8zwwRR1GaMGqjSjQT-QHBAzJnMppNfdEpIqQLUi50VL3t5rtpF45nGtRPISsRsCpAqWPZA-2rA=w1000-h1000-c-n', NULL),
(6, 'โรงพยาบาลค่ายเสนาณรงค์', 'ถนนกาญจนวณิชย์ เทศบาลนครหาดใหญ่ จังหวัดจังหวัดสงขลา', NULL, 7.02023, 100.499, 0, NULL, '2026-08-06 14:39:20', NULL, NULL, NULL, NULL),
(7, 'บริษัท เอมิ.โปร.จำกัด Ami. Pro. Corp., Ltd.', '652/8 ถ. เพชรเกษม, ตำบล คอหงส์ อำเภอหาดใหญ่, สงขลา 90110', NULL, 7.01828, 100.486, 0, NULL, '2026-08-06 14:43:14', '074 365 454', 'http://www.amiprocorp.com/', 'https://lh3.googleusercontent.com/gps-cs-s/AHRPTWn1_XFHiVhbzqsXGqv8IJYpvSGy556QITYvODfLyupLPBqF7XDVQHhRlUY1l_X927ZfZc8rtHP2llQt3MfdvUYuw1RIn3DqvCd5fcdXsYYs-mS4R0PY-4Z5Q_CBglJF479Ie_bx=w1000-h1000-c-n', NULL),
(8, 'โรงพยาบาลราษฎร์ยินดี', 'Thanon Pattano Uthit เทศบาลนครหาดใหญ่ จังหวัดจังหวัดสงขลา', NULL, 7.00059, 100.48, 0, NULL, '2026-08-06 14:53:23', NULL, 'https://rajyindee.com/', NULL, NULL),
(9, 'เวิร์คพริ้นท์เซ็นเตอร์', '10 เพชรเกษม ซอย 15, ตำบล คอหงส์ อำเภอหาดใหญ่, สงขลา 90110', NULL, 7.01839, 100.486, 0, NULL, '2026-08-10 14:58:28', '086 697 1058', 'https://www.facebook.com/workprintcenterhatyai', 'https://lh3.googleusercontent.com/gps-cs-s/AHRPTWkdd05yqr187l7uAZiXI_ruNd0B6sO53X6g0GhTH3XuZCgMNWvNbPDSCrQ4tslkzyAXaIncOcoVW0MWcx-kZn3UbWs-Pdhq1K5Rt9neop93gMV4grVDmPngRi70BlS8zwjhrZCmHS2F5MIA=w1000-h1000-c-n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `daily_allowance` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `link`, `created_at`) VALUES
(1, 1, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'มีรถรับส่ง/เดินทางสะดวก\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:01'),
(2, 2, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'สอบถามเรื่องการสมัครฝึกงาน IT\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:02'),
(3, 1, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'หัวข้อกระทู้*\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:03'),
(4, 1, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'มีรถรับส่ง/เดินทางสะดวก\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:04'),
(5, 1, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'ไม่พบสถานที่ฝึกงานที่ตรงตามเงื่อนไข\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:04'),
(6, 1, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'ไม่พบสถานที่ฝึกงานที่ตรงตามเงื่อนไข\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:04'),
(7, 1, 'โพสต์ของคุณได้รับการอนุมัติ', 'โพสต์เรื่อง \'ffffffffffffffffffffffffffffffffffffffffff\' ได้รับการอนุมัติและเผยแพร่เรียบร้อยแล้ว', 'info', 0, '/community', '2026-08-08 13:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `review_id` int(11) DEFAULT NULL,
  `reason` text NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `reporter_id`, `post_id`, `review_id`, `reason`, `status`, `created_at`, `job_id`, `company_id`, `comment_id`) VALUES
(1, 1, NULL, 8, 'สแปม / โฆษณาชวนเชื่อ', 'resolved', '2026-08-08 13:55:28', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender` enum('male','female','prefer_not') NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `daily_allowance` int(11) DEFAULT NULL,
  `has_accommodation` tinyint(1) DEFAULT NULL,
  `has_transport` tinyint(1) DEFAULT NULL,
  `score_overall` float NOT NULL,
  `score_work` float DEFAULT NULL,
  `score_env` float DEFAULT NULL,
  `score_mentor` float DEFAULT NULL,
  `score_welfare` float DEFAULT NULL,
  `text_work` text NOT NULL,
  `text_pros` text DEFAULT NULL,
  `text_cons` text DEFAULT NULL,
  `text_advice` text DEFAULT NULL,
  `is_anonymous` tinyint(1) DEFAULT NULL,
  `anon_identity_enc` varchar(500) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `work_start_time` varchar(50) DEFAULT NULL,
  `work_end_time` varchar(50) DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `company_id`, `user_id`, `gender`, `period_start`, `period_end`, `department`, `daily_allowance`, `has_accommodation`, `has_transport`, `score_overall`, `score_work`, `score_env`, `score_mentor`, `score_welfare`, `text_work`, `text_pros`, `text_cons`, `text_advice`, `is_anonymous`, `anon_identity_enc`, `status`, `created_at`, `work_start_time`, `work_end_time`, `rejection_reason`) VALUES
(5, 6, 1, 'male', '2026-05-01', '2026-08-31', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 400, 0, 1, 5, 5, 5, 5, 5, 'ทดสอบการแก้ไขรีวิวหมายเลข 5 ในระบบหลังจากรีสตาร์ทเซิร์ฟเวอร์ใหม่เรียบร้อยครับ', NULL, NULL, NULL, 0, NULL, 'approved', '2026-08-06 14:39:20', '08:30', '16:30', NULL),
(6, 7, 1, 'male', '2026-05-01', '2026-08-31', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 350, 0, 0, 2, 2, 1, 1, 5, 'รายละเอียดลักษณะงานที่ได้รับการปรับปรุงเรียบร้อยแล้ว ยาวเกิน 50 ตัวอักษรแน่นอนครับ', NULL, NULL, NULL, 0, NULL, 'approved', '2026-08-06 14:43:14', '08:00', '17:00', NULL),
(7, 8, 1, 'male', '2026-05-01', '2026-08-31', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 0, 0, 0, 5, 5, 5, 5, 5, 'รายละเอียดงานต้องมีความยาวอย่างน้อย 50 ตัวอักษร (ปัจจุบันมี 0 ตัวอักษร)\n', NULL, NULL, NULL, 1, 'gAAAAABqdJ_joQntEo1slAnX18dC2OJbaCpZaG5d90N8sUHMAqbx-P04s2EXpOqgqHyAN2w1CaCqFu16VNGhhfldDdJpZ6i4Fg==', 'approved', '2026-08-06 14:53:23', NULL, NULL, NULL),
(8, 7, 3, 'male', '2026-05-01', '2026-08-31', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 0, 0, 0, 5, 4, 5, 1, 2, 'รายละเอียดงานต้องมีความยาวอย่างน้อย 50 ตัวอักษร (ปัจจุบันมี 0 ตัวอักษร)\n', NULL, NULL, NULL, 1, 'gAAAAABqdLE1Ye2C1xwdxDkKE-DEV_cEk0XsxCGDB7Tiuxoz9jWS7IZaz1IXAJvRDDwff6RmJP1daevF2EK_qAYIGVgF-KzSEw==', 'approved', '2026-08-06 15:40:22', '08:00', '17:00', NULL),
(9, 1, 2, 'male', '2026-05-01', '2026-08-31', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 300, 0, 1, 5, 5, 5, 5, 5, 'การฝึกงานครั้งนี้ได้เรียนรู้ระบบเว็บไซต์ภาษาไทยอย่างครบถ้วน ได้พัฒนาทักษะความรู้มากมาย', 'พี่เลี้ยงใจดี สภาพแวดล้อมดี', 'การเดินทางต้องมีรถส่วนตัว', 'เตรียมตัวเรื่องทฤษฎีเพิ่มเติม', 0, NULL, 'approved', '2026-08-08 13:40:44', '08:00', '17:00', NULL),
(10, 9, 1, 'female', '2026-05-01', '2026-08-31', 'แผนกวิชาเทคโนโลยีสารสนเทศ', 0, 0, 0, 1, 3, 5, 2, 2, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 'หนีไป ', 0, NULL, 'approved', '2026-08-10 14:58:28', '08:00', '17:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review_photos`
--

CREATE TABLE `review_photos` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_requests`
--

CREATE TABLE `upgrade_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rejection_reason` text DEFAULT NULL,
  `card_image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('student','admin','external') DEFAULT 'student',
  `department` varchar(100) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `verify_token` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `name`, `role`, `department`, `level`, `is_verified`, `verify_token`, `avatar_url`, `created_at`, `is_super_admin`) VALUES
(1, 'superadmin@htc.ac.th', '$pbkdf2-sha256$29000$W6vVeu8dgzDG.F8r5TxnTA$ZVorZ.d7ArFTSf3vt.9dJszv5/u.Hfh1xuDNoMZBE5I', 'Super Admin', 'admin', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'ระดับประกา', 1, NULL, NULL, '2026-08-05 14:56:28', 1),
(2, 'student01@htc.ac.th', '$pbkdf2-sha256$29000$ZGwNISRESClFaC0FgHAuJQ$xk7V65A/74KxBF7zULSXjWf5AaKSY6hVRU2BeN4qEzg', 'Student One', 'student', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'ระดับประกา', 1, NULL, NULL, '2026-08-05 14:57:40', 0),
(3, 'student02@htc.ac.th', '$pbkdf2-sha256$29000$W6uVcq71/l.LEWLMOQfAeA$RwS1xh.lM8NLdlrU6E4x.AjLesxYz/UBaW2HJ1ukC9s', 'Student Two', 'student', 'แผนกวิชาช่างอิเล็กทรอนิกส์', 'ระดับประกา', 1, NULL, NULL, '2026-08-05 15:03:51', 0),
(4, 'student03@htc.ac.th', '$pbkdf2-sha256$29000$PYew9l5rbe3dO8d4D6H0Hg$gg9omPQwiF.B2UB8RrydMMQHBhgDfEokvkuz9NaxaJs', 'Student Three', 'student', 'แผนกวิชาเทคโนโลยีสารสนเทศ', 'ปวช.', 1, NULL, NULL, '2026-08-08 14:01:13', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `ix_audit_logs_id` (`id`);

--
-- Indexes for table `community_comments`
--
ALTER TABLE `community_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `ix_community_comments_id` (`id`);

--
-- Indexes for table `community_likes`
--
ALTER TABLE `community_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `ix_community_likes_id` (`id`);

--
-- Indexes for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ix_community_posts_id` (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_id` (`employer_id`),
  ADD KEY `ix_companies_id` (`id`),
  ADD KEY `ix_companies_name` (`name`);

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_employers_email` (`email`),
  ADD KEY `ix_employers_id` (`id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_id` (`employer_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `ix_job_postings_id` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ix_notifications_id` (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reporter_id` (`reporter_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `ix_reports_id` (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ix_reviews_id` (`id`);

--
-- Indexes for table `review_photos`
--
ALTER TABLE `review_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `ix_review_photos_id` (`id`);

--
-- Indexes for table `upgrade_requests`
--
ALTER TABLE `upgrade_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_users_email` (`email`),
  ADD KEY `ix_users_id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `community_comments`
--
ALTER TABLE `community_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_likes`
--
ALTER TABLE `community_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `community_posts`
--
ALTER TABLE `community_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review_photos`
--
ALTER TABLE `review_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upgrade_requests`
--
ALTER TABLE `upgrade_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `community_comments`
--
ALTER TABLE `community_comments`
  ADD CONSTRAINT `community_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`),
  ADD CONSTRAINT `community_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `community_comments_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `community_comments` (`id`);

--
-- Constraints for table `community_likes`
--
ALTER TABLE `community_likes`
  ADD CONSTRAINT `community_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `community_likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`),
  ADD CONSTRAINT `community_likes_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `community_comments` (`id`);

--
-- Constraints for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD CONSTRAINT `community_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`);

--
-- Constraints for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD CONSTRAINT `job_postings_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`id`),
  ADD CONSTRAINT `job_postings_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`),
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `review_photos`
--
ALTER TABLE `review_photos`
  ADD CONSTRAINT `review_photos_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`);

--
-- Constraints for table `upgrade_requests`
--
ALTER TABLE `upgrade_requests`
  ADD CONSTRAINT `upgrade_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
