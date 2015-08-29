-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2015 at 10:11 AM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ads2trade`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesseshistoric`
--

CREATE TABLE `accesseshistoric` (
  `month` char(2) NOT NULL DEFAULT '',
  `year` char(4) NOT NULL DEFAULT '',
  `pageviews` int(11) NOT NULL DEFAULT '0',
  `uniquevisitiors` int(11) NOT NULL DEFAULT '0',
  `usersessions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
`id` int(7) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `name` tinytext NOT NULL,
  `text` text NOT NULL,
  `type` varchar(15) NOT NULL,
  `paid_date` varchar(16) NOT NULL,
  `amount` double(6,4) NOT NULL,
  `day` int(3) NOT NULL,
  `week` int(2) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `addtional_charges_type`
--

CREATE TABLE `addtional_charges_type` (
  `adct_id` smallint(6) NOT NULL,
  `adct_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adminusers`
--

CREATE TABLE `adminusers` (
`id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `hash` varchar(5) NOT NULL DEFAULT '',
  `created` varchar(8) NOT NULL DEFAULT '',
  `lastlogin` varchar(14) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminusers`
--

INSERT INTO `adminusers` (`id`, `username`, `password`, `hash`, `created`, `lastlogin`, `status`) VALUES
(2, 'pintos', '0abf7e7895315a44a76f900145e08102', 'ohsb', '20140101', '1407869356', 0);

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
`ass_id` smallint(6) NOT NULL,
  `ast_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_type',
  `ass_name` varchar(30) NOT NULL,
  `ass_description` varchar(255) DEFAULT NULL,
  `position` varchar(30) NOT NULL,
  `ass_ref` varchar(30) NOT NULL,
  `emp_id_maintenance` smallint(6) DEFAULT NULL,
  `ass_disposed_of` tinyint(4) DEFAULT NULL,
  `ass_acquisition_cost` float DEFAULT NULL,
  `ass_book_value` float DEFAULT NULL,
  `ass_printable_height` float DEFAULT NULL,
  `ass_proportional_costs` tinyint(4) DEFAULT NULL,
  `ass_printable_width` float DEFAULT NULL,
  `ass_production_cost_BCY` float DEFAULT NULL,
  `ass_production_price_SCY` float DEFAULT NULL,
  `ass_address` varchar(120) NOT NULL,
  `mat_id` smallint(6) DEFAULT NULL,
  `loc_id` smallint(6) DEFAULT NULL,
  `med_id` smallint(6) DEFAULT NULL,
  `met_id` smallint(6) DEFAULT NULL,
  `img_id` int(6) NOT NULL,
  `ass_lead_time` decimal(9,3) DEFAULT NULL,
  `meu_id_lead_time` smallint(6) DEFAULT NULL,
  `ass_production_requirements` varchar(1000) DEFAULT NULL,
  `use_id` int(5) NOT NULL,
  `mec_id` smallint(6) NOT NULL,
  `lot_id` smallint(6) NOT NULL,
  `ass_position` text NOT NULL,
  `ass_height_meu_id` smallint(6) NOT NULL,
  `ass_width_meu_id` smallint(6) NOT NULL,
  `ass_street_address` varchar(255) NOT NULL,
  `ass_city` varchar(255) NOT NULL,
  `ass_province` varchar(255) NOT NULL,
  `ass_country` varchar(255) NOT NULL,
  `ass_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ass_is_mall` tinyint(1) DEFAULT '0' COMMENT '1 = is a mall, 0 = is an outdoor asset'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`ass_id`, `ast_id`, `ass_name`, `ass_description`, `position`, `ass_ref`, `emp_id_maintenance`, `ass_disposed_of`, `ass_acquisition_cost`, `ass_book_value`, `ass_printable_height`, `ass_proportional_costs`, `ass_printable_width`, `ass_production_cost_BCY`, `ass_production_price_SCY`, `ass_address`, `mat_id`, `loc_id`, `med_id`, `met_id`, `img_id`, `ass_lead_time`, `meu_id_lead_time`, `ass_production_requirements`, `use_id`, `mec_id`, `lot_id`, `ass_position`, `ass_height_meu_id`, `ass_width_meu_id`, `ass_street_address`, `ass_city`, `ass_province`, `ass_country`, `ass_date`, `ass_is_mall`) VALUES
(1, 1, 'My Asset 1', 'My Description 1', '-26.067732,27.935486', 'REF 001', 4, NULL, 350, 300, 2, 127, 1, 0, 0, 'Diamond Street, Randburg', 2, 1, 5, NULL, 0, 1.000, NULL, 'production requirements         ', 5, 1, 2, 'Position                    ', 2, 4, '276 Quorn Drive', 'Waterfront', 'WC', 'South Africa', '2015-03-03 05:15:41', 0),
(2, 2, 'My Asset 2', 'My Description 2', '-26.066344,27.95042', 'REF 002', NULL, NULL, 1200, 1350, NULL, 127, 1450, 1500, 2000, '18 Douglas Rd, Randburg', NULL, 2, 5, NULL, 2, NULL, NULL, NULL, 5, 2, 0, '', 0, 0, '18 Douglas Rd', 'Randburg', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(3, 3, 'My Asset 3', 'My Description 3', '-26.076058,27.931023', 'AST/BB 003', NULL, NULL, 1200, 1500, NULL, 127, 1100, 1900, 2000, '10 Diamond St Randburg, 2161', NULL, 1, 5, NULL, 2, NULL, NULL, NULL, 8, 3, 0, '', 0, 0, '10 Diamond St', 'Randburg', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(4, 2, 'My Asset 4', 'My Description 4', '-26.071432,27.941494', 'AST/BB 004', NULL, NULL, 1000, 1100, NULL, 127, 1050, 1200, 2000, '8 Piscus St Randburg, 2161', NULL, 2, 5, NULL, 3, NULL, NULL, NULL, 5, 4, 0, '', 0, 0, '8 Piscus St', 'Randburg', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(5, 2, 'My Asset 5', 'My Description 5', '-26.048147,27.918835', 'REF 005', NULL, NULL, 850, NULL, 2, 125, 5, 1300, 2000, '', NULL, 2, 5, NULL, 4, NULL, NULL, 'Large Logo, great picture', 5, 5, 0, '', 0, 0, 'No 17 6th Road', 'Midrand', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(6, 2, 'My Asset 6', 'My Description 5', '-26.07807,27.942867', 'AST/BB 006', NULL, NULL, 900, NULL, NULL, 120, 900, 850, 2000, '', NULL, 2, 5, NULL, 5, NULL, NULL, NULL, 5, 7, 0, '', 0, 0, '45 Fourways Boulevard', 'Fourways', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(7, 2, 'My Asset 7', 'My Description 7', '-26.064501,27.925529', 'AST/BB 007', NULL, NULL, 1200, NULL, NULL, 100, 1000, 1000, 2000, '', NULL, 2, 5, NULL, 6, NULL, NULL, NULL, 8, 1, 0, '', 0, 0, '345 Smit Street', 'Pretoria', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(8, 2, 'My Asset 8', 'My Description 8', '-26.043682,27.936344', 'REF 008', NULL, NULL, 1100, NULL, NULL, 127, 1500, 1200, 2000, '', NULL, 2, 5, NULL, 7, NULL, NULL, NULL, 8, 1, 0, '', 0, 0, '23 Nelson Mandela Avenue', 'Pretoria', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(9, 1, 'Asset 9', 'My Asset 9', '-26.050159,27.943211', 'REF 009', NULL, NULL, 800, NULL, NULL, 100, 950, 1500, 2000, '', NULL, 1, 5, NULL, 8, NULL, NULL, NULL, 8, 8, 0, '', 0, 0, '33 Nivasha Road', 'Sunninghill', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(10, 1, 'Asset 10', 'My Description 10 ', '-26.054323,27.925358', 'AST/RF 010', NULL, NULL, 1500, 1850, NULL, 127, 2200, 1400, 2000, '', NULL, 1, 5, NULL, 9, NULL, NULL, NULL, 8, 5, 0, '', 0, 0, '25 Mary Lane', 'Sandton', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(11, 2, 'My Asset 17', 'My Description 17', '-26.048147,27.918833', 'REF 017', NULL, NULL, 1500, NULL, 2, 110, 5, 1350, 2000, '', NULL, 2, 5, NULL, 10, NULL, NULL, NULL, 5, 4, 0, '', 0, 0, '105 Lenchen Avenue', 'Centurion', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(12, 2, 'My Asset 15', 'My Description 15', '-26.048147,27.918837', 'REF 015', NULL, NULL, 1000, NULL, 2, 105, 5, 1200, 2000, '', NULL, 2, 5, NULL, 11, NULL, NULL, NULL, 5, 5, 0, '', 0, 0, '21 Main Road', 'Bryanston', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(13, 3, 'Asset', 'Asset', '-26.067735,27.936258', 'AST 000', NULL, NULL, 650, NULL, NULL, 127, 850, 1000, 2000, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 3, 0, '', 0, 0, '45 Walter Sisulu Road', 'Soweto', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(14, 2, 'My Bilboard 1', 'My Description 4', '-26.071432,27.941494', 'BIL 004', NULL, NULL, 450, NULL, NULL, 127, 900, 890, 2000, '', NULL, 2, 5, NULL, 0, NULL, NULL, NULL, 5, 9, 0, '', 0, 0, '1 Old Pretoria Road', 'Midrand', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(15, 2, 'My Asset 9', 'My Description 9', '-26.048147,27.9188351', 'BIL 009', NULL, NULL, 800, NULL, 2, 127, 5, 900, 2000, '', NULL, 2, 5, NULL, 0, NULL, NULL, 'Large Logo, great picture', 8, 8, 0, '', 0, 0, '10 Desmond Tutu Avenue', 'Soweto', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(16, 2, 'Myne', 'My Myne', '-26.046604,27.944069', 'AST 009', NULL, NULL, 5000, NULL, NULL, 127, 900, 850, 2000, '419 Valley Rd Roodepoort, 2169', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 8, 0, '', 0, 0, '419 Valley', 'Roodepoort', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(17, 3, 'Polokwane Asset', 'Polokwane Asset', '-23.966176,29.443359', 'PLK 001', NULL, NULL, 45000, NULL, NULL, 100, 500, 450, 1900, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 4, 0, '', 0, 0, '6TH ROAD', 'Midrand', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(18, 1, 'Test Asset', 'Testing', '-27.867893,27.421875', 'TST 000', NULL, NULL, 500, NULL, NULL, 127, 1200, 1500, 1500, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 2, 0, '', 0, 0, '300 Walter Sisulu Rd', 'Soweto', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(19, 2, 'Test Asset #1', 'Testing #2', '-26.558722,25.883789', 'TST 001', NULL, NULL, 150, NULL, NULL, 125, 300, 200, 1450, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 2, 0, '', 0, 0, '', '', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(20, NULL, 'asset5', 'nmbvmnbv', '-26.04777,27.920272', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 1, 0, '', 0, 0, '', '', '', '', '2015-03-03 05:15:41', 0),
(21, NULL, 'Billboard N1 Southbound ', 'Huge Billboard N1 Southbound  (near W/Nicol Off/Ramp).', '-26.061872,27.934628', '', 4, NULL, 15000, 23500, 15, 127, 3, 0, 0, '', 2, NULL, 5, NULL, 0, 2.000, NULL, '                    Production Requirements                          ', 5, 8, 3, ' -26.038199, 28.015950              ', 10, 10, '348-365 Olievenhout Avenue', 'Roodepoort', 'GP', 'South Africa', '2015-03-03 05:15:41', 0),
(22, NULL, 'blessed', 'trest', '47.219568,36.738281', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 3, 0, '', 0, 0, '', '', '', '', '2015-03-03 05:15:41', 0),
(23, NULL, 'xxxxx', 'xxxx', '-25.977799,27.718506', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 1, 0, '', 0, 0, '', '', '', '', '2015-03-03 05:15:41', 0),
(24, NULL, 'Klerksdop Main Mall', 'Billboads inside and alongside the Mall. Includes parking area advertising space.', '-26.892679,26.663818', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, 5, 8, 0, '', 0, 0, '', '', '', '', '2015-03-03 05:15:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_accounts_receivable`
--

CREATE TABLE `asset_accounts_receivable` (
`aar_id` smallint(6) NOT NULL,
  `aar_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asset_category`
--

CREATE TABLE `asset_category` (
  `asc_id` smallint(6) NOT NULL,
  `asc_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asset_color`
--

CREATE TABLE `asset_color` (
`asc_id` smallint(6) NOT NULL,
  ` asc_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asset_group`
--

CREATE TABLE `asset_group` (
`asg_id` smallint(6) NOT NULL,
  `asg_description` varchar(255) DEFAULT NULL,
  `asg_min_price` decimal(13,2) DEFAULT NULL,
  `asg_max_price` decimal(13,2) DEFAULT NULL,
  `asi_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_size',
  `meu_id` smallint(6) DEFAULT NULL COMMENT 'FK: measurement_unit'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset_group`
--

INSERT INTO `asset_group` (`asg_id`, `asg_description`, `asg_min_price`, `asg_max_price`, `asi_id`, `meu_id`) VALUES
(1, 'A', 1000.00, 60000.00, 26, 5),
(2, 'B', 900.00, 55000.00, 26, 5),
(3, 'C', 500.00, 20000.00, 26, 5),
(4, 'D', 200.00, 5000.00, 26, 5),
(5, 'A', 55000.00, 200000.00, 27, 7),
(6, 'B', 40000.00, 175000.00, 27, 7),
(7, 'C', 20000.00, 120000.00, 27, 7),
(8, 'D', 15000.00, 65000.00, 27, 7);

-- --------------------------------------------------------

--
-- Table structure for table `asset_size`
--

CREATE TABLE `asset_size` (
`asi_id` smallint(6) NOT NULL,
  `asi_description` varchar(255) DEFAULT NULL,
  `mec_id` smallint(6) DEFAULT NULL COMMENT 'FK: media_category',
  `meu_id` smallint(6) DEFAULT NULL COMMENT 'FK : measurement_unit',
  `asi_photo_url` varchar(255) DEFAULT NULL,
  `asi_quantity` decimal(10,3) DEFAULT NULL,
  `asi_width` decimal(10,3) DEFAULT NULL,
  `asi_length` decimal(10,3) DEFAULT NULL,
  `asi_printable_width` decimal(10,3) DEFAULT NULL,
  `asi_printable_length` decimal(10,3) DEFAULT NULL,
  `asi_page_trim_width` decimal(10,3) DEFAULT NULL,
  `asi_notes` varchar(2500) DEFAULT NULL,
  `asi_page_trim_length` decimal(10,3) DEFAULT NULL,
  `asi_frequency` int(11) DEFAULT NULL,
  `asi_frequency_meu_id` smallint(6) DEFAULT NULL,
  `asi_size` int(11) DEFAULT NULL,
  `asi_size_meu_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset_size`
--

INSERT INTO `asset_size` (`asi_id`, `asi_description`, `mec_id`, `meu_id`, `asi_photo_url`, `asi_quantity`, `asi_width`, `asi_length`, `asi_printable_width`, `asi_printable_length`, `asi_page_trim_width`, `asi_notes`, `asi_page_trim_length`, `asi_frequency`, `asi_frequency_meu_id`, `asi_size`, `asi_size_meu_id`) VALUES
(26, '4 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/4_sheet.gif', NULL, 40.000, 60.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, ' 6 Sheet (Bus Stop Poster)', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/6_sheet.gif', NULL, 200.000, 100.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '12 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/12_sheet.gif', NULL, 120.000, 60.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '16 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/16_sheet.gif', NULL, 80.000, 120.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '32 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/32_sheet.gif', NULL, 160.000, 120.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '48 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/48_sheet.gif', NULL, 240.000, 120.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '64 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/64_sheet.gif', NULL, 320.000, 120.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '96 Sheet', 8, 11, 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/96_sheet.gif', NULL, 480.000, 120.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'A0', 1, 13, NULL, NULL, 1189.000, 841.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'A1', 1, 13, NULL, NULL, 841.000, 594.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'A2', 1, 13, NULL, NULL, 594.000, 420.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'A0', 2, 11, NULL, NULL, 84.000, 24.000, 80.500, 21.250, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'A0', 3, 11, NULL, NULL, 84.000, 24.000, 80.500, 21.250, NULL, NULL, NULL, NULL, NULL, 10, 1),
(39, 'A1', 3, 11, NULL, NULL, 84.000, 24.000, 80.500, 21.250, NULL, NULL, NULL, NULL, NULL, 15, 1),
(40, 'A2', 3, 11, NULL, NULL, 84.000, 24.000, 80.500, 21.250, NULL, NULL, NULL, NULL, NULL, 30, 1),
(41, 'A0', 4, 11, NULL, NULL, 425.000, 500.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'A1', 4, 11, NULL, NULL, 808.000, 646.950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'A2', 4, 11, NULL, NULL, 47.500, 68.500, 46.000, 67.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'A0', 5, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(45, 'A1', 5, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(46, 'A2', 5, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(47, 'B0', 5, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(48, 'B1', 5, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(49, 'B2', 5, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(50, 'A0', 6, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'A1', 6, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'A0', 7, 11, NULL, NULL, 24.000, 12.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(53, 'A1', 7, 11, NULL, NULL, 24.000, 12.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(54, 'B0', 7, 11, NULL, NULL, 40.000, 10.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(55, 'B1', 7, 11, NULL, NULL, 40.000, 10.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(56, 'A0', 8, 11, NULL, NULL, 24.000, 12.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'A1', 8, 11, NULL, NULL, 40.000, 10.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'A2', 8, 11, NULL, NULL, 48.000, 14.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'A0', 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(60, 'A1', 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(61, 'A2', 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(62, 'A0', 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(63, 'A1', 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(64, 'A2', 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(65, 'GQ - Double Page Spread', 11, 13, NULL, NULL, 297.000, 210.000, 294.000, 207.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Huisgenoot - Full Page', 11, 13, NULL, NULL, 148.000, 210.000, 145.000, 207.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'You - Half Page Horizontal', 11, 13, NULL, NULL, 141.000, 100.000, 138.000, 97.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Cosmo - Half Page Vertical', 11, 13, NULL, NULL, 70.000, 204.000, 67.000, 201.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Cosmo - 1/4 page', 11, 13, NULL, NULL, 70.000, 100.000, 67.000, 97.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Cosmo - 1/4 page horizontal', 11, 13, NULL, NULL, 141.000, 50.000, 138.000, 47.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '1/2 page horizontal', 12, 11, NULL, NULL, 6.000, 10.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Full page', 12, 11, NULL, NULL, 12.500, 10.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, '1/2 page vertical', 12, 11, NULL, NULL, 10.000, 6.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '1/4 page vertical', 12, 11, NULL, NULL, 8.000, 3.750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '1/8 page vertical', 12, 11, NULL, NULL, 4.000, 3.750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '1/4 page horizontal', 12, 11, NULL, NULL, 10.000, 3.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '1/3 page horizontal', 12, 11, NULL, NULL, 10.000, 3.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '1/6 page vertical', 12, 11, NULL, NULL, 3.750, 6.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '1/3 page vertical', 12, 11, NULL, NULL, 5.750, 7.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, '1/6 page horizontal', 12, 11, NULL, NULL, 5.750, 4.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'very small advert', 12, 11, NULL, NULL, 1.873, 1.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'A0', 15, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(84, 'A1', 15, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(85, 'A2', 15, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(86, 'B0', 15, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(87, 'B1', 15, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(88, 'B2', 15, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(89, 'A0', 16, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'A1', 16, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '5 FM - Morning News', 22, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(92, 'Kaya FM - Morning normal', 22, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(93, 'Highveld - Afternoon normal', 22, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(94, 'Highveld - Afternoon traffic', 22, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 1),
(95, 'Mnet - morning', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(96, 'Mnet - afternoon normal', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(97, 'Mnet - afternoon prime', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(98, 'Mnet - 8 o''clock news', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 1),
(99, 'Mnet - late night', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 1),
(100, 'SABC - morning', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(101, 'SABC - afternoon normal', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(102, 'SABC - afternoon prime', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(103, 'SABC - 8 o''clock news', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 1),
(104, 'Sport A', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(105, 'Sport B', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1),
(106, 'Sport C', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(107, 'Sport D', 23, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 1),
(108, 'A0', 24, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(109, 'A1', 24, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(110, 'A2', 24, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(111, 'B0', 24, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(112, 'B1', 24, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(113, 'B2', 24, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1),
(114, 'A0', 25, 13, NULL, NULL, 297.000, 210.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'A1', 25, 13, NULL, NULL, 400.000, 300.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_type`
--

CREATE TABLE `asset_type` (
`ast_id` smallint(6) NOT NULL,
  `ast_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset_type`
--

INSERT INTO `asset_type` (`ast_id`, `ast_description`) VALUES
(4, 'Traditional - Outdoor'),
(5, 'Traditional - Indoor'),
(6, 'Digital - Outdoor'),
(7, 'Digital - Indoor');

-- --------------------------------------------------------

--
-- Table structure for table `assssssetsi`
--

CREATE TABLE `assssssetsi` (
`ass_id` smallint(6) NOT NULL,
  `ass_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assssssetsi`
--

INSERT INTO `assssssetsi` (`ass_id`, `ass_desc`) VALUES
(27, '-26.067732,27.935486'),
(28, '-26.066344,27.95042'),
(31, '-26.076058,27.931023'),
(32, '-26.071432,27.941494'),
(33, '-26.048147,27.918835'),
(34, '-26.07807,27.942867'),
(35, '-26.064501,27.925529'),
(36, '-26.043682,27.936344'),
(37, '-26.005272,27.946301');

-- --------------------------------------------------------

--
-- Table structure for table `auccounter`
--

CREATE TABLE `auccounter` (
  `auction_id` int(11) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
`id` int(32) NOT NULL,
  `use_id` int(32) DEFAULT NULL,
  `title` varchar(70) DEFAULT NULL,
  `subtitle` varchar(70) DEFAULT NULL,
  `starts` varchar(25) DEFAULT NULL,
  `description` text,
  `pict_url` tinytext,
  `category` int(11) DEFAULT NULL,
  `secondcat` int(11) DEFAULT NULL,
  `minimum_bid` double(16,2) DEFAULT '0.00',
  `shipping_cost` double(16,2) DEFAULT '0.00',
  `reserve_price` double(16,2) DEFAULT '0.00',
  `buy_now` double(16,2) DEFAULT '0.00',
  `auction_type` char(1) DEFAULT NULL,
  `duration` varchar(7) DEFAULT NULL,
  `increment` double(8,2) NOT NULL DEFAULT '1.00',
  `shipping` char(1) DEFAULT NULL,
  `payment` tinytext,
  `international` char(1) DEFAULT NULL,
  `ends` varchar(25) DEFAULT NULL,
  `current_bid` double(16,2) DEFAULT '0.00',
  `closed` char(2) DEFAULT NULL,
  `photo_uploaded` tinyint(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `suspended` int(1) DEFAULT '0',
  `relist` int(11) NOT NULL DEFAULT '0',
  `relisted` int(11) NOT NULL DEFAULT '0',
  `num_bids` int(11) NOT NULL DEFAULT '0',
  `sold` enum('y','n','s') NOT NULL DEFAULT 'n',
  `shipping_terms` tinytext NOT NULL,
  `bn_only` enum('y','n') NOT NULL DEFAULT 'n',
  `bold` enum('y','n') NOT NULL DEFAULT 'n',
  `highlighted` enum('y','n') NOT NULL DEFAULT 'n',
  `featured` enum('y','n') NOT NULL DEFAULT 'n',
  `current_fee` double(16,2) DEFAULT '0.00',
  `ass_id` smallint(6) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auctions`
--

INSERT INTO `auctions` (`id`, `use_id`, `title`, `subtitle`, `starts`, `description`, `pict_url`, `category`, `secondcat`, `minimum_bid`, `shipping_cost`, `reserve_price`, `buy_now`, `auction_type`, `duration`, `increment`, `shipping`, `payment`, `international`, `ends`, `current_bid`, `closed`, `photo_uploaded`, `quantity`, `suspended`, `relist`, `relisted`, `num_bids`, `sold`, `shipping_terms`, `bn_only`, `bold`, `highlighted`, `featured`, `current_fee`, `ass_id`, `status`) VALUES
(1, 5, 'Sadza', 'Testing', '2014-08-20 00:00:00', '\r\n\r\nefgter\r\n', '', 0, 0, 0.99, 0.00, 0.00, 3500.00, '1', '1', 50.00, '1', '0, 1', '0', '2014-08-31 23:00:00', 3500.00, '0', 1, 1, 0, 1, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 1, 1),
(2, 5, 'Test1', 'Test1', '2014-08-20 00:00:00', '<p>\r\n	test</p>\r\n', '', 205, 0, 0.99, 0.00, 0.00, 0.00, '1', '1', 0.00, '1', '0, 1', '0', '2014-08-31 23:00:00', 5.00, '0', 1, 1, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 2, 1),
(3, 5, '', '', '2014-08-20 00:00:00', NULL, NULL, NULL, NULL, 0.01, NULL, NULL, NULL, '1', '2', 0.00, NULL, NULL, NULL, '2014-08-31 23:00:00', NULL, '0', NULL, NULL, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 4, 1),
(4, 5, 'My Asset 1', 'My Asset 1', '2014-08-20 00:00:00', NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '1', '2', 0.00, NULL, NULL, NULL, '2014-08-31 23:00:00', 12000.00, '0', NULL, NULL, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 3, 9),
(5, 5, 'My First Auction Title', 'My First Auction Title', '2014-08-20 00:00:00', NULL, NULL, NULL, NULL, 200.00, NULL, NULL, 500.00, '1', '7', 100.00, NULL, NULL, NULL, '2014-08-31 23:00:00', 1000.00, NULL, NULL, 2, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 5, 1),
(7, 5, 'My Asset 1', 'My Asset 1', '2014-08-20 00:00:00', NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '7', 0.00, NULL, NULL, NULL, '2014-08-31 23:00:00', 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 6, 1),
(8, 5, 'My Asset 1 (REF 001)', 'My Asset 1 (REF 001)', '2015-03-09', NULL, NULL, NULL, NULL, 500.00, 0.00, 0.00, 5000.00, '1', '1', 100.00, NULL, NULL, NULL, '2015-03-23', 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 1, 0),
(9, 5, 'My Asset 15 (REF 015)', 'My Asset 15 (REF 015)', '2015-03-09', NULL, NULL, NULL, NULL, 1500.00, 0.00, 0.00, 35000.00, '1', '1', 500.00, NULL, NULL, NULL, '2015-03-23', 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 12, 0),
(10, 5, 'My Asset 2 (REF 002)', 'My Asset 2 (REF 002)', '2015-03-09', NULL, NULL, NULL, NULL, 2000.00, 0.00, 0.00, 25000.00, '1', '1', 250.00, NULL, NULL, NULL, '2015-03-23', 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 'n', '', 'n', 'n', 'n', 'n', 0.00, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auction_rooms`
--

CREATE TABLE `auction_rooms` (
`id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `location_latitude` varchar(50) DEFAULT NULL,
  `location_longitude` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('gif','jpg','png','swf') DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sponsortext` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `purchased` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bannerscategories`
--

CREATE TABLE `bannerscategories` (
  `banner` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bannerskeywords`
--

CREATE TABLE `bannerskeywords` (
  `banner` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bannersstats`
--

CREATE TABLE `bannersstats` (
  `banner` int(11) DEFAULT NULL,
  `purchased` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bannersusers`
--

CREATE TABLE `bannersusers` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bidder`
--

CREATE TABLE `bidder` (
`bdd_id` smallint(6) NOT NULL,
  `bid_id` smallint(6) DEFAULT NULL,
  `bls_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
`id` int(11) NOT NULL,
  `auction` int(32) DEFAULT NULL,
  `bidder` int(32) DEFAULT NULL,
  `bid` double(16,2) DEFAULT '0.00',
  `bidwhen` varchar(25) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `winner` int(6) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `ass_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `auction`, `bidder`, `bid`, `bidwhen`, `quantity`, `winner`, `status`, `ass_id`) VALUES
(1, 1, 5, 100.00, '2014-08-12 22:55', 1, 0, 1, NULL),
(2, 1, 5, 200.00, '2014-08-12 23:18:10', 1, 0, 1, NULL),
(3, 1, 5, 250.00, '2014-08-13 11:07:04', 1, 0, 1, NULL),
(4, 1, 5, 0.00, '2014-08-16 19:18:53', 1, 0, 1, NULL),
(5, 1, 5, 0.00, '2014-08-16 19:20:01', 1, 0, 1, NULL),
(6, 1, 5, 0.00, '2014-08-16 19:21:37', 1, 0, 1, NULL),
(7, 1, 5, 200.00, '2014-08-18 13:59:30', 1, 0, 1, NULL),
(8, 1, 5, 300.00, '2014-08-18 14:21:53', 1, 0, 1, NULL),
(9, 1, 5, 300.00, '2014-08-18 14:23:07', 1, 0, 1, NULL),
(10, 1, 5, 320.00, '2014-08-18 14:28:02', 1, 0, 1, NULL),
(11, 1, 5, 320.00, '2014-08-18 14:29:05', 1, 0, 1, NULL),
(12, 1, 5, 330.00, '2014-08-18 14:32:48', 1, 5, 1, NULL),
(13, 0, 5, 0.00, '2014-08-22 23:06:26', 1, 0, 1, NULL),
(14, 0, 5, 0.00, '2014-08-22 23:08:05', 1, 0, 1, NULL),
(15, 0, 5, 201.00, '2014-08-22 23:10:11', 1, 0, 1, NULL),
(16, 0, 5, 201.00, '2014-08-22 23:14:29', 1, 0, 1, NULL),
(17, 0, 5, 201.00, '2014-08-22 23:15:20', 1, 0, 1, NULL),
(18, 5, 5, 201.00, '2014-08-22 23:16:01', 1, 0, 1, NULL),
(19, 5, 5, 301.00, '2014-08-22 23:33:12', 1, 0, 1, NULL),
(20, 2, 5, 1.00, '2014-08-24 18:38:26', 1, 0, 1, NULL),
(21, 0, 5, 0.00, '2014-08-25 00:35:22', 1, 0, 1, NULL),
(22, 0, 5, 0.00, '2014-08-25 00:50:16', 1, 0, 1, NULL),
(23, 2, 5, 2.00, '2014-08-25 01:14:55', 1, 0, 1, NULL),
(24, 2, 5, 3.00, '2014-08-25 15:01:34', 1, 0, 1, NULL),
(25, 0, 5, 100.00, '2014-08-25 16:30:42', 1, 0, 1, NULL),
(26, 2, 5, 5.00, '2014-08-27 11:45:17', 1, 0, 1, NULL),
(27, 0, 6, 0.00, '2014-12-14 01:17:48', 1, 0, 1, NULL),
(28, 0, 6, 25200.00, '2014-12-14 01:19:34', 1, 0, 1, NULL),
(29, 0, 6, 25000.00, '2014-12-14 22:24:20', 1, 0, 1, NULL),
(30, 0, 6, 0.00, '2014-12-15 19:27:32', 1, 0, 1, NULL),
(31, 0, 6, 5525.00, '2014-12-15 19:28:00', 1, 0, 1, NULL),
(32, 1, 6, 37500.00, '2014-12-16 22:37:48', 1, 0, 1, NULL),
(33, 5, 6, 401.00, '2014-12-17 00:20:51', 1, 0, 1, NULL),
(34, 0, 6, 129.00, '2014-12-18 09:43:18', 1, 0, 1, NULL),
(35, 0, 6, 100.00, '2014-12-18 18:50:39', 1, 0, 1, NULL),
(36, 7, 6, 0.00, '2014-12-18 20:37:29', 1, 0, 1, NULL),
(37, 0, 6, 500.00, '2014-12-18 20:54:37', 1, 0, 1, NULL),
(38, 5, 6, 600.00, '2014-12-18 21:09:13', 1, 0, 1, NULL),
(39, 0, 6, 552.00, '2014-12-18 21:12:17', 1, 0, 1, NULL),
(40, 1, 6, 40000.00, '2014-12-18 21:14:02', 1, 0, 1, NULL),
(41, 1, 6, 250.00, '2014-12-18 22:00:03', 1, 0, 1, NULL),
(42, 0, 6, 800.00, '2014-12-19 13:24:37', 1, 0, 1, NULL),
(43, 5, 6, 800.00, '2014-12-19 13:26:06', 1, 0, 1, NULL),
(44, 5, 6, 1000.00, '2014-12-19 13:26:37', 1, 0, 1, NULL),
(45, 5, 5, 12000.00, '2014-12-19 13:26:37', 1, 0, 1, NULL),
(46, 0, 6, 12100.00, '2014-12-21 16:55:35', 1, 0, 1, NULL),
(47, 0, 6, 23000.00, '2015-01-13 13:50:29', 1, 0, 1, NULL),
(48, 1, 6, 3500.00, '2015-01-13 13:51:50', 1, 0, 1, NULL),
(49, 0, 6, 23000.00, '2015-01-13 13:55:02', 1, 0, 1, NULL),
(50, 0, 5, 0.00, '2015-02-09 00:49:11', 1, 0, 1, NULL),
(51, 0, 5, 0.00, '2015-02-09 09:18:08', 1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_category`
--

CREATE TABLE `billing_category` (
`bil_id` smallint(6) NOT NULL,
  `bil_description` varchar(45) DEFAULT NULL COMMENT 'values: prime/non prime'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing_status`
--

CREATE TABLE `billing_status` (
`bis_id` smallint(6) NOT NULL,
  `bis_start_date` datetime DEFAULT NULL,
  `bis_end_date` datetime DEFAULT NULL,
  `bil_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_status`
--

CREATE TABLE `blocked_status` (
`bls_id` smallint(6) NOT NULL,
  `bls_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

CREATE TABLE `booking_status` (
`bos_id` smallint(6) NOT NULL,
  `bos_code` varchar(255) DEFAULT NULL,
  `bos_authorization_required` tinyint(4) DEFAULT NULL,
  `bos_update_authorization` tinyint(4) DEFAULT NULL,
  `bst_id` smallint(6) DEFAULT NULL COMMENT 'FK : booking_status_type',
  `bos_form_editable` tinyint(4) DEFAULT NULL,
  `bos_import_code` varchar(255) DEFAULT NULL,
  `bos_validate_status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_status_type`
--

CREATE TABLE `booking_status_type` (
`bst_id` smallint(6) NOT NULL,
  `bst_description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
`cam_id` smallint(6) NOT NULL,
  `cam_requested_start_date` date DEFAULT NULL,
  `cam_requested_end_date` date DEFAULT NULL,
  `cam_title` varchar(255) DEFAULT NULL,
  `cam_budget` float DEFAULT NULL,
  `cam_requested_response_date` date DEFAULT NULL,
  `cam_description` varchar(1000) DEFAULT NULL,
  `adv_id` smallint(6) DEFAULT NULL,
  `cas_id` smallint(6) DEFAULT NULL COMMENT 'FK to the campaign status table',
  `cam_number` varchar(255) DEFAULT NULL,
  `cab_id` smallint(6) DEFAULT NULL COMMENT 'FK to the campaign budget table',
  `cam_order_number` int(11) DEFAULT NULL,
  `cur_id` smallint(6) DEFAULT NULL COMMENT 'FK: currency ',
  `cam_risk_limit` float DEFAULT NULL,
  `cam_current_risk` float DEFAULT NULL,
  `cst_id` smallint(6) DEFAULT NULL COMMENT 'FK: campaign_source_type',
  `cam_partial_availability_status` tinyint(4) DEFAULT NULL,
  `cam_creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cam_status` smallint(6) unsigned zerofill NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2028 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`cam_id`, `cam_requested_start_date`, `cam_requested_end_date`, `cam_title`, `cam_budget`, `cam_requested_response_date`, `cam_description`, `adv_id`, `cas_id`, `cam_number`, `cab_id`, `cam_order_number`, `cur_id`, `cam_risk_limit`, `cam_current_risk`, `cst_id`, `cam_partial_availability_status`, `cam_creation_date`, `cam_status`) VALUES
(70, '2014-10-25', '2014-10-25', 'indigo test', 450000, '2014-11-23', 'indigo test', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-11-08 08:25:26', 000001),
(73, '2014-01-01', '2014-01-05', 'hgjhgc', 10000000, '2014-01-06', 'Test', 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-11-13 14:51:59', 000001),
(74, '2014-10-17', '2014-12-11', 'Assignment resource document upload test', 40000, '2014-12-12', 'rffrfr', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-10-24 22:03:23', 000001),
(75, '2014-10-22', '2014-12-19', 'cool, outgoing dude willig to chill with someone', 5000000, '2014-10-24', 'dcdc', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-10-29 21:36:19', 000001),
(76, '2014-10-01', '2014-10-31', 'testing123', 25000, '2014-10-31', 'kb,mb', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-11-22 05:58:04', 000001),
(77, '2014-10-21', '2014-10-22', 'kbvnbv', 20000, '2014-10-24', 'testing', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-10-21 09:12:04', 000000),
(78, '2014-11-14', '2015-01-16', 'cool, outgoing dude willig to chill with someone', 5000000, '2014-11-28', 'dedede', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-11-12 05:26:46', 000000),
(79, '2014-11-18', '2014-11-12', 'kjhv', 55, '2014-11-27', 'hgjhgf', 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-11-13 14:38:13', 000000),
(80, '2015-01-01', '2015-01-31', 'Clientelle Legal', 500000, '2014-12-29', 'The new Clientelle Legal scheme for domestic employees', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-04 11:27:55', 000001),
(81, '2014-12-01', '2015-01-31', 'Test Campaign 2', 350000, '2015-01-31', 'description description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-12-31 22:01:39', 000000),
(82, '2015-01-01', '2015-02-28', 'Test Campaign 4', 45000, '2015-01-05', 'yrdy', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2014-12-31 22:01:27', 000000),
(83, '0000-00-00', '0000-00-00', 'tst', 200000, '0000-00-00', 'mhkjhvjhgv', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-03 06:03:57', 000000),
(113, '2015-01-01', '2015-02-28', 'Audi Ad Campaign', 150000, '2015-01-10', 'Audi Ad Campaign description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-04 20:05:46', 000000),
(129, '0000-00-00', '0000-00-00', '0', 20000, '0000-00-00', '0', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-04 20:05:31', 000000),
(130, '2015-01-01', '2015-02-28', 'BMW Ad Campaign', 135000, '2015-01-10', 'BMW Ad Campaign description', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-04 21:05:39', 000000),
(131, '2015-01-01', '2015-02-28', 'BMW Ad Campaign', 135000, '2015-01-10', 'BMW Ad Campaign description', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-04 21:05:31', 000000),
(132, '2015-01-31', '2015-02-28', 'Indigo Jan Ad', 100000, '2015-01-31', 'jhbkjvmnv', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-07 12:07:25', 000000),
(133, '2015-01-01', '2015-01-31', 'Samsung Galaxy Note 4', 250000, '2015-01-12', 'Samsung Galaxy Note 4', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-09 19:09:15', 000000),
(149, '2015-01-01', '2015-01-31', 'The new Chevrolet Adam', 250000, '2015-01-12', 'The new Chevrolet Adam is coming', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-09 20:10:03', 000000),
(150, '2015-01-12', '2015-01-05', 'Huwawei Ascend P7 Jan 2015', 125000, '2015-02-28', 'Introducing the new Huwawei Ascend P7 - Jan 2015', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-10 14:07:53', 000001),
(151, '2015-02-01', '2015-02-28', 'KFC Crushers', 200000, '2015-01-21', 'Launching a new product', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-13 09:13:44', 000000),
(152, '2015-01-14', '2015-01-15', 'hgfdghf', 10000, '2015-01-01', 'asdfasdfa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-14 05:14:38', 000000),
(153, '0000-00-00', '0000-00-00', 'kjnkbknb', 20000, '0000-00-00', 'jhkjhgvkjhgvjh', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-14 07:14:18', 000000),
(154, '2015-01-17', '2015-01-31', 'wer', 111111, '2015-01-31', 'kfc product launch\n', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-14 10:14:46', 000000),
(155, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-28 08:11:27', 000000),
(156, '2015-01-30', '2015-01-31', 'This is the title of the campaign', 125000, '2015-01-29', 'This is a description for the operator', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-01-28 08:12:20', 000000),
(157, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 18:00:10', 000000),
(158, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 18:00:14', 000000),
(159, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 18:07:01', 000000),
(160, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 19:49:10', 000000),
(161, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 19:57:44', 000000),
(162, '2015-03-02', '2015-03-27', 'Samsung Galaxy Note 4', 350000, '2015-02-08', 'Samsung Galaxy Note 4', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:00:30', 000000),
(163, '2015-03-02', '2015-03-27', 'Samsung Galaxy Note 4', 350000, '2015-02-08', 'Samsung Galaxy Note 4', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:02:52', 000000),
(164, '2015-03-02', '2015-03-27', 'Samsung Galaxy Note 4', 350000, '2015-02-08', 'Samsung Galaxy Note 4', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:04:37', 000000),
(165, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:04:41', 000000),
(166, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:04:42', 000000),
(167, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:04:59', 000000),
(168, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:00', 000000),
(169, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:03', 000000),
(170, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:04', 000000),
(171, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:05', 000000),
(172, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:06', 000000),
(173, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:10', 000000),
(174, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:11', 000000),
(175, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:12', 000000),
(176, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-02 20:05:13', 000000),
(177, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-03 04:28:48', 000000),
(178, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-03 04:29:22', 000000),
(179, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-03 04:47:24', 000000),
(180, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-13 09:00:56', 000000),
(181, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-13 10:47:38', 000000),
(182, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-14 14:26:58', 000000),
(183, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-14 14:36:15', 000000),
(184, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-14 14:59:22', 000000),
(185, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-14 15:16:26', 000000),
(186, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-14 15:37:39', 000000),
(187, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-18 20:22:11', 000000),
(188, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-02-26 04:43:29', 000000),
(189, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 16:12:24', 000000),
(190, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 16:12:34', 000000),
(191, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 16:12:34', 000000),
(192, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 16:12:46', 000000),
(193, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:01', 000000),
(194, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:02', 000000),
(195, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:24', 000000),
(196, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:25', 000000),
(197, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:39', 000000),
(198, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:40', 000000),
(199, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:43', 000000),
(200, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:44', 000000),
(201, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:46', 000000),
(202, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:19:47', 000000),
(203, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:20:08', 000000),
(204, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:20:09', 000000),
(205, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:20:10', 000000),
(206, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-02 20:20:11', 000000),
(207, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-03 12:14:06', 000000),
(208, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:30:26', 000000),
(209, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:30:45', 000000),
(210, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:30:58', 000000),
(211, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:30:58', 000000),
(212, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:31:09', 000000),
(213, '0000-00-00', '0000-00-00', '', 3, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:31:09', 000000),
(214, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:31:27', 000000),
(215, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:37:59', 000000),
(216, '2015-03-08', '2015-03-14', 'Josh''s title', 958000, '2015-03-07', 'This is a note to the operator', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:38:51', 000000),
(217, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:38:53', 000000),
(218, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:38:53', 000000),
(219, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:14', 000000),
(220, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:24', 000000),
(221, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:24', 000000),
(222, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:29', 000000),
(223, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:29', 000000),
(224, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:45', 000000),
(225, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:39:45', 000000),
(226, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:54:40', 000000),
(227, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:54:41', 000000),
(228, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:55:35', 000000),
(229, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:55:35', 000000),
(230, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:56:27', 000000),
(231, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:56:28', 000000),
(232, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:56:41', 000000),
(233, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:56:42', 000000),
(234, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:02', 000000),
(235, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:02', 000000),
(236, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:21', 000000),
(237, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:21', 000000),
(238, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:31', 000000),
(239, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:31', 000000),
(240, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:42', 000000),
(241, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:57:42', 000000),
(242, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:15', 000000),
(243, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:15', 000000),
(244, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:22', 000000),
(245, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:22', 000000),
(246, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:30', 000000),
(247, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:30', 000000),
(248, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:38', 000000),
(249, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:38', 000000),
(250, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:46', 000000),
(251, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:58:46', 000000),
(252, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:59:04', 000000),
(253, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 17:59:04', 000000),
(254, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:00:19', 000000),
(255, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:00:19', 000000),
(256, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:00:44', 000000),
(257, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:00:44', 000000),
(258, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:01:03', 000000),
(259, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:01:03', 000000),
(260, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:02:14', 000000),
(261, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:02:14', 000000),
(262, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:02:45', 000000),
(263, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:02:45', 000000),
(264, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:02:56', 000000),
(265, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:02:56', 000000),
(266, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:12:31', 000000),
(267, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-04 18:12:36', 000000),
(268, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:22:52', 000000),
(269, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:24:31', 000000),
(270, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:24:31', 000000),
(271, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:24:36', 000000),
(272, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:24:36', 000000),
(273, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:24:57', 000000),
(274, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:24:57', 000000),
(275, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:26:23', 000000),
(276, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:26:23', 000000),
(277, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:30:16', 000000),
(278, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:30:16', 000000),
(279, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:31:59', 000000),
(280, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:31:59', 000000),
(281, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:32:34', 000000),
(282, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:32:34', 000000),
(283, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:32:47', 000000),
(284, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:32:47', 000000),
(285, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:33:07', 000000),
(286, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:33:07', 000000),
(287, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:33:22', 000000),
(288, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:33:22', 000000),
(289, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:33:24', 000000),
(290, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:33:25', 000000),
(291, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:34:53', 000000),
(292, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:34:53', 000000),
(293, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:35:20', 000000),
(294, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:35:20', 000000),
(295, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:35:54', 000000),
(296, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:35:54', 000000),
(297, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:36:25', 000000),
(298, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:36:25', 000000),
(299, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:38:49', 000000),
(300, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:38:49', 000000),
(301, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:41:54', 000000),
(302, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 13:41:54', 000000),
(303, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:12:56', 000000),
(304, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:12:56', 000000),
(305, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:13:43', 000000),
(306, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:13:43', 000000),
(307, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:16:57', 000000),
(308, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:16:57', 000000),
(309, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:20:55', 000000),
(310, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:20:55', 000000),
(311, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:22:29', 000000),
(312, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:22:29', 000000),
(313, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:22:35', 000000),
(314, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:22:35', 000000),
(315, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:24:32', 000000),
(316, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:24:32', 000000),
(317, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:25:05', 000000),
(318, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:25:05', 000000),
(319, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:25:09', 000000),
(320, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:25:10', 000000),
(321, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:26:22', 000000),
(322, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:26:22', 000000),
(323, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:26:38', 000000),
(324, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:26:38', 000000),
(325, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:28:44', 000000),
(326, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:28:44', 000000),
(327, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:29:31', 000000),
(328, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:29:31', 000000),
(329, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:31:49', 000000),
(330, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:31:49', 000000),
(331, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:03', 000000),
(332, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:03', 000000),
(333, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:13', 000000),
(334, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:13', 000000),
(335, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:39', 000000),
(336, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:39', 000000),
(337, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:41', 000000),
(338, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:34:41', 000000),
(339, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:35:46', 000000),
(340, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:35:46', 000000),
(341, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:36:31', 000000),
(342, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:36:31', 000000),
(343, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:36:36', 000000),
(344, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:36:36', 000000),
(345, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:36:45', 000000),
(346, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:36:46', 000000),
(347, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:11', 000000),
(348, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:11', 000000),
(349, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:16', 000000),
(350, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:16', 000000),
(351, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:25', 000000),
(352, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:25', 000000),
(353, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:39', 000000),
(354, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:39', 000000),
(355, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:56', 000000),
(356, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:37:56', 000000),
(357, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:38:06', 000000),
(358, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:38:06', 000000),
(359, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:38:27', 000000),
(360, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:38:27', 000000),
(361, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:44:56', 000000),
(362, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-05 15:44:56', 000000),
(363, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:19:57', 000000),
(364, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:20:45', 000000),
(365, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:20:45', 000000),
(366, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:20:58', 000000),
(367, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:20:58', 000000),
(368, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:24:16', 000000),
(369, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:24:16', 000000),
(370, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:35:06', 000000),
(371, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:35:06', 000000),
(372, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:35:23', 000000),
(373, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:35:23', 000000),
(374, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:35:26', 000000),
(375, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 14:35:26', 000000),
(376, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:45:45', 000000),
(377, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:47:18', 000000),
(378, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:50:24', 000000),
(379, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:50:37', 000000),
(380, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:51:32', 000000),
(381, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:51:35', 000000),
(382, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:51:44', 000000),
(383, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:51:48', 000000),
(384, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:56:09', 000000),
(385, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:56:12', 000000),
(386, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:56:34', 000000),
(387, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:56:34', 000000),
(388, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:56:39', 000000),
(389, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 16:56:39', 000000),
(390, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:03:01', 000000),
(391, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:03:01', 000000),
(392, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:06:00', 000000),
(393, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:06:00', 000000),
(394, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:17:03', 000000),
(395, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:17:03', 000000),
(396, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:19:13', 000000),
(397, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:19:13', 000000),
(398, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:20:52', 000000),
(399, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:20:52', 000000),
(400, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:21:22', 000000),
(401, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:21:22', 000000),
(402, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:22:55', 000000),
(403, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:22:55', 000000),
(404, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:22:58', 000000),
(405, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:22:58', 000000),
(406, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:23:12', 000000),
(407, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:23:12', 000000),
(408, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:24:01', 000000),
(409, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:24:01', 000000),
(410, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:24:51', 000000),
(411, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:24:51', 000000),
(412, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:25:11', 000000),
(413, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:25:11', 000000),
(414, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:25:29', 000000),
(415, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:25:29', 000000),
(416, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:26:39', 000000),
(417, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:26:39', 000000),
(418, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:27:08', 000000),
(419, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:27:08', 000000),
(420, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:27:27', 000000),
(421, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:27:27', 000000),
(422, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:29:17', 000000),
(423, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:29:17', 000000),
(424, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:35:53', 000000),
(425, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:35:53', 000000),
(426, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:23', 000000),
(427, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:23', 000000),
(428, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:27', 000000),
(429, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:27', 000000),
(430, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:30', 000000),
(431, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:31', 000000),
(432, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:33', 000000),
(433, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:36:33', 000000),
(434, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:38:25', 000000),
(435, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-08 17:38:25', 000000),
(436, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:09:57', 000000),
(437, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:09:57', 000000),
(438, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:10:09', 000000),
(439, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:13:45', 000000),
(440, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:13:45', 000000),
(441, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:15:37', 000000),
(442, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:15:37', 000000),
(443, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:19:57', 000000),
(444, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:19:58', 000000),
(445, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:20:42', 000000),
(446, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:20:42', 000000),
(447, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:22:48', 000000),
(448, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:22:48', 000000),
(449, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:26:25', 000000),
(450, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:26:25', 000000),
(451, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:26:33', 000000),
(452, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:26:33', 000000),
(453, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:26:46', 000000),
(454, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:26:47', 000000),
(455, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:31:25', 000000),
(456, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:31:26', 000000),
(457, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:33:56', 000000),
(458, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:33:56', 000000),
(459, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:35:03', 000000),
(460, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:35:03', 000000),
(461, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:37:00', 000000),
(462, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:37:01', 000000),
(463, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:37:14', 000000),
(464, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:37:15', 000000),
(465, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:40:24', 000000),
(466, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:40:25', 000000),
(467, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:43:22', 000000),
(468, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:43:22', 000000),
(469, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:44:00', 000000);
INSERT INTO `campaign` (`cam_id`, `cam_requested_start_date`, `cam_requested_end_date`, `cam_title`, `cam_budget`, `cam_requested_response_date`, `cam_description`, `adv_id`, `cas_id`, `cam_number`, `cab_id`, `cam_order_number`, `cur_id`, `cam_risk_limit`, `cam_current_risk`, `cst_id`, `cam_partial_availability_status`, `cam_creation_date`, `cam_status`) VALUES
(470, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:44:00', 000000),
(471, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:44:33', 000000),
(472, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:44:33', 000000),
(473, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:49:38', 000000),
(474, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:49:38', 000000),
(475, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:50:35', 000000),
(476, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:50:36', 000000),
(477, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:52:06', 000000),
(478, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:52:07', 000000),
(479, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:55:03', 000000),
(480, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:55:04', 000000),
(481, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:55:56', 000000),
(482, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:55:56', 000000),
(483, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:57:43', 000000),
(484, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:57:43', 000000),
(485, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:58:18', 000000),
(486, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:58:18', 000000),
(487, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:58:53', 000000),
(488, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:58:54', 000000),
(489, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:59:29', 000000),
(490, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 08:59:30', 000000),
(491, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:00:01', 000000),
(492, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:00:02', 000000),
(493, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:00:43', 000000),
(494, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:00:44', 000000),
(495, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:01:11', 000000),
(496, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:01:11', 000000),
(497, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:02:17', 000000),
(498, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:02:17', 000000),
(499, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:02:30', 000000),
(500, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:02:31', 000000),
(501, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:06:33', 000000),
(502, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:06:43', 000000),
(503, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 09:06:49', 000000),
(504, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-09 15:22:44', 000000),
(505, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 06:54:17', 000000),
(506, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 07:08:16', 000000),
(507, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 07:52:00', 000000),
(508, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 07:53:59', 000000),
(509, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 07:56:53', 000000),
(510, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:02:17', 000000),
(511, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:08:17', 000000),
(512, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:10:03', 000000),
(513, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:25:15', 000000),
(514, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:26:20', 000000),
(515, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:27:25', 000000),
(516, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:28:50', 000000),
(517, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:29:34', 000000),
(518, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:30:35', 000000),
(519, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:34:45', 000000),
(520, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:35:22', 000000),
(521, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:36:56', 000000),
(522, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:38:26', 000000),
(523, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:39:23', 000000),
(524, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:39:53', 000000),
(525, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:41:07', 000000),
(526, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:42:24', 000000),
(527, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 08:57:04', 000000),
(528, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:03:20', 000000),
(529, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:04:03', 000000),
(530, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:05:02', 000000),
(531, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:06:45', 000000),
(532, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:08:00', 000000),
(533, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:09:00', 000000),
(534, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:09:42', 000000),
(535, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 09:16:00', 000000),
(536, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 13:39:07', 000000),
(537, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 13:39:18', 000000),
(538, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 13:39:30', 000000),
(539, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 13:42:14', 000000),
(540, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 13:43:02', 000000),
(541, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 13:45:22', 000000),
(542, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:45:35', 000000),
(543, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:45:46', 000000),
(544, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:47:46', 000000),
(545, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:48:59', 000000),
(546, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:50:35', 000000),
(547, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:51:37', 000000),
(548, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:52:37', 000000),
(549, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:53:03', 000000),
(550, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:53:20', 000000),
(551, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:54:42', 000000),
(552, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:54:57', 000000),
(553, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:55:18', 000000),
(554, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:55:56', 000000),
(555, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:56:29', 000000),
(556, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 16:56:52', 000000),
(557, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 17:00:16', 000000),
(558, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 17:02:05', 000000),
(559, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 17:03:15', 000000),
(560, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:23:20', 000000),
(561, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:23:37', 000000),
(562, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:24:59', 000000),
(563, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:27:17', 000000),
(564, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:28:44', 000000),
(565, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:30:16', 000000),
(566, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:31:05', 000000),
(567, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:31:25', 000000),
(568, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:32:16', 000000),
(569, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:34:20', 000000),
(570, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:34:38', 000000),
(571, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:34:49', 000000),
(572, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:36:19', 000000),
(573, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:37:18', 000000),
(574, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:37:18', 000000),
(575, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:37:21', 000000),
(576, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:37:21', 000000),
(577, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:39:23', 000000),
(578, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:49:59', 000000),
(579, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:51:31', 000000),
(580, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:51:42', 000000),
(581, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:52:27', 000000),
(582, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:53:58', 000000),
(583, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:54:38', 000000),
(584, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:54:59', 000000),
(585, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:55:31', 000000),
(586, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:57:43', 000000),
(587, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 18:57:53', 000000),
(588, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:02:00', 000000),
(589, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:02:29', 000000),
(590, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:03:59', 000000),
(591, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:05:27', 000000),
(592, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:08:45', 000000),
(593, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:09:18', 000000),
(594, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:11:11', 000000),
(595, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:12:28', 000000),
(596, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:13:39', 000000),
(597, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:15:09', 000000),
(598, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:16:11', 000000),
(599, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:16:59', 000000),
(600, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:18:00', 000000),
(601, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:18:28', 000000),
(602, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:19:25', 000000),
(603, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:21:00', 000000),
(604, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:23:42', 000000),
(605, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:26:16', 000000),
(606, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:26:29', 000000),
(607, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:27:59', 000000),
(608, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:29:02', 000000),
(609, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:30:44', 000000),
(610, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:31:24', 000000),
(611, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:25', 000000),
(612, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:27', 000000),
(613, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:32', 000000),
(614, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:37', 000000),
(615, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:39', 000000),
(616, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:40', 000000),
(617, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:41', 000000),
(618, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:42', 000000),
(619, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:46', 000000),
(620, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:32:47', 000000),
(621, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:33:06', 000000),
(622, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:33:32', 000000),
(623, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:35:11', 000000),
(624, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:37:12', 000000),
(625, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:37:56', 000000),
(626, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:38:54', 000000),
(627, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:40:06', 000000),
(628, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:41:48', 000000),
(629, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:43:30', 000000),
(630, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:47:30', 000000),
(631, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:48:52', 000000),
(632, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:49:40', 000000),
(633, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:49:40', 000000),
(634, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:51:23', 000000),
(635, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:53:41', 000000),
(636, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:53:41', 000000),
(637, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:55:59', 000000),
(638, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:55:59', 000000),
(639, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:56:49', 000000),
(640, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:56:49', 000000),
(641, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:57:24', 000000),
(642, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 19:57:25', 000000),
(643, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:02:18', 000000),
(644, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:02:19', 000000),
(645, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:05:01', 000000),
(646, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:05:01', 000000),
(647, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:06:16', 000000),
(648, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:06:16', 000000),
(649, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:06:48', 000000),
(650, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:06:48', 000000),
(651, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:08:54', 000000),
(652, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:08:55', 000000),
(653, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:09:24', 000000),
(654, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:09:25', 000000),
(655, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:09:58', 000000),
(656, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:09:59', 000000),
(657, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:11:03', 000000),
(658, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:11:04', 000000),
(659, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:12:16', 000000),
(660, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:12:19', 000000),
(661, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:12:20', 000000),
(662, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:12:30', 000000),
(663, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:13:02', 000000),
(664, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:13:03', 000000),
(665, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:13:09', 000000),
(666, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:13:51', 000000),
(667, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:14:21', 000000),
(668, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:14:28', 000000),
(669, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:14:34', 000000),
(670, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:16:24', 000000),
(671, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:17:03', 000000),
(672, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:17:38', 000000),
(673, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:18:12', 000000),
(674, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:24:39', 000000),
(675, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:26:37', 000000),
(676, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:27:12', 000000),
(677, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:27:38', 000000),
(678, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:28:10', 000000),
(679, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:30:37', 000000),
(680, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:31:45', 000000),
(681, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:31:55', 000000),
(682, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:34:02', 000000),
(683, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:34:09', 000000),
(684, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:34:47', 000000),
(685, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:35:07', 000000),
(686, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:35:39', 000000),
(687, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:35:51', 000000),
(688, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:35:58', 000000),
(689, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:36:04', 000000),
(690, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:37:48', 000000),
(691, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:38:44', 000000),
(692, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:39:44', 000000),
(693, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:40:22', 000000),
(694, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:42:52', 000000),
(695, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:43:06', 000000),
(696, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:43:17', 000000),
(697, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:43:32', 000000),
(698, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:43:49', 000000),
(699, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:46:07', 000000),
(700, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:46:11', 000000),
(701, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:46:22', 000000),
(702, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:46:50', 000000),
(703, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:49:55', 000000),
(704, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:51:23', 000000),
(705, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:53:54', 000000),
(706, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:55:16', 000000),
(707, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:56:06', 000000),
(708, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:56:51', 000000),
(709, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 20:58:14', 000000),
(710, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 21:06:16', 000000),
(711, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-11 21:06:37', 000000),
(712, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 06:47:28', 000000),
(713, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 06:47:31', 000000),
(714, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 06:47:34', 000000),
(715, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 06:47:38', 000000),
(716, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 13:55:59', 000000),
(717, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 13:56:17', 000000),
(718, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 13:56:29', 000000),
(719, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 13:56:58', 000000),
(720, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:01:23', 000000),
(721, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:04:16', 000000),
(722, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:13:10', 000000),
(723, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:14:13', 000000),
(724, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:14:47', 000000),
(725, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:15:35', 000000),
(726, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:25:40', 000000),
(727, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 14:27:09', 000000),
(728, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 15:57:40', 000000),
(729, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:00:47', 000000),
(730, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:04:35', 000000),
(731, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:13:50', 000000),
(732, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:14:52', 000000),
(733, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:15:00', 000000),
(734, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:16:38', 000000),
(735, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:17:29', 000000),
(736, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:17:56', 000000),
(737, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:27:57', 000000),
(738, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:28:54', 000000),
(739, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:34:40', 000000),
(740, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-12 16:37:34', 000000),
(741, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:44:11', 000000),
(742, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:44:19', 000000),
(743, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:44:29', 000000),
(744, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:49:12', 000000),
(745, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:49:37', 000000),
(746, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:50:36', 000000),
(747, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:51:27', 000000),
(748, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-13 08:55:00', 000000),
(749, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-15 15:32:02', 000000),
(750, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-15 15:32:38', 000000),
(751, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 10:51:17', 000000),
(752, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 10:51:28', 000000),
(753, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 10:55:54', 000000),
(754, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 10:58:57', 000000),
(755, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:01:28', 000000),
(756, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:03:15', 000000),
(757, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:04:17', 000000),
(758, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:05:03', 000000),
(759, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:06:02', 000000),
(760, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:08:26', 000000),
(761, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:10:17', 000000),
(762, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:10:25', 000000),
(763, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:12:35', 000000),
(764, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:14:05', 000000),
(765, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:16:03', 000000),
(766, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:16:58', 000000),
(767, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:19:05', 000000),
(768, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:20:36', 000000),
(769, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:20:47', 000000),
(770, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:22:38', 000000),
(771, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:23:03', 000000),
(772, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:23:42', 000000),
(773, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:25:25', 000000),
(774, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:26:33', 000000),
(775, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:27:08', 000000),
(776, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:29:01', 000000),
(777, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:30:16', 000000),
(778, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:31:29', 000000),
(779, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:31:51', 000000),
(780, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:32:21', 000000),
(781, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 11:33:22', 000000),
(782, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:03:25', 000000),
(783, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:04:39', 000000),
(784, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:05:25', 000000),
(785, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:06:01', 000000),
(786, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:07:29', 000000),
(787, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:23:13', 000000),
(788, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:23:55', 000000),
(789, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:29:08', 000000),
(790, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:29:18', 000000),
(791, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:34:05', 000000),
(792, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:34:14', 000000),
(793, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:36:25', 000000),
(794, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:37:35', 000000),
(795, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:42:50', 000000),
(796, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:50:59', 000000),
(797, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:51:23', 000000),
(798, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:53:19', 000000),
(799, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:53:46', 000000),
(800, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:54:02', 000000),
(801, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:55:03', 000000),
(802, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:55:37', 000000),
(803, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:57:17', 000000),
(804, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 12:59:49', 000000),
(805, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 13:00:41', 000000),
(806, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 13:01:08', 000000),
(807, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 13:01:16', 000000),
(808, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 13:01:51', 000000),
(809, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 16:53:51', 000000),
(810, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 16:54:00', 000000),
(811, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 16:55:15', 000000),
(812, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 16:56:26', 000000),
(813, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:04:44', 000000),
(814, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:06:21', 000000),
(815, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:09:00', 000000),
(816, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:09:14', 000000);
INSERT INTO `campaign` (`cam_id`, `cam_requested_start_date`, `cam_requested_end_date`, `cam_title`, `cam_budget`, `cam_requested_response_date`, `cam_description`, `adv_id`, `cas_id`, `cam_number`, `cab_id`, `cam_order_number`, `cur_id`, `cam_risk_limit`, `cam_current_risk`, `cst_id`, `cam_partial_availability_status`, `cam_creation_date`, `cam_status`) VALUES
(817, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:10:34', 000000),
(818, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:11:15', 000000),
(819, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:12:03', 000000),
(820, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:12:19', 000000),
(821, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:13:03', 000000),
(822, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:13:25', 000000),
(823, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:14:45', 000000),
(824, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:15:19', 000000),
(825, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:15:43', 000000),
(826, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:17:17', 000000),
(827, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:37:57', 000000),
(828, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:38:59', 000000),
(829, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:39:35', 000000),
(830, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:42:31', 000000),
(831, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:42:49', 000000),
(832, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:43:46', 000000),
(833, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:44:29', 000000),
(834, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:45:14', 000000),
(835, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:46:48', 000000),
(836, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:47:24', 000000),
(837, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:47:30', 000000),
(838, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-16 17:48:31', 000000),
(839, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 13:54:15', 000000),
(840, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 13:54:22', 000000),
(841, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 13:56:33', 000000),
(842, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 13:58:48', 000000),
(843, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 13:59:42', 000000),
(844, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:00:43', 000000),
(845, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:10:44', 000000),
(846, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:11:22', 000000),
(847, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:11:42', 000000),
(848, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:13:58', 000000),
(849, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:16:04', 000000),
(850, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:20:04', 000000),
(851, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 14:28:03', 000000),
(852, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:35:16', 000000),
(853, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:35:26', 000000),
(854, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:35:41', 000000),
(855, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:35:50', 000000),
(856, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:43:10', 000000),
(857, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:44:06', 000000),
(858, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:46:10', 000000),
(859, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:47:37', 000000),
(860, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:48:06', 000000),
(861, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:48:36', 000000),
(862, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:48:58', 000000),
(863, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:50:39', 000000),
(864, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:52:03', 000000),
(865, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:54:31', 000000),
(866, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:55:32', 000000),
(867, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:57:01', 000000),
(868, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:57:44', 000000),
(869, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:58:29', 000000),
(870, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:59:10', 000000),
(871, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 17:59:47', 000000),
(872, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:00:24', 000000),
(873, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:00:37', 000000),
(874, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:01:15', 000000),
(875, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:06:14', 000000),
(876, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:06:46', 000000),
(877, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:08:33', 000000),
(878, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:08:55', 000000),
(879, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:10:05', 000000),
(880, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:11:40', 000000),
(881, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:13:50', 000000),
(882, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:15:12', 000000),
(883, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:16:59', 000000),
(884, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:17:16', 000000),
(885, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:18:09', 000000),
(886, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:21:29', 000000),
(887, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:23:27', 000000),
(888, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:24:47', 000000),
(889, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:27:21', 000000),
(890, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:29:41', 000000),
(891, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:30:32', 000000),
(892, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:30:39', 000000),
(893, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:33:51', 000000),
(894, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:37:56', 000000),
(895, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-17 18:39:17', 000000),
(896, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:14:46', 000000),
(897, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:15:17', 000000),
(898, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:17:25', 000000),
(899, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:18:02', 000000),
(900, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:20:53', 000000),
(901, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:21:43', 000000),
(902, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:22:42', 000000),
(903, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:23:16', 000000),
(904, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:24:24', 000000),
(905, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:24:34', 000000),
(906, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:25:07', 000000),
(907, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:25:41', 000000),
(908, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:26:58', 000000),
(909, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:29:25', 000000),
(910, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:29:59', 000000),
(911, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:33:11', 000000),
(912, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:33:50', 000000),
(913, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:34:36', 000000),
(914, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:36:01', 000000),
(915, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:36:52', 000000),
(916, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-18 14:37:24', 000000),
(917, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 03:52:56', 000000),
(918, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 03:53:15', 000000),
(919, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 04:52:20', 000000),
(920, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 04:54:57', 000000),
(921, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 08:26:19', 000000),
(922, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 08:26:22', 000000),
(923, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 08:26:53', 000000),
(924, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 16:36:53', 000000),
(925, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 16:37:02', 000000),
(926, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:04:19', 000000),
(927, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:05:01', 000000),
(928, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:05:20', 000000),
(929, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:06:33', 000000),
(930, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:05', 000000),
(931, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:05', 000000),
(932, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:11', 000000),
(933, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:11', 000000),
(934, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:18', 000000),
(935, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:18', 000000),
(936, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:24', 000000),
(937, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:24', 000000),
(938, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:27', 000000),
(939, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:27', 000000),
(940, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:28', 000000),
(941, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:08:28', 000000),
(942, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:10:22', 000000),
(943, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:10:22', 000000),
(944, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:21:14', 000000),
(945, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:21:14', 000000),
(946, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:21:35', 000000),
(947, '0000-00-00', '0000-00-00', '', 4, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:21:35', 000000),
(948, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:21:46', 000000),
(949, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:21:46', 000000),
(950, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:23:03', 000000),
(951, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:23:03', 000000),
(952, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:37:59', 000000),
(953, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:37:59', 000000),
(954, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:39:50', 000000),
(955, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:39:50', 000000),
(956, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:39:58', 000000),
(957, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:39:58', 000000),
(958, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:24', 000000),
(959, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:24', 000000),
(960, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:41', 000000),
(961, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:41', 000000),
(962, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:46', 000000),
(963, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:46', 000000),
(964, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:49', 000000),
(965, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:40:49', 000000),
(966, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:42:03', 000000),
(967, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 17:42:03', 000000),
(968, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:27:26', 000000),
(969, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:27:26', 000000),
(970, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:27:29', 000000),
(971, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:27:29', 000000),
(972, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:28:25', 000000),
(973, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:28:25', 000000),
(974, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:29:53', 000000),
(975, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:29:53', 000000),
(976, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:31:34', 000000),
(977, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:31:34', 000000),
(978, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:35:26', 000000),
(979, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-19 18:35:26', 000000),
(980, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:55:30', 000000),
(981, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:55:30', 000000),
(982, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:55:43', 000000),
(983, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:55:43', 000000),
(984, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:55:45', 000000),
(985, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:55:45', 000000),
(986, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:56:58', 000000),
(987, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:56:58', 000000),
(988, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:57:02', 000000),
(989, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 04:57:02', 000000),
(990, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:00:54', 000000),
(991, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:00:54', 000000),
(992, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:01:32', 000000),
(993, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:01:32', 000000),
(994, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:01:52', 000000),
(995, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:01:52', 000000),
(996, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:09:37', 000000),
(997, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:09:37', 000000),
(998, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:10:06', 000000),
(999, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:10:06', 000000),
(1000, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:10:33', 000000),
(1001, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:10:33', 000000),
(1002, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:11:00', 000000),
(1003, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:11:00', 000000),
(1004, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:26:02', 000000),
(1005, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:26:02', 000000),
(1006, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:26:10', 000000),
(1007, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:26:10', 000000),
(1008, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:29:14', 000000),
(1009, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 05:29:14', 000000),
(1010, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:10:53', 000000),
(1011, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:04', 000000),
(1012, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:12', 000000),
(1013, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:25', 000000),
(1014, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:25', 000000),
(1015, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:34', 000000),
(1016, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:34', 000000),
(1017, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:40', 000000),
(1018, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-20 11:11:40', 000000),
(1019, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 06:55:14', 000000),
(1020, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 06:55:14', 000000),
(1021, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 06:55:15', 000000),
(1022, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 06:55:15', 000000),
(1023, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 10:16:23', 000000),
(1024, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 10:16:23', 000000),
(1025, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 10:16:25', 000000),
(1026, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-21 10:16:25', 000000),
(1027, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 11:26:03', 000000),
(1028, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 11:26:03', 000000),
(1029, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 11:26:05', 000000),
(1030, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 11:26:05', 000000),
(1031, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:38:27', 000000),
(1032, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:38:27', 000000),
(1033, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:41:01', 000000),
(1034, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:41:01', 000000),
(1035, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:09', 000000),
(1036, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:11', 000000),
(1037, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:11', 000000),
(1038, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:12', 000000),
(1039, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:12', 000000),
(1040, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:15', 000000),
(1041, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:15', 000000),
(1042, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:24', 000000),
(1043, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:24', 000000),
(1044, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:42:54', 000000),
(1045, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:43:04', 000000),
(1046, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:44:21', 000000),
(1047, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:44:21', 000000),
(1048, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:45:24', 000000),
(1049, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:45:24', 000000),
(1050, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:45:44', 000000),
(1051, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:45:44', 000000),
(1052, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:46:28', 000000),
(1053, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:46:28', 000000),
(1054, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:47:43', 000000),
(1055, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:47:47', 000000),
(1056, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:47:47', 000000),
(1057, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:49:57', 000000),
(1058, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:49:57', 000000),
(1059, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:50:14', 000000),
(1060, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:50:14', 000000),
(1061, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:51:11', 000000),
(1062, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:51:11', 000000),
(1063, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:53:28', 000000),
(1064, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:53:28', 000000),
(1065, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:57:45', 000000),
(1066, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:57:45', 000000),
(1067, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:58:09', 000000),
(1068, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 12:58:09', 000000),
(1069, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:00:29', 000000),
(1070, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:00:29', 000000),
(1071, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:00:42', 000000),
(1072, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:00:42', 000000),
(1073, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:03:50', 000000),
(1074, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:03:50', 000000),
(1075, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:09:29', 000000),
(1076, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:09:30', 000000),
(1077, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:10:46', 000000),
(1078, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:10:46', 000000),
(1079, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:11:24', 000000),
(1080, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:11:24', 000000),
(1081, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:11:49', 000000),
(1082, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:11:49', 000000),
(1083, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:14:16', 000000),
(1084, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:14:16', 000000),
(1085, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:15:52', 000000),
(1086, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:15:52', 000000),
(1087, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:17:52', 000000),
(1088, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 13:17:52', 000000),
(1089, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 14:05:12', 000000),
(1090, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 14:05:12', 000000),
(1091, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:03:07', 000000),
(1092, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:03:07', 000000),
(1093, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:03:12', 000000),
(1094, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:03:12', 000000),
(1095, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:03:21', 000000),
(1096, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:03:21', 000000),
(1097, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:05:01', 000000),
(1098, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:05:01', 000000),
(1099, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:10:56', 000000),
(1100, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:10:56', 000000),
(1101, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:12:11', 000000),
(1102, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:12:11', 000000),
(1103, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:12:39', 000000),
(1104, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:12:39', 000000),
(1105, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:13:03', 000000),
(1106, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:13:03', 000000),
(1107, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:13:25', 000000),
(1108, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:13:25', 000000),
(1109, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:14:11', 000000),
(1110, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:14:11', 000000),
(1111, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:21:18', 000000),
(1112, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:21:18', 000000),
(1113, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:34:49', 000000),
(1114, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:34:49', 000000),
(1115, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:34:59', 000000),
(1116, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:34:59', 000000),
(1117, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:35:29', 000000),
(1118, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:35:29', 000000),
(1119, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:38:34', 000000),
(1120, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:38:34', 000000),
(1121, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:39:32', 000000),
(1122, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:39:32', 000000),
(1123, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:56:02', 000000),
(1124, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:56:02', 000000),
(1125, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:59:15', 000000),
(1126, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 18:59:15', 000000),
(1127, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:03:45', 000000),
(1128, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:03:45', 000000),
(1129, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:07:53', 000000),
(1130, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:07:53', 000000),
(1131, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:11:34', 000000),
(1132, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:11:34', 000000),
(1133, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:13:02', 000000),
(1134, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:13:02', 000000),
(1135, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:14:19', 000000),
(1136, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:14:19', 000000),
(1137, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:14:58', 000000),
(1138, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:14:58', 000000),
(1139, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:17:35', 000000),
(1140, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:17:35', 000000),
(1141, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:18:34', 000000),
(1142, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:18:34', 000000),
(1143, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:19:30', 000000),
(1144, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:19:30', 000000),
(1145, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:20:59', 000000),
(1146, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:20:59', 000000),
(1147, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:21:29', 000000),
(1148, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:21:29', 000000),
(1149, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:21:51', 000000),
(1150, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:21:51', 000000),
(1151, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:27:36', 000000),
(1152, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:27:36', 000000),
(1153, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:33:02', 000000),
(1154, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:33:02', 000000),
(1155, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:39:45', 000000),
(1156, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:39:45', 000000),
(1157, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:41:20', 000000),
(1158, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:41:20', 000000),
(1159, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:43:54', 000000),
(1160, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:43:54', 000000),
(1161, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:46:57', 000000);
INSERT INTO `campaign` (`cam_id`, `cam_requested_start_date`, `cam_requested_end_date`, `cam_title`, `cam_budget`, `cam_requested_response_date`, `cam_description`, `adv_id`, `cas_id`, `cam_number`, `cab_id`, `cam_order_number`, `cur_id`, `cam_risk_limit`, `cam_current_risk`, `cst_id`, `cam_partial_availability_status`, `cam_creation_date`, `cam_status`) VALUES
(1162, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:46:57', 000000),
(1163, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:48:10', 000000),
(1164, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:48:10', 000000),
(1165, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:50:51', 000000),
(1166, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:50:51', 000000),
(1167, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:53:35', 000000),
(1168, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:53:35', 000000),
(1169, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:54:36', 000000),
(1170, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:54:36', 000000),
(1171, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:54:46', 000000),
(1172, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:54:46', 000000),
(1173, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:55:54', 000000),
(1174, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:55:54', 000000),
(1175, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:57:37', 000000),
(1176, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:57:37', 000000),
(1177, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:58:52', 000000),
(1178, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-22 19:58:52', 000000),
(1179, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:58:18', 000000),
(1180, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:58:18', 000000),
(1181, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:58:20', 000000),
(1182, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:58:20', 000000),
(1183, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:58:31', 000000),
(1184, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:58:31', 000000),
(1185, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 13:59:22', 000000),
(1186, '2015-03-25', '2015-03-31', 'Josh''s Main Campaign', 125000, '2015-03-24', 'Note to operator', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:01:35', 000000),
(1187, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:01:39', 000000),
(1188, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:01:39', 000000),
(1189, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:01:54', 000000),
(1190, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:01:54', 000000),
(1191, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:02:06', 000000),
(1192, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:02:06', 000000),
(1193, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:02:21', 000000),
(1194, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:02:21', 000000),
(1195, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:03:00', 000000),
(1196, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:03:00', 000000),
(1197, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:03:36', 000000),
(1198, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:03:36', 000000),
(1199, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:04:30', 000000),
(1200, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:04:30', 000000),
(1201, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:06:46', 000000),
(1202, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:06:46', 000000),
(1203, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:07:23', 000000),
(1204, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:07:23', 000000),
(1205, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:10:05', 000000),
(1206, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:10:05', 000000),
(1207, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:53:11', 000000),
(1208, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-23 14:53:11', 000000),
(1209, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:20', 000000),
(1210, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:20', 000000),
(1211, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:22', 000000),
(1212, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:22', 000000),
(1213, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:33', 000000),
(1214, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:33', 000000),
(1215, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:35', 000000),
(1216, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:35', 000000),
(1217, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:46', 000000),
(1218, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:05:46', 000000),
(1219, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:06:17', 000000),
(1220, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:06:17', 000000),
(1221, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:09:27', 000000),
(1222, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:09:27', 000000),
(1223, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:13:47', 000000),
(1224, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:13:47', 000000),
(1225, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:14:45', 000000),
(1226, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:14:45', 000000),
(1227, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:15:03', 000000),
(1228, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:15:03', 000000),
(1229, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:15:38', 000000),
(1230, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:15:38', 000000),
(1231, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:15:55', 000000),
(1232, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:15:55', 000000),
(1233, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:16:18', 000000),
(1234, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:16:18', 000000),
(1235, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:16:34', 000000),
(1236, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:16:34', 000000),
(1237, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:17:00', 000000),
(1238, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:17:00', 000000),
(1239, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:34:55', 000000),
(1240, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:34:55', 000000),
(1241, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:36:25', 000000),
(1242, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:36:25', 000000),
(1243, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:36:36', 000000),
(1244, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:36:36', 000000),
(1245, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:36:53', 000000),
(1246, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-24 09:36:53', 000000),
(1247, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-25 11:40:41', 000000),
(1248, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-25 11:40:41', 000000),
(1249, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-25 11:40:43', 000000),
(1250, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-25 11:40:43', 000000),
(1251, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-25 11:40:51', 000000),
(1252, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-25 11:40:51', 000000),
(1253, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 13:32:04', 000000),
(1254, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 13:32:04', 000000),
(1255, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 13:32:06', 000000),
(1256, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 13:32:06', 000000),
(1257, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 13:32:14', 000000),
(1258, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 13:32:14', 000000),
(1259, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 14:45:47', 000000),
(1260, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 14:45:47', 000000),
(1261, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 14:45:52', 000000),
(1262, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 14:45:52', 000000),
(1263, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:07:55', 000000),
(1264, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:07:55', 000000),
(1265, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:16:45', 000000),
(1266, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:16:45', 000000),
(1267, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:17:52', 000000),
(1268, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:17:52', 000000),
(1269, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:24:53', 000000),
(1270, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:24:53', 000000),
(1271, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:47:13', 000000),
(1272, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:47:13', 000000),
(1273, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:49:25', 000000),
(1274, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:49:25', 000000),
(1275, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:49:52', 000000),
(1276, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:49:52', 000000),
(1277, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:53:58', 000000),
(1278, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:53:58', 000000),
(1279, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:56:44', 000000),
(1280, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:57:53', 000000),
(1281, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 15:59:19', 000000),
(1282, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:00:11', 000000),
(1283, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:14:51', 000000),
(1284, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:16:02', 000000),
(1285, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:18:18', 000000),
(1286, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:18:24', 000000),
(1287, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:24:22', 000000),
(1288, '2015-03-29', '2015-03-31', 'For a new iMac', 195000, '2015-03-28', 'This is the description.', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:34:50', 000000),
(1289, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:35:00', 000000),
(1290, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:35:04', 000000),
(1291, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:37:40', 000000),
(1292, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:37:40', 000000),
(1293, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:37:52', 000000),
(1294, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:37:52', 000000),
(1295, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:40:32', 000000),
(1296, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:40:32', 000000),
(1297, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:40:51', 000000),
(1298, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:40:51', 000000),
(1299, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:41:14', 000000),
(1300, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:41:33', 000000),
(1301, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:44:28', 000000),
(1302, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:46:17', 000000),
(1303, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:50:34', 000000),
(1304, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:53:21', 000000),
(1305, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:28', 000000),
(1306, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:33', 000000),
(1307, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:37', 000000),
(1308, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:43', 000000),
(1309, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:43', 000000),
(1310, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:56', 000000),
(1311, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:55:56', 000000),
(1312, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:58:13', 000000),
(1313, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:58:13', 000000),
(1314, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:58:39', 000000),
(1315, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:58:44', 000000),
(1316, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:58:50', 000000),
(1317, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:58:50', 000000),
(1318, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:59:17', 000000),
(1319, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-27 16:59:17', 000000),
(1320, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:35:20', 000000),
(1321, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:35:24', 000000),
(1322, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:38:16', 000000),
(1323, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:38:35', 000000),
(1324, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:40:22', 000000),
(1325, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:40:58', 000000),
(1326, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:42:37', 000000),
(1327, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:43:30', 000000),
(1328, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:44:13', 000000),
(1329, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:48:07', 000000),
(1330, '2015-03-30', '2015-03-31', 'abcdefg', 950000, '2015-03-29', 'This is a description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:50:59', 000000),
(1331, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:51:07', 000000),
(1332, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:51:07', 000000),
(1333, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:51:30', 000000),
(1334, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:51:30', 000000),
(1335, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:51:43', 000000),
(1336, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:51:43', 000000),
(1337, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:53:27', 000000),
(1338, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:53:27', 000000),
(1339, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:57:54', 000000),
(1340, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:57:54', 000000),
(1341, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:59:22', 000000),
(1342, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 09:59:22', 000000),
(1343, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:03:33', 000000),
(1344, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:03:33', 000000),
(1345, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:03:57', 000000),
(1346, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:03:57', 000000),
(1347, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:21:06', 000000),
(1348, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:21:06', 000000),
(1349, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:23:49', 000000),
(1350, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:23:49', 000000),
(1351, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:24:39', 000000),
(1352, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:24:39', 000000),
(1353, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:25:30', 000000),
(1354, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:25:30', 000000),
(1355, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:27:28', 000000),
(1356, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:27:28', 000000),
(1357, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:28:02', 000000),
(1358, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:28:02', 000000),
(1359, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:56:26', 000000),
(1360, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:56:26', 000000),
(1361, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:58:21', 000000),
(1362, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:58:21', 000000),
(1363, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:59:18', 000000),
(1364, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:59:18', 000000),
(1365, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:59:55', 000000),
(1366, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 10:59:55', 000000),
(1367, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:00:23', 000000),
(1368, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:00:23', 000000),
(1369, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:04:42', 000000),
(1370, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:04:42', 000000),
(1371, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:05:36', 000000),
(1372, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:05:52', 000000),
(1373, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:07:44', 000000),
(1374, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:07:47', 000000),
(1375, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:07:47', 000000),
(1376, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:08:07', 000000),
(1377, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:08:07', 000000),
(1378, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:08:08', 000000),
(1379, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:08:08', 000000),
(1380, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:30:06', 000000),
(1381, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 11:30:06', 000000),
(1382, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:20:17', 000000),
(1383, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:20:17', 000000),
(1384, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:20:27', 000000),
(1385, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:20:27', 000000),
(1386, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:21:14', 000000),
(1387, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:21:14', 000000),
(1388, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:23:03', 000000),
(1389, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:23:03', 000000),
(1390, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:23:52', 000000),
(1391, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:23:52', 000000),
(1392, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:24:36', 000000),
(1393, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:24:36', 000000),
(1394, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:26:09', 000000),
(1395, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:26:09', 000000),
(1396, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:26:48', 000000),
(1397, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:26:48', 000000),
(1398, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:28:08', 000000),
(1399, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:28:08', 000000),
(1400, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:28:27', 000000),
(1401, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:28:27', 000000),
(1402, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:31:52', 000000),
(1403, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:31:52', 000000),
(1404, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:33:26', 000000),
(1405, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:33:26', 000000),
(1406, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:33:47', 000000),
(1407, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:33:47', 000000),
(1408, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:34:07', 000000),
(1409, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:34:07', 000000),
(1410, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:35:32', 000000),
(1411, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:35:32', 000000),
(1412, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:36:06', 000000),
(1413, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:36:06', 000000),
(1414, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:39:34', 000000),
(1415, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:39:34', 000000),
(1416, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:44:58', 000000),
(1417, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:44:58', 000000),
(1418, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:45:28', 000000),
(1419, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:45:28', 000000),
(1420, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:45:46', 000000),
(1421, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:45:46', 000000),
(1422, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:47:19', 000000),
(1423, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:47:19', 000000),
(1424, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:47:28', 000000),
(1425, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:47:28', 000000),
(1426, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:48:30', 000000),
(1427, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:48:30', 000000),
(1428, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:50:21', 000000),
(1429, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:50:21', 000000),
(1430, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:50:40', 000000),
(1431, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:50:40', 000000),
(1432, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:51:00', 000000),
(1433, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 12:51:00', 000000),
(1434, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:32:01', 000000),
(1435, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:32:01', 000000),
(1436, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:33:49', 000000),
(1437, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:33:49', 000000),
(1438, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:34:27', 000000),
(1439, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:34:27', 000000),
(1440, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:35:51', 000000),
(1441, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:35:51', 000000),
(1442, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:36:10', 000000),
(1443, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:36:10', 000000),
(1444, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:36:57', 000000),
(1445, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:36:57', 000000),
(1446, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:39:47', 000000),
(1447, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:39:47', 000000),
(1448, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:40:27', 000000),
(1449, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:40:27', 000000),
(1450, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:41:07', 000000),
(1451, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:41:07', 000000),
(1452, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:41:53', 000000),
(1453, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:41:53', 000000),
(1454, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:45:17', 000000),
(1455, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:45:17', 000000),
(1456, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:51:11', 000000),
(1457, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:51:11', 000000),
(1458, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:51:36', 000000),
(1459, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:51:36', 000000),
(1460, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:52:08', 000000),
(1461, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:52:08', 000000),
(1462, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:52:40', 000000),
(1463, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:52:40', 000000),
(1464, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:52:58', 000000),
(1465, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:52:58', 000000),
(1466, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:53:17', 000000),
(1467, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:53:17', 000000),
(1468, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:53:41', 000000),
(1469, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:53:41', 000000),
(1470, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:54:02', 000000),
(1471, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:54:02', 000000),
(1472, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:55:18', 000000),
(1473, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 13:55:18', 000000),
(1474, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:54:05', 000000),
(1475, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:54:15', 000000),
(1476, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:57:10', 000000),
(1477, '2015-03-30', '2015-03-31', 'This is the only campaign', 950000, '2015-03-29', 'This is the description to the only campaign', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:04', 000000),
(1478, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:06', 000000),
(1479, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:06', 000000),
(1480, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:21', 000000),
(1481, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:21', 000000),
(1482, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:22', 000000),
(1483, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:22', 000000),
(1484, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:37', 000000),
(1485, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:37', 000000),
(1486, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:46', 000000),
(1487, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 14:59:46', 000000),
(1488, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:01:55', 000000),
(1489, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:01:55', 000000),
(1490, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:01', 000000),
(1491, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:01', 000000),
(1492, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:05', 000000),
(1493, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:18', 000000),
(1494, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:26', 000000),
(1495, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:51', 000000),
(1496, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:02:53', 000000),
(1497, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:06:37', 000000),
(1498, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:06:37', 000000),
(1499, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:06:43', 000000),
(1500, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:06:44', 000000),
(1501, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:07', 000000),
(1502, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:07', 000000),
(1503, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:09', 000000),
(1504, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:09', 000000);
INSERT INTO `campaign` (`cam_id`, `cam_requested_start_date`, `cam_requested_end_date`, `cam_title`, `cam_budget`, `cam_requested_response_date`, `cam_description`, `adv_id`, `cas_id`, `cam_number`, `cab_id`, `cam_order_number`, `cur_id`, `cam_risk_limit`, `cam_current_risk`, `cst_id`, `cam_partial_availability_status`, `cam_creation_date`, `cam_status`) VALUES
(1505, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:15', 000000),
(1506, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:15', 000000),
(1507, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:17', 000000),
(1508, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:09:17', 000000),
(1509, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:14:29', 000000),
(1510, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:14:29', 000000),
(1511, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:15:01', 000000),
(1512, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:15:01', 000000),
(1513, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:15:14', 000000),
(1514, '2015-03-30', '2015-03-31', 'This is the only campaign title at the moment', 125000, '2015-03-29', 'This is a description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:13', 000000),
(1515, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:15', 000000),
(1516, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:15', 000000),
(1517, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:28', 000000),
(1518, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:30', 000000),
(1519, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:38', 000000),
(1520, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:38', 000000),
(1521, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:45', 000000),
(1522, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:16:46', 000000),
(1523, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:06', 000000),
(1524, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:06', 000000),
(1525, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:17', 000000),
(1526, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:17', 000000),
(1527, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:25', 000000),
(1528, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:25', 000000),
(1529, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:28', 000000),
(1530, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:28', 000000),
(1531, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:36', 000000),
(1532, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:36', 000000),
(1533, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:47', 000000),
(1534, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:49', 000000),
(1535, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:49', 000000),
(1536, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:52', 000000),
(1537, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:52', 000000),
(1538, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:58', 000000),
(1539, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:58', 000000),
(1540, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:28:59', 000000),
(1541, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:29:17', 000000),
(1542, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:17', 000000),
(1543, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:28', 000000),
(1544, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:28', 000000),
(1545, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:29', 000000),
(1546, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:29', 000000),
(1547, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:45', 000000),
(1548, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:30:45', 000000),
(1549, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:52:02', 000000),
(1550, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:52:02', 000000),
(1551, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:55:03', 000000),
(1552, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:55:03', 000000),
(1553, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:57:18', 000000),
(1554, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 15:57:21', 000000),
(1555, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 18:12:03', 000000),
(1556, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 18:12:03', 000000),
(1557, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 19:24:21', 000000),
(1558, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 19:24:21', 000000),
(1559, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:11:13', 000000),
(1560, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:11:13', 000000),
(1561, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:46:16', 000000),
(1562, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:46:16', 000000),
(1563, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:46:19', 000000),
(1564, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:46:19', 000000),
(1565, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:46:21', 000000),
(1566, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:46:21', 000000),
(1567, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:48:55', 000000),
(1568, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:48:55', 000000),
(1569, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:49:15', 000000),
(1570, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:49:15', 000000),
(1571, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:50:09', 000000),
(1572, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:50:09', 000000),
(1573, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:50:34', 000000),
(1574, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:50:34', 000000),
(1575, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:50:56', 000000),
(1576, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:50:56', 000000),
(1577, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:51:20', 000000),
(1578, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:51:20', 000000),
(1579, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:51:25', 000000),
(1580, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:51:25', 000000),
(1581, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:52:10', 000000),
(1582, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:52:10', 000000),
(1583, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:52:17', 000000),
(1584, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:52:17', 000000),
(1585, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:53:05', 000000),
(1586, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:53:05', 000000),
(1587, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:53:43', 000000),
(1588, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:53:43', 000000),
(1589, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:54:12', 000000),
(1590, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:54:12', 000000),
(1591, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:54:20', 000000),
(1592, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:54:20', 000000),
(1593, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:54:25', 000000),
(1594, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:54:25', 000000),
(1595, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:55:16', 000000),
(1596, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:55:16', 000000),
(1597, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:55:18', 000000),
(1598, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:55:18', 000000),
(1599, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:59:38', 000000),
(1600, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 20:59:38', 000000),
(1601, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 21:00:16', 000000),
(1602, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 21:00:16', 000000),
(1603, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 21:01:38', 000000),
(1604, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 21:01:38', 000000),
(1605, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:41:38', 000000),
(1606, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:41:38', 000000),
(1607, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:41:38', 000000),
(1608, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:41:38', 000000),
(1609, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:41:46', 000000),
(1610, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:41:46', 000000),
(1611, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:42:23', 000000),
(1612, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:42:23', 000000),
(1613, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:42:45', 000000),
(1614, '2015-03-31', '2015-04-30', 'something', 120902, '2015-03-30', 'dasd qegfasd', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:43:57', 000000),
(1615, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:00', 000000),
(1616, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:00', 000000),
(1617, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:06', 000000),
(1618, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:06', 000000),
(1619, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:13', 000000),
(1620, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:13', 000000),
(1621, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:27', 000000),
(1622, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:30', 000000),
(1623, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:30', 000000),
(1624, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:32', 000000),
(1625, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:44:32', 000000),
(1626, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:47:08', 000000),
(1627, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:47:08', 000000),
(1628, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:10', 000000),
(1629, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:10', 000000),
(1630, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:15', 000000),
(1631, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:15', 000000),
(1632, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:28', 000000),
(1633, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:34', 000000),
(1634, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:34', 000000),
(1635, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:35', 000000),
(1636, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:35', 000000),
(1637, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:37', 000000),
(1638, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:37', 000000),
(1639, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:39', 000000),
(1640, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:48:54', 000000),
(1641, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:50:21', 000000),
(1642, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:50:27', 000000),
(1643, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:50:27', 000000),
(1644, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:57:46', 000000),
(1645, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 22:57:59', 000000),
(1646, '2015-04-05', '2015-04-11', 'something 222', 125000, '2015-03-31', 'This is the description!', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:02:14', 000000),
(1647, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:02:20', 000000),
(1648, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:02:21', 000000),
(1649, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:03:44', 000000),
(1650, '2015-04-05', '2015-04-11', 'something 222', 125000, '2015-03-31', 'This is the description!', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:06:49', 000000),
(1651, '2015-04-05', '2015-04-11', 'something 222', 125000, '2015-03-31', 'This is the description!', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-28 23:46:05', 000000),
(1652, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:46:10', 000000),
(1653, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:46:10', 000000),
(1654, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:47:08', 000000),
(1655, '2015-04-05', '2015-04-11', 'something 1024', 125000, '2015-03-31', 'This is the description!', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-28 23:47:56', 000000),
(1656, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:47:59', 000000),
(1657, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:47:59', 000000),
(1658, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:48:25', 000000),
(1659, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:48:25', 000000),
(1660, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:48:44', 000000),
(1661, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-28 23:48:44', 000000),
(1662, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:00:51', 000000),
(1663, '2015-04-05', '2015-04-11', 'Final attempt', 125000, '2015-03-31', 'This is the description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-29 00:01:48', 000000),
(1664, '2015-04-05', '2015-04-11', 'Final attempt', 125000, '2015-03-31', 'This is the description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-29 00:02:04', 000000),
(1665, '2015-04-05', '2015-04-11', 'Final attempt', 125000, '2015-03-31', 'This is the description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-29 00:02:32', 000000),
(1666, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:02:36', 000000),
(1667, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:02:36', 000000),
(1668, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:02:41', 000000),
(1669, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:02:41', 000000),
(1670, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:02:59', 000000),
(1671, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:02:59', 000000),
(1672, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:06:19', 000000),
(1673, '2015-04-06', '2015-04-18', 'Electro House', 960000, '2015-03-31', 'asdasd asda sgasf a sfa', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-29 00:07:11', 000000),
(1674, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:07:14', 000000),
(1675, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:07:14', 000000),
(1676, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:07:17', 000000),
(1677, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:07:17', 000000),
(1678, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:07:24', 000000),
(1679, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:07:24', 000000),
(1680, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:09:52', 000000),
(1681, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 00:09:52', 000000),
(1682, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:15:24', 000000),
(1683, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:15:42', 000000),
(1684, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:18:05', 000000),
(1685, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:20:27', 000000),
(1686, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:20:43', 000000),
(1687, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:20:43', 000000),
(1688, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:20:43', 000000),
(1689, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:20:43', 000000),
(1690, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:21:34', 000000),
(1691, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:21:34', 000000),
(1692, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:48:06', 000000),
(1693, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:48:06', 000000),
(1694, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:48:32', 000000),
(1695, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:48:32', 000000),
(1696, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:48:50', 000000),
(1697, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:48:50', 000000),
(1698, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:49:02', 000000),
(1699, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:49:02', 000000),
(1700, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:51:22', 000000),
(1701, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:51:22', 000000),
(1702, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:52:52', 000000),
(1703, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:52:52', 000000),
(1704, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:54:10', 000000),
(1705, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:54:10', 000000),
(1706, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:54:39', 000000),
(1707, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 01:54:39', 000000),
(1708, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:03:20', 000000),
(1709, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:03:20', 000000),
(1710, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:05:08', 000000),
(1711, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:05:08', 000000),
(1712, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:06:06', 000000),
(1713, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:06:06', 000000),
(1714, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:06:28', 000000),
(1715, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 02:06:28', 000000),
(1716, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:37:05', 000000),
(1717, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:37:05', 000000),
(1718, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:45:28', 000000),
(1719, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:45:28', 000000),
(1720, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:45:45', 000000),
(1721, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:45:45', 000000),
(1722, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:46:03', 000000),
(1723, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:46:03', 000000),
(1724, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:46:31', 000000),
(1725, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:46:31', 000000),
(1726, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:47:13', 000000),
(1727, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:47:13', 000000),
(1728, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:47:29', 000000),
(1729, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:47:29', 000000),
(1730, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:47:59', 000000),
(1731, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:47:59', 000000),
(1732, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:48:14', 000000),
(1733, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:48:14', 000000),
(1734, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:48:46', 000000),
(1735, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:48:46', 000000),
(1736, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:48:56', 000000),
(1737, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:48:56', 000000),
(1738, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:55:08', 000000),
(1739, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:55:08', 000000),
(1740, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:55:32', 000000),
(1741, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 07:55:32', 000000),
(1742, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:00:37', 000000),
(1743, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:00:37', 000000),
(1744, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:01:40', 000000),
(1745, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:01:40', 000000),
(1746, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:04:07', 000000),
(1747, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:04:07', 000000),
(1748, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:09:39', 000000),
(1749, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:09:39', 000000),
(1750, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:11:40', 000000),
(1751, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:11:40', 000000),
(1752, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:12:17', 000000),
(1753, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:12:17', 000000),
(1754, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:15:31', 000000),
(1755, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:15:31', 000000),
(1756, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:15:38', 000000),
(1757, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:15:39', 000000),
(1758, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:16:44', 000000),
(1759, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:16:44', 000000),
(1760, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:22:27', 000000),
(1761, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:22:27', 000000),
(1762, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:22:36', 000000),
(1763, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:22:36', 000000),
(1764, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:23:37', 000000),
(1765, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:23:37', 000000),
(1766, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:24:44', 000000),
(1767, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:24:44', 000000),
(1768, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:26:04', 000000),
(1769, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:26:04', 000000),
(1770, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:28:06', 000000),
(1771, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:28:06', 000000),
(1772, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:28:49', 000000),
(1773, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:28:49', 000000),
(1774, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:29:56', 000000),
(1775, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:29:56', 000000),
(1776, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:30:28', 000000),
(1777, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:30:28', 000000),
(1778, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:31:03', 000000),
(1779, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:31:03', 000000),
(1780, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:31:13', 000000),
(1781, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:31:13', 000000),
(1782, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:31:29', 000000),
(1783, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:31:29', 000000),
(1784, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:33:17', 000000),
(1785, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:33:17', 000000),
(1786, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:34:28', 000000),
(1787, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:34:28', 000000),
(1788, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:34:43', 000000),
(1789, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:34:43', 000000),
(1790, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:35:59', 000000),
(1791, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:35:59', 000000),
(1792, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:37:37', 000000),
(1793, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:37:37', 000000),
(1794, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:38:44', 000000),
(1795, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:38:44', 000000),
(1796, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:50:38', 000000),
(1797, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:50:38', 000000),
(1798, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:51:37', 000000),
(1799, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:51:37', 000000),
(1800, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:11', 000000),
(1801, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:11', 000000),
(1802, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:27', 000000),
(1803, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:27', 000000),
(1804, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:41', 000000),
(1805, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:41', 000000),
(1806, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:58', 000000),
(1807, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:52:58', 000000),
(1808, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:53:25', 000000),
(1809, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:53:25', 000000),
(1810, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:53:44', 000000),
(1811, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:53:44', 000000),
(1812, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:53:58', 000000),
(1813, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:53:58', 000000),
(1814, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:59:48', 000000),
(1815, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 08:59:48', 000000),
(1816, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:01:35', 000000),
(1817, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:01:35', 000000),
(1818, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:01:59', 000000),
(1819, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:01:59', 000000),
(1820, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:02:51', 000000),
(1821, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:02:51', 000000),
(1822, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:03:27', 000000),
(1823, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:03:27', 000000),
(1824, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:03:38', 000000),
(1825, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:03:38', 000000),
(1826, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:03:49', 000000),
(1827, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:03:49', 000000),
(1828, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:04:07', 000000),
(1829, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:04:07', 000000),
(1830, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:04:13', 000000),
(1831, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:04:13', 000000),
(1832, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:04:26', 000000),
(1833, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:04:26', 000000),
(1834, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:06:22', 000000),
(1835, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:06:22', 000000),
(1836, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:21:28', 000000),
(1837, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:21:28', 000000),
(1838, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:22:59', 000000),
(1839, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:22:59', 000000),
(1840, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:26:34', 000000),
(1841, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:26:34', 000000),
(1842, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:26:51', 000000),
(1843, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:26:51', 000000),
(1844, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:27:15', 000000),
(1845, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:27:15', 000000);
INSERT INTO `campaign` (`cam_id`, `cam_requested_start_date`, `cam_requested_end_date`, `cam_title`, `cam_budget`, `cam_requested_response_date`, `cam_description`, `adv_id`, `cas_id`, `cam_number`, `cab_id`, `cam_order_number`, `cur_id`, `cam_risk_limit`, `cam_current_risk`, `cst_id`, `cam_partial_availability_status`, `cam_creation_date`, `cam_status`) VALUES
(1846, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:28:57', 000000),
(1847, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:28:57', 000000),
(1848, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:30:57', 000000),
(1849, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:30:57', 000000),
(1850, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:33:53', 000000),
(1851, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:33:53', 000000),
(1852, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:34:16', 000000),
(1853, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:34:16', 000000),
(1854, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:34:20', 000000),
(1855, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:34:20', 000000),
(1856, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:36:28', 000000),
(1857, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:36:28', 000000),
(1858, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:37:17', 000000),
(1859, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:37:17', 000000),
(1860, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:37:30', 000000),
(1861, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:37:30', 000000),
(1862, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:38:12', 000000),
(1863, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:38:12', 000000),
(1864, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:39:00', 000000),
(1865, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:39:00', 000000),
(1866, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:39:43', 000000),
(1867, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:39:43', 000000),
(1868, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:41:14', 000000),
(1869, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:41:14', 000000),
(1870, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:42:11', 000000),
(1871, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:42:11', 000000),
(1872, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:42:56', 000000),
(1873, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:42:56', 000000),
(1874, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:43:28', 000000),
(1875, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:43:28', 000000),
(1876, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:45:15', 000000),
(1877, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 09:45:15', 000000),
(1878, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:32:09', 000000),
(1879, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:32:09', 000000),
(1880, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:33:16', 000000),
(1881, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:33:16', 000000),
(1882, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:33:49', 000000),
(1883, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:33:49', 000000),
(1884, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:34:02', 000000),
(1885, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:34:02', 000000),
(1886, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:34:54', 000000),
(1887, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:34:54', 000000),
(1888, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:35:09', 000000),
(1889, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:35:09', 000000),
(1890, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:35:22', 000000),
(1891, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:35:22', 000000),
(1892, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:35:27', 000000),
(1893, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:35:27', 000000),
(1894, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:36:33', 000000),
(1895, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:36:33', 000000),
(1896, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:36:52', 000000),
(1897, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:36:52', 000000),
(1898, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:37:17', 000000),
(1899, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:37:17', 000000),
(1900, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:38:27', 000000),
(1901, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:38:27', 000000),
(1902, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:39:06', 000000),
(1903, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:39:06', 000000),
(1904, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:39:37', 000000),
(1905, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:39:37', 000000),
(1906, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:40:18', 000000),
(1907, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:40:18', 000000),
(1908, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:41:32', 000000),
(1909, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:41:32', 000000),
(1910, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:42:03', 000000),
(1911, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:42:03', 000000),
(1912, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:44:34', 000000),
(1913, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:44:34', 000000),
(1914, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:45:14', 000000),
(1915, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:45:14', 000000),
(1916, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:45:49', 000000),
(1917, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:45:49', 000000),
(1918, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:49:45', 000000),
(1919, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:49:45', 000000),
(1920, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:50:11', 000000),
(1921, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:50:11', 000000),
(1922, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:53:50', 000000),
(1923, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:53:50', 000000),
(1924, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:54:26', 000000),
(1925, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 10:54:44', 000000),
(1926, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:07:26', 000000),
(1927, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:14:54', 000000),
(1928, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:14:54', 000000),
(1929, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:15:25', 000000),
(1930, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:15:25', 000000),
(1931, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:15:44', 000000),
(1932, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:15:44', 000000),
(1933, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:15:59', 000000),
(1934, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:15:59', 000000),
(1935, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:16:56', 000000),
(1936, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:16:56', 000000),
(1937, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:17:34', 000000),
(1938, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 11:17:34', 000000),
(1939, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:09:11', 000000),
(1940, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:09:11', 000000),
(1941, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:14:20', 000000),
(1942, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:14:20', 000000),
(1943, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:15:25', 000000),
(1944, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:15:25', 000000),
(1945, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:15:59', 000000),
(1946, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:15:59', 000000),
(1947, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:17:26', 000000),
(1948, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:17:26', 000000),
(1949, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:17:39', 000000),
(1950, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:17:39', 000000),
(1951, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:18:31', 000000),
(1952, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:18:31', 000000),
(1953, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:19:02', 000000),
(1954, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:19:02', 000000),
(1955, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:21:27', 000000),
(1956, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:21:27', 000000),
(1957, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:22:04', 000000),
(1958, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:22:04', 000000),
(1959, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:22:37', 000000),
(1960, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:22:37', 000000),
(1961, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:23:32', 000000),
(1962, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:23:32', 000000),
(1963, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:24:22', 000000),
(1964, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:24:22', 000000),
(1965, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:25:06', 000000),
(1966, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:25:06', 000000),
(1967, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:28:31', 000000),
(1968, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:28:31', 000000),
(1969, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:29:36', 000000),
(1970, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:29:36', 000000),
(1971, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:32:39', 000000),
(1972, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:32:39', 000000),
(1973, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:33:11', 000000),
(1974, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:33:11', 000000),
(1975, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:33:28', 000000),
(1976, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:33:28', 000000),
(1977, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:33:41', 000000),
(1978, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:33:41', 000000),
(1979, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:34:12', 000000),
(1980, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:34:12', 000000),
(1981, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:37:13', 000000),
(1982, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:37:13', 000000),
(1983, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:37:53', 000000),
(1984, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:37:53', 000000),
(1985, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:41:21', 000000),
(1986, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 13:41:21', 000000),
(1987, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:10:20', 000000),
(1988, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:11:13', 000000),
(1989, '2015-04-05', '2015-04-11', 'Finally Working', 125000, '2015-03-31', 'asdgfmn aysbfn.lash faljhsf', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-29 14:12:13', 000000),
(1990, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:12:45', 000000),
(1991, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:12:45', 000000),
(1992, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:13:03', 000000),
(1993, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:13:03', 000000),
(1994, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:13:14', 000000),
(1995, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:13:14', 000000),
(1996, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:15:35', 000000),
(1997, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:15:50', 000000),
(1998, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:25', 000000),
(1999, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:44', 000000),
(2000, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:44', 000000),
(2001, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:47', 000000),
(2002, '0000-00-00', '0000-00-00', '', 1, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:47', 000000),
(2003, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:54', 000000),
(2004, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:16:54', 000000),
(2005, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:17:10', 000000),
(2006, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:17:25', 000000),
(2007, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-29 14:50:34', 000000),
(2008, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:45:07', 000000),
(2009, '2015-04-05', '2015-04-11', 'Morney''s Campaign', 950000, '2015-04-04', 'This is the description', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-03-31 07:46:26', 000000),
(2010, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:46:29', 000000),
(2011, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:46:29', 000000),
(2012, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:47:03', 000000),
(2013, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:47:03', 000000),
(2014, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:47:14', 000000),
(2015, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:47:14', 000000),
(2016, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:54:15', 000000),
(2017, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:54:15', 000000),
(2018, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:54:41', 000000),
(2019, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:55:09', 000000),
(2020, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:57:58', 000000),
(2021, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:58:11', 000000),
(2022, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:58:11', 000000),
(2023, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:58:12', 000000),
(2024, '0000-00-00', '0000-00-00', '', 9, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:58:12', 000000),
(2025, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:58:19', 000000),
(2026, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 07:58:19', 000000),
(2027, '0000-00-00', '0000-00-00', '', 0, '0000-00-00', '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-03-31 08:06:00', 000000);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_budget_date`
--

CREATE TABLE `campaign_budget_date` (
`cbd_id` smallint(6) NOT NULL,
  `cbd_start_date` datetime DEFAULT NULL,
  `cbd_end_date` datetime DEFAULT NULL,
  `cbd_quantity` int(11) DEFAULT NULL,
  `cbd_rate_per_unit` float DEFAULT NULL,
  `cbd_rate_card_rate` float DEFAULT NULL,
  `cbd_commision` float DEFAULT NULL,
  `cbd_VAT` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_budget_type`
--

CREATE TABLE `campaign_budget_type` (
`cat_id` smallint(6) NOT NULL,
  `cat_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_locations`
--

CREATE TABLE `campaign_locations` (
`cal_id` smallint(6) NOT NULL,
  `cam_id` smallint(6) DEFAULT NULL,
  `cal_lattitude` varchar(255) DEFAULT NULL,
  `cal_longitude` varchar(255) DEFAULT NULL,
  `cal_GPS1` varchar(255) DEFAULT NULL,
  `cal_GPS2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_source_type`
--

CREATE TABLE `campaign_source_type` (
`cst_id` smallint(6) NOT NULL,
  `cst_description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_status`
--

CREATE TABLE `campaign_status` (
`cas_id` smallint(6) NOT NULL,
  `cst_id` smallint(6) DEFAULT NULL COMMENT 'FK: campaign_source_type',
  `cas_description` varchar(255) DEFAULT NULL,
  `dot_id` smallint(6) DEFAULT NULL COMMENT 'FK : pdocument_type',
  `cas_code` varchar(255) DEFAULT NULL,
  `cas_authorization` tinyint(4) DEFAULT NULL,
  `cas_update_authorization` tinyint(4) DEFAULT NULL,
  `cas_form_editable` tinyint(4) DEFAULT NULL,
  `cas_import_coce` varchar(255) DEFAULT NULL,
  `cas_validate_status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_transaction`
--

CREATE TABLE `campaign_transaction` (
`camt_id` smallint(6) NOT NULL,
  `cam_id` smallint(6) DEFAULT NULL COMMENT 'FK: campaign',
  `mec_id` smallint(6) DEFAULT NULL COMMENT 'FK: media_category',
  `cam_latitude` varchar(20) DEFAULT NULL,
  `cam_longitude` varchar(20) DEFAULT NULL,
  `asi_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_size',
  `asg_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_group',
  `quantity` smallint(6) DEFAULT NULL,
  `rfp_transaction_id` smallint(9) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign_transaction`
--

INSERT INTO `campaign_transaction` (`camt_id`, `cam_id`, `mec_id`, `cam_latitude`, `cam_longitude`, `asi_id`, `asg_id`, `quantity`, `rfp_transaction_id`) VALUES
(1, 70, 8, '-26.1075663', '28.056700699999965', 26, 1, NULL, NULL),
(2, 70, 8, '-26.1075663', '28.056700699999965', 26, 2, NULL, NULL),
(3, 73, 9, '-26.1075663', '28.056700699999965', 26, 1, NULL, NULL),
(4, 73, 9, '-26.1075663', '28.056700699999965', 26, 2, NULL, NULL),
(5, 73, 9, '-26.1075663', '28.056700699999965', 26, 3, NULL, NULL),
(6, 73, 9, '-26.1075663', '28.056700699999965', 26, 5, NULL, NULL),
(7, 73, 9, '-26.067732', '27.935486', 26, 6, NULL, NULL),
(8, 73, 9, '-26.1075663', '28.056700699999965', 26, 7, NULL, NULL),
(9, 73, 9, '-26.1075663', '28.056700699999965', 27, 1, NULL, NULL),
(10, 73, 9, '-26.1075663', '28.056700699999965', 27, 2, NULL, NULL),
(11, 73, 9, '-26.1075663', '28.056700699999965', 27, 3, NULL, NULL),
(12, 73, 9, '-26.1075663', '28.056700699999965', 27, 5, NULL, NULL),
(13, 73, 9, '-26.1075663', '28.056700699999965', 27, 6, NULL, NULL),
(14, 73, 9, '-26.1075663', '28.056700699999965', 27, 7, NULL, NULL),
(15, 73, 9, '-26.1075663', '28.056700699999965', 28, 1, NULL, NULL),
(16, 73, 9, '-26.1075663', '28.056700699999965', 28, 2, NULL, NULL),
(17, 73, 9, '-26.1075663', '28.056700699999965', 28, 3, NULL, NULL),
(18, 73, 9, '-26.1075663', '28.056700699999965', 28, 5, NULL, NULL),
(19, 73, 9, '-26.1075663', '28.056700699999965', 28, 6, NULL, NULL),
(20, 73, 9, '-26.1075663', '28.056700699999965', 28, 7, NULL, NULL),
(21, 74, 8, '-26.1948812', '28.11585880000007', 26, 1, NULL, NULL),
(22, 74, 8, '-26.1948812', '28.11585880000007', 26, 2, NULL, NULL),
(23, 74, 8, '-26.1948812', '28.11585880000007', 26, 3, NULL, NULL),
(24, 75, 7, '19.4326077', '-99.13320799999997', 26, 3, NULL, NULL),
(25, 75, 7, '19.4326077', '-99.13320799999997', 26, 4, NULL, NULL),
(26, 76, 1, '-26.1075663', '28.056700699999965', 26, 1, NULL, NULL),
(27, 76, 1, '-26.1075663', '28.056700699999965', 26, 2, NULL, NULL),
(28, 76, 1, '-26.1075663', '28.056700699999965', 26, 3, NULL, NULL),
(29, 76, 1, '-26.1075663', '28.056700699999965', 27, 1, NULL, NULL),
(30, 76, 1, '-26.1075663', '28.056700699999965', 27, 2, NULL, NULL),
(31, 76, 1, '-26.1075663', '28.056700699999965', 27, 3, NULL, NULL),
(32, 78, NULL, '46.227638', '2.213749000000007', NULL, 1, NULL, NULL),
(33, 78, NULL, '46.227638', '2.213749000000007', NULL, 8, NULL, NULL),
(34, 79, NULL, '-33.9248685', '18.424055299999964', NULL, 1, NULL, NULL),
(35, 79, NULL, '-33.9248685', '18.424055299999964', NULL, 2, NULL, NULL),
(36, 79, NULL, '-33.9248685', '18.424055299999964', NULL, 3, NULL, NULL),
(37, 79, NULL, '-33.9248685', '18.424055299999964', NULL, 4, NULL, NULL),
(38, 107, 3, '-25.9991795', '28.1262927', 1, 1, NULL, NULL),
(39, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(40, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(41, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(42, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(43, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(44, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(45, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(46, 107, 3, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(47, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(48, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(49, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(50, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(51, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(52, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(53, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(54, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(55, 107, 4, '-25.9991795', '28.1262927', 28, 28, NULL, NULL),
(56, 113, 3, '-25.9991795', '28.1262927', 26, 1, NULL, NULL),
(57, 113, 3, '-25.9991795', '28.1262927', 26, 1, NULL, NULL),
(58, 113, 4, '-25.9991795', '28.1262927', 29, 0, NULL, NULL),
(59, 113, 4, '-25.9991795', '28.1262927', 30, 0, NULL, NULL),
(60, 113, 4, '-25.9991795', '28.1262927', 31, 0, NULL, NULL),
(61, 113, 4, '-25.9991795', '28.1262927', 32, 0, NULL, NULL),
(62, 148, 4, '-26.0254685', '28.00397', 0, 0, 1, NULL),
(63, 148, 5, '-26.0254685', '28.00397', 0, 0, 1, NULL),
(64, 148, 8, '-26.0254685', '28.00397', 0, 0, 1, NULL),
(65, 149, 4, '-26.0254685', '28.00397', 0, 0, 1, NULL),
(66, 149, 5, '-26.0254685', '28.00397', 0, 0, 1, NULL),
(67, 149, 8, '-26.0254685', '28.00397', 0, 0, 1, NULL),
(68, 0, 0, '', '', 0, 0, 0, NULL),
(69, 0, 0, '', '', 0, 0, 0, NULL),
(70, 0, 0, '', '', 0, 0, 0, NULL),
(71, 150, 4, '-26.093611', '28.006389', 0, 0, 5, NULL),
(72, 150, 6, '-26.093611', '28.006389', 0, 0, 10, NULL),
(73, 150, 8, '-26.093611', '28.006389', 0, 0, 5, NULL),
(74, 150, 11, '-26.093611', '28.006389', 0, 0, 1, NULL),
(75, 151, 1, '-25.746111', '28.188056', 0, 0, 3, NULL),
(76, 151, 4, '-25.746111', '28.188056', 0, 0, 1, NULL),
(77, 151, 6, '-25.746111', '28.188056', 0, 0, 1, NULL),
(78, 151, 1, '-25.746111', '28.188056', 0, 0, 1, NULL),
(79, 151, 4, '-25.746111', '28.188056', 0, 0, 1, NULL),
(80, 151, 6, '-25.746111', '28.188056', 0, 0, 1, NULL),
(81, 151, 1, '-29.8586804', '31.0218404', 0, 0, 3, NULL),
(82, 151, 4, '-29.8586804', '31.0218404', 0, 0, 1, NULL),
(83, 151, 6, '-29.8586804', '31.0218404', 0, 0, 1, NULL),
(84, 151, 1, '-29.8586804', '31.0218404', 0, 0, 1, NULL),
(85, 151, 4, '-29.8586804', '31.0218404', 0, 0, 1, NULL),
(86, 151, 6, '-29.8586804', '31.0218404', 0, 0, 1, NULL),
(87, 152, 3, '-26.1075663', '28.0567007', 0, 0, 1, NULL),
(88, 152, 3, '-26.1075663', '28.0567007', 0, 0, 1, NULL),
(89, 152, 3, '-26.1075663', '28.0567007', 0, 0, 1, NULL),
(90, 152, 3, '-26.2041028', '28.0473051', 0, 0, 1, NULL),
(91, 152, 3, '-26.2041028', '28.0473051', 0, 0, 1, NULL),
(92, 152, 3, '-26.2041028', '28.0473051', 0, 0, 1, NULL),
(93, 152, 3, '-26.141111', '28.152778', 0, 0, 1, NULL),
(94, 152, 3, '-26.141111', '28.152778', 0, 0, 1, NULL),
(95, 152, 3, '-26.141111', '28.152778', 0, 0, 1, NULL),
(96, 153, 8, '-26.0755899', '28.01133', 32, 0, 5, NULL),
(97, 153, 8, '-26.0755899', '28.01133', 33, 0, 5, NULL),
(98, 153, 8, '-26.0755899', '28.01133', 32, 0, 2, NULL),
(99, 153, 8, '-26.0755899', '28.01133', 33, 0, 2, NULL),
(100, 153, 8, '-26.0755899', '28.01133', 32, 0, 1, NULL),
(101, 153, 8, '-26.0755899', '28.01133', 33, 0, 1, NULL),
(102, 153, 8, '-26.0755899', '28.01133', 32, 0, 1, NULL),
(103, 153, 8, '-26.0755899', '28.01133', 33, 0, 1, NULL),
(104, 153, 8, '-26.093611', '28.006389', 32, 0, 5, NULL),
(105, 153, 8, '-26.093611', '28.006389', 33, 0, 5, NULL),
(106, 153, 8, '-26.093611', '28.006389', 32, 0, 2, NULL),
(107, 153, 8, '-26.093611', '28.006389', 33, 0, 2, NULL),
(108, 153, 8, '-26.093611', '28.006389', 32, 0, 1, NULL),
(109, 153, 8, '-26.093611', '28.006389', 33, 0, 1, NULL),
(110, 153, 8, '-26.093611', '28.006389', 32, 0, 1, NULL),
(111, 153, 8, '-26.093611', '28.006389', 33, 0, 1, NULL),
(112, 153, 8, '-26.2125', '28.2625', 32, 0, 5, NULL),
(113, 153, 8, '-26.2125', '28.2625', 33, 0, 5, NULL),
(114, 153, 8, '-26.2125', '28.2625', 32, 0, 2, NULL),
(115, 153, 8, '-26.2125', '28.2625', 33, 0, 2, NULL),
(116, 153, 8, '-26.2125', '28.2625', 32, 0, 1, NULL),
(117, 153, 8, '-26.2125', '28.2625', 33, 0, 1, NULL),
(118, 153, 8, '-26.2125', '28.2625', 32, 0, 1, NULL),
(119, 153, 8, '-26.2125', '28.2625', 33, 0, 1, NULL),
(120, 153, 8, '-26.188333', '28.320556', 32, 0, 5, NULL),
(121, 153, 8, '-26.188333', '28.320556', 33, 0, 5, NULL),
(122, 153, 8, '-26.188333', '28.320556', 32, 0, 2, NULL),
(123, 153, 8, '-26.188333', '28.320556', 33, 0, 2, NULL),
(124, 153, 8, '-26.188333', '28.320556', 32, 0, 1, NULL),
(125, 153, 8, '-26.188333', '28.320556', 33, 0, 1, NULL),
(126, 153, 8, '-26.188333', '28.320556', 32, 0, 1, NULL),
(127, 153, 8, '-26.188333', '28.320556', 33, 0, 1, NULL),
(128, 154, 2, '-26.2041028', '28.0473051', 0, 0, 1, NULL),
(129, 154, 3, '-26.2041028', '28.0473051', 0, 0, 1, NULL),
(130, 154, 5, '-26.2041028', '28.0473051', 0, 0, 1, NULL),
(131, 164, 3, NULL, NULL, NULL, NULL, 1, 2),
(132, 164, 3, NULL, NULL, NULL, NULL, 1, 3),
(133, 216, 3, NULL, NULL, NULL, NULL, 1, 4),
(134, 216, 9, NULL, NULL, NULL, NULL, 1, 4),
(135, 1186, 1, NULL, NULL, NULL, NULL, 1, 5),
(136, 1186, 2, NULL, NULL, NULL, NULL, 1, 5),
(137, 1186, 4, NULL, NULL, NULL, NULL, 1, 5),
(138, 1186, 7, NULL, NULL, NULL, NULL, 1, 5),
(139, 1186, 11, NULL, NULL, NULL, NULL, 1, 5),
(140, 1186, 1, NULL, NULL, NULL, NULL, 1, 6),
(141, 1186, 2, NULL, NULL, NULL, NULL, 1, 6),
(142, 1186, 4, NULL, NULL, NULL, NULL, 1, 6),
(143, 1186, 7, NULL, NULL, NULL, NULL, 1, 6),
(144, 1186, 11, NULL, NULL, NULL, NULL, 1, 6),
(145, 1186, 1, NULL, NULL, NULL, NULL, 1, 7),
(146, 1186, 2, NULL, NULL, NULL, NULL, 1, 7),
(147, 1186, 4, NULL, NULL, NULL, NULL, 1, 7),
(148, 1186, 7, NULL, NULL, NULL, NULL, 1, 7),
(149, 1186, 11, NULL, NULL, NULL, NULL, 1, 7),
(150, 1186, 1, NULL, NULL, NULL, NULL, 1, 8),
(151, 1186, 2, NULL, NULL, NULL, NULL, 1, 8),
(152, 1186, 4, NULL, NULL, NULL, NULL, 1, 8),
(153, 1186, 7, NULL, NULL, NULL, NULL, 1, 8),
(154, 1186, 11, NULL, NULL, NULL, NULL, 1, 8),
(155, 1186, 1, NULL, NULL, NULL, NULL, 1, 9),
(156, 1186, 2, NULL, NULL, NULL, NULL, 1, 9),
(157, 1186, 4, NULL, NULL, NULL, NULL, 1, 9),
(158, 1186, 7, NULL, NULL, NULL, NULL, 1, 9),
(159, 1186, 11, NULL, NULL, NULL, NULL, 1, 9),
(160, 1186, 1, NULL, NULL, NULL, NULL, 1, 10),
(161, 1186, 2, NULL, NULL, NULL, NULL, 1, 10),
(162, 1186, 4, NULL, NULL, NULL, NULL, 1, 10),
(163, 1186, 7, NULL, NULL, NULL, NULL, 1, 10),
(164, 1186, 11, NULL, NULL, NULL, NULL, 1, 10),
(165, 1186, 1, NULL, NULL, NULL, NULL, 1, 11),
(166, 1186, 2, NULL, NULL, NULL, NULL, 1, 11),
(167, 1186, 4, NULL, NULL, NULL, NULL, 1, 11),
(168, 1186, 7, NULL, NULL, NULL, NULL, 1, 11),
(169, 1186, 11, NULL, NULL, NULL, NULL, 1, 11),
(170, 1186, 1, NULL, NULL, NULL, NULL, 1, 12),
(171, 1186, 2, NULL, NULL, NULL, NULL, 1, 12),
(172, 1186, 4, NULL, NULL, NULL, NULL, 1, 12),
(173, 1186, 7, NULL, NULL, NULL, NULL, 1, 12),
(174, 1186, 11, NULL, NULL, NULL, NULL, 1, 12),
(175, 1288, 3, NULL, NULL, NULL, NULL, 1, 13),
(176, 1288, 4, NULL, NULL, NULL, NULL, 1, 13),
(177, 1288, 5, NULL, NULL, NULL, NULL, 1, 13),
(178, 1288, 6, NULL, NULL, NULL, NULL, 1, 13),
(179, 1288, 7, NULL, NULL, NULL, NULL, 1, 13),
(180, 1288, 8, NULL, NULL, NULL, NULL, 1, 13),
(181, 1288, 9, NULL, NULL, NULL, NULL, 1, 13),
(182, 1288, 10, NULL, NULL, NULL, NULL, 1, 13),
(183, 1288, 3, NULL, NULL, NULL, NULL, 1, 14),
(184, 1288, 4, NULL, NULL, NULL, NULL, 1, 14),
(185, 1288, 5, NULL, NULL, NULL, NULL, 1, 14),
(186, 1288, 6, NULL, NULL, NULL, NULL, 1, 14),
(187, 1288, 7, NULL, NULL, NULL, NULL, 1, 14),
(188, 1288, 8, NULL, NULL, NULL, NULL, 1, 14),
(189, 1288, 9, NULL, NULL, NULL, NULL, 1, 14),
(190, 1288, 10, NULL, NULL, NULL, NULL, 1, 14),
(191, 1288, 3, NULL, NULL, NULL, NULL, 1, 15),
(192, 1288, 4, NULL, NULL, NULL, NULL, 1, 15),
(193, 1288, 5, NULL, NULL, NULL, NULL, 1, 15),
(194, 1288, 6, NULL, NULL, NULL, NULL, 1, 15),
(195, 1288, 7, NULL, NULL, NULL, NULL, 1, 15),
(196, 1288, 8, NULL, NULL, NULL, NULL, 1, 15),
(197, 1288, 9, NULL, NULL, NULL, NULL, 1, 15),
(198, 1288, 10, NULL, NULL, NULL, NULL, 1, 15),
(199, 1288, 3, NULL, NULL, NULL, NULL, 1, 16),
(200, 1288, 4, NULL, NULL, NULL, NULL, 1, 16),
(201, 1288, 5, NULL, NULL, NULL, NULL, 1, 16),
(202, 1288, 6, NULL, NULL, NULL, NULL, 1, 16),
(203, 1288, 7, NULL, NULL, NULL, NULL, 1, 16),
(204, 1288, 8, NULL, NULL, NULL, NULL, 1, 16),
(205, 1288, 9, NULL, NULL, NULL, NULL, 1, 16),
(206, 1288, 10, NULL, NULL, NULL, NULL, 1, 16),
(207, 1330, 1, NULL, NULL, NULL, NULL, 1, 17),
(208, 1330, 2, NULL, NULL, NULL, NULL, 1, 17),
(209, 1330, 3, NULL, NULL, NULL, NULL, 1, 17),
(210, 1330, 4, NULL, NULL, NULL, NULL, 1, 17),
(211, 1330, 5, NULL, NULL, NULL, NULL, 1, 17),
(212, 1330, 6, NULL, NULL, NULL, NULL, 1, 17),
(213, 1330, 9, NULL, NULL, NULL, NULL, 1, 17),
(214, 1330, 1, NULL, NULL, NULL, NULL, 1, 18),
(215, 1330, 2, NULL, NULL, NULL, NULL, 1, 18),
(216, 1330, 3, NULL, NULL, NULL, NULL, 1, 18),
(217, 1330, 4, NULL, NULL, NULL, NULL, 1, 18),
(218, 1330, 5, NULL, NULL, NULL, NULL, 1, 18),
(219, 1330, 6, NULL, NULL, NULL, NULL, 1, 18),
(220, 1330, 9, NULL, NULL, NULL, NULL, 1, 18),
(221, 1330, 1, NULL, NULL, NULL, NULL, 1, 19),
(222, 1330, 2, NULL, NULL, NULL, NULL, 1, 19),
(223, 1330, 3, NULL, NULL, NULL, NULL, 1, 19),
(224, 1330, 4, NULL, NULL, NULL, NULL, 1, 19),
(225, 1330, 5, NULL, NULL, NULL, NULL, 1, 19),
(226, 1330, 6, NULL, NULL, NULL, NULL, 1, 19),
(227, 1330, 9, NULL, NULL, NULL, NULL, 1, 19),
(228, 1330, 1, NULL, NULL, NULL, NULL, 1, 20),
(229, 1330, 2, NULL, NULL, NULL, NULL, 1, 20),
(230, 1330, 3, NULL, NULL, NULL, NULL, 1, 20),
(231, 1330, 4, NULL, NULL, NULL, NULL, 1, 20),
(232, 1330, 5, NULL, NULL, NULL, NULL, 1, 20),
(233, 1330, 6, NULL, NULL, NULL, NULL, 1, 20),
(234, 1330, 9, NULL, NULL, NULL, NULL, 1, 20),
(235, 1330, 1, NULL, NULL, NULL, NULL, 1, 21),
(236, 1330, 2, NULL, NULL, NULL, NULL, 1, 21),
(237, 1330, 3, NULL, NULL, NULL, NULL, 1, 21),
(238, 1330, 4, NULL, NULL, NULL, NULL, 1, 21),
(239, 1330, 5, NULL, NULL, NULL, NULL, 1, 21),
(240, 1330, 6, NULL, NULL, NULL, NULL, 1, 21),
(241, 1330, 9, NULL, NULL, NULL, NULL, 1, 21),
(242, 1330, 1, NULL, NULL, NULL, NULL, 1, 22),
(243, 1330, 2, NULL, NULL, NULL, NULL, 1, 22),
(244, 1330, 3, NULL, NULL, NULL, NULL, 1, 22),
(245, 1330, 4, NULL, NULL, NULL, NULL, 1, 22),
(246, 1330, 5, NULL, NULL, NULL, NULL, 1, 22),
(247, 1330, 6, NULL, NULL, NULL, NULL, 1, 22),
(248, 1330, 9, NULL, NULL, NULL, NULL, 1, 22),
(249, 1330, 1, NULL, NULL, NULL, NULL, 1, 23),
(250, 1330, 2, NULL, NULL, NULL, NULL, 1, 23),
(251, 1330, 3, NULL, NULL, NULL, NULL, 1, 23),
(252, 1330, 4, NULL, NULL, NULL, NULL, 1, 23),
(253, 1330, 5, NULL, NULL, NULL, NULL, 1, 23),
(254, 1330, 6, NULL, NULL, NULL, NULL, 1, 23),
(255, 1330, 9, NULL, NULL, NULL, NULL, 1, 23),
(256, 1330, 1, NULL, NULL, NULL, NULL, 1, 24),
(257, 1330, 2, NULL, NULL, NULL, NULL, 1, 24),
(258, 1330, 3, NULL, NULL, NULL, NULL, 1, 24),
(259, 1330, 4, NULL, NULL, NULL, NULL, 1, 24),
(260, 1330, 5, NULL, NULL, NULL, NULL, 1, 24),
(261, 1330, 6, NULL, NULL, NULL, NULL, 1, 24),
(262, 1330, 9, NULL, NULL, NULL, NULL, 1, 24),
(263, 1477, 1, NULL, NULL, NULL, NULL, 1, 25),
(264, 1477, 2, NULL, NULL, NULL, NULL, 1, 25),
(265, 1477, 3, NULL, NULL, NULL, NULL, 1, 25),
(266, 1477, 4, NULL, NULL, NULL, NULL, 1, 25),
(267, 1477, 5, NULL, NULL, NULL, NULL, 1, 25),
(268, 1477, 6, NULL, NULL, NULL, NULL, 1, 25),
(269, 1477, 7, NULL, NULL, NULL, NULL, 1, 25),
(270, 1477, 8, NULL, NULL, NULL, NULL, 1, 25),
(271, 1477, 9, NULL, NULL, NULL, NULL, 1, 25),
(272, 1477, 10, NULL, NULL, NULL, NULL, 1, 25),
(273, 1477, 11, NULL, NULL, NULL, NULL, 1, 25),
(274, 1477, 1, NULL, NULL, NULL, NULL, 1, 26),
(275, 1477, 2, NULL, NULL, NULL, NULL, 1, 26),
(276, 1477, 3, NULL, NULL, NULL, NULL, 1, 26),
(277, 1477, 4, NULL, NULL, NULL, NULL, 1, 26),
(278, 1477, 5, NULL, NULL, NULL, NULL, 1, 26),
(279, 1477, 6, NULL, NULL, NULL, NULL, 1, 26),
(280, 1477, 7, NULL, NULL, NULL, NULL, 1, 26),
(281, 1477, 8, NULL, NULL, NULL, NULL, 1, 26),
(282, 1477, 9, NULL, NULL, NULL, NULL, 1, 26),
(283, 1477, 10, NULL, NULL, NULL, NULL, 1, 26),
(284, 1477, 11, NULL, NULL, NULL, NULL, 1, 26),
(285, 1477, 1, NULL, NULL, NULL, NULL, 1, 27),
(286, 1477, 2, NULL, NULL, NULL, NULL, 1, 27),
(287, 1477, 3, NULL, NULL, NULL, NULL, 1, 27),
(288, 1477, 4, NULL, NULL, NULL, NULL, 1, 27),
(289, 1477, 5, NULL, NULL, NULL, NULL, 1, 27),
(290, 1477, 6, NULL, NULL, NULL, NULL, 1, 27),
(291, 1477, 7, NULL, NULL, NULL, NULL, 1, 27),
(292, 1477, 8, NULL, NULL, NULL, NULL, 1, 27),
(293, 1477, 9, NULL, NULL, NULL, NULL, 1, 27),
(294, 1477, 10, NULL, NULL, NULL, NULL, 1, 27),
(295, 1477, 11, NULL, NULL, NULL, NULL, 1, 27),
(296, 1477, 1, NULL, NULL, NULL, NULL, 1, 28),
(297, 1477, 2, NULL, NULL, NULL, NULL, 1, 28),
(298, 1477, 3, NULL, NULL, NULL, NULL, 1, 28),
(299, 1477, 4, NULL, NULL, NULL, NULL, 1, 28),
(300, 1477, 5, NULL, NULL, NULL, NULL, 1, 28),
(301, 1477, 6, NULL, NULL, NULL, NULL, 1, 28),
(302, 1477, 7, NULL, NULL, NULL, NULL, 1, 28),
(303, 1477, 8, NULL, NULL, NULL, NULL, 1, 28),
(304, 1477, 9, NULL, NULL, NULL, NULL, 1, 28),
(305, 1477, 10, NULL, NULL, NULL, NULL, 1, 28),
(306, 1477, 11, NULL, NULL, NULL, NULL, 1, 28),
(307, 1477, 1, NULL, NULL, NULL, NULL, 1, 29),
(308, 1477, 2, NULL, NULL, NULL, NULL, 1, 29),
(309, 1477, 3, NULL, NULL, NULL, NULL, 1, 29),
(310, 1477, 4, NULL, NULL, NULL, NULL, 1, 29),
(311, 1477, 5, NULL, NULL, NULL, NULL, 1, 29),
(312, 1477, 6, NULL, NULL, NULL, NULL, 1, 29),
(313, 1477, 7, NULL, NULL, NULL, NULL, 1, 29),
(314, 1477, 8, NULL, NULL, NULL, NULL, 1, 29),
(315, 1477, 9, NULL, NULL, NULL, NULL, 1, 29),
(316, 1477, 10, NULL, NULL, NULL, NULL, 1, 29),
(317, 1477, 11, NULL, NULL, NULL, NULL, 1, 29),
(318, 1477, 1, NULL, NULL, NULL, NULL, 1, 30),
(319, 1477, 2, NULL, NULL, NULL, NULL, 1, 30),
(320, 1477, 3, NULL, NULL, NULL, NULL, 1, 30),
(321, 1477, 4, NULL, NULL, NULL, NULL, 1, 30),
(322, 1477, 5, NULL, NULL, NULL, NULL, 1, 30),
(323, 1477, 6, NULL, NULL, NULL, NULL, 1, 30),
(324, 1477, 7, NULL, NULL, NULL, NULL, 1, 30),
(325, 1477, 8, NULL, NULL, NULL, NULL, 1, 30),
(326, 1477, 9, NULL, NULL, NULL, NULL, 1, 30),
(327, 1477, 10, NULL, NULL, NULL, NULL, 1, 30),
(328, 1477, 11, NULL, NULL, NULL, NULL, 1, 30),
(329, 1514, 1, NULL, NULL, NULL, NULL, 1, 31),
(330, 1514, 5, NULL, NULL, NULL, NULL, 1, 31),
(331, 1514, 1, NULL, NULL, NULL, NULL, 1, 32),
(332, 1514, 5, NULL, NULL, NULL, NULL, 1, 32),
(333, 1514, 1, NULL, NULL, NULL, NULL, 1, 33),
(334, 1514, 5, NULL, NULL, NULL, NULL, 1, 33),
(335, 1514, 1, NULL, NULL, NULL, NULL, 1, 34),
(336, 1514, 5, NULL, NULL, NULL, NULL, 1, 34),
(337, 1514, 1, NULL, NULL, NULL, NULL, 1, 35),
(338, 1514, 5, NULL, NULL, NULL, NULL, 1, 35),
(339, 1614, 1, NULL, NULL, NULL, NULL, 1, 36),
(340, 1614, 1, NULL, NULL, NULL, NULL, 1, 37),
(341, 1614, 1, NULL, NULL, NULL, NULL, 1, 38),
(342, 1614, 1, NULL, NULL, NULL, NULL, 1, 39),
(343, 1614, 1, NULL, NULL, NULL, NULL, 1, 40),
(344, 1646, 1, NULL, NULL, NULL, NULL, 1, 41),
(345, 1646, 2, NULL, NULL, NULL, NULL, 1, 41),
(346, 1646, 11, NULL, NULL, NULL, NULL, 1, 41),
(347, 1646, 1, NULL, NULL, NULL, NULL, 1, 42),
(348, 1646, 2, NULL, NULL, NULL, NULL, 1, 42),
(349, 1646, 11, NULL, NULL, NULL, NULL, 1, 42),
(350, 1646, 1, NULL, NULL, NULL, NULL, 1, 43),
(351, 1646, 2, NULL, NULL, NULL, NULL, 1, 43),
(352, 1646, 11, NULL, NULL, NULL, NULL, 1, 43),
(353, 1646, 1, NULL, NULL, NULL, NULL, 1, 44),
(354, 1646, 2, NULL, NULL, NULL, NULL, 1, 44),
(355, 1646, 11, NULL, NULL, NULL, NULL, 1, 44),
(356, 1646, 1, NULL, NULL, NULL, NULL, 1, 45),
(357, 1646, 2, NULL, NULL, NULL, NULL, 1, 45),
(358, 1646, 11, NULL, NULL, NULL, NULL, 1, 45),
(359, 1646, 1, NULL, NULL, NULL, NULL, 1, 46),
(360, 1646, 2, NULL, NULL, NULL, NULL, 1, 46),
(361, 1646, 11, NULL, NULL, NULL, NULL, 1, 46),
(362, 1646, 1, NULL, NULL, NULL, NULL, 1, 47),
(363, 1646, 2, NULL, NULL, NULL, NULL, 1, 47),
(364, 1646, 11, NULL, NULL, NULL, NULL, 1, 47),
(365, 1650, 1, NULL, NULL, NULL, NULL, 1, 48),
(366, 1650, 2, NULL, NULL, NULL, NULL, 1, 48),
(367, 1650, 11, NULL, NULL, NULL, NULL, 1, 48),
(368, 1650, 1, NULL, NULL, NULL, NULL, 1, 49),
(369, 1650, 2, NULL, NULL, NULL, NULL, 1, 49),
(370, 1650, 11, NULL, NULL, NULL, NULL, 1, 49),
(371, 1650, 1, NULL, NULL, NULL, NULL, 1, 50),
(372, 1650, 2, NULL, NULL, NULL, NULL, 1, 50),
(373, 1650, 11, NULL, NULL, NULL, NULL, 1, 50),
(374, 1650, 1, NULL, NULL, NULL, NULL, 1, 51),
(375, 1650, 2, NULL, NULL, NULL, NULL, 1, 51),
(376, 1650, 11, NULL, NULL, NULL, NULL, 1, 51),
(377, 1650, 1, NULL, NULL, NULL, NULL, 1, 52),
(378, 1650, 2, NULL, NULL, NULL, NULL, 1, 52),
(379, 1650, 11, NULL, NULL, NULL, NULL, 1, 52),
(380, 1650, 1, NULL, NULL, NULL, NULL, 1, 53),
(381, 1650, 2, NULL, NULL, NULL, NULL, 1, 53),
(382, 1650, 11, NULL, NULL, NULL, NULL, 1, 53),
(383, 1650, 1, NULL, NULL, NULL, NULL, 1, 54),
(384, 1650, 2, NULL, NULL, NULL, NULL, 1, 54),
(385, 1650, 11, NULL, NULL, NULL, NULL, 1, 54),
(386, 1651, 1, NULL, NULL, NULL, NULL, 1, 55),
(387, 1651, 2, NULL, NULL, NULL, NULL, 1, 56),
(388, 1651, 11, NULL, NULL, NULL, NULL, 1, 57),
(389, 1651, 1, NULL, NULL, NULL, NULL, 1, 58),
(390, 1651, 2, NULL, NULL, NULL, NULL, 1, 59),
(391, 1651, 11, NULL, NULL, NULL, NULL, 1, 60),
(392, 1651, 1, NULL, NULL, NULL, NULL, 1, 61),
(393, 1651, 2, NULL, NULL, NULL, NULL, 1, 62),
(394, 1651, 11, NULL, NULL, NULL, NULL, 1, 63),
(395, 1651, 1, NULL, NULL, NULL, NULL, 1, 64),
(396, 1651, 2, NULL, NULL, NULL, NULL, 1, 65),
(397, 1651, 11, NULL, NULL, NULL, NULL, 1, 66),
(398, 1655, 1, NULL, NULL, NULL, NULL, 1, 67),
(399, 1655, 2, NULL, NULL, NULL, NULL, 1, 68),
(400, 1655, 11, NULL, NULL, NULL, NULL, 1, 69),
(401, 1655, 1, NULL, NULL, NULL, NULL, 1, 70),
(402, 1655, 2, NULL, NULL, NULL, NULL, 1, 71),
(403, 1655, 11, NULL, NULL, NULL, NULL, 1, 72),
(404, 1655, 1, NULL, NULL, NULL, NULL, 1, 73),
(405, 1655, 2, NULL, NULL, NULL, NULL, 1, 74),
(406, 1655, 11, NULL, NULL, NULL, NULL, 1, 75),
(407, 1655, 1, NULL, NULL, NULL, NULL, 1, 76),
(408, 1655, 2, NULL, NULL, NULL, NULL, 1, 77),
(409, 1655, 11, NULL, NULL, NULL, NULL, 1, 78),
(410, 1655, 1, NULL, NULL, NULL, NULL, 1, 79),
(411, 1655, 2, NULL, NULL, NULL, NULL, 1, 80),
(412, 1655, 11, NULL, NULL, NULL, NULL, 1, 81),
(413, 1655, 1, NULL, NULL, NULL, NULL, 1, 82),
(414, 1655, 2, NULL, NULL, NULL, NULL, 1, 83),
(415, 1655, 11, NULL, NULL, NULL, NULL, 1, 84),
(416, 1655, 1, NULL, NULL, NULL, NULL, 1, 85),
(417, 1655, 2, NULL, NULL, NULL, NULL, 1, 86),
(418, 1655, 11, NULL, NULL, NULL, NULL, 1, 87),
(419, 1665, 1, NULL, NULL, NULL, NULL, 1, 89),
(420, 1665, 2, NULL, NULL, NULL, NULL, 1, 90),
(421, 1665, 11, NULL, NULL, NULL, NULL, 1, 91),
(422, 1665, 1, NULL, NULL, NULL, NULL, 1, 92),
(423, 1665, 2, NULL, NULL, NULL, NULL, 1, 93),
(424, 1665, 11, NULL, NULL, NULL, NULL, 1, 94),
(425, 1665, 1, NULL, NULL, NULL, NULL, 1, 95),
(426, 1665, 2, NULL, NULL, NULL, NULL, 1, 96),
(427, 1665, 11, NULL, NULL, NULL, NULL, 1, 97),
(428, 1665, 1, NULL, NULL, NULL, NULL, 1, 98),
(429, 1665, 2, NULL, NULL, NULL, NULL, 1, 99),
(430, 1665, 11, NULL, NULL, NULL, NULL, 1, 100),
(431, 1665, 1, NULL, NULL, NULL, NULL, 1, 101),
(432, 1665, 2, NULL, NULL, NULL, NULL, 1, 102),
(433, 1665, 11, NULL, NULL, NULL, NULL, 1, 103),
(434, 1673, 1, NULL, NULL, NULL, NULL, 1, 104),
(435, 1673, 2, NULL, NULL, NULL, NULL, 1, 104),
(436, 1673, 11, NULL, NULL, NULL, NULL, 1, 104),
(437, 1673, 1, NULL, NULL, NULL, NULL, 1, 105),
(438, 1673, 2, NULL, NULL, NULL, NULL, 1, 105),
(439, 1673, 11, NULL, NULL, NULL, NULL, 1, 105),
(440, 1673, 1, NULL, NULL, NULL, NULL, 1, 106),
(441, 1673, 2, NULL, NULL, NULL, NULL, 1, 106),
(442, 1673, 11, NULL, NULL, NULL, NULL, 1, 106),
(443, 1673, 1, NULL, NULL, NULL, NULL, 1, 107),
(444, 1673, 2, NULL, NULL, NULL, NULL, 1, 107),
(445, 1673, 11, NULL, NULL, NULL, NULL, 1, 107),
(446, 1673, 1, NULL, NULL, NULL, NULL, 1, 108),
(447, 1673, 2, NULL, NULL, NULL, NULL, 1, 108),
(448, 1673, 11, NULL, NULL, NULL, NULL, 1, 108),
(449, 1989, 1, NULL, NULL, NULL, NULL, 1, 109),
(450, 1989, 2, NULL, NULL, NULL, NULL, 1, 109),
(451, 1989, 3, NULL, NULL, NULL, NULL, 1, 109),
(452, 1989, 5, NULL, NULL, NULL, NULL, 1, 109),
(453, 1989, 1, NULL, NULL, NULL, NULL, 1, 110),
(454, 1989, 2, NULL, NULL, NULL, NULL, 1, 110),
(455, 1989, 3, NULL, NULL, NULL, NULL, 1, 110),
(456, 1989, 5, NULL, NULL, NULL, NULL, 1, 110),
(457, 1989, 1, NULL, NULL, NULL, NULL, 1, 111),
(458, 1989, 2, NULL, NULL, NULL, NULL, 1, 111),
(459, 1989, 3, NULL, NULL, NULL, NULL, 1, 111),
(460, 1989, 5, NULL, NULL, NULL, NULL, 1, 111),
(461, 1989, 1, NULL, NULL, NULL, NULL, 1, 112),
(462, 1989, 2, NULL, NULL, NULL, NULL, 1, 112),
(463, 1989, 3, NULL, NULL, NULL, NULL, 1, 112),
(464, 1989, 5, NULL, NULL, NULL, NULL, 1, 112),
(465, 1989, 1, NULL, NULL, NULL, NULL, 1, 113),
(466, 1989, 2, NULL, NULL, NULL, NULL, 1, 113),
(467, 1989, 3, NULL, NULL, NULL, NULL, 1, 113),
(468, 1989, 5, NULL, NULL, NULL, NULL, 1, 113),
(469, 1989, 1, NULL, NULL, NULL, NULL, 1, 114),
(470, 1989, 2, NULL, NULL, NULL, NULL, 1, 114),
(471, 1989, 3, NULL, NULL, NULL, NULL, 1, 114),
(472, 1989, 5, NULL, NULL, NULL, NULL, 1, 114),
(473, 2009, 1, NULL, NULL, NULL, NULL, 1, 115),
(474, 2009, 2, NULL, NULL, NULL, NULL, 1, 115),
(475, 2009, 3, NULL, NULL, NULL, NULL, 1, 115),
(476, 2009, 9, NULL, NULL, NULL, NULL, 1, 115),
(477, 2009, 1, NULL, NULL, NULL, NULL, 1, 116),
(478, 2009, 2, NULL, NULL, NULL, NULL, 1, 116),
(479, 2009, 3, NULL, NULL, NULL, NULL, 1, 116),
(480, 2009, 9, NULL, NULL, NULL, NULL, 1, 116),
(481, 2009, 1, NULL, NULL, NULL, NULL, 1, 117),
(482, 2009, 2, NULL, NULL, NULL, NULL, 1, 117),
(483, 2009, 3, NULL, NULL, NULL, NULL, 1, 117),
(484, 2009, 9, NULL, NULL, NULL, NULL, 1, 117),
(485, 2009, 1, NULL, NULL, NULL, NULL, 1, 118),
(486, 2009, 2, NULL, NULL, NULL, NULL, 1, 118),
(487, 2009, 3, NULL, NULL, NULL, NULL, 1, 118),
(488, 2009, 9, NULL, NULL, NULL, NULL, 1, 118),
(489, 2009, 1, NULL, NULL, NULL, NULL, 1, 119),
(490, 2009, 2, NULL, NULL, NULL, NULL, 1, 119),
(491, 2009, 3, NULL, NULL, NULL, NULL, 1, 119),
(492, 2009, 9, NULL, NULL, NULL, NULL, 1, 119);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
`cat_id` int(4) NOT NULL,
  `parent_id` int(4) DEFAULT NULL,
  `left_id` int(8) NOT NULL,
  `right_id` int(8) NOT NULL,
  `level` int(1) NOT NULL,
  `cat_name` tinytext,
  `sub_counter` int(11) DEFAULT '0',
  `counter` int(11) DEFAULT '0',
  `cat_colour` varchar(15) DEFAULT '',
  `cat_image` varchar(150) DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `parent_id`, `left_id`, `right_id`, `level`, `cat_name`, `sub_counter`, `counter`, `cat_colour`, `cat_image`) VALUES
(1, -1, 1, 12, -1, 'All', 0, 0, '', ''),
(204, 1, 6, 11, 0, 'Traditional', 0, 0, '', ''),
(205, 204, 9, 10, 1, 'Bill Boards', 0, 0, '', ''),
(206, 204, 7, 8, 1, 'Bins', 0, 0, '', ''),
(207, 1, 2, 5, 0, 'Digital', 0, 0, '', ''),
(208, 207, 3, 4, 1, 'Street Poles', 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
`cit_id` smallint(6) NOT NULL,
  `cou_code` varchar(255) DEFAULT NULL,
  `cit_pos_code` int(11) DEFAULT NULL,
  `cit_name` varchar(255) DEFAULT NULL,
  `cit_lat` varchar(255) DEFAULT NULL,
  `cit_long` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cit_id`, `cou_code`, `cit_pos_code`, `cit_name`, `cit_lat`, `cit_long`) VALUES
(1, 'ZA', 6270, 'Aberdeen', '-32.4833', '24.0667'),
(2, 'ZA', 1227, 'Acornhoek', '-24.5833', '31.0833'),
(3, 'ZA', 6105, 'Addo', '-33.5667', '25.6833'),
(4, 'ZA', 5760, 'Adelaide', '-32.7', '26.3'),
(5, 'ZA', 6282, 'Adendorp', '-32.3', '24.55'),
(6, 'ZA', 6695, 'Albertina', '-34.2', '21.5833'),
(7, 'ZA', 6695, 'Albertinia', '-34.2', '21.5833'),
(8, 'ZA', 1447, 'Alberton', '-26.2333', '28.1333'),
(9, 'ZA', 8290, 'Alexander Bay', '-28.5833', '16.4833'),
(10, 'ZA', 6185, 'Alexandria', '-24.9167', '31.15'),
(11, 'ZA', 5700, 'Alice', '-32.7833', '26.8333'),
(12, 'ZA', 6135, 'Alicedale', '-33.3167', '26.0833'),
(13, 'ZA', 9750, 'Aliwal North', '-30.7', '26.7'),
(14, 'ZA', 9750, 'Aliwal-Noord', '-30.7', '26.7'),
(15, 'ZA', 9490, 'Allanridge', '-27.75', '26.6667'),
(16, 'ZA', 1709, 'Allen''S Nek', '-31.6667', '28.0333'),
(17, 'ZA', 1428, 'Alrode', '-26.3', '28.1333'),
(18, 'ZA', 3279, 'Amanzimtoti', '-30.05', '30.8833'),
(19, 'ZA', 2490, 'Amersfoort', '-26.9833', '28.85'),
(20, 'ZA', 2375, 'Amsterdam', '-26.6167', '30.6667'),
(21, 'ZA', 4230, 'Anerley', '-30.6667', '30.5'),
(22, 'ZA', 9602, 'Arlington', '-28.0333', '27.85'),
(23, 'ZA', 6715, 'Ashton', '-33.8167', '20.05'),
(24, 'ZA', 7764, 'Athlone', '-33.9667', '18.5'),
(25, 'ZA', 7304, 'Atlantis', '-33.5667', '18.4833'),
(26, 'ZA', 749, 'Atok', '-23.95', '29.1333'),
(27, 'ZA', 8, 'Atteridgeville', '-25.7728', '28.0678'),
(28, 'ZA', 746, 'Bakone', '-23.95', '29.1333'),
(29, 'ZA', 2410, 'Balfour', '-26.65', '28.5833'),
(30, 'ZA', 432, 'Bamokgoko', '-25.1039', '28.5219'),
(31, 'ZA', 1300, 'Barberton', '-25.7833', '31.05'),
(32, 'ZA', 9786, 'Barkly East', '-30.9667', '27.6'),
(33, 'ZA', 8375, 'Barkly West', '-28.5333', '24.5167'),
(34, 'ZA', 6166, 'Bathurst', '-33.4833', '26.8333'),
(35, 'ZA', 8315, 'Beaconsfield', '-22.9333', '30.1167'),
(36, 'ZA', 6970, 'Beaufort Wes', '-32.35', '22.5833'),
(37, 'ZA', 6940, 'Beaufort West', '-32.35', '22.5833'),
(38, 'ZA', 6970, 'Beaufort-Wes', '-32.35', '22.5833'),
(39, 'ZA', 5780, 'Bedford', '-32.6833', '26.0833'),
(40, 'ZA', 2007, 'Bedfordview', '-26.1667', '28.15'),
(41, 'ZA', 1940, 'Bedworth Park', '-26.7167', '27.8833'),
(42, 'ZA', 1779, 'Bekkersdal', '-26.2833', '27.7167'),
(43, 'ZA', 1100, 'Belfast', '-25.6833', '30.0333'),
(44, 'ZA', 7493, 'Belhar', '-33.9222', '18.5333'),
(45, 'ZA', 7530, 'Bellville', '-33.9', '18.6333'),
(46, 'ZA', 1501, 'Benoni', '-26.1833', '28.3167'),
(47, 'ZA', 3350, 'Bergville', '-28.7333', '29.3667'),
(48, 'ZA', 7945, 'Bergvliet', '-34.0475', '18.4525'),
(49, 'ZA', 2309, 'Bethal', '-26.45', '29.4667'),
(50, 'ZA', 6028, 'Bethelsdorp', '-33.8833', '25.5'),
(51, 'ZA', 9700, 'Bethlehem', '-28.2333', '28.3'),
(52, 'ZA', 9992, 'Bethulie', '-30.5333', '21.2833'),
(53, 'ZA', 5605, 'Bisho', '-32.8667', '27.4333'),
(54, 'ZA', 8201, 'Bitterfontein', '-31.0333', '18.2667'),
(55, 'ZA', 4800, 'Bizana', '-30.85', '29.85'),
(56, 'ZA', 7580, 'Blackheath', '-26.1333', '27.9667'),
(57, 'ZA', 2250, 'Blinkpan', '-26.1', '29.4333'),
(58, 'ZA', 9300, 'Bloemfontein', '-29.1333', '26.2'),
(59, 'ZA', 2660, 'Bloemhof', '-27.65', '25.6'),
(60, 'ZA', 9364, 'Bloemspruit', '-29.1333', '26.25'),
(61, 'ZA', 3024, 'Blood River', '-28.1909', '30.2879'),
(62, 'ZA', 7441, 'Bloubergrant', '-33.8213', '18.4454'),
(63, 'ZA', 7441, 'Bloubergstrand', '-33.8213', '18.4454'),
(64, 'ZA', 4052, 'Bluff', '-29.85', '31.0167'),
(65, 'ZA', 626, 'Bochum', '-24.1667', '29'),
(66, 'ZA', 9702, 'Bohlokong', '-28.2333', '28.3'),
(67, 'ZA', 308, 'Boitekong', '-25.6667', '27.25'),
(68, 'ZA', 1446, 'Boksburg', '-26.2167', '28.25'),
(69, 'ZA', 474, 'Boleu', '-25.15', '29.3833'),
(70, 'ZA', 6730, 'Bonnievale', '-33.9333', '22.0333'),
(71, 'ZA', 182, 'Boordfontein', '-25.6771', '28.1867'),
(72, 'ZA', 182, 'Boordfontein West', '-25.6771', '28.1867'),
(73, 'ZA', 182, 'Boordfontein-Wes', '-25.6771', '28.1867'),
(74, 'ZA', 1286, 'Bosbokrand', '-24.8333', '31.0667'),
(75, 'ZA', 8340, 'Boshof', '-28.55', '25.2333'),
(76, 'ZA', 2528, 'Boskop', '-29.5', '26.2'),
(77, 'ZA', 3660, 'Botha''S Hill', '-29.7167', '30.7333'),
(78, 'ZA', 9660, 'Bothaville', '-27.3667', '26.6167'),
(79, 'ZA', 9781, 'Botshabelo', '-29.2333', '26.7333'),
(80, 'ZA', 727, 'Boyne', '-23.9333', '29.8167'),
(81, 'ZA', 7560, 'Brackenfell', '-33.8667', '18.6833'),
(82, 'ZA', 1540, 'Brakpan', '-26.2333', '28.3667'),
(83, 'ZA', 1541, 'Brakpan North', '-26.2333', '28.3667'),
(84, 'ZA', 2054, 'Bramley', '-26.2', '28.0833'),
(85, 'ZA', 9400, 'Brandfort', '-28.7', '26.4667'),
(86, 'ZA', 7281, 'Bredasdorp', '-34.5333', '20.0333'),
(87, 'ZA', 2330, 'Breyten', '-26.3', '29.9833'),
(88, 'ZA', 189, 'Brits', '-25.6333', '27.7833'),
(89, 'ZA', 8782, 'Britstown', '-30.5833', '23.5'),
(90, 'ZA', 2154, 'Bromhof', '-26.2', '28.0833'),
(91, 'ZA', 1020, 'Bronkhorstspruit', '-25.8083', '28.7406'),
(92, 'ZA', 2021, 'Bryanston', '-26.2', '28.0833'),
(93, 'ZA', 9670, 'Bultfontein', '-25.1167', '28.5667'),
(94, 'ZA', 3244, 'Bulwer', '-29.8', '29.75'),
(95, 'ZA', 9744, 'Burgersdorp', '-30.9833', '26.3167'),
(96, 'ZA', 1085, 'Burgersfort', '-24.6667', '30.3333'),
(97, 'ZA', 1255, 'Bushbuckridge', '-24.8333', '31.0667'),
(98, 'ZA', 4960, 'Butterworth', '-32.3333', '28.15'),
(99, 'ZA', 5455, 'Cala', '-31.5167', '27.7'),
(100, 'ZA', 7185, 'Caledon', '-34.2167', '19.4167'),
(101, 'ZA', 6660, 'Calitzdorp', '-33.5333', '21.6833'),
(102, 'ZA', 8190, 'Calvinia', '-31.4667', '19.7833'),
(103, 'ZA', 5247, 'Cambridge', '-32.9667', '27.8833'),
(104, 'ZA', 7100, 'Cape Town', '-33.9167', '18.4167'),
(105, 'ZA', 2495, 'Carletonville', '-26.3667', '27.4'),
(106, 'ZA', 2534, 'Carltonville', '-26.7167', '27.1'),
(107, 'ZA', 8922, 'Carnarvon', '-30.95', '22.1333'),
(108, 'ZA', 1185, 'Carolina', '-26.0693', '30.1149'),
(109, 'ZA', 5310, 'Cathcart', '-32.3', '27.1333'),
(110, 'ZA', 3680, 'Cato Ridge', '-29.7333', '30.5833'),
(111, 'ZA', 14, 'Centurion', '-25.7069', '28.2294'),
(112, 'ZA', 6835, 'Ceres', '-33.3667', '19.3167'),
(113, 'ZA', 3871, 'Ceza', '-27.9833', '31.3833'),
(114, 'ZA', 3604, 'Chatsworth', '-29.8167', '30.85'),
(115, 'ZA', 2680, 'Christiana', '-28.2333', '21.25'),
(116, 'ZA', 362, 'Chromite', '-24.6', '27.4'),
(117, 'ZA', 745, 'Chuenespoort', '-23.95', '29.1333'),
(118, 'ZA', 7340, 'Citrusdal', '-32.6', '19.0167'),
(119, 'ZA', 8120, 'Clanwilliam', '-32.1833', '18.9'),
(120, 'ZA', 7708, 'Claremont', '-33.9833', '18.4667'),
(121, 'ZA', 9707, 'Clarens', '-28.5167', '28.4167'),
(122, 'ZA', 5024, 'Clarkebury', '-31.7833', '28.3'),
(123, 'ZA', 3610, 'Clernaville', '-29.8139', '30.8389'),
(124, 'ZA', 9735, 'Clocolan', '-28.9', '27.5667'),
(125, 'ZA', 1033, 'Coalville', '-26.0333', '29.1667'),
(126, 'ZA', 5329, 'Cofimvaba', '-32.0167', '27.5833'),
(127, 'ZA', 6175, 'Colchester', '-33.6', '26.9'),
(128, 'ZA', 3360, 'Colenso', '-28.7333', '29.8167'),
(129, 'ZA', 9795, 'Colesberg', '-30.7333', '25.1'),
(130, 'ZA', 2725, 'Coligny', '-26.3333', '26.3167'),
(131, 'ZA', 7806, 'Constantia', '-34.0167', '18.45'),
(132, 'ZA', 5820, 'Cookhouse', '-32.75', '25.8167'),
(133, 'ZA', 9850, 'Cornelia', '-23.7167', '29.1333'),
(134, 'ZA', 5365, 'Cradock', '-32.1833', '25.6167'),
(135, 'ZA', 7764, 'Crawford', '-33.9833', '18.5'),
(136, 'ZA', 3263, 'Creighton', '-30.0333', '29.8333'),
(137, 'ZA', 1002, 'Cullinan', '-25.6756', '28.5222'),
(138, 'ZA', 1541, 'Dalpark', '-26.2333', '28.3667'),
(139, 'ZA', 3230, 'Dalton', '-29.3333', '30.6333'),
(140, 'ZA', 8405, 'Danielskuil', '-28.1833', '23.5333'),
(141, 'ZA', 3080, 'Dannhause', '-28', '30.05'),
(142, 'ZA', 3080, 'Dannhauser', '-28', '30.05'),
(143, 'ZA', 7345, 'Darling', '-26.9833', '29.3167'),
(144, 'ZA', 4480, 'Darnall', '-26.4', '23.25'),
(145, 'ZA', 7347, 'Dassenberg', '-33.0833', '18.75'),
(146, 'ZA', 1519, 'Daveyton', '-26.15', '28.4167'),
(147, 'ZA', 7000, 'De Aar', '-30.65', '24.0167'),
(148, 'ZA', 1884, 'De Deur', '-26.5333', '27.9333'),
(149, 'ZA', 9348, 'Dealesville', '-28.6667', '25.7667'),
(150, 'ZA', 2718, 'Delareyville', '-26.6833', '25.4667'),
(151, 'ZA', 7100, 'Delft', '-33.9778', '18.6167'),
(152, 'ZA', 2210, 'Delmas', '-26.15', '28.6833'),
(153, 'ZA', 1401, 'Delmore', '-26.2', '28.175'),
(154, 'ZA', 8377, 'Delportshoop', '-28.4167', '24.3'),
(155, 'ZA', 786, 'Dendron', '-23.3833', '29.3333'),
(156, 'ZA', 1932, 'Deneysville', '-26.8833', '28.1'),
(157, 'ZA', 160, 'Denneboom', '-25.7181', '28.3342'),
(158, 'ZA', 35, 'Derdepoortpark', '-25.7069', '28.2294'),
(159, 'ZA', 4399, 'Desainagar', '-29.114', '30.6772'),
(160, 'ZA', 6220, 'Despatch', '-33.8', '25.4667'),
(161, 'ZA', 2260, 'Devon', '-26.35', '28.7667'),
(162, 'ZA', 9940, 'Dewetsdorp', '-29.5833', '26.6667'),
(163, 'ZA', 457, 'Dibasabophelo', '-24.9667', '29.3'),
(164, 'ZA', 7800, 'Diep River', '-34.0345', '18.4651'),
(165, 'ZA', 1804, 'Diepkloof', '-26.2333', '27.9333'),
(166, 'ZA', 9873, 'Dikgakeng', '-28.5333', '28.8'),
(167, 'ZA', 721, 'Dikgale', '-23.7333', '29.7833'),
(168, 'ZA', 2868, 'Dinokana', '-25.45', '25.8667'),
(169, 'ZA', 1723, 'Dobsonville', '-26.2167', '27.8667'),
(170, 'ZA', 3237, 'Donnybrook', '-29.9333', '29.8667'),
(171, 'ZA', 4126, 'Doonside', '-30.0667', '30.8833'),
(172, 'ZA', 17, 'Doornpoort', '-25.6333', '28.2667'),
(173, 'ZA', 5420, 'Dordrecht', '-31.3667', '27.05'),
(174, 'ZA', 4091, 'Dormerton', '-29.85', '31'),
(175, 'ZA', 8730, 'Douglas', '-29.0667', '23.7667'),
(176, 'ZA', 1128, 'Driekop', '-24.5833', '30.1667'),
(177, 'ZA', 1801, 'Dube', '-26.25', '27.9167'),
(178, 'ZA', 1494, 'Duduza', '-26.3667', '28.4167'),
(179, 'ZA', 815, 'Duiwelskloof', '-23.7', '30.1333'),
(180, 'ZA', 3000, 'Dundee', '-28.1667', '30.2333'),
(181, 'ZA', 2336, 'Dundonald', '-26.5333', '29.9833'),
(182, 'ZA', 1496, 'Dunnottar', '-26.35', '28.4167'),
(183, 'ZA', 3611, 'Durban', '-29.85', '31.0167'),
(184, 'ZA', 4019, 'Durban North', '-29.8', '31.0333'),
(185, 'ZA', 4051, 'Durban-Noord', '-29.8', '31.0333'),
(186, 'ZA', 7550, 'Durbanville', '-33.8333', '18.65'),
(187, 'ZA', 812, 'Dwars River', '-23.45', '29.75'),
(188, 'ZA', 955, 'Dzanani', '-22.8833', '30.1667'),
(189, 'ZA', 5201, 'East London', '-33.025', '27.9082'),
(190, 'ZA', 5740, 'Eastern Cape', '-32.765', '26.685'),
(191, 'ZA', 9908, 'Edenburg', '-29.7333', '25.9333'),
(192, 'ZA', 3201, 'Edendale', '-29.65', '30.2833'),
(193, 'ZA', 1609, 'Edenvale', '-26.1333', '28.1833'),
(194, 'ZA', 9535, 'Edenville', '-29.2667', '21.6333'),
(195, 'ZA', 7100, 'Eerste River', '-34', '18.7333'),
(196, 'ZA', 7100, 'Eerste Rivier', '-33.9778', '18.6167'),
(197, 'ZA', 7100, 'Eersterivier', '-34.0167', '18.7'),
(198, 'ZA', 22, 'Eersterus', '-25.7236', '28.3194'),
(199, 'ZA', 1021, 'Ekangala', '-25.6944', '28.7483'),
(200, 'ZA', 1429, 'Elandsfontein', '-26.3833', '27.8667'),
(201, 'ZA', 3226, 'Elandskop', '-29.3167', '29.7'),
(202, 'ZA', 1811, 'Eldoradopark', '-26.3', '27.9'),
(203, 'ZA', 5460, 'Elliot', '-30.9167', '26.6833'),
(204, 'ZA', 5070, 'Elliotdale', '-31.9667', '28.6833'),
(205, 'ZA', 531, 'Ellisras', '-23.6667', '27.7333'),
(206, 'ZA', 1409, 'Elsburg', '-26.2333', '28.2'),
(207, 'ZA', 7490, 'Elsies River', '-33.9222', '18.5222'),
(208, 'ZA', 7490, 'Elsiesrivier', '-33.9167', '18.5667'),
(209, 'ZA', 7764, 'Elspark', '-33.9778', '18.5167'),
(210, 'ZA', 2285, 'Embalenhle', '-26.5333', '29.0667'),
(211, 'ZA', 6011, 'Emerald Hill', '-34', '25.55'),
(212, 'ZA', 3101, 'Emondlo', '-28.2533', '29.9933'),
(213, 'ZA', 3875, 'Empangeni', '-28.75', '31.9'),
(214, 'ZA', 458, 'Empumalanga', '-25.3167', '31.1'),
(215, 'ZA', 5050, 'Engcobo', '-31.6833', '28'),
(216, 'ZA', 1824, 'Ennerdale', '-26.4167', '27.8333'),
(217, 'ZA', 2330, 'Ermelo', '-26.5333', '29.9833'),
(218, 'ZA', 3814, 'Eshowe', '-28.8833', '31.4667'),
(219, 'ZA', 3887, 'Esikhawini', '-28.8833', '31.9'),
(220, 'ZA', 6012, 'Estadeal', '-33.9667', '25.5833'),
(221, 'ZA', 3280, 'Estcourt', '-29', '29.8833'),
(222, 'ZA', 1519, 'Ethwathwa West Uit 2', '-26.15', '28.4167'),
(223, 'ZA', 2260, 'Evander', '-26.35', '28.7667'),
(224, 'ZA', 9760, 'Excelsior', '-25.8333', '30.5167'),
(225, 'ZA', 3381, 'Ezakheni', '-28.55', '29.7833'),
(226, 'ZA', 43, 'Faerie Glen', '-30.85', '30.3333'),
(227, 'ZA', 9978, 'Fauresmith', '-29.75', '25.3167'),
(228, 'ZA', 9730, 'Ficksburg', '-28.8833', '27.8833'),
(229, 'ZA', 7130, 'Firgrove', '-34.075', '18.8083'),
(230, 'ZA', 7975, 'Fish Hoek', '-34.0056', '18.4222'),
(231, 'ZA', 7975, 'Fishhoek', '-34.0056', '18.4222'),
(232, 'ZA', 4810, 'Flagstaff', '-31.0833', '29.4833'),
(233, 'ZA', 1700, 'Florida', '-26.1667', '27.9167'),
(234, 'ZA', 2515, 'Fochville', '-26.4833', '27.5'),
(235, 'ZA', 5720, 'Fort Beaufort', '-32.7833', '26.6333'),
(236, 'ZA', 2055, 'Four Ways', '-26.0333', '27.9833'),
(237, 'ZA', 9725, 'Fouriesburg', '-28.5833', '28.1333'),
(238, 'ZA', 9830, 'Frankfort', '-27.2833', '28.5'),
(239, 'ZA', 7690, 'Franschhoek', '-33.9166', '19.1166'),
(240, 'ZA', 6960, 'Fraserburg', '-31.9167', '21.5167'),
(241, 'ZA', 9430, 'Free State', '-28.1167', '26.9'),
(242, 'ZA', 838, 'Gakgapane', '-23.3167', '30.7167'),
(243, 'ZA', 8330, 'Galeshewe', '-27.9796', '25.1093'),
(244, 'ZA', 705, 'Ga-Maraba', '-23.7167', '29.3167'),
(245, 'ZA', 6241, 'Gambleville', '-33.7839', '25.3974'),
(246, 'ZA', 7220, 'Gans Bay', '-34.5833', '19.35'),
(247, 'ZA', 8582, 'Ganyesa', '-26.6', '24.1833'),
(248, 'ZA', 208, 'Ga-Rankuwa', '-25.5883', '28.0078'),
(249, 'ZA', 9775, 'Garapulana', '-29.3154', '27.4386'),
(250, 'ZA', 9775, 'Ga-Rapulana', '-29.3154', '27.4386'),
(251, 'ZA', 8221, 'Garies', '-30.55', '17.9833'),
(252, 'ZA', 42, 'Garsfontein', '-25.8008', '28.2956'),
(253, 'ZA', 9323, 'Gasehunelo', '-28.0833', '24.8917'),
(254, 'ZA', 9323, 'Ga-Sehunelo', '-27.0333', '23.5833'),
(255, 'ZA', 7762, 'Gatesville', '-33.9625', '18.4917'),
(256, 'ZA', 1438, 'Gauteng', '-26.3583', '28.2667'),
(257, 'ZA', 9468, 'Geduldpan', '-27.9833', '26.7333'),
(258, 'ZA', 6020, 'Gelvandale', '-33.9167', '25.55'),
(259, 'ZA', 6529, 'George', '-33.9667', '22.45'),
(260, 'ZA', 6529, 'George East', '-33.8167', '25.65'),
(261, 'ZA', 1401, 'Germiston', '-26.2167', '28.1833'),
(262, 'ZA', 3610, 'Gillitts', '-29.8', '30.8'),
(263, 'ZA', 3800, 'Gingindlovu', '-29.0167', '31.5833'),
(264, 'ZA', 826, 'Giyani', '-23.3167', '30.7167'),
(265, 'ZA', 2930, 'Glencoe', '-28.1833', '30.15'),
(266, 'ZA', 10, 'Glenstantia', '-25.7069', '28.2294'),
(267, 'ZA', 5257, 'Gonubie', '-32.9333', '28.0167'),
(268, 'ZA', 7460, 'Goodwood', '-33.9', '18.55'),
(269, 'ZA', 7140, 'Gordon''S Bay', '-34.1667', '18.8667'),
(270, 'ZA', 6280, 'Graaff-Reinet', '-32.25', '24.55'),
(271, 'ZA', 8121, 'Graafwater', '-32.15', '18.6'),
(272, 'ZA', 7160, 'Grabouw', '-34.15', '19.0167'),
(273, 'ZA', 5805, 'Grahamstad', '-33.3', '26.5333'),
(274, 'ZA', 5805, 'Grahamstown', '-33.3', '26.5333'),
(275, 'ZA', 1270, 'Graskop', '-24.9333', '30.8333'),
(276, 'ZA', 7805, 'Grassy Park', '-34.05', '18.4833'),
(277, 'ZA', 6525, 'Great Brak River', '-34.0333', '22.2167'),
(278, 'ZA', 3233, 'Greytown', '-29.4333', '30.5833'),
(279, 'ZA', 8365, 'Griquatown', '-28.85', '23.25'),
(280, 'ZA', 470, 'Groblersdal', '-25.15', '29.3833'),
(281, 'ZA', 8826, 'Groblershoop', '-28.8833', '21.9833'),
(282, 'ZA', 6525, 'Groot-Brakrivier', '-34.0333', '22.2167'),
(283, 'ZA', 8822, 'Grootdrink', '-26.4833', '22.2333'),
(284, 'ZA', 7750, 'Gugulethu', '-33.9833', '18.575'),
(285, 'ZA', 7750, 'Guguletu', '-33.9833', '18.5667'),
(286, 'ZA', 6351, 'Hackney', '-32.3167', '26.6333'),
(287, 'ZA', 1684, 'Halfway House', '-25.9833', '28.1167'),
(288, 'ZA', 4399, 'Hambanathi Heights', '-29.114', '30.6772'),
(289, 'ZA', 400, 'Hammanskraal', '-25.4075', '28.2856'),
(290, 'ZA', 3670, 'Hammarsdale', '-29.8', '30.65'),
(291, 'ZA', 6350, 'Hankey', '-33.8333', '24.8833'),
(292, 'ZA', 7005, 'Hanover', '-31.0667', '24.45'),
(293, 'ZA', 4643, 'Harding', '-30.5833', '29.8833'),
(294, 'ZA', 3372, 'Harrismith', '-28.2833', '29.1333'),
(295, 'ZA', 2600, 'Hartbeesfontein', '-26.7667', '26.4167'),
(296, 'ZA', 216, 'Hartbeespoort', '-25.7333', '27.85'),
(297, 'ZA', 6520, 'Hartenbos', '-34.1167', '22.1167'),
(298, 'ZA', 8570, 'Hartswater', '-27.7667', '24.8167'),
(299, 'ZA', 83, 'Hatfield', '-25.7467', '28.2231'),
(300, 'ZA', 1240, 'Hazyview', '-25.3167', '31.0167'),
(301, 'ZA', 7945, 'Heathfield', '-34.05', '18.4667'),
(302, 'ZA', 1439, 'Heidelberg', '-26.5', '28.35'),
(303, 'ZA', 6665, 'Heidelberg Wc', '-33.5333', '21.6833'),
(304, 'ZA', 9650, 'Heilbron', '-27.2833', '27.9667'),
(305, 'ZA', 1098, 'Hendrina', '-26.15', '29.7167'),
(306, 'ZA', 68, 'Hercules', '-25.7167', '28.1833'),
(307, 'ZA', 7200, 'Hermanus', '-34.4166', '19.2333'),
(308, 'ZA', 9756, 'Herschel', '-30.6167', '27.1667'),
(309, 'ZA', 9482, 'Hertzogville', '-28.1333', '25.5'),
(310, 'ZA', 4200, 'Hibberdene', '-30.3167', '30.6667'),
(311, 'ZA', 3305, 'Highflats', '-30.2667', '30.2'),
(312, 'ZA', 157, 'Highveld', '-25.8049', '28.2056'),
(313, 'ZA', 3610, 'Hillcrest', '-29.7667', '30.7667'),
(314, 'ZA', 3937, 'Hlabisa', '-28.1333', '31.8667'),
(315, 'ZA', 3145, 'Hlobane', '-27.7167', '31'),
(316, 'ZA', 3950, 'Hluhluwe', '-28.0333', '32.2833'),
(317, 'ZA', 1362, 'Hluvukani', '-24.65', '31.3333'),
(318, 'ZA', 9740, 'Hobhouse', '-29.5333', '27.15'),
(319, 'ZA', 1371, 'Hoedspruit', '-24.35', '30.9667'),
(320, 'ZA', 5930, 'Hofmeyr', '-31.65', '25.8'),
(321, 'ZA', 7355, 'Hopefield', '-33.0667', '18.35'),
(322, 'ZA', 8750, 'Hopetown', '-29.6167', '24.0833'),
(323, 'ZA', 8467, 'Hotazel', '-27.2', '22.9667'),
(324, 'ZA', 7806, 'Hout Bay', '-33.9166', '18.4166'),
(325, 'ZA', 7806, 'Houtbaai', '-33.9166', '18.4166'),
(326, 'ZA', 3224, 'Howick', '-29.4667', '30.2333'),
(327, 'ZA', 7627, 'Huguenot', '-31.0833', '26.6'),
(328, 'ZA', 6300, 'Humansdorp', '-34.0333', '24.7667'),
(329, 'ZA', 6017, 'Hunter''S Retreat', '-33.9667', '25.5833'),
(330, 'ZA', 2070, 'Hurlingham View', '-26.2', '28.0833'),
(331, 'ZA', 5000, 'Idutywa', '-32.1', '28.3'),
(332, 'ZA', 4185, 'Ifafa Beach', '-30.45', '30.65'),
(333, 'ZA', 4126, 'Illovo Beach', '-30.1167', '30.85'),
(334, 'ZA', 3227, 'Impendle', '-29.6', '29.8667'),
(335, 'ZA', 4032, 'Inanda', '-26.1167', '28.05'),
(336, 'ZA', 5445, 'Indwe', '-31.4667', '27.3333'),
(337, 'ZA', 3964, 'Ingwavuma', '-27.1333', '31.9833'),
(338, 'ZA', 4066, 'Isipingo', '-29.9667', '30.8833'),
(339, 'ZA', 4115, 'Isipingo Beach', '-29.9833', '30.95'),
(340, 'ZA', 2717, 'Itsoseng', '-26.0667', '25.8833'),
(341, 'ZA', 1689, 'Ivory Park', '-25.9911', '28.1718'),
(342, 'ZA', 4260, 'Izingolweni', '-30.7833', '30.1333'),
(343, 'ZA', 4109, 'Jacobs', '-29.9333', '30.9833'),
(344, 'ZA', 8710, 'Jacobsdal', '-25.6333', '26.0667'),
(345, 'ZA', 9974, 'Jagersfontein', '-29.7667', '25.4167'),
(346, 'ZA', 9742, 'Jamestown', '-31.1167', '26.8'),
(347, 'ZA', 8534, 'Jan Kempdorp', '-27.9167', '24.85'),
(348, 'ZA', 6265, 'Jansenville', '-32.9333', '24.6667'),
(349, 'ZA', 6330, 'Jeffreys Bay', '-33.9028', '24.8675'),
(350, 'ZA', 6332, 'Jeffreysbaai', '-34.05', '24.9167'),
(351, 'ZA', 2094, 'Jeppestown', '-26.2', '28.0833'),
(352, 'ZA', 2000, 'Johannesburg', '-26.2', '28.0833'),
(353, 'ZA', 6410, 'Joubertina', '-30.85', '26.6833'),
(354, 'ZA', 2574, 'Jouberton', '-26.9', '26.6'),
(355, 'ZA', 3982, 'Jozini', '-27.4333', '32.0667'),
(356, 'ZA', 2153, 'Jukskeipark', '-26.2', '28.0833'),
(357, 'ZA', 748, 'Juno', '-23.95', '29.1333'),
(358, 'ZA', 7100, 'Kaapstad', '-33.9778', '18.6167'),
(359, 'ZA', 1247, 'Kabokweni', '-25.3917', '30.9917'),
(360, 'ZA', 9309, 'Kagisanong', '-29.1833', '26.2333'),
(361, 'ZA', 1739, 'Kagiso', '-26.1', '27.7667'),
(362, 'ZA', 8870, 'Kakamas', '-28.75', '20.6333'),
(363, 'ZA', 8252, 'Kamieskroon', '-30.2', '17.9333'),
(364, 'ZA', 1214, 'Kanyamazane', '-25.4333', '31.2'),
(365, 'ZA', 6400, 'Kareedouw', '-30.7833', '25.85'),
(366, 'ZA', 118, 'Karenpark', '-25.7069', '28.2294'),
(367, 'ZA', 1421, 'Katlehong', '-26.3333', '28.15'),
(368, 'ZA', 1431, 'Katlehong Ext', '-26.3583', '28.2667'),
(369, 'ZA', 8860, 'Keimoes', '-28.7', '20.9667'),
(370, 'ZA', 5680, 'Keiskammahoek', '-32.6833', '27.15'),
(371, 'ZA', 1618, 'Kempton Park', '-26.1', '28.25'),
(372, 'ZA', 4980, 'Kentani', '-32.5167', '28.3167'),
(373, 'ZA', 6191, 'Kenton On Sea', '-33.7', '26.6833'),
(374, 'ZA', 7780, 'Kenwyn', '-33.9722', '18.4667'),
(375, 'ZA', 9860, 'Kestell', '-28.3167', '28.7'),
(376, 'ZA', 7750, 'Khayalitsha', '-33.9833', '18.575'),
(377, 'ZA', 7784, 'Khayelitsha', '-33.9167', '18.4167'),
(378, 'ZA', 8300, 'Kimberley', '-28.7333', '24.7667'),
(379, 'ZA', 5601, 'King Williams Town', '-32.8833', '27.4'),
(380, 'ZA', 4931, 'King William''S Town', '-32.8833', '27.4'),
(381, 'ZA', 6120, 'Kirkwood', '-33.4156', '25.4436'),
(382, 'ZA', 8145, 'Klawer', '-31.7833', '18.6167'),
(383, 'ZA', 7141, 'Kleinmond', '-34.35', '19.0333'),
(384, 'ZA', 8249, 'Kleinsee', '-29.6667', '17.0833'),
(385, 'ZA', 2571, 'Klerksdorp', '-26.8667', '26.6667'),
(386, 'ZA', 2574, 'Klerkskdorp', '-26.8833', '26.6333'),
(387, 'ZA', 6255, 'Klipplaat', '-33.0211', '24.3369'),
(388, 'ZA', 3610, 'Kloof', '-29.7833', '30.8333'),
(389, 'ZA', 6570, 'Knysna', '-34.034', '23.0343'),
(390, 'ZA', 1759, 'Kocksvlei', '-26.1111', '27.7722'),
(391, 'ZA', 9986, 'Koffiefontein', '-29.4', '25.0167'),
(392, 'ZA', 2515, 'Kokosi', '-26.5', '27.4667'),
(393, 'ZA', 3237, 'Kokstad', '-30.55', '29.4167'),
(394, 'ZA', 709, 'Koloti', '-23.7167', '29.3167'),
(395, 'ZA', 1341, 'Komatipoort', '-25.4333', '31.9333'),
(396, 'ZA', 4950, 'Komga', '-32.5833', '27.9'),
(397, 'ZA', 9540, 'Koppies', '-27.2333', '27.5833'),
(398, 'ZA', 348, 'Koster', '-25.8667', '26.9'),
(399, 'ZA', 8245, 'Kotzeshoop', '-28.7167', '17.5833'),
(400, 'ZA', 7570, 'Kraaifontein', '-33.8481', '18.7172'),
(401, 'ZA', 7572, 'Kraaifontein North', '-28.4278', '26.8278'),
(402, 'ZA', 1946, 'Kragbron', '-26.9', '27.8833'),
(403, 'ZA', 3268, 'Kranskop', '-30.5667', '26.9'),
(404, 'ZA', 2231, 'Kriel', '-26.2667', '29.2333'),
(405, 'ZA', 76, 'Kromdraai', '-25.4833', '28.2667'),
(406, 'ZA', 9499, 'Kroonstad', '-27.65', '27.2333'),
(407, 'ZA', 1718, 'Krugersdorp', '-26.1', '27.7667'),
(408, 'ZA', 7580, 'Kuils River', '-33.9333', '18.6667'),
(409, 'ZA', 7580, 'Kuilsriver', '-31.3333', '21.7667'),
(410, 'ZA', 7579, 'Kuilsrivier', '-25.15', '29.15'),
(411, 'ZA', 8460, 'Kuruman', '-27.45', '23.4333'),
(412, 'ZA', 3886, 'Kwadlangezwa', '-28.7767', '31.9'),
(413, 'ZA', 1073, 'Kwaguqa', '-25.8667', '29.2333'),
(414, 'ZA', 1347, 'Kwalugedlane', '-25.7333', '31.8167'),
(415, 'ZA', 4359, 'Kwamashu', '-29.75', '30.9833'),
(416, 'ZA', 4032, 'Kwa-Mashu', '-29.85', '31.0167'),
(417, 'ZA', 3915, 'Kwambonambi', '-28.6', '32.0833'),
(418, 'ZA', 1022, 'Kwamhlanga', '-25.4283', '28.7083'),
(419, 'ZA', 3978, 'Kwangkwanase', '-27.5278', '32.0333'),
(420, 'ZA', 6242, 'Kwanobuhle', '-33.8025', '25.3925'),
(421, 'ZA', 6506, 'Kwanonqaba', '-34.1833', '22.1333'),
(422, 'ZA', 1575, 'Kwathema', '-26.3', '28.4'),
(423, 'ZA', 1866, 'Kwaxuma', '-25.4333', '28.2889'),
(424, 'ZA', 6205, 'Kwazakhele', '-33.8667', '25.5833'),
(425, 'ZA', 1098, 'Kwazamokuhle', '-26.15', '29.7167'),
(426, 'ZA', 4032, 'Kwazimele', '-29.85', '31.0167'),
(427, 'ZA', 3250, 'Kwazulu/Natal', '-29.0667', '30.5833'),
(428, 'ZA', 1434, 'Kwenzekile', '-26.3583', '28.2667'),
(429, 'ZA', 6655, 'Ladismith', '-33.4833', '21.2667'),
(430, 'ZA', 5341, 'Lady Frere', '-31.7', '27.2333'),
(431, 'ZA', 9755, 'Lady Grey', '-30.7', '27.2333'),
(432, 'ZA', 9745, 'Ladybrand', '-29.2', '27.45'),
(433, 'ZA', 2900, 'Ladysmith', '-28.55', '29.7833'),
(434, 'ZA', 6901, 'Laingsburg', '-33.2', '20.85'),
(435, 'ZA', 7945, 'Lakeside', '-34.0833', '18.45'),
(436, 'ZA', 8130, 'Lambertsbaai', '-32.1', '18.3'),
(437, 'ZA', 4027, 'Lamontville', '-29.95', '30.9333'),
(438, 'ZA', 7780, 'Landsdowne', '-33.9722', '18.4667'),
(439, 'ZA', 7455, 'Langa', '-33.9333', '18.5167'),
(440, 'ZA', 7357, 'Langebaan', '-33.1', '18.0333'),
(441, 'ZA', 7700, 'Lansdowne', '-32.9389', '19.6667'),
(442, 'ZA', 37, 'Laudium', '-25.7833', '28.1'),
(443, 'ZA', 7945, 'Lavender Hill', '-34.0667', '18.4833'),
(444, 'ZA', 7490, 'Lavistown', '-33.9222', '18.5222'),
(445, 'ZA', 2640, 'Leeudoringstad', '-27.2333', '26.2333'),
(446, 'ZA', 486, 'Leeupoort', '-24.9', '27.7167'),
(447, 'ZA', 1809, 'Lenasia', '-26.2667', '27.8833'),
(448, 'ZA', 9503, 'Lengau', '-27.65', '27.2333'),
(449, 'ZA', 2868, 'Lerato', '-25.45', '25.8667'),
(450, 'ZA', 2265, 'Leslie', '-26.3667', '28.9167'),
(451, 'ZA', 870, 'Letaba', '-23.9', '30.0667'),
(452, 'ZA', 264, 'Letlhabile', '-25.6333', '27.7833'),
(453, 'ZA', 771, 'Letsitele', '-23.8833', '30.4'),
(454, 'ZA', 5160, 'Libode', '-31.5333', '29.0167'),
(455, 'ZA', 2730, 'Lichtenburg', '-26.15', '26.1667'),
(456, 'ZA', 9630, 'Lindley', '-27.8667', '27.9167'),
(457, 'ZA', 3610, 'Link Hills', '-29.8139', '30.8389'),
(458, 'ZA', 6025, 'Linton Grange', '-33.94', '25.56'),
(459, 'ZA', 8185, 'Loeriesfontein', '-30.9667', '19.45'),
(460, 'ZA', 710, 'Lonsdale', '-23.6', '29.1667'),
(461, 'ZA', 901, 'Louis Trichardt', '-23.05', '29.9'),
(462, 'ZA', 9982, 'Luckhoff', '-29.75', '24.7833'),
(463, 'ZA', 4820, 'Lusikisiki', '-31.35', '29.5833'),
(464, 'ZA', 8149, 'Lutzville', '-31.55', '18.35'),
(465, 'ZA', 1120, 'Lydenburg', '-25.1', '30.45'),
(466, 'ZA', 186, 'Lynn East', '-25.7069', '28.2294'),
(467, 'ZA', 51, 'Lyttelton', '-25.8333', '28.2167'),
(468, 'ZA', 190, 'Mabopane', '-25.5072', '28.1075'),
(469, 'ZA', 7130, 'Macassar', '-34.0667', '18.7667'),
(470, 'ZA', 5480, 'Maclear', '-31.0833', '28.3667'),
(471, 'ZA', 2951, 'Madadeni', '-27.75', '30.0333'),
(472, 'ZA', 2773, 'Madibogo', '-26.4167', '25.2'),
(473, 'ZA', 2736, 'Madikwe', '-25.35', '26.5333'),
(474, 'ZA', 1907, 'Mafatsana', '-26.5833', '27.8333'),
(475, 'ZA', 357, 'Mafikeng', '-25.8667', '25.65'),
(476, 'ZA', 4751, 'Magadla', '-30.6', '27.3167'),
(477, 'ZA', 2067, 'Magalies View', '-26.2', '28.0833'),
(478, 'ZA', 150, 'Magalieskruin', '-25.7069', '28.2294'),
(479, 'ZA', 2067, 'Magaliessig', '-26.2', '28.0833'),
(480, 'ZA', 8575, 'Magogong', '-27.6667', '24.8333'),
(481, 'ZA', 3856, 'Mahlabatini', '-28.25', '31.4333'),
(482, 'ZA', 626, 'Mahwelereng', '-24.15', '28.9833'),
(483, 'ZA', 4380, 'Maidstone', '-29.5667', '31.1333'),
(484, 'ZA', 7405, 'Maitland', '-33.9083', '18.45'),
(485, 'ZA', 2650, 'Makwassie', '-27.3167', '25.9833'),
(486, 'ZA', 816, 'Malamulele', '-23.5444', '29.9389'),
(487, 'ZA', 1331, 'Malelane', '-25.4833', '31.5167'),
(488, 'ZA', 7300, 'Malmesbury', '-33.45', '18.7333'),
(489, 'ZA', 4740, 'Maluti', '-30.25', '28.5333'),
(490, 'ZA', 4146, 'Malvern', '-26.2', '28.1'),
(491, 'ZA', 112, 'Mamelodi', '-25.7072', '28.3472'),
(492, 'ZA', 4276, 'Manaba Beach', '-30.85', '30.3667'),
(493, 'ZA', 8423, 'Mancorp Mine', '-28.3', '23.0167'),
(494, 'ZA', 3802, 'Mandeni', '-29.0167', '31.5833'),
(495, 'ZA', 7764, 'Manenberg', '-33.9833', '18.55'),
(496, 'ZA', 9307, 'Mangaung', '-29.1333', '26.2'),
(497, 'ZA', 8345, 'Mankurwane', '-28.55', '25.2333'),
(498, 'ZA', 753, 'Manyama', '-23.6774', '29.4869'),
(499, 'ZA', 4470, 'Mapumulo', '-29.15', '31.0667'),
(500, 'ZA', 449, 'Marble Hall', '-24.9667', '29.3'),
(501, 'ZA', 4035, 'Marble Ray', '-29.85', '31.0167'),
(502, 'ZA', 4275, 'Margate', '-30.85', '30.3667'),
(503, 'ZA', 4092, 'Marianhill', '-29.9', '30.9833'),
(504, 'ZA', 284, 'Marikana', '-25.613', '27.8843'),
(505, 'ZA', 2063, 'Marlboro', '-26.2', '28.0833'),
(506, 'ZA', 9610, 'Marquard', '-28.6667', '27.4333'),
(507, 'ZA', 2111, 'Marshalltown', '-26.2', '28.0833'),
(508, 'ZA', 743, 'Mashashane', '-23.95', '29.1333'),
(509, 'ZA', 1908, 'Masoheng', '-26.7', '27.8167'),
(510, 'ZA', 4730, 'Matatiele', '-30.3333', '28.8'),
(511, 'ZA', 7465, 'Matroosfontein', '-33.9333', '18.5833'),
(512, 'ZA', 4082, 'Mayville', '-29.85', '30.9833'),
(513, 'ZA', 3974, 'Mbazwana', '-27.6167', '32.0333'),
(514, 'ZA', 7655, 'Mbekweni', '-33.6833', '18.9833'),
(515, 'ZA', 449, 'Mbibane', '-25.365', '28.2189'),
(516, 'ZA', 5221, 'Mdantsane', '-32.95', '27.7667'),
(517, 'ZA', 1801, 'Meadowlands', '-26.2', '27.8833'),
(518, 'ZA', 190, 'Medunsa', '-25.6189', '28.0228'),
(519, 'ZA', 4246, 'Mehlomnyama', '-30.7571', '30.4452'),
(520, 'ZA', 7440, 'Melkbosstrand', '-33.7306', '18.4361'),
(521, 'ZA', 3835, 'Melmoth', '-28.5833', '31.3833'),
(522, 'ZA', 40, 'Menlo Park', '-25.7711', '28.3078'),
(523, 'ZA', 9483, 'Merafong', '-28.0778', '26.3778'),
(524, 'ZA', 3290, 'Merrivale', '-29.5167', '30.2333'),
(525, 'ZA', 900, 'Messina', '-22.35', '30.05'),
(526, 'ZA', 1871, 'Meyerton', '-26.5667', '28.0167'),
(527, 'ZA', 3750, 'Mid Illovo', '-29.9667', '30.5167'),
(528, 'ZA', 1050, 'Middelburg', '-30.05', '26.6167'),
(529, 'ZA', 1050, 'Middleburg', '-30.05', '26.6167'),
(530, 'ZA', 5686, 'Middledrift', '-32.8167', '26.9833'),
(531, 'ZA', 7435, 'Milnerton', '-33.9166', '18.4166'),
(532, 'ZA', 1541, 'Minnebron', '-26.2333', '28.3667'),
(533, 'ZA', 7784, 'Mitchells Plain', '-33.9167', '18.4167'),
(534, 'ZA', 7785, 'Mitchells Plein', '-33.9611', '18.4833'),
(535, 'ZA', 7785, 'Mitchellsplain', '-33.9611', '18.4833'),
(536, 'ZA', 7785, 'Mithchells Plain', '-33.9611', '18.4833'),
(537, 'ZA', 1246, 'Mkhuhlu', '-25.3917', '30.9917'),
(538, 'ZA', 3965, 'Mkuze', '-27.6167', '32.0333'),
(539, 'ZA', 2777, 'Mmabatho', '-25.85', '25.6333'),
(540, 'ZA', 4050, 'Mobeni', '-29.95', '30.95'),
(541, 'ZA', 1609, 'Modderfontein', '-26.0833', '28.1667'),
(542, 'ZA', 195, 'Mogwase', '-25.2667', '27.2333'),
(543, 'ZA', 1759, 'Mohlakeng', '-26.2333', '27.7'),
(544, 'ZA', 633, 'Mokamole', '-24.1833', '29.0167'),
(545, 'ZA', 9869, 'Mokodumela', '-28.5333', '28.8'),
(546, 'ZA', 827, 'Molototsi', '-23.3167', '30.7167'),
(547, 'ZA', 5500, 'Molteno', '-31.4', '26.3667'),
(548, 'ZA', 6720, 'Montagu', '-33.7833', '20.1167'),
(549, 'ZA', 159, 'Montanapark', '-25.7069', '28.2294'),
(550, 'ZA', 7460, 'Monte Vista', '-33.8833', '18.5667'),
(551, 'ZA', 3300, 'Mooi River', '-29.2', '29.9833'),
(552, 'ZA', 7310, 'Moorreesburg', '-33.15', '18.6667'),
(553, 'ZA', 84, 'Moot', '-25.7069', '28.2294'),
(554, 'ZA', 44, 'Moreletapark', '-25.7069', '28.2294'),
(555, 'ZA', 6501, 'Mossel Bay', '-34.1833', '22.1333'),
(556, 'ZA', 6503, 'Mosselbaai', '-34.1833', '22.1333'),
(557, 'ZA', 6506, 'Mosselbay', '-34.1833', '22.1333'),
(558, 'ZA', 6211, 'Motherwell', '-33.9667', '25.5833'),
(559, 'ZA', 8477, 'Mothibistad', '-27.05', '24.4733'),
(560, 'ZA', 9487, 'Motsethabang', '-28.0778', '26.3778'),
(561, 'ZA', 9463, 'Motsethabong', '-27.9833', '26.7333'),
(562, 'ZA', 4735, 'Mount Ayliff', '-30.8', '29.3667'),
(563, 'ZA', 4068, 'Mount Edgecombe', '-29.7', '31.0333'),
(564, 'ZA', 4770, 'Mount Fletcher', '-30.6833', '28.5167'),
(565, 'ZA', 5086, 'Mount Frere', '-30.9167', '28.9833'),
(566, 'ZA', 7700, 'Mowbray', '-33.9333', '18.4667'),
(567, 'ZA', 736, 'Mphahlele', '-23.9667', '29.7'),
(568, 'ZA', 412, 'Mphe-Batho', '-25.343', '28.2204'),
(569, 'ZA', 732, 'Mphogodiba', '-23.9667', '29.7'),
(570, 'ZA', 1078, 'Mpudulle', '-25.0167', '29.7333'),
(571, 'ZA', 1050, 'Mpumalanga', '-30.05', '26.6167'),
(572, 'ZA', 5079, 'Mqanduli', '-31.8167', '28.75'),
(573, 'ZA', 4961, 'Msobomvu', '-32.3333', '28.15'),
(574, 'ZA', 3925, 'Mtubatuba', '-28.4167', '32.1833'),
(575, 'ZA', 3867, 'Mtunzini', '-28.95', '31.75'),
(576, 'ZA', 7945, 'Muizenberg', '-34.1167', '18.4667'),
(577, 'ZA', 1739, 'Muldersdrif', '-26.1', '27.7667'),
(578, 'ZA', 992, 'Mungomani', '-22.95', '30.4667'),
(579, 'ZA', 4278, 'Munster', '-30.9833', '30.2333'),
(580, 'ZA', 948, 'Munzhedzi', '-23.05', '29.9'),
(581, 'ZA', 956, 'Mutale', '-22.4833', '30.9167'),
(582, 'ZA', 976, 'Muthathi', '-22.95', '30.4667'),
(583, 'ZA', 413, 'Mutlestad', '-25.343', '28.2204'),
(584, 'ZA', 560, 'Naboomspruit', '-24.5167', '28.7167'),
(585, 'ZA', 3604, 'Nagina', '-29.8167', '30.85'),
(586, 'ZA', 5241, 'Nahoon', '-33.0333', '27.9167'),
(587, 'ZA', 1861, 'Naledi', '-23.8333', '29.0833'),
(588, 'ZA', 1397, 'Namakgale', '-23.95', '31.0333'),
(589, 'ZA', 1052, 'Nasaret', '-26.2333', '28.8'),
(590, 'ZA', 4964, 'Ndabakazi', '-32.3333', '28.15'),
(591, 'ZA', 4242, 'Ndwedwe', '-30.75', '30.45'),
(592, 'ZA', 714, 'Neandertal', '-23.4833', '29.1833'),
(593, 'ZA', 1057, 'Nebo', '-24.9', '29.7667'),
(594, 'ZA', 7628, 'Nederburg', '-33.2033', '20.4933'),
(595, 'ZA', 1132, 'Nelspruit', '-25.4667', '30.9667'),
(596, 'ZA', 6200, 'New Brighton', '-33.9', '25.6'),
(597, 'ZA', 3610, 'New Germany', '-29.8', '30.8833'),
(598, 'ZA', 2940, 'Newcastle', '-27.75', '29.9333'),
(599, 'ZA', 7700, 'Newlands', '-33.9785', '18.4481'),
(600, 'ZA', 6045, 'Newton Park', '-33.95', '25.5667'),
(601, 'ZA', 5140, 'Ngqeleni', '-31.6667', '29.0333'),
(602, 'ZA', 8930, 'Niekerkshoop', '-29.3167', '22.8333'),
(603, 'ZA', 1490, 'Nigel', '-26.4167', '28.4667'),
(604, 'ZA', 156, 'Ninapark', '-25.7069', '28.2294'),
(605, 'ZA', 3855, 'Nkandla', '-28.6167', '31.0833'),
(606, 'ZA', 616, 'Nkwe', '-23.4', '28.75'),
(607, 'ZA', 3836, 'Nongoma', '-27.9', '31.65'),
(608, 'ZA', 1687, 'Noordwyk', '-25.9833', '28.1167'),
(609, 'ZA', 2162, 'North Riding', '-26.2', '28.0833'),
(610, 'ZA', 4093, 'Northdene', '-29.8333', '30.9333'),
(611, 'ZA', 7090, 'Northern Cape', '-31.2889', '23.5611'),
(612, 'ZA', 480, 'Northern Provice', '-24.8833', '28.2833'),
(613, 'ZA', 2155, 'Northwold', '-26.2', '28.0833'),
(614, 'ZA', 5950, 'Noupoort', '-31.1874', '24.9499'),
(615, 'ZA', 4682, 'Nqabeni', '-30.7333', '30.0333'),
(616, 'ZA', 4990, 'Nqamakwe', '-32.2333', '28.0667'),
(617, 'ZA', 3005, 'Nqutu', '-28.2', '30.6667'),
(618, 'ZA', 4066, 'Ntokozweni', '-29.9667', '30.8833'),
(619, 'ZA', 2355, 'Nucam', '-26.5333', '29.9833'),
(620, 'ZA', 7708, 'Nuweland', '-33.9667', '18.4833'),
(621, 'ZA', 7750, 'Nyanga', '-33.9833', '18.5833'),
(622, 'ZA', 433, 'Nylstroom', '-24.7', '28.4'),
(623, 'ZA', 9476, 'Odendaalsrus', '-27.8667', '26.6833'),
(624, 'ZA', 1830, 'Odin Park', '-26.3167', '27.8333'),
(625, 'ZA', 2232, 'Ogies', '-26.05', '29.0667'),
(626, 'ZA', 8271, 'Okiep', '-29.6', '17.9'),
(627, 'ZA', 1666, 'Olifantsfontein', '-25.9639', '28.2394'),
(628, 'ZA', 8450, 'Olifantshoek', '-27.9333', '22.7333'),
(629, 'ZA', 7201, 'Onrus River', '-34.4167', '19.2333'),
(630, 'ZA', 5201, 'Oos-Londen', '-33.0333', '27.9167'),
(631, 'ZA', 1805, 'Orange Farm', '-26.2474', '27.8987'),
(632, 'ZA', 2192, 'Orange Grove', '-26.1667', '28.0833'),
(633, 'ZA', 1995, 'Oranjeville', '-26.9833', '28.2'),
(634, 'ZA', 2619, 'Orkney', '-26.9833', '26.6667'),
(635, 'ZA', 1804, 'Orlando', '-26.25', '27.9167'),
(636, 'ZA', 2952, 'Osizweni', '-27.7833', '30.15'),
(637, 'ZA', 7750, 'Ottery', '-33.9833', '18.575'),
(638, 'ZA', 2610, 'Ottosdal', '-26.8167', '26.0167'),
(639, 'ZA', 6625, 'Oudshoorn', '-33.5833', '22.2'),
(640, 'ZA', 6623, 'Oudtshoorn', '-33.5833', '22.2'),
(641, 'ZA', 3242, 'Ozwatini', '-29.4', '30.85'),
(642, 'ZA', 7405, 'Paarden Island', '-33.9083', '18.45'),
(643, 'ZA', 7622, 'Paarl', '-33.7333', '18.9667'),
(644, 'ZA', 6529, 'Pacaltsdorp', '-34.0167', '22.45'),
(645, 'ZA', 1914, 'Palm Springs', '-26.6972', '27.8278'),
(646, 'ZA', 7500, 'Parow', '-33.9', '18.6'),
(647, 'ZA', 9585, 'Parys', '-26.9', '27.45'),
(648, 'ZA', 6335, 'Patensie', '-33.7556', '24.8183'),
(649, 'ZA', 6130, 'Paterson', '-33.45', '25.9667'),
(650, 'ZA', 9800, 'Paul Roux', '-28.3', '27.95'),
(651, 'ZA', 3180, 'Paulpietersburg', '-27.4167', '30.8167'),
(652, 'ZA', 2056, 'Paulshof', '-26.05', '28.0333'),
(653, 'ZA', 5860, 'Pearston', '-32.5833', '25.1333'),
(654, 'ZA', 5612, 'Peddie', '-33.2', '27.1167'),
(655, 'ZA', 5209, 'Pefferville', '-33.0333', '27.9167'),
(656, 'ZA', 1154, 'Penge', '-24.3667', '30.3'),
(657, 'ZA', 4184, 'Pennington', '-30.2833', '30.75'),
(658, 'ZA', 8309, 'Pescodia', '-28.7333', '24.7667'),
(659, 'ZA', 1501, 'Petit', '-26.1', '28.3833'),
(660, 'ZA', 9640, 'Petrus Steyn', '-27.65', '28.1333'),
(661, 'ZA', 9932, 'Petrusburg', '-29.1167', '25.4167'),
(662, 'ZA', 8770, 'Petrusville', '-30.0833', '24.65'),
(663, 'ZA', 1390, 'Phalaborwa', '-23.95', '31.1167'),
(664, 'ZA', 29, 'Philip Nel Park', '-25.7069', '28.2294'),
(665, 'ZA', 9970, 'Philippolis', '-30.2667', '25.2833'),
(666, 'ZA', 8795, 'Philipstown', '-30.4333', '24.4667'),
(667, 'ZA', 4068, 'Phoenix', '-29.775', '31.025'),
(668, 'ZA', 9866, 'Phuthaditjhaba', '-28.5333', '28.8167'),
(669, 'ZA', 2380, 'Piet Retief', '-27', '30.8'),
(670, 'ZA', 3200, 'Pietermaritzburg', '-29.6167', '30.3833'),
(671, 'ZA', 632, 'Pietersburg', '-24.1833', '29.0167'),
(672, 'ZA', 7320, 'Piketberg', '-32.9', '18.7667'),
(673, 'ZA', 1808, 'Pimville', '-26.2667', '27.9'),
(674, 'ZA', 7450, 'Pinelands', '-33.9167', '18.5'),
(675, 'ZA', 3600, 'Pinetown', '-29.8167', '30.85'),
(676, 'ZA', 6600, 'Plettenberg Bay', '-34.0455', '23.3727'),
(677, 'ZA', 6600, 'Plettenbergbaai', '-34.0455', '23.3727'),
(678, 'ZA', 7800, 'Plumstead', '-34.0167', '18.4667'),
(679, 'ZA', 386, 'Podiphatshwa', '-24.6', '27.4'),
(680, 'ZA', 8892, 'Pofadder', '-29.1333', '19.3833'),
(681, 'ZA', 3011, 'Pomeroy', '-28.55', '30.4167'),
(682, 'ZA', 8611, 'Pomfret', '-26.95', '24.7333'),
(683, 'ZA', 3160, 'Pongola', '-27.3833', '31.6167'),
(684, 'ZA', 6170, 'Port Alfred', '-33.6', '26.9'),
(685, 'ZA', 4295, 'Port Edward', '-31.05', '30.2167'),
(686, 'ZA', 6000, 'Port Elizabeth', '-33.9667', '25.5833'),
(687, 'ZA', 8280, 'Port Nolloth', '-29.25', '16.8667'),
(688, 'ZA', 4226, 'Port Shepstone', '-30.75', '30.45'),
(689, 'ZA', 5120, 'Port St Johns', '-31.5833', '28.7833'),
(690, 'ZA', 6810, 'Porterville', '-33.0167', '18.9833'),
(691, 'ZA', 8420, 'Postmasburg', '-28.3167', '23.0667'),
(692, 'ZA', 2520, 'Potchefstroom', '-26.7167', '27.1'),
(693, 'ZA', 541, 'Potgietersrus', '-24.1833', '29.0167'),
(694, 'ZA', 643, 'Potgieterus', '-24.1833', '29.0167'),
(695, 'ZA', 7, 'Pretoria', '-25.7069', '28.2294'),
(696, 'ZA', 66, 'Pretoria North', '-25.6622', '28.1653'),
(697, 'ZA', 70, 'Pretoria West', '-25.75', '28.1667'),
(698, 'ZA', 182, 'Pretoria-Noord', '-25.6622', '28.1653'),
(699, 'ZA', 183, 'Pretoria-Wes', '-25.75', '28.1667'),
(700, 'ZA', 8930, 'Prieska', '-29.6667', '22.75'),
(701, 'ZA', 1401, 'Primrose', '-26.1833', '28.1667'),
(702, 'ZA', 6932, 'Prince Albert', '-33.2167', '22.0333'),
(703, 'ZA', 6835, 'Prince Alfred Hamlet', '-33.3', '19.3167'),
(704, 'ZA', 1818, 'Protea Glen', '-26.2917', '27.9'),
(705, 'ZA', 1513, 'Putfontein', '-26.1167', '28.4'),
(706, 'ZA', 120, 'Pyramid', '-25.5814', '28.2319'),
(707, 'ZA', 4743, 'Queens Mercy', '-30.25', '28.5333'),
(708, 'ZA', 4743, 'Queen''S Mercy', '-30.25', '28.5333'),
(709, 'ZA', 4079, 'Queensburgh', '-29.8667', '30.9333'),
(710, 'ZA', 5319, 'Queenstown', '-31.9', '26.8833'),
(711, 'ZA', 5180, 'Qumbu', '-31.15', '28.8667'),
(712, 'ZA', 1632, 'Rabie Ridge', '-26.1', '28.25'),
(713, 'ZA', 2738, 'Radithuso', '-26.1811', '25.8339'),
(714, 'ZA', 718, 'Raditshaba', '-22.8333', '28.85'),
(715, 'ZA', 2032, 'Randburg', '-26.1', '27.9833'),
(716, 'ZA', 1759, 'Randfontein', '-26.1667', '27.7'),
(717, 'ZA', 2156, 'Randpark Ridge', '-26.2', '28.0833'),
(718, 'ZA', 1873, 'Randvaal', '-26.5667', '28.0167'),
(719, 'ZA', 415, 'Rantebeng', '-25.365', '28.2189'),
(720, 'ZA', 7493, 'Ravensmead', '-33.9167', '18.6'),
(721, 'ZA', 617, 'Rebone', '-24.1833', '29.0167'),
(722, 'ZA', 9904, 'Reddersburg', '-29.65', '26.1667'),
(723, 'ZA', 387, 'Regorogile', '-24.6', '27.4'),
(724, 'ZA', 9810, 'Reitz', '-27.8', '28.4333'),
(725, 'ZA', 1980, 'Residensia', '-26.5833', '27.8333'),
(726, 'ZA', 7945, 'Retreat', '-31.9167', '26.9667'),
(727, 'ZA', 3900, 'Richards Bay', '-28.7901', '32.0971'),
(728, 'ZA', 3900, 'Richardsbaai', '-28.7901', '32.0971'),
(729, 'ZA', 3780, 'Richmond', '-29.8667', '30.2667'),
(730, 'ZA', 8701, 'Ritchie', '-29.05', '24.6'),
(731, 'ZA', 6670, 'Riversdale', '-34.1', '21.2667'),
(732, 'ZA', 7250, 'Riviersonderend', '-34.15', '19.9'),
(733, 'ZA', 2128, 'Rivonia', '-26.05', '28.05'),
(734, 'ZA', 6705, 'Robertson', '-33.8', '19.8833'),
(735, 'ZA', 580, 'Roedtan', '-24.5777', '28.202'),
(736, 'ZA', 7700, 'Rondebosch', '-33.9633', '18.4764'),
(737, 'ZA', 1714, 'Roodepoort', '-26.1667', '27.8667'),
(738, 'ZA', 1724, 'Rooderpoort', '-26.1767', '27.8667'),
(739, 'ZA', 154, 'Rooihuiskraal', '-25.9', '28.1'),
(740, 'ZA', 2195, 'Roosevelt Park', '-26.15', '27.9833'),
(741, 'ZA', 9720, 'Rosendal', '-28.5167', '27.9333'),
(742, 'ZA', 2190, 'Rosettenville', '-26.25', '28.05'),
(743, 'ZA', 1936, 'Roshnee', '-26.5667', '27.9333'),
(744, 'ZA', 4072, 'Rossburgh', '-29.9', '30.9667'),
(745, 'ZA', 182, 'Rosslyn', '-25.6771', '28.1867'),
(746, 'ZA', 9958, 'Rouxville', '-30.4167', '26.8333'),
(747, 'ZA', 7405, 'Rugby', '-33.9', '18.4833'),
(748, 'ZA', 1473, 'Rusloo', '-26.2167', '28.25'),
(749, 'ZA', 405, 'Rust De Winter', '-25.1986', '28.6092'),
(750, 'ZA', 299, 'Rustenberg', '-25.613', '27.8843'),
(751, 'ZA', 202, 'Rustenburg', '-25.6667', '27.25'),
(752, 'ZA', 1260, 'Sabie', '-25.1', '30.7833'),
(753, 'ZA', 2431, 'Sakhile', '-26.9667', '29.2'),
(754, 'ZA', 7282, 'Saldanha', '-34.5333', '20.0333'),
(755, 'ZA', 6059, 'Saltville', '-33.9667', '25.5833'),
(756, 'ZA', 2172, 'Sandton', '-26.05', '27.9667'),
(757, 'ZA', 2760, 'Sannieshof', '-26.5333', '25.8'),
(758, 'ZA', 1946, 'Sasolburg', '-26.8167', '27.8167'),
(759, 'ZA', 318, 'Saulspoort', '-24.9333', '27.15'),
(760, 'ZA', 2775, 'Schweizer-Reneke', '-27.1833', '25.3333'),
(761, 'ZA', 4180, 'Scottburgh', '-30.2833', '30.75'),
(762, 'ZA', 3204, 'Scottsville', '-29.6167', '30.3833'),
(763, 'ZA', 1907, 'Sebokeng', '-26.5833', '27.8333'),
(764, 'ZA', 2300, 'Secunda', '-26.55', '29.1667'),
(765, 'ZA', 6573, 'Sedgefield', '-34.0167', '22.8'),
(766, 'ZA', 1058, 'Sekhukhune', '-26.3611', '28.7722'),
(767, 'ZA', 9783, 'Selosesha', '-29.2', '26.8167'),
(768, 'ZA', 9485, 'Senekal', '-28.3167', '27.6'),
(769, 'ZA', 699, 'Seshego', '-23.85', '29.3833'),
(770, 'ZA', 430, 'Settlers', '-24.95', '28.5333'),
(771, 'ZA', 4215, 'Sezela', '-30.4167', '30.6833'),
(772, 'ZA', 4430, 'Shakaskraal', '-29.45', '31.2167'),
(773, 'ZA', 4093, 'Shallcross', '-29.8333', '30.9333'),
(774, 'ZA', 1913, 'Sharpeville', '-26.6833', '27.8833'),
(775, 'ZA', 4240, 'Shelly Beach', '-30.8', '30.4167'),
(776, 'ZA', 873, 'Shiluvane', '-24.0333', '30.2667'),
(777, 'ZA', 1331, 'Shongwe Mission', '-25.4667', '31.9'),
(778, 'ZA', 906, 'Sibasa', '-22.95', '30.4667'),
(779, 'ZA', 170, 'Silverton', '-25.7317', '28.3347'),
(780, 'ZA', 7975, 'Simon''S Town', '-34.0056', '18.4222'),
(781, 'ZA', 7975, 'Simonstad', '-34.1833', '18.4333'),
(782, 'ZA', 462, 'Siyabuswa', '-25.1167', '29.05'),
(783, 'ZA', 431, 'Skilpadfontein', '-25.0167', '28.8'),
(784, 'ZA', 1351, 'Skukuza', '-24.9833', '31.6'),
(785, 'ZA', 9966, 'Smithfield', '-30.2167', '26.5333'),
(786, 'ZA', 810, 'Soekmekaar', '-23.4833', '29.9333'),
(787, 'ZA', 5850, 'Somerset East', '-32.7167', '25.5833'),
(788, 'ZA', 7110, 'Somerset West', '-34.0833', '18.85'),
(789, 'ZA', 7130, 'Somerset-Wes', '-34.075', '18.8083'),
(790, 'ZA', 152, 'Soshanguve', '-25.7069', '28.2294'),
(791, 'ZA', 7800, 'Southfield', '-34.0333', '18.4833'),
(792, 'ZA', 6172, 'Southseas', '-33.6', '26.9'),
(793, 'ZA', 727, 'Sovenga', '-23.9333', '29.8167'),
(794, 'ZA', 1803, 'Soweto', '-26.2667', '27.8667'),
(795, 'ZA', 8240, 'Springbok', '-29.6667', '17.8833'),
(796, 'ZA', 9917, 'Springfontein', '-30.2667', '25.7'),
(797, 'ZA', 1558, 'Springs', '-26.25', '28.4'),
(798, 'ZA', 3936, 'St Lucia Estuary', '-28.4167', '32.1833'),
(799, 'ZA', 3609, 'St Wendolins', '-29.8167', '30.85'),
(800, 'ZA', 2425, 'Standerton', '-26.95', '29.25'),
(801, 'ZA', 3815, 'Stanger', '-28.8833', '31.4667'),
(802, 'ZA', 3373, 'Steadville', '-28.55', '29.7833'),
(803, 'ZA', 7945, 'Steenberg', '-34.0667', '18.4667'),
(804, 'ZA', 7600, 'Stellenbosch', '-33.9302', '18.8449'),
(805, 'ZA', 9762, 'Sterkspruit', '-25.3667', '30.5333'),
(806, 'ZA', 5425, 'Sterkstroom', '-31.5667', '26.55'),
(807, 'ZA', 5920, 'Steynsburg', '-31.3', '25.8167'),
(808, 'ZA', 6250, 'Steytlerville', '-33.3328', '24.3447'),
(809, 'ZA', 6674, 'Stilbaai', '-34.3667', '21.4167'),
(810, 'ZA', 2551, 'Stilfontein', '-26.85', '26.7833'),
(811, 'ZA', 6674, 'Still Bay', '-34.3667', '21.4'),
(812, 'ZA', 7140, 'Strand', '-34.1167', '18.8333'),
(813, 'ZA', 7798, 'Strandfontein', '-34.0833', '18.55'),
(814, 'ZA', 2031, 'Strathavon', '-26.2', '28.0833'),
(815, 'ZA', 1724, 'Strubens Valley', '-26.1767', '27.8667'),
(816, 'ZA', 1724, 'Strubensvallei', '-26.1767', '27.8667'),
(817, 'ZA', 8765, 'Strydenburg', '-29.95', '23.6833'),
(818, 'ZA', 4930, 'Stutterheim', '-32.5667', '27.4167'),
(819, 'ZA', 2200, 'Sundra', '-26.2311', '29.0356'),
(820, 'ZA', 778, 'Superbia', '-23.8833', '30.4'),
(821, 'ZA', 6920, 'Sutherland', '-32.4', '20.6667'),
(822, 'ZA', 418, 'Swartbooistad', '-25.2728', '28.1683'),
(823, 'ZA', 351, 'Swartklip', '-24.9333', '27.15'),
(824, 'ZA', 6210, 'Swartkops', '-33.8667', '25.6'),
(825, 'ZA', 2835, 'Swartruggens', '-25.65', '26.7'),
(826, 'ZA', 6740, 'Swellendam', '-34.0333', '20.4333'),
(827, 'ZA', 5130, 'Tabankulu', '-30.9667', '29.3'),
(828, 'ZA', 7441, 'Table View', '-33.8167', '18.4833'),
(829, 'ZA', 5370, 'Tarkastad', '-32.0167', '26.2667'),
(830, 'ZA', 8576, 'Taung', '-24.4833', '30.4167'),
(831, 'ZA', 8576, 'Taung Sta', '-27.7167', '24.825'),
(832, 'ZA', 8537, 'Taung Station', '-28.0167', '24.85'),
(833, 'ZA', 407, 'Temba', '-25.365', '28.2189'),
(834, 'ZA', 1632, 'Tembisa', '-26.1', '28.25'),
(835, 'ZA', 1632, 'Tembisa Ext', '-26.1', '28.25'),
(836, 'ZA', 9783, 'Thaba Nchu', '-29.2167', '26.8333'),
(837, 'ZA', 319, 'Thabazimbi', '-24.6', '27.4'),
(838, 'ZA', 157, 'The Reeds', '-25.8049', '28.2056'),
(839, 'ZA', 155, 'Theresapark', '-25.7069', '28.2294'),
(840, 'ZA', 9701, 'Theronville', '-28.2333', '28.3'),
(841, 'ZA', 9410, 'Theunissen', '-28.4', '26.7167'),
(842, 'ZA', 929, 'Thohoyandou', '-22.95', '30.4833'),
(843, 'ZA', 734, 'Tholongwe', '-23.9667', '29.7'),
(844, 'ZA', 1365, 'Thulamahashe', '-24.6167', '31.2083'),
(845, 'ZA', 419, 'Thulwe', '-25.2167', '28.2167'),
(846, 'ZA', 7945, 'Tokai', '-34.0667', '18.4333'),
(847, 'ZA', 1426, 'Tokoza', '-26.3667', '28.0667'),
(848, 'ZA', 1426, 'Tokoza Ext', '-26.35', '28.1083'),
(849, 'ZA', 4380, 'Tongaat', '-29.5833', '31.1333'),
(850, 'ZA', 6880, 'Touws River', '-33.3333', '20.0333'),
(851, 'ZA', 6880, 'Touwsrivier', '-33.3333', '20.0333'),
(852, 'ZA', 891, 'Trichardtsdal', '-24.1667', '30.4'),
(853, 'ZA', 9913, 'Trompsburg', '-30.0333', '25.7833'),
(854, 'ZA', 1550, 'Tsakane', '-26.35', '28.3833'),
(855, 'ZA', 1814, 'Tshiawelo', '-26.2917', '27.9'),
(856, 'ZA', 5170, 'Tsolo', '-31.3167', '28.75'),
(857, 'ZA', 5400, 'Tsomo', '-32.0333', '27.8'),
(858, 'ZA', 3010, 'Tugela Ferry', '-28.7333', '30.45'),
(859, 'ZA', 6820, 'Tulbagh', '-33.2833', '19.15'),
(860, 'ZA', 9820, 'Tweeling', '-27.55', '28.5167'),
(861, 'ZA', 850, 'Tzaneen', '-23.8333', '30.1667'),
(862, 'ZA', 3970, 'Ubombo', '-27.5667', '32.0833'),
(863, 'ZA', 6021, 'Uitenhage', '-33.7653', '25.4022'),
(864, 'ZA', 3838, 'Ulundi', '-28.3333', '31.4167'),
(865, 'ZA', 4126, 'Umbogintwini', '-30.0333', '30.9167'),
(866, 'ZA', 4105, 'Umbumbulu', '-29.9833', '30.7'),
(867, 'ZA', 4391, 'Umhlali', '-29.114', '30.6772'),
(868, 'ZA', 4021, 'Umhlanga Rocks', '-29.7167', '31.0667'),
(869, 'ZA', 4170, 'Umkomaas', '-30.2', '30.8'),
(870, 'ZA', 4031, 'Umlazi', '-29.9667', '30.8833'),
(871, 'ZA', 4740, 'Umtata', '-31.5833', '28.7833'),
(872, 'ZA', 4235, 'Umtentweni', '-30.7167', '30.4667'),
(873, 'ZA', 3239, 'Umzimkulu', '-30.2667', '29.9333'),
(874, 'ZA', 3263, 'Umzinto', '-30.0333', '29.8333'),
(875, 'ZA', 4225, 'Umzumbe', '-30.6167', '30.55'),
(876, 'ZA', 6460, 'Uniondale', '-33.65', '23.1333'),
(877, 'ZA', 8801, 'Upington', '-28.45', '21.25'),
(878, 'ZA', 2980, 'Utrecht', '-27.65', '30.3333'),
(879, 'ZA', 4270, 'Uvongo', '-31.4', '26.5833'),
(880, 'ZA', 537, 'Vaalwater', '-24.1667', '28.1'),
(881, 'ZA', 185, 'Valhalla', '-25.8117', '28.1503'),
(882, 'ZA', 2245, 'Van Dyksdrif', '-26.2311', '29.0356'),
(883, 'ZA', 1900, 'Vanderbijlpark', '-26.7', '27.8167'),
(884, 'ZA', 8771, 'Vanderkloof', '-30', '24.7333'),
(885, 'ZA', 8170, 'Vanrhynsdorp', '-31.6167', '18.7333'),
(886, 'ZA', 7365, 'Velddrif', '-32.7833', '18.1667'),
(887, 'ZA', 9450, 'Ventersburg', '-28.0833', '27.1333'),
(888, 'ZA', 2710, 'Ventersdorp', '-26.3167', '26.8167'),
(889, 'ZA', 9798, 'Venterstad', '-30.7833', '25.8'),
(890, 'ZA', 1904, 'Vereeniging', '-26.6667', '27.9333'),
(891, 'ZA', 4319, 'Verulam', '-29.65', '31.05'),
(892, 'ZA', 7070, 'Victoria West', '-31.4', '23.1167'),
(893, 'ZA', 9520, 'Viljoenskroon', '-27.2167', '26.95'),
(894, 'ZA', 9840, 'Villiers', '-27.0333', '28.6'),
(895, 'ZA', 8246, 'Vioolsdrif', '-28.7667', '17.65'),
(896, 'ZA', 9430, 'Virginia', '-28.1167', '26.9'),
(897, 'ZA', 7975, 'Vishoek', '-34.0056', '18.4222'),
(898, 'ZA', 2465, 'Volksrust', '-27.3667', '29.8833'),
(899, 'ZA', 187, 'Voortrekkerhoogte', '-25.8', '28.1167'),
(900, 'ZA', 9835, 'Vrede', '-27.4167', '29.1667'),
(901, 'ZA', 9595, 'Vredefort', '-27.0167', '27.3833'),
(902, 'ZA', 7375, 'Vredenburg', '-32.9', '17.9833'),
(903, 'ZA', 8146, 'Vredendal', '-31.6667', '18.5'),
(904, 'ZA', 8474, 'Vryburg', '-26.95', '24.7333'),
(905, 'ZA', 3002, 'Vryheid', '-27.7667', '30.8'),
(906, 'ZA', 2778, 'Vyrburg', '-26.5389', '25.3833'),
(907, 'ZA', 2480, 'Wakkerstroom', '-27.35', '30.1333'),
(908, 'ZA', 1876, 'Walkerville', '-26.4167', '27.9667'),
(909, 'ZA', 6070, 'Walmer', '-33.9833', '25.5833'),
(910, 'ZA', 50, 'Wapadrand', '-25.7069', '28.2294'),
(911, 'ZA', 9890, 'Warden', '-27.85', '28.9667'),
(912, 'ZA', 480, 'Warmbad', '-24.8833', '28.2833'),
(913, 'ZA', 406, 'Warmbaths', '-24.8833', '28.2833'),
(914, 'ZA', 8530, 'Warrenton', '-28.1167', '24.85'),
(915, 'ZA', 3233, 'Wartburg', '-29.4333', '30.5833'),
(916, 'ZA', 2920, 'Wasbank', '-29.7167', '26.3833'),
(917, 'ZA', 145, 'Waterkloof', '-25.7069', '28.2294'),
(918, 'ZA', 9438, 'Welkom', '-27.9833', '26.7333'),
(919, 'ZA', 7655, 'Wellington', '-33.6333', '19'),
(920, 'ZA', 9944, 'Wepener', '-29.7333', '27.0333'),
(921, 'ZA', 9680, 'Wesselsbron', '-27.85', '26.3667'),
(922, 'ZA', 6655, 'Western Cape', '-33.55', '21.8889'),
(923, 'ZA', 1772, 'Westonaria', '-26.3167', '27.65'),
(924, 'ZA', 3629, 'Westville', '-29.8333', '30.9333'),
(925, 'ZA', 1240, 'White River', '-25.3167', '31.0167'),
(926, 'ZA', 1254, 'Whiteriver', '-24.9333', '31.0917'),
(927, 'ZA', 5360, 'Whittlesea', '-32.1667', '26.8167'),
(928, 'ZA', 109, 'Wierdapark', '-25.7069', '28.2294'),
(929, 'ZA', 6446, 'Willowmore', '-33.2833', '23.4833'),
(930, 'ZA', 5040, 'Willowvale', '-32.2667', '28.5167'),
(931, 'ZA', 9420, 'Winburg', '-28.5333', '27.0167'),
(932, 'ZA', 8510, 'Windsorton', '-28.3333', '24.7167'),
(933, 'ZA', 153, 'Wingate Park', '-25.8333', '28.25'),
(934, 'ZA', 4126, 'Winklespruit', '-30.1', '30.85'),
(935, 'ZA', 3331, 'Winterton', '-28.8', '29.5333'),
(936, 'ZA', 1032, 'Witbank', '-25.8667', '29.2333'),
(937, 'ZA', 2068, 'Witkoppen', '-26.2', '28.0833'),
(938, 'ZA', 1240, 'Witrivier', '-25.3167', '31.0167'),
(939, 'ZA', 9868, 'Witsieshoek', '-28.5333', '28.8'),
(940, 'ZA', 2630, 'Wolmaransstad', '-27.2', '25.9667'),
(941, 'ZA', 6830, 'Wolseley', '-33.4167', '19.2'),
(942, 'ZA', 7925, 'Woodstock', '-33.9167', '18.4333'),
(943, 'ZA', 6845, 'Worcester', '-33.65', '19.4333'),
(944, 'ZA', 7800, 'Wynberg', '-34', '18.4667'),
(945, 'ZA', 1281, 'Ximhungwe', '-24.8333', '31.0667'),
(946, 'ZA', 452, 'Xipame', '-24.9667', '29.3'),
(947, 'ZA', 4004, 'Yellowwood Park', '-29.85', '31.0167'),
(948, 'ZA', 7405, 'Ysterplaat', '-33.9', '18.4833'),
(949, 'ZA', 1949, 'Zamdela', '-26.8333', '27.85'),
(950, 'ZA', 9945, 'Zastron', '-30.3', '27.0833'),
(951, 'ZA', 2851, 'Zeerust', '-25.5333', '26.0833'),
(952, 'ZA', 6004, 'Zwide', '-33.8667', '25.5667');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `is_logged_in` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `user_id`, `username`, `is_logged_in`) VALUES
('1a1c60f6be029d2e13a0fc599bffe12d', '66.249.93.171', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1425213292, '', NULL, NULL, NULL),
('2266edfeb5fd329b6c00406e0a559522', '66.249.81.171', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1424834698, '', NULL, NULL, NULL),
('3f454897ba7c6ec438d039c127dff441', '197.78.168.110', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1424539732, 'a:7:{s:9:"user_data";s:0:"";s:8:"username";s:6:"pintos";s:12:"is_logged_in";b:1;s:7:"user_id";s:1:"5";s:9:"user_type";s:1:"2";s:10:"user_photo";s:0:"";i:0;O:8:"stdClass":35:{s:6:"use_id";s:1:"5";s:12:"use_password";s:6:"pintos";s:6:"ust_id";s:1:"2";s:12:"use_username";s:6:"pintos";s:10:"use_status";s:1:"1";s:6:"pem_id";N;s:21:"use_registration_date";s:19:"2014-08-22 11:37:39";s:16:"use_date_updated";s:19:"2014-12-11 08:12:20";s:16:"use_date_deleted";N;s:14:"use_first_name";s:11:"media owner";s:13:"use_last_name";s:9:"developer";s:9:"use_email";s:0:"";s:9:"use_photo";s:0:"";s:17:"use_mobile_number";s:0:"";s:16:"use_company_name";s:13:"Indigo Vision";s:17:"use_street_number";s:0:"";s:10:"use_suburb";s:1:"0";s:8:"use_city";s:0:"";s:11:"use_country";s:0:"";s:20:"use_terms_conditions";s:0:"";s:18:"use_watchlist_mail";s:0:"";s:21:"use_auction_bids_mail";s:0:"";s:22:"use_notifications_mail";s:0:"";s:12:"use_rfp_mail";s:0:"";s:17:"use_workflow_mail";s:0:"";s:17:"use_watchlist_sms";s:0:"";s:19:"use_auctionlist_sms";s:0:"";s:13:"use_notif_sms";s:0:"";s:11:"use_rfp_sms";s:0:"";s:12:"use_flow_sms";s:0:"";s:18:"use_current_status";s:0:"";s:11:"use_deposit";s:0:"";s:17:"use_auction_limit";s:4:"2000";s:18:"use_increase_limit";s:0:"";s:11:"user_status";s:1:"1";}}', NULL, NULL, NULL),
('4367e04fe4e12f5a8609a7b4863a4a16', '197.78.168.110', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1424533943, '', NULL, NULL, NULL),
('530dbfdfa264016a3380b847eb45908c', '66.249.81.171', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1424606601, '', NULL, NULL, NULL),
('a391b9a83477dfc1549e27ebcd5f89ff', '197.78.168.110', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1424552692, 'a:7:{s:9:"user_data";s:0:"";s:8:"username";s:6:"pintos";s:12:"is_logged_in";b:1;s:7:"user_id";s:1:"5";s:9:"user_type";s:1:"2";s:10:"user_photo";s:0:"";i:0;O:8:"stdClass":35:{s:6:"use_id";s:1:"5";s:12:"use_password";s:6:"pintos";s:6:"ust_id";s:1:"2";s:12:"use_username";s:6:"pintos";s:10:"use_status";s:1:"1";s:6:"pem_id";N;s:21:"use_registration_date";s:19:"2014-08-22 11:37:39";s:16:"use_date_updated";s:19:"2014-12-11 08:12:20";s:16:"use_date_deleted";N;s:14:"use_first_name";s:11:"media owner";s:13:"use_last_name";s:9:"developer";s:9:"use_email";s:0:"";s:9:"use_photo";s:0:"";s:17:"use_mobile_number";s:0:"";s:16:"use_company_name";s:13:"Indigo Vision";s:17:"use_street_number";s:0:"";s:10:"use_suburb";s:1:"0";s:8:"use_city";s:0:"";s:11:"use_country";s:0:"";s:20:"use_terms_conditions";s:0:"";s:18:"use_watchlist_mail";s:0:"";s:21:"use_auction_bids_mail";s:0:"";s:22:"use_notifications_mail";s:0:"";s:12:"use_rfp_mail";s:0:"";s:17:"use_workflow_mail";s:0:"";s:17:"use_watchlist_sms";s:0:"";s:19:"use_auctionlist_sms";s:0:"";s:13:"use_notif_sms";s:0:"";s:11:"use_rfp_sms";s:0:"";s:12:"use_flow_sms";s:0:"";s:18:"use_current_status";s:0:"";s:11:"use_deposit";s:0:"";s:17:"use_auction_limit";s:4:"2000";s:18:"use_increase_limit";s:0:"";s:11:"user_status";s:1:"1";}}', NULL, NULL, NULL),
('bda3a79612cd93c49c570eb8d0451a2f', '66.249.88.137', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1425318633, '', NULL, NULL, NULL),
('d1d9c3cbbfa13eee2db5f787b0631edb', '66.249.93.167', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1425042082, '', NULL, NULL, NULL),
('ee8334be5093bdd4699e1227326ff394', '66.249.81.171', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1424638017, '', NULL, NULL, NULL),
('f6f9c0bbfcc8e7baf1288bc9046b2ce7', '66.249.81.175', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1425156333, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `closedrelisted`
--

CREATE TABLE `closedrelisted` (
  `auction` int(32) DEFAULT '0',
  `relistdate` varchar(8) NOT NULL DEFAULT '',
  `newauction` int(32) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment_sheet`
--

CREATE TABLE `comment_sheet` (
`com_id` smallint(6) NOT NULL,
  `com_date` datetime DEFAULT NULL,
  `com_comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
`comm_id` smallint(6) NOT NULL,
  `comt_id` smallint(6) DEFAULT NULL,
  `comm_percentage` decimal(3,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission_type`
--

CREATE TABLE `commission_type` (
`comt_id` smallint(6) NOT NULL,
  `commt_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE `community` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `messages` int(11) NOT NULL DEFAULT '0',
  `lastmessage` varchar(14) NOT NULL DEFAULT '0',
  `msgstoshow` int(11) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `community`
--

INSERT INTO `community` (`id`, `name`, `messages`, `lastmessage`, `msgstoshow`, `active`) VALUES
(1, 'Selling', 0, '', 30, 1),
(2, 'Buying', 0, '20050823103800', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comm_messages`
--

CREATE TABLE `comm_messages` (
`id` int(11) NOT NULL,
  `boardid` int(11) NOT NULL DEFAULT '0',
  `msgdate` varchar(14) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_address_format`
--

CREATE TABLE `contact_address_format` (
`caf_id` smallint(6) NOT NULL,
  `caf_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
`con_id` smallint(6) NOT NULL,
  `con_date` datetime DEFAULT NULL,
  `cnt_id` smallint(6) DEFAULT NULL,
  `ope_id` smallint(6) DEFAULT NULL,
  `contractcol` varchar(45) DEFAULT NULL,
  `cam_id` smallint(6) DEFAULT NULL,
  `con_start_date` datetime DEFAULT NULL,
  `con_end_date` datetime DEFAULT NULL,
  `con_notes` varchar(4005) DEFAULT NULL,
  `use_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `cnt_id` smallint(6) NOT NULL,
  `cnt_description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `users` int(11) DEFAULT '0',
  `inactiveusers` int(11) NOT NULL DEFAULT '0',
  `auctions` int(11) DEFAULT '0',
  `closedauctions` int(11) NOT NULL DEFAULT '0',
  `bids` int(11) NOT NULL DEFAULT '0',
  `suspendedauctions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`users`, `inactiveusers`, `auctions`, `closedauctions`, `bids`, `suspendedauctions`) VALUES
(0, 0, 3, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country`) VALUES
('Afghanistan'),
('Albania'),
('Algeria'),
('American Samoa'),
('Andorra'),
('Angola'),
('Anguilla'),
('Antarctica'),
('Antigua And Barbuda'),
('Argentina'),
('Armenia'),
('Aruba'),
('Australia'),
('Austria'),
('Azerbaijan Republic'),
('Bahamas'),
('Bahrain'),
('Bangladesh'),
('Barbados'),
('Belarus'),
('Belgium'),
('Belize'),
('Benin'),
('Bermuda'),
('Bhutan'),
('Bolivia'),
('Bosnia and Herzegowina'),
('Botswana'),
('Bouvet Island'),
('Brazil'),
('British Indian Ocean Territory'),
('Brunei Darussalam'),
('Bulgaria'),
('Burkina Faso'),
('Burma'),
('Burundi'),
('Cambodia'),
('Cameroon'),
('Canada'),
('Cape Verde'),
('Cayman Islands'),
('Central African Republic'),
('Chad'),
('Chile'),
('China'),
('Christmas Island'),
('Cocos &#40;Keeling&#41; Islands'),
('Colombia'),
('Comoros'),
('Congo'),
('Congo, the Democratic Republic'),
('Cook Islands'),
('Costa Rica'),
('Cote d&#39;Ivoire'),
('Croatia'),
('Cyprus'),
('Czech Republic'),
('Denmark'),
('Djibouti'),
('Dominica'),
('Dominican Republic'),
('East Timor'),
('Ecuador'),
('Egypt'),
('El Salvador'),
('Equatorial Guinea'),
('Eritrea'),
('Estonia'),
('Ethiopia'),
('Falkland Islands'),
('Faroe Islands'),
('Fiji'),
('Finland'),
('France'),
('French Guiana'),
('French Polynesia'),
('French Southern Territories'),
('Gabon'),
('Gambia'),
('Georgia'),
('Germany'),
('Ghana'),
('Gibraltar'),
('Great Britain'),
('Greece'),
('Greenland'),
('Grenada'),
('Guadeloupe'),
('Guam'),
('Guatemala'),
('Guinea'),
('Guinea-Bissau'),
('Guyana'),
('Haiti'),
('Heard and Mc Donald Islands'),
('Honduras'),
('Hong Kong'),
('Hungary'),
('Iceland'),
('India'),
('Indonesia'),
('Ireland'),
('Israel'),
('Italy'),
('Jamaica'),
('Japan'),
('Jordan'),
('Kazakhstan'),
('Kenya'),
('Kiribati'),
('Korea &#40;South&#41;'),
('Kuwait'),
('Kyrgyzstan'),
('Lao People&#39;s Democratic Republic'),
('Latvia'),
('Lebanon'),
('Lesotho'),
('Liberia'),
('Liechtenstein'),
('Lithuania'),
('Luxembourg'),
('Macau'),
('Macedonia'),
('Madagascar'),
('Malawi'),
('Malaysia'),
('Maldives'),
('Mali'),
('Malta'),
('Marshall Islands'),
('Martinique'),
('Mauritania'),
('Mauritius'),
('Mayotte'),
('Mexico'),
('Micronesia, Federated States of'),
('Moldova, Republic of'),
('Monaco'),
('Mongolia'),
('Montserrat'),
('Morocco'),
('Mozambique'),
('Namibia'),
('Nauru'),
('Nepal'),
('Netherlands'),
('Netherlands Antilles'),
('New Caledonia'),
('New Zealand'),
('Nicaragua'),
('Niger'),
('Nigeria'),
('Niuev'),
('Norfolk Island'),
('Northern Mariana Islands'),
('Norway'),
('Oman'),
('Pakistan'),
('Palau'),
('Panama'),
('Papua New Guinea'),
('Paraguay'),
('Peru'),
('Philippines'),
('Pitcairn'),
('Poland'),
('Portugal'),
('Puerto Rico'),
('Qatar'),
('Reunion'),
('Romania'),
('Russian Federation'),
('Rwanda'),
('Saint Kitts and Nevis'),
('Saint Lucia'),
('Saint Vincent and the Grenadin'),
('Samoa &#40;Independent&#41;'),
('San Marino'),
('Sao Tome and Principe'),
('Saudi Arabia'),
('Senegal'),
('Seychelles'),
('Sierra Leone'),
('Singapore'),
('Slovakia'),
('Slovenia'),
('Solomon Islands'),
('Somalia'),
('South Africa'),
('South Georgia'),
('Spain'),
('Sri Lanka'),
('St. Helena'),
('St. Pierre and Miquelon'),
('Suriname'),
('Svalbard and Jan Mayen Islands'),
('Swaziland'),
('Sweden'),
('Switzerland'),
('Taiwan'),
('Tajikistan'),
('Tanzania'),
('Thailand'),
('Togo'),
('Tokelau'),
('Tonga'),
('Trinidad and Tobago'),
('Tunisia'),
('Turkey'),
('Turkmenistan'),
('Turks and Caicos Islands'),
('Tuvalu'),
('Uganda'),
('Ukraine'),
('United Arab Emiratesv'),
('United Kingdom'),
('United States'),
('Uruguay'),
('Uzbekistan'),
('Vanuatu'),
('Venezuela'),
('Viet Nam'),
('Virgin Islands &#40;British&#41;'),
('Virgin Islands &#40;U.S.&#41;'),
('Wallis and Futuna Islands'),
('Western Sahara'),
('Yemen'),
('Zambia'),
('Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
`cou_id` smallint(6) NOT NULL,
  `cou_name` varchar(255) DEFAULT NULL,
  `adf_id` smallint(6) DEFAULT NULL COMMENT 'FK: address_format',
  `cou_zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`cou_id`, `cou_name`, `adf_id`, `cou_zip_code`) VALUES
(1, 'South Africa', 1, 277);

-- --------------------------------------------------------

--
-- Table structure for table `country_address_format`
--

CREATE TABLE `country_address_format` (
`adf_id` smallint(6) NOT NULL,
  `adr_address_format` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_address_format`
--

INSERT INTO `country_address_format` (`adf_id`, `adr_address_format`) VALUES
(1, 'country, region, city, surbub, plot number, street');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
`cur_id` smallint(6) NOT NULL,
  `cur_code` varchar(255) DEFAULT NULL,
  `cur_description` varchar(255) DEFAULT NULL,
  `cur_EMU` tinyint(4) DEFAULT NULL,
  `cur_rounding_precision` float DEFAULT NULL,
  `cur_decimal_places` int(11) DEFAULT NULL,
  `cur_invoice_rounding_precision` float DEFAULT NULL,
  `cur_unit_rounding_precision` float DEFAULT NULL,
  `cur_unit_decimal_places` float DEFAULT NULL,
  `cur_application_rounding_precision` float DEFAULT NULL,
  `cur_date_adjusted` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currentaccesses`
--

CREATE TABLE `currentaccesses` (
  `day` char(2) NOT NULL DEFAULT '0',
  `month` char(2) NOT NULL DEFAULT '0',
  `year` char(4) NOT NULL DEFAULT '0',
  `pageviews` int(11) NOT NULL DEFAULT '0',
  `uniquevisitors` int(11) NOT NULL DEFAULT '0',
  `usersessions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currentbrowsers`
--

CREATE TABLE `currentbrowsers` (
  `month` char(2) NOT NULL DEFAULT '0',
  `year` varchar(4) NOT NULL DEFAULT '0',
  `browser` varchar(50) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currentplatforms`
--

CREATE TABLE `currentplatforms` (
  `month` char(2) NOT NULL DEFAULT '0',
  `year` varchar(4) NOT NULL DEFAULT '0',
  `platform` varchar(50) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
`cus_group_id` smallint(6) NOT NULL,
  `cus_group_name` varchar(255) DEFAULT NULL,
  `cus_GCP_id` tinyint(4) DEFAULT NULL,
  `time_type_id` tinyint(4) DEFAULT NULL,
  `pay_id` tinyint(4) DEFAULT NULL,
  `cus_group_customer` varchar(255) DEFAULT NULL,
  `cus_holding_company` varchar(255) DEFAULT NULL,
  `cur_id` tinyint(4) DEFAULT NULL,
  `cou_id` varchar(255) DEFAULT NULL,
  `cus_group_name2` varchar(255) DEFAULT NULL,
  `cus_legal_entity_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
`dis_id` smallint(6) NOT NULL,
  `lot_id` smallint(6) DEFAULT NULL,
  `dis_description` varchar(255) DEFAULT NULL,
  `dis_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_status`
--

CREATE TABLE `document_status` (
`dos_id` smallint(6) NOT NULL,
  `dos_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
`dot_id` smallint(6) NOT NULL,
  `dot_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `durations`
--

CREATE TABLE `durations` (
`id` int(11) NOT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1-day, 2-week, 3-month'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `durations`
--

INSERT INTO `durations` (`id`, `days`, `description`, `type`) VALUES
(1, 1, '2 weeks', 2),
(2, 2, '3 weeks', 2),
(3, 3, '1 month', 3),
(4, 7, '2 months', 3),
(5, 14, '3 months', 3),
(6, 0, '1 week', 2),
(7, 15, '1 day', 1),
(8, 16, '2 days', 1),
(9, 17, '3 days', 1),
(10, 18, '> 3 days', 1),
(11, 19, '> 3 weeks', 2),
(12, 20, '> 3 months', 3);

-- --------------------------------------------------------

--
-- Table structure for table `durations_copy`
--

CREATE TABLE `durations_copy` (
  `days` int(11) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `durations_copy`
--

INSERT INTO `durations_copy` (`days`, `description`) VALUES
(1, '2 weeks'),
(2, '3 weeks'),
(3, '1 month'),
(7, '2 months'),
(14, '3 months');

-- --------------------------------------------------------

--
-- Table structure for table `durations_old`
--

CREATE TABLE `durations_old` (
  `days` int(11) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `durations_old`
--

INSERT INTO `durations_old` (`days`, `description`) VALUES
(1, '2 weeks'),
(2, '3 weeks'),
(3, '1 month'),
(7, '2 months'),
(14, '3 months');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
`emp_id` smallint(6) NOT NULL,
  `emt_id` smallint(6) DEFAULT NULL COMMENT 'FK: employee_type',
  `emp_first_name` varchar(255) DEFAULT NULL,
  `emp_surname` varchar(255) DEFAULT NULL,
  `jot_id` smallint(6) DEFAULT NULL COMMENT 'FK: job_type',
  `emp_tel_code` int(11) DEFAULT NULL,
  `emp_tel` int(11) DEFAULT NULL,
  `emp_cell_code` int(11) DEFAULT NULL,
  `emp_cell` int(11) DEFAULT NULL,
  `emp_comment` varchar(255) DEFAULT NULL,
  `cnd_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emt_id`, `emp_first_name`, `emp_surname`, `jot_id`, `emp_tel_code`, `emp_tel`, `emp_cell_code`, `emp_cell`, `emp_comment`, `cnd_id`) VALUES
(1, NULL, 'John', 'Doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'John', 'Butch', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'John', 'Michael', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

CREATE TABLE `employee_type` (
`emt_id` smallint(6) NOT NULL,
  `emt_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `face`
--

CREATE TABLE `face` (
`fac_id` smallint(6) NOT NULL,
  `fac_description` varchar(255) DEFAULT NULL,
  `fac_number` int(11) DEFAULT NULL,
  `fac_reference_number` varchar(255) DEFAULT NULL,
  `fac_name` varchar(255) DEFAULT NULL,
  `inv_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
`id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `category` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category`) VALUES
(2, 'Registering', 'To register as a new user, click on Register at the top of the window. You will be asked for your name, a username and password, and contact information, including your email address.\r\n\r\n<B>You must be at least 18 years of age to register.</B>!', 1),
(4, 'Item Watch', '<b>Item watch</b> notifies you when someone bids on the auctions that you have added to your Item Watch. ', 3),
(5, 'What is a Dutch auction?', 'Dutch auction is a type of auction where the auctioneer begins with a high asking price which is lowered until some participant is willing to accept the auctioneer''s price. The winning participant pays the last announced price.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqscategories`
--

CREATE TABLE `faqscategories` (
`id` int(11) NOT NULL,
  `category` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqscategories`
--

INSERT INTO `faqscategories` (`id`, `category`) VALUES
(1, 'General'),
(2, 'Selling'),
(3, 'Buying');

-- --------------------------------------------------------

--
-- Table structure for table `faqscat_translated`
--

CREATE TABLE `faqscat_translated` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang` char(2) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqscat_translated`
--

INSERT INTO `faqscat_translated` (`id`, `lang`, `category`) VALUES
(3, 'EN', 'Buying'),
(3, 'ES', 'Comprar'),
(1, 'EN', 'General'),
(1, 'ES', 'General'),
(2, 'EN', 'Selling'),
(2, 'ES', 'Vender');

-- --------------------------------------------------------

--
-- Table structure for table `faqs_translated`
--

CREATE TABLE `faqs_translated` (
`id` int(11) NOT NULL,
  `lang` char(2) NOT NULL DEFAULT '',
  `question` varchar(200) NOT NULL DEFAULT '',
  `answer` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqs_translated`
--

INSERT INTO `faqs_translated` (`id`, `lang`, `question`, `answer`) VALUES
(2, 'EN', 'Registering', 'To register as a new user, click on Register at the top of the window. You will be asked for your name, a username and password, and contact information, including your email address.\r\n\r\n<B>You must be at least 18 years of age to register.</B>!'),
(2, 'ES', 'Registrarse', 'Para registrar un nuevo usuario, haz click en <B>Reg&iacute;Ã‚Â­strate</B> en la parte superior de la pantalla. Se te preguntar&aacute;n tus datos personales, un nombre de usuario, una contrase&ntilde;a e informacion de contacto como la direccion e-mail.\r\n\r\n<B>¡Tienes que ser mayor de edad para poder registrarte!</B>'),
(4, 'EN', 'Item Watch', '<b>Item watch</b> notifies you when someone bids on the auctions that you have added to your Item Watch. '),
(4, 'ES', 'En la Mira', '<i><b>En la Mira</b></i> te env&iacute;a una notificacion por e-mail, cada vez que alguien puja en una de las subastas que has a&ntilde;adido a tu lista <i>En la Mira</i>. '),
(6, 'ES', 'Auction Watch', '<i><B>Auction Watch</b></i> es tu asistente para saber cuando se abre una subasta cuya descripcion contiene palabras clave de tu interes.\r\n\r\nPara usar esta opcion inserta las palabras clave en las que est&aacute;s interesado en la lista de <i>Auction Watch</i>. Todas las palabras claves deben estar separadas por un espacio. Cuando estas palabras claves aparezcan en alg&uacute;n t&iacute;tulo o descripcion de subasta, recibir&aacute;s un e-mail con la informacion de que una subasta que contiene tus palabras claves ha sido creada. Tambi&aacute;n puedas agregar el nombre del usuario como palabra clave. ');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
`id` int(11) NOT NULL,
  `rated_user_id` int(32) DEFAULT NULL,
  `rater_user_nick` varchar(20) DEFAULT NULL,
  `feedback` mediumtext,
  `rate` int(2) DEFAULT NULL,
  `feedbackdate` int(15) NOT NULL,
  `auction_id` int(32) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
`id` int(5) NOT NULL,
  `fee_from` double(16,4) NOT NULL DEFAULT '0.0000',
  `fee_to` double(16,4) NOT NULL DEFAULT '0.0000',
  `fee_type` enum('flat','perc') NOT NULL DEFAULT 'flat',
  `value` double(8,4) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `fee_from`, `fee_to`, `fee_type`, `value`, `type`) VALUES
(1, 0.0000, 0.0000, 'flat', 0.0000, 'signup_fee'),
(2, 0.0000, 0.0000, 'flat', 0.0000, 'buyer_fee'),
(3, 0.0000, 0.0000, 'flat', 0.0000, 'setup'),
(4, 0.0000, 0.0000, 'flat', 0.0000, 'hpfeat_fee'),
(5, 0.0000, 0.0000, 'flat', 0.0000, 'bolditem_fee'),
(6, 0.0000, 0.0000, 'flat', 0.0000, 'hlitem_fee'),
(7, 0.0000, 0.0000, 'flat', 0.0000, 'rp_fee'),
(8, 0.0000, 0.0000, 'flat', 0.0000, 'picture_fee'),
(9, 0.0000, 0.0000, 'flat', 0.0000, 'subtitle_fee'),
(10, 0.0000, 0.0000, 'flat', 0.0000, 'excat_fee'),
(11, 0.0000, 0.0000, 'flat', 0.0000, 'relist_fee'),
(12, 0.0000, 0.0000, 'flat', 0.0000, 'buyout_fee'),
(13, 0.0000, 0.0000, 'flat', 0.0000, 'endauc_fee');

-- --------------------------------------------------------

--
-- Table structure for table `filterwords`
--

CREATE TABLE `filterwords` (
  `word` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filterwords`
--

INSERT INTO `filterwords` (`word`) VALUES
('');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `gateways` text,
  `paypal_address` varchar(50) NOT NULL DEFAULT '',
  `paypal_required` int(1) NOT NULL DEFAULT '0',
  `paypal_active` int(1) NOT NULL DEFAULT '0',
  `authnet_address` varchar(50) NOT NULL DEFAULT '',
  `authnet_password` varchar(50) NOT NULL DEFAULT '',
  `authnet_required` int(1) NOT NULL DEFAULT '0',
  `authnet_active` int(1) NOT NULL DEFAULT '0',
  `worldpay_address` varchar(50) NOT NULL DEFAULT '',
  `worldpay_required` int(1) NOT NULL DEFAULT '0',
  `worldpay_active` int(1) NOT NULL DEFAULT '0',
  `moneybookers_address` varchar(50) NOT NULL DEFAULT '',
  `moneybookers_required` int(1) NOT NULL DEFAULT '0',
  `moneybookers_active` int(1) NOT NULL DEFAULT '0',
  `toocheckout_address` varchar(50) NOT NULL DEFAULT '',
  `toocheckout_required` int(1) NOT NULL DEFAULT '0',
  `toocheckout_active` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`gateways`, `paypal_address`, `paypal_required`, `paypal_active`, `authnet_address`, `authnet_password`, `authnet_required`, `authnet_active`, `worldpay_address`, `worldpay_required`, `worldpay_active`, `moneybookers_address`, `moneybookers_required`, `moneybookers_active`, `toocheckout_address`, `toocheckout_required`, `toocheckout_active`) VALUES
('paypal,authnet,worldpay,moneybookers,toocheckout', '', 0, 1, '', '', 0, 1, '', 0, 1, '', 0, 1, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
`id` int(5) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_sell` int(1) NOT NULL DEFAULT '0',
  `can_buy` int(1) NOT NULL DEFAULT '0',
  `count` int(15) NOT NULL DEFAULT '0',
  `auto_join` int(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `can_sell`, `can_buy`, `count`, `auto_join`) VALUES
(1, 'Sellers', 1, 0, 0, 1),
(2, 'Buyers', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
`img_id` int(6) NOT NULL,
  `ass_id` int(6) NOT NULL,
  `url` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `ass_id`, `url`) VALUES
(1, 1, '../../assets/images/add1.jpg'),
(2, 2, '../../assets/images/add2.jpg'),
(3, 3, '../../assets/images/m4.png');

-- --------------------------------------------------------

--
-- Table structure for table `images_all`
--

CREATE TABLE `images_all` (
`id` int(6) NOT NULL,
  ` img_id` int(6) NOT NULL,
  `url` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images_all`
--

INSERT INTO `images_all` (`id`, ` img_id`, `url`) VALUES
(1, 1, '../../assets/add1.jpg'),
(2, 1, '../../assets/add2.jpg'),
(3, 1, '../../assets/images/m5.png');

-- --------------------------------------------------------

--
-- Table structure for table `increments`
--

CREATE TABLE `increments` (
`id` int(3) NOT NULL,
  `low` double(16,4) DEFAULT NULL,
  `high` double(16,4) DEFAULT NULL,
  `increment` double(16,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `increments`
--

INSERT INTO `increments` (`id`, `low`, `high`, `increment`) VALUES
(1, 0.0000, 0.9900, 0.2800),
(2, 1.0000, 9.9900, 0.5000),
(3, 10.0000, 29.9900, 1.0000),
(4, 30.0000, 99.9900, 2.0000),
(5, 100.0000, 249.9900, 5.0000),
(6, 250.0000, 499.9900, 10.0000),
(7, 500.0000, 999.9900, 25.0000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_status`
--

CREATE TABLE `inventory_status` (
`ins_id` smallint(6) NOT NULL,
  `ins_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_title`
--

CREATE TABLE `job_title` (
`jot_id` smallint(6) NOT NULL,
  `jot_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lms_user`
--

CREATE TABLE `lms_user` (
`use_id` smallint(5) unsigned NOT NULL,
  `use_password` varchar(32) NOT NULL,
  `ust_id` smallint(5) unsigned NOT NULL DEFAULT '5',
  `use_username` varchar(45) NOT NULL,
  `use_status` tinyint(4) NOT NULL DEFAULT '1',
  `pem_id` smallint(5) unsigned DEFAULT NULL,
  `use_registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `use_date_updated` datetime DEFAULT NULL,
  `use_date_deleted` datetime DEFAULT NULL,
  `use_first_name` varchar(35) DEFAULT NULL,
  `use_last_name` varchar(35) DEFAULT NULL,
  `use_email` varchar(50) DEFAULT NULL,
  `use_photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location_continent`
--

CREATE TABLE `location_continent` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_continent`
--

INSERT INTO `location_continent` (`id`, `name`) VALUES
(1, 'Africa'),
(2, 'Antarctica'),
(3, 'Asia'),
(4, 'Australia/Oceania'),
(5, 'Caribbean'),
(6, 'Central America'),
(7, 'Europe'),
(8, 'Islands'),
(9, 'Middle East'),
(10, 'North America'),
(11, 'South America');

-- --------------------------------------------------------

--
-- Table structure for table `location_costing`
--

CREATE TABLE `location_costing` (
`lcc_id` smallint(6) NOT NULL,
  `wor_id` smallint(6) DEFAULT NULL COMMENT 'FK: work_type',
  `meu_id` smallint(6) DEFAULT NULL,
  `lcc_quantity` int(11) DEFAULT NULL,
  `lcc_unit_price_SCY` float DEFAULT NULL,
  `lcc_total_price_SCY` float DEFAULT NULL,
  `lcc_total_billed_SCY` float DEFAULT NULL,
  `lcc_billable_percentage` float DEFAULT NULL,
  `lcc_unit_cost_BCY` float DEFAULT NULL,
  `lcc_total_cost_BCY` float DEFAULT NULL,
  `lcc_total_invoiced` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_countries`
--

CREATE TABLE `location_countries` (
`id` int(11) NOT NULL,
  `continent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_countries`
--

INSERT INTO `location_countries` (`id`, `continent_id`, `name`) VALUES
(1, 1, 'Algeria'),
(2, 1, 'Angola'),
(3, 1, 'Benin'),
(4, 1, 'Botswana'),
(5, 1, 'Burkina Faso'),
(6, 1, 'Burundi'),
(7, 1, 'Cameroon'),
(8, 1, 'Cape Verde'),
(9, 1, 'Central African Republic'),
(10, 1, 'Chad'),
(11, 1, 'Comoros'),
(12, 1, 'Congo, Dem.'),
(13, 1, 'Congo, Rep.'),
(14, 1, 'Djibouti'),
(15, 1, 'Egypt'),
(16, 1, 'Equatorial Guinea'),
(17, 1, 'Eritrea'),
(18, 1, 'Ethiopia'),
(19, 1, 'Gabon'),
(20, 1, 'Gambia'),
(21, 1, 'Ghana'),
(22, 1, 'Guinea'),
(23, 1, 'Guinea-Bissau'),
(24, 1, 'Kenya'),
(25, 1, 'Lesotho'),
(26, 1, 'Liberia'),
(27, 1, 'Libya'),
(28, 1, 'Madagascar'),
(29, 1, 'Malawi'),
(30, 1, 'Mali'),
(31, 1, 'Mauritania'),
(32, 1, 'Mauritius'),
(33, 1, 'Morocco'),
(34, 1, 'Mozambique'),
(35, 1, 'Namibia'),
(36, 1, 'Niger'),
(37, 1, 'Nigeria'),
(38, 1, 'Rwanda'),
(39, 1, 'Sao Tome/Principe'),
(40, 1, 'Senegal'),
(41, 1, 'Seychelles'),
(42, 1, 'Sierra Leone'),
(43, 1, 'Somalia'),
(44, 1, 'South Africa'),
(45, 1, 'Sudan'),
(46, 1, 'Swaziland'),
(47, 1, 'Tanzania'),
(48, 1, 'Togo'),
(49, 1, 'Tunisia'),
(50, 1, 'Uganda'),
(51, 1, 'Zambia'),
(52, 1, 'Zimbabwe'),
(53, 2, 'Amundsen-Scott'),
(54, 3, 'Bangladesh'),
(55, 3, 'Bhutan'),
(56, 3, 'Brunei'),
(57, 3, 'Burma (Myanmar)'),
(58, 3, 'Cambodia'),
(59, 3, 'China'),
(60, 3, 'East Timor'),
(61, 3, 'India'),
(62, 3, 'Indonesia'),
(63, 3, 'Japan'),
(64, 3, 'Kazakhstan'),
(65, 3, 'Korea (north)'),
(66, 3, 'Korea (south)'),
(67, 3, 'Laos'),
(68, 3, 'Malaysia'),
(69, 3, 'Maldives'),
(70, 3, 'Mongolia'),
(71, 3, 'Nepal'),
(72, 3, 'Philippines'),
(73, 3, 'Russian Federation'),
(74, 3, 'Singapore'),
(75, 3, 'Sri Lanka'),
(76, 3, 'Taiwan'),
(77, 3, 'Thailand'),
(78, 3, 'Vietnam'),
(79, 4, 'Australia'),
(80, 4, 'Fiji'),
(81, 4, 'Kiribati'),
(82, 4, 'Micronesia'),
(83, 4, 'Nauru'),
(84, 4, 'New Zealand'),
(85, 4, 'Palau'),
(86, 4, 'Papua New Guinea'),
(87, 4, 'Samoa'),
(88, 4, 'Tonga'),
(89, 4, 'Tuvalu'),
(90, 4, 'Vanuatu'),
(91, 5, 'Anguilla'),
(92, 5, 'Antigua/Barbuda'),
(93, 5, 'Aruba'),
(94, 5, 'Bahamas'),
(95, 5, 'Barbados'),
(96, 5, 'Cozumel'),
(97, 5, 'Cuba'),
(98, 5, 'Dominica'),
(99, 5, 'Dominican Republic'),
(100, 5, 'Grenada'),
(101, 5, 'Guadeloupe'),
(102, 5, 'Haiti'),
(103, 5, 'Jamaica'),
(104, 5, 'Martinique'),
(105, 5, 'Montserrat'),
(106, 5, 'Netherlands Antilles'),
(107, 5, 'Puerto Rico'),
(108, 5, 'St. Barts'),
(109, 5, 'St. Kitts/Nevis'),
(110, 5, 'St. Lucia'),
(111, 5, 'St. Martin/Sint Maarten'),
(112, 5, 'St Vincent/Grenadines'),
(113, 5, 'San Andres'),
(114, 5, 'Trinidad/Tobago'),
(115, 5, 'Turks/Caicos'),
(116, 6, 'Belize'),
(117, 6, 'Costa Rica'),
(118, 6, 'El Salvador'),
(119, 6, 'Guatemala'),
(120, 6, 'Honduras'),
(121, 6, 'Nicaragua'),
(122, 6, 'Panama'),
(123, 7, 'Albania'),
(124, 7, 'Andorra'),
(125, 7, 'Austria'),
(126, 7, 'Belarus'),
(127, 7, 'Belgium'),
(128, 7, 'Bosnia-Herzegovina'),
(129, 7, 'Bulgaria'),
(130, 7, 'Croatia'),
(131, 7, 'Czech Republic'),
(132, 7, 'Denmark'),
(133, 7, 'Estonia'),
(134, 7, 'Finland'),
(135, 7, 'France'),
(136, 7, 'Georgia'),
(137, 7, 'Germany'),
(138, 7, 'Greece'),
(139, 7, 'Hungary'),
(140, 7, 'Iceland'),
(141, 7, 'Ireland'),
(142, 7, 'Italy'),
(143, 7, 'Latvia'),
(144, 7, 'Liechtenstein'),
(145, 7, 'Lithuania'),
(146, 7, 'Luxembourg'),
(147, 7, 'Macedonia'),
(148, 7, 'Malta'),
(149, 7, 'Moldova'),
(150, 7, 'Monaco'),
(151, 7, 'Netherlands'),
(152, 7, 'Norway'),
(153, 7, 'Poland'),
(154, 7, 'Portugal'),
(155, 7, 'Romania'),
(156, 7, 'San Marino'),
(157, 7, 'Serbia/Montenegro (Yugoslavia)'),
(158, 7, 'Slovakia'),
(159, 7, 'Slovenia'),
(160, 7, 'Spain'),
(161, 7, 'Sweden'),
(162, 7, 'Switzerland'),
(163, 7, 'Ukraine'),
(164, 7, 'United Kingdom'),
(165, 7, 'Vatican City'),
(166, 8, 'Arctic Ocean'),
(167, 8, 'Atlantic Ocean (North)'),
(168, 8, 'Atlantic Ocean (South)'),
(169, 8, 'Assorted'),
(170, 8, 'Caribbean Sea'),
(171, 8, 'Greek Isles'),
(172, 8, 'Indian Ocean'),
(173, 8, 'Mediterranean Sea'),
(174, 8, 'Oceania'),
(175, 8, 'Pacific Ocean (North)'),
(176, 8, 'Pacific Ocean (South)'),
(177, 9, 'Afghanistan'),
(178, 9, 'Armenia'),
(179, 9, 'Azerbaijan'),
(180, 9, 'Bahrain'),
(181, 9, 'Cyprus'),
(182, 9, 'Iran'),
(183, 9, 'Iraq'),
(184, 9, 'Israel'),
(185, 9, 'Jordan'),
(186, 9, 'Kuwait'),
(187, 9, 'Kyrgyzstan'),
(188, 9, 'Lebanon'),
(189, 9, 'Oman'),
(190, 9, 'Pakistan'),
(191, 9, 'Qatar'),
(192, 9, 'Saudi Arabia'),
(193, 9, 'Syria'),
(194, 9, 'Tajikistan'),
(195, 9, 'Turkey'),
(196, 9, 'Turkmenistan'),
(197, 9, 'United Arab Emirates'),
(198, 9, 'Uzbekistan'),
(199, 9, 'Yemen'),
(200, 10, 'Bermuda'),
(201, 10, 'Canada'),
(202, 10, 'Greenland'),
(203, 10, 'Mexico'),
(204, 10, 'United States'),
(205, 11, 'Argentina'),
(206, 11, 'Bolivia'),
(207, 11, 'Brazil'),
(208, 11, 'Chile'),
(209, 11, 'Colombia'),
(210, 11, 'Ecuador'),
(211, 11, 'Guyana'),
(212, 11, 'Paraguay'),
(213, 11, 'Peru'),
(214, 11, 'Suriname'),
(215, 11, 'Uruguay'),
(216, 11, 'Venezuela');

-- --------------------------------------------------------

--
-- Table structure for table `location_direction`
--

CREATE TABLE `location_direction` (
`ldi_id` smallint(6) NOT NULL,
  `ldi_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_gender`
--

CREATE TABLE `location_gender` (
`log_id` smallint(6) NOT NULL,
  `log_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_group`
--

CREATE TABLE `location_group` (
`lgr_id` smallint(6) NOT NULL,
  `lgr_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_owner_type`
--

CREATE TABLE `location_owner_type` (
`lwt_id` smallint(6) NOT NULL,
  `lwt_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_photo_type`
--

CREATE TABLE `location_photo_type` (
`lpt_id` smallint(6) NOT NULL,
  `lpt_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_position`
--

CREATE TABLE `location_position` (
`lop_id` smallint(6) NOT NULL,
  `met_id` smallint(6) DEFAULT NULL,
  `lop_description` varchar(255) DEFAULT NULL,
  `lop_media_description` varchar(255) DEFAULT NULL,
  `lop_risk_calculation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_province`
--

CREATE TABLE `location_province` (
`id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5107 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_province`
--

INSERT INTO `location_province` (`id`, `country_id`, `name`) VALUES
(1, 1, ''),
(2, 1, 'Algiers'),
(3, 1, ''),
(4, 1, 'Adrar'),
(5, 1, 'Ain Defla'),
(6, 1, 'Ain Temouchent'),
(7, 1, 'Alger'),
(8, 1, 'Annaba'),
(9, 1, 'Batna'),
(10, 1, 'Bechar'),
(11, 1, 'Bejaia'),
(12, 1, 'Biskra'),
(13, 1, 'Blida'),
(14, 1, 'Bordj Bou Arreridj'),
(15, 1, 'Bouira'),
(16, 1, 'Boumerdes'),
(17, 1, 'Chlef'),
(18, 1, 'Constantine'),
(19, 1, 'Djelfa'),
(20, 1, 'El Bayadh'),
(21, 1, 'El Oued'),
(22, 1, 'El Tarf'),
(23, 1, 'Ghardaia'),
(24, 1, 'Guelma'),
(25, 1, 'Illizi'),
(26, 1, 'Jijel'),
(27, 1, 'Khenchela'),
(28, 1, 'Laghouat'),
(29, 1, 'Mascara'),
(30, 1, 'Medea'),
(31, 1, 'Mila'),
(32, 1, 'Mostaganem'),
(33, 1, 'Naama'),
(34, 1, 'Oran'),
(35, 1, 'Ouargla'),
(36, 1, 'Oum el Bouaghi'),
(37, 1, 'Relizane'),
(38, 1, 'Saida'),
(39, 1, 'Setif'),
(40, 1, 'Sidi Bel Abbes'),
(41, 1, 'Skikda'),
(42, 1, 'Souk Ahras'),
(43, 1, 'Tamanghasset'),
(44, 1, 'Tebessa'),
(45, 1, 'Tiaret'),
(46, 1, 'Tindouf'),
(47, 1, 'Tipaza'),
(48, 1, 'Tissemsilt'),
(49, 1, 'Tizi Ouzou'),
(50, 1, 'Tlemcen'),
(51, 2, ''),
(52, 2, 'Luanda'),
(53, 2, ''),
(54, 2, 'Bengo'),
(55, 2, 'Benguela'),
(56, 2, 'Bie'),
(57, 2, 'Cabinda'),
(58, 2, 'Cuando Cubango'),
(59, 2, 'Cuanza Norte'),
(60, 2, 'Cuanza Sul'),
(61, 2, 'Cunene'),
(62, 2, 'Huambo'),
(63, 2, 'Huila'),
(64, 2, 'Lunda Norte'),
(65, 2, 'Lunda Sul'),
(66, 2, 'Malanje'),
(67, 2, 'Moxico'),
(68, 2, 'Namibe'),
(69, 2, 'Uige'),
(70, 2, 'Zaire'),
(71, 3, ''),
(72, 3, 'Porto-Novo'),
(73, 3, ''),
(74, 3, 'Alibori'),
(75, 3, 'Atakora'),
(76, 3, 'Atlantique'),
(77, 3, 'Borgou'),
(78, 3, 'Collines'),
(79, 3, 'Couffo'),
(80, 3, 'Donga'),
(81, 3, 'Littoral'),
(82, 3, 'Mono'),
(83, 3, 'Oueme'),
(84, 3, 'Plateau'),
(85, 3, 'Zou'),
(86, 4, ''),
(87, 4, 'Gaborone'),
(88, 4, ''),
(89, 4, 'Central'),
(90, 4, 'Chobe'),
(91, 4, 'Francistown'),
(92, 4, 'Ghanzi'),
(93, 4, 'Kgalagadi'),
(94, 4, 'Kgatleng'),
(95, 4, 'Kweneng'),
(96, 4, 'Lobatse'),
(97, 4, 'Ngamiland'),
(98, 4, 'North-East'),
(99, 4, 'Selebi-Pikwe'),
(100, 4, 'South-East'),
(101, 4, 'Southern'),
(102, 5, ''),
(103, 5, 'Ouagadougou'),
(104, 5, ''),
(105, 5, 'Bale'),
(106, 5, 'Bam'),
(107, 5, 'Banwa'),
(108, 5, 'Bazega'),
(109, 5, 'Bougouriba'),
(110, 5, 'Boulgou'),
(111, 5, 'Boulkiemde'),
(112, 5, 'Comoe'),
(113, 5, 'Ganzourgou'),
(114, 5, 'Gnagna'),
(115, 5, 'Gourma'),
(116, 5, 'Houet'),
(117, 5, 'Ioba'),
(118, 5, 'Kadiogo'),
(119, 5, 'Kenedougou'),
(120, 5, 'Komandjari'),
(121, 5, 'Kompienga'),
(122, 5, 'Kossi'),
(123, 5, 'Koupelogo'),
(124, 5, 'Kouritenga'),
(125, 5, 'Kourweogo'),
(126, 5, 'Leraba'),
(127, 5, 'Loroum'),
(128, 5, 'Mouhoun'),
(129, 5, 'Nahouri'),
(130, 5, 'Namentenga'),
(131, 5, 'Nayala'),
(132, 5, 'Naumbiel'),
(133, 5, 'Oubritenga'),
(134, 5, 'Oudalan'),
(135, 5, 'Passore'),
(136, 5, 'Poni'),
(137, 5, 'Samentenga'),
(138, 5, 'Sanguie'),
(139, 5, 'Seno'),
(140, 5, 'Sissili'),
(141, 5, 'Soum'),
(142, 5, 'Sourou'),
(143, 5, 'Tapoa'),
(144, 5, 'Tuy'),
(145, 5, 'Yagha'),
(146, 5, 'Yatenga'),
(147, 5, 'Ziro'),
(148, 5, 'Zondomo'),
(149, 5, 'Zoundweogo'),
(150, 6, ''),
(151, 6, 'Bujumbura'),
(152, 6, ''),
(153, 6, 'Bubanza'),
(154, 6, 'Bujumbura'),
(155, 6, 'Bururi'),
(156, 6, 'Cankuzo'),
(157, 6, 'Cibitoke'),
(158, 6, 'Gitega'),
(159, 6, 'Karuzi'),
(160, 6, 'Kayanza'),
(161, 6, 'Kirundo'),
(162, 6, 'Makamba'),
(163, 6, 'Muramvya'),
(164, 6, 'Muyinga'),
(165, 6, 'Mwaro'),
(166, 6, 'Ngozi'),
(167, 6, 'Rutana'),
(168, 6, 'Ruyigi'),
(169, 7, ''),
(170, 7, 'Yaounde'),
(171, 7, ''),
(172, 7, 'Adamaoua'),
(173, 7, 'Centre'),
(174, 7, 'Est'),
(175, 7, 'Extreme-Nord'),
(176, 7, 'Littoral'),
(177, 7, 'Nord'),
(178, 7, 'Nord-Ouest'),
(179, 7, 'Ouest'),
(180, 7, 'Sud'),
(181, 7, 'Sud-Ouest'),
(182, 8, ''),
(183, 8, 'Praia'),
(184, 8, ''),
(185, 8, 'Boa Vista'),
(186, 8, 'Brava'),
(187, 8, 'Calheta'),
(188, 8, 'Maio'),
(189, 8, 'Mosteiros'),
(190, 8, 'Paul'),
(191, 8, 'Porto Novo'),
(192, 8, 'Ribeira Grande'),
(193, 8, 'Sal'),
(194, 8, 'Santa Catarina'),
(195, 8, 'Santa Cruz'),
(196, 8, 'Sao Domingos'),
(197, 8, 'Sao Nicolau'),
(198, 8, 'Sao Filipe'),
(199, 8, 'Sao Vicente'),
(200, 8, 'Tarrafal'),
(201, 9, ''),
(202, 9, 'Bangui'),
(203, 9, ''),
(204, 9, 'Bamingui-Bangoran'),
(205, 9, 'Basse-Kotto'),
(206, 9, 'Gribingui'),
(207, 9, 'Haute-Kotto'),
(208, 9, 'Haute-Sangha'),
(209, 9, 'Haut-Mbomou'),
(210, 9, 'Kemo-Gribingui'),
(211, 9, 'Lobaye'),
(212, 9, 'Mbomou'),
(213, 9, 'Nana-Mambere'),
(214, 9, 'Ombella-Mpoko'),
(215, 9, 'Ouaka'),
(216, 9, 'Ouham'),
(217, 9, 'Ouham-Pende'),
(218, 9, 'Sangha'),
(219, 9, 'Vakaga'),
(220, 10, ''),
(221, 10, ''),
(222, 10, 'Assongha'),
(223, 10, 'Baguirmi'),
(224, 10, 'Bahr El Gazal'),
(225, 10, 'Bahr Koh'),
(226, 10, 'Batha Oriental'),
(227, 10, 'Batha Occidental'),
(228, 10, 'Biltine'),
(229, 10, 'Borkou'),
(230, 10, 'Dababa'),
(231, 10, 'Ennedi'),
(232, 10, 'Guera'),
(233, 10, 'Hadjer Lamis'),
(234, 10, 'Kabia'),
(235, 10, 'Kanem'),
(236, 10, 'Lac'),
(237, 10, 'Lac Iro'),
(238, 10, 'Logone Occidental'),
(239, 10, 'Logone Oriental'),
(240, 10, 'Mandoul'),
(241, 10, 'Mayo-Boneye'),
(242, 10, 'Mayo-Dallah'),
(243, 10, 'Monts de Lam'),
(244, 10, 'Ouaddai'),
(245, 10, 'Salamat'),
(246, 10, 'Sila'),
(247, 10, 'Tandjile Oriental'),
(248, 10, 'Tandjile Occidental'),
(249, 10, 'Tibesti'),
(250, 12, ''),
(251, 12, 'Kinshasa'),
(252, 12, ''),
(253, 12, 'Bandundu'),
(254, 12, 'Bas-Congo'),
(255, 12, 'Equateur'),
(256, 12, 'Kasai-Occidental'),
(257, 12, 'Kasai-Oriental'),
(258, 12, 'Katanga'),
(259, 12, 'Maniema'),
(260, 12, 'Nord-Kivu'),
(261, 12, 'Orientale'),
(262, 12, 'Sud-Kivu'),
(263, 13, ''),
(264, 13, 'Brazzaville'),
(265, 13, ''),
(266, 13, 'Bouenza'),
(267, 13, 'Cuvette'),
(268, 13, 'Kouilou'),
(269, 13, 'Lekoumou'),
(270, 13, 'Likouala'),
(271, 13, 'Niari'),
(272, 13, 'Plateaux'),
(273, 13, 'Pool'),
(274, 13, 'Sangha'),
(275, 14, ''),
(276, 14, 'Djibouti'),
(277, 14, ''),
(278, 14, 'Dikhil'),
(279, 14, 'Obock'),
(280, 14, 'Tadjoura'),
(281, 15, ''),
(282, 15, 'Cairo'),
(283, 15, ''),
(284, 15, 'Ad Daqahliyah'),
(285, 15, 'Al Bahr al Ahmar'),
(286, 15, 'Al Buhayrah'),
(287, 15, 'Al Fayyum'),
(288, 15, 'Al Gharbiyah'),
(289, 15, 'Al Iskandariyah'),
(290, 15, 'Al Jizah'),
(291, 15, 'Al Minufiyah'),
(292, 15, 'Al Minya'),
(293, 15, 'Al Qahirah'),
(294, 15, 'Al Qalyubiyah'),
(295, 15, 'Al Wadi al Jadid'),
(296, 15, 'Ash Sharqiyah'),
(297, 15, 'As Suways'),
(298, 15, 'Aswan'),
(299, 15, 'Asyut'),
(300, 15, 'Bani Suwayf'),
(301, 15, 'Dumyat'),
(302, 15, 'Kafr ash Shaykh'),
(303, 15, 'Matruh'),
(304, 15, 'Qina'),
(305, 15, 'Suhaj'),
(306, 16, ''),
(307, 16, 'Malabo'),
(308, 16, ''),
(309, 16, 'Annobon'),
(310, 16, 'Bioko Norte'),
(311, 16, 'Bioko Sur'),
(312, 16, 'Centro Sur'),
(313, 16, 'Kie-Ntem'),
(314, 16, 'Litoral'),
(315, 16, 'Wele-Nzas'),
(316, 17, ''),
(317, 17, 'Asmara'),
(318, 17, ''),
(319, 17, 'Central'),
(320, 17, 'Anelba'),
(321, 17, 'Southern Red Sea'),
(322, 17, 'Northern Red Sea'),
(323, 17, 'Southern'),
(324, 17, 'Gash-Barka'),
(325, 18, ''),
(326, 18, 'Addis Ababa'),
(327, 18, ''),
(328, 18, 'Adis Abeba (Addis Ababa)'),
(329, 18, 'Afar'),
(330, 18, 'Amara'),
(331, 18, 'Binshangul Gumuz'),
(332, 18, 'Dire Dawa'),
(333, 18, 'Gambela Hizboch'),
(334, 18, 'Hareri Hizb'),
(335, 18, 'Oromiya'),
(336, 18, 'Sumale (Somali)'),
(337, 18, 'Tigray'),
(338, 18, 'YeDebub Biheroch Bihereseboch...'),
(339, 19, ''),
(340, 19, 'Libreville'),
(341, 20, ''),
(342, 20, 'Estuaire'),
(343, 20, 'Haut-Ogooue'),
(344, 20, 'Moyen-Ogooue'),
(345, 20, 'Ngounie'),
(346, 20, 'Nyanga'),
(347, 20, 'Ogooue-Ivindo'),
(348, 20, 'Ogooue-Lolo'),
(349, 20, 'Ogooue-Maritime'),
(350, 20, 'Woleu-Ntem'),
(351, 21, ''),
(352, 21, 'Accra'),
(353, 21, ''),
(354, 21, 'Ashanti'),
(355, 21, 'Brong-Ahafo'),
(356, 21, 'Central'),
(357, 21, 'Eastern'),
(358, 21, 'Northern'),
(359, 21, 'Upper East'),
(360, 21, 'Upper West'),
(361, 21, 'Volta'),
(362, 21, 'Western'),
(363, 22, ''),
(364, 22, 'Conakry'),
(365, 22, ''),
(366, 22, 'Beyla'),
(367, 22, 'Boffa'),
(368, 22, 'Boke'),
(369, 22, 'Coyah'),
(370, 22, 'Dabola'),
(371, 22, 'Dalaba'),
(372, 22, 'Dinguiraye'),
(373, 22, 'Dubreka'),
(374, 22, 'Faranah'),
(375, 22, 'Forecariah'),
(376, 22, 'Fria'),
(377, 22, 'Gaoual'),
(378, 22, 'Gueckedou'),
(379, 22, 'Kankan'),
(380, 22, 'Kerouane'),
(381, 22, 'Kindia'),
(382, 22, 'Kissidougou'),
(383, 22, 'Koubia'),
(384, 22, 'Koundara'),
(385, 22, 'Kouroussa'),
(386, 22, 'Labe'),
(387, 22, 'Lelouma'),
(388, 22, 'Lola'),
(389, 22, 'Macenta'),
(390, 22, 'Mali'),
(391, 22, 'Mamou'),
(392, 22, 'Mandiana'),
(393, 22, 'Nzerekore'),
(394, 22, 'Pita'),
(395, 22, 'Siguiri'),
(396, 22, 'Telimele'),
(397, 22, 'Tougue'),
(398, 22, 'Yomou'),
(399, 23, ''),
(400, 23, 'Bissau'),
(401, 23, ''),
(402, 23, 'Bafata'),
(403, 23, 'Biombo'),
(404, 23, 'Bolama/Bijagos'),
(405, 23, 'Cacheu'),
(406, 23, 'Gabu'),
(407, 23, 'Oio'),
(408, 23, 'Quinara'),
(409, 23, 'Tombali'),
(410, 24, ''),
(411, 24, 'Nairobi'),
(412, 24, ''),
(413, 24, 'Central'),
(414, 24, 'Coast'),
(415, 24, 'Eastern'),
(416, 24, 'Nairobi Area'),
(417, 24, 'North Eastern'),
(418, 24, 'Nyanza'),
(419, 24, 'Rift Valley'),
(420, 24, 'Western'),
(421, 25, ''),
(422, 25, 'Maseru'),
(423, 25, ''),
(424, 25, 'Berea'),
(425, 25, 'Butha-Buthe'),
(426, 25, 'Leribe'),
(427, 25, 'Mafeteng'),
(428, 25, 'Mohales Hoek'),
(429, 25, 'Mokhotlong'),
(430, 25, 'Quthing'),
(431, 25, 'Thaba-Tseka'),
(432, 26, ''),
(433, 26, 'Monrovia'),
(434, 26, ''),
(435, 26, 'Bomi'),
(436, 26, 'Bong'),
(437, 26, 'Gparbolu'),
(438, 26, 'Grand Bassa'),
(439, 26, 'Grand Cape Mount'),
(440, 26, 'Grand Gedeh'),
(441, 26, 'Grand Kru'),
(442, 26, 'Lofa'),
(443, 26, 'Margibi'),
(444, 26, 'Maryland'),
(445, 26, 'Montserrado'),
(446, 26, 'Nimba'),
(447, 26, 'River Cess'),
(448, 26, 'River Gee'),
(449, 26, 'Sinoe'),
(450, 27, ''),
(451, 27, 'Tripoli'),
(452, 27, ''),
(453, 27, 'Ajdabiya'),
(454, 27, 'Al Fatih'),
(455, 27, 'Al Jabal al Akhdar'),
(456, 27, 'Al Jufrah'),
(457, 27, 'Al Khums'),
(458, 27, 'Al Kufrah'),
(459, 27, 'An Nuqat al Khams'),
(460, 27, 'Awbari'),
(461, 27, 'Az Zawiyah'),
(462, 27, 'Banghazi'),
(463, 27, 'Darnah'),
(464, 27, 'Ghadamis'),
(465, 27, 'Gharyan'),
(466, 27, 'Misratah'),
(467, 27, 'Murzuq'),
(468, 27, 'Sabha'),
(469, 27, 'Sawfajjin'),
(470, 27, 'Surt'),
(471, 27, 'Tarabulus'),
(472, 27, 'Tarhunah'),
(473, 27, 'Tubruq'),
(474, 27, 'Yafran'),
(475, 27, 'Zlitan'),
(476, 28, ''),
(477, 28, 'Antananarivo'),
(478, 28, ''),
(479, 28, 'Antsiranana'),
(480, 28, 'Fianarantsoa'),
(481, 28, 'Mahajanga'),
(482, 28, 'Toamasina'),
(483, 28, 'Toliara'),
(484, 29, ''),
(485, 29, 'Lilongwe'),
(486, 29, ''),
(487, 29, 'Balaka'),
(488, 29, 'Blantyre'),
(489, 29, 'Chikwawa'),
(490, 29, 'Chiradzulu'),
(491, 29, 'Chitipa'),
(492, 29, 'Dedza'),
(493, 29, 'Dowa'),
(494, 29, 'Karonga'),
(495, 29, 'Kasungu'),
(496, 29, 'Likoma'),
(497, 29, 'Machinga (Kasupe)'),
(498, 29, 'Mangochi'),
(499, 29, 'Mchinji'),
(500, 29, 'Mulanje'),
(501, 29, 'Mwanza'),
(502, 29, 'Mzimba'),
(503, 29, 'Ntcheu'),
(504, 29, 'Nkhata Bay'),
(505, 29, 'Nkhotakota'),
(506, 29, 'Nsanje'),
(507, 29, 'Ntchisi'),
(508, 29, 'Phalombe'),
(509, 29, 'Rumphi'),
(510, 29, 'Salima'),
(511, 29, 'Thyolo'),
(512, 29, 'Zomba'),
(513, 30, ''),
(514, 30, 'Bamako'),
(515, 30, ''),
(516, 30, 'Gao'),
(517, 30, 'Kayes'),
(518, 30, 'Kidal'),
(519, 30, 'Koulikoro'),
(520, 30, 'Mopti'),
(521, 30, 'Segou'),
(522, 30, 'Sikasso'),
(523, 30, 'Tombouctou'),
(524, 31, ''),
(525, 31, 'Nouakchott'),
(526, 31, ''),
(527, 31, 'Adrar'),
(528, 31, 'Assaba'),
(529, 31, 'Brakna'),
(530, 31, 'Dakhlet Nouadhibou'),
(531, 31, 'Gorgol'),
(532, 31, 'Guidimaka'),
(533, 31, 'Hodh Ech Chargui'),
(534, 31, 'Hodh El Gharbi'),
(535, 31, 'Inchiri'),
(536, 31, 'Tagant'),
(537, 31, 'Tiris Zemmour'),
(538, 31, 'Trarza'),
(539, 32, ''),
(540, 32, 'Port Louis'),
(541, 32, ''),
(542, 32, 'Agalega Islands'),
(543, 32, 'Black River'),
(544, 32, 'Cargados Carajos Shoals'),
(545, 32, 'Flacq'),
(546, 32, 'Grand Port'),
(547, 32, 'Moka'),
(548, 32, 'Pamplemousses'),
(549, 32, 'Plaines Wilhems'),
(550, 32, 'Riviere du Rempart'),
(551, 32, 'Rodrigues'),
(552, 32, 'Savanne'),
(553, 33, ''),
(554, 33, 'Rabat'),
(555, 33, ''),
(556, 33, 'Ad Dakhla (Oued Eddahab)'),
(557, 33, 'Agadir'),
(558, 33, 'Al Hoceima'),
(559, 33, 'Azilal'),
(560, 33, 'Beni Mellal'),
(561, 33, 'Ben Slimane'),
(562, 33, 'Boujdour'),
(563, 33, 'Boulemane'),
(564, 33, 'Casablanca'),
(565, 33, 'Chaouen'),
(566, 33, 'El Jadida'),
(567, 33, 'El Kelaa des Sraghna'),
(568, 33, 'Er Rachidia'),
(569, 33, 'Essaouira'),
(570, 33, 'Es Smara'),
(571, 33, 'Fes'),
(572, 33, 'Figuig'),
(573, 33, 'Guelmim'),
(574, 33, 'Ifrane'),
(575, 33, 'Kenitra'),
(576, 33, 'Khemisset'),
(577, 33, 'Khenifra'),
(578, 33, 'Khouribga'),
(579, 33, 'Laayoune'),
(580, 33, 'Larache'),
(581, 33, 'Marrakech'),
(582, 33, 'Meknes'),
(583, 33, 'Nador'),
(584, 33, 'Ouarzazate'),
(585, 33, 'Oujda'),
(586, 33, 'Safi'),
(587, 33, 'Settat'),
(588, 33, 'Sidi Kacem'),
(589, 33, 'Tanger'),
(590, 33, 'Tan-Tan'),
(591, 33, 'Taounate'),
(592, 33, 'Taroudannt'),
(593, 33, 'Tata'),
(594, 33, 'Taza'),
(595, 33, 'Tetouan'),
(596, 33, 'Tiznit'),
(597, 34, ''),
(598, 34, 'Maputo'),
(599, 34, ''),
(600, 34, 'Cabo Delgado'),
(601, 34, 'Gaza'),
(602, 34, 'Inhambane'),
(603, 34, 'Manica'),
(604, 34, 'Maputo'),
(605, 34, 'Nampula'),
(606, 34, 'Niassa'),
(607, 34, 'Sofala'),
(608, 34, 'Tete'),
(609, 34, 'Zambezia'),
(610, 35, ''),
(611, 35, 'Windhoek'),
(612, 35, ''),
(613, 35, 'Caprivi'),
(614, 35, 'Erongo'),
(615, 35, 'Hardap'),
(616, 35, 'Karas'),
(617, 35, 'Khomas'),
(618, 35, 'Kunene'),
(619, 35, 'Ohangwena'),
(620, 35, 'Okavango'),
(621, 35, 'Omaheke'),
(622, 35, 'Omusati'),
(623, 35, 'Oshana'),
(624, 35, 'Oshikoto'),
(625, 35, 'Otjozondjupa'),
(626, 36, ''),
(627, 36, 'Niamey'),
(628, 36, ''),
(629, 36, 'Agadez'),
(630, 36, 'Diffa'),
(631, 36, 'Dosso'),
(632, 36, 'Maradi'),
(633, 36, 'Tahoua'),
(634, 36, 'Tillaberi'),
(635, 36, 'Zinder'),
(636, 37, ''),
(637, 37, 'Abuja'),
(638, 37, ''),
(639, 37, 'Abia'),
(640, 37, 'Adamawa'),
(641, 37, 'Akwa Ibom'),
(642, 37, 'Anambra'),
(643, 37, 'Bauchi'),
(644, 37, 'Bayelsa'),
(645, 37, 'Benue'),
(646, 37, 'Borno'),
(647, 37, 'Cross River'),
(648, 37, 'Delta'),
(649, 37, 'Ebonyi'),
(650, 37, 'Edo'),
(651, 37, 'Ekiti'),
(652, 37, 'Enugu'),
(653, 37, 'Gombe'),
(654, 37, 'Imo'),
(655, 37, 'Jigawa'),
(656, 37, 'Kaduna'),
(657, 37, 'Kano'),
(658, 37, 'Katsina'),
(659, 37, 'Kebbi'),
(660, 37, 'Kogi'),
(661, 37, 'Kwara'),
(662, 37, 'Lagos'),
(663, 37, 'Nassarawa'),
(664, 37, 'Niger'),
(665, 37, 'Ogun'),
(666, 37, 'Ondo'),
(667, 37, 'Osun'),
(668, 37, 'Oyo'),
(669, 37, 'Plateau'),
(670, 37, 'Rivers'),
(671, 37, 'Sokoto'),
(672, 37, 'Taraba'),
(673, 37, 'Yobe'),
(674, 37, 'Zamfara'),
(675, 38, ''),
(676, 38, 'Kigali'),
(677, 38, ''),
(678, 38, 'Butare'),
(679, 38, 'Byumba'),
(680, 38, 'Cyangugu'),
(681, 38, 'Gikongoro'),
(682, 38, 'Gisenyi'),
(683, 38, 'Gitarama'),
(684, 38, 'Kibungo'),
(685, 38, 'Kibuye'),
(686, 38, 'Ruhengeri'),
(687, 38, 'Umutara'),
(688, 39, ''),
(689, 39, 'Sao Tome'),
(690, 39, ''),
(691, 39, 'Principe'),
(692, 40, ''),
(693, 40, 'Dakar'),
(694, 40, ''),
(695, 40, 'Diourbel'),
(696, 40, 'Fatick'),
(697, 40, 'Kaolack'),
(698, 40, 'Kolda'),
(699, 40, 'Louga'),
(700, 40, 'Matam'),
(701, 40, 'Saint-Louis'),
(702, 40, 'Tambacounda'),
(703, 40, 'Thies'),
(704, 40, 'Ziguinchor'),
(705, 41, ''),
(706, 41, 'Victoria'),
(707, 41, ''),
(708, 41, 'Anse aux Pins'),
(709, 41, 'Anse Boileau'),
(710, 41, 'Anse Etoile'),
(711, 41, 'Anse Louis'),
(712, 41, 'Anse Royale'),
(713, 41, 'Baie Lazare'),
(714, 41, 'Baie Sainte Anne'),
(715, 41, 'Beau Vallon'),
(716, 41, 'Bel Air'),
(717, 41, 'Bel Ombre'),
(718, 41, 'Cascade'),
(719, 41, 'Glacis'),
(720, 41, 'La Digue'),
(721, 41, 'La Riviere Anglaise'),
(722, 41, 'Mont Buxton'),
(723, 41, 'Mont Fleuri'),
(724, 41, 'Plaisance'),
(725, 41, 'Pointe La Rue'),
(726, 41, 'Port Glaud'),
(727, 41, 'Saint Louis'),
(728, 41, 'Takamaka'),
(729, 42, ''),
(730, 42, 'Freetown'),
(731, 42, ''),
(732, 42, 'Eastern'),
(733, 42, 'Northern'),
(734, 42, 'Southern'),
(735, 42, 'Western'),
(736, 43, ''),
(737, 43, 'Mogadishu'),
(738, 43, ''),
(739, 43, 'Awdal'),
(740, 43, 'Bakool'),
(741, 43, 'Banaadir'),
(742, 43, 'Bari'),
(743, 43, 'Bay'),
(744, 43, 'Galguduud'),
(745, 43, 'Gedo'),
(746, 43, 'Hiiraan'),
(747, 43, 'Jubbada Dhexe'),
(748, 43, 'Jubbada Hoose'),
(749, 43, 'Mudug'),
(750, 43, 'Nugaal'),
(751, 43, 'Sanaag'),
(752, 43, 'Shabeellaha Dhexe'),
(753, 43, 'Shabeellaha Hoose'),
(754, 43, 'Sool'),
(755, 43, 'Togdheer'),
(756, 43, 'Woqooyi Galbeed'),
(757, 44, ''),
(758, 44, 'Pretoria'),
(759, 44, ''),
(760, 44, 'Eastern Cape'),
(761, 44, 'Free State'),
(762, 44, 'Gauteng'),
(763, 44, 'KwaZulu-Natal'),
(764, 44, 'Mpumalanga'),
(765, 44, 'North-West'),
(766, 44, 'Northern Cape'),
(767, 44, 'Northern Province/Limpopo'),
(768, 44, 'Western Cape'),
(769, 45, ''),
(770, 45, 'Khartoum'),
(771, 45, ''),
(772, 45, 'Al Bahr al Ahmar'),
(773, 45, 'Al Buhayrat'),
(774, 45, 'Al Jazirah'),
(775, 45, 'Al Khartum'),
(776, 45, 'Al Qadarif'),
(777, 45, 'Al Wahdah'),
(778, 45, 'An Nil al Abyad'),
(779, 45, 'An Nil al Azraq'),
(780, 45, 'Ash Shamaliyah'),
(781, 45, 'Bahr al Jabal'),
(782, 45, 'Gharb Bahr al Ghazal'),
(783, 45, 'Gharb Darfur'),
(784, 45, 'Gharb Kurdufan'),
(785, 45, 'Janub Darfur'),
(786, 45, 'Janub Kurdufan'),
(787, 45, 'Junqali'),
(788, 45, 'Kassala'),
(789, 45, 'Nahr an Nil'),
(790, 45, 'Shamal Bahr al Ghazal'),
(791, 45, 'Shamal Darfur'),
(792, 45, 'Shamal Kurdufan'),
(793, 45, 'Sinnar'),
(794, 45, 'Warab'),
(795, 46, ''),
(796, 46, 'Lobamba/Mbabane'),
(797, 46, ''),
(798, 46, 'Hhohho'),
(799, 46, 'Lubombo'),
(800, 46, 'Manzini'),
(801, 46, 'Shiselweni'),
(802, 47, ''),
(803, 47, 'Dodoma'),
(804, 47, ''),
(805, 47, 'Arusha'),
(806, 47, 'Dar es Salaam'),
(807, 47, 'Iringa'),
(808, 47, 'Kagera'),
(809, 47, 'Kigoma'),
(810, 47, 'Kilimanjaro'),
(811, 47, 'Lindi'),
(812, 47, 'Mara'),
(813, 47, 'Mbeya'),
(814, 47, 'Morogoro'),
(815, 47, 'Mtwara'),
(816, 47, 'Mwanza'),
(817, 47, 'Pemba North'),
(818, 47, 'Pemba South'),
(819, 47, 'Pwani'),
(820, 47, 'Rukwa'),
(821, 47, 'Ruvuma'),
(822, 47, 'Shinyanga'),
(823, 47, 'Singida'),
(824, 47, 'Tabora'),
(825, 47, 'Tanga'),
(826, 47, 'Zanzibar Central/South'),
(827, 47, 'Zanzibar North'),
(828, 47, 'Zanzibar Urban/West'),
(829, 48, ''),
(830, 48, 'Lome'),
(831, 48, ''),
(832, 48, 'De La Kara'),
(833, 48, 'Des Plateaux'),
(834, 48, 'Des Savanes'),
(835, 48, 'Centrale'),
(836, 48, 'Maritime'),
(837, 49, ''),
(838, 49, 'Tunis'),
(839, 49, ''),
(840, 49, 'Ariana'),
(841, 49, 'Beja'),
(842, 49, 'Ben Arous'),
(843, 49, 'Bizerte'),
(844, 49, 'El Kef'),
(845, 49, 'Gabes'),
(846, 49, 'Gafsa'),
(847, 49, 'Jendouba'),
(848, 49, 'Kairouan'),
(849, 49, 'Kasserine'),
(850, 49, 'Kebili'),
(851, 49, 'Mahdia'),
(852, 49, 'Medenine'),
(853, 49, 'Monastir'),
(854, 49, 'Nabeul'),
(855, 49, 'Sfax'),
(856, 49, 'Sidi Bou Zid'),
(857, 49, 'Siliana'),
(858, 49, 'Sousse'),
(859, 49, 'Tataouine'),
(860, 49, 'Tozeur'),
(861, 49, 'Zaghouan'),
(862, 50, ''),
(863, 50, 'Kampala'),
(864, 50, ''),
(865, 50, 'Adjumani'),
(866, 50, 'Apac'),
(867, 50, 'Arua'),
(868, 50, 'Bugiri'),
(869, 50, 'Bundibugyo'),
(870, 50, 'Bushenyi'),
(871, 50, 'Busia'),
(872, 50, 'Gulu'),
(873, 50, 'Hoima'),
(874, 50, 'Iganga'),
(875, 50, 'Jinja'),
(876, 50, 'Kabale'),
(877, 50, 'Kabarole'),
(878, 50, 'Kaberamaido'),
(879, 50, 'Kalangala'),
(880, 50, 'Kamuli'),
(881, 50, 'Kamwenge'),
(882, 50, 'Kanungu'),
(883, 50, 'Kapchorwa'),
(884, 50, 'Kasese'),
(885, 50, 'Katakwi'),
(886, 50, 'Kayunga'),
(887, 50, 'Kibale'),
(888, 50, 'Kiboga'),
(889, 50, 'Kisoro'),
(890, 50, 'Kitgum'),
(891, 50, 'Kotido'),
(892, 50, 'Kumi'),
(893, 50, 'Kyenjojo'),
(894, 50, 'Lira'),
(895, 50, 'Luwero'),
(896, 50, 'Masaka'),
(897, 50, 'Masindi'),
(898, 50, 'Mayngc'),
(899, 50, 'Mbale'),
(900, 50, 'Mbarara'),
(901, 50, 'Moroto'),
(902, 50, 'Moyo'),
(903, 50, 'Mpigi'),
(904, 50, 'Mubende'),
(905, 50, 'Mukono'),
(906, 50, 'Nakapiripiti'),
(907, 50, 'Nakasongola'),
(908, 50, 'Nebbi'),
(909, 50, 'Ntungamo'),
(910, 50, 'Pader'),
(911, 50, 'Pallisa'),
(912, 50, 'Rakai'),
(913, 50, 'Rukungiri'),
(914, 50, 'Sembabule'),
(915, 50, 'Sironko'),
(916, 50, 'Soroti'),
(917, 50, 'Tororo'),
(918, 50, 'Wakiso'),
(919, 50, 'Yumbe'),
(920, 51, ''),
(921, 51, 'Lusaka'),
(922, 51, ''),
(923, 51, 'Central'),
(924, 51, 'Copperbelt'),
(925, 51, 'Eastern'),
(926, 51, 'Luapula'),
(927, 51, 'Lusaka'),
(928, 51, 'Northern'),
(929, 51, 'North-Western'),
(930, 51, 'Southern'),
(931, 51, 'Western'),
(932, 52, ''),
(933, 52, 'Harare'),
(934, 52, ''),
(935, 52, 'Bulawayo'),
(936, 52, 'Manicaland'),
(937, 52, 'Mashonaland Central'),
(938, 52, 'Mashonaland East'),
(939, 52, 'Mashonaland West'),
(940, 52, 'Masvingo'),
(941, 52, 'Matabeleland North'),
(942, 52, 'Matabeleland South'),
(943, 52, 'Midlands'),
(944, 54, ''),
(945, 54, 'Dhaka'),
(946, 54, ''),
(947, 54, 'Barisal'),
(948, 54, 'Chittagong'),
(949, 54, 'Khulna'),
(950, 54, 'Rajshahi'),
(951, 54, 'Sylhet'),
(952, 55, ''),
(953, 55, 'Thimphu'),
(954, 55, ''),
(955, 55, 'Bumthang'),
(956, 55, 'Chhukha'),
(957, 55, 'Chirang'),
(958, 55, 'Dagana'),
(959, 55, 'Gasa'),
(960, 55, 'Geylegphug'),
(961, 55, 'Ha'),
(962, 55, 'Lhuntshi'),
(963, 55, 'Mongar'),
(964, 55, 'Paro'),
(965, 55, 'Pemagatsel'),
(966, 55, 'Punakha'),
(967, 55, 'Samchi'),
(968, 55, 'Samdrup Jongkhar'),
(969, 55, 'Shemgang'),
(970, 55, 'Tashigang'),
(971, 55, 'Tongsa'),
(972, 55, 'Wangdi Phodrang'),
(973, 55, 'Yangtse'),
(974, 56, ''),
(975, 56, 'Bandar Seri Begawan'),
(976, 56, ''),
(977, 56, 'Belait'),
(978, 56, 'Brunei/Muara'),
(979, 56, 'Temburong'),
(980, 56, 'Tutong'),
(981, 57, ''),
(982, 57, 'Rangoon'),
(983, 57, ''),
(984, 57, 'Ayeyarwady'),
(985, 57, 'Bago'),
(986, 57, 'Chin'),
(987, 57, 'Kachin'),
(988, 57, 'Kayin'),
(989, 57, 'Kayah'),
(990, 57, 'Magway'),
(991, 57, 'Mandalay'),
(992, 57, 'Mon'),
(993, 57, 'Rakhine'),
(994, 57, 'Sagaing'),
(995, 57, 'Shan'),
(996, 57, 'Tanintharyi'),
(997, 57, 'Yangon'),
(998, 58, ''),
(999, 58, 'Phnom Penh'),
(1000, 58, ''),
(1001, 58, 'Banteay Mean Cheay'),
(1002, 58, 'Batdambang'),
(1003, 58, 'Kampong Cham'),
(1004, 58, 'Kampong Chhnang'),
(1005, 58, 'Kampong Spoe'),
(1006, 58, 'Kampong Thum'),
(1007, 58, 'Kampot'),
(1008, 58, 'Kandal'),
(1009, 58, 'Kaoh Kong'),
(1010, 58, 'Keb'),
(1011, 58, 'Kracheh'),
(1012, 58, 'Mondol Kiri'),
(1013, 58, 'Otdar Mean Cheay'),
(1014, 58, 'Pailin'),
(1015, 58, 'Pouthisat'),
(1016, 58, 'Preah Seihanu (Sihanoukville)'),
(1017, 58, 'Preah Vihear'),
(1018, 58, 'Prey Veng'),
(1019, 58, 'Rotanah Kiri'),
(1020, 58, 'Siem Reab'),
(1021, 58, 'Stoeng Treng'),
(1022, 58, 'Svay Rieng'),
(1023, 58, 'Takev'),
(1024, 59, ''),
(1025, 59, 'Beijing'),
(1026, 59, ''),
(1027, 59, 'Anhui'),
(1028, 59, 'Chongqing'),
(1029, 59, 'Fujian'),
(1030, 59, 'Gansu'),
(1031, 59, 'Guangdong'),
(1032, 59, 'Guangxi'),
(1033, 59, 'Guizhou'),
(1034, 59, 'Hainan'),
(1035, 59, 'Hebei'),
(1036, 59, 'Heilongjiang'),
(1037, 59, 'Henan'),
(1038, 59, 'Hubei'),
(1039, 59, 'Hunan'),
(1040, 59, 'Jiangsu'),
(1041, 59, 'Jiangxi'),
(1042, 59, 'Jilin'),
(1043, 59, 'Liaoning'),
(1044, 59, 'Nei Mongol'),
(1045, 59, 'Ningxia'),
(1046, 59, 'Qinghai'),
(1047, 59, 'Shaanxi'),
(1048, 59, 'Shandong'),
(1049, 59, 'Shanghai'),
(1050, 59, 'Shanxi'),
(1051, 59, 'Sichuan'),
(1052, 59, 'Tianjin'),
(1053, 59, 'Xinjiang'),
(1054, 59, 'Xizang (Tibet)'),
(1055, 59, 'Yunnan'),
(1056, 59, 'Zhejiang'),
(1057, 60, ''),
(1058, 60, 'Dili'),
(1059, 60, ''),
(1060, 60, 'Aileu'),
(1061, 60, 'Ainaro'),
(1062, 60, 'Baucau'),
(1063, 60, 'Bobonaro (Maliana)'),
(1064, 60, 'Cova-Lima (Suai)'),
(1065, 60, 'Ermera'),
(1066, 60, 'Lautem (Los Palos)'),
(1067, 60, 'Liquica'),
(1068, 60, 'Manatuto'),
(1069, 60, 'Manufahi (Same)'),
(1070, 60, 'Oecussi (Ambeno)'),
(1071, 60, 'Viqueque'),
(1072, 61, ''),
(1073, 61, 'New Delhi'),
(1074, 61, ''),
(1075, 61, 'Andaman/Nicobar Islands'),
(1076, 61, 'Andhra Pradesh'),
(1077, 61, 'Arunachal Pradesh'),
(1078, 61, 'Assam'),
(1079, 61, 'Bihar'),
(1080, 61, 'Chandigarh'),
(1081, 61, 'Chhattisgarh'),
(1082, 61, 'Dadra/Nagar Haveli'),
(1083, 61, 'Daman/Diu'),
(1084, 61, 'Goa'),
(1085, 61, 'Gujarat'),
(1086, 61, 'Haryana'),
(1087, 61, 'Himachal Pradesh'),
(1088, 61, 'Jammu/Kashmir'),
(1089, 61, 'Jharkhand'),
(1090, 61, 'Karnataka'),
(1091, 61, 'Kerala'),
(1092, 61, 'Lakshadweep'),
(1093, 61, 'Madhya Pradesh'),
(1094, 61, 'Maharashtra'),
(1095, 61, 'Manipur'),
(1096, 61, 'Meghalaya'),
(1097, 61, 'Mizoram'),
(1098, 61, 'Nagaland'),
(1099, 61, 'Orissa'),
(1100, 61, 'Pondicherry'),
(1101, 61, 'Punjab'),
(1102, 61, 'Rajasthan'),
(1103, 61, 'Sikkim'),
(1104, 61, 'Tamil Nadu'),
(1105, 61, 'Tripura'),
(1106, 61, 'Uttaranchal'),
(1107, 61, 'Uttar Pradesh'),
(1108, 61, 'West Bengal'),
(1109, 62, ''),
(1110, 62, 'Jakarta'),
(1111, 62, ''),
(1112, 62, 'Aceh'),
(1113, 62, 'Bali'),
(1114, 62, 'Banten'),
(1115, 62, 'Bengkulu'),
(1116, 62, 'Gorontalo'),
(1117, 62, 'Jakarta Raya'),
(1118, 62, 'Jambi'),
(1119, 62, 'Jawa Barat'),
(1120, 62, 'Jawa Tengah'),
(1121, 62, 'Jawa Timur'),
(1122, 62, 'Kalimantan Barat'),
(1123, 62, 'Kalimantan Selatan'),
(1124, 62, 'Kalimantan Tengah'),
(1125, 62, 'Kalimantan Timur'),
(1126, 62, 'Kepulauan Bangka Belitung'),
(1127, 62, 'Lampung'),
(1128, 62, 'Maluku'),
(1129, 62, 'Maluku Utara'),
(1130, 62, 'Nusa Tenggara Barat'),
(1131, 62, 'Nusa Tenggara Timur'),
(1132, 62, 'Papua'),
(1133, 62, 'Riau'),
(1134, 62, 'Sulawesi Selatan'),
(1135, 62, 'Sulawesi Tengah'),
(1136, 62, 'Sulawesi Tenggara'),
(1137, 62, 'Sulawesi Utara'),
(1138, 62, 'Sumatera Barat'),
(1139, 62, 'Sumatera Selatan'),
(1140, 62, 'Sumatera Utara'),
(1141, 62, 'Yogyakarta'),
(1142, 63, ''),
(1143, 63, 'Tokyo'),
(1144, 63, ''),
(1145, 63, 'Aichi'),
(1146, 63, 'Akita'),
(1147, 63, 'Aomori'),
(1148, 63, 'Chiba'),
(1149, 63, 'Ehime'),
(1150, 63, 'Fukui'),
(1151, 63, 'Fukuoka'),
(1152, 63, 'Fukushima'),
(1153, 63, 'Gifu'),
(1154, 63, 'Gumma'),
(1155, 63, 'Hiroshima'),
(1156, 63, 'Hokkaido'),
(1157, 63, 'Hyogo'),
(1158, 63, 'Ibaraki'),
(1159, 63, 'Ishikawa'),
(1160, 63, 'Iwate'),
(1161, 63, 'Kagawa'),
(1162, 63, 'Kagoshima'),
(1163, 63, 'Kanagawa'),
(1164, 63, 'Kochi'),
(1165, 63, 'Kumamoto'),
(1166, 63, 'Kyoto'),
(1167, 63, 'Mie'),
(1168, 63, 'Miyagi'),
(1169, 63, 'Miyazaki'),
(1170, 63, 'Nagano'),
(1171, 63, 'Nagasaki'),
(1172, 63, 'Nara'),
(1173, 63, 'Niigata'),
(1174, 63, 'Oita'),
(1175, 63, 'Okayama'),
(1176, 63, 'Okinawa'),
(1177, 63, 'Osaka'),
(1178, 63, 'Saga'),
(1179, 63, 'Saitama'),
(1180, 63, 'Shiga'),
(1181, 63, 'Shimane'),
(1182, 63, 'Shizuoka'),
(1183, 63, 'Tochigi'),
(1184, 63, 'Tokushima'),
(1185, 63, 'Tokyo'),
(1186, 63, 'Tottori'),
(1187, 63, 'Toyama'),
(1188, 63, 'Wakayama'),
(1189, 63, 'Yamagata'),
(1190, 63, 'Yamaguchi'),
(1191, 63, 'Yamanashi'),
(1192, 64, ''),
(1193, 64, 'Astana'),
(1194, 64, ''),
(1195, 64, 'Almaty'),
(1196, 64, 'Almaty'),
(1197, 64, 'Aqmola'),
(1198, 64, 'Aqtobe'),
(1199, 64, 'Astana'),
(1200, 64, 'Atyrau'),
(1201, 64, 'Batys Qazaqstan'),
(1202, 64, 'Bayqongyr'),
(1203, 64, 'Mangghystau'),
(1204, 64, 'Ongtustik Qazaqstan'),
(1205, 64, 'Pavlodar'),
(1206, 64, 'Qaraghandy'),
(1207, 64, 'Qostanay'),
(1208, 64, 'Qyzylorda'),
(1209, 64, 'Shyghys Qazaqstan'),
(1210, 64, 'Soltustik Qazaqstan'),
(1211, 64, 'Zhambyl'),
(1212, 65, ''),
(1213, 65, ''),
(1214, 65, 'Chagang-do'),
(1215, 65, 'Hamgyong-bukto'),
(1216, 65, 'Hamgyong-namdo'),
(1217, 65, 'Hwanghae-bukto'),
(1218, 65, 'Hwanghae-namdo'),
(1219, 65, 'Kaesong-si'),
(1220, 65, 'Kangwon-do'),
(1221, 65, 'Najin Sonbong-si'),
(1222, 65, 'Yanggang-do'),
(1223, 66, ''),
(1224, 66, 'Seoul'),
(1225, 66, ''),
(1226, 66, 'Cheju-do'),
(1227, 66, 'Cholla-bukto'),
(1228, 66, 'Cholla-namdo'),
(1229, 66, 'Kangwon-do'),
(1230, 66, 'Kwangju-gwangyoksi'),
(1231, 66, 'Kyonggi-do'),
(1232, 66, 'Kyongsang-bukto'),
(1233, 66, 'Kyongsang-namdo'),
(1234, 66, 'Pusan-gwangyoksi'),
(1235, 66, 'Taegu-gwangyoksi'),
(1236, 66, 'Taejon-gwangyoksi'),
(1237, 66, 'Ulsan-gwangyoksi'),
(1238, 67, ''),
(1239, 67, 'Vientiane'),
(1240, 67, ''),
(1241, 67, 'Attapu'),
(1242, 67, 'Bokeo'),
(1243, 67, 'Bolikhamxai'),
(1244, 67, 'Champasak'),
(1245, 67, 'Houaphan'),
(1246, 67, 'Khammouan'),
(1247, 67, 'Louangnamtha'),
(1248, 67, 'Louangphabang'),
(1249, 67, 'Oudomxai'),
(1250, 67, 'Phongsali'),
(1251, 67, 'Salavan'),
(1252, 67, 'Savannakhet'),
(1253, 67, 'Viangchan'),
(1254, 67, 'Viangchan'),
(1255, 67, 'Xaignabouli'),
(1256, 67, 'Xaisomboun'),
(1257, 67, 'Xekong'),
(1258, 67, 'Xiangkhoang'),
(1259, 68, ''),
(1260, 68, 'Kuala Lumpur'),
(1261, 68, ''),
(1262, 68, 'Johor'),
(1263, 68, 'Kedah'),
(1264, 68, 'Kelantan'),
(1265, 68, 'Labuan'),
(1266, 68, 'Melaka'),
(1267, 68, 'Negeri Sembilan'),
(1268, 68, 'Pahang'),
(1269, 68, 'Perak'),
(1270, 68, 'Perlis'),
(1271, 68, 'Pulau Pinang'),
(1272, 68, 'Putrajaya'),
(1273, 68, 'Sabah'),
(1274, 68, 'Sarawak'),
(1275, 68, 'Selangor'),
(1276, 68, 'Terengganu'),
(1277, 68, 'Wilayah Persekutuan'),
(1278, 69, ''),
(1279, 69, 'Maale'),
(1280, 69, ''),
(1281, 69, 'Alifu'),
(1282, 69, 'Baa'),
(1283, 69, 'Dhaalu'),
(1284, 69, 'Faafu'),
(1285, 69, 'Gaafu Alifu'),
(1286, 69, 'Gaafu Dhaalu'),
(1287, 69, 'Gnaviyani'),
(1288, 69, 'Haa Alifu'),
(1289, 69, 'Haa Dhaalu'),
(1290, 69, 'Kaafu'),
(1291, 69, 'Laamu'),
(1292, 69, 'Lhaviyani'),
(1293, 69, 'Meemu'),
(1294, 69, 'Noonu'),
(1295, 69, 'Raa'),
(1296, 69, 'Seenu'),
(1297, 69, 'Shaviyani'),
(1298, 69, 'Thaa'),
(1299, 69, 'Vaavu'),
(1300, 70, ''),
(1301, 70, 'Ulaanbaatar'),
(1302, 70, ''),
(1303, 70, 'Arhangay'),
(1304, 70, 'Bayanhongor'),
(1305, 70, 'Bayan-Olgiy'),
(1306, 70, 'Bulgan'),
(1307, 70, 'Darhan Uul'),
(1308, 70, 'Dornod'),
(1309, 70, 'Dornogovi'),
(1310, 70, 'Dundgovi'),
(1311, 70, 'Dzavhan'),
(1312, 70, 'Govi-Altay'),
(1313, 70, 'Govi-Sumber'),
(1314, 70, 'Hentiy'),
(1315, 70, 'Hovd'),
(1316, 70, 'Hovsgol'),
(1317, 70, 'Omnogovi'),
(1318, 70, 'Orhon'),
(1319, 70, 'Ovorhangay'),
(1320, 70, 'Selenge'),
(1321, 70, 'Suhbaatar'),
(1322, 70, 'Tov'),
(1323, 70, 'Uvs'),
(1324, 71, ''),
(1325, 71, 'Kathmandu'),
(1326, 71, ''),
(1327, 71, 'Bagmati'),
(1328, 71, 'Bheri'),
(1329, 71, 'Dhawalagiri'),
(1330, 71, 'Gandaki'),
(1331, 71, 'Janakpur'),
(1332, 71, 'Karnali'),
(1333, 71, 'Kosi'),
(1334, 71, 'Lumbini'),
(1335, 71, 'Mahakali'),
(1336, 71, 'Mechi'),
(1337, 71, 'Narayani'),
(1338, 71, 'Rapti'),
(1339, 71, 'Sagarmatha'),
(1340, 71, 'Seti'),
(1341, 72, ''),
(1342, 72, 'Manila'),
(1343, 72, ''),
(1344, 72, 'Oriental'),
(1345, 72, 'North Cotabato'),
(1346, 72, 'Northern Samar'),
(1347, 72, 'Nueva Ecija'),
(1348, 72, 'Nueva Vizcaya'),
(1349, 72, 'Olongapo'),
(1350, 72, 'Ormoc'),
(1351, 72, 'Oroquieta'),
(1352, 72, 'Ozamis'),
(1353, 72, 'Pagadian'),
(1354, 72, 'Palawan'),
(1355, 72, 'Palayan'),
(1356, 72, 'Pampanga'),
(1357, 72, 'Pangasinan'),
(1358, 72, 'Pasay'),
(1359, 72, 'Puerto Princesa'),
(1360, 72, 'Quezon'),
(1361, 72, 'Quezon City'),
(1362, 72, 'Quirino'),
(1363, 72, 'Rizal'),
(1364, 72, 'Romblon'),
(1365, 72, 'Roxas'),
(1366, 72, 'Samar'),
(1367, 72, 'San Carlos (Negros Occidental)'),
(1368, 72, 'San Carlos (Pangasinan)'),
(1369, 72, 'San Jose'),
(1370, 72, 'San Pablo'),
(1371, 72, 'Silay'),
(1372, 72, 'Siquijor'),
(1373, 72, 'Sorsogon'),
(1374, 72, 'South Cotabato'),
(1375, 72, 'Southern Leyte'),
(1376, 72, 'Sultan Kudarat'),
(1377, 72, 'Sulu'),
(1378, 72, 'Surigao'),
(1379, 72, 'Surigao del Norte'),
(1380, 72, 'Surigao del Sur'),
(1381, 72, 'Tacloban'),
(1382, 72, 'Tagaytay'),
(1383, 72, 'Tagbilaran'),
(1384, 72, 'Tangub'),
(1385, 72, 'Tarlac'),
(1386, 72, 'Tawi-Tawi'),
(1387, 72, 'Toledo'),
(1388, 72, 'Trece Martires'),
(1389, 72, 'Zambales'),
(1390, 72, 'Zamboanga'),
(1391, 72, 'Zamboanga del Norte'),
(1392, 72, 'Zamboanga del Sur'),
(1393, 73, ''),
(1394, 73, 'Moskva (Moscow)'),
(1395, 73, ''),
(1396, 73, 'Adygeya (Maykop)'),
(1397, 73, 'Aginskiy Buryatskiy (Aginskoye)'),
(1398, 73, 'Altay (Gorno-Altaysk)'),
(1399, 73, 'Altayskiy (Barnaul)'),
(1400, 73, 'Amurskaya (Blagoveshchensk)'),
(1401, 73, 'Astrakhanskaya'),
(1402, 73, 'Bashkortostan (Ufa)'),
(1403, 73, 'Belgorodskaya'),
(1404, 73, 'Bryanskaya'),
(1405, 73, 'Buryatiya (Ulan-Ude)'),
(1406, 73, 'Chechnya (Groznyy)'),
(1407, 73, 'Chelyabinskaya'),
(1408, 73, 'Chitinskaya'),
(1409, 73, 'Chuvashiya (Cheboksary)'),
(1410, 73, 'Dagestan (Makhachkala)'),
(1411, 73, 'Evenkiyskiy (Tura)'),
(1412, 73, 'Irkutskaya'),
(1413, 73, 'Ivanovskaya'),
(1414, 73, 'Kaliningradskaya'),
(1415, 73, 'Kalmykiya (Elista)'),
(1416, 73, 'Kaluzhskaya'),
(1417, 73, 'Kamchatskaya (Petropavlovsk-Kamchatskiy)'),
(1418, 73, 'Karachayevo-Cherkesiya (Cherkessk)'),
(1419, 73, 'Kareliya (Petrozavodsk)'),
(1420, 73, 'Kemerovskaya'),
(1421, 73, 'Khabarovskiy'),
(1422, 73, 'Khakasiya (Abakan)'),
(1423, 73, 'Khanty-Mansiyskiy (Khanty-Mansiysk)'),
(1424, 73, 'Kirovskaya'),
(1425, 73, 'Komi (Syktyvkar)'),
(1426, 73, 'Koryakskiy (Palana)'),
(1427, 73, 'Kostromskaya'),
(1428, 73, 'Krasnodarskiy'),
(1429, 73, 'Krasnoyarskiy'),
(1430, 73, 'Kurganskaya'),
(1431, 73, 'Kurskaya'),
(1432, 73, 'Leningradskaya'),
(1433, 73, 'Lipetskaya'),
(1434, 73, 'Magadanskaya'),
(1435, 73, 'Mariy-El (Yoshkar-Ola)'),
(1436, 73, 'Mordoviya (Saransk)'),
(1437, 73, 'Moskovskaya'),
(1438, 73, 'Murmanskaya'),
(1439, 73, 'Nizhegorodskaya'),
(1440, 73, 'Novgorodskaya'),
(1441, 73, 'Novosibirskaya'),
(1442, 73, 'Omskaya'),
(1443, 73, 'Orenburgskaya'),
(1444, 73, 'Orlovskaya (Orel)'),
(1445, 73, 'Penzenskaya'),
(1446, 73, 'Permskaya'),
(1447, 73, 'Komi-Permyatskiy (Kudymkar)'),
(1448, 73, 'Primorskiy (Vladivostok)'),
(1449, 73, 'Pskovskaya'),
(1450, 73, 'Rostovskaya'),
(1451, 73, 'Ryazanskaya'),
(1452, 73, 'Sakha (Yakutiya)'),
(1453, 73, 'Sakhalinskaya (Yuzhno-Sakhalinsk)'),
(1454, 73, 'Samarskaya'),
(1455, 73, 'Sankt-Peterburg (Saint Petersburg)'),
(1456, 73, 'Saratovskaya'),
(1457, 73, 'Severnaya Osetiya-Alaniya [North Ossetia] (Vladikavkaz)'),
(1458, 73, 'Smolenskaya'),
(1459, 73, 'Sverdlovskaya (Yekaterinburg)'),
(1460, 73, 'Tambovskaya'),
(1461, 73, 'Taymyrskiy (Dudinka)'),
(1462, 73, 'Tomskaya'),
(1463, 73, 'Tverskaya'),
(1464, 73, 'Tyumenskaya'),
(1465, 73, 'Tyva (Kyzyl)'),
(1466, 73, 'Udmurtiya (Izhevsk)'),
(1467, 73, 'Vladimirskaya'),
(1468, 73, 'Volgogradskaya'),
(1469, 73, 'Vologodskaya'),
(1470, 73, 'Voronezhskaya'),
(1471, 73, 'Yamalo-Nenetskiy (Salekhard)'),
(1472, 73, 'Yaroslavskaya'),
(1473, 73, 'Yevreyskaya'),
(1474, 74, ''),
(1475, 75, ''),
(1476, 75, 'Colombo'),
(1477, 75, ''),
(1478, 75, 'Central'),
(1479, 75, 'North Central'),
(1480, 75, 'Northern'),
(1481, 75, 'Eastern'),
(1482, 75, 'North Western'),
(1483, 75, 'Sabaragamuwa'),
(1484, 75, 'Southern'),
(1485, 75, 'Uva'),
(1486, 75, 'Western'),
(1487, 76, ''),
(1488, 76, 'Taipei'),
(1489, 76, ''),
(1490, 76, 'Chang-hua'),
(1491, 76, 'Chia-i'),
(1492, 76, 'Chi-lung'),
(1493, 76, 'Hsin-chu'),
(1494, 76, 'Hua-lien'),
(1495, 76, 'I-lan'),
(1496, 76, 'Kao-hsiung'),
(1497, 76, 'Miao-li'),
(1498, 77, ''),
(1499, 77, 'Bangkok'),
(1500, 77, ''),
(1501, 77, 'Amnat Charoen'),
(1502, 77, 'Ang Thong'),
(1503, 77, 'Buriram'),
(1504, 77, 'Chachoengsao'),
(1505, 77, 'Chai Nat'),
(1506, 77, 'Chaiyaphum'),
(1507, 77, 'Chanthaburi'),
(1508, 77, 'Chiang Mai'),
(1509, 77, 'Chiang Rai'),
(1510, 77, 'Chon Buri'),
(1511, 77, 'Chumphon'),
(1512, 77, 'Kalasin'),
(1513, 77, 'Kamphaeng Phet'),
(1514, 77, 'Kanchanaburi'),
(1515, 77, 'Khon Kaen'),
(1516, 77, 'Krabi'),
(1517, 77, 'Lampang'),
(1518, 77, 'Lamphun'),
(1519, 77, 'Loei'),
(1520, 77, 'Lop Buri'),
(1521, 77, 'Mae Hong Son'),
(1522, 77, 'Maha Sarakham'),
(1523, 77, 'Mukdahan'),
(1524, 77, 'Nakhon Nayok'),
(1525, 77, 'Nakhon Pathom'),
(1526, 77, 'Nakhon Phanom'),
(1527, 77, 'Nakhon Ratchasima'),
(1528, 77, 'Nakhon Sawan'),
(1529, 77, 'Nakhon Si Thammarat'),
(1530, 77, 'Nan'),
(1531, 77, 'Narathiwat'),
(1532, 77, 'Nong Bua Lamphu'),
(1533, 77, 'Nong Khai'),
(1534, 77, 'Nonthaburi'),
(1535, 77, 'Pathum Thani'),
(1536, 77, 'Pattani'),
(1537, 77, 'Phangnga'),
(1538, 77, 'Phatthalung'),
(1539, 77, 'Phayao'),
(1540, 77, 'Phetchabun'),
(1541, 77, 'Phetchaburi'),
(1542, 77, 'Phichit'),
(1543, 77, 'Phitsanulok'),
(1544, 77, 'Phra Nakhon Si Ayutthaya'),
(1545, 77, 'Phrae'),
(1546, 77, 'Phuket'),
(1547, 77, 'Prachin Buri'),
(1548, 77, 'Prachuap Khiri Khan'),
(1549, 77, 'Ranong'),
(1550, 77, 'Ratchaburi'),
(1551, 77, 'Rayong'),
(1552, 77, 'Roi Et'),
(1553, 77, 'Sa Kaeo'),
(1554, 77, 'Sakon Nakhon'),
(1555, 77, 'Samut Prakan'),
(1556, 77, 'Samut Sakhon'),
(1557, 77, 'Samut Songkhram'),
(1558, 77, 'Sara Buri'),
(1559, 77, 'Satun'),
(1560, 77, 'Sing'),
(1561, 78, ''),
(1562, 78, 'Hanoi'),
(1563, 78, ''),
(1564, 78, 'An Giang'),
(1565, 78, 'Bac Giang'),
(1566, 78, 'Bac Kan'),
(1567, 78, 'Bac Lieu'),
(1568, 78, 'Bac Ninh'),
(1569, 78, 'Ba Ria-Vung Tau'),
(1570, 78, 'Ben Tre'),
(1571, 78, 'Binh Dinh'),
(1572, 78, 'Binh Duong'),
(1573, 78, 'Binh Phuoc'),
(1574, 78, 'Binh Thuan'),
(1575, 78, 'Ca Mau'),
(1576, 78, 'Can Tho'),
(1577, 78, 'Cao Bang'),
(1578, 78, 'Dac Lak'),
(1579, 78, 'Da Nang'),
(1580, 78, 'Dong Nai'),
(1581, 78, 'Dong Thap'),
(1582, 78, 'Gia Lai'),
(1583, 78, 'Ha Giang'),
(1584, 78, 'Hai Duong'),
(1585, 78, 'Hai Phong'),
(1586, 78, 'Ha Nam'),
(1587, 78, 'Ha Noi'),
(1588, 78, 'Ha Tay'),
(1589, 78, 'Ha Tinh'),
(1590, 78, 'Hoa Binh'),
(1591, 78, 'Ho Chi Minh'),
(1592, 78, 'Hung Yen'),
(1593, 78, 'Khanh Hoa'),
(1594, 78, 'Kien Giang'),
(1595, 78, 'Kon Tum'),
(1596, 78, 'Lai Chau'),
(1597, 78, 'Lam Dong'),
(1598, 78, 'Lang Son'),
(1599, 78, 'Lao Cai'),
(1600, 78, 'Long An'),
(1601, 78, 'Nam Dinh'),
(1602, 78, 'Nghe An'),
(1603, 78, 'Ninh Binh'),
(1604, 78, 'Ninh Thuan'),
(1605, 78, 'Phu Tho'),
(1606, 78, 'Phu Yen'),
(1607, 78, 'Quang Binh'),
(1608, 78, 'Quang Nam'),
(1609, 78, 'Quang Ngai'),
(1610, 78, 'Quang Ninh'),
(1611, 78, 'Quang Tri'),
(1612, 78, 'Soc Trang'),
(1613, 78, 'Son La'),
(1614, 78, 'Tay Ninh'),
(1615, 78, 'Thai Binh'),
(1616, 78, 'Thai Nguyen'),
(1617, 78, 'Thanh Hoa'),
(1618, 78, 'Thua Thien-Hue'),
(1619, 78, 'Tien Giang'),
(1620, 78, 'Tra Vinh'),
(1621, 78, 'Tuyen Quang'),
(1622, 78, 'Vinh Long'),
(1623, 78, 'Vinh Phuc'),
(1624, 78, 'Yen Bai'),
(1625, 79, ''),
(1626, 79, 'Canberra'),
(1627, 79, ''),
(1628, 79, 'Australian Capital Territory'),
(1629, 79, 'New South Wales'),
(1630, 79, 'Northern Territory'),
(1631, 79, 'Queensland'),
(1632, 79, 'South Australia'),
(1633, 79, 'Tasmania'),
(1634, 79, 'Victoria'),
(1635, 79, 'Western Australia'),
(1636, 80, ''),
(1637, 80, 'Suva'),
(1638, 80, ''),
(1639, 80, 'Central'),
(1640, 80, 'Eastern'),
(1641, 80, 'Northern'),
(1642, 80, 'Rotuma'),
(1643, 80, 'Western'),
(1644, 81, ''),
(1645, 81, 'Tarawa'),
(1646, 81, ''),
(1647, 81, 'Abaiang'),
(1648, 81, 'Abemama'),
(1649, 81, 'Aranuka'),
(1650, 81, 'Arorae'),
(1651, 81, 'Banaba'),
(1652, 81, 'Beru'),
(1653, 81, 'Butaritari'),
(1654, 81, 'Gilberts (Central)'),
(1655, 81, 'Gilberts (Northern)'),
(1656, 81, 'Gilberts (Southern)'),
(1657, 81, 'Kanton'),
(1658, 81, 'Kiritimati'),
(1659, 81, 'Kuria'),
(1660, 81, 'Line Islands'),
(1661, 81, 'Maiana'),
(1662, 81, 'Makin'),
(1663, 81, 'Marakei'),
(1664, 81, 'Nikunau'),
(1665, 81, 'Nonouti'),
(1666, 81, 'Onotoa'),
(1667, 81, 'Phoenix Islands'),
(1668, 81, 'Tabiteuea'),
(1669, 81, 'Tabuaeran'),
(1670, 81, 'Tamana'),
(1671, 81, 'Teraina'),
(1672, 82, ''),
(1673, 82, 'Palikir'),
(1674, 82, ''),
(1675, 82, 'Chuuk (Truk)'),
(1676, 82, 'Kosrae'),
(1677, 82, 'Pohnpei'),
(1678, 82, 'Yap'),
(1679, 83, ''),
(1680, 83, 'Yaren'),
(1681, 83, ''),
(1682, 83, 'Aiwo'),
(1683, 83, 'Anabar'),
(1684, 83, 'Anetan'),
(1685, 83, 'Anibare'),
(1686, 83, 'Baiti'),
(1687, 83, 'Boe'),
(1688, 83, 'Buada'),
(1689, 83, 'Denigomodu'),
(1690, 83, 'Ewa'),
(1691, 83, 'Ijuw'),
(1692, 83, 'Meneng'),
(1693, 83, 'Nibok'),
(1694, 83, 'Uaboe'),
(1695, 84, ''),
(1696, 84, 'Wellington'),
(1697, 84, ''),
(1698, 84, 'Akaroa'),
(1699, 84, 'Amuri'),
(1700, 84, 'Ashburton'),
(1701, 84, 'Auckland'),
(1702, 84, 'Banks Peninsula'),
(1703, 84, 'Bay of Islands'),
(1704, 84, 'Bay of Plenty'),
(1705, 84, 'Bruce'),
(1706, 84, 'Buller'),
(1707, 84, 'Canterbury'),
(1708, 84, 'Carterton'),
(1709, 84, 'Chatham Islands'),
(1710, 84, 'Cheviot'),
(1711, 84, 'Christchurch'),
(1712, 84, 'Clifton'),
(1713, 84, 'Clutha'),
(1714, 84, 'Cook'),
(1715, 84, 'Dannevirke'),
(1716, 84, 'Dunedin'),
(1717, 84, 'Egmont'),
(1718, 84, 'Eketahuna'),
(1719, 84, 'Ellesmere'),
(1720, 84, 'Eltham'),
(1721, 84, 'Eyre'),
(1722, 84, 'Far North'),
(1723, 84, 'Featherston'),
(1724, 84, 'Franklin'),
(1725, 84, 'Gisborne'),
(1726, 84, 'Golden Bay'),
(1727, 84, 'Gore'),
(1728, 84, 'Great Barrier Island'),
(1729, 84, 'Grey'),
(1730, 84, 'Hamilton'),
(1731, 84, 'Hastings'),
(1732, 84, 'Hauraki Plains'),
(1733, 84, 'Hawera'),
(1734, 84, 'Heathcote'),
(1735, 84, 'Hikurangi'),
(1736, 84, 'Hobson'),
(1737, 84, 'Hokianga'),
(1738, 84, 'Horowhenua'),
(1739, 84, 'Hurunui'),
(1740, 84, 'Hutt'),
(1741, 84, 'Inangahua'),
(1742, 84, 'Inglewood'),
(1743, 84, 'Invercargill'),
(1744, 84, 'Kaikoura'),
(1745, 84, 'Kaipara'),
(1746, 84, 'Kairanga'),
(1747, 84, 'Kapiti Coast'),
(1748, 84, 'Kawerau'),
(1749, 84, 'Kiwitea'),
(1750, 84, 'Lake'),
(1751, 84, 'Mackenzie'),
(1752, 84, 'Malvern'),
(1753, 84, 'Manaia'),
(1754, 84, 'Manawatu'),
(1755, 84, 'Mangonui'),
(1756, 84, 'Maniototo'),
(1757, 84, 'Manukau'),
(1758, 84, 'Marlborough'),
(1759, 84, 'Masterton'),
(1760, 84, 'Matamata'),
(1761, 84, 'Matamata Piako'),
(1762, 84, 'Mount Herbert'),
(1763, 84, 'Napier'),
(1764, 84, 'Nelson'),
(1765, 84, 'Nelson'),
(1766, 84, 'New Plymouth'),
(1767, 84, 'Northland'),
(1768, 84, 'North Shore'),
(1769, 84, 'Ohinemuri'),
(1770, 84, 'Opotiki'),
(1771, 84, 'Oroua'),
(1772, 84, 'Otago'),
(1773, 84, 'Otamatea'),
(1774, 84, 'Otorohanga'),
(1775, 84, 'Oxford'),
(1776, 84, 'Palmerston North'),
(1777, 84, 'Pahiatua'),
(1778, 84, 'Papakura'),
(1779, 84, 'Paparua'),
(1780, 84, 'Patea'),
(1781, 84, 'Piako'),
(1782, 84, 'Pohangina'),
(1783, 84, 'Porirua'),
(1784, 84, 'Queenstown Lakes'),
(1785, 84, 'Raglan'),
(1786, 84, 'Rangiora'),
(1787, 84, 'Rangitikei'),
(1788, 84, 'Rodney'),
(1789, 84, 'Rotorua'),
(1790, 84, 'Ruapehu'),
(1791, 84, 'Runanga'),
(1792, 84, 'Saint Kilda'),
(1793, 84, 'Selwyn'),
(1794, 84, 'Silverpeaks'),
(1795, 84, 'Southland'),
(1796, 84, 'South Taranaki'),
(1797, 84, 'South Waikato'),
(1798, 84, 'South Wairarapa'),
(1799, 84, 'Stewart Island'),
(1800, 84, 'Stratford'),
(1801, 84, 'Strathallan'),
(1802, 84, 'Taranaki'),
(1803, 84, 'Tararua'),
(1804, 84, 'Tasman'),
(1805, 84, 'Taumarunui'),
(1806, 84, 'Taupo'),
(1807, 84, 'Tauranga'),
(1808, 84, 'Thames Coromandel'),
(1809, 84, 'Timaru'),
(1810, 84, 'Tuapeka'),
(1811, 84, 'Upper Hutt'),
(1812, 84, 'Vincent'),
(1813, 84, 'Waiapu'),
(1814, 84, 'Waiheke'),
(1815, 84, 'Waihemo'),
(1816, 84, 'Waikato'),
(1817, 84, 'Waikohu'),
(1818, 84, 'Waimairi'),
(1819, 84, 'Waimarino'),
(1820, 84, 'Waimate'),
(1821, 84, 'Waimate West'),
(1822, 84, 'Waimea'),
(1823, 84, 'Waipa'),
(1824, 84, 'Waipawa'),
(1825, 84, 'Waipukurau'),
(1826, 84, 'Wairarapa South'),
(1827, 84, 'Wairewa'),
(1828, 84, 'Wairoa'),
(1829, 84, 'Waitakere'),
(1830, 84, 'Waitaki'),
(1831, 84, 'Waitomo'),
(1832, 84, 'Waitotara'),
(1833, 84, 'Wallace'),
(1834, 84, 'Wanganui'),
(1835, 84, 'Wanganui-Manawatu'),
(1836, 84, 'Waverley'),
(1837, 84, 'West Coast'),
(1838, 84, 'Western Bay of Plenty'),
(1839, 84, 'Westland'),
(1840, 84, 'Whakatane'),
(1841, 84, 'Whangarei'),
(1842, 84, 'Whangaroa'),
(1843, 84, 'Woodville'),
(1844, 85, ''),
(1845, 85, 'Koror'),
(1846, 85, ''),
(1847, 85, 'Aimeliik'),
(1848, 85, 'Airai'),
(1849, 85, 'Angaur'),
(1850, 85, 'Hatobohei'),
(1851, 85, 'Kayangel'),
(1852, 85, 'Melekeok'),
(1853, 85, 'Ngaraard'),
(1854, 85, 'Ngarchelong'),
(1855, 85, 'Ngardmau'),
(1856, 85, 'Ngatpang'),
(1857, 85, 'Ngchesar'),
(1858, 85, 'Ngeremlengui'),
(1859, 85, 'Ngiwal'),
(1860, 85, 'Peleliu'),
(1861, 85, 'Sonsoral'),
(1862, 86, ''),
(1863, 86, 'Port Moresby'),
(1864, 86, ''),
(1865, 86, 'Bougainville'),
(1866, 86, 'Central'),
(1867, 86, 'Chimbu'),
(1868, 86, 'Eastern Highlands'),
(1869, 86, 'East New Britain'),
(1870, 86, 'East Sepik'),
(1871, 86, 'Enga'),
(1872, 86, 'Gulf'),
(1873, 86, 'Madang'),
(1874, 86, 'Manus'),
(1875, 86, 'Milne Bay'),
(1876, 86, 'Morobe'),
(1877, 86, 'National Capital'),
(1878, 86, 'New Ireland'),
(1879, 86, 'Northern'),
(1880, 86, 'Sandaun'),
(1881, 86, 'Southern Highlands'),
(1882, 86, 'Western'),
(1883, 86, 'Western Highlands'),
(1884, 86, 'West New Britain'),
(1885, 87, ''),
(1886, 87, 'Apia'),
(1887, 87, ''),
(1888, 87, 'Aiga-i-le-Tai'),
(1889, 87, 'Atua'),
(1890, 87, 'Gagaifomauga'),
(1891, 87, 'Palauli'),
(1892, 87, 'Tuamasaga'),
(1893, 87, 'Vaisigano'),
(1894, 88, ''),
(1895, 88, ''),
(1896, 88, 'Tongatapu'),
(1897, 89, ''),
(1898, 89, 'Fongafale'),
(1899, 90, ''),
(1900, 90, 'Port-Vila'),
(1901, 90, ''),
(1902, 90, 'Malampa'),
(1903, 90, 'Penama'),
(1904, 90, 'Sanma'),
(1905, 90, 'Shefa'),
(1906, 90, 'Tafea'),
(1907, 90, 'Torba'),
(1908, 91, ''),
(1909, 91, 'The Valley'),
(1910, 92, ''),
(1911, 92, 'Saint John'),
(1912, 92, ''),
(1913, 92, 'Barbuda'),
(1914, 92, 'Redonda'),
(1915, 92, 'Saint George'),
(1916, 92, 'Saint Mary'),
(1917, 92, 'Saint Paul'),
(1918, 92, 'Saint Peter'),
(1919, 92, 'Saint Philip'),
(1920, 93, ''),
(1921, 93, 'Oranjestad'),
(1922, 94, ''),
(1923, 94, 'Nassau'),
(1924, 94, ''),
(1925, 94, 'Acklins/Crooked Islands'),
(1926, 94, 'Bimini'),
(1927, 94, 'Cat Island'),
(1928, 94, 'Exuma'),
(1929, 94, 'Freeport'),
(1930, 94, 'Fresh Creek'),
(1931, 94, 'Green Turtle Cay'),
(1932, 94, 'Harbour Island'),
(1933, 94, 'High Rock'),
(1934, 94, 'Inagua'),
(1935, 94, 'Kemps Bay'),
(1936, 94, 'Long Island'),
(1937, 94, 'Marsh Harbour'),
(1938, 94, 'Mayaguana'),
(1939, 94, 'New Providence'),
(1940, 94, 'Nichollstown/Berry Islands'),
(1941, 94, 'Ragged Island'),
(1942, 94, 'Rock Sound'),
(1943, 94, 'Sandy Point'),
(1944, 94, 'San Salvador/Rum Cay'),
(1945, 95, ''),
(1946, 95, 'Bridgetown'),
(1947, 95, ''),
(1948, 95, 'Christ Church'),
(1949, 95, 'Saint Andrew'),
(1950, 95, 'Saint George'),
(1951, 95, 'Saint James'),
(1952, 95, 'Saint John'),
(1953, 95, 'Saint Joseph'),
(1954, 95, 'Saint Lucy'),
(1955, 95, 'Saint Michael'),
(1956, 95, 'Saint Peter'),
(1957, 95, 'Saint Philip'),
(1958, 95, 'Saint Thomas'),
(1959, 97, ''),
(1960, 97, 'Havana'),
(1961, 97, ''),
(1962, 97, 'Camaguey'),
(1963, 97, 'Ciego de Avila'),
(1964, 97, 'Cienfuegos'),
(1965, 97, 'Ciudad de La Habana'),
(1966, 97, 'Granma'),
(1967, 97, 'Guantanamo'),
(1968, 97, 'Holguin'),
(1969, 97, 'Isla de la Juventud'),
(1970, 97, 'La Habana'),
(1971, 97, 'Las Tunas'),
(1972, 97, 'Matanzas'),
(1973, 97, 'Pinar del Rio'),
(1974, 97, 'Sancti Spiritus'),
(1975, 97, 'Santiago de Cuba'),
(1976, 97, 'Villa Clara'),
(1977, 98, ''),
(1978, 98, 'Roseau'),
(1979, 98, ''),
(1980, 98, 'Saint Andrew'),
(1981, 98, 'Saint David'),
(1982, 98, 'Saint George'),
(1983, 98, 'Saint John'),
(1984, 98, 'Saint Joseph'),
(1985, 98, 'Saint Luke'),
(1986, 98, 'Saint Mark'),
(1987, 98, 'Saint Patrick'),
(1988, 98, 'Saint Paul'),
(1989, 98, 'Saint Peter'),
(1990, 99, ''),
(1991, 99, 'Santo Domingo'),
(1992, 99, ''),
(1993, 99, 'Azua'),
(1994, 99, 'Baoruco'),
(1995, 99, 'Barahona'),
(1996, 99, 'Dajabon'),
(1997, 99, 'Distrito Nacional'),
(1998, 99, 'Duarte'),
(1999, 99, 'Elias Pina'),
(2000, 99, 'El Seibo'),
(2001, 99, 'Espaillat'),
(2002, 99, 'Hato Mayor'),
(2003, 99, 'Independencia'),
(2004, 99, 'La Altagracia'),
(2005, 99, 'La Romana'),
(2006, 99, 'La Vega'),
(2007, 99, 'Maria Trinidad Sanchez'),
(2008, 99, 'Monsenor Nouel'),
(2009, 99, 'Monte Cristi'),
(2010, 99, 'Monte Plata'),
(2011, 99, 'Pedernales'),
(2012, 99, 'Peravia'),
(2013, 99, 'Puerto Plata'),
(2014, 99, 'Salcedo'),
(2015, 99, 'Samana'),
(2016, 99, 'Sanchez Ramirez'),
(2017, 99, 'San Cristobal'),
(2018, 99, 'San Juan'),
(2019, 99, 'San Pedro de Macoris'),
(2020, 99, 'Santiago'),
(2021, 99, 'Santiago Rodriguez'),
(2022, 99, 'Valverde'),
(2023, 100, ''),
(2024, 100, ''),
(2025, 100, 'Carriacou/Petit Martinique'),
(2026, 100, 'Saint Andrew'),
(2027, 100, 'Saint David'),
(2028, 100, 'Saint John'),
(2029, 100, 'Saint Mark'),
(2030, 100, 'Saint Patrick'),
(2031, 101, ''),
(2032, 101, 'Basse-Terre'),
(2033, 102, ''),
(2034, 102, 'Port-au-Prince'),
(2035, 102, ''),
(2036, 102, 'Artibonite'),
(2037, 102, 'Centre'),
(2038, 102, 'Nord'),
(2039, 102, 'Nord-Est'),
(2040, 102, 'Nord-Ouest'),
(2041, 102, 'Ouest'),
(2042, 102, 'Sud'),
(2043, 102, 'Sud-Est'),
(2044, 103, ''),
(2045, 103, 'Kingston'),
(2046, 103, ''),
(2047, 103, 'Clarendon'),
(2048, 103, 'Hanover'),
(2049, 103, 'Manchester'),
(2050, 103, 'Portland'),
(2051, 103, 'Saint Andrew'),
(2052, 103, 'Saint Ann'),
(2053, 103, 'Saint Catherine'),
(2054, 103, 'Saint Elizabeth'),
(2055, 103, 'Saint James'),
(2056, 103, 'Saint Mary'),
(2057, 103, 'Saint Thomas'),
(2058, 103, 'Trelawny'),
(2059, 103, 'Westmoreland'),
(2060, 104, ''),
(2061, 104, 'Fort-de-France'),
(2062, 105, ''),
(2063, 105, 'Brades Estate'),
(2064, 105, 'Plymouth'),
(2065, 105, ''),
(2066, 105, 'Saint Anthony'),
(2067, 105, 'Saint Georges'),
(2068, 105, 'Saint Peter'),
(2069, 106, ''),
(2070, 106, 'Willemstad'),
(2071, 107, ''),
(2072, 107, 'San Juan'),
(2073, 107, ''),
(2074, 107, 'Adjuntas'),
(2075, 107, 'Aguada'),
(2076, 107, 'Aguadilla'),
(2077, 107, 'Aguas Buenas'),
(2078, 107, 'Aibonito'),
(2079, 107, 'Anasco'),
(2080, 107, 'Arecibo'),
(2081, 107, 'Arroyo'),
(2082, 107, 'Barceloneta'),
(2083, 107, 'Barranquitas'),
(2084, 107, 'Bayamon'),
(2085, 107, 'Cabo Rojo'),
(2086, 107, 'Caguas'),
(2087, 107, 'Camuy'),
(2088, 107, 'Canovanas'),
(2089, 107, 'Carolina'),
(2090, 107, 'Catano'),
(2091, 107, 'Cayey'),
(2092, 107, 'Ceiba'),
(2093, 107, 'Ciales'),
(2094, 107, 'Cidra'),
(2095, 107, 'Coamo'),
(2096, 107, 'Comerio'),
(2097, 107, 'Corozal'),
(2098, 107, 'Culebra'),
(2099, 107, 'Dorado'),
(2100, 107, 'Fajardo'),
(2101, 107, 'Florida'),
(2102, 107, 'Guanica'),
(2103, 107, 'Guayama'),
(2104, 107, 'Guayanilla'),
(2105, 107, 'Guaynabo'),
(2106, 107, 'Gurabo'),
(2107, 107, 'Hatillo'),
(2108, 107, 'Hormigueros'),
(2109, 107, 'Humacao'),
(2110, 107, 'Isabela'),
(2111, 107, 'Jayuya'),
(2112, 107, 'Juana Diaz'),
(2113, 107, 'Juncos'),
(2114, 107, 'Lajas'),
(2115, 107, 'Lares'),
(2116, 107, 'Las Marias'),
(2117, 107, 'Las Piedras'),
(2118, 107, 'Loiza'),
(2119, 107, 'Luquillo'),
(2120, 107, 'Manati'),
(2121, 107, 'Maricao'),
(2122, 107, 'Maunabo'),
(2123, 107, 'Mayaguez'),
(2124, 107, 'Moca'),
(2125, 107, 'Morovis'),
(2126, 107, 'Naguabo'),
(2127, 107, 'Naranjito'),
(2128, 107, 'Orocovis'),
(2129, 107, 'Patillas'),
(2130, 107, 'Penuelas'),
(2131, 107, 'Ponce'),
(2132, 107, 'Quebradillas'),
(2133, 107, 'Rincon'),
(2134, 107, 'Rio Grande'),
(2135, 107, 'Sabana Grande'),
(2136, 107, 'Salinas'),
(2137, 107, 'San German'),
(2138, 107, 'San Lorenzo'),
(2139, 107, 'San Sebastian'),
(2140, 107, 'Santa Isabel'),
(2141, 107, 'Toa Alta'),
(2142, 107, 'Toa Baja'),
(2143, 107, 'Trujillo Alto'),
(2144, 107, 'Utuado'),
(2145, 107, 'Vega Alta'),
(2146, 107, 'Vega Baja'),
(2147, 107, 'Vieques'),
(2148, 107, 'Villalba'),
(2149, 107, 'Yabucoa'),
(2150, 107, 'Yauco'),
(2151, 108, ''),
(2152, 109, ''),
(2153, 109, 'Basseterre'),
(2154, 109, ''),
(2155, 109, 'Christ Church Nichola Town'),
(2156, 109, 'St. Anne Sandy Point'),
(2157, 109, 'St. George Basseterre'),
(2158, 109, 'St. George Gingerland'),
(2159, 109, 'St. James Windward'),
(2160, 109, 'St. John Capesterre'),
(2161, 109, 'St. John Figtree'),
(2162, 109, 'St. Mary Cayon'),
(2163, 109, 'St. Paul Capesterre'),
(2164, 109, 'St. Paul Charlestown'),
(2165, 109, 'St. Peter Basseterre'),
(2166, 109, 'St. Thomas Lowland'),
(2167, 109, 'St. Thomas Middle Island'),
(2168, 109, 'Trinity Palmetto Point'),
(2169, 110, ''),
(2170, 110, 'Castries'),
(2171, 110, ''),
(2172, 110, 'Anse-la-Raye'),
(2173, 110, 'Castries'),
(2174, 110, 'Choiseul'),
(2175, 110, 'Dauphin'),
(2176, 110, 'Dennery'),
(2177, 110, 'Gros-Islet'),
(2178, 110, 'Laborie'),
(2179, 110, 'Micoud'),
(2180, 110, 'Praslin'),
(2181, 110, 'Soufriere'),
(2182, 110, 'Vieux-Fort'),
(2183, 111, ''),
(2184, 112, ''),
(2185, 112, 'Kingstown'),
(2186, 112, ''),
(2187, 112, 'Charlotte'),
(2188, 112, 'Grenadines'),
(2189, 112, 'Saint Andrew'),
(2190, 112, 'Saint David'),
(2191, 112, 'Saint George'),
(2192, 112, 'Saint Patrick'),
(2193, 113, ''),
(2194, 114, ''),
(2195, 114, 'Port-of-Spain'),
(2196, 114, ''),
(2197, 114, 'Arima'),
(2198, 114, 'Caroni'),
(2199, 114, 'Mayaro'),
(2200, 114, 'Nariva'),
(2201, 114, 'Saint Andrew'),
(2202, 114, 'Saint David'),
(2203, 114, 'Saint George'),
(2204, 114, 'Saint Patrick'),
(2205, 114, 'San Fernando'),
(2206, 114, 'Tobago'),
(2207, 114, 'Victoria'),
(2208, 115, ''),
(2209, 115, 'Grand Turk (Cockburn Town)'),
(2210, 116, ''),
(2211, 116, 'Belmopan'),
(2212, 116, ''),
(2213, 116, 'Belize'),
(2214, 116, 'Cayo'),
(2215, 116, 'Corozal'),
(2216, 116, 'Orange Walk'),
(2217, 116, 'Stann Creek'),
(2218, 116, 'Toledo'),
(2219, 117, ''),
(2220, 117, 'San Jose'),
(2221, 117, ''),
(2222, 117, 'Alajuela'),
(2223, 117, 'Cartago'),
(2224, 117, 'Guanacaste'),
(2225, 117, 'Heredia'),
(2226, 117, 'Limon'),
(2227, 117, 'Puntarenas'),
(2228, 118, ''),
(2229, 118, 'San Salvador'),
(2230, 118, ''),
(2231, 118, 'Ahuachapan'),
(2232, 118, 'Cabanas'),
(2233, 118, 'Chalatenango'),
(2234, 118, 'Cuscatlan'),
(2235, 118, 'La Libertad'),
(2236, 118, 'La Paz'),
(2237, 118, 'La Union'),
(2238, 118, 'Morazan'),
(2239, 118, 'San Miguel'),
(2240, 118, 'Santa Ana'),
(2241, 118, 'San Vicente'),
(2242, 118, 'Sonsonate'),
(2243, 118, 'Usulutan'),
(2244, 119, ''),
(2245, 119, 'Guatemala'),
(2246, 119, ''),
(2247, 119, 'Alta Verapaz'),
(2248, 119, 'Baja Verapaz'),
(2249, 119, 'Chimaltenango'),
(2250, 119, 'Chiquimula'),
(2251, 119, 'El Progreso'),
(2252, 119, 'Escuintla'),
(2253, 119, 'Guatemala'),
(2254, 119, 'Huehuetenango'),
(2255, 119, 'Izabal'),
(2256, 119, 'Jalapa'),
(2257, 119, 'Jutiapa'),
(2258, 119, 'Peten'),
(2259, 119, 'Quetzaltenango'),
(2260, 119, 'Quiche'),
(2261, 119, 'Retalhuleu'),
(2262, 119, 'Sacatepequez'),
(2263, 119, 'San Marcos'),
(2264, 119, 'Santa Rosa'),
(2265, 119, 'Solola'),
(2266, 119, 'Suchitepequez'),
(2267, 119, 'Totonicapan'),
(2268, 119, 'Zacapa'),
(2269, 120, ''),
(2270, 120, 'Tegucigalpa'),
(2271, 120, ''),
(2272, 120, 'Atlantida'),
(2273, 120, 'Choluteca'),
(2274, 120, 'Colon'),
(2275, 120, 'Comayagua'),
(2276, 120, 'Copan'),
(2277, 120, 'Cortes'),
(2278, 120, 'El Paraiso'),
(2279, 120, 'Francisco Morazan'),
(2280, 120, 'Gracias a Dios'),
(2281, 120, 'Intibuca'),
(2282, 120, 'Islas de la Bahia'),
(2283, 120, 'La Paz'),
(2284, 120, 'Lempira'),
(2285, 120, 'Ocotepeque'),
(2286, 120, 'Olancho'),
(2287, 120, 'Santa Barbara'),
(2288, 120, 'Valle'),
(2289, 120, 'Yoro'),
(2290, 121, ''),
(2291, 121, 'Managua'),
(2292, 121, ''),
(2293, 121, 'Boaco'),
(2294, 121, 'Carazo'),
(2295, 121, 'Chinandega'),
(2296, 121, 'Chontales'),
(2297, 121, 'Esteli'),
(2298, 121, 'Granada'),
(2299, 121, 'Jinotega'),
(2300, 121, 'Leon'),
(2301, 121, 'Madriz'),
(2302, 121, 'Managua');
INSERT INTO `location_province` (`id`, `country_id`, `name`) VALUES
(2303, 121, 'Masaya'),
(2304, 121, 'Matagalpa'),
(2305, 121, 'Nueva Segovia'),
(2306, 121, 'Rio San Juan'),
(2307, 121, 'Rivas'),
(2308, 121, 'Atlantico Norte'),
(2309, 121, 'Atlantico Sur'),
(2310, 122, ''),
(2311, 122, 'Panama'),
(2312, 122, ''),
(2313, 122, 'Bocas del Toro'),
(2314, 122, 'Chiriqui'),
(2315, 122, 'Cocle'),
(2316, 122, 'Colon'),
(2317, 122, 'Darien'),
(2318, 122, 'Herrera'),
(2319, 122, 'Los Santos'),
(2320, 122, 'San Blas'),
(2321, 122, 'Veraguas'),
(2322, 123, ''),
(2323, 123, 'Tirana'),
(2324, 123, ''),
(2325, 123, 'Berat'),
(2326, 123, 'Bulqize'),
(2327, 123, 'Delvine'),
(2328, 123, 'Devoll'),
(2329, 123, 'Diber'),
(2330, 123, 'Durres'),
(2331, 123, 'Elbasan'),
(2332, 123, 'Fier'),
(2333, 123, 'Gjirokaster'),
(2334, 123, 'Gramsh'),
(2335, 123, 'Has'),
(2336, 123, 'Kavaje'),
(2337, 123, 'Kolonje'),
(2338, 123, 'Korce'),
(2339, 123, 'Kruje'),
(2340, 123, 'Kucove'),
(2341, 123, 'Kukes'),
(2342, 123, 'Kurbin'),
(2343, 123, 'Lezhe'),
(2344, 123, 'Librazhd'),
(2345, 123, 'Lushnje'),
(2346, 123, 'Malesi e Madhe'),
(2347, 123, 'Mallakaster'),
(2348, 123, 'Mat'),
(2349, 123, 'Mirdite'),
(2350, 123, 'Peqin'),
(2351, 123, 'Permet'),
(2352, 123, 'Pogradec'),
(2353, 123, 'Puke'),
(2354, 123, 'Sarande'),
(2355, 123, 'Shkoder'),
(2356, 123, 'Skrapar'),
(2357, 123, 'Tepelene'),
(2358, 123, 'Tirane'),
(2359, 123, 'Tropoje'),
(2360, 123, 'Vlore'),
(2361, 124, ''),
(2362, 124, 'Andorra la Vella'),
(2363, 124, ''),
(2364, 124, 'Canillo'),
(2365, 124, 'Encamp'),
(2366, 124, 'La Massana'),
(2367, 124, 'Escaldes-Engordany'),
(2368, 124, 'Ordino'),
(2369, 124, 'Sant Julia de Loria'),
(2370, 125, ''),
(2371, 125, 'Vienna'),
(2372, 125, ''),
(2373, 125, 'Burgenland'),
(2374, 125, 'Kaernten'),
(2375, 125, 'Niederoesterreich'),
(2376, 125, 'Oberoesterreich'),
(2377, 125, 'Salzburg'),
(2378, 125, 'Steiermark'),
(2379, 125, 'Tirol'),
(2380, 125, 'Vorarlberg'),
(2381, 125, 'Wien'),
(2382, 126, ''),
(2383, 126, 'Minsk'),
(2384, 126, ''),
(2385, 126, 'Brest'),
(2386, 126, 'Horad Minsk'),
(2387, 126, ''),
(2388, 126, 'Hrodna'),
(2389, 126, 'Mahilyow'),
(2390, 126, 'Vitsyebsk'),
(2391, 127, ''),
(2392, 127, 'Brussels'),
(2393, 127, ''),
(2394, 127, 'Antwerpen'),
(2395, 127, 'Brabant Wallon'),
(2396, 127, 'Brussels (Bruxelles)'),
(2397, 127, 'Hainaut'),
(2398, 127, 'Liege'),
(2399, 127, 'Limburg'),
(2400, 127, 'Luxembourg'),
(2401, 127, 'Namur'),
(2402, 127, 'Oost-Vlaanderen'),
(2403, 127, 'Vlaams-Brabant'),
(2404, 127, 'West-Vlaanderen'),
(2405, 129, ''),
(2406, 129, 'Sofiya'),
(2407, 129, ''),
(2408, 129, 'Blagoevgrad'),
(2409, 129, 'Burgas'),
(2410, 129, 'Dobrich'),
(2411, 129, 'Gabrovo'),
(2412, 129, 'Khaskovo'),
(2413, 129, 'Kurdzhali'),
(2414, 129, 'Kyustendil'),
(2415, 129, 'Lovech'),
(2416, 129, 'Montana'),
(2417, 129, 'Pazardzhik'),
(2418, 129, 'Pernik'),
(2419, 129, 'Pleven'),
(2420, 129, 'Plovdiv'),
(2421, 129, 'Razgrad'),
(2422, 129, 'Ruse'),
(2423, 129, 'Shumen'),
(2424, 129, 'Silistra'),
(2425, 129, 'Sliven'),
(2426, 129, 'Smolyan'),
(2427, 129, 'Sofiya-Grad'),
(2428, 129, 'Stara Zagora'),
(2429, 129, 'Turgovishte'),
(2430, 129, 'Varna'),
(2431, 129, 'Veliko Turnovo'),
(2432, 129, 'Vidin'),
(2433, 129, 'Vratsa'),
(2434, 129, 'Yambol'),
(2435, 130, ''),
(2436, 130, 'Zagreb'),
(2437, 130, ''),
(2438, 130, 'Bjelovarsko-Bilogorska'),
(2439, 130, 'Brodsko-Posavska'),
(2440, 130, 'Dubrovacko-Neretvanska'),
(2441, 130, 'Istarska'),
(2442, 130, 'Karlovacka'),
(2443, 130, 'Koprivnicko-Krizevacka'),
(2444, 130, 'Krapinsko-Zagorska'),
(2445, 130, 'Licko-Senjska'),
(2446, 130, 'Medimurska'),
(2447, 130, 'Osjecko-Baranjska'),
(2448, 130, 'Pozesko-Slavonska'),
(2449, 130, 'Primorsko-Goranska'),
(2450, 130, 'Sibensko-Kninska'),
(2451, 130, 'Sisacko-Moslavacka'),
(2452, 130, 'Splitsko-Dalmatinska'),
(2453, 130, 'Varazdinska'),
(2454, 130, 'Viroviticko-Podravska'),
(2455, 130, 'Vukovarsko-Srijemska'),
(2456, 130, 'Zadarska'),
(2457, 130, 'Zagrebacka'),
(2458, 131, ''),
(2459, 131, 'Prague (Praha)'),
(2460, 131, ''),
(2461, 131, 'Jihocesky'),
(2462, 131, 'Jihomoravsky'),
(2463, 131, 'Karlovarsky'),
(2464, 131, 'Kralovehradecky'),
(2465, 131, 'Liberecky'),
(2466, 131, 'Moravskoslezsky'),
(2467, 131, 'Olomoucky'),
(2468, 131, 'Pardubicky'),
(2469, 131, 'Plzensky'),
(2470, 131, 'Stredocesky'),
(2471, 131, 'Ustecky'),
(2472, 131, 'Vysocina'),
(2473, 131, 'Zlinsky'),
(2474, 132, ''),
(2475, 132, 'Copenhagen (Kobenhavn)'),
(2476, 132, ''),
(2477, 132, 'Arhus'),
(2478, 132, 'Bornholm'),
(2479, 132, 'Fredericksberg'),
(2480, 132, 'Frederiksborg'),
(2481, 132, 'Fyn'),
(2482, 132, 'Kobenhavns'),
(2483, 132, 'Nordjylland'),
(2484, 132, 'Ribe'),
(2485, 132, 'Ringkobing'),
(2486, 132, 'Roskilde'),
(2487, 132, 'Sonderjylland'),
(2488, 132, 'Storstrom'),
(2489, 132, 'Vejle'),
(2490, 132, 'Vestsjalland'),
(2491, 132, 'Viborg'),
(2492, 133, ''),
(2493, 133, 'Harjumaa (Tallinn)'),
(2494, 133, ''),
(2495, 133, 'Hiiumaa (Kardla)'),
(2496, 133, 'Ida-Virumaa (Johvi)'),
(2497, 133, 'Jarvamaa (Paide)'),
(2498, 133, 'Jogevamaa (Jogeva)'),
(2499, 133, 'Laanemaa (Haapsalu)'),
(2500, 133, 'Laane-Virumaa (Rakvere)'),
(2501, 133, 'Parnumaa (Parnu)'),
(2502, 133, 'Polvamaa (Polva)'),
(2503, 133, 'Raplamaa (Rapla)'),
(2504, 133, 'Saaremaa (Kuressaare)'),
(2505, 133, 'Tartumaa (Tartu)'),
(2506, 133, 'Valgamaa (Valga)'),
(2507, 133, 'Viljandimaa (Viljandi)'),
(2508, 133, 'Vorumaa (Voru)'),
(2509, 134, ''),
(2510, 134, 'Helsinki'),
(2511, 134, ''),
(2512, 134, 'Aland'),
(2513, 134, 'Etela-Suomen Laani'),
(2514, 134, 'Ita-Suomen Laani'),
(2515, 134, 'Lansi-Suomen Laani'),
(2516, 134, 'Lappi'),
(2517, 134, 'Oulun Laani'),
(2518, 135, ''),
(2519, 135, 'Paris'),
(2520, 135, ''),
(2521, 135, 'Alsace'),
(2522, 135, 'Aquitaine'),
(2523, 135, 'Auvergne'),
(2524, 135, 'Basse-Normandie'),
(2525, 135, 'Bourgogne'),
(2526, 135, 'Bretagne'),
(2527, 135, 'Centre'),
(2528, 135, 'Champagne-Ardenne'),
(2529, 135, 'Corse'),
(2530, 135, 'Franche-Comte'),
(2531, 135, 'Haute-Normandie'),
(2532, 135, 'Ile-de-France'),
(2533, 135, 'Languedoc-Roussillon'),
(2534, 135, 'Limousin'),
(2535, 135, 'Lorraine'),
(2536, 135, 'Midi-Pyrenees'),
(2537, 135, 'Nord-Pas-de-Calais'),
(2538, 135, 'Pays de la Loire'),
(2539, 135, 'Picardie'),
(2540, 135, 'Poitou-Charentes'),
(2541, 135, 'Rhone-Alpes'),
(2542, 136, ''),
(2543, 136, ''),
(2544, 136, 'Gori'),
(2545, 136, 'Guria'),
(2546, 136, 'Imereti'),
(2547, 136, 'Kakheti'),
(2548, 136, 'Kvemo Kartli'),
(2549, 136, 'Mtskheta-Mtianeti'),
(2550, 136, 'Racha-Lechkhumi/Kvemo Svaneti'),
(2551, 136, 'Samegrelo/Zemo Svaneti'),
(2552, 136, 'Samtskhe-Javakheti'),
(2553, 136, 'Shida Kartli'),
(2554, 136, 'Sokhumi'),
(2555, 136, 'Tqibuli'),
(2556, 136, 'Tsqaltubo'),
(2557, 136, 'Zugdidi'),
(2558, 137, ''),
(2559, 137, 'Berlin'),
(2560, 137, ''),
(2561, 137, 'Baden-Wuerttemberg'),
(2562, 137, 'Bayern'),
(2563, 137, 'Berlin'),
(2564, 137, 'Brandenburg'),
(2565, 137, 'Bremen'),
(2566, 137, 'Hamburg'),
(2567, 137, 'Hessen'),
(2568, 137, 'Mecklenburg-Vorpommern'),
(2569, 137, 'Niedersachsen'),
(2570, 137, 'Nordrhein-Westfalen'),
(2571, 137, 'Rheinland-Pfalz'),
(2572, 137, 'Saarland'),
(2573, 137, 'Sachsen'),
(2574, 137, 'Sachsen-Anhalt'),
(2575, 137, 'Schleswig-Holstein'),
(2576, 137, 'Thueringen'),
(2577, 138, ''),
(2578, 138, 'Athens'),
(2579, 138, ''),
(2580, 138, 'Agion Oros (Mt. Athos)'),
(2581, 138, 'Achaia'),
(2582, 138, 'Aitolia kai Akarmania'),
(2583, 138, 'Argolis'),
(2584, 138, 'Arkadia'),
(2585, 138, 'Arta'),
(2586, 138, 'Attiki'),
(2587, 138, 'Chalkidiki'),
(2588, 138, 'Chanion'),
(2589, 138, 'Chios'),
(2590, 138, 'Dodekanisos'),
(2591, 138, 'Drama'),
(2592, 138, 'Evros'),
(2593, 138, 'Evrytania'),
(2594, 138, 'Evvoia'),
(2595, 138, 'Florina'),
(2596, 138, 'Fokidos'),
(2597, 138, 'Fthiotis'),
(2598, 138, 'Grevena'),
(2599, 138, 'Ileia'),
(2600, 138, 'Imathia'),
(2601, 138, 'Ioannina'),
(2602, 138, 'Irakleion'),
(2603, 138, 'Karditsa'),
(2604, 138, 'Kastoria'),
(2605, 138, 'Kavala'),
(2606, 138, 'Kefallinia'),
(2607, 138, 'Kerkyra'),
(2608, 138, 'Kilkis'),
(2609, 138, 'Korinthia'),
(2610, 138, 'Kozani'),
(2611, 138, 'Kyklades'),
(2612, 138, 'Lakonia'),
(2613, 138, 'Larisa'),
(2614, 138, 'Lasithi'),
(2615, 138, 'Lefkas'),
(2616, 138, 'Lesvos'),
(2617, 138, 'Magnisia'),
(2618, 138, 'Messinia'),
(2619, 138, 'Pella'),
(2620, 138, 'Pieria'),
(2621, 138, 'Preveza'),
(2622, 138, 'Rethynnis'),
(2623, 138, 'Rodopi'),
(2624, 138, 'Samos'),
(2625, 138, 'Serrai'),
(2626, 138, 'Thesprotia'),
(2627, 138, 'Thessaloniki'),
(2628, 138, 'Trikala'),
(2629, 138, 'Voiotia'),
(2630, 138, 'Xanthi'),
(2631, 138, 'Zakynthos'),
(2632, 139, ''),
(2633, 139, 'Budapest'),
(2634, 139, ''),
(2635, 139, 'Bacs-Kiskun'),
(2636, 139, 'Baranya'),
(2637, 139, 'Bekes'),
(2638, 139, 'Bekescsaba'),
(2639, 139, 'Borsod-Abauj-Zemplen'),
(2640, 139, 'Csongrad'),
(2641, 139, 'Debrecen'),
(2642, 139, 'Dunaujvaros'),
(2643, 139, 'Eger'),
(2644, 139, 'Fejer'),
(2645, 139, 'Gyor'),
(2646, 139, 'Gyor-Moson-Sopron'),
(2647, 139, 'Hajdu-Bihar'),
(2648, 139, 'Heves'),
(2649, 139, 'Hodmezovasarhely'),
(2650, 139, 'Jasz-Nagykun-Szolnok'),
(2651, 139, 'Kaposvar'),
(2652, 139, 'Kecskemet'),
(2653, 139, 'Komarom-Esztergom'),
(2654, 139, 'Miskolc'),
(2655, 139, 'Nagykanizsa'),
(2656, 139, 'Nograd'),
(2657, 139, 'Nyiregyhaza'),
(2658, 139, 'Pecs'),
(2659, 139, 'Pest'),
(2660, 139, 'Somogy'),
(2661, 139, 'Sopron'),
(2662, 139, 'Szabolcs-Szatmar-Bereg'),
(2663, 139, 'Szeged'),
(2664, 139, 'Szekesfehervar'),
(2665, 139, 'Szolnok'),
(2666, 139, 'Szombathely'),
(2667, 139, 'Tatabanya'),
(2668, 139, 'Tolna'),
(2669, 139, 'Vas'),
(2670, 139, 'Veszprem'),
(2671, 139, 'Veszprem'),
(2672, 139, 'Zala'),
(2673, 139, 'Zalaegerszeg'),
(2674, 140, ''),
(2675, 140, 'Reykjavik'),
(2676, 140, ''),
(2677, 140, 'Akranes'),
(2678, 140, 'Akureyri'),
(2679, 140, 'Arnessysla'),
(2680, 140, 'Austur-Bardhastrandarsysla'),
(2681, 140, 'Austur-Hunavatnssysla'),
(2682, 140, 'Austur-Skaftafellssysla'),
(2683, 140, 'Borgarfjardharsysla'),
(2684, 140, 'Dalasysla'),
(2685, 140, 'Eyjafjardharsysla'),
(2686, 140, 'Gullbringusysla'),
(2687, 140, 'Hafnarfjordhur'),
(2688, 140, 'Husavik'),
(2689, 140, 'Isafjordhur'),
(2690, 140, 'Keflavik'),
(2691, 140, 'Kjosarsysla'),
(2692, 140, 'Kopavogur'),
(2693, 140, 'Myrasysla'),
(2694, 140, 'Neskaupstadhur'),
(2695, 140, 'Nordhur-Isafjardharsysla'),
(2696, 140, 'Nordhur-Mulasys-la'),
(2697, 140, 'Nordhur-Thingeyjarsysla'),
(2698, 140, 'Olafsfjordhur'),
(2699, 140, 'Rangarvallasysla'),
(2700, 140, 'Saudharkrokur'),
(2701, 140, 'Seydhisfjordhur'),
(2702, 140, 'Siglufjordhur'),
(2703, 140, 'Skagafjardharsysla'),
(2704, 140, 'Snaefellsnes-og Hnappadalssysla'),
(2705, 140, 'Strandasysla'),
(2706, 140, 'Sudhur-Mulasysla'),
(2707, 140, 'Sudhur-Thingeyjarsysla'),
(2708, 140, 'Vesttmannaeyjar'),
(2709, 140, 'Vestur-Bardhastrandarsysla'),
(2710, 140, 'Vestur-Hunavatnssysla'),
(2711, 140, 'Vestur-Isafjardharsysla'),
(2712, 140, 'Vestur-Skaftafellssysla'),
(2713, 141, ''),
(2714, 141, 'Dublin'),
(2715, 141, ''),
(2716, 141, 'Carlow'),
(2717, 141, 'Cavan'),
(2718, 141, 'Clare'),
(2719, 141, 'Cork'),
(2720, 141, 'Donegal'),
(2721, 141, 'Galway'),
(2722, 141, 'Kerry'),
(2723, 141, 'Kildare'),
(2724, 141, 'Kilkenny'),
(2725, 141, 'Laois'),
(2726, 141, 'Leitrim'),
(2727, 141, 'Limerick'),
(2728, 141, 'Longford'),
(2729, 141, 'Louth'),
(2730, 141, 'Mayo'),
(2731, 141, 'Meath'),
(2732, 141, 'Monaghan'),
(2733, 141, 'Offaly'),
(2734, 141, 'Roscommon'),
(2735, 141, 'Sligo'),
(2736, 141, 'Tipperary'),
(2737, 141, 'Waterford'),
(2738, 141, 'Westmeath'),
(2739, 141, 'Wexford'),
(2740, 141, 'Wicklow'),
(2741, 142, ''),
(2742, 142, 'Rome'),
(2743, 142, ''),
(2744, 142, 'Abruzzi'),
(2745, 142, 'Basilicata'),
(2746, 142, 'Calabria'),
(2747, 142, 'Campania'),
(2748, 142, 'Emilia-Romagna'),
(2749, 142, 'Friuli-Venezia Giulia'),
(2750, 142, 'Lazio'),
(2751, 142, 'Liguria'),
(2752, 142, 'Lombardia'),
(2753, 142, 'Marche'),
(2754, 142, 'Molise'),
(2755, 142, 'Piemonte'),
(2756, 142, 'Puglia'),
(2757, 142, 'Sardegna'),
(2758, 142, 'Sicilia'),
(2759, 142, 'Toscana'),
(2760, 142, 'Trentino-Alto Adige'),
(2761, 142, 'Umbria'),
(2762, 142, 'Veneto'),
(2763, 143, ''),
(2764, 143, 'Riga'),
(2765, 143, ''),
(2766, 143, 'Aizkraukles'),
(2767, 143, 'Aluksnes'),
(2768, 143, 'Balvu'),
(2769, 143, 'Bauskas'),
(2770, 143, 'Cesu'),
(2771, 143, 'Daugavpils'),
(2772, 143, 'Daugavpils'),
(2773, 143, 'Dobeles'),
(2774, 143, 'Gulbenes'),
(2775, 143, 'Jekabpils'),
(2776, 143, 'Jelgava'),
(2777, 143, 'Jelgavas'),
(2778, 143, 'Jurmala'),
(2779, 143, 'Kraslavas'),
(2780, 143, 'Kuldigas'),
(2781, 143, 'Liepaja'),
(2782, 143, 'Liepajas'),
(2783, 143, 'Limbazu'),
(2784, 143, 'Ludzas'),
(2785, 143, 'Madonas'),
(2786, 143, 'Ogres'),
(2787, 143, 'Preilu'),
(2788, 143, 'Rezekne'),
(2789, 143, 'Rezeknes'),
(2790, 143, 'Riga'),
(2791, 143, 'Rigas'),
(2792, 143, 'Saldus'),
(2793, 143, 'Talsu'),
(2794, 143, 'Tukuma'),
(2795, 143, 'Valkas'),
(2796, 143, 'Valmieras'),
(2797, 143, 'Ventspils'),
(2798, 143, 'Ventspils'),
(2799, 144, ''),
(2800, 144, 'Vaduz'),
(2801, 144, ''),
(2802, 144, 'Balzers'),
(2803, 144, 'Eschen'),
(2804, 144, 'Gamprin'),
(2805, 144, 'Mauren'),
(2806, 144, 'Planken'),
(2807, 144, 'Ruggell'),
(2808, 144, 'Schaan'),
(2809, 144, 'Schellenberg'),
(2810, 144, 'Triesen'),
(2811, 144, 'Triesenberg'),
(2812, 145, ''),
(2813, 145, 'Vilnius'),
(2814, 145, ''),
(2815, 145, 'Alytaus'),
(2816, 145, 'Kauno'),
(2817, 145, 'Klaipedos'),
(2818, 145, 'Marijampoles'),
(2819, 145, 'Panevezio'),
(2820, 145, 'Siauliu'),
(2821, 145, 'Taurages'),
(2822, 145, 'Telsiu'),
(2823, 145, 'Utenos'),
(2824, 146, ''),
(2825, 146, 'Luxembourg'),
(2826, 146, ''),
(2827, 146, 'Diekirch'),
(2828, 146, 'Grevenmacher'),
(2829, 147, ''),
(2830, 147, 'Skopje'),
(2831, 147, ''),
(2832, 147, 'Aracinovo'),
(2833, 147, 'Bac'),
(2834, 147, 'Belcista'),
(2835, 147, 'Berovo'),
(2836, 147, 'Bistrica'),
(2837, 147, 'Bitola'),
(2838, 147, 'Blatec'),
(2839, 147, 'Bogdanci'),
(2840, 147, 'Bogomila'),
(2841, 147, 'Bogovinje'),
(2842, 147, 'Bosilovo'),
(2843, 147, 'Brvenica'),
(2844, 147, 'Cair'),
(2845, 147, 'Capari'),
(2846, 147, 'Caska'),
(2847, 147, 'Cegrane'),
(2848, 147, 'Centar'),
(2849, 147, 'Centar Zupa'),
(2850, 147, 'Cesinovo'),
(2851, 147, 'Cucer-Sandevo'),
(2852, 147, 'Debar'),
(2853, 147, 'Delcevo'),
(2854, 147, 'Delogozdi'),
(2855, 147, 'Demir Hisar'),
(2856, 147, 'Demir Kapija'),
(2857, 147, 'Dobrusevo'),
(2858, 147, 'Dolna Banjica'),
(2859, 147, 'Dolneni'),
(2860, 147, 'Dorce Petrov'),
(2861, 147, 'Drugovo'),
(2862, 147, 'Dzepciste'),
(2863, 147, 'Gazi Baba'),
(2864, 147, 'Gevgelija'),
(2865, 147, 'Gostivar'),
(2866, 147, 'Gradsko'),
(2867, 147, 'Ilinden'),
(2868, 147, 'Izvor'),
(2869, 147, 'Jegunovce'),
(2870, 147, 'Kamenjane'),
(2871, 147, 'Karbinci'),
(2872, 147, 'Karpos'),
(2873, 147, 'Kavadarci'),
(2874, 147, 'Kicevo'),
(2875, 147, 'Kisela Voda'),
(2876, 147, 'Klecevce'),
(2877, 147, 'Kocani'),
(2878, 147, 'Konce'),
(2879, 147, 'Kondovo'),
(2880, 147, 'Konopiste'),
(2881, 147, 'Kosel'),
(2882, 147, 'Kratovo'),
(2883, 147, 'Kriva Palanka'),
(2884, 147, 'Krivogastani'),
(2885, 147, 'Krusevo'),
(2886, 147, 'Kuklis'),
(2887, 147, 'Kukurecani'),
(2888, 147, 'Kumanovo'),
(2889, 147, 'Labunista'),
(2890, 147, 'Lipkovo'),
(2891, 147, 'Lozovo'),
(2892, 147, 'Lukovo'),
(2893, 147, 'Makedonska Kamenica'),
(2894, 147, 'Makedonski Brod'),
(2895, 147, 'Mavrovi Anovi'),
(2896, 147, 'Meseista'),
(2897, 147, 'Miravci'),
(2898, 147, 'Mogila'),
(2899, 147, 'Murtino'),
(2900, 147, 'Negotino'),
(2901, 147, 'Negotino-Polosko'),
(2902, 147, 'Novaci'),
(2903, 147, 'Novo Selo'),
(2904, 147, 'Oblesevo'),
(2905, 147, 'Ohrid'),
(2906, 147, 'Orasac'),
(2907, 147, 'Orizari'),
(2908, 147, 'Oslomej'),
(2909, 147, 'Pehcevo'),
(2910, 147, 'Petrovec'),
(2911, 147, 'Plasnica'),
(2912, 147, 'Podares'),
(2913, 147, 'Prilep'),
(2914, 147, 'Probistip'),
(2915, 147, 'Radovis'),
(2916, 147, 'Rankovce'),
(2917, 147, 'Resen'),
(2918, 147, 'Rosoman'),
(2919, 147, 'Rostusa'),
(2920, 147, 'Samokov'),
(2921, 147, 'Saraj'),
(2922, 147, 'Sipkovica'),
(2923, 147, 'Sopiste'),
(2924, 147, 'Sopotnica'),
(2925, 147, 'Srbinovo'),
(2926, 147, 'Star Dojran'),
(2927, 147, 'Staravina'),
(2928, 147, 'Staro Nagoricane'),
(2929, 147, 'Stip'),
(2930, 147, 'Struga'),
(2931, 147, 'Strumica'),
(2932, 147, 'Studenicani'),
(2933, 147, 'Suto Orizari'),
(2934, 147, 'Sveti Nikole'),
(2935, 147, 'Tearce'),
(2936, 147, 'Tetovo'),
(2937, 147, 'Topolcani'),
(2938, 147, 'Valandovo'),
(2939, 147, 'Vasilevo'),
(2940, 147, 'Velesta'),
(2941, 147, 'Veles'),
(2942, 147, 'Vevcani'),
(2943, 147, 'Vinica'),
(2944, 147, 'Vitoliste'),
(2945, 147, 'Vranestica'),
(2946, 147, 'Vrapciste'),
(2947, 147, 'Vratnica'),
(2948, 147, 'Vrutok'),
(2949, 147, 'Zajas'),
(2950, 147, 'Zelenikovo'),
(2951, 147, 'Zeleno'),
(2952, 147, 'Zitose'),
(2953, 147, 'Zletovo'),
(2954, 147, 'Zrnovci'),
(2955, 148, ''),
(2956, 148, 'Valletta'),
(2957, 149, ''),
(2958, 149, 'Chisinau'),
(2959, 149, ''),
(2960, 149, 'Balti'),
(2961, 149, 'Cahul'),
(2962, 149, 'Chisinau'),
(2963, 149, 'Chisinau'),
(2964, 149, 'Edinet'),
(2965, 149, 'Gagauzia'),
(2966, 149, 'Lapusna'),
(2967, 149, 'Orhei'),
(2968, 149, 'Soroca'),
(2969, 149, 'Stinga Nistrului'),
(2970, 149, 'Tighina'),
(2971, 149, 'Ungheni'),
(2972, 150, ''),
(2973, 150, 'Monaco'),
(2974, 150, ''),
(2975, 150, 'Fontvieille'),
(2976, 150, 'La Condamine'),
(2977, 150, 'Monaco-Ville'),
(2978, 150, 'Monte-Carlo'),
(2979, 151, ''),
(2980, 151, 'Amsterdam'),
(2981, 151, 'The Hague'),
(2982, 151, ''),
(2983, 151, 'Drenthe'),
(2984, 151, 'Flevoland'),
(2985, 151, 'Friesland'),
(2986, 151, 'Gelderland'),
(2987, 151, 'Groningen'),
(2988, 151, 'Limburg'),
(2989, 151, 'Noord-Brabant'),
(2990, 151, 'Noord-Holland'),
(2991, 151, 'Overijssel'),
(2992, 151, 'Utrecht'),
(2993, 151, 'Zeeland'),
(2994, 151, 'Zuid-Holland'),
(2995, 152, ''),
(2996, 152, 'Oslo'),
(2997, 152, ''),
(2998, 152, 'Akershus'),
(2999, 152, 'Aust-Agder'),
(3000, 152, 'Buskerud'),
(3001, 152, 'Finnmark'),
(3002, 152, 'Hedmark'),
(3003, 152, 'Hordaland'),
(3004, 152, 'More og Romsdal'),
(3005, 152, 'Nordland'),
(3006, 152, 'Nord-Trondelag'),
(3007, 152, 'Oppland'),
(3008, 152, 'Ostfold'),
(3009, 152, 'Rogaland'),
(3010, 152, 'Sogn og Fjordane'),
(3011, 152, 'Sor-Trondelag'),
(3012, 152, 'Telemark'),
(3013, 152, 'Troms'),
(3014, 152, 'Vest-Agder'),
(3015, 152, 'Vestfold'),
(3016, 153, ''),
(3017, 153, 'Warsaw'),
(3018, 153, ''),
(3019, 153, 'Dolnoslaskie'),
(3020, 153, 'Kujawsko-Pomorskie'),
(3021, 153, 'Lodzkie'),
(3022, 153, 'Lubelskie'),
(3023, 153, 'Lubuskie'),
(3024, 153, 'Malopolskie'),
(3025, 153, 'Mazowieckie'),
(3026, 153, 'Opolskie'),
(3027, 153, 'Podkarpackie'),
(3028, 153, 'Podlaskie'),
(3029, 153, 'Pomorskie'),
(3030, 153, 'Slaskie'),
(3031, 153, 'Swietokrzyskie'),
(3032, 153, 'Warminsko-Mazurskie'),
(3033, 153, 'Wielkopolskie'),
(3034, 153, 'Zachodniopomorskie'),
(3035, 154, ''),
(3036, 154, 'Lisbon'),
(3037, 154, ''),
(3038, 154, 'Aveiro'),
(3039, 154, 'Acores (Azores)'),
(3040, 154, 'Beja'),
(3041, 154, 'Braga'),
(3042, 154, 'Braganca'),
(3043, 154, 'Castelo Branco'),
(3044, 154, 'Coimbra'),
(3045, 154, 'Evora'),
(3046, 154, 'Faro'),
(3047, 154, 'Guarda'),
(3048, 154, 'Leiria'),
(3049, 154, 'Lisboa'),
(3050, 154, 'Madeira'),
(3051, 154, 'Portalegre'),
(3052, 154, 'Porto'),
(3053, 154, 'Santarem'),
(3054, 154, 'Setubal'),
(3055, 154, 'Viana do Castelo'),
(3056, 154, 'Vila Real'),
(3057, 154, 'Viseu'),
(3058, 155, ''),
(3059, 155, 'Bucharest (Bucuresti)'),
(3060, 155, ''),
(3061, 155, 'Alba'),
(3062, 155, 'Arad'),
(3063, 155, 'Arges'),
(3064, 155, 'Bacau'),
(3065, 155, 'Bihor'),
(3066, 155, 'Bistrita-Nasaud'),
(3067, 155, 'Botosani'),
(3068, 155, 'Braila'),
(3069, 155, 'Brasov'),
(3070, 155, 'Buzau'),
(3071, 155, 'Calarasi'),
(3072, 155, 'Caras-Severin'),
(3073, 155, 'Cluj'),
(3074, 155, 'Constanta'),
(3075, 155, 'Covasna'),
(3076, 155, 'Dimbovita'),
(3077, 155, 'Dolj'),
(3078, 155, 'Galati'),
(3079, 155, 'Gorj'),
(3080, 155, 'Giurgiu'),
(3081, 155, 'Harghita'),
(3082, 155, 'Hunedoara'),
(3083, 155, 'Ialomita'),
(3084, 155, 'Iasi'),
(3085, 155, 'Ilfov'),
(3086, 155, 'Maramures'),
(3087, 155, 'Mehedinti'),
(3088, 155, 'Mures'),
(3089, 155, 'Neamt'),
(3090, 155, 'Olt'),
(3091, 155, 'Prahova'),
(3092, 155, 'Salaj'),
(3093, 155, 'Satu Mare'),
(3094, 155, 'Sibiu'),
(3095, 155, 'Suceava'),
(3096, 155, 'Teleorman'),
(3097, 155, 'Timis'),
(3098, 155, 'Tulcea'),
(3099, 155, 'Vaslui'),
(3100, 155, 'Vilcea'),
(3101, 155, 'Vrancea'),
(3102, 156, ''),
(3103, 156, 'San Marino'),
(3104, 156, ''),
(3105, 156, 'Acquaviva'),
(3106, 156, 'Borgo Maggiore'),
(3107, 156, 'Chiesanuova'),
(3108, 156, 'Domagnano'),
(3109, 156, 'Faetano'),
(3110, 156, 'Fiorentino'),
(3111, 156, 'Monte Giardino'),
(3112, 156, 'Serravalle'),
(3113, 157, ''),
(3114, 157, 'Belgrade'),
(3115, 157, ''),
(3116, 157, 'Kosovo'),
(3117, 157, 'Montenegro'),
(3118, 157, 'Serbia'),
(3119, 157, 'Vojvodina'),
(3120, 158, ''),
(3121, 158, 'Bratislava'),
(3122, 158, ''),
(3123, 158, 'Banskobystricky'),
(3124, 158, 'Kosicky'),
(3125, 158, 'Nitriansky'),
(3126, 158, 'Presovsky'),
(3127, 158, 'Trenciansky'),
(3128, 158, 'Trnavsky'),
(3129, 158, 'Zilinsky'),
(3130, 159, ''),
(3131, 159, 'Ljubljana'),
(3132, 159, ''),
(3133, 159, 'Ajdovscina'),
(3134, 159, 'Beltinci'),
(3135, 159, 'Bled'),
(3136, 159, 'Bohinj'),
(3137, 159, 'Borovnica'),
(3138, 159, 'Bovec'),
(3139, 159, 'Brda'),
(3140, 159, 'Brezice'),
(3141, 159, 'Brezovica'),
(3142, 159, 'Cankova-Tisina'),
(3143, 159, 'Celje'),
(3144, 159, 'Cerklje na Gorenjskem'),
(3145, 159, 'Cerknica'),
(3146, 159, 'Cerkno'),
(3147, 159, 'Crensovci'),
(3148, 159, 'Crna na Koroskem'),
(3149, 159, 'Crnomelj'),
(3150, 159, 'Destrnik-Trnovska Vas'),
(3151, 159, 'Divaca'),
(3152, 159, 'Dobrepolje'),
(3153, 159, 'Dobrova-Horjul-Polhov Gradec'),
(3154, 159, 'Dol pri Ljubljani'),
(3155, 159, 'Domzale'),
(3156, 159, 'Dornava'),
(3157, 159, 'Dravograd'),
(3158, 159, 'Duplek'),
(3159, 159, 'Gorenja Vas-Poljane'),
(3160, 159, 'Gorisnica'),
(3161, 159, 'Gornja Radgona'),
(3162, 159, 'Gornji Grad'),
(3163, 159, 'Gornji Petrovci'),
(3164, 159, 'Grosuplje'),
(3165, 159, 'Hodos Salovci'),
(3166, 159, 'Hrastnik'),
(3167, 159, 'Hrpelje-Kozina'),
(3168, 159, 'Idrija'),
(3169, 159, 'Ig'),
(3170, 159, 'Ilirska Bistrica'),
(3171, 159, 'Ivancna Gorica'),
(3172, 159, 'Izola'),
(3173, 159, 'Jesenice'),
(3174, 159, 'Jursinci'),
(3175, 159, 'Kamnik'),
(3176, 159, 'Kanal'),
(3177, 159, 'Kidricevo'),
(3178, 159, 'Kobarid'),
(3179, 159, 'Kobilje'),
(3180, 159, 'Kocevje'),
(3181, 159, 'Komen'),
(3182, 159, 'Koper'),
(3183, 159, 'Kozje'),
(3184, 159, 'Kranj'),
(3185, 159, 'Kranjska Gora'),
(3186, 159, 'Krsko'),
(3187, 159, 'Kungota'),
(3188, 159, 'Kuzma'),
(3189, 159, 'Lasko'),
(3190, 159, 'Lenart'),
(3191, 159, 'Lendava'),
(3192, 159, 'Litija'),
(3193, 159, 'Ljubno'),
(3194, 159, 'Ljutomer'),
(3195, 159, 'Logatec'),
(3196, 159, 'Loska Dolina'),
(3197, 159, 'Loski Potok'),
(3198, 159, 'Luce'),
(3199, 159, 'Lukovica'),
(3200, 159, 'Majsperk'),
(3201, 159, 'Maribor'),
(3202, 159, 'Medvode'),
(3203, 159, 'Menges'),
(3204, 159, 'Metlika'),
(3205, 159, 'Mezica'),
(3206, 159, 'Miren-Kostanjevica'),
(3207, 159, 'Mislinja'),
(3208, 159, 'Moravce'),
(3209, 159, 'Moravske Toplice'),
(3210, 159, 'Mozirje'),
(3211, 159, 'Murska Sobota'),
(3212, 159, 'Muta'),
(3213, 159, 'Naklo'),
(3214, 159, 'Nazarje'),
(3215, 159, 'Nova Gorica'),
(3216, 159, 'Novo Mesto'),
(3217, 159, 'Odranci'),
(3218, 159, 'Ormoz'),
(3219, 159, 'Osilnica'),
(3220, 159, 'Pesnica'),
(3221, 159, 'Piran'),
(3222, 159, 'Pivka'),
(3223, 159, 'Podcetrtek'),
(3224, 159, 'Podvelka-Ribnica'),
(3225, 159, 'Postojna'),
(3226, 159, 'Preddvor'),
(3227, 159, 'Ptuj'),
(3228, 159, 'Puconci'),
(3229, 159, 'Race-Fram'),
(3230, 159, 'Radece'),
(3231, 159, 'Radenci'),
(3232, 159, 'Radlje ob Dravi'),
(3233, 159, 'Radovljica'),
(3234, 159, 'Ravne-Prevalje'),
(3235, 159, 'Ribnica'),
(3236, 159, 'Rogasevci'),
(3237, 159, 'Rogaska Slatina'),
(3238, 159, 'Rogatec'),
(3239, 159, 'Ruse'),
(3240, 159, 'Semic'),
(3241, 159, 'Sencur'),
(3242, 159, 'Sentilj'),
(3243, 159, 'Sentjernej'),
(3244, 159, 'Sentjur pri Celju'),
(3245, 159, 'Sevnica'),
(3246, 159, 'Sezana'),
(3247, 159, 'Skocjan'),
(3248, 159, 'Skofja Loka'),
(3249, 159, 'Skofljica'),
(3250, 159, 'Slovenj Gradec'),
(3251, 159, 'Slovenska Bistrica'),
(3252, 159, 'Slovenske Konjice'),
(3253, 159, 'Smarje pri Jelsah'),
(3254, 159, 'Smartno ob Paki'),
(3255, 159, 'Sostanj'),
(3256, 159, 'Starse'),
(3257, 159, 'Store'),
(3258, 159, 'Sveti Jurij'),
(3259, 159, 'Tolmin'),
(3260, 159, 'Trbovlje'),
(3261, 159, 'Trebnje'),
(3262, 159, 'Trzic'),
(3263, 159, 'Turnisce'),
(3264, 159, 'Velenje'),
(3265, 159, 'Velike Lasce'),
(3266, 159, 'Videm'),
(3267, 159, 'Vipava'),
(3268, 159, 'Vitanje'),
(3269, 159, 'Vodice'),
(3270, 159, 'Vojnik'),
(3271, 159, 'Vrhnika'),
(3272, 159, 'Vuzenica'),
(3273, 159, 'Zagorje ob Savi'),
(3274, 159, 'Zalec'),
(3275, 159, 'Zavrc'),
(3276, 159, 'Zelezniki'),
(3277, 159, 'Ziri'),
(3278, 159, 'Zrece'),
(3279, 160, ''),
(3280, 160, 'Madrid'),
(3281, 160, ''),
(3282, 160, 'Andalucia'),
(3283, 160, 'Aragon'),
(3284, 160, 'Asturias'),
(3285, 160, 'Baleares (Balearic Islands)'),
(3286, 160, 'Ceuta'),
(3287, 160, 'Canarias (Canary Islands)'),
(3288, 160, 'Cantabria'),
(3289, 160, 'Castilla-La Mancha'),
(3290, 160, 'Castilla y Leon'),
(3291, 160, 'Cataluna'),
(3292, 160, 'Communidad Valencian'),
(3293, 160, 'Extremadura'),
(3294, 160, 'Galicia'),
(3295, 160, 'La Rioja'),
(3296, 160, 'Melilla'),
(3297, 160, 'Murcia'),
(3298, 160, 'Navarra'),
(3299, 160, 'Pais Vasco (Basque Country)'),
(3300, 161, ''),
(3301, 161, 'Stockholm'),
(3302, 161, ''),
(3303, 161, 'Blekinge'),
(3304, 161, 'Dalarnas'),
(3305, 161, 'Gavleborgs'),
(3306, 161, 'Gotlands'),
(3307, 161, 'Hallands'),
(3308, 161, 'Jamtlands'),
(3309, 161, 'Jonkopings'),
(3310, 161, 'Kalmar'),
(3311, 161, 'Kronobergs'),
(3312, 161, 'Norrbottens'),
(3313, 161, 'Orebro'),
(3314, 161, 'Ostergotlands'),
(3315, 161, 'Skane'),
(3316, 161, 'Sodermanlands'),
(3317, 161, 'Uppsala'),
(3318, 161, 'Varmlands'),
(3319, 161, 'Vasterbottens'),
(3320, 161, 'Vasternorrlands'),
(3321, 161, 'Vastmanlands'),
(3322, 161, 'Vastra Gotalands'),
(3323, 162, ''),
(3324, 162, 'Bern'),
(3325, 162, ''),
(3326, 162, 'Aargau'),
(3327, 162, 'Appenzell Ausser-Rhoden'),
(3328, 162, 'Appenzell Inner-Rhoden'),
(3329, 162, 'Basel-Landschaft'),
(3330, 162, 'Basel-Stadt'),
(3331, 162, 'Fribourg'),
(3332, 162, 'Geneve'),
(3333, 162, 'Glarus'),
(3334, 162, 'Graubunden'),
(3335, 162, 'Jura'),
(3336, 162, 'Luzern'),
(3337, 162, 'Neuchatel'),
(3338, 162, 'Nidwalden'),
(3339, 162, 'Obwalden'),
(3340, 162, 'Sankt Gallen'),
(3341, 162, 'Schaffhausen'),
(3342, 162, 'Schwyz'),
(3343, 162, 'Solothurn'),
(3344, 162, 'Thurgau'),
(3345, 162, 'Ticino'),
(3346, 162, 'Uri'),
(3347, 162, 'Valais'),
(3348, 162, 'Vaud'),
(3349, 162, 'Zug'),
(3350, 162, 'Zurich'),
(3351, 163, ''),
(3352, 163, 'Kiev (Kyyiv)'),
(3353, 163, ''),
(3354, 163, 'Izmail (Izmayl)'),
(3355, 163, 'Avtonomna Respublika Krym'),
(3356, 164, ''),
(3357, 164, '-----ENGLAND:-----'),
(3358, 164, 'Barking/Dagenham'),
(3359, 164, 'Barnet'),
(3360, 164, 'Barnsley'),
(3361, 164, 'Bath/North East Somerset'),
(3362, 164, 'Bedfordshire'),
(3363, 164, 'Bexley'),
(3364, 164, 'Birmingham'),
(3365, 164, 'Blackburn with Darwen'),
(3366, 164, 'Blackpool'),
(3367, 164, 'Bolton'),
(3368, 164, 'Bournemouth'),
(3369, 164, 'Bracknell Forest'),
(3370, 164, 'Bradford'),
(3371, 164, 'Brent'),
(3372, 164, 'Brighton/Hove'),
(3373, 164, 'City of Bristol'),
(3374, 164, 'Bromley'),
(3375, 164, 'Buckinghamshire'),
(3376, 164, 'Bury'),
(3377, 164, 'Calderdale'),
(3378, 164, 'Cambridgeshire'),
(3379, 164, 'Camden'),
(3380, 164, 'Cheshire'),
(3381, 164, 'Cornwall'),
(3382, 164, 'Coventry'),
(3383, 164, 'Croydon'),
(3384, 164, 'Cumbria'),
(3385, 164, 'Darlington'),
(3386, 164, 'Derby'),
(3387, 164, 'Derbyshire'),
(3388, 164, 'Devon'),
(3389, 164, 'Doncaster'),
(3390, 164, 'Dorset'),
(3391, 164, 'Dudley'),
(3392, 164, 'Durham'),
(3393, 164, 'Ealing'),
(3394, 164, 'East Riding of Yorkshire'),
(3395, 164, 'East Sussex'),
(3396, 164, 'Enfield'),
(3397, 164, 'Essex'),
(3398, 164, 'Gateshead'),
(3399, 164, 'Gloucestershire'),
(3400, 164, 'Greenwich'),
(3401, 164, 'Hackney'),
(3402, 164, 'Halton'),
(3403, 164, 'Hammersmith/Fulham'),
(3404, 164, 'Hampshire'),
(3405, 164, 'Haringey'),
(3406, 164, 'Harrow'),
(3407, 164, 'Hartlepool'),
(3408, 164, 'Havering'),
(3409, 164, 'Herefordshire'),
(3410, 164, 'Hertfordshire'),
(3411, 164, 'Hillingdon'),
(3412, 164, 'Hounslow'),
(3413, 164, 'Isle of Wight'),
(3414, 164, 'Islington'),
(3415, 164, 'Kensington/Chelsea'),
(3416, 164, 'Kent'),
(3417, 164, 'City of Kingston upon Hull'),
(3418, 164, 'Kingston upon Thames'),
(3419, 164, 'Kirklees'),
(3420, 164, 'Knowsley'),
(3421, 164, 'Lambeth'),
(3422, 164, 'Lancashire'),
(3423, 164, 'Leeds'),
(3424, 164, 'Leicester'),
(3425, 164, 'Leicestershire'),
(3426, 164, 'Lewisham'),
(3427, 164, 'Lincolnshire'),
(3428, 164, 'Liverpool'),
(3429, 164, 'City of London'),
(3430, 164, 'Luton'),
(3431, 164, 'Manchester'),
(3432, 164, 'Medway'),
(3433, 164, 'Merton'),
(3434, 164, 'Middlesbrough'),
(3435, 164, 'Milton Keynes'),
(3436, 164, 'Newcastle upon Tyne'),
(3437, 164, 'Newham'),
(3438, 164, 'Norfolk'),
(3439, 164, 'Northamptonshire'),
(3440, 164, 'North East Lincolnshire'),
(3441, 164, 'North Lincolnshire'),
(3442, 164, 'North Somerset'),
(3443, 164, 'North Tyneside'),
(3444, 164, 'Northumberl/'),
(3445, 164, 'North Yorkshire'),
(3446, 164, 'Nottingham'),
(3447, 164, 'Nottinghamshire'),
(3448, 164, 'Oldham'),
(3449, 164, 'Oxfordshire'),
(3450, 164, 'Peterborough'),
(3451, 164, 'Plymouth'),
(3452, 164, 'Poole'),
(3453, 164, 'Portsmouth'),
(3454, 164, 'Reading'),
(3455, 164, 'Redbridge'),
(3456, 164, 'Redcar/Clevel/'),
(3457, 164, 'Richmond upon Thames'),
(3458, 164, 'Rochdale'),
(3459, 164, 'Rotherham'),
(3460, 164, 'Rutl/'),
(3461, 164, 'Salford'),
(3462, 164, 'Shropshire'),
(3463, 164, 'S/well'),
(3464, 164, 'Sefton'),
(3465, 164, 'Sheffield'),
(3466, 164, 'Slough'),
(3467, 164, 'Solihull'),
(3468, 164, 'Somerset'),
(3469, 164, 'Southampton'),
(3470, 164, 'Southend-on-Sea'),
(3471, 164, 'South Gloucestershire'),
(3472, 164, 'South Tyneside'),
(3473, 164, 'Southwark'),
(3474, 164, 'Staffordshire'),
(3475, 164, 'St. Helens'),
(3476, 164, 'Stockport'),
(3477, 164, 'Stockton-on-Tees'),
(3478, 164, 'Stoke-on-Trent'),
(3479, 164, 'Suffolk'),
(3480, 164, 'Sunderl/'),
(3481, 164, 'Surrey'),
(3482, 164, 'Sutton'),
(3483, 164, 'Swindon'),
(3484, 164, 'Tameside'),
(3485, 164, 'Telford/Wrekin'),
(3486, 164, 'Thurrock'),
(3487, 164, 'Torbay'),
(3488, 164, 'Tower Hamlets'),
(3489, 164, 'Trafford'),
(3490, 164, 'Wakefield'),
(3491, 164, 'Walsall'),
(3492, 164, 'Waltham Forest'),
(3493, 164, 'W/sworth'),
(3494, 164, 'Warrington'),
(3495, 164, 'Warwickshire'),
(3496, 164, 'West Berkshire'),
(3497, 164, 'Westminster'),
(3498, 164, 'West Sussex'),
(3499, 164, 'Wigan'),
(3500, 164, 'Wiltshire'),
(3501, 164, 'Windsor/Maidenhead'),
(3502, 164, 'Wirral'),
(3503, 164, 'Wokingham'),
(3504, 164, 'Wolverhampton'),
(3505, 164, 'Worcestershire'),
(3506, 164, 'York'),
(3507, 164, ''),
(3508, 164, '-----NORTHERN IRELAND:-----'),
(3509, 164, 'Antrim'),
(3510, 164, 'County Antrim'),
(3511, 164, 'Ards'),
(3512, 164, 'Armagh'),
(3513, 164, 'County Armagh'),
(3514, 164, 'Ballymena'),
(3515, 164, 'Ballymoney'),
(3516, 164, 'Banbridge'),
(3517, 164, 'Belfast'),
(3518, 164, 'Carrickfergus'),
(3519, 164, 'Castlereagh'),
(3520, 164, 'Coleraine'),
(3521, 164, 'Cookstown'),
(3522, 164, 'Craigavon'),
(3523, 164, 'Down'),
(3524, 164, 'County Down'),
(3525, 164, 'Dungannon'),
(3526, 164, 'Fermanagh'),
(3527, 164, 'County Fermanagh'),
(3528, 164, 'Larne'),
(3529, 164, 'Limavady'),
(3530, 164, 'Lisburn'),
(3531, 164, 'County Londonderry'),
(3532, 164, 'Derry'),
(3533, 164, 'Magherafelt'),
(3534, 164, 'Moyle'),
(3535, 164, 'Newry/Mourne'),
(3536, 164, 'Newtownabbey'),
(3537, 164, 'North Down'),
(3538, 164, 'Omagh'),
(3539, 164, 'Strabane'),
(3540, 164, 'County Tyrone'),
(3541, 164, ''),
(3542, 164, '-----SCOTLAND:-----'),
(3543, 164, 'Aberdeen City'),
(3544, 164, 'Aberdeenshire'),
(3545, 164, 'Angus'),
(3546, 164, 'Argyll/Bute'),
(3547, 164, 'The Scottish Borders'),
(3548, 164, 'Clackmannanshire'),
(3549, 164, 'Dumfries/Galloway'),
(3550, 164, 'Dundee City'),
(3551, 164, 'East Ayrshire'),
(3552, 164, 'East Dunbartonshire'),
(3553, 164, 'East Lothian'),
(3554, 164, 'East Renfrewshire'),
(3555, 164, 'City of Edinburgh'),
(3556, 164, 'Falkirk'),
(3557, 164, 'Fife'),
(3558, 164, 'Glasgow City'),
(3559, 164, 'Highland'),
(3560, 164, 'Inverclyde'),
(3561, 164, 'Midlothian'),
(3562, 164, 'Moray'),
(3563, 164, 'North Ayrshire'),
(3564, 164, 'North Lanarkshire'),
(3565, 164, 'Orkney Islands'),
(3566, 164, 'Perth/Kinross'),
(3567, 164, 'Renfrewshire'),
(3568, 164, 'Shetland Islands'),
(3569, 164, 'South Ayrshire'),
(3570, 164, 'South Lanarkshire'),
(3571, 164, 'Stirling'),
(3572, 164, 'West Dunbartonshire'),
(3573, 164, 'Eilean Siar (Western Isles)'),
(3574, 164, 'West Lothian'),
(3575, 164, ''),
(3576, 164, '-----WALES-----:'),
(3577, 164, 'Isle of Anglesey'),
(3578, 164, 'Blaenau Gwent'),
(3579, 164, 'Bridgend'),
(3580, 164, 'Caerphilly'),
(3581, 164, 'Cardiff'),
(3582, 164, 'Ceredigion'),
(3583, 164, 'Carmarthenshire'),
(3584, 164, 'Conwy'),
(3585, 164, 'Denbighshire'),
(3586, 164, 'Flintshire'),
(3587, 164, 'Gwynedd'),
(3588, 164, 'Merthyr Tydfil'),
(3589, 164, 'Monmouthshire'),
(3590, 164, 'Neath Port Talbot'),
(3591, 164, 'Newport'),
(3592, 164, 'Pembrokeshire'),
(3593, 164, 'Powys'),
(3594, 164, 'Rhondda Cynon Taff'),
(3595, 164, 'Swansea'),
(3596, 164, 'Torfaen'),
(3597, 164, 'The Vale of Glamorgan'),
(3598, 164, 'Wrexham'),
(3599, 165, ''),
(3600, 166, ''),
(3601, 166, 'Franz Josef Land'),
(3602, 166, 'Svalbard'),
(3603, 167, ''),
(3604, 167, 'Alderney'),
(3605, 167, 'Azores'),
(3606, 167, 'Baixo'),
(3607, 167, 'Belle-Ile'),
(3608, 167, 'Bermuda'),
(3609, 167, 'Bioko'),
(3610, 167, 'Block'),
(3611, 167, 'Boa Vista'),
(3612, 167, 'Borduy'),
(3613, 167, 'Bugio'),
(3614, 167, 'Canary Islands'),
(3615, 167, 'Cape Breton'),
(3616, 167, 'Cape Verde Islands'),
(3617, 167, 'Channel Islands'),
(3618, 167, 'Corvo'),
(3619, 167, 'Deer Isle'),
(3620, 167, 'Eysturoy'),
(3621, 167, 'Faeroe Islands'),
(3622, 167, 'Fago'),
(3623, 167, 'Faial'),
(3624, 167, 'Flores'),
(3625, 167, 'Fuerteventura'),
(3626, 167, 'Fugloy'),
(3627, 167, 'Gomera'),
(3628, 167, 'Graciosa'),
(3629, 167, 'Gran Canaria'),
(3630, 167, 'Grand Manan'),
(3631, 167, 'Grande'),
(3632, 167, 'Greenland'),
(3633, 167, 'Guernsey'),
(3634, 167, 'Hebrides'),
(3635, 167, 'Herm'),
(3636, 167, 'Hestur'),
(3637, 167, 'Hierro'),
(3638, 167, 'Iceland'),
(3639, 167, 'Iles De La Madeleine'),
(3640, 167, 'Ile de Noirmoutier'),
(3641, 167, 'Ilhas Desertas'),
(3642, 167, 'Ireland'),
(3643, 167, 'Isle au Haut'),
(3644, 167, 'Isle of Lewis'),
(3645, 167, 'Isle of Mull'),
(3646, 167, 'Isle of Skye'),
(3647, 167, 'Jersey'),
(3648, 167, 'Kalsoy'),
(3649, 167, 'Koltur'),
(3650, 167, 'Kunoy'),
(3651, 167, 'Lanzarote'),
(3652, 167, 'La Palma'),
(3653, 167, 'Litla Dimun'),
(3654, 167, 'Long Island'),
(3655, 167, 'Jan Mayen'),
(3656, 167, 'Madeira Islands'),
(3657, 167, 'Maio'),
(3658, 167, 'Matinicus'),
(3659, 167, 'Monhegan'),
(3660, 167, 'Mount Desert'),
(3661, 167, 'Mykines'),
(3662, 167, 'Nantucket Island'),
(3663, 167, 'Newfoundland'),
(3664, 167, 'Nolsoy'),
(3665, 167, 'Orkney Islands'),
(3666, 167, 'Pico'),
(3667, 167, 'Porto Santo'),
(3668, 167, 'Prince Edward Island'),
(3669, 167, 'St. Peter/St. Paul Rocks'),
(3670, 167, 'St.-Pierre/Miquelon'),
(3671, 167, 'Praia'),
(3672, 167, 'Sable Island'),
(3673, 167, 'Sal'),
(3674, 167, 'Sandoy'),
(3675, 167, 'Santo Antao'),
(3676, 167, 'Santa Maria'),
(3677, 167, 'Sao Jorge'),
(3678, 167, 'Sao Miguel'),
(3679, 167, 'Sao Nicolau'),
(3680, 167, 'Sao Tiago'),
(3681, 167, 'Sao Tome/Principe'),
(3682, 167, 'Sao Vicente'),
(3683, 167, 'Sark'),
(3684, 167, 'Scilly Isles'),
(3685, 167, 'Shetland Islands'),
(3686, 167, 'Skuvoy'),
(3687, 167, 'Stora Dimun'),
(3688, 167, 'Streymoy'),
(3689, 167, 'Sumba'),
(3690, 167, 'Svinoy'),
(3691, 167, 'Swans'),
(3692, 167, 'Tenerife'),
(3693, 167, 'Terceira'),
(3694, 167, 'Uist Islands'),
(3695, 167, 'Vagar'),
(3696, 167, 'Viday'),
(3697, 167, 'Vinalhaven'),
(3698, 168, ''),
(3699, 168, 'Amsterdam'),
(3700, 168, 'Andaman Islands'),
(3701, 168, 'Annobon'),
(3702, 168, 'Ascension'),
(3703, 168, 'Bouvet'),
(3704, 168, 'Falkland Islands'),
(3705, 168, 'Gough'),
(3706, 168, 'Martin Vas Islands'),
(3707, 168, 'Nightingale'),
(3708, 168, 'St. Helena'),
(3709, 168, 'Shag/Black Rocks'),
(3710, 168, 'South Georgia'),
(3711, 168, 'South Orkney Islands'),
(3712, 168, 'South Sandwich Islands'),
(3713, 168, 'Traversay'),
(3714, 168, 'Trindade'),
(3715, 168, 'Tristan da Cunha'),
(3716, 169, ''),
(3717, 169, 'Akimiski'),
(3718, 169, 'Aland'),
(3719, 169, 'Alcatraz'),
(3720, 169, 'Apostle Islands'),
(3721, 169, 'Baffin'),
(3722, 169, 'Banka'),
(3723, 169, 'Banks'),
(3724, 169, 'Beaver'),
(3725, 169, 'Belcher Islands'),
(3726, 169, 'Belitung'),
(3727, 169, 'Borneo'),
(3728, 169, 'Bornholm'),
(3729, 169, 'Brac'),
(3730, 169, 'Coats'),
(3731, 169, 'Cres'),
(3732, 169, 'Devon'),
(3733, 169, 'East Frisian Islands'),
(3734, 169, 'Ellesmere'),
(3735, 169, 'Fyn'),
(3736, 169, 'Galveston'),
(3737, 169, 'Gotland'),
(3738, 169, 'Groote Eylandt'),
(3739, 169, 'Hiiumaa'),
(3740, 169, 'Hong Kong Island'),
(3741, 169, 'Isla de Ometepe'),
(3742, 169, 'Isla Del Ray'),
(3743, 169, 'Isle of Man'),
(3744, 169, 'Isle of Wight'),
(3745, 169, 'Isle Royale'),
(3746, 169, 'Jutland'),
(3747, 169, 'Key Largo'),
(3748, 169, 'Key West'),
(3749, 169, 'King William'),
(3750, 169, 'Krek'),
(3751, 169, 'Langeland'),
(3752, 169, 'Lantau'),
(3753, 169, 'Lolland'),
(3754, 169, 'Lundy'),
(3755, 169, 'Mackinac'),
(3756, 169, 'Madeleine Islands'),
(3757, 169, 'Manhattan Island'),
(3758, 169, 'Manitoulin'),
(3759, 169, 'Marsh'),
(3760, 169, 'Matagorda'),
(3761, 169, 'Melville'),
(3762, 169, 'North Hero'),
(3763, 169, 'Oland'),
(3764, 169, 'Paracel Islands'),
(3765, 169, 'Pelee'),
(3766, 169, 'Prince Charles'),
(3767, 169, 'Prince of Wales'),
(3768, 169, 'Queen Elizabeth Islands'),
(3769, 169, 'Saaremaa'),
(3770, 169, 'Sjaelland'),
(3771, 169, 'Somerset'),
(3772, 169, 'Southhampton'),
(3773, 169, 'South Hero'),
(3774, 169, 'Spratley Islands'),
(3775, 169, 'Sulawesi'),
(3776, 169, 'Victoria'),
(3777, 169, 'Washington'),
(3778, 169, 'Wellesley Islands'),
(3779, 170, ''),
(3780, 170, 'Abaco (great)'),
(3781, 170, 'Abaco (little)'),
(3782, 170, 'Acklins'),
(3783, 170, 'Andros'),
(3784, 170, 'Anegada'),
(3785, 170, 'Anguilla'),
(3786, 170, 'Antigua'),
(3787, 170, 'Aruba'),
(3788, 170, 'Bahamas'),
(3789, 170, 'Barbados'),
(3790, 170, 'Barbuda'),
(3791, 170, 'Bimini Islands'),
(3792, 170, 'Bonaire'),
(3793, 170, 'Caicos Islands'),
(3794, 170, 'Cat'),
(3795, 170, 'Cayman Brac'),
(3796, 170, 'Cayman Islands'),
(3797, 170, 'Cozumel'),
(3798, 170, 'Crooked'),
(3799, 170, 'Cuba'),
(3800, 170, 'Curacao'),
(3801, 170, 'Dominica'),
(3802, 170, 'Exuma'),
(3803, 170, 'Grand Bahama'),
(3804, 170, 'Grand Cayman'),
(3805, 170, 'Grand Turk'),
(3806, 170, 'Greater Antilles'),
(3807, 170, 'Great Inagua'),
(3808, 170, 'Grenada'),
(3809, 170, 'Guadeloupe'),
(3810, 170, 'Hispaniola (Haiti/DOR)'),
(3811, 170, 'Isla de Margarita'),
(3812, 170, 'Isla Mujeres'),
(3813, 170, 'Isla La Tortuga'),
(3814, 170, 'Isle of Youth'),
(3815, 170, 'Jamaica'),
(3816, 170, 'Lesser Antilles'),
(3817, 170, 'Little Cayman'),
(3818, 170, 'Little Inagua'),
(3819, 170, 'Long'),
(3820, 170, 'Marie-Galante'),
(3821, 170, 'Martinique'),
(3822, 170, 'Mayaguana'),
(3823, 170, 'Montserrat'),
(3824, 170, 'Navassa'),
(3825, 170, 'Nevis'),
(3826, 170, 'New Providence'),
(3827, 170, 'Providencia'),
(3828, 170, 'Puerto Rico'),
(3829, 170, 'Roatan'),
(3830, 170, 'Rum Cay'),
(3831, 170, 'St. Barts'),
(3832, 170, 'St. Croix'),
(3833, 170, 'St. Eustatius'),
(3834, 170, 'St. John'),
(3835, 170, 'St. Kitts'),
(3836, 170, 'St. Lucia'),
(3837, 170, 'St. Martin/Sint Maartan'),
(3838, 170, 'St. Thomas'),
(3839, 170, 'St Vincent and the Grenadines'),
(3840, 170, 'Saba'),
(3841, 170, 'San Blas Islands'),
(3842, 170, 'San Salvador'),
(3843, 170, 'San Andres'),
(3844, 170, 'Santa Catilina (St. Catherine)'),
(3845, 170, 'Tobago'),
(3846, 170, 'Tortola'),
(3847, 170, 'Trinidad'),
(3848, 170, 'Virgin Gorda'),
(3849, 170, 'West Indies'),
(3850, 171, ''),
(3851, 171, 'Aegina'),
(3852, 171, 'Alonissos'),
(3853, 171, 'Amorgos'),
(3854, 171, 'Andros'),
(3855, 171, 'Angistri'),
(3856, 171, 'Astipalea'),
(3857, 171, 'Carpathos'),
(3858, 171, 'Cephalonia'),
(3859, 171, 'Chios (Hios)'),
(3860, 171, 'Corfu'),
(3861, 171, 'Cos (Kos)'),
(3862, 171, 'Crete (Kriti)'),
(3863, 171, 'Cyclades Islands'),
(3864, 171, 'Dodecanese Islands'),
(3865, 171, 'Dokos'),
(3866, 171, 'Eubaea (Evia)'),
(3867, 171, 'Evia'),
(3868, 171, 'Hydra'),
(3869, 171, 'Ikaria'),
(3870, 171, 'Ionian Islands'),
(3871, 171, 'Ios'),
(3872, 171, 'Ithaca'),
(3873, 171, 'Kea'),
(3874, 171, 'Kefalonia'),
(3875, 171, 'Kefalos'),
(3876, 171, 'Kalimnos'),
(3877, 171, 'Kassos'),
(3878, 171, 'Kithnos'),
(3879, 171, 'Kos'),
(3880, 171, 'Kythnos'),
(3881, 171, 'Kythria'),
(3882, 171, 'Lefkada'),
(3883, 171, 'Lemnos'),
(3884, 171, 'Leros'),
(3885, 171, 'Lesvos'),
(3886, 171, 'Leucas'),
(3887, 171, 'Limnos'),
(3888, 171, 'Lipsi'),
(3889, 171, 'Los'),
(3890, 171, 'Melos'),
(3891, 171, 'Mykonos'),
(3892, 171, 'Naxos'),
(3893, 171, 'Nisyros'),
(3894, 171, 'Paros'),
(3895, 171, 'Patmos'),
(3896, 171, 'Poros'),
(3897, 171, 'Pothia'),
(3898, 171, 'Rhodes (Rodos)'),
(3899, 171, 'Salamina'),
(3900, 171, 'Samos'),
(3901, 171, 'Samothrace'),
(3902, 171, 'Santorini'),
(3903, 171, 'Serifos'),
(3904, 171, 'Seriphos'),
(3905, 171, 'Sifnos'),
(3906, 171, 'Sikinos'),
(3907, 171, 'Skiros'),
(3908, 171, 'Skiathos'),
(3909, 171, 'Skopelos'),
(3910, 171, 'Skyros'),
(3911, 171, 'Spetses'),
(3912, 171, 'Sporades Islands'),
(3913, 171, 'Syros'),
(3914, 171, 'Tenos (Tinos)'),
(3915, 171, 'Thassos'),
(3916, 171, 'Tzia'),
(3917, 171, 'Zakinthos'),
(3918, 171, 'Zante'),
(3919, 172, ''),
(3920, 172, 'Addu Atoll'),
(3921, 172, 'Agalega Islands'),
(3922, 172, 'Amsterdam'),
(3923, 172, 'Andaman Islands'),
(3924, 172, 'Anjouan (Nzwani)'),
(3925, 172, 'Ari Atoll'),
(3926, 172, 'Ashmore/Cartier Islands'),
(3927, 172, 'Bali'),
(3928, 172, 'Barrow'),
(3929, 172, 'Bathurst'),
(3930, 172, 'Bompoka'),
(3931, 172, 'Cape Barren'),
(3932, 172, 'Car Nicobar'),
(3933, 172, 'Chagos Archipelago'),
(3934, 172, 'Christmas'),
(3935, 172, 'Comoros'),
(3936, 172, 'Crozet Islands'),
(3937, 172, 'Danger'),
(3938, 172, 'Diego Garcia'),
(3939, 172, 'Eagle Islands'),
(3940, 172, 'Egmont Islands'),
(3941, 172, 'Faadhippolhu Atoll'),
(3942, 172, 'Felidhoo Atoll'),
(3943, 172, 'Flinders'),
(3944, 172, 'Goidhoo Atoll'),
(3945, 172, 'Grand Comore (Njazidja)'),
(3946, 172, 'Great Nicobar'),
(3947, 172, 'Hadhdhunmathee'),
(3948, 172, 'Heard'),
(3949, 172, 'Huvadhoo Atoll'),
(3950, 172, 'Ihavandhippolhu Atoll'),
(3951, 172, 'Java'),
(3952, 172, 'Kangaroo'),
(3953, 172, 'Katchall'),
(3954, 172, 'Keeling Islands (Cocos)'),
(3955, 172, 'King'),
(3956, 172, 'Kolhumadulu Atoll'),
(3957, 172, 'Lakshadweep Islands'),
(3958, 172, 'Little Andaman'),
(3959, 172, 'Little Nicobar'),
(3960, 172, 'Lower Andaman'),
(3961, 172, 'Maalhosmadulu Atoll'),
(3962, 172, 'Maamakunudhoo Atoll'),
(3963, 172, 'Madagascar'),
(3964, 172, 'Mahe'),
(3965, 172, 'Maldives'),
(3966, 172, 'Mauritius'),
(3967, 172, 'Mayotte'),
(3968, 172, 'McDonald Islands'),
(3969, 172, 'Melville'),
(3970, 172, 'Middle Andaman'),
(3971, 172, 'Miladhunmafulu Atoll'),
(3972, 172, 'Moheli (Mwali)'),
(3973, 172, 'Molaku Atoll'),
(3974, 172, 'Nancowry'),
(3975, 172, 'Nelsons Island'),
(3976, 172, 'Nias'),
(3977, 172, 'Nicobar Islands'),
(3978, 172, 'Nilandhoo Atoll'),
(3979, 172, 'North Andaman'),
(3980, 172, 'Peros Banhos'),
(3981, 172, 'Phuket'),
(3982, 172, 'Prince Edward Islands'),
(3983, 172, 'Reunion'),
(3984, 172, 'Rodrigues'),
(3985, 172, 'St. Paul'),
(3986, 172, 'Salomon Islands'),
(3987, 172, 'Seychelles'),
(3988, 172, 'Shag'),
(3989, 172, 'Siberut'),
(3990, 172, 'Simeulue'),
(3991, 172, 'Sipura'),
(3992, 172, 'Socotra'),
(3993, 172, 'Sumatra'),
(3994, 172, 'Sri Lanka'),
(3995, 172, 'Tarasa Dwip'),
(3996, 172, 'Tasmania'),
(3997, 172, 'Thiladhunmathee Atoll'),
(3998, 172, 'Three Brothers'),
(3999, 172, 'Timor'),
(4000, 172, 'Tromelin'),
(4001, 172, 'Zanzibar'),
(4002, 173, ''),
(4003, 173, 'Aeolian Islands'),
(4004, 173, 'Alboran'),
(4005, 173, 'Balearic Islands'),
(4006, 173, 'Cabrera'),
(4007, 173, 'Capraia'),
(4008, 173, 'Capri'),
(4009, 173, 'Corse (Corsica)'),
(4010, 173, 'Cyprus'),
(4011, 173, 'Elba'),
(4012, 173, 'Formentera'),
(4013, 173, 'Gozo'),
(4014, 173, 'Ibiza (Ivisa)'),
(4015, 173, 'Jalitah'),
(4016, 173, 'Lampedusa'),
(4017, 173, 'Lipari Islands'),
(4018, 173, 'Mallorca (Majorca)'),
(4019, 173, 'Malta'),
(4020, 173, 'Maltese Islands'),
(4021, 173, 'Menorca (Minorca)'),
(4022, 173, 'Pantelleria'),
(4023, 173, 'Ponziane'),
(4024, 173, 'Salina'),
(4025, 173, 'San Pietro'),
(4026, 173, 'Sardinia (Sardegna)'),
(4027, 173, 'Sicily (Sicilia)'),
(4028, 173, 'Stromboli'),
(4029, 173, 'Vulcano'),
(4030, 173, 'Zembra'),
(4031, 174, ''),
(4032, 174, 'Abaiang'),
(4033, 174, 'Admiralty Islands'),
(4034, 174, 'Aitutaki'),
(4035, 174, 'Alofi'),
(4036, 174, 'Ambrym'),
(4037, 174, 'American Samoa'),
(4038, 174, 'Antipodes'),
(4039, 174, 'Atafu Atoll'),
(4040, 174, 'Atiu'),
(4041, 174, 'Auckland Islands'),
(4042, 174, 'Austral Islands'),
(4043, 174, 'Banaba'),
(4044, 174, 'Bega'),
(4045, 174, 'Bora Bora'),
(4046, 174, 'Bougainville'),
(4047, 174, 'Bounty Islands'),
(4048, 174, 'Campbell'),
(4049, 174, 'Chatham Islands'),
(4050, 174, 'Choiseul'),
(4051, 174, 'Cook Islands'),
(4052, 174, 'Coral Sea Islands'),
(4053, 174, 'Efate'),
(4054, 174, 'Elao'),
(4055, 174, 'Erromango'),
(4056, 174, 'Espiritu Santo'),
(4057, 174, 'Faioa'),
(4058, 174, 'Fakaofo Atoll'),
(4059, 174, 'Fatu Hiva'),
(4060, 174, 'Fiji'),
(4061, 174, 'French Polynesia'),
(4062, 174, 'Funafuti Atoll'),
(4063, 174, 'Futuna'),
(4064, 174, 'Gambier Islands'),
(4065, 174, 'Gau'),
(4066, 174, 'Gilbert Islands'),
(4067, 174, 'Gizo'),
(4068, 174, 'Grand Terre'),
(4069, 174, 'Great Barrier Reef'),
(4070, 174, 'Guadacanal'),
(4071, 174, 'Hatutu'),
(4072, 174, 'Hiva Oa'),
(4073, 174, 'Horne Islands'),
(4074, 174, 'Huahine'),
(4075, 174, 'Isle of Pines'),
(4076, 174, 'Kadavu'),
(4077, 174, 'Karkar'),
(4078, 174, 'Kioa'),
(4079, 174, 'Kiribati'),
(4080, 174, 'Kiritamati'),
(4081, 174, 'Koro'),
(4082, 174, 'Lakeba'),
(4083, 174, 'Lau Group'),
(4084, 174, 'Lifou'),
(4085, 174, 'Line Islands'),
(4086, 174, 'Loyalty Islands'),
(4087, 174, 'Malaita'),
(4088, 174, 'Malekula'),
(4089, 174, 'Malolo'),
(4090, 174, 'Mangaia'),
(4091, 174, 'Manihiki'),
(4092, 174, 'Manuae'),
(4093, 174, 'Mare'),
(4094, 174, 'Marquises Islands'),
(4095, 174, 'Mata Utu'),
(4096, 174, 'Matuku'),
(4097, 174, 'Mauke'),
(4098, 174, 'Maupiti'),
(4099, 174, 'Melanesia'),
(4100, 174, 'Mitiaro'),
(4101, 174, 'Moala'),
(4102, 174, 'Mohotani'),
(4103, 174, 'Moorea'),
(4104, 174, 'Nairai'),
(4105, 174, 'Nanumea Atoll'),
(4106, 174, 'Nassau'),
(4107, 174, 'Nauru'),
(4108, 174, 'Naviti'),
(4109, 174, 'Nepean'),
(4110, 174, 'New Britain'),
(4111, 174, 'New Caledonia'),
(4112, 174, 'New Georgia Islands'),
(4113, 174, 'New Guinea'),
(4114, 174, 'New Ireland'),
(4115, 174, 'Niuas Islands'),
(4116, 174, 'Niuatoputapu'),
(4117, 174, 'Niue'),
(4118, 174, 'Niulakita Atoll'),
(4119, 174, 'Nomuka Island Group'),
(4120, 174, 'Norfolk Islands'),
(4121, 174, 'Nukuaeta'),
(4122, 174, 'Nukufetau Atoll'),
(4123, 174, 'Nuku Hiva'),
(4124, 174, 'Nukulaelae Atoll'),
(4125, 174, 'Nukunono Atoll'),
(4126, 174, 'Ofu'),
(4127, 174, 'Olasega'),
(4128, 174, 'Ono'),
(4129, 174, 'Ouvea'),
(4130, 174, 'Ovalau'),
(4131, 174, 'Palmerston'),
(4132, 174, 'Pangai'),
(4133, 174, 'Penrhyn'),
(4134, 174, 'Philip'),
(4135, 174, 'Phoenix Islands'),
(4136, 174, 'Pitcairn'),
(4137, 174, 'Pitt Island'),
(4138, 174, 'Polynesia'),
(4139, 174, 'Pukapuka'),
(4140, 174, 'Rabi'),
(4141, 174, 'Raiatea'),
(4142, 174, 'Rakahanga'),
(4143, 174, 'Rangiroa'),
(4144, 174, 'Rarotonga'),
(4145, 174, 'Rotuma'),
(4146, 174, 'Samao'),
(4147, 174, 'San Cristobal'),
(4148, 174, 'Santa Cruz Islands'),
(4149, 174, 'Santa Isabel'),
(4150, 174, 'Society Islands'),
(4151, 174, 'Solomon Islands'),
(4152, 174, 'Stewart'),
(4153, 174, 'Suwarrow'),
(4154, 174, 'Tabuaeran'),
(4155, 174, 'Tahaa'),
(4156, 174, 'Tahiti'),
(4157, 174, 'Tahuata'),
(4158, 174, 'Taiohae'),
(4159, 174, 'Tanna'),
(4160, 174, 'Tarawa'),
(4161, 174, 'Tasmania'),
(4162, 174, 'Tau'),
(4163, 174, 'Taveuni'),
(4164, 174, 'Tetiaroa'),
(4165, 174, 'Tokelau'),
(4166, 174, 'Tonga'),
(4167, 174, 'Tongatapu'),
(4168, 174, 'Totoya'),
(4169, 174, 'Tuamotu Islands'),
(4170, 174, 'Tubuai'),
(4171, 174, 'Tupai'),
(4172, 174, 'Tutuila'),
(4173, 174, 'Tuvalu'),
(4174, 174, 'Ua Huka'),
(4175, 174, 'Ua Pou'),
(4176, 174, 'Hiva Oa'),
(4177, 174, 'Upolu'),
(4178, 174, 'Uvea'),
(4179, 174, 'Vaiaku'),
(4180, 174, 'Vanua Balavu'),
(4181, 174, 'Vanua Levu'),
(4182, 174, 'Vanuatu'),
(4183, 174, 'Vatulele'),
(4184, 174, 'Vita Levu'),
(4185, 174, 'Wallis Islands'),
(4186, 174, 'Wallis and Futuna'),
(4187, 174, 'Waya'),
(4188, 174, 'Yasawa'),
(4189, 174, 'Yasawa Group'),
(4190, 175, ''),
(4191, 175, 'Aleutian Islands'),
(4192, 175, 'Alexander Islands'),
(4193, 175, 'Andreanof Islands'),
(4194, 175, 'Babelthuap'),
(4195, 175, 'Baker'),
(4196, 175, 'Bikini'),
(4197, 175, 'Bohol'),
(4198, 175, 'Bonin Islands'),
(4199, 175, 'Cabras'),
(4200, 175, 'Caroline Islands'),
(4201, 175, 'Cebu'),
(4202, 175, 'Channel Islands (US)'),
(4203, 175, 'Cheju Do'),
(4204, 175, 'Chuuk'),
(4205, 175, 'Diomede Islands'),
(4206, 175, 'Guam'),
(4207, 175, 'Hainan'),
(4208, 175, 'Hawaii (big island)'),
(4209, 175, 'Hawaiian Islands'),
(4210, 175, 'Hokkaido'),
(4211, 175, 'Honshu'),
(4212, 175, 'Howland'),
(4213, 175, 'Jaluit Atoll'),
(4214, 175, 'Japan'),
(4215, 175, 'Johnston Atoll'),
(4216, 175, 'Kahoolawe'),
(4217, 175, 'Kauai'),
(4218, 175, 'Kodiak'),
(4219, 175, 'Kosrae'),
(4220, 175, 'Kwajalein Atoll'),
(4221, 175, 'Kyushu'),
(4222, 175, 'Lanai'),
(4223, 175, 'Lifou'),
(4224, 175, 'Loyalty Islands'),
(4225, 175, 'Luzon'),
(4226, 175, 'Maloelap Atoll'),
(4227, 175, 'Majuro Atoll'),
(4228, 175, 'Mare'),
(4229, 175, 'Marshall Islands'),
(4230, 175, 'Maui'),
(4231, 175, 'Micronesia'),
(4232, 175, 'Midway Islands'),
(4233, 175, 'Mili Atoll'),
(4234, 175, 'Mindanao'),
(4235, 175, 'Mindoro'),
(4236, 175, 'Molakai'),
(4237, 175, 'Niihau'),
(4238, 175, 'Near Islands'),
(4239, 175, 'Negros'),
(4240, 175, 'Northern Marianas'),
(4241, 175, 'Nunivak'),
(4242, 175, 'Oahu'),
(4243, 175, 'Okinawa'),
(4244, 175, 'Ostrov Sakhalin'),
(4245, 175, 'Pagan'),
(4246, 175, 'Palau'),
(4247, 175, 'Palawan'),
(4248, 175, 'Palmyra Atoll'),
(4249, 175, 'Panay'),
(4250, 175, 'Philippines'),
(4251, 175, 'Pohnpei'),
(4252, 175, 'Queen Charlotte Islands'),
(4253, 175, 'Rat'),
(4254, 175, 'Rongelap Atoll'),
(4255, 175, 'St. Lawrence'),
(4256, 175, 'St. Matthew'),
(4257, 175, 'St. Paul'),
(4258, 175, 'Saipan'),
(4259, 175, 'Samar'),
(4260, 175, 'San Clemente'),
(4261, 175, 'San Miguel'),
(4262, 175, 'San Nicolas'),
(4263, 175, 'Santa Catalina'),
(4264, 175, 'Santa Cruz'),
(4265, 175, 'Santa Rosa'),
(4266, 175, 'Shikoku'),
(4267, 175, 'Taiwan'),
(4268, 175, 'Tinian'),
(4269, 175, 'Vancouver'),
(4270, 175, 'Volcano Islands'),
(4271, 175, 'Wake Island'),
(4272, 175, 'Yap'),
(4273, 176, ''),
(4274, 176, 'Easter'),
(4275, 176, 'Galapogos Islands'),
(4276, 176, 'Juan Fernandez Islands'),
(4277, 176, 'Isla Espanola'),
(4278, 176, 'Isla Fernandina'),
(4279, 176, 'Isla Genovesa'),
(4280, 176, 'Isla Isabella'),
(4281, 176, 'Isla Marchena'),
(4282, 176, 'Isla Pinta'),
(4283, 176, 'Isla Puna'),
(4284, 176, 'Isla San Cristobal'),
(4285, 176, 'Isla San Salvador'),
(4286, 176, 'Isla Santa Cruz'),
(4287, 176, 'Isla Santa Maria'),
(4288, 176, 'Robinson Crusoe'),
(4289, 176, 'San Felix'),
(4290, 176, 'Santa Clara'),
(4291, 177, ''),
(4292, 177, 'Kabul'),
(4293, 177, ''),
(4294, 177, 'Badakhshan'),
(4295, 177, 'Badghis'),
(4296, 177, 'Baghlan'),
(4297, 177, 'Balkh'),
(4298, 177, 'Bamian'),
(4299, 177, 'Farah'),
(4300, 177, 'Faryab'),
(4301, 177, 'Ghazni'),
(4302, 177, 'Ghowr'),
(4303, 177, 'Helmand'),
(4304, 177, 'Herat'),
(4305, 177, 'Jowzjan'),
(4306, 177, 'Kabol'),
(4307, 177, 'Kandahar'),
(4308, 177, 'Kapisa'),
(4309, 177, 'Khowst'),
(4310, 177, 'Konar'),
(4311, 177, 'Kondoz'),
(4312, 177, 'Laghman'),
(4313, 177, 'Lowgar'),
(4314, 177, 'Nangarhar'),
(4315, 177, 'Nimruz'),
(4316, 177, 'Nurestan'),
(4317, 177, 'Oruzgan'),
(4318, 177, 'Paktia'),
(4319, 177, 'Paktika'),
(4320, 177, 'Parvan'),
(4321, 177, 'Samangan'),
(4322, 177, 'Sar-e Pol'),
(4323, 177, 'Takhar'),
(4324, 177, 'Vardak'),
(4325, 177, 'Zabol'),
(4326, 178, ''),
(4327, 178, 'Yerevan'),
(4328, 178, ''),
(4329, 178, 'Aragatsotn'),
(4330, 178, 'Ararat'),
(4331, 178, 'Armavir'),
(4332, 178, 'Lorri'),
(4333, 178, 'Shirak'),
(4334, 178, 'Tavush'),
(4335, 179, ''),
(4336, 179, 'Baku (Baki)'),
(4337, 179, ''),
(4338, 179, 'Abseron'),
(4339, 179, 'Agcabadi'),
(4340, 179, 'Agdam'),
(4341, 179, 'Agdas'),
(4342, 179, 'Agstafa'),
(4343, 179, 'Agsu'),
(4344, 179, 'Ali Bayramli'),
(4345, 179, 'Astara'),
(4346, 179, 'Balakan'),
(4347, 179, 'Barda'),
(4348, 179, 'Beylaqan'),
(4349, 179, 'Bilasuvar'),
(4350, 179, 'Cabrayil'),
(4351, 179, 'Calilabad'),
(4352, 179, 'Daskasan'),
(4353, 179, 'Davaci'),
(4354, 179, 'Fuzuli'),
(4355, 179, 'Gadabay'),
(4356, 179, 'Ganca'),
(4357, 179, 'Goranboy'),
(4358, 179, 'Goycay'),
(4359, 179, 'Haciqabul'),
(4360, 179, 'Imisli'),
(4361, 179, 'Ismayilli'),
(4362, 179, 'Kalbacar'),
(4363, 179, 'Kurdamir'),
(4364, 179, 'Lacin'),
(4365, 179, 'Lankaran'),
(4366, 179, 'Lankaran'),
(4367, 179, 'Lerik'),
(4368, 179, 'Masalli'),
(4369, 179, 'Mingacevir'),
(4370, 179, 'Naftalan'),
(4371, 179, 'Naxcivan'),
(4372, 179, 'Neftcala'),
(4373, 179, 'Oguz'),
(4374, 179, 'Qabala'),
(4375, 179, 'Qax'),
(4376, 179, 'Qazax'),
(4377, 179, 'Qobustan'),
(4378, 179, 'Quba'),
(4379, 179, 'Qubadli'),
(4380, 179, 'Qusar'),
(4381, 179, 'Saatli'),
(4382, 179, 'Sabirabad'),
(4383, 179, 'Saki');
INSERT INTO `location_province` (`id`, `country_id`, `name`) VALUES
(4384, 179, 'Saki'),
(4385, 179, 'Salyan'),
(4386, 179, 'Samaxi'),
(4387, 179, 'Samkir'),
(4388, 179, 'Samux'),
(4389, 179, 'Siyazan'),
(4390, 179, 'Sumqayit'),
(4391, 179, 'Susa'),
(4392, 179, 'Susa'),
(4393, 179, 'Tartar'),
(4394, 179, 'Tovuz'),
(4395, 179, 'Ucar'),
(4396, 179, 'Xacmaz'),
(4397, 179, 'Xankandi'),
(4398, 179, 'Xanlar'),
(4399, 179, 'Xizi'),
(4400, 179, 'Xocali'),
(4401, 179, 'Xocavand'),
(4402, 179, 'Yardimli'),
(4403, 179, 'Yevlax'),
(4404, 179, 'Yevlax'),
(4405, 179, 'Zangilan'),
(4406, 179, 'Zaqatala'),
(4407, 179, 'Zardab'),
(4408, 180, ''),
(4409, 180, 'Manama'),
(4410, 180, ''),
(4411, 180, 'Al Hadd'),
(4412, 180, 'Al Manamah'),
(4413, 180, 'Al Mintaqah al Gharbiyah'),
(4414, 180, 'Al Mintaqah al Wusta'),
(4415, 180, 'Al Mintaqah ash Shamaliyah'),
(4416, 180, 'Al Muharraq'),
(4417, 180, 'Jidd Hafs'),
(4418, 180, 'Madinat Hamad'),
(4419, 180, 'Juzur Hawar'),
(4420, 180, 'Sitrah'),
(4421, 181, ''),
(4422, 181, 'Nicosia'),
(4423, 181, ''),
(4424, 181, 'Famagusta'),
(4425, 181, 'Kyrenia'),
(4426, 181, 'Larnaca'),
(4427, 181, 'Limassol'),
(4428, 181, 'Paphos'),
(4429, 182, ''),
(4430, 182, 'Tehran'),
(4431, 182, ''),
(4432, 182, 'Ardabil'),
(4433, 182, 'Azarbayjan-e Gharbi'),
(4434, 182, 'Azarbayjan-e Sharqi'),
(4435, 182, 'Bushehr'),
(4436, 182, 'Chahar Mahall va Bakhtiari'),
(4437, 182, 'Esfahan'),
(4438, 182, 'Fars'),
(4439, 182, 'Gilan'),
(4440, 182, 'Golestan'),
(4441, 182, 'Hamadan'),
(4442, 182, 'Hormozgan'),
(4443, 182, 'Ilam'),
(4444, 182, 'Kerman'),
(4445, 182, 'Kermanshah'),
(4446, 182, 'Khorasan'),
(4447, 182, 'Khuzestan'),
(4448, 182, 'Kohkiluyeh va Buyer Ahmad'),
(4449, 182, 'Kordestan'),
(4450, 182, 'Lorestan'),
(4451, 182, 'Markazi'),
(4452, 182, 'Mazandaran'),
(4453, 182, 'Qazvin'),
(4454, 182, 'Qom'),
(4455, 182, 'Semnan'),
(4456, 182, 'Sistan va Baluchestan'),
(4457, 182, 'Yazd'),
(4458, 182, 'Zanjan'),
(4459, 183, ''),
(4460, 183, 'Baghdad'),
(4461, 183, ''),
(4462, 183, 'Al Anbar'),
(4463, 183, 'Al Basrah'),
(4464, 183, 'Al Muthanna'),
(4465, 183, 'Al Qadisiyah'),
(4466, 183, 'An Najaf'),
(4467, 183, 'Arbil'),
(4468, 183, 'As Sulaymaniyah'),
(4469, 183, 'Babil'),
(4470, 183, 'Dahuk'),
(4471, 183, 'Dhi Qar'),
(4472, 183, 'Diyala'),
(4473, 183, 'Maysan'),
(4474, 183, 'Ninawa'),
(4475, 183, 'Salah ad Din'),
(4476, 183, 'Wasit'),
(4477, 184, ''),
(4478, 184, 'Jerusalem'),
(4479, 184, ''),
(4480, 184, 'Central'),
(4481, 184, 'Haifa'),
(4482, 184, 'Northern'),
(4483, 184, 'Southern'),
(4484, 184, 'Tel Aviv'),
(4485, 185, ''),
(4486, 185, 'Amman'),
(4487, 185, ''),
(4488, 185, 'Ajlun'),
(4489, 185, 'Al Karak'),
(4490, 185, 'Al Mafraq'),
(4491, 185, 'At Tafilah'),
(4492, 185, 'Irbid'),
(4493, 185, 'Jarash'),
(4494, 185, 'Madaba'),
(4495, 186, ''),
(4496, 186, 'Kuwait'),
(4497, 186, ''),
(4498, 186, 'Al Ahmadi'),
(4499, 186, 'Al Farwaniyah'),
(4500, 186, 'Hawalli'),
(4501, 187, ''),
(4502, 187, 'Bishkek Shaary'),
(4503, 187, ''),
(4504, 187, 'Batken Oblasty'),
(4505, 187, 'Chuy Oblasty (Bishkek)'),
(4506, 187, 'Jalal-Abad Oblasty'),
(4507, 187, 'Naryn Oblasty'),
(4508, 187, 'Osh Oblasty'),
(4509, 187, 'Talas Oblasty'),
(4510, 187, 'Ysyk-Kol Oblasty (Karakol)'),
(4511, 188, ''),
(4512, 188, 'Beirut'),
(4513, 188, ''),
(4514, 188, 'Beyrouth'),
(4515, 188, 'Beqaa'),
(4516, 188, 'Liban-Nord'),
(4517, 188, 'Liban-Sud'),
(4518, 188, 'Mont-Liban'),
(4519, 188, 'Nabatiye'),
(4520, 189, ''),
(4521, 189, 'Muscat'),
(4522, 189, ''),
(4523, 189, 'Ad Dakhiliyah'),
(4524, 189, 'Al Batinah'),
(4525, 189, 'Al Wusta'),
(4526, 189, 'Ash Sharqiyah'),
(4527, 189, 'Az Zahirah'),
(4528, 189, 'Musandam'),
(4529, 189, 'Zufar'),
(4530, 190, ''),
(4531, 190, 'Islamabad'),
(4532, 190, ''),
(4533, 190, 'Balochistan'),
(4534, 190, 'Federally Administered Tribal Areas'),
(4535, 190, 'North-West Frontier Province'),
(4536, 190, 'Punjab'),
(4537, 190, 'Sindh'),
(4538, 191, ''),
(4539, 191, 'Doha'),
(4540, 191, ''),
(4541, 191, 'Ad Dawhah'),
(4542, 191, 'Al Ghuwayriyah'),
(4543, 191, 'Al Jumayliyah'),
(4544, 191, 'Al Khawr'),
(4545, 191, 'Al Wakrah'),
(4546, 191, 'Ar Rayyan'),
(4547, 191, 'Jarayan al Batinah'),
(4548, 191, 'Madinat ash Shamal'),
(4549, 191, 'Umm Salal'),
(4550, 192, ''),
(4551, 192, 'Riyadh'),
(4552, 192, ''),
(4553, 192, 'Al Bahah'),
(4554, 192, 'Al Hudud ash Shamaliyah'),
(4555, 192, 'Al Jawf'),
(4556, 192, 'Al Madinah'),
(4557, 192, 'Al Qasim'),
(4558, 192, 'Ar Riyad'),
(4559, 192, 'Ash Sharqiyah (Eastern Province)'),
(4560, 192, 'Jizan'),
(4561, 192, 'Makkah'),
(4562, 192, 'Najran'),
(4563, 192, 'Tabuk'),
(4564, 193, ''),
(4565, 193, 'Damascus'),
(4566, 193, ''),
(4567, 193, 'Al Hasakah'),
(4568, 193, 'Al Ladhiqiyah'),
(4569, 193, 'Al Qunaytirah'),
(4570, 193, 'Ar Raqqah'),
(4571, 193, 'Dayr az Zawr'),
(4572, 193, 'Dimashq'),
(4573, 193, 'Halab'),
(4574, 193, 'Hamah'),
(4575, 193, 'Hims'),
(4576, 193, 'Idlib'),
(4577, 193, 'Rif Dimashq'),
(4578, 193, 'Tartus'),
(4579, 194, ''),
(4580, 194, 'Dushanbe'),
(4581, 194, ''),
(4582, 194, 'Viloyati Mukhtori Kuhistoni Badakhshon'),
(4583, 194, 'Viloyati Khatlon'),
(4584, 194, 'Viloyati Sughd'),
(4585, 195, ''),
(4586, 195, 'Ankara'),
(4587, 195, ''),
(4588, 195, 'Adana'),
(4589, 195, 'Adiyaman'),
(4590, 195, 'Afyon'),
(4591, 195, 'Agri'),
(4592, 195, 'Aksaray'),
(4593, 195, 'Amasya'),
(4594, 195, 'Antalya'),
(4595, 195, 'Ardahan'),
(4596, 195, 'Artvin'),
(4597, 195, 'Aydin'),
(4598, 195, 'Balikesir'),
(4599, 195, 'Bartin'),
(4600, 195, 'Batman'),
(4601, 195, 'Bayburt'),
(4602, 195, 'Bilecik'),
(4603, 195, 'Bingol'),
(4604, 195, 'Bitlis'),
(4605, 195, 'Bolu'),
(4606, 195, 'Burdur'),
(4607, 195, 'Bursa'),
(4608, 195, 'Canakkale'),
(4609, 195, 'Cankiri'),
(4610, 195, 'Corum'),
(4611, 195, 'Denizli'),
(4612, 195, 'Diyarbakir'),
(4613, 195, 'Duzce'),
(4614, 195, 'Edirne'),
(4615, 195, 'Elazig'),
(4616, 195, 'Erzincan'),
(4617, 195, 'Erzurum'),
(4618, 195, 'Eskisehir'),
(4619, 195, 'Gaziantep'),
(4620, 195, 'Giresun'),
(4621, 195, 'Gumushane'),
(4622, 195, 'Hakkari'),
(4623, 195, 'Hatay'),
(4624, 195, 'Icel'),
(4625, 195, 'Igdir'),
(4626, 195, 'Isparta'),
(4627, 195, 'Istanbul'),
(4628, 195, 'Izmir'),
(4629, 195, 'Kahramanmaras'),
(4630, 195, 'Karabuk'),
(4631, 195, 'Karaman'),
(4632, 195, 'Kars'),
(4633, 195, 'Kastamonu'),
(4634, 195, 'Kayseri'),
(4635, 195, 'Kilis'),
(4636, 195, 'Kirikkale'),
(4637, 195, 'Kirklareli'),
(4638, 195, 'Kirsehir'),
(4639, 195, 'Kocaeli'),
(4640, 195, 'Konya'),
(4641, 195, 'Kutahya'),
(4642, 195, 'Malatya'),
(4643, 195, 'Manisa'),
(4644, 195, 'Mardin'),
(4645, 195, 'Mugla'),
(4646, 195, 'Mus'),
(4647, 195, 'Nevsehir'),
(4648, 195, 'Nigde'),
(4649, 195, 'Ordu'),
(4650, 195, 'Osmaniye'),
(4651, 195, 'Rize'),
(4652, 195, 'Sakarya'),
(4653, 195, 'Samsun'),
(4654, 195, 'Sanliurfa'),
(4655, 195, 'Siirt'),
(4656, 195, 'Sinop'),
(4657, 195, 'Sirnak'),
(4658, 195, 'Sivas'),
(4659, 195, 'Tekirdag'),
(4660, 195, 'Tokat'),
(4661, 195, 'Trabzon'),
(4662, 195, 'Tunceli'),
(4663, 195, 'Usak'),
(4664, 195, 'Van'),
(4665, 195, 'Yalova'),
(4666, 195, 'Yozgat'),
(4667, 195, 'Zonguldak  Buri'),
(4668, 195, 'Sisaket'),
(4669, 195, 'Songkhla'),
(4670, 195, 'Sukhothai'),
(4671, 195, 'Suphan Buri'),
(4672, 195, 'Surat Thani'),
(4673, 195, 'Surin'),
(4674, 195, 'Tak'),
(4675, 195, 'Trang'),
(4676, 195, 'Trat'),
(4677, 195, 'Ubon Ratchathani'),
(4678, 195, 'Udon Thani'),
(4679, 195, 'Uthai Thani'),
(4680, 195, 'Uttaradit'),
(4681, 195, 'Yala'),
(4682, 195, 'Yasothon'),
(4683, 196, ''),
(4684, 196, 'Ashgabat'),
(4685, 196, ''),
(4686, 196, 'Ahal Welayaty'),
(4687, 196, 'Balkan Welayaty'),
(4688, 196, 'Dasoguz Welayaty'),
(4689, 196, 'Labap Welayaty'),
(4690, 196, 'Mary Welayaty'),
(4691, 197, ''),
(4692, 197, 'Abu Dhabi'),
(4693, 197, ''),
(4694, 197, 'Abu Zaby (Abu Dhabi)'),
(4695, 197, 'Al Fujayrah'),
(4696, 197, 'Ash Shariqah (Sharjah)'),
(4697, 197, 'Dubayy (Dubai)'),
(4698, 197, 'Umm al Qaywayn'),
(4699, 198, ''),
(4700, 198, 'Tashkent (Toshkent)'),
(4701, 198, ''),
(4702, 198, 'Andijon Viloyati'),
(4703, 198, 'Buxoro Viloyati'),
(4704, 198, 'Jizzax Viloyati'),
(4705, 198, 'Namangan Viloyati'),
(4706, 198, 'Navoiy Viloyati'),
(4707, 198, 'Qashqadaryo Viloyati (Qarshi)'),
(4708, 198, 'Samarqand Viloyati'),
(4709, 198, 'Sirdaryo Viloyati (Guliston)'),
(4710, 198, 'Surxondaryo Viloyati (Termiz)'),
(4711, 198, 'Toshkent Shahri'),
(4712, 198, 'Toshkent Viloyati'),
(4713, 198, 'Xorazm Viloyati (Urganch)'),
(4714, 199, ''),
(4715, 199, 'Sanaa'),
(4716, 199, ''),
(4717, 199, 'Abyan'),
(4718, 199, 'Al Hudaydah'),
(4719, 199, 'Al Jawf'),
(4720, 199, 'Al Mahrah'),
(4721, 199, 'Al Mahwit'),
(4722, 199, 'Dhamar'),
(4723, 199, 'Hadramawt'),
(4724, 199, 'Hajjah'),
(4725, 199, 'Ibb'),
(4726, 199, 'Lahij'),
(4727, 199, 'Shabwah'),
(4728, 200, ''),
(4729, 200, 'Hamilton'),
(4730, 200, ''),
(4731, 200, 'Devonshire'),
(4732, 200, 'Hamilton'),
(4733, 200, 'Hamilton'),
(4734, 200, 'Paget'),
(4735, 200, 'Pembroke'),
(4736, 200, 'Saint George'),
(4737, 200, 'Sandys'),
(4738, 200, 'Southampton'),
(4739, 200, 'Warwick'),
(4740, 201, ''),
(4741, 201, 'Ottawa'),
(4742, 201, ''),
(4743, 201, 'Alberta'),
(4744, 201, 'British Columbia'),
(4745, 201, 'Manitoba'),
(4746, 201, 'New Brunswick'),
(4747, 201, 'Newfoundland and Labrador'),
(4748, 201, 'Northwest Territories'),
(4749, 201, 'Nova Scotia'),
(4750, 201, 'Nunavut'),
(4751, 201, 'Ontario'),
(4752, 201, 'Prince Edward Island'),
(4753, 201, 'Quebec'),
(4754, 201, 'Saskatchewan'),
(4755, 201, 'Yukon Territory'),
(4756, 202, ''),
(4757, 202, 'Nuuk (Godthab)'),
(4758, 202, ''),
(4759, 202, 'Avannaa (Nordgronland)'),
(4760, 202, 'Tunu (Ostgronland)'),
(4761, 202, 'Kitaa (Vestgronland)'),
(4762, 203, ''),
(4763, 203, 'Mexico (Distrito Federal)'),
(4764, 203, ''),
(4765, 203, 'Aguascalientes'),
(4766, 203, 'Baja California'),
(4767, 203, 'Baja California Sur'),
(4768, 203, 'Campeche'),
(4769, 203, 'Chiapas'),
(4770, 203, 'Chihuahua'),
(4771, 203, 'Coahuila de Zaragoza'),
(4772, 203, 'Colima'),
(4773, 203, 'Durango'),
(4774, 203, 'Guanajuato'),
(4775, 203, 'Guerrero'),
(4776, 203, 'Hidalgo'),
(4777, 203, 'Jalisco'),
(4778, 203, 'Michoacan de Ocampo'),
(4779, 203, 'Morelos'),
(4780, 203, 'Nayarit'),
(4781, 203, 'Nuevo Leon'),
(4782, 203, 'Oaxaca'),
(4783, 203, 'Puebla'),
(4784, 203, 'Queretaro de Arteaga'),
(4785, 203, 'Quintana Roo'),
(4786, 203, 'San Luis Potosi'),
(4787, 203, 'Sinaloa'),
(4788, 203, 'Sonora'),
(4789, 203, 'Tabasco'),
(4790, 203, 'Tamaulipas'),
(4791, 203, 'Tlaxcala'),
(4792, 203, 'Veracruz-Llave'),
(4793, 203, 'Yucatan'),
(4794, 203, 'Zacatecas'),
(4795, 204, ''),
(4796, 204, 'Washington DC'),
(4797, 204, ''),
(4798, 204, 'Alabama'),
(4799, 204, 'Alaska'),
(4800, 204, 'Arizona'),
(4801, 204, 'Arkansas'),
(4802, 204, 'California'),
(4803, 204, 'Colorado'),
(4804, 204, 'Connecticut'),
(4805, 204, 'Delaware'),
(4806, 204, 'Georgia'),
(4807, 204, 'Kentucky'),
(4808, 204, 'Hawaii'),
(4809, 204, 'Idaho'),
(4810, 204, 'Illinois'),
(4811, 204, 'Indiana'),
(4812, 204, 'Iowa'),
(4813, 204, 'Kansas'),
(4814, 204, 'Kentucky'),
(4815, 204, 'Louisiana'),
(4816, 204, 'Maine'),
(4817, 204, 'Maryland'),
(4818, 204, 'Massachusets'),
(4819, 204, 'Michigan'),
(4820, 204, 'Minnesota'),
(4821, 204, 'Mississippi'),
(4822, 204, 'Missouri'),
(4823, 204, 'Montana'),
(4824, 204, 'Nebraska'),
(4825, 204, 'Nevada'),
(4826, 204, 'New Hampshire'),
(4827, 204, 'New Jersey'),
(4828, 204, 'New Mexico'),
(4829, 204, 'New York'),
(4830, 204, 'North Carolina'),
(4831, 204, 'North Dakota'),
(4832, 204, 'Ohio'),
(4833, 204, 'Oklahoma'),
(4834, 204, 'Oregon'),
(4835, 204, 'Pennsylvania'),
(4836, 204, 'Rhode Island'),
(4837, 204, 'South Carolina'),
(4838, 204, 'South Dakota'),
(4839, 204, 'Tennessee'),
(4840, 204, 'Texas'),
(4841, 204, 'Utah'),
(4842, 204, 'Vermont'),
(4843, 204, 'Virginia'),
(4844, 204, 'Washington'),
(4845, 204, 'West Virginia'),
(4846, 204, 'Wisconsin'),
(4847, 204, 'Wyoming'),
(4848, 205, ''),
(4849, 205, 'Buenos Aires'),
(4850, 205, ''),
(4851, 205, 'Catamarca'),
(4852, 205, 'Chaco'),
(4853, 205, 'Chubut'),
(4854, 205, 'Cordoba'),
(4855, 205, 'Corrientes'),
(4856, 205, 'Entre Rios'),
(4857, 205, 'Formosa'),
(4858, 205, 'Jujuy'),
(4859, 205, 'La Pampa'),
(4860, 205, 'La Rioja'),
(4861, 205, 'Mendoza'),
(4862, 205, 'Misiones'),
(4863, 205, 'Neuquen'),
(4864, 205, 'Rio Negro'),
(4865, 205, 'Salta'),
(4866, 205, 'San Juan'),
(4867, 205, 'San Luis'),
(4868, 205, 'Santa Cruz'),
(4869, 205, 'Santa Fe'),
(4870, 205, 'Santiago del Estero'),
(4871, 205, 'Tucuman'),
(4872, 206, ''),
(4873, 206, 'La Paz'),
(4874, 206, 'Sucre'),
(4875, 206, ''),
(4876, 206, 'Chuquisaca'),
(4877, 206, 'Cochabamba'),
(4878, 206, 'Beni'),
(4879, 206, 'Oruro'),
(4880, 206, 'Pando'),
(4881, 206, 'Potosi'),
(4882, 206, 'Santa Cruz'),
(4883, 206, 'Tarija'),
(4884, 207, ''),
(4885, 207, 'Brasilia'),
(4886, 207, ''),
(4887, 207, 'Acre'),
(4888, 207, 'Alagoas'),
(4889, 207, 'Amapa'),
(4890, 207, 'Amazonas'),
(4891, 207, 'Bahia'),
(4892, 207, 'Ceara'),
(4893, 207, 'Distrito Federal'),
(4894, 207, 'Espirito Santo'),
(4895, 207, 'Goias'),
(4896, 207, 'Maranhao'),
(4897, 207, 'Mato Grosso'),
(4898, 207, 'Mato Grosso do Sul'),
(4899, 207, 'Minas Gerais'),
(4900, 207, 'Para'),
(4901, 207, 'Paraiba'),
(4902, 207, 'Parana'),
(4903, 207, 'Pernambuco'),
(4904, 207, 'Piaui'),
(4905, 207, 'Rio de Janeiro'),
(4906, 207, 'Rio Grande do Norte'),
(4907, 207, 'Rio Grande do Sul'),
(4908, 207, 'Rondonia'),
(4909, 207, 'Roraima'),
(4910, 207, 'Santa Catarina'),
(4911, 207, 'Sao Paulo'),
(4912, 207, 'Sergipe'),
(4913, 207, 'Tocantins'),
(4914, 208, ''),
(4915, 208, 'Santiago'),
(4916, 208, ''),
(4917, 208, 'Antofagasta'),
(4918, 208, 'Araucania'),
(4919, 208, 'Atacama'),
(4920, 208, 'Bio-Bio'),
(4921, 208, 'Coquimbo'),
(4922, 208, 'Los Lagos'),
(4923, 208, 'Maule'),
(4924, 208, 'Tarapaca'),
(4925, 208, 'Valparaiso'),
(4926, 209, ''),
(4927, 209, 'Bogota'),
(4928, 209, ''),
(4929, 209, 'Amazonas'),
(4930, 209, 'Antioquia'),
(4931, 209, 'Arauca'),
(4932, 209, 'Atlantico'),
(4933, 209, 'Bolivar'),
(4934, 209, 'Boyaca'),
(4935, 209, 'Caldas'),
(4936, 209, 'Caqueta'),
(4937, 209, 'Casanare'),
(4938, 209, 'Cauca'),
(4939, 209, 'Cesar'),
(4940, 209, 'Choco'),
(4941, 209, 'Cordoba'),
(4942, 209, 'Cundinamarca'),
(4943, 209, 'Guainia'),
(4944, 209, 'Guaviare'),
(4945, 209, 'Huila'),
(4946, 209, 'La Guajira'),
(4947, 209, 'Magdalena'),
(4948, 209, 'Meta'),
(4949, 209, 'Narino'),
(4950, 209, 'Norte de Santander'),
(4951, 209, 'Putumayo'),
(4952, 209, 'Quindio'),
(4953, 209, 'Risaralda'),
(4954, 209, 'San Andres/Providencia'),
(4955, 209, 'Santander'),
(4956, 209, 'Sucre'),
(4957, 209, 'Tolima'),
(4958, 209, 'Valle del Cauca'),
(4959, 209, 'Vaupes'),
(4960, 209, 'Vichada'),
(4961, 210, ''),
(4962, 210, 'Quito'),
(4963, 210, ''),
(4964, 210, 'Azuay'),
(4965, 210, 'Bolivar'),
(4966, 210, 'Canar'),
(4967, 210, 'Carchi'),
(4968, 210, 'Chimborazo'),
(4969, 210, 'Cotopaxi'),
(4970, 210, 'El Oro'),
(4971, 210, 'Esmeraldas'),
(4972, 210, 'Galapagos'),
(4973, 210, 'Guayas'),
(4974, 210, 'Imbabura'),
(4975, 210, 'Loja'),
(4976, 210, 'Los Rios'),
(4977, 210, 'Manabi'),
(4978, 210, 'Morona-Santiago'),
(4979, 210, 'Napo'),
(4980, 210, 'Orellana'),
(4981, 210, 'Pastaza'),
(4982, 210, 'Pichincha'),
(4983, 210, 'Sucumbios'),
(4984, 210, 'Tungurahua'),
(4985, 210, 'Zamora-Chinchipe'),
(4986, 211, ''),
(4987, 211, 'Georgetown'),
(4988, 211, ''),
(4989, 211, 'Barima-Waini'),
(4990, 211, 'Cuyuni-Mazaruni'),
(4991, 211, 'Demerara-Mahaica'),
(4992, 211, 'East Berbice-Corentyne'),
(4993, 211, 'Essequibo Islands-West Demerara'),
(4994, 211, 'Mahaica-Berbice'),
(4995, 211, 'Pomeroon-Supenaam'),
(4996, 211, 'Potaro-Siparuni'),
(4997, 211, 'Upper Demerara-Berbice'),
(4998, 211, 'Upper Takutu-Upper Essequibo'),
(4999, 212, ''),
(5000, 212, 'Asuncion'),
(5001, 212, ''),
(5002, 212, 'Alto Paraguay'),
(5003, 212, 'Alto Parana'),
(5004, 212, 'Amambay'),
(5005, 212, 'Boqueron'),
(5006, 212, 'Caaguazu'),
(5007, 212, 'Caazapa'),
(5008, 212, 'Canindeyu'),
(5009, 212, 'Central'),
(5010, 212, 'Concepcion'),
(5011, 212, 'Cordillera'),
(5012, 212, 'Guaira'),
(5013, 212, 'Itapua'),
(5014, 212, 'Misiones'),
(5015, 212, 'Neembucu'),
(5016, 212, 'Paraguari'),
(5017, 212, 'Presidente Hayes'),
(5018, 212, 'San Pedro'),
(5019, 213, ''),
(5020, 213, 'Lima'),
(5021, 213, ''),
(5022, 213, 'Amazonas'),
(5023, 213, 'Ancash'),
(5024, 213, 'Apurimac'),
(5025, 213, 'Arequipa'),
(5026, 213, 'Ayacucho'),
(5027, 213, 'Cajamarca'),
(5028, 213, 'Callao'),
(5029, 213, 'Cusco'),
(5030, 213, 'Huancavelica'),
(5031, 213, 'Huanuco'),
(5032, 213, 'Ica'),
(5033, 213, 'Junin'),
(5034, 213, 'La Libertad'),
(5035, 213, 'Lambayeque'),
(5036, 213, 'Loreto'),
(5037, 213, 'Madre de Dios'),
(5038, 213, 'Moquegua'),
(5039, 213, 'Pasco'),
(5040, 213, 'Piura'),
(5041, 213, 'Puno'),
(5042, 213, 'San Martin'),
(5043, 213, 'Tacna'),
(5044, 213, 'Tumbes'),
(5045, 213, 'Ucayali'),
(5046, 214, ''),
(5047, 214, 'Paramaribo'),
(5048, 214, ''),
(5049, 214, 'Brokopondo'),
(5050, 214, 'Commewijne'),
(5051, 214, 'Coronie'),
(5052, 214, 'Marowijne'),
(5053, 214, 'Nickerie'),
(5054, 214, 'Para'),
(5055, 214, 'Saramacca'),
(5056, 214, 'Sipaliwini'),
(5057, 214, 'Wanica'),
(5058, 215, ''),
(5059, 215, 'Montevideo'),
(5060, 215, ''),
(5061, 215, 'Artigas'),
(5062, 215, 'Canelones'),
(5063, 215, 'Cerro Largo'),
(5064, 215, 'Colonia'),
(5065, 215, 'Durazno'),
(5066, 215, 'Flores'),
(5067, 215, 'Florida'),
(5068, 215, 'Lavalleja'),
(5069, 215, 'Maldonado'),
(5070, 215, 'Paysandu'),
(5071, 215, 'Rio Negro'),
(5072, 215, 'Rivera'),
(5073, 215, 'Rocha'),
(5074, 215, 'Salto'),
(5075, 215, 'San Jose'),
(5076, 215, 'Soriano'),
(5077, 215, 'Tacuarembo'),
(5078, 215, 'Treinta y Tres'),
(5079, 216, ''),
(5080, 216, 'Caracas'),
(5081, 216, ''),
(5082, 216, 'Amazonas'),
(5083, 216, 'Anzoategui'),
(5084, 216, 'Apure'),
(5085, 216, 'Aragua'),
(5086, 216, 'Barinas'),
(5087, 216, 'Bolivar'),
(5088, 216, 'Carabobo'),
(5089, 216, 'Cojedes'),
(5090, 216, 'Delta Amacuro'),
(5091, 216, 'Dependencias Federales'),
(5092, 216, 'Distrito Federal'),
(5093, 216, 'Falcon'),
(5094, 216, 'Guarico'),
(5095, 216, 'Lara'),
(5096, 216, 'Merida'),
(5097, 216, 'Miranda'),
(5098, 216, 'Monagas'),
(5099, 216, 'Nueva Esparta'),
(5100, 216, 'Portuguesa'),
(5101, 216, 'Sucre'),
(5102, 216, 'Tachira'),
(5103, 216, 'Trujillo'),
(5104, 216, 'Vargas'),
(5105, 216, 'Yaracuy'),
(5106, 216, 'Zulia');

-- --------------------------------------------------------

--
-- Table structure for table `location_rating`
--

CREATE TABLE `location_rating` (
`lor_id` smallint(6) NOT NULL,
  `lor_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_road_orientation`
--

CREATE TABLE `location_road_orientation` (
`lro_id` smallint(6) NOT NULL,
  `lro_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_status`
--

CREATE TABLE `location_status` (
`lss_id` smallint(6) NOT NULL,
  `lss_description` varchar(255) DEFAULT NULL,
  `lss_voided` tinyint(4) DEFAULT NULL,
  `lss_start_date` datetime DEFAULT NULL,
  `lss_end_date` datetime DEFAULT NULL,
  `lsd_id` smallint(6) DEFAULT NULL COMMENT 'FK: location_status_document'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_status_document`
--

CREATE TABLE `location_status_document` (
`lsd_id` smallint(6) NOT NULL,
  `lsd_url` varchar(255) DEFAULT NULL,
  `lsd_number` varchar(255) DEFAULT NULL,
  `lsd_version` varchar(255) DEFAULT NULL,
  `dos_id` smallint(6) DEFAULT NULL COMMENT 'FK: document_status',
  `lsd_description` varchar(255) DEFAULT NULL,
  `lsd_creator` smallint(6) DEFAULT NULL,
  `lsd_creation_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_type`
--

CREATE TABLE `location_type` (
`lot_id` smallint(6) NOT NULL,
  `lot_description` varchar(255) DEFAULT NULL,
  `mec_id` smallint(6) DEFAULT NULL COMMENT 'FK: madia_category',
  `lot_description2` varchar(255) DEFAULT NULL,
  `lot_telmar_code` varchar(255) DEFAULT NULL,
  `lot_medium_link` tinyint(4) DEFAULT NULL,
  `lot_base_rate` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_type`
--

INSERT INTO `location_type` (`lot_id`, `lot_description`, `mec_id`, `lot_description2`, `lot_telmar_code`, `lot_medium_link`, `lot_base_rate`) VALUES
(1, 'suburb', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintainance`
--

CREATE TABLE `maintainance` (
`id` int(11) NOT NULL,
  `active` enum('y','n') DEFAULT NULL,
  `superuser` varchar(32) DEFAULT NULL,
  `maintainancetext` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintainance`
--

INSERT INTO `maintainance` (`id`, `active`, `superuser`, `maintainancetext`) VALUES
(1, 'n', 'renlok', '<br>\r\n<center>\r\n<b>Under maintainance!!!!!!!</b>\r\n</center>');

-- --------------------------------------------------------

--
-- Table structure for table `mall`
--

CREATE TABLE `mall` (
`mall_id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `mall_name` varchar(255) DEFAULT NULL,
  `mall_latitude` varchar(255) DEFAULT NULL,
  `mall_longitude` varchar(255) DEFAULT NULL,
  `ass_id` int(11) DEFAULT NULL COMMENT 'Mall asset_id (link to asset table record)'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mall`
--

INSERT INTO `mall` (`mall_id`, `user_id`, `mall_name`, `mall_latitude`, `mall_longitude`, `ass_id`) VALUES
(1, 6, 'Fourways Mall', '', '', NULL),
(2, 5, 'Fourways Mall', '', '', NULL),
(3, 5, 'The Boulders Mall (Midrand)', '', '', NULL),
(4, 5, 'Fourways Mall', '', '', NULL),
(5, 5, 'The Boulders Mall (Midrand)', '', '', NULL),
(6, 5, 'Fourways Crossing Mall', '', '', NULL),
(7, 5, 'Fourways Crossing Mall', '', '', NULL),
(8, 5, 'Klerksdop Main Mall', '-26.892679', '26.663818', 24);

-- --------------------------------------------------------

--
-- Table structure for table `mall_levels`
--

CREATE TABLE `mall_levels` (
`mall_level_id` smallint(6) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mall_level_description` varchar(255) DEFAULT NULL,
  `mall_level_floor_name` varchar(255) DEFAULT NULL,
  `mall_level_floor_number` int(11) DEFAULT NULL,
  `mall_level_image_url` varchar(255) DEFAULT NULL,
  `mall_level_asset_count` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mall_levels`
--

INSERT INTO `mall_levels` (`mall_level_id`, `mall_id`, `mall_level_description`, `mall_level_floor_name`, `mall_level_floor_number`, `mall_level_image_url`, `mall_level_asset_count`) VALUES
(1, 7, '', 'Lower Level', -1, '', NULL),
(2, 7, '', 'Upper Level', 1, '', NULL),
(3, 7, '', 'Ground Level', 0, '', NULL),
(4, 2, '', 'Ground Floor', 1, '54e64efe3f254.gif', NULL),
(5, 2, '', 'Lake Level', 2, '54e64f111d4d2.gif', NULL),
(6, 2, '', 'Mezzanine Level', 3, '54e64f2075162.gif', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mall_level_asset`
--

CREATE TABLE `mall_level_asset` (
`mall_level_asset_id` smallint(6) NOT NULL,
  `mall_level_id` smallint(6) DEFAULT NULL COMMENT 'FK: mall levels',
  `asset_id` int(11) NOT NULL,
  `mall_level_asset_x_coordinate` decimal(10,2) DEFAULT NULL,
  `mall_level_asset_y_coordinate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mall_level_asset`
--

INSERT INTO `mall_level_asset` (`mall_level_asset_id`, `mall_level_id`, `asset_id`, `mall_level_asset_x_coordinate`, `mall_level_asset_y_coordinate`) VALUES
(1, 4, 1, 171.00, 124.00),
(2, 4, 1, 85.00, 146.00),
(3, 4, 1, 436.00, 81.00),
(4, 4, 1, 664.00, 88.00),
(5, 4, 1, 294.00, 253.00),
(6, 4, 1, 147.00, 183.00),
(7, 4, 5, 667.00, 154.00);

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
`id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_type`
--

CREATE TABLE `market_type` (
`mat_id` smallint(6) NOT NULL,
  `mat_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_medium_type`
--

CREATE TABLE `master_medium_type` (
`mam_id` smallint(6) NOT NULL,
  `met_description` varchar(255) DEFAULT NULL,
  `met_sequence` varchar(255) DEFAULT NULL,
  `met_auto_editions` tinyint(4) DEFAULT NULL,
  `met_editions_mandatory` tinyint(4) DEFAULT NULL,
  `mef_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_medium_type`
--

INSERT INTO `master_medium_type` (`mam_id`, `met_description`, `met_sequence`, `met_auto_editions`, `met_editions_mandatory`, `mef_id`) VALUES
(1, 'print (traditional)', NULL, NULL, NULL, 2),
(2, 'street assets (digital)', NULL, NULL, NULL, 1),
(3, 'street assets (traditional)', NULL, NULL, NULL, 2),
(6, 'airport (digital)', NULL, NULL, NULL, 1),
(7, 'airport (traditional)', NULL, NULL, NULL, 2),
(8, 'outdoor (digital)', NULL, NULL, NULL, 1),
(9, 'outdoor (traditional)', NULL, NULL, NULL, 2),
(10, 'online', NULL, NULL, NULL, 1),
(11, 'transit (digital)', NULL, NULL, NULL, 1),
(12, 'transit (traditional)', NULL, NULL, NULL, 2),
(13, 'radio', NULL, NULL, NULL, 1),
(14, 'television', NULL, NULL, NULL, 1),
(15, 'Indoor (digital)', NULL, NULL, NULL, 1),
(16, 'Indoor (traditional)', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `measurement_unit`
--

CREATE TABLE `measurement_unit` (
`meu_id` smallint(6) NOT NULL,
  `meu_description` varchar(255) DEFAULT NULL,
  `meu_code` varchar(255) DEFAULT NULL,
  `meu_unit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement_unit`
--

INSERT INTO `measurement_unit` (`meu_id`, `meu_description`, `meu_code`, `meu_unit`) VALUES
(1, 'second', 'SEC', 'second'),
(2, 'minute', 'MIN', 'minute'),
(3, 'hour', 'HR', 'hour'),
(4, 'day', 'DAY', 'day'),
(5, 'week', 'WK', 'week'),
(6, 'fortnight', 'FTN', 'fortnight'),
(7, 'month', 'MONTH', 'month'),
(8, 'year', 'YR', 'year'),
(9, 'centimeter', 'CM', 'centimeter'),
(10, 'meter', 'M', 'metre'),
(11, 'inch', '"', 'inch'),
(12, 'kilometer', 'KM', 'kilometer'),
(13, 'millimeter', 'mm', 'millimeter');

-- --------------------------------------------------------

--
-- Table structure for table `media_categories`
--

CREATE TABLE `media_categories` (
`mec_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mec_time_dependant` int(11) NOT NULL,
  `mec_site_dependant` int(11) NOT NULL,
  `media_family_id` int(11) NOT NULL,
  `mam_id` int(11) NOT NULL,
  `mec_tearsheet_printing` int(11) NOT NULL,
  `mec_editions_mandatory` int(11) NOT NULL,
  `mec_contractor` int(11) NOT NULL,
  `mec_height_dependant` int(11) NOT NULL,
  `mec_interval_billing` int(11) NOT NULL,
  `mec_base_rate` float NOT NULL,
  `mec_rate_card_nett` int(11) NOT NULL,
  `rlm_id` int(11) NOT NULL,
  `mec_export_code` varchar(255) NOT NULL,
  `met_sequence` varchar(255) NOT NULL,
  `met_auto_editions` int(11) NOT NULL,
  `met_editions_mandatory` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_categories`
--

INSERT INTO `media_categories` (`mec_id`, `description`, `mec_time_dependant`, `mec_site_dependant`, `media_family_id`, `mam_id`, `mec_tearsheet_printing`, `mec_editions_mandatory`, `mec_contractor`, `mec_height_dependant`, `mec_interval_billing`, `mec_base_rate`, `mec_rate_card_nett`, `rlm_id`, `mec_export_code`, `met_sequence`, `met_auto_editions`, `met_editions_mandatory`) VALUES
(1, 'poster', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(2, 'bench', 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(3, 'bus (digital)', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(4, 'bus (traditional)', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(5, 'street pole (digital)', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(6, 'street pole (traditional)', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(7, 'bill board (digital)', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(8, 'bill board (traditional)', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(9, 'taxi tv digital network', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(10, 'cafe digital network', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(11, 'magazine advert', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(12, 'print', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(13, 'street assets (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(14, 'street assets (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(15, 'airport (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(16, 'airport (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(17, 'outdoor (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(18, 'outdoor (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(19, 'online', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(20, 'transit (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(21, 'transit (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(22, 'radio', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(23, 'television', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(24, 'indoor (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(25, 'indoor (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `media_categories_copy`
--

CREATE TABLE `media_categories_copy` (
`id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mec_time_dependant` int(11) NOT NULL,
  `mec_site_dependant` int(11) NOT NULL,
  `media_family_id` int(11) NOT NULL,
  `mam_id` int(11) NOT NULL,
  `mec_tearsheet_printing` int(11) NOT NULL,
  `mec_editions_mandatory` int(11) NOT NULL,
  `mec_contractor` int(11) NOT NULL,
  `mec_height_dependant` int(11) NOT NULL,
  `mec_interval_billing` int(11) NOT NULL,
  `mec_base_rate` float NOT NULL,
  `mec_rate_card_nett` int(11) NOT NULL,
  `rlm_id` int(11) NOT NULL,
  `mec_export_code` varchar(255) NOT NULL,
  `met_sequence` varchar(255) NOT NULL,
  `met_auto_editions` int(11) NOT NULL,
  `met_editions_mandatory` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_categories_copy`
--

INSERT INTO `media_categories_copy` (`id`, `description`, `mec_time_dependant`, `mec_site_dependant`, `media_family_id`, `mam_id`, `mec_tearsheet_printing`, `mec_editions_mandatory`, `mec_contractor`, `mec_height_dependant`, `mec_interval_billing`, `mec_base_rate`, `mec_rate_card_nett`, `rlm_id`, `mec_export_code`, `met_sequence`, `met_auto_editions`, `met_editions_mandatory`) VALUES
(1, 'poster', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(2, 'bench', 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(3, 'bus (digital)', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(4, 'bus (traditional)', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(5, 'street pole (digital)', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(6, 'street pole (traditional)', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(7, 'bill board (digital)', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(8, 'bill board (traditional)', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(9, 'taxi tv digital network', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(10, 'cafe digital network', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(11, 'magazine advert', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(12, 'print', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(13, 'street assets (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(14, 'street assets (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(15, 'airport (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(16, 'airport (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(17, 'outdoor (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(18, 'outdoor (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(19, 'online', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(20, 'transit (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(21, 'transit (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(22, 'radio', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(23, 'television', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(24, 'indoor (digital)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0),
(25, 'indoor (traditional)', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `media_category`
--

CREATE TABLE `media_category` (
`mec_id` smallint(6) NOT NULL,
  `mec_description` varchar(255) DEFAULT NULL,
  `mam_id` smallint(6) DEFAULT NULL,
  `mec_tearsheet_printing` tinyint(4) DEFAULT NULL,
  `mec_editions_mandatory` tinyint(4) DEFAULT NULL,
  `mec_contractor` tinyint(4) DEFAULT NULL,
  `mec_time_dependant` tinyint(4) DEFAULT NULL,
  `mec_height_dependant` tinyint(4) DEFAULT NULL,
  `mec_site_dependant` tinyint(4) DEFAULT NULL,
  `mec_interval_billing` tinyint(4) DEFAULT NULL,
  `mec_base_rate` float DEFAULT NULL,
  `mec_rate_card_nett` tinyint(4) DEFAULT NULL,
  `rlm_id` smallint(6) DEFAULT NULL,
  `mec_export_code` varchar(255) DEFAULT NULL,
  `mef_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_category`
--

INSERT INTO `media_category` (`mec_id`, `mec_description`, `mam_id`, `mec_tearsheet_printing`, `mec_editions_mandatory`, `mec_contractor`, `mec_time_dependant`, `mec_height_dependant`, `mec_site_dependant`, `mec_interval_billing`, `mec_base_rate`, `mec_rate_card_nett`, `rlm_id`, `mec_export_code`, `mef_id`) VALUES
(1, 'poster', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3),
(2, 'bench', 2, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3),
(3, 'bus (Digital)', 2, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(4, 'bus (Traditional)', 3, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 2),
(5, 'street pole (Digital)', 2, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(6, 'street pole (Traditional)', 3, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2),
(7, 'bill board (Digital)', 2, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(8, 'bill board (Traditional)', 3, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2),
(9, 'taxi tv digital network', 2, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(10, 'cafe digital network', 2, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(11, 'magazine advert ', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `media_family`
--

CREATE TABLE `media_family` (
  `mef_id` smallint(6) NOT NULL,
  `mef_description` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_family`
--

INSERT INTO `media_family` (`mef_id`, `mef_description`) VALUES
(1, 'digital'),
(2, 'traditional'),
(3, 'print');

-- --------------------------------------------------------

--
-- Table structure for table `membertypes`
--

CREATE TABLE `membertypes` (
`id` int(11) NOT NULL,
  `feedbacks` int(11) NOT NULL DEFAULT '0',
  `membertype` varchar(30) NOT NULL DEFAULT '',
  `discount` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membertypes`
--

INSERT INTO `membertypes` (`id`, `feedbacks`, `membertype`, `discount`, `icon`) VALUES
(14, 49, '10', 0, 'starY.gif'),
(15, 99, '50', 0, 'starB.gif'),
(16, 999, '100', 0, 'starT.gif'),
(17, 4999, '1000', 0, 'starR.gif'),
(19, 24999, '10000', 0, 'starFY.gif'),
(20, 49999, '25000', 0, 'starFT.gif'),
(21, 99999, '50000', 0, 'starFV.gif'),
(22, 999999, '100000', 0, 'starFR.gif'),
(23, 9999, '5000', 0, 'starG.gif'),
(24, 9, '', 0, 'transparent.gif');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
`id` int(50) NOT NULL,
  `sentto` int(25) NOT NULL DEFAULT '0',
  `sentfrom` int(25) NOT NULL DEFAULT '0',
  `fromemail` varchar(50) NOT NULL DEFAULT '',
  `sentat` varchar(20) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `isread` int(1) NOT NULL DEFAULT '0',
  `subject` varchar(50) NOT NULL DEFAULT '',
  `replied` int(1) NOT NULL DEFAULT '0',
  `reply_of` int(50) NOT NULL DEFAULT '0',
  `question` int(15) NOT NULL DEFAULT '0',
  `public` int(1) NOT NULL DEFAULT '0',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sentto`, `sentfrom`, `fromemail`, `sentat`, `message`, `isread`, `subject`, `replied`, `reply_of`, `question`, `public`, `datetime`) VALUES
(1, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 1, 'This is a test emil', 1, 0, 0, 0, '2014-12-07 19:25:03'),
(2, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 1, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(3, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 1, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(4, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 0, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(5, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 0, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(6, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 0, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(7, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 0, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(8, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 0, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(9, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 1, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(10, 7, 7, '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', 1, 'This is a test emil', 1, 0, 0, 0, '2014-11-25 10:34:19'),
(11, 8, 7, '.', '0', 'This is a test emil 2', 0, 'This is a test emil', 0, 0, 0, 0, '2014-11-25 10:34:19'),
(12, 9, 7, '.', '0', 'This is a test sent messages', 0, 'This is a test sent messages', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(13, 7, 9, '.', '0', 'Sample message to the advertiser from Simon\r\nSample message to the advertiser from Simon\r\n\r\nSample message to the advertiser from Simon\r\nSample message to the advertiser from Simon', 0, 'Sample message to the advertiser from Simon', 0, 0, 0, 1, '0000-00-00 00:00:00'),
(14, 9, 5, '.', '0', 'Good day buyer,\n\nPlease note that i have 2 billboards that are in a prime location in the Sandton CBD available from December 1st till Jan 31st 2015 and will be putting these on auction.\n\nLet me know if you want these so I can try to reserve them for you.\n\nRegards\nMedia Owner', 1, 'I have new billboards in sandton', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(15, 7, 7, '.', '0', 'This is a reply to the original email\n\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-11-25 14:34:19\nTo: <developer,advertiser> \nSubject: This is a test emil\n\nThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil\n\n=====================================================', 1, 'RE:This is a test emil ', 0, 1, 0, 0, '0000-00-00 00:00:00'),
(16, 7, 7, '.', '0', 'Replied\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-11-25 14:34:19\nTo: <developer,advertiser> \nSubject: This is a test emil\n\nThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil\n\n=====================================================', 0, 'RE:This is a test emil', 0, 10, 0, 0, '0000-00-00 00:00:00'),
(17, 8, 7, '.', '0', 'Looking for BillboardsLooking for BillboardsLooking for BillboardsLooking for Billboards\nLooking for BillboardsLooking for Billboards', 1, 'Looking for Billboards', 1, 0, 0, 0, '2014-12-07 19:28:47'),
(18, 6, 7, '.', '0', 'FYI\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-12-07 23:28:47\nTo: <developer,media owner> \nSubject: Looking for Billboards\n\nLooking for BillboardsLooking for BillboardsLooking for BillboardsLooking for Billboards\nLooking for BillboardsLooking for Billboards\n\n=====================================================', 1, 'FWD:Looking for Billboards', 1, 17, 0, 0, '2014-12-07 19:31:24'),
(19, 7, 6, '.', '0', 'Got it,\n\nThanks!\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-12-07 23:31:24\nTo: <developer,advertiser> \nSubject: FWD:Looking for Billboards\n\nFYI\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-12-07 23:28:47\nTo: <developer,media owner> \nSubject: Looking for Billboards\n\nLooking for BillboardsLooking for BillboardsLooking for BillboardsLooking for Billboards\nLooking for BillboardsLooking for Billboards\n\n=====================================================\n\n=====================================================', 1, 'RE:FWD:Looking for Billboards', 0, 18, 0, 0, '2014-12-07 20:21:56'),
(20, 5, 6, '.', '0', 'testing from bless', 1, 'testing from bless', 0, 0, 0, 0, '0000-00-00 00:00:00'),
(21, 8, 7, '.', '0', 'This is a test', 0, 'Hello world', 0, 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `messages_cc`
--

CREATE TABLE `messages_cc` (
`id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `sentto_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages_cc`
--

INSERT INTO `messages_cc` (`id`, `message_id`, `sentto_id`) VALUES
(1, 2, 10),
(2, 9, 10),
(3, 10, 10),
(4, 14, 10),
(5, 18, 7),
(6, 19, 8);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
`id` int(32) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `news_date` datetime NOT NULL,
  `suspended` int(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `news_date`, `suspended`, `created_date`, `update_date`) VALUES
(16, 'New Campaign Sample', 'News feed content. Test', '2014-10-10 00:00:00', 1, '2014-10-19 02:48:12', '2014-12-11 07:38:46'),
(17, 'Developer Test', 'This is a test feed', '0000-00-00 00:00:00', 1, '2014-11-14 11:17:42', '2014-12-11 07:40:49'),
(18, 'trymore test', 'trymore test', '0000-00-00 00:00:00', 0, '2014-12-11 07:42:10', '2014-12-11 07:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `news_group_access`
--

CREATE TABLE `news_group_access` (
  `news_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_group_access`
--

INSERT INTO `news_group_access` (`news_id`, `user_type_id`) VALUES
(16, 1),
(16, 2),
(16, 3),
(17, 1),
(18, 1),
(18, 2),
(18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `news_translated`
--

CREATE TABLE `news_translated` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang` char(2) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `online`
--

CREATE TABLE `online` (
`ID` bigint(21) NOT NULL,
  `SESSION` varchar(32) NOT NULL DEFAULT '',
  `time` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `online`
--

INSERT INTO `online` (`ID`, `SESSION`, `time`) VALUES
(35, 'uId-2', 1407880072);

-- --------------------------------------------------------

--
-- Table structure for table `operator_status`
--

CREATE TABLE `operator_status` (
`ops_status_id` smallint(6) NOT NULL,
  `ops_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owner_status`
--

CREATE TABLE `owner_status` (
`ows_id` smallint(6) NOT NULL,
  `ows_description` varchar(255) DEFAULT NULL,
  `ows_authorization` tinyint(4) DEFAULT NULL,
  `ows_update_authorization` tinyint(4) DEFAULT NULL,
  `ost_id` smallint(6) DEFAULT NULL COMMENT 'FK: owner_status_type',
  `ows_import_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owner_status_type`
--

CREATE TABLE `owner_status_type` (
`ost_id` smallint(6) NOT NULL,
  `ost_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_agreement`
--

CREATE TABLE `payment_agreement` (
  `pay_id` tinyint(4) DEFAULT NULL,
  `pay_code` varchar(255) DEFAULT NULL,
  `pay_description` varchar(255) DEFAULT NULL,
  `bal_account_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
`pam_id` smallint(6) NOT NULL,
  `pam_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendingnotif`
--

CREATE TABLE `pendingnotif` (
`id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `winners` text NOT NULL,
  `auction` text NOT NULL,
  `seller` text NOT NULL,
  `thisdate` varchar(8) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
`pro_id` smallint(6) NOT NULL,
  `cam_id` smallint(6) DEFAULT NULL,
  `med_id` smallint(6) DEFAULT NULL,
  `con_id` smallint(6) DEFAULT NULL COMMENT 'links to the contract table',
  `ope_id` smallint(6) DEFAULT NULL COMMENT 'links to the operator table',
  `pro_status_id` smallint(6) DEFAULT NULL,
  `pro_inception_date` varchar(255) DEFAULT NULL,
  `pro_expiry_date` varchar(255) DEFAULT NULL,
  `pro_creation_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `prb_id` smallint(6) DEFAULT NULL COMMENT 'links to the proposal brand table',
  `met_id` smallint(6) DEFAULT NULL,
  `pro_creator_use_id` smallint(6) DEFAULT NULL,
  `pro_proportion_cost` tinyint(4) DEFAULT NULL,
  `pro_provisional_booking_id` tinyint(4) DEFAULT NULL,
  `prd_id` smallint(6) DEFAULT NULL COMMENT 'links to the proposal division table',
  `prt_id` smallint(6) DEFAULT NULL,
  `lon` varchar(20) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `p_assets` varchar(120) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`pro_id`, `cam_id`, `med_id`, `con_id`, `ope_id`, `pro_status_id`, `pro_inception_date`, `pro_expiry_date`, `pro_creation_date`, `prb_id`, `met_id`, `pro_creator_use_id`, `pro_proportion_cost`, `pro_provisional_booking_id`, `prd_id`, `prt_id`, `lon`, `lat`, `p_assets`) VALUES
(1, 74, NULL, NULL, NULL, NULL, NULL, NULL, '2014-10-24 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.11585880000007', '-26.1948812', ',16'),
(2, 75, 5, NULL, NULL, 1, NULL, NULL, '2014-12-11 04:51:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-99.13320799999997', '19.4326077', ',6'),
(3, 70, 8, NULL, NULL, NULL, NULL, NULL, '2014-11-07 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',15'),
(4, 70, 5, NULL, NULL, NULL, NULL, NULL, '2014-11-07 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',16'),
(5, 73, 5, NULL, NULL, NULL, NULL, NULL, '2014-11-12 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',14'),
(6, 76, 5, NULL, NULL, NULL, NULL, NULL, '2014-11-21 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',1'),
(7, 76, 8, NULL, NULL, NULL, NULL, NULL, '2014-11-21 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',7,8'),
(8, 80, 8, NULL, NULL, NULL, NULL, NULL, '2015-01-03 20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',9,15'),
(9, 80, 5, NULL, NULL, NULL, NULL, NULL, '2015-01-04 15:50:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.056700699999965', '-26.1075663', ',16,9,15'),
(10, 150, 5, NULL, NULL, 1, NULL, NULL, '2015-01-10 14:10:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28.006389', '-26.093611', ',4,11');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_details`
--

CREATE TABLE `proposal_details` (
`trans_id` int(10) NOT NULL,
  `pd_use_id` int(10) NOT NULL,
  `pd_ass_id` int(10) NOT NULL,
  `pd_available_from` int(2) NOT NULL,
  `pd_available_to` int(2) NOT NULL,
  `pd_price` decimal(15,2) NOT NULL,
  `pd_prop_id` int(10) NOT NULL,
  `pd_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposal_details`
--

INSERT INTO `proposal_details` (`trans_id`, `pd_use_id`, `pd_ass_id`, `pd_available_from`, `pd_available_to`, `pd_price`, `pd_prop_id`, `pd_date`) VALUES
(1, 8, 9, 46, 47, 2000.00, 3, '2014-11-05'),
(2, 8, 15, 46, 48, 2000.00, 3, '2014-11-05'),
(3, 5, 6, 50, 51, 5000.00, 2, '2014-12-11'),
(4, 5, 11, 3, 3, 6500.00, 10, '2015-01-10'),
(5, 5, 4, 3, 3, 5000.00, 10, '2015-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_number_specification`
--

CREATE TABLE `proposal_number_specification` (
`pns_id` smallint(6) NOT NULL,
  `pns_starting_date` date DEFAULT NULL,
  `pns_last_date_used` date DEFAULT NULL,
  `pns_starting_number` varchar(255) DEFAULT NULL,
  `pns_ending_number` varchar(255) DEFAULT NULL,
  `pns_warning_number` varchar(255) DEFAULT NULL,
  `pns_increment_number` int(11) DEFAULT NULL,
  `pns_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_status`
--

CREATE TABLE `proposal_status` (
`pro_status_id` smallint(6) NOT NULL,
  `prs_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposal_status`
--

INSERT INTO `proposal_status` (`pro_status_id`, `prs_description`) VALUES
(1, 'Proposal Sent To Media Owner'),
(2, 'Proposal Sent Back To Operator'),
(3, 'Proposal Sent Back To Media Owner For Corrections'),
(4, 'Artwork Required');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_type`
--

CREATE TABLE `proposal_type` (
`prt_id` smallint(6) NOT NULL,
  `prt_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
`pro_id` smallint(6) NOT NULL,
  `pro_name` varchar(255) DEFAULT NULL,
  `cou_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`pro_id`, `pro_name`, `cou_id`) VALUES
(3, 'Gauteng', 1),
(4, 'KwaZulu-Natal', 1),
(5, 'Limpopo', 1),
(6, 'Mpumalanga', 1),
(7, 'North West', 1),
(8, 'Northern Cape', 1),
(9, 'Western Cape', 1);

-- --------------------------------------------------------

--
-- Table structure for table `proxybid`
--

CREATE TABLE `proxybid` (
  `itemid` int(32) DEFAULT NULL,
  `userid` int(32) DEFAULT NULL,
  `bid` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
`id` int(11) NOT NULL,
  `ime` tinytext NOT NULL,
  `valuta` tinytext NOT NULL,
  `symbol` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `ime`, `valuta`, `symbol`) VALUES
(1, 'Great Britain', 'Pound Sterling ', 'GBP'),
(2, 'Argentina', 'Argentinian Peso', 'ARS'),
(3, 'Australia', 'Australian Dollar ', 'AUD'),
(4, 'Burma', 'Myanmar (Burma) Kyat', 'MMK'),
(5, 'Brazil', 'Brazilian Real ', 'BRL'),
(6, 'Chile', 'Chilean Peso ', 'CLP'),
(7, 'China', 'Chinese Renminbi ', 'CNY'),
(8, 'Colombia', 'Colombian Peso ', 'COP'),
(9, 'Neth. Antilles', 'Neth. Antilles Guilder', 'ANG'),
(10, 'Czech. Republic', 'Czech. Republic Koruna ', 'CZK'),
(11, 'Denmark', 'Danish Krone ', 'DKK'),
(12, 'European Union', 'EURO', 'EUR'),
(13, 'Fiji', 'Fiji Dollar ', 'FJD'),
(14, 'Jamaica', 'Jamaican Dollar', 'JMD'),
(15, 'Trinidad & Tobago', 'Trinidad & Tobago Dollar', 'TTD'),
(16, 'Hong Kong', 'Hong Kong Dollar', 'HKD'),
(17, 'Ghana', 'Ghanaian Cedi', 'GHC'),
(18, 'Iceland', 'Icelandic Krona ', 'INR'),
(19, 'India', 'Indian Rupee', 'INR'),
(20, 'Indonesia', 'Indonesian Rupiah ', 'IDR'),
(21, 'Israel', 'Israeli New Shekel ', 'ILS'),
(22, 'Japan', 'Japanese Yen', 'JPY'),
(23, 'Malaysia', 'Malaysian Ringgit', 'MYR'),
(24, 'Mexico', 'New Peso', 'MXN'),
(25, 'Morocco', 'Moroccan Dirham ', 'MAD'),
(26, 'Honduras', 'Honduras Lempira', 'HNL'),
(27, 'Hungaria', 'Hungarian Forint', 'HUF'),
(28, 'New Zealand', 'New Zealand Dollar', 'NZD'),
(29, 'Norway', 'Norwege Krone', 'NOK'),
(30, 'Pakistan', 'Pakistan Rupee ', 'PKR'),
(31, 'Panama', 'Panamanian Balboa ', 'PAB'),
(32, 'Peru', 'Peruvian New Sol', 'PEN'),
(33, 'Philippine', 'Philippine Peso ', 'PHP'),
(34, 'Poland', 'Polish Zloty', 'PLN'),
(35, 'Russian', 'Russian Rouble', 'RUR'),
(36, 'Singapore', 'Singapore Dollar ', 'SGD'),
(37, 'Slovakia', 'Koruna', 'SKK'),
(38, 'Slovenia', 'Slovenian Tolar', 'SIT'),
(39, 'South Africa', 'South African Rand', 'ZAR'),
(40, 'South Korea', 'South Korean Won', 'KRW'),
(41, 'Sri Lanka', 'Sri Lanka Rupee ', 'LKR'),
(42, 'Sweden', 'Swedish Krona', 'SEK'),
(43, 'Switzerland', 'Swiss Franc', 'CHF'),
(44, 'Taiwan', 'Taiwanese New Dollar ', 'TWD'),
(45, 'Thailand', 'Thailand Thai Baht ', 'THB'),
(46, 'Pacific Financial Community', 'Pacific Financial Community Franc', 'CFP'),
(47, 'Tunisia', 'Tunisisan Dinar', 'TND'),
(48, 'Turkey', 'Turkish Lira', 'TRL'),
(49, 'United States', 'U.S. Dollar', 'USD'),
(50, 'Venezuela', 'Bolivar ', 'VEB'),
(51, 'Bahamas', 'Bahamian Dollar', 'BSD'),
(52, 'Croatia', 'Croatian Kuna', 'HRK'),
(53, 'East Caribe', 'East Caribbean Dollar', 'XCD'),
(54, 'CFA Franc (African Financial Community)', 'African Financial Community Franc', 'CFA'),
(55, 'Canadian', 'Canadian Dollar', 'CAD');

-- --------------------------------------------------------

--
-- Table structure for table `rate_card`
--

CREATE TABLE `rate_card` (
`rat_id` smallint(6) NOT NULL,
  `rat_description` varchar(255) DEFAULT NULL,
  `rat_rate` float DEFAULT NULL,
  `spd_id` smallint(6) DEFAULT NULL COMMENT 'FK: special_deal',
  `cur_id_customer` smallint(6) DEFAULT NULL,
  `cur_id_owner` smallint(6) DEFAULT NULL,
  `rat_value_BCY` smallint(6) DEFAULT NULL,
  `bis_id` smallint(6) DEFAULT NULL,
  `meu_id` smallint(6) DEFAULT NULL,
  `tax_id` smallint(6) DEFAULT NULL,
  `rat_frequency` int(11) DEFAULT NULL,
  `rat_time_slot` decimal(3,3) DEFAULT NULL,
  `ass_id` smallint(6) DEFAULT NULL,
  `ras_id` smallint(6) DEFAULT NULL,
  `rat_quantity` decimal(9,3) DEFAULT NULL,
  `rlm_id` smallint(6) DEFAULT NULL,
  `rat_start_date` date DEFAULT NULL,
  `rat_end_date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_card`
--

INSERT INTO `rate_card` (`rat_id`, `rat_description`, `rat_rate`, `spd_id`, `cur_id_customer`, `cur_id_owner`, `rat_value_BCY`, `bis_id`, `meu_id`, `tax_id`, `rat_frequency`, `rat_time_slot`, `ass_id`, `ras_id`, `rat_quantity`, `rlm_id`, `rat_start_date`, `rat_end_date`) VALUES
(1, 'Premium ', 122, 1, NULL, 5, 100, NULL, 7, NULL, 10, NULL, 5, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rate_card_bk_2014-11-22`
--

CREATE TABLE `rate_card_bk_2014-11-22` (
`rat_id` smallint(6) NOT NULL,
  `rat_description` varchar(255) DEFAULT NULL,
  `rat_rate` float DEFAULT NULL,
  `spd_id` smallint(6) DEFAULT NULL COMMENT 'FK: special_deal',
  `cur_id_customer` smallint(6) DEFAULT NULL,
  `cur_id_owner` smallint(6) DEFAULT NULL,
  `rat_value_BCY` smallint(6) DEFAULT NULL,
  `bis_id` smallint(6) DEFAULT NULL,
  `meu_id` smallint(6) DEFAULT NULL,
  `tax_id` smallint(6) DEFAULT NULL,
  `rat_frequency` int(11) DEFAULT NULL,
  `rat_time_slot` decimal(3,3) DEFAULT NULL,
  `ass_id` smallint(6) DEFAULT NULL,
  `ras_id` smallint(6) DEFAULT NULL,
  `rat_quantity` decimal(9,3) DEFAULT NULL,
  `rlm_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_card_bk_2014-11-22`
--

INSERT INTO `rate_card_bk_2014-11-22` (`rat_id`, `rat_description`, `rat_rate`, `spd_id`, `cur_id_customer`, `cur_id_owner`, `rat_value_BCY`, `bis_id`, `meu_id`, `tax_id`, `rat_frequency`, `rat_time_slot`, `ass_id`, `ras_id`, `rat_quantity`, `rlm_id`) VALUES
(1, 'Premium ', 122, 1, NULL, 5, 100, NULL, 7, NULL, 10, NULL, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rate_card_loading_method`
--

CREATE TABLE `rate_card_loading_method` (
`rlm_id` smallint(6) NOT NULL,
  `rlm_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_card_status`
--

CREATE TABLE `rate_card_status` (
  `ras_id` smallint(6) NOT NULL,
  `ras_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate_type`
--

CREATE TABLE `rate_type` (
`rat_id` smallint(6) NOT NULL,
  `rat_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rememberme`
--

CREATE TABLE `rememberme` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `hashkey` char(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `responsibility_center`
--

CREATE TABLE `responsibility_center` (
`rec_id` smallint(6) NOT NULL,
  `rec_name` varchar(255) DEFAULT NULL,
  `loc_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rfp`
--

CREATE TABLE `rfp` (
`rfp_id` int(6) NOT NULL,
  `budget` int(11) NOT NULL,
  `respond_date` date NOT NULL,
  `use_id` int(6) NOT NULL,
  `title` varchar(30) NOT NULL,
  `camp_descriptor` varchar(40) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration` int(6) NOT NULL,
  `ast_id` varchar(20) NOT NULL,
  `rfp_status_id` int(6) NOT NULL,
  `m_owners` varchar(50) NOT NULL,
  `p_assets` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp`
--

INSERT INTO `rfp` (`rfp_id`, `budget`, `respond_date`, `use_id`, `title`, `camp_descriptor`, `start_date`, `end_date`, `duration`, `ast_id`, `rfp_status_id`, `m_owners`, `p_assets`) VALUES
(3, 10000, '2014-09-04', 6, 'trymore test', 'ujkjok', '2014-09-04', '2014-09-04', 0, '3', 0, '0', '0'),
(4, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(5, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(6, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(7, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(8, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(9, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(10, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(11, 10000, '2014-09-05', 6, 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', 0, '3', 0, '0', '0'),
(32, 40000, '2014-09-19', 6, 'trymore test', 'efff', '2014-09-19', '2014-09-19', 0, '3', 0, '0', '0'),
(33, 40000, '2014-10-07', 6, 'trymore test', 'qsqs', '2014-10-07', '2014-10-07', 0, '3', 0, '0', '0'),
(34, 444444444, '2014-10-07', 6, 'trymore test', 'soft test', '2014-10-07', '2014-10-07', 0, '3', 0, '0', '0'),
(35, 444444444, '2014-10-07', 6, 'trymore test', 'soft test', '2014-10-07', '2014-10-07', 0, '3', 0, '0', '0'),
(36, 444444444, '2014-10-07', 6, 'trymore test', 'soft test', '2014-10-07', '2014-10-07', 0, '3', 0, '0', '0'),
(37, 444444444, '2014-10-07', 6, 'trymore test', 'soft test', '2014-10-07', '2014-10-07', 0, '3', 0, '0', '0'),
(38, 444444444, '2014-10-07', 6, 'trymore test', 'soft test', '2014-10-07', '2014-10-07', 0, '3', 0, '0', '0'),
(41, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(42, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(43, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(44, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(45, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(46, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(47, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(48, 200000, '2014-10-08', 6, 'trymore test', 'wdede', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(49, 5000000, '2014-10-08', 6, 'trymore test', 'rfrfrf', '2014-10-08', '2014-10-08', 0, '3', 0, '0', '0'),
(50, 5000000, '2014-10-09', 6, 'trymore test', 'r4r4r4', '2014-10-09', '2014-10-09', 0, '3', 0, '0', '0'),
(52, 5000000, '2014-10-09', 6, 'trymore test', 'www', '2014-10-09', '2014-10-09', 0, '3', 0, '0', '0'),
(53, 5000000, '2014-10-09', 6, 'trymore test', 'www', '2014-10-09', '2014-10-09', 0, '3', 0, '0', '0'),
(54, 90000000, '2014-10-09', 6, 'trymore test', 'soft test          ', '2014-10-09', '2014-10-09', 0, '3', 0, '0', '0'),
(55, 5000000, '2014-10-15', 6, 'trymore test', '                               trymore t', '2014-10-15', '2014-10-15', 0, '3', 0, '0', '0'),
(65, 200000, '2014-10-16', 6, 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', 0, '3', 0, '0', '0'),
(66, 200000, '2014-10-16', 6, 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', 0, '3', 0, '0', '0'),
(67, 200000, '2014-10-16', 6, 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', 0, '3', 0, '0', '0'),
(68, 200000, '2014-10-16', 6, 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', 0, '3', 0, '0', '0'),
(69, 200000, '2014-10-16', 6, 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', 0, '3', 0, '0', '0'),
(70, 40000, '2014-10-16', 6, 'trymore test', 'testingi             ', '2014-10-16', '2014-10-16', 0, '3', 0, '0', '0'),
(71, 7500000, '2014-10-17', 6, 'trymore test', 'harare, zimbabwe                        ', '2014-10-17', '2014-10-17', 0, '3', 0, '0', '0'),
(72, 10000, '2014-10-17', 6, 'trymore test', 'fake                            ', '2014-10-17', '2014-10-17', 0, '3', 0, '0', '0'),
(73, 80000, '2014-10-17', 6, 'trymore test', 'very last test                          ', '2014-10-17', '2014-10-17', 0, '3', 0, '0', '0'),
(74, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(75, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(76, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(77, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(78, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(79, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(80, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(81, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(82, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(83, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(84, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(85, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(86, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(87, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(88, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(89, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(90, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(91, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(92, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(93, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(94, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(95, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(96, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(97, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(98, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(99, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(100, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(101, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(102, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(103, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(104, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(105, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(106, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(107, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(108, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(109, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(110, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(111, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(112, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(113, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(114, 3000, '2014-10-18', 5, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(115, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(116, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(117, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(118, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(119, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(120, 10000, '2014-10-18', 7, 'trymore test', 'ujkjok', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(121, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(122, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(123, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(124, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(125, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(126, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(127, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(128, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(129, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(130, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(131, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(132, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(133, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(134, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(135, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(136, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(137, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(138, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(139, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(140, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(141, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(142, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(143, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(144, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(145, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(146, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(147, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(148, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(149, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(150, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(151, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(152, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(153, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(154, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(155, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(156, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(157, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(158, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(159, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(160, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(161, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(162, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(163, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(164, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(165, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(166, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(167, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(168, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(169, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(170, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(171, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(172, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(173, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(174, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(175, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(176, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(177, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(178, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(179, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(180, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(181, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(182, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(183, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(184, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(185, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(186, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(187, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(188, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(189, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(190, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(191, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(192, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(193, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(194, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(195, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '0', '0'),
(196, 3000, '2014-10-18', 7, 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', 0, '3', 0, '', ''),
(197, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(198, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(199, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(200, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(201, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(202, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(203, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(204, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(205, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(206, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(207, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(208, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(209, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(210, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(214, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(215, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(216, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(217, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(218, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(219, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(220, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(221, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(222, 3000, '2014-10-19', 5, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(223, 3000, '2014-10-19', 5, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(224, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(225, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(226, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(227, 3000, '2014-10-19', 5, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(228, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(229, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(230, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(231, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(232, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(233, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(234, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(235, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(236, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(237, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(238, 3000, '2014-10-19', 7, 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(239, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(240, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(241, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(242, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(243, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(244, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(245, 450000, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(246, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(247, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(248, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(249, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(250, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(251, 0, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(252, 450000, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(253, 450000, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(254, 450000, '2014-10-19', 7, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(255, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(256, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(257, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(258, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(259, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(260, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(261, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(262, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(263, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(264, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(265, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(266, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(267, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(268, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(269, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(270, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(271, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(272, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(273, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(274, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(275, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(276, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(277, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(278, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(279, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(280, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(281, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(282, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(283, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(284, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(285, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(286, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(287, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(288, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(289, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(290, 10000000, '2014-10-19', 7, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(291, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(292, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(293, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(294, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(295, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(296, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(297, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(298, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(299, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(300, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(301, 10000000, '2014-10-19', 6, 'trymore test', 'Test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(302, 0, '2014-10-19', 5, 'trymore test', '<div style=', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(303, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(304, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(305, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(306, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(307, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(308, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(309, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(310, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(311, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(312, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(313, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(314, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(315, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(316, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(317, 450000, '2014-10-19', 7, 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', 0, '3', 0, '', ''),
(318, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(319, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(320, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(321, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(322, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(323, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(324, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(325, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(326, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(327, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(328, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(329, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(330, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(331, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(332, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(333, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(334, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(335, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(336, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(337, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(338, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(339, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(340, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(341, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(342, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(343, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(344, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(345, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(346, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(347, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(348, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(349, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(350, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(351, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(352, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(353, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(354, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(355, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(356, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(357, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(358, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(359, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(360, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(361, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(362, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(363, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(364, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(365, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(366, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(367, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(368, 450000, '2014-10-20', 7, 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', 0, '3', 0, '', ''),
(369, 90000000, '2014-11-09', 6, 'trymore test', '                              muvindi   ', '2014-11-09', '2014-11-09', 0, '3', 0, '', ''),
(370, 10000, '2014-11-11', 6, 'trymore test', '           dcdcd                        ', '2014-11-11', '2014-11-11', 0, '3', 0, '', ''),
(371, 5000000, '2014-11-12', 6, 'trymore test', '                  dedede                ', '2014-11-12', '2014-11-12', 0, '3', 0, '', ''),
(372, 55, '2014-11-13', 6, 'trymore test', '                                       h', '2014-11-13', '2014-11-13', 0, '3', 0, '', ''),
(373, 55, '2014-11-13', 6, 'trymore test', '                                       h', '2014-11-13', '2014-11-13', 0, '3', 0, '', ''),
(374, 90000000, '2014-11-14', 6, 'trymore test', 'soft test              ', '2014-11-14', '2014-11-14', 0, '3', 0, '', ''),
(375, 90000000, '2014-11-14', 6, 'trymore test', 'soft test              ', '2014-11-14', '2014-11-14', 0, '3', 0, '', ''),
(376, 10000, '2014-11-20', 6, 'trymore test', 'shdd', '2014-11-20', '2014-11-20', 0, '3', 0, '', ''),
(377, 20000, '2014-12-01', 7, 'trymore test', 'testing', '2014-12-01', '2014-12-01', 0, '3', 0, '', ''),
(378, 20000, '2014-12-01', 7, 'trymore test', 'testing', '2014-12-01', '2014-12-01', 0, '3', 0, '', ''),
(379, 20000, '2014-12-01', 7, 'trymore test', 'testing', '2014-12-01', '2014-12-01', 0, '3', 0, '', ''),
(380, 200000, '2014-12-02', 6, 'trymore test', ' test                                   ', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(381, 23, '2014-12-02', 6, 'trymore test', '                dsa                     ', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(382, 200000, '2014-12-02', 6, 'trymore test', ' test                                   ', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(384, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(385, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(386, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(387, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(388, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(389, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(390, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(391, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(392, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(393, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(394, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(395, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(396, 20000, '2014-12-02', 6, 'trymore test', 'testing', '2014-12-02', '2014-12-02', 0, '3', 0, '', ''),
(397, 20000, '2014-12-03', 7, 'trymore test', 'testing', '2014-12-03', '2014-12-03', 0, '3', 0, '', ''),
(398, 20000, '2014-12-03', 7, 'trymore test', 'testing', '2014-12-03', '2014-12-03', 0, '3', 0, '', ''),
(399, 5000, '2014-12-04', 7, 'TEST RFP 1', 'TEST Campaign 1', '2014-12-14', '2014-12-28', 1, '', 1, '', ''),
(400, 20000, '2014-12-03', 7, 'trymore test', 'testing', '2014-12-03', '2014-12-03', 0, '3', 0, '', ''),
(401, 20000, '2014-12-03', 7, 'trymore test', 'testing', '2014-12-03', '2014-12-03', 0, '3', 0, '', ''),
(402, 20000, '2014-12-03', 7, 'trymore test', 'testing', '2014-12-03', '2014-12-03', 0, '3', 0, '', ''),
(410, 20000, '2014-12-09', 7, 'trymore test', 'testing', '2014-12-09', '2014-12-09', 0, '3', 0, '', ''),
(412, 350000, '2014-12-31', 6, 'Liberty Hospital Cash back pla', 'Introducing the new liberty hopsital cas', '2014-11-30', '2015-01-31', 0, '3', 0, '', ''),
(413, 500000, '2014-12-29', 6, 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(414, 500000, '2014-12-29', 6, 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(415, 500000, '2014-12-29', 6, 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(416, 500000, '2014-12-29', 6, 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(417, 200000, '2014-12-29', 6, 'trymore test', 'test stuff                              ', '2014-12-29', '2014-12-29', 0, '3', 0, '', ''),
(418, 350000, '2014-12-29', 6, 'trymore test', 'Google_Radio_TV_Youtube_Twitter_Other Ca', '2014-12-29', '2014-12-29', 0, '3', 0, '', ''),
(419, 350000, '2014-12-29', 6, 'trymore test', 'Google_Radio_TV_Youtube_Twitter_Other Ca', '2014-12-29', '2014-12-29', 0, '3', 0, '', ''),
(420, 200000, '2014-12-29', 6, 'trymore test', 'yes test                                ', '2014-12-29', '2014-12-29', 0, '3', 0, '', ''),
(421, 45000, '2014-12-30', 6, 'trymore test', 'Test 5  ', '2014-12-30', '2014-12-30', 0, '3', 0, '', ''),
(422, 350000, '2014-12-31', 6, 'trymore test', '               blue_icon.png            ', '2014-12-31', '2014-12-31', 0, '3', 0, '', ''),
(423, 350000, '2014-12-31', 6, 'trymore test', '                                        ', '2014-12-31', '2014-12-31', 0, '3', 0, '', ''),
(424, 350000, '2015-01-31', 6, 'Test Campaign 2', 'description description', '2014-12-01', '2015-01-31', 0, '3', 0, '', ''),
(425, 45000, '2015-01-05', 6, 'Test Campaign 4', 'yrdy', '2015-01-01', '2015-02-28', 0, '3', 0, '', ''),
(426, 200000, '0000-00-00', 6, 'tst', 'mhkjhvjhgv', '0000-00-00', '0000-00-00', 0, '3', 0, '', ''),
(456, 150000, '2015-01-10', 6, 'Audi Ad Campaign', 'Audi Ad Campaign description', '2015-01-01', '2015-02-28', 0, '3', 0, '', ''),
(471, 20000, '0000-00-00', 7, '0', '0', '0000-00-00', '0000-00-00', 0, '3', 0, '', ''),
(472, 135000, '2015-01-10', 7, 'BMW Ad Campaign', 'BMW Ad Campaign description', '2015-01-01', '2015-02-28', 0, '3', 0, '', ''),
(473, 135000, '2015-01-10', 7, 'BMW Ad Campaign', 'BMW Ad Campaign description', '2015-01-01', '2015-02-28', 0, '3', 0, '', ''),
(474, 100000, '2015-01-31', 6, 'Indigo Jan Ad', 'jhbkjvmnv', '2015-01-31', '2015-02-28', 0, '3', 0, '', ''),
(475, 250000, '2015-01-12', 7, 'Samsung Galaxy Note 4', 'Samsung Galaxy Note 4', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(476, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(477, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(478, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(479, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(480, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(481, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(482, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(483, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(484, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(485, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(486, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(487, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(488, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(489, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(490, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(491, 250000, '2015-01-12', 7, 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', 0, '3', 0, '', ''),
(492, 125000, '2015-02-28', 7, 'Huwawei Ascend P7 Jan 2015', 'Introducing the new Huwawei Ascend P7 - ', '2015-01-12', '2015-01-05', 0, '3', 0, '', ''),
(493, 200000, '2015-01-21', 6, 'KFC Crushers', 'Launching a new product', '2015-02-01', '2015-02-28', 0, '3', 0, '', ''),
(494, 10000, '2015-01-01', 5, 'hgfdghf', 'asdfasdfa', '2015-01-14', '2015-01-15', 0, '3', 0, '', ''),
(495, 20000, '0000-00-00', 6, 'kjnkbknb', 'jhkjhgvkjhgvjh', '0000-00-00', '0000-00-00', 0, '3', 0, '', ''),
(496, 111111, '2015-01-31', 6, 'wer', 'kfc product launch\n', '2015-01-17', '2015-01-31', 0, '3', 0, '', ''),
(497, 20000, '2015-01-21', 6, 'trymore test', 'asd                                     ', '2015-01-21', '2015-01-21', 0, '3', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rfp_campaign_screenshot`
--

CREATE TABLE `rfp_campaign_screenshot` (
`id` int(11) NOT NULL,
  `cam_id` int(11) NOT NULL,
  `image_name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_campaign_screenshot`
--

INSERT INTO `rfp_campaign_screenshot` (`id`, `cam_id`, `image_name`) VALUES
(1, 216, '/assets/images/screenshots/6_216_0.jpg'),
(2, 1186, '/assets/images/screenshots/6_1186_0.jpg'),
(3, 1477, '/assets/images/screenshots/6_1477_0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rfp_detail`
--

CREATE TABLE `rfp_detail` (
`rfp_d_id` int(11) NOT NULL,
  `rfp_id` int(6) NOT NULL,
  `mec_id` int(6) NOT NULL,
  `position` varchar(30) NOT NULL,
  `address` varchar(90) NOT NULL,
  `proximity` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_detail`
--

INSERT INTO `rfp_detail` (`rfp_d_id`, `rfp_id`, `mec_id`, `position`, `address`, `proximity`) VALUES
(1, 1, 1, '-26.066344,27.95042', '', 0),
(2, 1, 2, '-26.043682,27.936344', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rfp_for_submission`
--

CREATE TABLE `rfp_for_submission` (
`rfp_for_submission_id` int(11) NOT NULL,
  `media_owner_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `complete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_for_submission`
--

INSERT INTO `rfp_for_submission` (`rfp_for_submission_id`, `media_owner_id`, `campaign_id`, `operator_id`, `complete`) VALUES
(1, 5, 1989, 7, 1),
(2, 8, 1989, 7, 0),
(3, 5, 2009, 7, 1),
(4, 8, 2009, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rfp_for_submission_assets_selected`
--

CREATE TABLE `rfp_for_submission_assets_selected` (
`rfp_for_submission_assets_selected_id` int(11) NOT NULL,
  `rfp_for_submission_id` int(11) NOT NULL,
  `rfp_for_submission_location_id` int(11) NOT NULL,
  `media_categories_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `accepted_by_operator` int(11) NOT NULL,
  `accepted_by_media_owner` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `active` int(11) NOT NULL,
  `completed` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_for_submission_assets_selected`
--

INSERT INTO `rfp_for_submission_assets_selected` (`rfp_for_submission_assets_selected_id`, `rfp_for_submission_id`, `rfp_for_submission_location_id`, `media_categories_id`, `asset_id`, `accepted_by_operator`, `accepted_by_media_owner`, `from_id`, `to_id`, `transaction_date`, `active`, `completed`) VALUES
(1, 1, 2, 2, 2, 0, 1, 5, 7, '2015-03-29', 1, 0),
(2, 1, 2, 5, 10, 0, 1, 5, 7, '2015-03-29', 1, 0),
(3, 3, 11, 3, 3, 0, 1, 5, 7, '2015-03-31', 1, 0),
(4, 3, 11, 3, 13, 0, 1, 5, 7, '2015-03-31', 1, 0),
(5, 3, 13, 3, 3, 0, 1, 5, 7, '2015-03-31', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rfp_for_submission_locations`
--

CREATE TABLE `rfp_for_submission_locations` (
`rfp_for_submission_locations_id` int(11) NOT NULL,
  `rfp_for_submission_id` int(11) NOT NULL,
  `lat` float NOT NULL,
  `long` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_for_submission_locations`
--

INSERT INTO `rfp_for_submission_locations` (`rfp_for_submission_locations_id`, `rfp_for_submission_id`, `lat`, `long`) VALUES
(1, 1, 41.4878, -71.5285),
(2, 1, -26.0936, 28.0064),
(3, 1, -25.9992, 28.1263),
(4, 1, -30.5595, 22.9375),
(5, 2, 41.4878, -71.5285),
(6, 2, -26.0936, 28.0064),
(7, 2, -25.9992, 28.1263),
(8, 2, -30.5595, 22.9375),
(9, 3, -25.7461, 28.1881),
(10, 3, -25.8603, 28.1894),
(11, 3, -26.2041, 28.0473),
(12, 3, -25.9992, 28.1263),
(13, 3, -26.0936, 28.0064),
(14, 4, -25.7461, 28.1881),
(15, 4, -25.8603, 28.1894),
(16, 4, -26.2041, 28.0473),
(17, 4, -25.9992, 28.1263),
(18, 4, -26.0936, 28.0064);

-- --------------------------------------------------------

--
-- Table structure for table `rfp_for_submission_media_categories`
--

CREATE TABLE `rfp_for_submission_media_categories` (
`rfp_for_submission_media_categories_id` int(11) NOT NULL,
  `rfp_for_submission_id` int(11) NOT NULL,
  `rfp_for_location_id` int(11) NOT NULL,
  `media_category_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_for_submission_media_categories`
--

INSERT INTO `rfp_for_submission_media_categories` (`rfp_for_submission_media_categories_id`, `rfp_for_submission_id`, `rfp_for_location_id`, `media_category_id`, `quantity`) VALUES
(1, 1, 1, 2, '5'),
(2, 1, 2, 2, '2'),
(3, 1, 2, 3, '4'),
(4, 1, 2, 5, '1'),
(5, 1, 3, 5, '10'),
(6, 1, 4, 1, '2'),
(7, 1, 4, 3, '7'),
(8, 2, 5, 2, '5'),
(9, 2, 6, 2, '2'),
(10, 2, 6, 3, '4'),
(11, 2, 6, 5, '1'),
(12, 2, 7, 5, '10'),
(13, 2, 8, 1, '2'),
(14, 2, 8, 3, '7'),
(15, 3, 9, 3, '0'),
(16, 3, 9, 9, '0'),
(17, 3, 9, 1, '10'),
(18, 3, 10, 3, '0'),
(19, 3, 10, 9, '0'),
(20, 3, 11, 3, '0'),
(21, 3, 11, 9, '0'),
(22, 3, 12, 9, '100'),
(23, 3, 13, 2, '2'),
(24, 3, 13, 3, '10'),
(25, 4, 14, 3, '0'),
(26, 4, 14, 9, '0'),
(27, 4, 14, 1, '10'),
(28, 4, 15, 3, '0'),
(29, 4, 15, 9, '0'),
(30, 4, 16, 3, '0'),
(31, 4, 16, 9, '0'),
(32, 4, 17, 9, '100'),
(33, 4, 18, 2, '2'),
(34, 4, 18, 3, '10');

-- --------------------------------------------------------

--
-- Table structure for table `rfp_for_submission_more_options`
--

CREATE TABLE `rfp_for_submission_more_options` (
`rfp_for_submission_more_options_id` int(11) NOT NULL,
  `more_options_id` int(11) NOT NULL,
  `rfp_for_submission_id` int(11) NOT NULL,
  `rfp_for_submission_location_id` int(11) NOT NULL,
  `rfp_for_submission_media_categories_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_for_submission_more_options`
--

INSERT INTO `rfp_for_submission_more_options` (`rfp_for_submission_more_options_id`, `more_options_id`, `rfp_for_submission_id`, `rfp_for_submission_location_id`, `rfp_for_submission_media_categories_id`) VALUES
(1, 38, 1, 2, 3),
(2, 39, 1, 2, 3),
(3, 40, 1, 2, 3),
(4, 44, 1, 2, 5),
(5, 45, 1, 2, 5),
(6, 47, 1, 2, 5),
(7, 49, 1, 2, 5),
(8, 45, 1, 3, 5),
(9, 47, 1, 3, 5),
(10, 49, 1, 3, 5),
(11, 38, 2, 6, 3),
(12, 39, 2, 6, 3),
(13, 40, 2, 6, 3),
(14, 44, 2, 6, 5),
(15, 45, 2, 6, 5),
(16, 47, 2, 6, 5),
(17, 49, 2, 6, 5),
(18, 45, 2, 7, 5),
(19, 47, 2, 7, 5),
(20, 49, 2, 7, 5),
(21, 38, 3, 9, 3),
(22, 39, 3, 9, 3),
(23, 40, 3, 9, 3),
(24, 60, 3, 9, 9),
(25, 38, 3, 10, 3),
(26, 39, 3, 10, 3),
(27, 40, 3, 10, 3),
(28, 59, 3, 10, 9),
(29, 60, 3, 10, 9),
(30, 61, 3, 10, 9),
(31, 61, 3, 12, 9),
(32, 38, 3, 13, 3),
(33, 39, 3, 13, 3),
(34, 40, 3, 13, 3),
(35, 38, 4, 14, 3),
(36, 39, 4, 14, 3),
(37, 40, 4, 14, 3),
(38, 60, 4, 14, 9),
(39, 38, 4, 15, 3),
(40, 39, 4, 15, 3),
(41, 40, 4, 15, 3),
(42, 59, 4, 15, 9),
(43, 60, 4, 15, 9),
(44, 61, 4, 15, 9),
(45, 61, 4, 17, 9),
(46, 38, 4, 18, 3),
(47, 39, 4, 18, 3),
(48, 40, 4, 18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `rfp_status`
--

CREATE TABLE `rfp_status` (
`rfp_status_id` smallint(6) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_status`
--

INSERT INTO `rfp_status` (`rfp_status_id`, `description`) VALUES
(1, 'Submitted'),
(2, 'Received');

-- --------------------------------------------------------

--
-- Table structure for table `rfp_transactions`
--

CREATE TABLE `rfp_transactions` (
`id` int(11) NOT NULL,
  `cam_id` int(11) NOT NULL,
  `adv_id` int(11) NOT NULL,
  `lat` float NOT NULL,
  `long` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfp_transactions`
--

INSERT INTO `rfp_transactions` (`id`, `cam_id`, `adv_id`, `lat`, `long`) VALUES
(1, 163, 6, -26.0936, 28.0064),
(2, 164, 6, -26.0936, 28.0064),
(3, 164, 6, -26.1076, 28.0567),
(4, 216, 6, -26.2041, 28.0473),
(5, 1186, 6, -26.1076, 28.0567),
(6, 1186, 6, -26.2041, 28.0473),
(7, 1186, 6, -26.2125, 28.2625),
(8, 1186, 6, -25.7461, 28.1881),
(9, 1186, 6, -25.9992, 28.1263),
(10, 1186, 6, -26.15, 28.6833),
(11, 1186, 6, -25.6845, 27.5378),
(12, 1186, 6, -25.61, 27.796),
(13, 1288, 6, -25.7461, 28.1881),
(14, 1288, 6, -26.2041, 28.0473),
(15, 1288, 6, -25.9992, 28.1263),
(16, 1288, 6, -26.0936, 28.0064),
(17, 1330, 6, -30.5595, 22.9375),
(18, 1330, 6, -26.2708, 28.1123),
(19, 1330, 6, -26.2041, 28.0473),
(20, 1330, 6, -25.7461, 28.1881),
(21, 1330, 6, -25.8603, 28.1894),
(22, 1330, 6, -26.3903, 28.463),
(23, 1330, 6, -33.9249, 18.4241),
(24, 1330, 6, -23.4013, 29.4179),
(25, 1477, 6, -25.7461, 28.1881),
(26, 1477, 6, -26.2041, 28.0473),
(27, 1477, 6, -25.8603, 28.1894),
(28, 1477, 6, -30.5595, 22.9375),
(29, 1477, 6, -26.2708, 28.1123),
(30, 1477, 6, -26.1883, 28.3206),
(31, 1514, 6, -26.1076, 28.0567),
(32, 1514, 6, -26.2041, 28.0473),
(33, 1514, 6, -25.7461, 28.1881),
(34, 1514, 6, -26.1883, 28.3206),
(35, 1514, 6, -26.1625, 27.8725),
(36, 1614, 6, -25.7461, 28.1881),
(37, 1614, 6, -25.8603, 28.1894),
(38, 1614, 6, -26.2041, 28.0473),
(39, 1614, 6, -26.2485, 27.854),
(40, 1614, 6, -25.9992, 28.1263),
(41, 1646, 6, -25.7461, 28.1881),
(42, 1646, 6, -25.9992, 28.1263),
(43, 1646, 6, -25.8603, 28.1894),
(44, 1646, 6, -26.2041, 28.0473),
(45, 1646, 6, -26.1625, 27.8725),
(46, 1646, 6, -26.1, 27.7667),
(47, 1646, 6, -26.2485, 27.854),
(48, 1650, 6, -26.2041, 28.0473),
(49, 1650, 6, -25.8603, 28.1894),
(50, 1650, 6, -25.7461, 28.1881),
(51, 1650, 6, -25.9992, 28.1263),
(52, 1650, 6, -26.1625, 27.8725),
(53, 1650, 6, -26.1, 27.7667),
(54, 1650, 6, -26.2485, 27.854),
(55, 1651, 6, -26.2041, 28.0473),
(56, 1651, 6, -26.2041, 28.0473),
(57, 1651, 6, -26.2041, 28.0473),
(58, 1651, 6, -25.8603, 28.1894),
(59, 1651, 6, -25.8603, 28.1894),
(60, 1651, 6, -25.8603, 28.1894),
(61, 1651, 6, -25.7461, 28.1881),
(62, 1651, 6, -25.7461, 28.1881),
(63, 1651, 6, -25.7461, 28.1881),
(64, 1651, 6, -25.9992, 28.1263),
(65, 1651, 6, -25.9992, 28.1263),
(66, 1651, 6, -25.9992, 28.1263),
(67, 1655, 6, -26.2041, 28.0473),
(68, 1655, 6, -26.2041, 28.0473),
(69, 1655, 6, -26.2041, 28.0473),
(70, 1655, 6, -25.7461, 28.1881),
(71, 1655, 6, -25.7461, 28.1881),
(72, 1655, 6, -25.7461, 28.1881),
(73, 1655, 6, -25.9992, 28.1263),
(74, 1655, 6, -25.9992, 28.1263),
(75, 1655, 6, -25.9992, 28.1263),
(76, 1655, 6, -25.8603, 28.1894),
(77, 1655, 6, -25.8603, 28.1894),
(78, 1655, 6, -25.8603, 28.1894),
(79, 1655, 6, -26.1625, 27.8725),
(80, 1655, 6, -26.1625, 27.8725),
(81, 1655, 6, -26.1625, 27.8725),
(82, 1655, 6, -26.1, 27.7667),
(83, 1655, 6, -26.1, 27.7667),
(84, 1655, 6, -26.1, 27.7667),
(85, 1655, 6, -26.2485, 27.854),
(86, 1655, 6, -26.2485, 27.854),
(87, 1655, 6, -26.2485, 27.854),
(88, 1664, 6, -25.7461, 28.1881),
(89, 1665, 6, -25.7461, 28.1881),
(90, 1665, 6, -25.7461, 28.1881),
(91, 1665, 6, -25.7461, 28.1881),
(92, 1665, 6, -26.2041, 28.0473),
(93, 1665, 6, -26.2041, 28.0473),
(94, 1665, 6, -26.2041, 28.0473),
(95, 1665, 6, -25.8603, 28.1894),
(96, 1665, 6, -25.8603, 28.1894),
(97, 1665, 6, -25.8603, 28.1894),
(98, 1665, 6, -26.1, 27.7667),
(99, 1665, 6, -26.1, 27.7667),
(100, 1665, 6, -26.1, 27.7667),
(101, 1665, 6, -25.9992, 28.1263),
(102, 1665, 6, -25.9992, 28.1263),
(103, 1665, 6, -25.9992, 28.1263),
(104, 1673, 6, -26.2041, 28.0473),
(105, 1673, 6, -26.1, 27.7667),
(106, 1673, 6, -26.1625, 27.8725),
(107, 1673, 6, -25.7461, 28.1881),
(108, 1673, 6, -25.9992, 28.1263),
(109, 1989, 6, 0, 0),
(110, 1989, 6, -26.0936, 28.0064),
(111, 1989, 6, -26.2041, 28.0473),
(112, 1989, 6, -25.9992, 28.1263),
(113, 1989, 6, -26.2708, 28.1123),
(114, 1989, 6, -30.5595, 22.9375),
(115, 2009, 6, -25.7461, 28.1881),
(116, 2009, 6, -25.8603, 28.1894),
(117, 2009, 6, -26.2041, 28.0473),
(118, 2009, 6, -25.9992, 28.1263),
(119, 2009, 6, -26.0936, 28.0064);

-- --------------------------------------------------------

--
-- Table structure for table `road_grade`
--

CREATE TABLE `road_grade` (
`roa_id` smallint(6) NOT NULL,
  `roa_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
`sal_id` smallint(6) NOT NULL,
  `pay_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sitename` varchar(255) NOT NULL DEFAULT '',
  `siteurl` varchar(255) NOT NULL DEFAULT '',
  `copyright` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `loginbox` int(1) NOT NULL DEFAULT '0',
  `newsbox` int(1) NOT NULL DEFAULT '0',
  `newstoshow` int(11) NOT NULL DEFAULT '0',
  `perpage` int(10) NOT NULL DEFAULT '15',
  `moneyformat` int(1) NOT NULL DEFAULT '0',
  `moneydecimals` int(11) NOT NULL DEFAULT '2',
  `moneysymbol` int(1) NOT NULL DEFAULT '0',
  `currency` varchar(10) NOT NULL DEFAULT '',
  `showacceptancetext` int(1) NOT NULL DEFAULT '0',
  `acceptancetext` longtext NOT NULL,
  `adminmail` varchar(100) NOT NULL DEFAULT '',
  `banners` int(1) NOT NULL DEFAULT '0',
  `newsletter` int(1) NOT NULL DEFAULT '0',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `timecorrection` int(3) NOT NULL DEFAULT '0',
  `cron` int(1) NOT NULL DEFAULT '0',
  `archiveafter` int(11) NOT NULL DEFAULT '0',
  `datesformat` enum('USA','EUR') NOT NULL DEFAULT 'EUR',
  `errortext` text NOT NULL,
  `picturesgallery` int(1) NOT NULL DEFAULT '0',
  `maxpictures` int(11) NOT NULL DEFAULT '0',
  `buy_now` int(1) NOT NULL DEFAULT '1',
  `thumb_show` smallint(6) NOT NULL DEFAULT '120',
  `thumb_list` smallint(6) NOT NULL DEFAULT '120',
  `lastitemsnumber` int(11) NOT NULL DEFAULT '0',
  `higherbidsnumber` int(11) NOT NULL DEFAULT '0',
  `endingsoonnumber` int(11) NOT NULL DEFAULT '0',
  `boards` enum('y','n') NOT NULL DEFAULT 'y',
  `wordsfilter` enum('y','n') NOT NULL DEFAULT 'y',
  `aboutus` enum('y','n') NOT NULL DEFAULT 'y',
  `aboutustext` text NOT NULL,
  `terms` enum('y','n') NOT NULL DEFAULT 'y',
  `termstext` text NOT NULL,
  `privacypolicy` enum('y','n') NOT NULL DEFAULT 'y',
  `privacypolicytext` text NOT NULL,
  `defaultcountry` varchar(30) NOT NULL DEFAULT '',
  `defaultlanguage` char(2) NOT NULL DEFAULT 'EN',
  `catsorting` enum('alpha','counter') NOT NULL DEFAULT 'alpha',
  `usersauth` enum('y','n') NOT NULL DEFAULT 'y',
  `descriptiontag` text NOT NULL,
  `keywordstag` text NOT NULL,
  `maxuploadsize` int(11) NOT NULL DEFAULT '0',
  `contactseller` enum('always','logged','never') NOT NULL DEFAULT 'always',
  `theme` tinytext,
  `catstoshow` int(11) NOT NULL DEFAULT '0',
  `bn_only` enum('y','n') NOT NULL DEFAULT 'n',
  `winner_address` enum('y','n') NOT NULL DEFAULT 'n',
  `boardsmsgs` int(11) NOT NULL DEFAULT '0',
  `activationtype` int(1) NOT NULL DEFAULT '1',
  `https` enum('y','n') NOT NULL DEFAULT 'n',
  `https_url` varchar(255) NOT NULL DEFAULT '',
  `bn_only_disable` enum('y','n') NOT NULL DEFAULT 'n',
  `bn_only_percent` int(3) NOT NULL DEFAULT '50',
  `buyerprivacy` enum('y','n') NOT NULL DEFAULT 'n',
  `cust_increment` int(1) NOT NULL DEFAULT '0',
  `subtitle` enum('y','n') NOT NULL DEFAULT 'y',
  `extra_cat` enum('y','n') NOT NULL DEFAULT 'n',
  `fees` enum('y','n') NOT NULL DEFAULT 'n',
  `fee_type` int(1) NOT NULL DEFAULT '1',
  `fee_max_debt` double(16,4) NOT NULL DEFAULT '25.0000',
  `fee_signup_bonus` double(16,4) NOT NULL DEFAULT '0.0000',
  `fee_disable_acc` enum('y','n') NOT NULL DEFAULT 'y',
  `ae_status` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `ae_timebefore` int(11) NOT NULL DEFAULT '120',
  `ae_extend` int(11) NOT NULL DEFAULT '300',
  `cache_theme` enum('y','n') NOT NULL DEFAULT 'y',
  `hours_countdown` int(5) NOT NULL DEFAULT '24',
  `edit_starttime` int(1) NOT NULL DEFAULT '1',
  `banner_width` int(11) NOT NULL DEFAULT '468',
  `banner_height` int(11) NOT NULL DEFAULT '60',
  `counter_auctions` enum('y','n') NOT NULL DEFAULT 'y',
  `counter_users` enum('y','n') NOT NULL DEFAULT 'y',
  `counter_online` enum('y','n') NOT NULL DEFAULT 'y',
  `banemail` text NOT NULL,
  `mandatory_fields` varchar(255) NOT NULL DEFAULT '',
  `displayed_feilds` varchar(255) NOT NULL DEFAULT '',
  `ao_hpf_enabled` enum('y','n') NOT NULL DEFAULT 'y',
  `ao_hi_enabled` enum('y','n') NOT NULL DEFAULT 'y',
  `ao_bi_enabled` enum('y','n') NOT NULL DEFAULT 'y',
  `proxy_bidding` enum('y','n') NOT NULL DEFAULT 'y',
  `recaptcha_public` varchar(40) NOT NULL DEFAULT '',
  `recaptcha_private` varchar(40) NOT NULL DEFAULT '',
  `spam_sendtofriend` int(1) NOT NULL DEFAULT '1',
  `spam_register` int(1) NOT NULL DEFAULT '1',
  `mod_queue` enum('y','n') NOT NULL DEFAULT 'n',
  `payment_options` text NOT NULL,
  `autorelist` enum('y','n') NOT NULL DEFAULT 'y',
  `autorelist_max` int(3) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sitename`, `siteurl`, `copyright`, `version`, `loginbox`, `newsbox`, `newstoshow`, `perpage`, `moneyformat`, `moneydecimals`, `moneysymbol`, `currency`, `showacceptancetext`, `acceptancetext`, `adminmail`, `banners`, `newsletter`, `logo`, `timecorrection`, `cron`, `archiveafter`, `datesformat`, `errortext`, `picturesgallery`, `maxpictures`, `buy_now`, `thumb_show`, `thumb_list`, `lastitemsnumber`, `higherbidsnumber`, `endingsoonnumber`, `boards`, `wordsfilter`, `aboutus`, `aboutustext`, `terms`, `termstext`, `privacypolicy`, `privacypolicytext`, `defaultcountry`, `defaultlanguage`, `catsorting`, `usersauth`, `descriptiontag`, `keywordstag`, `maxuploadsize`, `contactseller`, `theme`, `catstoshow`, `bn_only`, `winner_address`, `boardsmsgs`, `activationtype`, `https`, `https_url`, `bn_only_disable`, `bn_only_percent`, `buyerprivacy`, `cust_increment`, `subtitle`, `extra_cat`, `fees`, `fee_type`, `fee_max_debt`, `fee_signup_bonus`, `fee_disable_acc`, `ae_status`, `ae_timebefore`, `ae_extend`, `cache_theme`, `hours_countdown`, `edit_starttime`, `banner_width`, `banner_height`, `counter_auctions`, `counter_users`, `counter_online`, `banemail`, `mandatory_fields`, `displayed_feilds`, `ao_hpf_enabled`, `ao_hi_enabled`, `ao_bi_enabled`, `proxy_bidding`, `recaptcha_public`, `recaptcha_private`, `spam_sendtofriend`, `spam_register`, `mod_queue`, `payment_options`, `autorelist`, `autorelist_max`) VALUES
('Ads2trade', 'http://localhost/ads2trade/auction/', '', '1.0.2', 1, 1, 5, 15, 1, 2, 2, 'GBP', 1, 'By clicking below you agree to the terms of this website.', '', 1, 1, 'logo.gif', 0, 2, 30, 'EUR', 'An unexpected error occurred. The error has been forwarded to our technical team and will be fixed shortly', 1, 5, 2, 120, 120, 8, 8, 0, 'y', 'y', 'y', '', 'y', '', 'y', '', 'United Kingdom', 'EN', 'alpha', 'y', '', '', 51200, 'always', 'default', 20, 'n', 'y', 0, 1, 'n', '', 'n', 50, 'n', 1, 'y', 'n', 'n', 1, 25.0000, 0.0000, 'y', 'disabled', 120, 300, 'y', 24, 1, 468, 60, 'y', 'y', 'y', '', 'a:7:{s:9:"birthdate";s:1:"y";s:7:"address";s:1:"y";s:4:"city";s:1:"y";s:4:"prov";s:1:"y";s:7:"country";s:1:"y";s:3:"zip";s:1:"y";s:3:"tel";s:1:"y";}', 'a:7:{s:17:"birthdate_regshow";s:1:"y";s:15:"address_regshow";s:1:"y";s:12:"city_regshow";s:1:"y";s:12:"prov_regshow";s:1:"y";s:15:"country_regshow";s:1:"y";s:11:"zip_regshow";s:1:"y";s:11:"tel_regshow";s:1:"y";}', 'y', 'y', 'y', 'y', '', '', 1, 1, 'n', 'a:2:{i:0;s:13:"Wire Transfer";i:1;s:6:"Cheque";}', 'y', 10);

-- --------------------------------------------------------

--
-- Table structure for table `special_deal`
--

CREATE TABLE `special_deal` (
`spd_id` smallint(6) NOT NULL,
  `spd_description` varchar(255) DEFAULT NULL,
  `spd_start_date` datetime DEFAULT NULL,
  `spd_end_date` datetime DEFAULT NULL,
  `cur_code_customer` smallint(6) DEFAULT NULL,
  `cur_code_location_owner` smallint(6) DEFAULT NULL,
  `spd_discount_percentage` decimal(3,3) DEFAULT NULL,
  `spd_availability` tinyint(4) DEFAULT NULL,
  `mec_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `special_deal`
--

INSERT INTO `special_deal` (`spd_id`, `spd_description`, `spd_start_date`, `spd_end_date`, `cur_code_customer`, `cur_code_location_owner`, `spd_discount_percentage`, `spd_availability`, `mec_id`) VALUES
(1, 'My Special', '2014-08-23 10:10:46', '2014-08-23 10:10:46', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statssettings`
--

CREATE TABLE `statssettings` (
  `activate` enum('y','n') NOT NULL DEFAULT 'y',
  `accesses` enum('y','n') NOT NULL DEFAULT 'y',
  `browsers` enum('y','n') NOT NULL DEFAULT 'y',
  `domains` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statssettings`
--

INSERT INTO `statssettings` (`activate`, `accesses`, `browsers`, `domains`) VALUES
('n', 'y', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `surbub`
--

CREATE TABLE `surbub` (
`sur_id` smallint(6) NOT NULL,
  `sur_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_events`
--

CREATE TABLE `system_events` (
  `event_type` int(11) NOT NULL,
  `event_user` int(11) NOT NULL,
  `event_object_id` int(11) NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_details` text NOT NULL,
`id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_events`
--

INSERT INTO `system_events` (`event_type`, `event_user`, `event_object_id`, `event_date`, `event_details`, `id`) VALUES
(5, 6, 6, '2014-11-23 10:23:48', 'Advertiser advertiser logged in successfully', 1),
(5, 6, 6, '2014-11-23 10:23:47', 'Advertiser advertiser logged in successfully', 2),
(5, 6, 6, '2014-11-23 10:23:52', 'Advertiser advertiser logged in successfully', 3),
(5, 6, 6, '2014-11-23 10:23:18', 'Advertiser advertiser logged in successfully', 4),
(5, 6, 6, '2014-11-23 10:23:01', 'Advertiser advertiser logged in successfully', 5),
(5, 6, 6, '2014-11-23 10:23:10', 'User logged out successfully', 6),
(5, 7, 7, '2014-11-23 10:23:14', 'Operator operator logged in successfully', 7),
(5, 7, 7, '2014-11-23 10:23:28', 'User logged out successfully', 8),
(5, 6, 6, '2014-11-23 10:23:32', 'Advertiser advertiser logged in successfully', 9),
(5, 6, 6, '2014-11-23 10:23:57', 'User logged out successfully', 10),
(5, 5, 5, '2014-11-23 10:23:05', 'Media Owner pintos logged in successfully', 11),
(5, 5, 5, '2014-11-23 10:23:11', 'User logged out successfully', 12),
(5, 7, 7, '2014-11-23 10:23:14', 'Operator operator logged in successfully', 13),
(5, 7, 7, '2014-11-23 11:23:55', 'Operator operator logged in successfully', 14),
(5, 7, 7, '2014-11-23 11:23:58', 'Operator operator logged in successfully', 15),
(5, 7, 7, '2014-11-23 11:23:37', 'User logged out successfully', 16),
(5, 6, 6, '2014-11-23 11:23:47', 'Advertiser advertiser logged in successfully', 17),
(5, 6, 6, '2014-11-23 12:23:34', 'User logged out successfully', 18),
(5, 7, 7, '2014-11-23 12:23:37', 'Operator operator logged in successfully', 19),
(5, 7, 7, '2014-11-23 12:23:55', 'Operator operator logged in successfully', 20),
(5, 7, 7, '2014-11-23 12:23:14', 'User logged out successfully', 21),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-23 16:23:23', 22),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-23 22:23:49', 23),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-23 22:23:45', 24),
(5, 7, 7, '2014-11-23 18:23:57', 'User logged out successfully', 25),
(5, 6, 6, '2014-11-23 18:23:00', 'Advertiser advertiser logged in successfully', 26),
(5, 6, 6, '2014-11-23 19:23:53', 'User logged out successfully', 27),
(5, 6, 6, '2014-11-23 19:23:59', 'Advertiser advertiser logged in successfully', 28),
(2, 5, 1, '2014-11-23 19:23:44', '10 Bid placed', 29),
(6, 6, 2, '2014-11-23 20:24:45', 'Asset id:2 removed from user:6''s watchlist', 30),
(2, 6, 1, '2014-11-23 20:24:17', '450.00 Bid placed', 31),
(1, 6, 3, '2014-11-23 20:24:08', 'Asset id: added to user:6''s watchlist', 32),
(5, 0, 0, '2014-11-23 20:24:45', 'User logged out successfully', 33),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 00:24:46', 34),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 00:24:24', 35),
(2, 6, 0, '2014-11-23 20:24:15', '125.00 Bid placed', 36),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 00:24:59', 37),
(5, 7, 7, '2014-11-23 20:24:17', 'User logged out successfully', 38),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 00:24:23', 39),
(5, 6, 6, '2014-11-23 20:24:27', 'User logged out successfully', 40),
(5, 6, 6, '2014-11-23 20:24:30', 'Advertiser advertiser logged in successfully', 41),
(5, 6, 6, '2014-11-23 20:24:37', 'User logged out successfully', 42),
(5, 5, 5, '2014-11-23 20:24:40', 'Media Owner pintos logged in successfully', 43),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 00:24:55', 44),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 00:24:14', 45),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 11:24:34', 46),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 13:24:21', 47),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 13:24:00', 48),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 13:24:01', 49),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 13:24:29', 50),
(5, 7, 7, '2014-11-24 09:24:55', 'User logged out successfully', 51),
(5, 5, 5, '2014-11-24 09:24:05', 'Media Owner pintos logged in successfully', 52),
(5, 5, 5, '2014-11-24 09:24:28', 'User logged out successfully', 53),
(5, 6, 6, '2014-11-24 09:24:40', 'Advertiser advertiser logged in successfully', 54),
(5, 6, 6, '2014-11-24 10:24:24', 'User logged out successfully', 55),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-24 14:24:27', 56),
(5, 7, 7, '2014-11-24 10:24:32', 'User logged out successfully', 57),
(5, 5, 5, '2014-11-24 10:24:41', 'Media Owner pintos logged in successfully', 58),
(5, 5, 5, '2014-11-24 10:24:50', 'User logged out successfully', 59),
(5, 6, 6, '2014-11-24 10:24:56', 'Advertiser advertiser logged in successfully', 60),
(5, 6, 6, '2014-11-24 10:24:38', 'Advertiser advertiser logged in successfully', 61),
(5, 6, 6, '2014-11-24 10:24:05', 'Advertiser advertiser logged in successfully', 62),
(5, 6, 6, '2014-11-25 02:25:15', 'Advertiser advertiser logged in successfully', 63),
(5, 6, 6, '2014-11-25 02:25:19', 'User logged out successfully', 64),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 06:25:24', 65),
(5, 7, 7, '2014-11-25 02:25:26', 'User logged out successfully', 66),
(5, 5, 5, '2014-11-25 02:25:31', 'Media Owner pintos logged in successfully', 67),
(5, 5, 5, '2014-11-25 03:25:13', 'Media Owner pintos logged in successfully', 68),
(5, 5, 5, '2014-11-25 03:25:44', 'Media Owner pintos logged in successfully', 69),
(5, 5, 5, '2014-11-25 03:25:57', 'User logged out successfully', 70),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 07:25:03', 71),
(5, 7, 7, '2014-11-25 03:25:19', 'User logged out successfully', 72),
(5, 6, 6, '2014-11-25 03:25:28', 'Advertiser advertiser logged in successfully', 73),
(5, 6, 6, '2014-11-25 03:25:54', 'User logged out successfully', 74),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 07:25:58', 75),
(5, 7, 7, '2014-11-25 03:25:14', 'User logged out successfully', 76),
(5, 6, 6, '2014-11-25 03:25:19', 'Advertiser advertiser logged in successfully', 77),
(5, 6, 6, '2014-11-25 03:25:23', 'User logged out successfully', 78),
(5, 6, 6, '2014-11-25 03:25:25', 'Advertiser advertiser logged in successfully', 79),
(5, 6, 6, '2014-11-25 03:25:00', 'Advertiser advertiser logged in successfully', 80),
(5, 6, 6, '2014-11-25 04:25:27', 'User logged out successfully', 81),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 08:25:31', 82),
(5, 7, 7, '2014-11-25 04:25:41', 'User logged out successfully', 83),
(5, 5, 5, '2014-11-25 04:25:44', 'Media Owner pintos logged in successfully', 84),
(5, 5, 5, '2014-11-25 05:25:19', 'User logged out successfully', 85),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 09:25:23', 86),
(5, 7, 7, '2014-11-25 05:25:27', 'User logged out successfully', 87),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 09:25:28', 88),
(5, 7, 7, '2014-11-25 05:25:51', 'User logged out successfully', 89),
(5, 5, 5, '2014-11-25 05:25:56', 'Media Owner pintos logged in successfully', 90),
(5, 5, 5, '2014-11-25 05:25:00', 'User logged out successfully', 91),
(5, 6, 6, '2014-11-25 05:25:04', 'Advertiser advertiser logged in successfully', 92),
(5, 6, 6, '2014-11-25 05:25:55', 'User logged out successfully', 93),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 09:25:59', 94),
(5, 7, 7, '2014-11-25 10:25:02', 'User logged out successfully', 95),
(5, 9, 9, '2014-11-25 10:25:12', 'Advertiser Simon logged in successfully', 96),
(5, 9, 9, '2014-11-25 10:25:02', 'User logged out successfully', 97),
(5, 6, 6, '2014-11-25 10:25:07', 'Advertiser advertiser logged in successfully', 98),
(5, 6, 6, '2014-11-25 10:25:11', 'User logged out successfully', 99),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 14:25:17', 100),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 15:25:18', 101),
(5, 7, 7, '2014-11-25 11:25:38', 'User logged out successfully', 102),
(5, 6, 6, '2014-11-25 11:25:42', 'Advertiser advertiser logged in successfully', 103),
(5, 6, 6, '2014-11-25 11:25:49', 'User logged out successfully', 104),
(5, 5, 5, '2014-11-25 11:25:53', 'Media Owner pintos logged in successfully', 105),
(5, 5, 5, '2014-11-25 11:25:00', 'User logged out successfully', 106),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-25 15:25:04', 107),
(5, 5, 5, '2014-11-26 03:26:25', 'Media Owner pintos logged in successfully', 108),
(5, 5, 5, '2014-11-26 03:26:57', 'User logged out successfully', 109),
(5, 9, 9, '2014-11-26 03:26:54', 'Advertiser Simon logged in successfully', 110),
(5, 9, 9, '2014-11-26 04:26:33', 'Advertiser Simon logged in successfully', 111),
(5, 9, 9, '2014-11-26 04:26:32', 'User logged out successfully', 112),
(5, 6, 6, '2014-11-26 04:26:41', 'Advertiser advertiser logged in successfully', 113),
(5, 6, 6, '2014-11-26 04:26:57', 'User logged out successfully', 114),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-26 08:26:01', 115),
(5, 0, 0, '2014-11-26 08:26:35', 'User logged out successfully', 116),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-26 12:26:42', 117),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-26 12:26:41', 118),
(5, 7, 7, '2014-11-26 08:26:15', 'User logged out successfully', 119),
(5, 6, 6, '2014-11-26 08:26:25', 'Advertiser advertiser logged in successfully', 120),
(5, 6, 6, '2014-11-26 08:26:10', 'User logged out successfully', 121),
(5, 5, 5, '2014-11-26 08:26:19', 'Media Owner pintos logged in successfully', 122),
(5, 5, 5, '2014-11-26 08:26:37', 'User logged out successfully', 123),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-26 12:26:42', 124),
(5, 6, 6, '2014-11-27 07:27:50', 'Advertiser advertiser logged in successfully', 125),
(0, 0, 7, '0000-00-00 00:00:00', '2014-11-27 23:27:06', 126),
(5, 6, 6, '2014-12-02 05:02:26', 'Advertiser advertiser logged in successfully', 127),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-03 20:3:55', 128),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-03 21:3:30', 129),
(5, 7, 7, '2014-12-03 17:03:32', 'User logged out successfully', 130),
(5, 6, 6, '2014-12-03 17:03:37', 'Advertiser advertiser logged in successfully', 131),
(5, 6, 6, '2014-12-09 10:09:16', 'Advertiser advertiser logged in successfully', 132),
(5, 6, 6, '2014-12-09 15:09:19', 'Advertiser advertiser logged in successfully', 133),
(5, 6, 6, '2014-12-10 04:10:14', 'Advertiser advertiser logged in successfully', 134),
(5, 5, 5, '2014-12-10 16:10:54', 'Media Owner pintos logged in successfully', 135),
(5, 5, 5, '2014-12-10 16:10:54', 'Media Owner pintos logged in successfully', 136),
(5, 5, 5, '2014-12-10 16:10:37', 'Media Owner pintos logged in successfully', 137),
(5, 7, 7, '2014-12-10 16:10:13', 'User logged out successfully', 138),
(5, 5, 5, '2014-12-10 16:10:15', 'Media Owner pintos logged in successfully', 139),
(5, 5, 5, '2014-12-10 17:10:30', 'User logged out successfully', 140),
(5, 5, 5, '2014-12-10 17:10:12', 'Media Owner pintos logged in successfully', 141),
(5, 5, 5, '2014-12-10 17:10:29', 'Media Owner pintos logged in successfully', 142),
(5, 5, 5, '2014-12-10 17:10:43', 'User logged out successfully', 143),
(5, 6, 6, '2014-12-10 17:10:01', 'Advertiser advertiser logged in successfully', 144),
(5, 6, 6, '2014-12-11 03:11:00', 'Advertiser advertiser logged in successfully', 145),
(5, 6, 6, '2014-12-11 03:11:50', 'Advertiser advertiser logged in successfully', 146),
(5, 6, 6, '2014-12-11 03:11:39', 'Advertiser advertiser logged in successfully', 147),
(5, 6, 6, '2014-12-11 03:11:44', 'User logged out successfully', 148),
(5, 6, 6, '2014-12-11 03:11:46', 'Advertiser advertiser logged in successfully', 149),
(5, 6, 6, '2014-12-11 03:11:30', 'User logged out successfully', 150),
(5, 6, 6, '2014-12-11 03:11:32', 'Advertiser advertiser logged in successfully', 151),
(5, 6, 6, '2014-12-11 03:11:27', 'User logged out successfully', 152),
(5, 6, 6, '2014-12-11 03:11:29', 'Advertiser advertiser logged in successfully', 153),
(5, 6, 6, '2014-12-11 03:11:55', 'User logged out successfully', 154),
(5, 6, 6, '2014-12-11 03:11:57', 'Advertiser advertiser logged in successfully', 155),
(5, 6, 6, '2014-12-11 03:11:16', 'User logged out successfully', 156),
(5, 6, 6, '2014-12-11 03:11:18', 'Advertiser advertiser logged in successfully', 157),
(5, 6, 6, '2014-12-11 03:11:41', 'User logged out successfully', 158),
(5, 6, 6, '2014-12-11 03:11:43', 'Advertiser advertiser logged in successfully', 159),
(1, 6, 1, '2014-12-11 03:11:46', 'Asset id:1 added to user:6''s watchlist', 160),
(5, 6, 6, '2014-12-11 04:11:12', 'User logged out successfully', 161),
(5, 6, 6, '2014-12-11 04:11:15', 'Advertiser advertiser logged in successfully', 162),
(5, 6, 6, '2014-12-11 04:11:50', 'User logged out successfully', 163),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 08:11:59', 164),
(5, 7, 7, '2014-12-11 04:11:47', 'User logged out successfully', 165),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 08:11:51', 166),
(5, 7, 7, '2014-12-11 04:11:00', 'User logged out successfully', 167),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 08:11:03', 168),
(5, 7, 7, '2014-12-11 04:11:08', 'User logged out successfully', 169),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 08:11:09', 170),
(1, 7, 0, '2014-12-11 04:11:26', '0 Auctions removed by User id:7', 171),
(5, 7, 7, '2014-12-11 04:11:00', 'User logged out successfully', 172),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 08:11:02', 173),
(5, 7, 7, '2014-12-11 04:11:13', 'User logged out successfully', 174),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 08:11:30', 175),
(5, 7, 7, '2014-12-11 04:11:34', 'User logged out successfully', 176),
(5, 5, 5, '2014-12-11 04:11:46', 'Media Owner pintos logged in successfully', 177),
(5, 5, 5, '2014-12-11 04:11:52', 'User logged out successfully', 178),
(5, 5, 5, '2014-12-11 04:11:05', 'Media Owner pintos logged in successfully', 179),
(5, 5, 5, '2014-12-11 04:11:59', 'Media Owner pintos logged in successfully', 180),
(5, 6, 6, '2014-12-11 05:11:59', 'Advertiser advertiser logged in successfully', 181),
(5, 6, 6, '2014-12-11 05:11:40', 'User logged out successfully', 182),
(5, 5, 5, '2014-12-11 05:11:47', 'Media Owner pintos logged in successfully', 183),
(5, 5, 5, '2014-12-11 05:11:00', 'User logged out successfully', 184),
(5, 6, 6, '2014-12-11 05:11:06', 'Advertiser advertiser logged in successfully', 185),
(5, 6, 6, '2014-12-11 05:11:08', 'User logged out successfully', 186),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 09:11:15', 187),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 09:11:26', 188),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 09:11:41', 189),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-11 10:11:45', 190),
(5, 7, 7, '2014-12-11 06:11:20', 'User logged out successfully', 191),
(5, 5, 5, '2014-12-11 06:11:27', 'Media Owner pintos logged in successfully', 192),
(5, 5, 5, '2014-12-11 15:11:29', 'Media Owner pintos logged in successfully', 193),
(5, 5, 5, '2014-12-11 16:11:54', 'User logged out successfully', 194),
(5, 6, 6, '2014-12-11 16:11:03', 'Advertiser advertiser logged in successfully', 195),
(5, 6, 6, '2014-12-11 16:11:09', 'Advertiser advertiser logged in successfully', 196),
(5, 6, 6, '2014-12-11 16:11:11', 'Advertiser advertiser logged in successfully', 197),
(5, 6, 6, '2014-12-13 15:13:57', 'Advertiser advertiser logged in successfully', 198),
(5, 6, 6, '2014-12-13 15:13:06', 'Advertiser advertiser logged in successfully', 199),
(5, 6, 6, '2014-12-13 17:13:50', 'Advertiser advertiser logged in successfully', 200),
(5, 6, 6, '2014-12-13 18:13:22', 'User logged out successfully', 201),
(5, 6, 6, '2014-12-13 18:13:24', 'Advertiser advertiser logged in successfully', 202),
(5, 6, 6, '2014-12-13 18:13:43', 'Advertiser advertiser logged in successfully', 203),
(2, 6, 0, '2014-12-13 21:14:48', ' Bid placed', 204),
(2, 6, 0, '2014-12-13 21:14:34', '25200 Bid placed', 205),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-14 09:14:50', 206),
(5, 7, 7, '2014-12-14 05:14:14', 'User logged out successfully', 207),
(5, 6, 6, '2014-12-14 05:14:26', 'Advertiser advertiser logged in successfully', 208),
(5, 6, 6, '2014-12-14 11:14:05', 'Advertiser advertiser logged in successfully', 209),
(5, 6, 6, '2014-12-14 11:14:17', 'Advertiser advertiser logged in successfully', 210),
(5, 6, 6, '2014-12-14 16:14:31', 'Advertiser advertiser logged in successfully', 211),
(2, 6, 0, '2014-12-14 18:14:21', '25000 Bid placed', 212),
(5, 8, 8, '2014-12-15 05:15:22', 'Media Owner tawanda logged in successfully', 213),
(5, 8, 8, '2014-12-15 05:15:48', 'User logged out successfully', 214),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-15 09:15:59', 215),
(5, 7, 7, '2014-12-15 05:15:33', 'User logged out successfully', 216),
(5, 6, 6, '2014-12-15 05:15:34', 'Advertiser advertiser logged in successfully', 217),
(5, 6, 6, '2014-12-15 15:15:21', 'Advertiser advertiser logged in successfully', 218),
(2, 6, 0, '2014-12-15 15:15:32', ' Bid placed', 219),
(2, 6, 0, '2014-12-15 15:15:00', '5525.00 Bid placed', 220),
(5, 0, 0, '2014-12-16 09:16:50', 'User logged out successfully', 221),
(5, 6, 6, '2014-12-16 09:16:10', 'Advertiser advertiser logged in successfully', 222),
(5, 6, 6, '2014-12-16 15:16:15', 'Advertiser advertiser logged in successfully', 223),
(5, 6, 6, '2014-12-16 16:16:55', 'Advertiser advertiser logged in successfully', 224),
(1, 6, 7, '2014-12-16 18:16:58', 'Asset id: added to user:6''s watchlist', 225),
(2, 6, 1, '2014-12-16 18:16:48', '37500 Bid placed', 226),
(1, 6, 5, '2014-12-16 19:16:53', 'Asset id: added to user:6''s watchlist', 227),
(1, 6, 5, '2014-12-16 20:17:49', 'Asset id: added to user:6''s watchlist', 228),
(2, 6, 5, '2014-12-16 20:17:51', '401 Bid placed', 229),
(6, 6, 2, '2014-12-16 20:17:43', 'Asset id:2 removed from user:6''s watchlist', 230),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-17 00:17:13', 231),
(5, 7, 7, '2014-12-16 20:17:37', 'User logged out successfully', 232),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-17 00:17:42', 233),
(1, 7, 0, '2014-12-16 20:17:51', '0 Auctions added by User id:7', 234),
(5, 6, 6, '2014-12-17 05:17:29', 'Advertiser advertiser logged in successfully', 235),
(5, 6, 6, '2014-12-18 04:18:22', 'Advertiser advertiser logged in successfully', 236),
(5, 6, 6, '2014-12-18 05:18:22', 'Advertiser advertiser logged in successfully', 237),
(5, 6, 6, '2014-12-18 05:18:58', 'Advertiser advertiser logged in successfully', 238),
(2, 6, 0, '2014-12-18 05:18:18', '129 Bid placed', 239),
(5, 6, 6, '2014-12-18 05:18:53', 'User logged out successfully', 240),
(5, 6, 6, '2014-12-18 05:18:37', 'Advertiser advertiser logged in successfully', 241),
(5, 5, 5, '2014-12-18 05:18:40', 'Media Owner pintos logged in successfully', 242),
(5, 5, 5, '2014-12-18 05:18:18', 'Media Owner pintos logged in successfully', 243),
(5, 5, 5, '2014-12-18 05:18:54', 'User logged out successfully', 244),
(5, 6, 6, '2014-12-18 05:18:04', 'Advertiser advertiser logged in successfully', 245),
(5, 6, 6, '2014-12-18 05:18:51', 'Advertiser advertiser logged in successfully', 246),
(1, 6, 1, '2014-12-18 06:18:45', 'Asset id: added to user:6''s watchlist', 247),
(1, 6, 5, '2014-12-18 06:18:48', 'Asset id: added to user:6''s watchlist', 248),
(5, 6, 6, '2014-12-18 14:18:37', 'Advertiser advertiser logged in successfully', 249),
(5, 6, 6, '2014-12-18 14:18:09', 'Advertiser advertiser logged in successfully', 250),
(5, 6, 6, '2014-12-18 14:18:46', 'Advertiser advertiser logged in successfully', 251),
(5, 6, 6, '2014-12-18 14:18:56', 'Advertiser advertiser logged in successfully', 252),
(5, 6, 6, '2014-12-18 14:18:29', 'Advertiser advertiser logged in successfully', 253),
(2, 6, 0, '2014-12-18 14:18:39', '100 Bid placed', 254),
(5, 6, 6, '2014-12-18 14:18:59', 'User logged out successfully', 255),
(5, 6, 6, '2014-12-18 15:18:02', 'Advertiser advertiser logged in successfully', 256),
(5, 6, 6, '2014-12-18 15:18:45', 'Advertiser advertiser logged in successfully', 257),
(2, 6, 7, '2014-12-18 16:18:29', ' Bid placed', 258),
(2, 6, 0, '2014-12-18 16:18:37', '500 Bid placed', 259),
(5, 6, 6, '2014-12-18 17:18:01', 'User logged out successfully', 260),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-18 21:18:06', 261),
(5, 7, 7, '2014-12-18 17:18:16', 'User logged out successfully', 262),
(5, 6, 6, '2014-12-18 17:18:20', 'Advertiser advertiser logged in successfully', 263),
(2, 6, 0, '2014-12-18 17:18:13', '600 Bid placed', 264),
(2, 6, 0, '2014-12-18 17:18:17', '552 Bid placed', 265),
(2, 6, 1, '2014-12-18 17:18:02', '40000 Bid placed', 266),
(6, 6, 5, '2014-12-18 17:18:47', 'Asset id:5 added to user:6''s watchlist', 267),
(2, 6, 1, '2014-12-18 18:18:03', '250 Bid placed', 268),
(5, 6, 6, '2014-12-19 04:19:22', 'Advertiser advertiser logged in successfully', 269),
(5, 6, 6, '2014-12-19 07:19:38', 'Advertiser advertiser logged in successfully', 270),
(2, 6, 0, '2014-12-19 09:19:37', '800 Bid placed', 271),
(2, 6, 5, '2014-12-19 09:19:06', '800 Bid placed', 272),
(2, 6, 5, '2014-12-19 09:19:37', '1000 Bid placed', 273),
(5, 6, 6, '2014-12-20 06:20:14', 'Advertiser advertiser logged in successfully', 274),
(5, 6, 6, '2014-12-20 11:20:02', 'Advertiser advertiser logged in successfully', 275),
(5, 6, 6, '2014-12-21 05:21:16', 'Advertiser advertiser logged in successfully', 276),
(5, 6, 6, '2014-12-21 05:21:24', 'Advertiser advertiser logged in successfully', 277),
(5, 6, 6, '2014-12-21 06:21:27', 'Advertiser advertiser logged in successfully', 278),
(5, 6, 6, '2014-12-21 06:21:58', 'User logged out successfully', 279),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-21 10:21:11', 280),
(5, 7, 7, '2014-12-21 06:21:38', 'User logged out successfully', 281),
(5, 5, 5, '2014-12-21 06:21:46', 'Media Owner pintos logged in successfully', 282),
(5, 5, 5, '2014-12-21 06:21:02', 'User logged out successfully', 283),
(5, 6, 6, '2014-12-21 06:21:10', 'Advertiser advertiser logged in successfully', 284),
(5, 6, 6, '2014-12-21 11:21:56', 'Advertiser advertiser logged in successfully', 285),
(6, 6, 0, '2014-12-21 11:21:40', 'Asset id: added to user:6''s watchlist', 286),
(2, 6, 0, '2014-12-21 12:21:35', '12100 Bid placed', 287),
(5, 6, 6, '2014-12-22 04:22:28', 'Advertiser advertiser logged in successfully', 288),
(5, 6, 6, '2014-12-22 04:22:12', 'User logged out successfully', 289),
(0, 0, 7, '0000-00-00 00:00:00', '2014-12-22 08:22:20', 290),
(5, 7, 7, '2014-12-22 04:22:36', 'User logged out successfully', 291),
(5, 6, 6, '2014-12-22 04:22:41', 'Advertiser advertiser logged in successfully', 292),
(5, 6, 6, '2014-12-23 02:23:59', 'Advertiser advertiser logged in successfully', 293),
(5, 6, 6, '2014-12-23 05:23:18', 'Advertiser advertiser logged in successfully', 294),
(5, 5, 5, '2014-12-23 05:23:08', 'Media Owner  logged in successfully', 295),
(5, 6, 6, '2014-12-23 05:23:13', 'Advertiser advertiser logged in successfully', 296),
(5, 6, 6, '2014-12-27 08:27:52', 'Advertiser advertiser logged in successfully', 297),
(5, 6, 6, '2014-12-27 16:27:00', 'Advertiser advertiser logged in successfully', 298),
(5, 6, 6, '2014-12-28 11:28:26', 'Advertiser advertiser logged in successfully', 299),
(5, 6, 6, '2014-12-29 05:29:06', 'Advertiser advertiser logged in successfully', 300),
(5, 6, 6, '2014-12-29 05:29:58', 'Advertiser advertiser logged in successfully', 301),
(6, 6, 0, '2014-12-29 06:29:02', 'Asset id: added to user:6''s watchlist', 302),
(5, 6, 6, '2014-12-29 06:29:57', 'Advertiser advertiser logged in successfully', 303),
(5, 5, 5, '2014-12-29 15:29:30', 'Media Owner  logged in successfully', 304),
(5, 6, 6, '2014-12-29 15:29:40', 'Advertiser advertiser logged in successfully', 305),
(5, 5, 5, '2014-12-30 15:30:18', 'Media Owner  logged in successfully', 306),
(5, 6, 6, '2014-12-30 15:30:23', 'Advertiser advertiser logged in successfully', 307),
(5, 6, 6, '2014-12-31 05:31:37', 'Advertiser advertiser logged in successfully', 308),
(5, 5, 5, '2014-12-31 12:31:34', 'Media Owner  logged in successfully', 309),
(5, 6, 6, '2014-12-31 12:31:32', 'Advertiser advertiser logged in successfully', 310),
(5, 5, 5, '2014-12-31 14:31:15', 'Media Owner  logged in successfully', 311),
(5, 6, 6, '2014-12-31 14:31:19', 'Advertiser advertiser logged in successfully', 312),
(5, 6, 6, '2014-12-31 19:31:03', 'Advertiser advertiser logged in successfully', 313),
(6, 6, 0, '2014-12-31 22:01:08', 'Asset id: added to user:6''s watchlist', 314),
(5, 6, 6, '2015-01-03 06:03:24', 'Advertiser advertiser logged in successfully', 315),
(1, 6, 2, '2015-01-03 06:03:16', 'Asset id:2 added to user:6''s watchlist', 316),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 10:3:28', 317),
(5, 6, 6, '2015-01-03 07:03:08', 'Advertiser advertiser logged in successfully', 318),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 11:3:26', 319),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 11:3:10', 320),
(5, 7, 7, '2015-01-03 07:03:53', 'User logged out successfully', 321),
(5, 7, 7, '2015-01-03 07:03:53', 'User logged out successfully', 322),
(5, 6, 6, '2015-01-03 07:03:57', 'Advertiser advertiser logged in successfully', 323),
(5, 6, 6, '2015-01-03 07:03:59', 'User logged out successfully', 324),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 11:3:11', 325),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 12:3:23', 326),
(5, 7, 7, '2015-01-03 08:03:10', 'User logged out successfully', 327),
(5, 6, 6, '2015-01-03 08:03:19', 'Advertiser advertiser logged in successfully', 328),
(5, 5, 5, '2015-01-03 16:03:02', 'Media Owner  logged in successfully', 329),
(5, 6, 6, '2015-01-03 16:03:23', 'Advertiser advertiser logged in successfully', 330),
(5, 6, 6, '2015-01-03 16:03:26', 'User logged out successfully', 331),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 20:3:31', 332),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 20:3:49', 333),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-03 22:3:12', 334),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 12:4:16', 335),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 12:4:46', 336),
(5, 6, 6, '2015-01-04 09:04:06', 'Advertiser advertiser logged in successfully', 337),
(5, 6, 6, '2015-01-04 09:04:43', 'User logged out successfully', 338),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 13:4:46', 339),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 14:4:58', 340),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 14:4:35', 341),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 14:4:00', 342),
(5, 6, 6, '2015-01-04 10:04:05', 'User logged out successfully', 343),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 14:4:09', 344),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 19:4:53', 345),
(5, 7, 7, '2015-01-04 15:04:31', 'User logged out successfully', 346),
(5, 5, 5, '2015-01-04 15:04:42', 'Media Owner pintos logged in successfully', 347),
(5, 5, 5, '2015-01-04 16:04:10', 'User logged out successfully', 348),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 20:4:15', 349),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 20:4:58', 350),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-04 20:4:43', 351),
(5, 6, 6, '2015-01-04 16:04:45', 'Advertiser advertiser logged in successfully', 352),
(5, 6, 6, '2015-01-04 17:04:22', 'Advertiser advertiser logged in successfully', 353),
(5, 6, 6, '2015-01-04 20:05:36', 'User logged out successfully', 354),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-05 00:5:40', 355),
(5, 7, 7, '2015-01-04 20:05:58', 'User logged out successfully', 356),
(5, 6, 6, '2015-01-04 20:05:02', 'Advertiser advertiser logged in successfully', 357),
(5, 6, 6, '2015-01-04 20:05:34', 'User logged out successfully', 358),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-05 00:5:37', 359),
(5, 6, 6, '2015-01-06 07:06:54', 'Advertiser advertiser logged in successfully', 360),
(5, 6, 6, '2015-01-06 08:06:41', 'Advertiser advertiser logged in successfully', 361),
(1, 6, 5, '2015-01-06 08:06:11', 'Asset id:5 added to user:6''s watchlist', 362),
(5, 6, 6, '2015-01-06 08:06:54', 'Advertiser advertiser logged in successfully', 363),
(5, 5, 5, '2015-01-06 10:06:43', 'Media Owner pintos logged in successfully', 364),
(5, 5, 5, '2015-01-06 10:06:08', 'User logged out successfully', 365),
(5, 6, 6, '2015-01-06 14:06:41', 'Advertiser advertiser logged in successfully', 366),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-06 20:6:12', 367),
(5, 6, 6, '2015-01-07 06:07:53', 'Advertiser advertiser logged in successfully', 368),
(5, 6, 6, '2015-01-07 10:07:15', 'Advertiser advertiser logged in successfully', 369),
(6, 6, 0, '2015-01-07 10:07:38', 'Asset id: added to user:6''s watchlist', 370),
(5, 5, 5, '2015-01-07 12:07:24', 'Media Owner pintos logged in successfully', 371),
(5, 6, 6, '2015-01-07 12:07:57', 'Advertiser advertiser logged in successfully', 372),
(5, 6, 6, '2015-01-07 12:07:56', 'Advertiser advertiser logged in successfully', 373),
(6, 6, 0, '2015-01-07 12:07:03', 'Asset id: added to user:6''s watchlist', 374),
(6, 6, 0, '2015-01-07 12:07:11', 'Asset id: added to user:6''s watchlist', 375),
(6, 6, 0, '2015-01-07 12:07:13', 'Asset id: added to user:6''s watchlist', 376),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-07 16:7:02', 377),
(5, 6, 6, '2015-01-07 13:07:50', 'User logged out successfully', 378),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-07 17:7:56', 379),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-09 19:9:38', 380),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-10 09:10:57', 381),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-10 11:10:20', 382),
(5, 7, 7, '2015-01-10 14:10:23', 'User logged out successfully', 383),
(5, 5, 5, '2015-01-10 14:10:28', 'Media Owner pintos logged in successfully', 384),
(5, 5, 5, '2015-01-10 14:10:50', 'User logged out successfully', 385),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-10 18:10:56', 386),
(5, 7, 7, '2015-01-10 14:10:10', 'User logged out successfully', 387),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-11 13:11:34', 388),
(5, 6, 6, '2015-01-13 09:13:44', 'Advertiser advertiser logged in successfully', 389),
(2, 6, 0, '2015-01-13 09:13:29', '23000 Bid placed', 390),
(1, 6, 1, '2015-01-13 09:13:55', 'Asset id:1 added to user:6''s watchlist', 391),
(2, 6, 1, '2015-01-13 09:13:50', '3500 Bid placed', 392),
(2, 6, 0, '2015-01-13 09:13:02', '23000 Bid placed', 393),
(5, 6, 6, '2015-01-13 09:13:39', 'User logged out successfully', 394),
(5, 5, 5, '2015-01-13 10:13:08', 'Media Owner pintos logged in successfully', 395),
(5, 5, 5, '2015-01-13 10:13:05', 'User logged out successfully', 396),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-13 14:13:21', 397),
(5, 7, 7, '2015-01-13 10:13:36', 'User logged out successfully', 398),
(5, 6, 6, '2015-01-13 10:13:44', 'Advertiser advertiser logged in successfully', 399),
(5, 5, 5, '2015-01-14 05:14:14', 'Media Owner pintos logged in successfully', 400),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-14 09:14:40', 401),
(5, 5, 5, '2015-01-14 05:14:39', 'Media Owner pintos logged in successfully', 402),
(5, 6, 6, '2015-01-14 07:14:07', 'Advertiser advertiser logged in successfully', 403),
(5, 6, 6, '2015-01-14 09:14:06', 'Advertiser advertiser logged in successfully', 404),
(5, 6, 6, '2015-01-14 09:14:37', 'User logged out successfully', 405),
(5, 5, 5, '2015-01-14 09:14:45', 'Media Owner pintos logged in successfully', 406),
(5, 6, 6, '2015-01-14 09:14:24', 'Advertiser advertiser logged in successfully', 407),
(5, 6, 6, '2015-01-15 06:15:10', 'Advertiser advertiser logged in successfully', 408),
(5, 6, 6, '2015-01-15 06:15:11', 'Advertiser advertiser logged in successfully', 409),
(5, 6, 6, '2015-01-16 14:16:54', 'Advertiser advertiser logged in successfully', 410),
(5, 6, 6, '2015-01-16 15:16:43', 'User logged out successfully', 411),
(5, 6, 6, '2015-01-16 15:16:00', 'Advertiser advertiser logged in successfully', 412),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-17 10:17:03', 413),
(5, 7, 7, '2015-01-17 06:17:26', 'User logged out successfully', 414),
(5, 5, 5, '2015-01-17 06:17:31', 'Media Owner pintos logged in successfully', 415),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-17 14:17:22', 416),
(5, 7, 7, '2015-01-17 10:17:40', 'User logged out successfully', 417),
(5, 6, 6, '2015-01-17 10:17:56', 'Advertiser advertiser logged in successfully', 418),
(5, 6, 6, '2015-01-17 11:17:23', 'User logged out successfully', 419),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-17 15:17:28', 420),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-18 09:18:45', 421),
(5, 7, 7, '2015-01-18 05:18:03', 'User logged out successfully', 422),
(5, 0, 0, '2015-01-18 05:18:03', 'User logged out successfully', 423),
(5, 6, 6, '2015-01-18 05:18:09', 'Advertiser advertiser logged in successfully', 424),
(5, 6, 6, '2015-01-19 08:19:05', 'Advertiser advertiser logged in successfully', 425),
(5, 6, 6, '2015-01-19 08:19:09', 'User logged out successfully', 426),
(5, 6, 6, '2015-01-19 08:19:19', 'Advertiser advertiser logged in successfully', 427),
(5, 6, 6, '2015-01-19 17:19:12', 'Advertiser advertiser logged in successfully', 428),
(5, 6, 6, '2015-01-19 18:19:02', 'User logged out successfully', 429),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-20 10:20:01', 430),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-20 11:20:44', 431),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-20 11:20:13', 432),
(5, 7, 7, '2015-01-20 07:20:20', 'User logged out successfully', 433),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-20 11:20:43', 434),
(5, 7, 7, '2015-01-20 07:20:47', 'User logged out successfully', 435),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-20 11:20:57', 436),
(5, 7, 7, '2015-01-20 07:20:13', 'User logged out successfully', 437),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-20 11:20:32', 438),
(5, 7, 7, '2015-01-20 07:20:45', 'User logged out successfully', 439),
(5, 6, 6, '2015-01-20 07:20:51', 'Advertiser advertiser logged in successfully', 440),
(5, 6, 6, '2015-01-20 07:20:56', 'User logged out successfully', 441),
(5, 6, 6, '2015-01-20 07:20:58', 'Advertiser advertiser logged in successfully', 442),
(5, 6, 6, '2015-01-20 07:20:00', 'User logged out successfully', 443),
(5, 6, 6, '2015-01-20 07:20:45', 'Advertiser advertiser logged in successfully', 444),
(5, 6, 6, '2015-01-20 08:20:24', 'Advertiser advertiser logged in successfully', 445),
(5, 6, 6, '2015-01-20 08:20:57', 'User logged out successfully', 446),
(5, 6, 6, '2015-01-20 08:20:02', 'Advertiser advertiser logged in successfully', 447),
(5, 6, 6, '2015-01-20 08:20:12', 'User logged out successfully', 448),
(5, 5, 5, '2015-01-20 08:20:17', 'Media Owner pintos logged in successfully', 449),
(5, 5, 5, '2015-01-20 09:20:35', 'Media Owner pintos logged in successfully', 450),
(5, 5, 5, '2015-01-20 09:20:56', 'User logged out successfully', 451),
(5, 5, 5, '2015-01-20 09:20:45', 'Media Owner pintos logged in successfully', 452),
(5, 6, 6, '2015-01-21 06:21:57', 'Advertiser advertiser logged in successfully', 453),
(0, 0, 7, '0000-00-00 00:00:00', '2015-01-21 14:21:05', 454),
(5, 7, 7, '2015-01-21 10:21:51', 'User logged out successfully', 455),
(5, 6, 6, '2015-01-21 10:21:01', 'Advertiser advertiser logged in successfully', 456),
(5, 6, 6, '2015-01-21 12:21:51', 'Advertiser advertiser logged in successfully', 457),
(5, 6, 6, '2015-01-21 12:21:27', 'Advertiser advertiser logged in successfully', 458),
(5, 6, 6, '2015-01-21 13:21:49', 'Advertiser advertiser logged in successfully', 459),
(5, 6, 6, '2015-01-22 12:22:21', 'Advertiser advertiser logged in successfully', 460),
(5, 5, 5, '2015-01-22 18:22:43', 'Media Owner pintos logged in successfully', 461),
(5, 5, 5, '2015-01-22 18:22:25', 'Media Owner pintos logged in successfully', 462),
(5, 5, 5, '2015-01-22 18:22:33', 'Media Owner pintos logged in successfully', 463),
(5, 5, 5, '2015-01-24 08:24:58', 'Media Owner pintos logged in successfully', 464),
(5, 6, 6, '2015-01-26 10:26:35', 'Advertiser advertiser logged in successfully', 465),
(5, 6, 6, '2015-01-26 11:26:18', 'Advertiser advertiser logged in successfully', 466),
(5, 6, 6, '2015-01-28 08:28:23', 'Advertiser advertiser logged in successfully', 467),
(5, 5, 5, '2015-02-02 17:02:52', 'Media Owner pintos logged in successfully', 468),
(5, 5, 5, '2015-02-02 19:02:00', 'User logged out successfully', 469),
(5, 6, 6, '2015-02-02 19:02:06', 'Advertiser advertiser logged in successfully', 470),
(5, 6, 6, '2015-02-02 21:03:27', 'User logged out successfully', 471),
(5, 6, 6, '2015-02-02 21:03:28', 'Advertiser advertiser logged in successfully', 472),
(5, 6, 6, '2015-02-03 04:03:15', 'Advertiser advertiser logged in successfully', 473),
(5, 6, 6, '2015-02-03 04:03:01', 'Advertiser advertiser logged in successfully', 474),
(5, 6, 6, '2015-02-03 07:03:27', 'Advertiser advertiser logged in successfully', 475),
(5, 6, 6, '2015-02-03 19:03:31', 'Advertiser advertiser logged in successfully', 476),
(5, 6, 6, '2015-02-03 21:04:27', 'User logged out successfully', 477),
(5, 5, 5, '2015-02-03 21:04:37', 'Media Owner pintos logged in successfully', 478),
(5, 6, 6, '2015-02-04 18:04:23', 'Advertiser advertiser logged in successfully', 479),
(5, 5, 5, '2015-02-04 22:05:27', 'Media Owner pintos logged in successfully', 480),
(5, 6, 6, '2015-02-06 07:06:39', 'Advertiser advertiser logged in successfully', 481),
(5, 5, 5, '2015-02-08 10:08:09', 'Media Owner pintos logged in successfully', 482),
(5, 5, 5, '2015-02-08 16:08:53', 'Media Owner pintos logged in successfully', 483),
(5, 5, 5, '2015-02-08 19:08:27', 'Media Owner pintos logged in successfully', 484),
(2, 5, 0, '2015-02-08 20:09:11', '0 Bid placed', 485),
(5, 5, 5, '2015-02-09 05:09:35', 'Media Owner pintos logged in successfully', 486),
(2, 5, 0, '2015-02-09 05:09:08', '0 Bid placed', 487),
(5, 5, 5, '2015-02-13 09:13:14', 'Media Owner pintos logged in successfully', 488),
(5, 5, 5, '2015-02-13 16:13:29', 'Media Owner pintos logged in successfully', 489),
(5, 5, 5, '2015-02-14 14:14:29', 'Media Owner pintos logged in successfully', 490),
(5, 5, 5, '2015-02-17 00:17:47', 'Media Owner pintos logged in successfully', 491),
(5, 6, 6, '2015-02-17 05:17:37', 'Advertiser advertiser logged in successfully', 492),
(5, 6, 6, '2015-02-17 06:17:41', 'Advertiser advertiser logged in successfully', 493),
(5, 5, 5, '2015-02-18 17:18:07', 'Media Owner pintos logged in successfully', 494),
(5, 5, 5, '2015-02-18 17:18:08', 'User logged out successfully', 495),
(5, 5, 5, '2015-02-18 17:18:10', 'Media Owner pintos logged in successfully', 496),
(5, 5, 5, '2015-02-18 18:18:56', 'Media Owner pintos logged in successfully', 497),
(5, 6, 6, '2015-02-18 19:18:51', 'Advertiser advertiser logged in successfully', 498),
(5, 6, 6, '2015-02-18 20:19:49', 'Advertiser advertiser logged in successfully', 499),
(5, 5, 5, '2015-02-19 18:19:50', 'Media Owner pintos logged in successfully', 500),
(5, 5, 5, '2015-02-19 21:20:17', 'Media Owner pintos logged in successfully', 501),
(0, 0, 7, '0000-00-00 00:00:00', '2015-02-22 01:22:41', 502),
(5, 7, 7, '2015-02-21 21:22:46', 'User logged out successfully', 503),
(5, 5, 5, '2015-02-21 21:22:53', 'Media Owner pintos logged in successfully', 504),
(5, 5, 5, '2015-02-22 20:23:45', 'Media Owner pintos logged in successfully', 505),
(5, 5, 5, '2015-02-22 20:23:42', 'Media Owner pintos logged in successfully', 506),
(5, 5, 5, '2015-02-23 05:23:20', 'Media Owner pintos logged in successfully', 507),
(5, 5, 5, '2015-02-24 01:24:31', 'Media Owner pintos logged in successfully', 508),
(5, 5, 5, '2015-02-25 01:25:09', 'Media Owner pintos logged in successfully', 509),
(5, 5, 5, '2015-02-26 04:26:23', 'Media Owner pintos logged in successfully', 510),
(5, 5, 5, '2015-03-01 06:01:16', 'Media Owner pintos logged in successfully', 511),
(5, 5, 5, '2015-03-01 06:01:34', 'User logged out successfully', 512),
(5, 5, 5, '2015-03-01 06:01:37', 'Media Owner pintos logged in successfully', 513),
(5, 5, 5, '2015-03-02 16:02:50', 'Media Owner pintos logged in successfully', 514),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-02 21:2:22', 515),
(5, 5, 5, '2015-03-02 20:03:22', 'Media Owner pintos logged in successfully', 516),
(5, 5, 5, '2015-03-02 20:03:03', 'User logged out successfully', 517),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-03 00:3:08', 518),
(5, 7, 7, '2015-03-02 20:03:40', 'User logged out successfully', 519),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-03 00:3:20', 520),
(5, 7, 7, '2015-03-02 20:03:49', 'User logged out successfully', 521),
(5, 5, 5, '2015-03-02 20:03:55', 'Media Owner pintos logged in successfully', 522),
(6, 5, 5, '2015-03-02 20:03:23', 'Asset id:5 removed from user:5''s watchlist', 523),
(1, 5, 8, '2015-03-02 20:03:48', 'Auction for Asset My Asset 1 (REF 001) (1) created', 524),
(5, 5, 5, '2015-03-02 20:03:34', 'User logged out successfully', 525),
(5, 5, 5, '2015-03-02 20:03:42', 'Media Owner pintos logged in successfully', 526),
(1, 5, 9, '2015-03-02 20:03:40', 'Auction for Asset My Asset 15 (REF 015) (12) created', 527),
(1, 5, 0, '2015-03-02 20:03:12', 'Auction for Asset id:1 ', 528),
(1, 5, 10, '2015-03-02 20:03:51', 'Auction for Asset My Asset 2 (REF 002) (2) created', 529),
(1, 5, 0, '2015-03-02 20:03:59', 'Auction for Asset id:1 approved', 530),
(5, 6, 6, '2015-03-03 12:03:50', 'Advertiser advertiser logged in successfully', 531),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-04 21:4:52', 532),
(5, 7, 7, '2015-03-04 17:04:15', 'User logged out successfully', 533),
(5, 6, 6, '2015-03-04 17:04:22', 'Advertiser advertiser logged in successfully', 534),
(5, 6, 6, '2015-03-04 17:04:18', 'User logged out successfully', 535),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-04 21:4:22', 536),
(5, 5, 5, '2015-03-05 13:05:49', 'Media Owner pintos logged in successfully', 537),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-05 17:5:28', 538),
(5, 5, 5, '2015-03-08 14:08:54', 'Media Owner pintos logged in successfully', 539),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-08 18:8:40', 540),
(5, 5, 5, '2015-03-08 16:08:40', 'Media Owner pintos logged in successfully', 541),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-08 20:8:29', 542),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-09 12:9:52', 543),
(5, 5, 5, '2015-03-09 08:09:02', 'Media Owner pintos logged in successfully', 544),
(5, 5, 5, '2015-03-09 15:09:38', 'Media Owner pintos logged in successfully', 545),
(5, 5, 5, '2015-03-11 06:11:57', 'Media Owner pintos logged in successfully', 546),
(5, 5, 5, '2015-03-11 06:11:54', 'Media Owner pintos logged in successfully', 547),
(5, 5, 5, '2015-03-11 07:11:45', 'Media Owner pintos logged in successfully', 548),
(5, 5, 5, '2015-03-11 13:11:43', 'Media Owner pintos logged in successfully', 549),
(5, 5, 5, '2015-03-11 16:11:33', 'Media Owner pintos logged in successfully', 550),
(5, 5, 5, '2015-03-11 18:11:17', 'Media Owner pintos logged in successfully', 551),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-11 22:11:12', 552),
(5, 5, 5, '2015-03-11 20:12:00', 'User logged out successfully', 553),
(5, 5, 5, '2015-03-11 20:12:56', 'Media Owner pintos logged in successfully', 554),
(5, 7, 7, '2015-03-11 20:12:22', 'User logged out successfully', 555),
(5, 5, 5, '2015-03-11 20:12:30', 'Media Owner pintos logged in successfully', 556),
(5, 5, 5, '2015-03-12 03:12:18', 'Media Owner pintos logged in successfully', 557),
(5, 5, 5, '2015-03-12 06:12:52', 'Media Owner  logged in successfully', 558),
(5, 5, 5, '2015-03-12 06:12:38', 'Media Owner pintos logged in successfully', 559),
(5, 5, 5, '2015-03-12 06:12:15', 'Media Owner pintos logged in successfully', 560),
(5, 5, 5, '2015-03-12 13:12:47', 'Media Owner pintos logged in successfully', 561),
(5, 5, 5, '2015-03-12 13:12:27', 'Media Owner pintos logged in successfully', 562),
(5, 5, 5, '2015-03-13 08:13:03', 'Media Owner pintos logged in successfully', 563),
(5, 5, 5, '2015-03-13 08:13:51', 'Media Owner pintos logged in successfully', 564),
(5, 5, 5, '2015-03-15 15:15:59', 'Media Owner pintos logged in successfully', 565),
(5, 5, 5, '2015-03-16 10:16:08', 'Media Owner pintos logged in successfully', 566),
(5, 5, 5, '2015-03-16 16:16:49', 'Media Owner pintos logged in successfully', 567),
(5, 5, 5, '2015-03-17 13:17:11', 'Media Owner pintos logged in successfully', 568),
(5, 5, 5, '2015-03-17 17:17:14', 'Media Owner pintos logged in successfully', 569),
(5, 5, 5, '2015-03-17 18:17:28', 'Media Owner pintos logged in successfully', 570),
(5, 5, 5, '2015-03-18 14:18:43', 'Media Owner pintos logged in successfully', 571),
(5, 5, 5, '2015-03-19 03:19:45', 'Media Owner pintos logged in successfully', 572),
(5, 5, 5, '2015-03-19 08:19:12', 'Media Owner pintos logged in successfully', 573),
(5, 5, 5, '2015-03-19 16:19:50', 'Media Owner pintos logged in successfully', 574),
(5, 5, 5, '2015-03-19 17:19:55', 'User logged out successfully', 575),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-19 21:19:01', 576),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-19 21:19:16', 577),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-20 08:20:21', 578),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-20 08:20:55', 579),
(5, 5, 5, '2015-03-20 11:20:48', 'Media Owner pintos logged in successfully', 580),
(5, 5, 5, '2015-03-20 11:20:17', 'User logged out successfully', 581),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-20 15:20:23', 582),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-21 08:21:12', 583),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-21 12:21:20', 584),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-22 13:22:56', 585),
(5, 5, 5, '2015-03-22 12:22:07', 'Media Owner pintos logged in successfully', 586),
(5, 5, 5, '2015-03-22 12:22:37', 'User logged out successfully', 587),
(5, 5, 5, '2015-03-22 12:22:49', 'Media Owner pintos logged in successfully', 588),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-22 20:22:04', 589),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-23 15:23:15', 590),
(5, 7, 7, '2015-03-23 13:23:07', 'User logged out successfully', 591),
(5, 6, 6, '2015-03-23 13:23:16', 'Advertiser advertiser logged in successfully', 592),
(5, 6, 6, '2015-03-23 14:23:43', 'User logged out successfully', 593),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-23 16:23:51', 594),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-23 16:23:09', 595),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-24 11:24:15', 596),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-25 13:25:39', 597),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-27 15:27:00', 598),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-27 17:27:41', 599),
(5, 7, 7, '2015-03-27 15:27:54', 'User logged out successfully', 600),
(5, 7, 7, '2015-03-27 15:27:24', 'User logged out successfully', 601),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 602),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 603),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 604),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 605),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 606),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 607),
(5, 0, 0, '2015-03-27 15:27:12', 'User logged out successfully', 608),
(5, 5, 5, '2015-03-27 15:27:38', 'Media Owner pintos logged in successfully', 609),
(5, 5, 5, '2015-03-27 16:27:10', 'User logged out successfully', 610),
(5, 6, 6, '2015-03-27 16:27:28', 'Advertiser advertiser logged in successfully', 611),
(5, 6, 6, '2015-03-27 16:27:01', 'User logged out successfully', 612),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-27 18:27:32', 613),
(5, 7, 7, '2015-03-27 16:27:56', 'User logged out successfully', 614),
(5, 5, 5, '2015-03-27 16:27:09', 'Media Owner pintos logged in successfully', 615),
(5, 5, 5, '2015-03-27 16:27:22', 'User logged out successfully', 616),
(5, 5, 5, '2015-03-28 09:28:12', 'Media Owner pintos logged in successfully', 617),
(5, 5, 5, '2015-03-28 09:28:56', 'User logged out successfully', 618),
(5, 6, 6, '2015-03-28 09:28:03', 'Advertiser advertiser logged in successfully', 619),
(5, 6, 6, '2015-03-28 09:28:17', 'User logged out successfully', 620),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-28 11:28:27', 621),
(5, 7, 7, '2015-03-28 11:28:55', 'User logged out successfully', 622),
(5, 5, 5, '2015-03-28 11:28:33', 'Media Owner pintos logged in successfully', 623),
(5, 5, 5, '2015-03-28 11:28:49', 'User logged out successfully', 624),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-28 13:28:03', 625),
(5, 5, 5, '2015-03-28 14:28:01', 'Media Owner pintos logged in successfully', 626),
(5, 5, 5, '2015-03-28 14:28:55', 'Media Owner  logged in successfully', 627),
(5, 5, 5, '2015-03-28 14:28:57', 'Media Owner  logged in successfully', 628),
(5, 5, 5, '2015-03-28 14:28:58', 'Media Owner  logged in successfully', 629),
(5, 6, 6, '2015-03-28 14:28:06', 'Advertiser advertiser logged in successfully', 630),
(5, 5, 5, '2015-03-28 15:28:31', 'User logged out successfully', 631),
(5, 5, 5, '2015-03-28 15:28:44', 'Media Owner pintos logged in successfully', 632),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-28 22:28:13', 633),
(5, 6, 6, '2015-03-28 22:29:41', 'Advertiser advertiser logged in successfully', 634),
(5, 6, 6, '2015-03-28 22:29:14', 'User logged out successfully', 635),
(5, 5, 5, '2015-03-28 22:29:23', 'Media Owner pintos logged in successfully', 636),
(5, 5, 5, '2015-03-28 22:29:17', 'User logged out successfully', 637),
(5, 5, 5, '2015-03-28 22:29:23', 'Media Owner pintos logged in successfully', 638),
(5, 5, 5, '2015-03-28 22:29:47', 'User logged out successfully', 639),
(5, 6, 6, '2015-03-28 22:29:53', 'Advertiser advertiser logged in successfully', 640),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-29 01:29:22', 641),
(5, 6, 6, '2015-03-29 01:29:11', 'User logged out successfully', 642),
(5, 5, 5, '2015-03-29 01:29:20', 'Media Owner pintos logged in successfully', 643),
(5, 5, 5, '2015-03-29 07:29:53', 'Media Owner pintos logged in successfully', 644),
(5, 5, 5, '2015-03-29 07:29:56', 'User logged out successfully', 645),
(5, 5, 5, '2015-03-29 07:29:56', 'User logged out successfully', 646),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-29 09:29:02', 647),
(5, 5, 5, '2015-03-29 10:29:22', 'Media Owner pintos logged in successfully', 648),
(5, 7, 7, '2015-03-29 14:29:02', 'User logged out successfully', 649),
(5, 6, 6, '2015-03-29 14:29:09', 'Advertiser advertiser logged in successfully', 650),
(5, 6, 6, '2015-03-29 14:29:53', 'User logged out successfully', 651),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-29 16:29:00', 652),
(5, 7, 7, '2015-03-29 14:29:21', 'User logged out successfully', 653),
(5, 5, 5, '2015-03-29 14:29:31', 'Media Owner pintos logged in successfully', 654),
(5, 5, 5, '2015-03-29 14:29:28', 'User logged out successfully', 655),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-29 16:29:40', 656),
(5, 7, 7, '2015-03-29 14:29:14', 'User logged out successfully', 657),
(5, 6, 6, '2015-03-29 14:29:21', 'Advertiser advertiser logged in successfully', 658),
(5, 6, 6, '2015-03-29 18:29:27', 'Advertiser advertiser logged in successfully', 659),
(5, 6, 6, '2015-03-31 07:31:03', 'Advertiser advertiser logged in successfully', 660),
(5, 6, 6, '2015-03-31 07:31:35', 'User logged out successfully', 661),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-31 09:31:41', 662),
(5, 7, 7, '2015-03-31 07:31:21', 'User logged out successfully', 663),
(5, 5, 5, '2015-03-31 07:31:31', 'Media Owner pintos logged in successfully', 664),
(5, 5, 5, '2015-03-31 07:31:02', 'User logged out successfully', 665),
(0, 0, 7, '0000-00-00 00:00:00', '2015-03-31 09:31:08', 666);

-- --------------------------------------------------------

--
-- Table structure for table `system_events_type`
--

CREATE TABLE `system_events_type` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_events_type`
--

INSERT INTO `system_events_type` (`id`, `name`, `description`, `active`) VALUES
(1, 'Auction', 'Auction related events', 1),
(2, 'Bids', 'Bids related events', 1),
(3, 'Campaign', 'Campaign related events', 1),
(4, 'News', 'News related events', 1),
(5, 'User', 'User related events', 1),
(6, 'Asset', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
`tax_id` smallint(6) NOT NULL,
  `tax_code` varchar(45) DEFAULT NULL,
  `tax_percentage` float DEFAULT NULL,
  `tax_mandatory` tinyint(4) DEFAULT NULL,
  `txt_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax_type`
--

CREATE TABLE `tax_type` (
`txt_id` smallint(6) NOT NULL,
  `txt_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_prop`
--

CREATE TABLE `tmp_prop` (
  `cam_id` int(4) NOT NULL,
  `use_id` int(4) NOT NULL,
  `assets` int(4) NOT NULL,
  `mec_id` int(4) NOT NULL,
  `lon` varchar(20) NOT NULL,
  `lat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `town`
--

CREATE TABLE `town` (
`tow_id` smallint(6) NOT NULL,
  `tow_description` varchar(255) DEFAULT NULL,
  `tow_code` varchar(255) DEFAULT NULL,
  `lot_id` smallint(6) DEFAULT NULL COMMENT 'FK : location_type'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `town`
--

INSERT INTO `town` (`tow_id`, `tow_description`, `tow_code`, `lot_id`) VALUES
(1, 'johannesburg', 'JHB', 1),
(2, 'pretoria', 'PRE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_category`
--

CREATE TABLE `transaction_category` (
`tctg_id` smallint(6) NOT NULL,
  `tctg_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_documents`
--

CREATE TABLE `uploaded_documents` (
`upd_id` smallint(6) NOT NULL,
  `upd_url` varchar(250) NOT NULL,
  `upd_filesize` varchar(250) NOT NULL,
  `upd_file_name` varchar(250) NOT NULL,
  `upd_file_type` varchar(250) NOT NULL,
  `upt_id` varchar(250) NOT NULL COMMENT 'FK to uploaded_file_type table',
  `ass_id` smallint(6) NOT NULL COMMENT 'FK to asset table',
  `use_id` smallint(6) DEFAULT NULL,
  `rfp_id` smallint(6) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_documents`
--

INSERT INTO `uploaded_documents` (`upd_id`, `upd_url`, `upd_filesize`, `upd_file_name`, `upd_file_type`, `upt_id`, `ass_id`, `use_id`, `rfp_id`) VALUES
(1, '/usr/www/users/indigfajaw/ads2trade/upload/asset_photos/py.png', '91.81', 'py.png', 'image/png', '0', 1, NULL, NULL),
(2, 'http://indigostorage.co.za/ads2trade/upload/asset_photos/10484991_10152411287073547_6592022208326102484_n.jpg', '81.31', '10484991_10152411287073547_6592022208326102484_n.jpg', 'image/jpeg', '0', 12, NULL, NULL),
(3, 'http://indigostorage.co.za/ads2trade/upload/asset_photos/call_me.png', '143.34', 'call_me.png', 'image/png', '0', 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_file_type`
--

CREATE TABLE `uploaded_file_type` (
`upt_id` smallint(6) NOT NULL,
  `upt_description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_file_type`
--

INSERT INTO `uploaded_file_type` (`upt_id`, `upt_description`) VALUES
(1, 'image/png'),
(2, 'image/jpeg'),
(3, 'image/png');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_photos`
--

CREATE TABLE `uploaded_photos` (
`upl_id` smallint(6) NOT NULL,
  `upl_url` varchar(250) NOT NULL,
  `ass_id` smallint(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_photos`
--

INSERT INTO `uploaded_photos` (`upl_id`, `upl_url`, `ass_id`) VALUES
(1, '/usr/www/users/indigfajaw/ads2trade/upload/asset_photos/Tamera1.jpg', 14),
(2, '/usr/www/users/indigfajaw/ads2trade/upload/asset_photos/call_me.png', 11);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
`use_id` smallint(5) unsigned NOT NULL,
  `use_password` varchar(32) NOT NULL,
  `ust_id` smallint(5) unsigned NOT NULL DEFAULT '5',
  `use_username` varchar(45) NOT NULL,
  `use_status` tinyint(4) NOT NULL DEFAULT '1',
  `pem_id` smallint(5) unsigned DEFAULT NULL,
  `use_registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `use_date_updated` datetime DEFAULT NULL,
  `use_date_deleted` datetime DEFAULT NULL,
  `use_first_name` varchar(35) DEFAULT NULL,
  `use_last_name` varchar(35) DEFAULT NULL,
  `use_email` varchar(50) DEFAULT NULL,
  `use_photo` varchar(200) NOT NULL,
  `use_mobile_number` varchar(12) NOT NULL,
  `use_company_name` varchar(120) NOT NULL,
  `use_street_number` varchar(10) NOT NULL,
  `use_suburb` varchar(40) NOT NULL,
  `use_city` varchar(50) NOT NULL,
  `use_country` varchar(50) NOT NULL,
  `use_terms_conditions` varchar(2) NOT NULL,
  `use_watchlist_mail` varchar(2) NOT NULL,
  `use_auction_bids_mail` varchar(2) NOT NULL,
  `use_notifications_mail` varchar(2) NOT NULL,
  `use_rfp_mail` varchar(2) NOT NULL,
  `use_workflow_mail` varchar(2) NOT NULL,
  `use_watchlist_sms` varchar(2) NOT NULL,
  `use_auctionlist_sms` varchar(2) NOT NULL,
  `use_notif_sms` varchar(2) NOT NULL,
  `use_rfp_sms` varchar(2) NOT NULL,
  `use_flow_sms` varchar(2) NOT NULL,
  `use_current_status` varchar(15) NOT NULL,
  `use_deposit` varchar(15) NOT NULL,
  `use_auction_limit` varchar(15) NOT NULL,
  `use_increase_limit` varchar(15) NOT NULL,
  `user_status` int(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`use_id`, `use_password`, `ust_id`, `use_username`, `use_status`, `pem_id`, `use_registration_date`, `use_date_updated`, `use_date_deleted`, `use_first_name`, `use_last_name`, `use_email`, `use_photo`, `use_mobile_number`, `use_company_name`, `use_street_number`, `use_suburb`, `use_city`, `use_country`, `use_terms_conditions`, `use_watchlist_mail`, `use_auction_bids_mail`, `use_notifications_mail`, `use_rfp_mail`, `use_workflow_mail`, `use_watchlist_sms`, `use_auctionlist_sms`, `use_notif_sms`, `use_rfp_sms`, `use_flow_sms`, `use_current_status`, `use_deposit`, `use_auction_limit`, `use_increase_limit`, `user_status`) VALUES
(5, 'pintos', 2, 'pintos', 1, NULL, '2014-08-22 07:37:39', '2014-12-11 08:12:20', NULL, 'media owner', 'developer', '', '', '', 'Indigo Vision', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2000', '', 1),
(6, 'advertiser', 1, 'advertiser', 1, NULL, '2014-07-18 12:09:41', '2015-03-03 12:03:22', NULL, 'advertiser', 'developer', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '175000000', '', 1),
(7, 'operator', 3, 'operator', 1, NULL, '2014-07-18 12:09:41', NULL, NULL, 'advertiser', 'developer', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1),
(8, 'tawanda', 2, 'tawanda', 1, NULL, '2014-07-16 15:33:59', '2015-01-17 03:01:21', NULL, 'media owner', 'developer', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1),
(9, 'd5cbfe9ff07fef1ecc93861ce5dd4f3b', 1, 'Simon', 1, NULL, '2014-08-22 07:51:09', NULL, NULL, 'Simon', 'Simon', 'monepim@webmail.co.za', '', '0987654323', 'Iscor', '6789', 'Brixton', 'johannesburg', 'South Africa', 'on', 'on', '0', 'on', 'on', '0', 'on', 'on', '0', '0', 'on', '', '', '', '', 1),
(10, 'd5cbfe9ff07fef1ecc93861ce5dd4f3b', 1, 'Simon', 0, NULL, '2014-10-19 14:51:58', NULL, NULL, 'Simon', 'Mohoalali', 'simon@4waysunited.org.za', '', '011 465 7869', 'Indigo', '6789', 'Bryanston', 'johannesburg', 'South Africa', 'on', 'on', '0', 'on', 'on', '0', 'on', 'on', '0', '0', 'on', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userfees`
--

CREATE TABLE `userfees` (
`id` int(15) NOT NULL,
  `auc_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `amt` double(6,4) NOT NULL DEFAULT '0.0000',
  `paid` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
`id` int(32) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `password` varchar(32) DEFAULT '',
  `hash` varchar(5) DEFAULT '',
  `name` tinytext,
  `address` tinytext,
  `city` varchar(25) DEFAULT '',
  `prov` varchar(20) DEFAULT '',
  `country` varchar(30) DEFAULT '',
  `zip` varchar(10) DEFAULT '',
  `phone` varchar(40) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `reg_date` int(15) DEFAULT NULL,
  `rate_sum` int(11) NOT NULL DEFAULT '0',
  `rate_num` int(11) NOT NULL DEFAULT '0',
  `birthdate` int(8) DEFAULT '0',
  `suspended` int(1) DEFAULT '0',
  `nletter` int(1) NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `auc_watch` text,
  `item_watch` text,
  `endemailmode` enum('one','cum','none') NOT NULL DEFAULT 'one',
  `startemailmode` enum('yes','no') NOT NULL DEFAULT 'yes',
  `emailtype` enum('html','text') NOT NULL DEFAULT 'html',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `payment_details` text,
  `groups` text,
  `bn_only` enum('y','n') NOT NULL DEFAULT 'y',
  `timecorrection` int(3) NOT NULL DEFAULT '0',
  `paypal_email` varchar(50) DEFAULT '',
  `authnet_id` varchar(50) DEFAULT '',
  `authnet_pass` varchar(50) DEFAULT '',
  `worldpay_id` varchar(50) DEFAULT '',
  `moneybookers_email` varchar(50) DEFAULT '',
  `toocheckout_id` varchar(50) DEFAULT '',
  `language` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nick`, `password`, `hash`, `name`, `address`, `city`, `prov`, `country`, `zip`, `phone`, `email`, `reg_date`, `rate_sum`, `rate_num`, `birthdate`, `suspended`, `nletter`, `balance`, `auc_watch`, `item_watch`, `endemailmode`, `startemailmode`, `emailtype`, `lastlogin`, `payment_details`, `groups`, `bn_only`, `timecorrection`, `paypal_email`, `authnet_id`, `authnet_pass`, `worldpay_id`, `moneybookers_email`, `toocheckout_id`, `language`) VALUES
(2, 'pintos', '0abf7e7895315a44a76f900145e08102', 'nlo9', 'mann', 'wrer', 'asad', 'adsf', 'South Africa', '0028', '12343', 'manntawee@gmail.com', 1406225100, 0, 0, 19810713, 8888, 1, 0, 'TEST WATCH', NULL, 'one', 'yes', 'html', '2014-08-12 21:47:52', NULL, '2,1', 'y', 0, '', '', '', '', '', '', 'EN');

-- --------------------------------------------------------

--
-- Table structure for table `usersips`
--

CREATE TABLE `usersips` (
`id` int(11) NOT NULL,
  `user` int(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `type` enum('first','after') NOT NULL DEFAULT 'first',
  `action` enum('accept','deny') NOT NULL DEFAULT 'accept'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersips`
--

INSERT INTO `usersips` (`id`, `user`, `ip`, `type`, `action`) VALUES
(1, 2, ' 127.0.0.1', 'first', 'accept'),
(2, 2, '::1', 'after', 'accept');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `usp_id` smallint(6) NOT NULL,
  `ust_id` smallint(6) DEFAULT NULL,
  `usp_description` varchar(45) DEFAULT NULL,
  `usp_edited_by` smallint(6) DEFAULT NULL,
  `usp_date_edited` datetime DEFAULT NULL,
  `usp_date_created` timestamp NULL DEFAULT NULL,
  `usp_created_by` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
`user_status_id` int(11) NOT NULL,
  `user_status_name` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='User status table';

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`user_status_id`, `user_status_name`) VALUES
(2, 'Active'),
(4, 'Blocked'),
(1, 'Incoming'),
(3, 'Suspended');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `ust_id` smallint(6) NOT NULL,
  `ust_description` varchar(45) DEFAULT NULL,
  `caf_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`ust_id`, `ust_description`, `caf_id`) VALUES
(1, 'advertiser', 1),
(2, 'media owner', 1),
(3, 'operator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `watch_list`
--

CREATE TABLE `watch_list` (
`watch_id` int(6) NOT NULL,
  `ass_id` int(6) NOT NULL,
  `start_date` int(28) NOT NULL,
  `status` int(2) NOT NULL,
  `auction` int(6) NOT NULL,
  `use_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `watch_list`
--

INSERT INTO `watch_list` (`watch_id`, `ass_id`, `start_date`, `status`, `auction`, `use_id`) VALUES
(1, 5, 2147483647, 1, 1, 0),
(2, 1, 2147483647, 0, 2, 0),
(3, 2, 2014, 1, 2, 0),
(4, 2, 2014, 1, 2, 0),
(5, 2, 2014, 1, 2, 0),
(6, 2, 2014, 1, 2, 0),
(7, 10, 2014, 1, 0, 0),
(8, 0, 2014, 1, 1, 0),
(9, 2, 2014, 1, 2, 0),
(10, 2, 2014, 1, 2, 0),
(11, 1, 2014, 1, 1, 6),
(12, 0, 2014, 1, 0, 6),
(13, 0, 2014, 1, 0, 6),
(14, 0, 2014, 1, 0, 6),
(15, 0, 2014, 1, 0, 6),
(16, 0, 2014, 1, 0, 6),
(17, 0, 2014, 1, 0, 6),
(18, 0, 2014, 1, 7, 6),
(19, 0, 2014, 1, 5, 6),
(20, 0, 2014, 1, 5, 6),
(21, 0, 2014, 1, 1, 6),
(22, 2, 2014, 1, 5, 6),
(23, 5, 2014, 1, 0, 6),
(24, 0, 2014, 1, 0, 6),
(25, 0, 2014, 1, 0, 6),
(26, 0, 2015, 1, 0, 6),
(27, 2, 2015, 1, 2, 6),
(28, 5, 2015, 1, 5, 6),
(29, 0, 2015, 1, 0, 6),
(30, 0, 2015, 1, 0, 6),
(31, 0, 2015, 1, 0, 6),
(32, 0, 2015, 1, 0, 6),
(33, 1, 2015, 1, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `winners`
--

CREATE TABLE `winners` (
`id` int(11) NOT NULL,
  `auction` int(32) NOT NULL DEFAULT '0',
  `seller` int(32) NOT NULL DEFAULT '0',
  `winner` int(32) NOT NULL DEFAULT '0',
  `bid` double NOT NULL DEFAULT '0',
  `closingdate` int(15) NOT NULL DEFAULT '0',
  `feedback_win` tinyint(1) NOT NULL DEFAULT '0',
  `feedback_sel` tinyint(1) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '1',
  `paid` int(1) NOT NULL DEFAULT '0',
  `bf_paid` int(1) NOT NULL DEFAULT '0',
  `ff_paid` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `work_type`
--

CREATE TABLE `work_type` (
`wor_id` smallint(6) NOT NULL,
  `wor_description` varchar(255) DEFAULT NULL,
  `wor_IE` varchar(255) DEFAULT NULL,
  `wor_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addtional_charges_type`
--
ALTER TABLE `addtional_charges_type`
 ADD PRIMARY KEY (`adct_id`);

--
-- Indexes for table `adminusers`
--
ALTER TABLE `adminusers`
 ADD KEY `id` (`id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
 ADD PRIMARY KEY (`ass_id`), ADD KEY `ast_id_idx` (`ast_id`), ADD KEY `mat_id_idx` (`mat_id`), ADD KEY `med_id_idx` (`med_id`), ADD KEY `met_id_idx` (`met_id`);

--
-- Indexes for table `asset_accounts_receivable`
--
ALTER TABLE `asset_accounts_receivable`
 ADD PRIMARY KEY (`aar_id`);

--
-- Indexes for table `asset_category`
--
ALTER TABLE `asset_category`
 ADD PRIMARY KEY (`asc_id`);

--
-- Indexes for table `asset_color`
--
ALTER TABLE `asset_color`
 ADD PRIMARY KEY (`asc_id`);

--
-- Indexes for table `asset_group`
--
ALTER TABLE `asset_group`
 ADD PRIMARY KEY (`asg_id`);

--
-- Indexes for table `asset_size`
--
ALTER TABLE `asset_size`
 ADD PRIMARY KEY (`asi_id`);

--
-- Indexes for table `asset_type`
--
ALTER TABLE `asset_type`
 ADD PRIMARY KEY (`ast_id`);

--
-- Indexes for table `assssssetsi`
--
ALTER TABLE `assssssetsi`
 ADD PRIMARY KEY (`ass_id`);

--
-- Indexes for table `auccounter`
--
ALTER TABLE `auccounter`
 ADD PRIMARY KEY (`auction_id`);

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indexes for table `auction_rooms`
--
ALTER TABLE `auction_rooms`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
 ADD KEY `id` (`id`);

--
-- Indexes for table `bannersstats`
--
ALTER TABLE `bannersstats`
 ADD KEY `id` (`banner`);

--
-- Indexes for table `bannersusers`
--
ALTER TABLE `bannersusers`
 ADD KEY `id` (`id`);

--
-- Indexes for table `bidder`
--
ALTER TABLE `bidder`
 ADD PRIMARY KEY (`bdd_id`), ADD KEY `bls_id_idx` (`bls_id`), ADD KEY `bid_id_idx` (`bid_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_category`
--
ALTER TABLE `billing_category`
 ADD PRIMARY KEY (`bil_id`);

--
-- Indexes for table `billing_status`
--
ALTER TABLE `billing_status`
 ADD PRIMARY KEY (`bis_id`), ADD KEY `bil_id_idx` (`bil_id`);

--
-- Indexes for table `blocked_status`
--
ALTER TABLE `blocked_status`
 ADD PRIMARY KEY (`bls_id`);

--
-- Indexes for table `booking_status`
--
ALTER TABLE `booking_status`
 ADD PRIMARY KEY (`bos_id`), ADD KEY `bst_id_idx` (`bst_id`);

--
-- Indexes for table `booking_status_type`
--
ALTER TABLE `booking_status_type`
 ADD PRIMARY KEY (`bst_id`);

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
 ADD PRIMARY KEY (`cam_id`), ADD KEY `adv_id_idx` (`adv_id`), ADD KEY `cab_id_idx` (`cab_id`), ADD KEY `cst_id_idx` (`cst_id`), ADD KEY `cas_id_idx` (`cas_id`), ADD KEY `cur_id_idx` (`cur_id`);

--
-- Indexes for table `campaign_budget_date`
--
ALTER TABLE `campaign_budget_date`
 ADD PRIMARY KEY (`cbd_id`);

--
-- Indexes for table `campaign_budget_type`
--
ALTER TABLE `campaign_budget_type`
 ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `campaign_locations`
--
ALTER TABLE `campaign_locations`
 ADD PRIMARY KEY (`cal_id`);

--
-- Indexes for table `campaign_source_type`
--
ALTER TABLE `campaign_source_type`
 ADD PRIMARY KEY (`cst_id`);

--
-- Indexes for table `campaign_status`
--
ALTER TABLE `campaign_status`
 ADD PRIMARY KEY (`cas_id`), ADD KEY `dot_id_idx` (`dot_id`);

--
-- Indexes for table `campaign_transaction`
--
ALTER TABLE `campaign_transaction`
 ADD PRIMARY KEY (`camt_id`), ADD KEY `cam_id_idx` (`cam_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`cat_id`), ADD KEY `left_id` (`left_id`,`right_id`,`level`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`cit_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `comment_sheet`
--
ALTER TABLE `comment_sheet`
 ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
 ADD PRIMARY KEY (`comm_id`), ADD KEY `comt_id_idx` (`comt_id`);

--
-- Indexes for table `commission_type`
--
ALTER TABLE `commission_type`
 ADD PRIMARY KEY (`comt_id`);

--
-- Indexes for table `community`
--
ALTER TABLE `community`
 ADD KEY `msg_id` (`id`);

--
-- Indexes for table `comm_messages`
--
ALTER TABLE `comm_messages`
 ADD KEY `msg_id` (`id`);

--
-- Indexes for table `contact_address_format`
--
ALTER TABLE `contact_address_format`
 ADD PRIMARY KEY (`caf_id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
 ADD PRIMARY KEY (`con_id`), ADD KEY `cnt_id_idx` (`cnt_id`), ADD KEY `ope_id_idx` (`ope_id`), ADD KEY `cam_id_idx` (`cam_id`), ADD KEY `use_id_idx` (`use_id`);

--
-- Indexes for table `contract_type`
--
ALTER TABLE `contract_type`
 ADD PRIMARY KEY (`cnt_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`country`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`cou_id`), ADD KEY `adf_id_idx` (`adf_id`);

--
-- Indexes for table `country_address_format`
--
ALTER TABLE `country_address_format`
 ADD PRIMARY KEY (`adf_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
 ADD PRIMARY KEY (`cur_id`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
 ADD PRIMARY KEY (`cus_group_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
 ADD PRIMARY KEY (`dis_id`);

--
-- Indexes for table `document_status`
--
ALTER TABLE `document_status`
 ADD PRIMARY KEY (`dos_id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
 ADD PRIMARY KEY (`dot_id`);

--
-- Indexes for table `durations`
--
ALTER TABLE `durations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`emp_id`), ADD KEY `emt_id_idx` (`emt_id`), ADD KEY `jot_id_idx` (`jot_id`), ADD KEY `cnd_id_idx` (`cnd_id`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
 ADD PRIMARY KEY (`emt_id`);

--
-- Indexes for table `face`
--
ALTER TABLE `face`
 ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
 ADD KEY `id` (`id`);

--
-- Indexes for table `faqscategories`
--
ALTER TABLE `faqscategories`
 ADD KEY `id` (`id`);

--
-- Indexes for table `faqs_translated`
--
ALTER TABLE `faqs_translated`
 ADD KEY `id` (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
 ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `images_all`
--
ALTER TABLE `images_all`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `increments`
--
ALTER TABLE `increments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_status`
--
ALTER TABLE `inventory_status`
 ADD PRIMARY KEY (`ins_id`);

--
-- Indexes for table `job_title`
--
ALTER TABLE `job_title`
 ADD PRIMARY KEY (`jot_id`);

--
-- Indexes for table `lms_user`
--
ALTER TABLE `lms_user`
 ADD PRIMARY KEY (`use_id`), ADD KEY `per_id_idx` (`pem_id`), ADD KEY `ust_id_idx` (`ust_id`);

--
-- Indexes for table `location_continent`
--
ALTER TABLE `location_continent`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_costing`
--
ALTER TABLE `location_costing`
 ADD PRIMARY KEY (`lcc_id`);

--
-- Indexes for table `location_countries`
--
ALTER TABLE `location_countries`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_direction`
--
ALTER TABLE `location_direction`
 ADD PRIMARY KEY (`ldi_id`);

--
-- Indexes for table `location_gender`
--
ALTER TABLE `location_gender`
 ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `location_group`
--
ALTER TABLE `location_group`
 ADD PRIMARY KEY (`lgr_id`);

--
-- Indexes for table `location_owner_type`
--
ALTER TABLE `location_owner_type`
 ADD PRIMARY KEY (`lwt_id`);

--
-- Indexes for table `location_photo_type`
--
ALTER TABLE `location_photo_type`
 ADD PRIMARY KEY (`lpt_id`);

--
-- Indexes for table `location_position`
--
ALTER TABLE `location_position`
 ADD PRIMARY KEY (`lop_id`), ADD KEY `met_id_idx` (`met_id`);

--
-- Indexes for table `location_province`
--
ALTER TABLE `location_province`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_rating`
--
ALTER TABLE `location_rating`
 ADD PRIMARY KEY (`lor_id`);

--
-- Indexes for table `location_road_orientation`
--
ALTER TABLE `location_road_orientation`
 ADD PRIMARY KEY (`lro_id`);

--
-- Indexes for table `location_status`
--
ALTER TABLE `location_status`
 ADD PRIMARY KEY (`lss_id`), ADD KEY `lsd_id_idx` (`lsd_id`);

--
-- Indexes for table `location_status_document`
--
ALTER TABLE `location_status_document`
 ADD PRIMARY KEY (`lsd_id`), ADD KEY `dos_id_idx` (`dos_id`);

--
-- Indexes for table `location_type`
--
ALTER TABLE `location_type`
 ADD PRIMARY KEY (`lot_id`), ADD KEY `mec_id_idx` (`mec_id`);

--
-- Indexes for table `maintainance`
--
ALTER TABLE `maintainance`
 ADD KEY `id` (`id`);

--
-- Indexes for table `mall`
--
ALTER TABLE `mall`
 ADD PRIMARY KEY (`mall_id`);

--
-- Indexes for table `mall_levels`
--
ALTER TABLE `mall_levels`
 ADD PRIMARY KEY (`mall_level_id`);

--
-- Indexes for table `mall_level_asset`
--
ALTER TABLE `mall_level_asset`
 ADD PRIMARY KEY (`mall_level_asset_id`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market_type`
--
ALTER TABLE `market_type`
 ADD PRIMARY KEY (`mat_id`);

--
-- Indexes for table `master_medium_type`
--
ALTER TABLE `master_medium_type`
 ADD PRIMARY KEY (`mam_id`), ADD KEY `mef_id_idx` (`mef_id`);

--
-- Indexes for table `measurement_unit`
--
ALTER TABLE `measurement_unit`
 ADD PRIMARY KEY (`meu_id`);

--
-- Indexes for table `media_categories`
--
ALTER TABLE `media_categories`
 ADD PRIMARY KEY (`mec_id`);

--
-- Indexes for table `media_categories_copy`
--
ALTER TABLE `media_categories_copy`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_category`
--
ALTER TABLE `media_category`
 ADD PRIMARY KEY (`mec_id`), ADD KEY `mam_id_idx` (`mam_id`);

--
-- Indexes for table `media_family`
--
ALTER TABLE `media_family`
 ADD PRIMARY KEY (`mef_id`);

--
-- Indexes for table `membertypes`
--
ALTER TABLE `membertypes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_cc`
--
ALTER TABLE `messages_cc`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_group_access`
--
ALTER TABLE `news_group_access`
 ADD PRIMARY KEY (`news_id`,`user_type_id`);

--
-- Indexes for table `online`
--
ALTER TABLE `online`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `operator_status`
--
ALTER TABLE `operator_status`
 ADD PRIMARY KEY (`ops_status_id`);

--
-- Indexes for table `owner_status`
--
ALTER TABLE `owner_status`
 ADD PRIMARY KEY (`ows_id`), ADD KEY `ost_id_idx` (`ost_id`);

--
-- Indexes for table `owner_status_type`
--
ALTER TABLE `owner_status_type`
 ADD PRIMARY KEY (`ost_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
 ADD PRIMARY KEY (`pam_id`);

--
-- Indexes for table `pendingnotif`
--
ALTER TABLE `pendingnotif`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
 ADD PRIMARY KEY (`pro_id`), ADD KEY `rfp_id_idx` (`cam_id`), ADD KEY `med_id_idx` (`med_id`), ADD KEY `con_id_idx` (`con_id`), ADD KEY `ope_id_idx` (`ope_id`), ADD KEY `pro_status_id_idx` (`pro_status_id`), ADD KEY `prb_id_idx` (`prb_id`), ADD KEY `met_id_idx` (`met_id`), ADD KEY `pro_creator_use_id_idx` (`pro_creator_use_id`), ADD KEY `prt_id_idx` (`prt_id`);

--
-- Indexes for table `proposal_details`
--
ALTER TABLE `proposal_details`
 ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `proposal_number_specification`
--
ALTER TABLE `proposal_number_specification`
 ADD PRIMARY KEY (`pns_id`);

--
-- Indexes for table `proposal_status`
--
ALTER TABLE `proposal_status`
 ADD PRIMARY KEY (`pro_status_id`);

--
-- Indexes for table `proposal_type`
--
ALTER TABLE `proposal_type`
 ADD PRIMARY KEY (`prt_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
 ADD PRIMARY KEY (`pro_id`), ADD KEY `cou_id_idx` (`cou_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
 ADD KEY `id` (`id`);

--
-- Indexes for table `rate_card`
--
ALTER TABLE `rate_card`
 ADD PRIMARY KEY (`rat_id`);

--
-- Indexes for table `rate_card_bk_2014-11-22`
--
ALTER TABLE `rate_card_bk_2014-11-22`
 ADD PRIMARY KEY (`rat_id`);

--
-- Indexes for table `rate_card_loading_method`
--
ALTER TABLE `rate_card_loading_method`
 ADD PRIMARY KEY (`rlm_id`);

--
-- Indexes for table `rate_card_status`
--
ALTER TABLE `rate_card_status`
 ADD PRIMARY KEY (`ras_id`);

--
-- Indexes for table `rate_type`
--
ALTER TABLE `rate_type`
 ADD PRIMARY KEY (`rat_id`);

--
-- Indexes for table `responsibility_center`
--
ALTER TABLE `responsibility_center`
 ADD PRIMARY KEY (`rec_id`), ADD KEY `loc_id_idx` (`loc_id`);

--
-- Indexes for table `rfp`
--
ALTER TABLE `rfp`
 ADD PRIMARY KEY (`rfp_id`);

--
-- Indexes for table `rfp_campaign_screenshot`
--
ALTER TABLE `rfp_campaign_screenshot`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfp_detail`
--
ALTER TABLE `rfp_detail`
 ADD PRIMARY KEY (`rfp_d_id`);

--
-- Indexes for table `rfp_for_submission`
--
ALTER TABLE `rfp_for_submission`
 ADD PRIMARY KEY (`rfp_for_submission_id`);

--
-- Indexes for table `rfp_for_submission_assets_selected`
--
ALTER TABLE `rfp_for_submission_assets_selected`
 ADD PRIMARY KEY (`rfp_for_submission_assets_selected_id`);

--
-- Indexes for table `rfp_for_submission_locations`
--
ALTER TABLE `rfp_for_submission_locations`
 ADD PRIMARY KEY (`rfp_for_submission_locations_id`);

--
-- Indexes for table `rfp_for_submission_media_categories`
--
ALTER TABLE `rfp_for_submission_media_categories`
 ADD PRIMARY KEY (`rfp_for_submission_media_categories_id`);

--
-- Indexes for table `rfp_for_submission_more_options`
--
ALTER TABLE `rfp_for_submission_more_options`
 ADD PRIMARY KEY (`rfp_for_submission_more_options_id`);

--
-- Indexes for table `rfp_status`
--
ALTER TABLE `rfp_status`
 ADD PRIMARY KEY (`rfp_status_id`);

--
-- Indexes for table `rfp_transactions`
--
ALTER TABLE `rfp_transactions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `road_grade`
--
ALTER TABLE `road_grade`
 ADD PRIMARY KEY (`roa_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
 ADD PRIMARY KEY (`sal_id`), ADD KEY `pay_id_idx` (`pay_id`);

--
-- Indexes for table `special_deal`
--
ALTER TABLE `special_deal`
 ADD PRIMARY KEY (`spd_id`), ADD KEY `med_id_idx` (`mec_id`);

--
-- Indexes for table `surbub`
--
ALTER TABLE `surbub`
 ADD PRIMARY KEY (`sur_id`);

--
-- Indexes for table `system_events`
--
ALTER TABLE `system_events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_events_type`
--
ALTER TABLE `system_events_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
 ADD PRIMARY KEY (`tax_id`), ADD KEY `txt_id_idx` (`txt_id`);

--
-- Indexes for table `tax_type`
--
ALTER TABLE `tax_type`
 ADD PRIMARY KEY (`txt_id`);

--
-- Indexes for table `town`
--
ALTER TABLE `town`
 ADD PRIMARY KEY (`tow_id`), ADD KEY `lot_id_idx` (`lot_id`);

--
-- Indexes for table `transaction_category`
--
ALTER TABLE `transaction_category`
 ADD PRIMARY KEY (`tctg_id`);

--
-- Indexes for table `uploaded_documents`
--
ALTER TABLE `uploaded_documents`
 ADD PRIMARY KEY (`upd_id`);

--
-- Indexes for table `uploaded_file_type`
--
ALTER TABLE `uploaded_file_type`
 ADD PRIMARY KEY (`upt_id`);

--
-- Indexes for table `uploaded_photos`
--
ALTER TABLE `uploaded_photos`
 ADD PRIMARY KEY (`upl_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`use_id`), ADD KEY `per_id_idx` (`pem_id`), ADD KEY `ust_id_idx` (`ust_id`);

--
-- Indexes for table `userfees`
--
ALTER TABLE `userfees`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersips`
--
ALTER TABLE `usersips`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
 ADD PRIMARY KEY (`usp_id`), ADD KEY `usp_created_by_idx` (`usp_created_by`), ADD KEY `ust_id_idx` (`ust_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
 ADD PRIMARY KEY (`user_status_id`), ADD UNIQUE KEY `user_status_name` (`user_status_name`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
 ADD PRIMARY KEY (`ust_id`), ADD KEY `caf_id_idx` (`caf_id`);

--
-- Indexes for table `watch_list`
--
ALTER TABLE `watch_list`
 ADD PRIMARY KEY (`watch_id`);

--
-- Indexes for table `winners`
--
ALTER TABLE `winners`
 ADD KEY `id` (`id`);

--
-- Indexes for table `work_type`
--
ALTER TABLE `work_type`
 ADD PRIMARY KEY (`wor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adminusers`
--
ALTER TABLE `adminusers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
MODIFY `ass_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `asset_accounts_receivable`
--
ALTER TABLE `asset_accounts_receivable`
MODIFY `aar_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `asset_color`
--
ALTER TABLE `asset_color`
MODIFY `asc_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `asset_group`
--
ALTER TABLE `asset_group`
MODIFY `asg_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `asset_size`
--
ALTER TABLE `asset_size`
MODIFY `asi_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `asset_type`
--
ALTER TABLE `asset_type`
MODIFY `ast_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `assssssetsi`
--
ALTER TABLE `assssssetsi`
MODIFY `ass_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
MODIFY `id` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `auction_rooms`
--
ALTER TABLE `auction_rooms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bannersusers`
--
ALTER TABLE `bannersusers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bidder`
--
ALTER TABLE `bidder`
MODIFY `bdd_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `billing_category`
--
ALTER TABLE `billing_category`
MODIFY `bil_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billing_status`
--
ALTER TABLE `billing_status`
MODIFY `bis_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blocked_status`
--
ALTER TABLE `blocked_status`
MODIFY `bls_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `booking_status`
--
ALTER TABLE `booking_status`
MODIFY `bos_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `booking_status_type`
--
ALTER TABLE `booking_status_type`
MODIFY `bst_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
MODIFY `cam_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2028;
--
-- AUTO_INCREMENT for table `campaign_budget_date`
--
ALTER TABLE `campaign_budget_date`
MODIFY `cbd_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_budget_type`
--
ALTER TABLE `campaign_budget_type`
MODIFY `cat_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_locations`
--
ALTER TABLE `campaign_locations`
MODIFY `cal_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_source_type`
--
ALTER TABLE `campaign_source_type`
MODIFY `cst_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_status`
--
ALTER TABLE `campaign_status`
MODIFY `cas_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_transaction`
--
ALTER TABLE `campaign_transaction`
MODIFY `camt_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=493;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `cat_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
MODIFY `cit_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=953;
--
-- AUTO_INCREMENT for table `comment_sheet`
--
ALTER TABLE `comment_sheet`
MODIFY `com_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
MODIFY `comm_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission_type`
--
ALTER TABLE `commission_type`
MODIFY `comt_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `community`
--
ALTER TABLE `community`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comm_messages`
--
ALTER TABLE `comm_messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_address_format`
--
ALTER TABLE `contact_address_format`
MODIFY `caf_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
MODIFY `con_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
MODIFY `cou_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `country_address_format`
--
ALTER TABLE `country_address_format`
MODIFY `adf_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
MODIFY `cur_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
MODIFY `cus_group_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
MODIFY `dis_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document_status`
--
ALTER TABLE `document_status`
MODIFY `dos_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
MODIFY `dot_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `durations`
--
ALTER TABLE `durations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `emp_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `employee_type`
--
ALTER TABLE `employee_type`
MODIFY `emt_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `face`
--
ALTER TABLE `face`
MODIFY `fac_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `faqscategories`
--
ALTER TABLE `faqscategories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `faqs_translated`
--
ALTER TABLE `faqs_translated`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
MODIFY `img_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `images_all`
--
ALTER TABLE `images_all`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `increments`
--
ALTER TABLE `increments`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `inventory_status`
--
ALTER TABLE `inventory_status`
MODIFY `ins_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `job_title`
--
ALTER TABLE `job_title`
MODIFY `jot_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lms_user`
--
ALTER TABLE `lms_user`
MODIFY `use_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_continent`
--
ALTER TABLE `location_continent`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `location_costing`
--
ALTER TABLE `location_costing`
MODIFY `lcc_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_countries`
--
ALTER TABLE `location_countries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT for table `location_direction`
--
ALTER TABLE `location_direction`
MODIFY `ldi_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_gender`
--
ALTER TABLE `location_gender`
MODIFY `log_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_group`
--
ALTER TABLE `location_group`
MODIFY `lgr_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_owner_type`
--
ALTER TABLE `location_owner_type`
MODIFY `lwt_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_photo_type`
--
ALTER TABLE `location_photo_type`
MODIFY `lpt_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_position`
--
ALTER TABLE `location_position`
MODIFY `lop_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_province`
--
ALTER TABLE `location_province`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5107;
--
-- AUTO_INCREMENT for table `location_rating`
--
ALTER TABLE `location_rating`
MODIFY `lor_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_road_orientation`
--
ALTER TABLE `location_road_orientation`
MODIFY `lro_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_status`
--
ALTER TABLE `location_status`
MODIFY `lss_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_status_document`
--
ALTER TABLE `location_status_document`
MODIFY `lsd_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_type`
--
ALTER TABLE `location_type`
MODIFY `lot_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `maintainance`
--
ALTER TABLE `maintainance`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mall`
--
ALTER TABLE `mall`
MODIFY `mall_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mall_levels`
--
ALTER TABLE `mall_levels`
MODIFY `mall_level_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mall_level_asset`
--
ALTER TABLE `mall_level_asset`
MODIFY `mall_level_asset_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_type`
--
ALTER TABLE `market_type`
MODIFY `mat_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_medium_type`
--
ALTER TABLE `master_medium_type`
MODIFY `mam_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `measurement_unit`
--
ALTER TABLE `measurement_unit`
MODIFY `meu_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `media_categories`
--
ALTER TABLE `media_categories`
MODIFY `mec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `media_categories_copy`
--
ALTER TABLE `media_categories_copy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `media_category`
--
ALTER TABLE `media_category`
MODIFY `mec_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `membertypes`
--
ALTER TABLE `membertypes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `messages_cc`
--
ALTER TABLE `messages_cc`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `online`
--
ALTER TABLE `online`
MODIFY `ID` bigint(21) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `operator_status`
--
ALTER TABLE `operator_status`
MODIFY `ops_status_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `owner_status`
--
ALTER TABLE `owner_status`
MODIFY `ows_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `owner_status_type`
--
ALTER TABLE `owner_status_type`
MODIFY `ost_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
MODIFY `pam_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pendingnotif`
--
ALTER TABLE `pendingnotif`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
MODIFY `pro_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `proposal_details`
--
ALTER TABLE `proposal_details`
MODIFY `trans_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `proposal_number_specification`
--
ALTER TABLE `proposal_number_specification`
MODIFY `pns_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proposal_status`
--
ALTER TABLE `proposal_status`
MODIFY `pro_status_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `proposal_type`
--
ALTER TABLE `proposal_type`
MODIFY `prt_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
MODIFY `pro_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `rate_card`
--
ALTER TABLE `rate_card`
MODIFY `rat_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rate_card_bk_2014-11-22`
--
ALTER TABLE `rate_card_bk_2014-11-22`
MODIFY `rat_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rate_card_loading_method`
--
ALTER TABLE `rate_card_loading_method`
MODIFY `rlm_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rate_type`
--
ALTER TABLE `rate_type`
MODIFY `rat_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `responsibility_center`
--
ALTER TABLE `responsibility_center`
MODIFY `rec_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rfp`
--
ALTER TABLE `rfp`
MODIFY `rfp_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=498;
--
-- AUTO_INCREMENT for table `rfp_campaign_screenshot`
--
ALTER TABLE `rfp_campaign_screenshot`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rfp_detail`
--
ALTER TABLE `rfp_detail`
MODIFY `rfp_d_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rfp_for_submission`
--
ALTER TABLE `rfp_for_submission`
MODIFY `rfp_for_submission_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rfp_for_submission_assets_selected`
--
ALTER TABLE `rfp_for_submission_assets_selected`
MODIFY `rfp_for_submission_assets_selected_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rfp_for_submission_locations`
--
ALTER TABLE `rfp_for_submission_locations`
MODIFY `rfp_for_submission_locations_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rfp_for_submission_media_categories`
--
ALTER TABLE `rfp_for_submission_media_categories`
MODIFY `rfp_for_submission_media_categories_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `rfp_for_submission_more_options`
--
ALTER TABLE `rfp_for_submission_more_options`
MODIFY `rfp_for_submission_more_options_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `rfp_status`
--
ALTER TABLE `rfp_status`
MODIFY `rfp_status_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rfp_transactions`
--
ALTER TABLE `rfp_transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `road_grade`
--
ALTER TABLE `road_grade`
MODIFY `roa_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
MODIFY `sal_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `special_deal`
--
ALTER TABLE `special_deal`
MODIFY `spd_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `surbub`
--
ALTER TABLE `surbub`
MODIFY `sur_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_events`
--
ALTER TABLE `system_events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=667;
--
-- AUTO_INCREMENT for table `system_events_type`
--
ALTER TABLE `system_events_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
MODIFY `tax_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tax_type`
--
ALTER TABLE `tax_type`
MODIFY `txt_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `town`
--
ALTER TABLE `town`
MODIFY `tow_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaction_category`
--
ALTER TABLE `transaction_category`
MODIFY `tctg_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uploaded_documents`
--
ALTER TABLE `uploaded_documents`
MODIFY `upd_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `uploaded_file_type`
--
ALTER TABLE `uploaded_file_type`
MODIFY `upt_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `uploaded_photos`
--
ALTER TABLE `uploaded_photos`
MODIFY `upl_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `use_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `userfees`
--
ALTER TABLE `userfees`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usersips`
--
ALTER TABLE `usersips`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
MODIFY `user_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `watch_list`
--
ALTER TABLE `watch_list`
MODIFY `watch_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `winners`
--
ALTER TABLE `winners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_type`
--
ALTER TABLE `work_type`
MODIFY `wor_id` smallint(6) NOT NULL AUTO_INCREMENT;