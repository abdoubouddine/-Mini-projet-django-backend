-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 20, 2021 at 05:42 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `solde` double NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`code`, `solde`) VALUES
(3, 0.8999999999999986),
(4, 42587.345),
(5, 500.9);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_clients`
--

DROP TABLE IF EXISTS `accounts_clients`;
CREATE TABLE IF NOT EXISTS `accounts_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `client_id` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_clients_account_id_client_id_da8b42aa_uniq` (`account_id`,`client_id`),
  KEY `accounts_clients_account_id_f2c31c09` (`account_id`),
  KEY `accounts_clients_client_id_05d8fc2e` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_clients`
--

INSERT INTO `accounts_clients` (`id`, `account_id`, `client_id`) VALUES
(2, 4, 'BB164260'),
(3, 4, 'CC457863'),
(4, 3, 'BB164260'),
(5, 5, 'BB164260');

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('793356f19f3f3df9edfe771158ebc55a2cee370c', '2021-02-18 23:06:07.939885', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add account', 7, 'add_account'),
(26, 'Can change account', 7, 'change_account'),
(27, 'Can delete account', 7, 'delete_account'),
(28, 'Can view account', 7, 'view_account'),
(29, 'Can add operations', 8, 'add_operations'),
(30, 'Can change operations', 8, 'change_operations'),
(31, 'Can delete operations', 8, 'delete_operations'),
(32, 'Can view operations', 8, 'view_operations'),
(33, 'Can add client', 9, 'add_client'),
(34, 'Can change client', 9, 'change_client'),
(35, 'Can delete client', 9, 'delete_client'),
(36, 'Can view client', 9, 'view_client'),
(37, 'Can add Token', 10, 'add_token'),
(38, 'Can change Token', 10, 'change_token'),
(39, 'Can delete Token', 10, 'delete_token'),
(40, 'Can view Token', 10, 'view_token'),
(41, 'Can add token', 11, 'add_tokenproxy'),
(42, 'Can change token', 11, 'change_tokenproxy'),
(43, 'Can delete token', 11, 'delete_tokenproxy'),
(44, 'Can view token', 11, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$jmpVfQEiys3g$ZxJRarUMdc1o66a32ASMCw3S4IiAQwzXeRaOPt0wiL0=', '2021-02-19 14:24:07.023742', 1, 'admin', '', '', 'admin@test.com', 1, 1, '2021-02-15 19:25:57.696568'),
(12, 'bobe', NULL, 0, 'bobee', 'abdoo', 'lol', 'salam@gmail.com', 0, 1, '2021-02-19 14:34:36.265514'),
(9, 'adminelee', NULL, 0, 'adminalee', 'abdoo', 'lol', '', 1, 1, '2021-02-19 13:58:06.000000'),
(11, 'bobe', NULL, 0, 'bobe', 'abdoo', 'lol', 'salam@gmail.com', 0, 1, '2021-02-19 14:33:04.883345');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `CIN` varchar(8) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `address` longtext,
  PRIMARY KEY (`CIN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`CIN`, `lastname`, `prenom`, `address`) VALUES
('BB164260', 'Jamal', 'Jamal', 'Rue 32 Hay Bni Makada Oujda'),
('CC457863', 'Jilal', 'Ahmed', 'Casablanca rue 75 N°42');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(2, '2021-02-18 22:53:24.193534', '1', '1', 3, '', 7, 1),
(3, '2021-02-18 23:05:13.134814', '1', '5d5d0a967f8b2c4cd69fba655bcf6f89fdc841ea', 3, '', 11, 1),
(4, '2021-02-19 13:58:35.855243', '9', 'adminalee', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(5, '2021-02-19 14:23:36.338108', '9', 'adminalee', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(6, '2021-02-19 14:30:40.217610', '4', 'abd', 3, '', 4, 1),
(7, '2021-02-19 14:30:40.219604', '5', 'abdel', 3, '', 4, 1),
(8, '2021-02-19 14:30:40.221602', '3', 'abdou', 3, '', 4, 1),
(9, '2021-02-19 14:30:40.222599', '7', 'adminal', 3, '', 4, 1),
(10, '2021-02-19 14:30:40.223594', '8', 'adminale', 3, '', 4, 1),
(11, '2021-02-19 14:30:40.224603', '6', 'admino', 3, '', 4, 1),
(12, '2021-02-19 14:30:40.226586', '10', 'bob', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'compteBancaire', 'account'),
(8, 'compteBancaire', 'operations'),
(9, 'compteBancaire', 'client'),
(10, 'authtoken', 'token'),
(11, 'authtoken', 'tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-15 19:13:00.961247'),
(2, 'auth', '0001_initial', '2021-02-15 19:13:01.198563'),
(3, 'admin', '0001_initial', '2021-02-15 19:13:02.297205'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-15 19:13:02.489694'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-15 19:13:02.508779'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-15 19:13:02.621965'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-15 19:13:02.719476'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-15 19:13:02.802989'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-15 19:13:02.830074'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-15 19:13:02.925138'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-15 19:13:02.936279'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-15 19:13:02.983994'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-15 19:13:03.069477'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-15 19:13:03.112256'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-15 19:13:03.163853'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-15 19:13:03.181716'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-15 19:13:03.230546'),
(18, 'compteBancaire', '0001_initial', '2021-02-15 19:13:03.433929'),
(19, 'sessions', '0001_initial', '2021-02-15 19:13:03.715930'),
(20, 'compteBancaire', '0002_auto_20210215_2027', '2021-02-15 19:27:49.487853'),
(21, 'compteBancaire', '0003_auto_20210216_2315', '2021-02-16 22:16:21.516871'),
(22, 'compteBancaire', '0004_auto_20210216_2318', '2021-02-16 22:18:16.895076'),
(23, 'compteBancaire', '0005_auto_20210216_2329', '2021-02-16 22:29:55.078905'),
(24, 'compteBancaire', '0006_auto_20210217_0017', '2021-02-16 23:17:19.896074'),
(25, 'compteBancaire', '0007_auto_20210217_0018', '2021-02-16 23:18:42.232363'),
(26, 'compteBancaire', '0008_auto_20210217_0920', '2021-02-17 08:20:15.974080'),
(27, 'authtoken', '0001_initial', '2021-02-18 20:31:51.107522'),
(28, 'authtoken', '0002_auto_20160226_1747', '2021-02-18 20:31:51.199250'),
(29, 'authtoken', '0003_tokenproxy', '2021-02-18 20:31:51.203239');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('mndtbk5t4034ri2pdmj22w3wedkymm4v', '.eJxVjEsOwjAMBe-SNYqaGMc1S_acoXLsQAqolfpZIe4OlbqA7ZuZ93KdrEvt1rlMXW_u5MAdfrcs-ijDBuwuw230Og7L1Ge_KX6ns7-MVp7n3f07qDLXb425IY4lBkYk5JyTaRAMmYmhhSNrimRaMJCB4hWkjQKiQGwNNcm9P8O4NyE:1lD61L:J8H75sEef8iiC_axHtAOPy3lrAAHOGYXnKPVFKO8Zf4', '2021-03-05 13:40:35.686329');

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
CREATE TABLE IF NOT EXISTS `operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_account_id_id_36676989` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `type`, `date`, `amount`, `account_id`) VALUES
(3, 'C', '2021-02-17', 442, 3),
(6, 'C', '2021-02-19', 20, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
