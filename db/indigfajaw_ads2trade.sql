/*
Navicat MySQL Data Transfer

Source Server         : Ads2Trade TEST
Source Server Version : 50540
Source Host           : dedi10.cpt3.host-h.net:3306
Source Database       : indigfajaw_ads2trade

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-01-14 23:30:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accesseshistoric`
-- ----------------------------
DROP TABLE IF EXISTS `accesseshistoric`;
CREATE TABLE `accesseshistoric` (
  `month` char(2) NOT NULL DEFAULT '',
  `year` char(4) NOT NULL DEFAULT '',
  `pageviews` int(11) NOT NULL DEFAULT '0',
  `uniquevisitiors` int(11) NOT NULL DEFAULT '0',
  `usersessions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accesseshistoric
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `nick` varchar(20) NOT NULL,
  `name` tinytext NOT NULL,
  `text` text NOT NULL,
  `type` varchar(15) NOT NULL,
  `paid_date` varchar(16) NOT NULL,
  `amount` double(6,4) NOT NULL,
  `day` int(3) NOT NULL,
  `week` int(2) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `addtional_charges_type`
-- ----------------------------
DROP TABLE IF EXISTS `addtional_charges_type`;
CREATE TABLE `addtional_charges_type` (
  `adct_id` smallint(6) NOT NULL,
  `adct_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`adct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addtional_charges_type
-- ----------------------------

-- ----------------------------
-- Table structure for `adminusers`
-- ----------------------------
DROP TABLE IF EXISTS `adminusers`;
CREATE TABLE `adminusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `hash` varchar(5) NOT NULL DEFAULT '',
  `created` varchar(8) NOT NULL DEFAULT '',
  `lastlogin` varchar(14) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adminusers
-- ----------------------------
INSERT INTO `adminusers` VALUES ('2', 'pintos', '0abf7e7895315a44a76f900145e08102', 'ohsb', '20140101', '1407869356', '0');

-- ----------------------------
-- Table structure for `asset`
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `ass_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`ass_id`),
  KEY `ast_id_idx` (`ast_id`),
  KEY `mat_id_idx` (`mat_id`),
  KEY `med_id_idx` (`med_id`),
  KEY `met_id_idx` (`met_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset
-- ----------------------------
INSERT INTO `asset` VALUES ('1', '1', 'My Asset 1', 'My Description 1', '-26.067732,27.935486', 'My Ref', '4', null, '350', '300', '2', '127', '1', '0', '0', 'Diamond Street, Randburg', '2', '1', null, null, '0', '1.000', null, 'production requirements         ', '5', '1', '2', 'Position                    ', '2', '4', '276 Quorn Drive', 'Waterfront', 'WC', 'South Africa', '2014-12-12 00:09:03');
INSERT INTO `asset` VALUES ('2', '2', 'My Asset 2', 'My Description 2', '-26.066344,27.95042', '', null, null, '1200', '1350', null, '127', '1450', '1500', '2000', '18 Douglas Rd, Randburg', null, '2', null, null, '2', null, null, null, '5', '2', '0', '', '0', '0', '18 Douglas Rd', 'Randburg', 'GP', 'South Africa', '2014-12-27 20:29:50');
INSERT INTO `asset` VALUES ('3', '3', 'My Asset 3', 'My Description 3', '-26.076058,27.931023', '', null, null, '1200', '1500', null, '127', '1100', '1900', '2000', '10 Diamond St Randburg, 2161', null, '1', null, null, '2', null, null, null, '8', '3', '0', '', '0', '0', '10 Diamond St', 'Randburg', 'GP', 'South Africa', '2014-12-27 20:30:12');
INSERT INTO `asset` VALUES ('4', '2', 'My Asset 4', 'My Description 4', '-26.071432,27.941494', '', null, null, '1000', '1100', null, '127', '1050', '1200', '2000', '8 Piscus St Randburg, 2161', null, '2', null, null, '3', null, null, null, '5', '4', '0', '', '0', '0', '8 Piscus St', 'Randburg', 'GP', 'South Africa', '2014-12-27 20:30:05');
INSERT INTO `asset` VALUES ('5', '2', 'My Asset 5', 'My Description 5', '-26.048147,27.918835', '', null, null, null, null, '2', null, '5', null, '2000', '', null, '2', null, null, '4', null, null, 'Large Logo, great picture', '5', '5', '0', '', '0', '0', 'No 17 6th Road', 'Midrand', 'GP', 'South Africa', '2014-12-14 17:28:46');
INSERT INTO `asset` VALUES ('6', '2', 'My Asset 6', 'My Description 5', '-26.07807,27.942867', '', null, null, null, null, null, null, null, null, '2000', '', null, '2', null, null, '5', null, null, null, '5', '7', '0', '', '0', '0', '45 Fourways Boulevard', 'Fourways', 'GP', 'South Africa', '2014-12-14 17:28:57');
INSERT INTO `asset` VALUES ('7', '2', 'My Asset 7', 'My Description 7', '-26.064501,27.925529', '', null, null, null, null, null, null, null, null, '2000', '', null, '2', null, null, '6', null, null, null, '8', '1', '0', '', '0', '0', '345 Smit Street', 'Pretoria', 'GP', 'South Africa', '2014-12-14 17:29:10');
INSERT INTO `asset` VALUES ('8', '2', 'My Asset 8', 'My Description 8', '-26.043682,27.936344', '', null, null, null, null, null, null, null, null, '2000', '', null, '2', null, null, '7', null, null, null, '8', '1', '0', '', '0', '0', '23 Nelson Mandela Avenue', 'Pretoria', 'GP', 'South Africa', '2014-12-14 17:29:24');
INSERT INTO `asset` VALUES ('9', '1', 'Asset 9', 'My Asset 9', '-26.050159,27.943211', '', null, null, null, null, null, null, null, null, '2000', '', null, '1', null, null, '8', null, null, null, '8', '8', '0', '', '0', '0', '33 Nivasha Road', 'Sunninghill', 'GP', 'South Africa', '2014-12-14 17:29:33');
INSERT INTO `asset` VALUES ('10', '1', 'Asset 10', 'My Description 10 ', '-26.054323,27.925358', '', null, null, '1500', '1850', null, '127', '2200', '2500', '2000', '', null, '1', null, null, '9', null, null, null, '8', '5', '0', '', '0', '0', '25 Mary Lane', 'Sandton', 'GP', 'South Africa', '2014-12-28 16:04:00');
INSERT INTO `asset` VALUES ('11', '2', 'My Asset 17', 'My Description 17', '-26.048147,27.918833', '', null, null, null, null, '2', null, '5', null, '2000', '', null, '2', null, null, '10', null, null, null, '5', '4', '0', '', '0', '0', '105 Lenchen Avenue', 'Centurion', 'GP', 'South Africa', '2014-12-14 17:30:08');
INSERT INTO `asset` VALUES ('12', '2', 'My Asset 15', 'My Description 15', '-26.048147,27.918837', '', null, null, null, null, '2', null, '5', null, '2000', '', null, '2', null, null, '11', null, null, null, '5', '5', '0', '', '0', '0', '21 Main Road', 'Bryanston', 'GP', 'South Africa', '2014-12-14 17:30:18');
INSERT INTO `asset` VALUES ('13', '3', 'Asset', 'Asset', '-26.067735,27.936258', '', null, null, null, null, null, null, null, null, '2000', '', null, null, null, null, '0', null, null, null, '5', '3', '0', '', '0', '0', '45 Walter Sisulu Road', 'Soweto', 'GP', 'South Africa', '2014-12-14 17:30:30');
INSERT INTO `asset` VALUES ('14', '2', 'My Bilboard 1', 'My Description 4', '-26.071432,27.941494', '', null, null, null, null, null, null, null, null, '2000', '', null, '2', null, null, '0', null, null, null, '5', '9', '0', '', '0', '0', '1 Old Pretoria Road', 'Midrand', 'GP', 'South Africa', '2014-12-14 17:30:40');
INSERT INTO `asset` VALUES ('15', '2', 'My Asset 9', 'My Description 9', '-26.048147,27.9188351', '', null, null, null, null, '2', null, '5', null, '2000', '', null, '2', null, null, '0', null, null, 'Large Logo, great picture', '8', '8', '0', '', '0', '0', '10 Desmond Tutu Avenue', 'Soweto', 'GP', 'South Africa', '2014-12-14 17:31:07');
INSERT INTO `asset` VALUES ('16', '2', 'Myne', 'My Myne', '-26.046604,27.944069', '', null, null, null, null, null, null, null, null, '2000', '419 Valley Rd Roodepoort, 2169', null, null, null, null, '0', null, null, null, '5', '8', '0', '', '0', '0', '419 Valley', 'Roodepoort', 'GP', 'South Africa', '2014-12-11 23:17:17');

-- ----------------------------
-- Table structure for `asset_accounts_receivable`
-- ----------------------------
DROP TABLE IF EXISTS `asset_accounts_receivable`;
CREATE TABLE `asset_accounts_receivable` (
  `aar_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `aar_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset_accounts_receivable
-- ----------------------------

-- ----------------------------
-- Table structure for `asset_category`
-- ----------------------------
DROP TABLE IF EXISTS `asset_category`;
CREATE TABLE `asset_category` (
  `asc_id` smallint(6) NOT NULL,
  `asc_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`asc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset_category
-- ----------------------------

-- ----------------------------
-- Table structure for `asset_color`
-- ----------------------------
DROP TABLE IF EXISTS `asset_color`;
CREATE TABLE `asset_color` (
  `asc_id` smallint(6) NOT NULL AUTO_INCREMENT,
  ` asc_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`asc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset_color
-- ----------------------------

-- ----------------------------
-- Table structure for `asset_group`
-- ----------------------------
DROP TABLE IF EXISTS `asset_group`;
CREATE TABLE `asset_group` (
  `asg_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `asg_description` varchar(255) DEFAULT NULL,
  `asg_min_price` decimal(13,2) DEFAULT NULL,
  `asg_max_price` decimal(13,2) DEFAULT NULL,
  `asi_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_size',
  `meu_id` smallint(6) DEFAULT NULL COMMENT 'FK: measurement_unit',
  PRIMARY KEY (`asg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset_group
-- ----------------------------
INSERT INTO `asset_group` VALUES ('1', 'A', '1000.00', '60000.00', '26', '5');
INSERT INTO `asset_group` VALUES ('2', 'B', '900.00', '55000.00', '26', '5');
INSERT INTO `asset_group` VALUES ('3', 'C', '500.00', '20000.00', '26', '5');
INSERT INTO `asset_group` VALUES ('4', 'D', '200.00', '5000.00', '26', '5');
INSERT INTO `asset_group` VALUES ('5', 'A', '55000.00', '200000.00', '27', '7');
INSERT INTO `asset_group` VALUES ('6', 'B', '40000.00', '175000.00', '27', '7');
INSERT INTO `asset_group` VALUES ('7', 'C', '20000.00', '120000.00', '27', '7');
INSERT INTO `asset_group` VALUES ('8', 'D', '15000.00', '65000.00', '27', '7');

-- ----------------------------
-- Table structure for `asset_size`
-- ----------------------------
DROP TABLE IF EXISTS `asset_size`;
CREATE TABLE `asset_size` (
  `asi_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`asi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset_size
-- ----------------------------
INSERT INTO `asset_size` VALUES ('26', '4 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/4_sheet.gif', null, '40.000', '60.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('27', ' 6 Sheet (Bus Stop Poster)', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/6_sheet.gif', null, '200.000', '100.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('28', '12 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/12_sheet.gif', null, '120.000', '60.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('29', '16 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/16_sheet.gif', null, '80.000', '120.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('30', '32 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/32_sheet.gif', null, '160.000', '120.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('31', '48 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/48_sheet.gif', null, '240.000', '120.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('32', '64 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/64_sheet.gif', null, '320.000', '120.000', null, null, null, null, null);
INSERT INTO `asset_size` VALUES ('33', '96 Sheet', '8', '11', 'http://indigostorage.co.za/ads2trade_campaign/uploaded_documents/asset_size_avatars/outdoor/billboard/96_sheet.gif', null, '480.000', '120.000', null, null, null, null, null);

-- ----------------------------
-- Table structure for `asset_type`
-- ----------------------------
DROP TABLE IF EXISTS `asset_type`;
CREATE TABLE `asset_type` (
  `ast_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ast_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asset_type
-- ----------------------------
INSERT INTO `asset_type` VALUES ('4', 'Traditional - Outdoor');
INSERT INTO `asset_type` VALUES ('5', 'Traditional - Indoor');
INSERT INTO `asset_type` VALUES ('6', 'Digital - Outdoor');
INSERT INTO `asset_type` VALUES ('7', 'Digital - Indoor');

-- ----------------------------
-- Table structure for `assssssetsi`
-- ----------------------------
DROP TABLE IF EXISTS `assssssetsi`;
CREATE TABLE `assssssetsi` (
  `ass_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ass_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assssssetsi
-- ----------------------------
INSERT INTO `assssssetsi` VALUES ('27', '-26.067732,27.935486');
INSERT INTO `assssssetsi` VALUES ('28', '-26.066344,27.95042');
INSERT INTO `assssssetsi` VALUES ('31', '-26.076058,27.931023');
INSERT INTO `assssssetsi` VALUES ('32', '-26.071432,27.941494');
INSERT INTO `assssssetsi` VALUES ('33', '-26.048147,27.918835');
INSERT INTO `assssssetsi` VALUES ('34', '-26.07807,27.942867');
INSERT INTO `assssssetsi` VALUES ('35', '-26.064501,27.925529');
INSERT INTO `assssssetsi` VALUES ('36', '-26.043682,27.936344');
INSERT INTO `assssssetsi` VALUES ('37', '-26.005272,27.946301');

-- ----------------------------
-- Table structure for `auccounter`
-- ----------------------------
DROP TABLE IF EXISTS `auccounter`;
CREATE TABLE `auccounter` (
  `auction_id` int(11) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auccounter
-- ----------------------------

-- ----------------------------
-- Table structure for `auctions`
-- ----------------------------
DROP TABLE IF EXISTS `auctions`;
CREATE TABLE `auctions` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
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
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auctions
-- ----------------------------
INSERT INTO `auctions` VALUES ('1', '5', 'Sadza', 'Testing', '2014-08-20 00:00:00', '\r\n\r\nefgter\r\n', '', '0', '0', '0.99', '0.00', '0.00', '3500.00', '1', '1', '50.00', '1', '0, 1', '0', '2014-08-31 23:00:00', '3500.00', '0', '1', '1', '0', '1', '0', '0', 'n', '', 'n', 'n', 'n', 'n', '0.00', '1', '1');
INSERT INTO `auctions` VALUES ('2', '5', 'Test1', 'Test1', '2014-08-20 00:00:00', '<p>\r\n	test</p>\r\n', '', '205', '0', '0.99', '0.00', '0.00', '0.00', '1', '1', '0.00', '1', '0, 1', '0', '2014-08-31 23:00:00', '5.00', '0', '1', '1', '0', '0', '0', '0', 'n', '', 'n', 'n', 'n', 'n', '0.00', '2', '1');
INSERT INTO `auctions` VALUES ('3', '5', '', '', '2014-08-20 00:00:00', null, null, null, null, '0.01', null, null, null, '1', '2', '0.00', null, null, null, '2014-08-31 23:00:00', null, '0', null, null, '0', '0', '0', '0', 'n', '', 'n', 'n', 'n', 'n', '0.00', '4', '1');
INSERT INTO `auctions` VALUES ('4', '5', 'My Asset 1', 'My Asset 1', '2014-08-20 00:00:00', null, null, null, null, '0.00', null, null, null, '1', '2', '0.00', null, null, null, '2014-08-31 23:00:00', '12000.00', '0', null, null, '0', '0', '0', '0', 'n', '', 'n', 'n', 'n', 'n', '0.00', '3', '9');
INSERT INTO `auctions` VALUES ('5', '5', 'My First Auction Title', 'My First Auction Title', '2014-08-20 00:00:00', null, null, null, null, '200.00', null, null, '500.00', '1', '7', '100.00', null, null, null, '2014-08-31 23:00:00', '1000.00', null, null, '2', '0', '0', '0', '0', 'n', '', 'n', 'n', 'n', 'n', '0.00', '5', '1');
INSERT INTO `auctions` VALUES ('7', '5', 'My Asset 1', 'My Asset 1', '2014-08-20 00:00:00', null, null, null, null, '0.00', null, null, null, null, '7', '0.00', null, null, null, '2014-08-31 23:00:00', '0.00', null, null, null, '0', '0', '0', '0', 'n', '', 'n', 'n', 'n', 'n', '0.00', '6', '1');

-- ----------------------------
-- Table structure for `banners`
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `user` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of banners
-- ----------------------------

-- ----------------------------
-- Table structure for `bannerscategories`
-- ----------------------------
DROP TABLE IF EXISTS `bannerscategories`;
CREATE TABLE `bannerscategories` (
  `banner` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bannerscategories
-- ----------------------------

-- ----------------------------
-- Table structure for `bannerskeywords`
-- ----------------------------
DROP TABLE IF EXISTS `bannerskeywords`;
CREATE TABLE `bannerskeywords` (
  `banner` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bannerskeywords
-- ----------------------------

-- ----------------------------
-- Table structure for `bannersstats`
-- ----------------------------
DROP TABLE IF EXISTS `bannersstats`;
CREATE TABLE `bannersstats` (
  `banner` int(11) DEFAULT NULL,
  `purchased` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  KEY `id` (`banner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bannersstats
-- ----------------------------

-- ----------------------------
-- Table structure for `bannersusers`
-- ----------------------------
DROP TABLE IF EXISTS `bannersusers`;
CREATE TABLE `bannersusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bannersusers
-- ----------------------------

-- ----------------------------
-- Table structure for `bidder`
-- ----------------------------
DROP TABLE IF EXISTS `bidder`;
CREATE TABLE `bidder` (
  `bdd_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bid_id` smallint(6) DEFAULT NULL,
  `bls_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`bdd_id`),
  KEY `bls_id_idx` (`bls_id`),
  KEY `bid_id_idx` (`bid_id`),
  CONSTRAINT `bid_id` FOREIGN KEY (`bid_id`) REFERENCES `bid` (`bid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bls_id` FOREIGN KEY (`bls_id`) REFERENCES `blocked_status` (`bls_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bidder
-- ----------------------------

-- ----------------------------
-- Table structure for `bids`
-- ----------------------------
DROP TABLE IF EXISTS `bids`;
CREATE TABLE `bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction` int(32) DEFAULT NULL,
  `bidder` int(32) DEFAULT NULL,
  `bid` double(16,2) DEFAULT '0.00',
  `bidwhen` varchar(25) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `winner` int(6) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `ass_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bids
-- ----------------------------
INSERT INTO `bids` VALUES ('1', '1', '5', '100.00', '2014-08-12 22:55', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('2', '1', '5', '200.00', '2014-08-12 23:18:10', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('3', '1', '5', '250.00', '2014-08-13 11:07:04', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('4', '1', '5', '0.00', '2014-08-16 19:18:53', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('5', '1', '5', '0.00', '2014-08-16 19:20:01', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('6', '1', '5', '0.00', '2014-08-16 19:21:37', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('7', '1', '5', '200.00', '2014-08-18 13:59:30', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('8', '1', '5', '300.00', '2014-08-18 14:21:53', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('9', '1', '5', '300.00', '2014-08-18 14:23:07', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('10', '1', '5', '320.00', '2014-08-18 14:28:02', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('11', '1', '5', '320.00', '2014-08-18 14:29:05', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('12', '1', '5', '330.00', '2014-08-18 14:32:48', '1', '5', '1', null);
INSERT INTO `bids` VALUES ('13', '0', '5', '0.00', '2014-08-22 23:06:26', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('14', '0', '5', '0.00', '2014-08-22 23:08:05', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('15', '0', '5', '201.00', '2014-08-22 23:10:11', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('16', '0', '5', '201.00', '2014-08-22 23:14:29', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('17', '0', '5', '201.00', '2014-08-22 23:15:20', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('18', '5', '5', '201.00', '2014-08-22 23:16:01', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('19', '5', '5', '301.00', '2014-08-22 23:33:12', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('20', '2', '5', '1.00', '2014-08-24 18:38:26', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('21', '0', '5', '0.00', '2014-08-25 00:35:22', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('22', '0', '5', '0.00', '2014-08-25 00:50:16', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('23', '2', '5', '2.00', '2014-08-25 01:14:55', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('24', '2', '5', '3.00', '2014-08-25 15:01:34', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('25', '0', '5', '100.00', '2014-08-25 16:30:42', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('26', '2', '5', '5.00', '2014-08-27 11:45:17', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('27', '0', '6', '0.00', '2014-12-14 01:17:48', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('28', '0', '6', '25200.00', '2014-12-14 01:19:34', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('29', '0', '6', '25000.00', '2014-12-14 22:24:20', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('30', '0', '6', '0.00', '2014-12-15 19:27:32', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('31', '0', '6', '5525.00', '2014-12-15 19:28:00', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('32', '1', '6', '37500.00', '2014-12-16 22:37:48', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('33', '5', '6', '401.00', '2014-12-17 00:20:51', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('34', '0', '6', '129.00', '2014-12-18 09:43:18', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('35', '0', '6', '100.00', '2014-12-18 18:50:39', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('36', '7', '6', '0.00', '2014-12-18 20:37:29', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('37', '0', '6', '500.00', '2014-12-18 20:54:37', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('38', '5', '6', '600.00', '2014-12-18 21:09:13', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('39', '0', '6', '552.00', '2014-12-18 21:12:17', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('40', '1', '6', '40000.00', '2014-12-18 21:14:02', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('41', '1', '6', '250.00', '2014-12-18 22:00:03', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('42', '0', '6', '800.00', '2014-12-19 13:24:37', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('43', '5', '6', '800.00', '2014-12-19 13:26:06', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('44', '5', '6', '1000.00', '2014-12-19 13:26:37', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('45', '5', '5', '12000.00', '2014-12-19 13:26:37', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('46', '0', '6', '12100.00', '2014-12-21 16:55:35', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('47', '0', '6', '23000.00', '2015-01-13 13:50:29', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('48', '1', '6', '3500.00', '2015-01-13 13:51:50', '1', '0', '1', null);
INSERT INTO `bids` VALUES ('49', '0', '6', '23000.00', '2015-01-13 13:55:02', '1', '0', '1', null);

-- ----------------------------
-- Table structure for `billing_category`
-- ----------------------------
DROP TABLE IF EXISTS `billing_category`;
CREATE TABLE `billing_category` (
  `bil_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bil_description` varchar(45) DEFAULT NULL COMMENT 'values: prime/non prime',
  PRIMARY KEY (`bil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of billing_category
-- ----------------------------

-- ----------------------------
-- Table structure for `billing_status`
-- ----------------------------
DROP TABLE IF EXISTS `billing_status`;
CREATE TABLE `billing_status` (
  `bis_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bis_start_date` datetime DEFAULT NULL,
  `bis_end_date` datetime DEFAULT NULL,
  `bil_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`bis_id`),
  KEY `bil_id_idx` (`bil_id`),
  CONSTRAINT `bil_id` FOREIGN KEY (`bil_id`) REFERENCES `billing_category` (`bil_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of billing_status
-- ----------------------------

-- ----------------------------
-- Table structure for `blocked_status`
-- ----------------------------
DROP TABLE IF EXISTS `blocked_status`;
CREATE TABLE `blocked_status` (
  `bls_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bls_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of blocked_status
-- ----------------------------

-- ----------------------------
-- Table structure for `booking_status`
-- ----------------------------
DROP TABLE IF EXISTS `booking_status`;
CREATE TABLE `booking_status` (
  `bos_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bos_code` varchar(255) DEFAULT NULL,
  `bos_authorization_required` tinyint(4) DEFAULT NULL,
  `bos_update_authorization` tinyint(4) DEFAULT NULL,
  `bst_id` smallint(6) DEFAULT NULL COMMENT 'FK : booking_status_type',
  `bos_form_editable` tinyint(4) DEFAULT NULL,
  `bos_import_code` varchar(255) DEFAULT NULL,
  `bos_validate_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`bos_id`),
  KEY `bst_id_idx` (`bst_id`),
  CONSTRAINT `bst_id` FOREIGN KEY (`bst_id`) REFERENCES `booking_status_type` (`bst_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of booking_status
-- ----------------------------

-- ----------------------------
-- Table structure for `booking_status_type`
-- ----------------------------
DROP TABLE IF EXISTS `booking_status_type`;
CREATE TABLE `booking_status_type` (
  `bst_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bst_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`bst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of booking_status_type
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign`
-- ----------------------------
DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign` (
  `cam_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  `cam_status` smallint(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (`cam_id`),
  KEY `adv_id_idx` (`adv_id`),
  KEY `cab_id_idx` (`cab_id`),
  KEY `cst_id_idx` (`cst_id`),
  KEY `cas_id_idx` (`cas_id`),
  KEY `cur_id_idx` (`cur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign
-- ----------------------------
INSERT INTO `campaign` VALUES ('70', '2014-10-25', '2014-10-25', 'indigo test', '450000', '2014-11-23', 'indigo test', '6', '0', null, null, null, null, null, null, null, '0', '2014-11-08 12:25:26', '000001');
INSERT INTO `campaign` VALUES ('73', '2014-01-01', '2014-01-05', 'hgjhgc', '10000000', '2014-01-06', 'Test', '5', '0', null, null, null, null, null, null, null, '0', '2014-11-13 18:51:59', '000001');
INSERT INTO `campaign` VALUES ('74', '2014-10-17', '2014-12-11', 'Assignment resource document upload test', '40000', '2014-12-12', 'rffrfr', '6', '0', null, null, null, null, null, null, null, '0', '2014-10-25 02:03:23', '000001');
INSERT INTO `campaign` VALUES ('75', '2014-10-22', '2014-12-19', 'cool, outgoing dude willig to chill with someone', '5000000', '2014-10-24', 'dcdc', '6', '0', null, null, null, null, null, null, null, '0', '2014-10-30 01:36:19', '000001');
INSERT INTO `campaign` VALUES ('76', '2014-10-01', '2014-10-31', 'testing123', '25000', '2014-10-31', 'kb,mb', '6', '0', null, null, null, null, null, null, null, '0', '2014-11-22 09:58:04', '000001');
INSERT INTO `campaign` VALUES ('77', '2014-10-21', '2014-10-22', 'kbvnbv', '20000', '2014-10-24', 'testing', '6', '0', null, null, null, null, null, null, null, '0', '2014-10-21 13:12:04', '000000');
INSERT INTO `campaign` VALUES ('78', '2014-11-14', '2015-01-16', 'cool, outgoing dude willig to chill with someone', '5000000', '2014-11-28', 'dedede', '6', '0', null, null, null, null, null, null, null, '0', '2014-11-12 09:26:46', '000000');
INSERT INTO `campaign` VALUES ('79', '2014-11-18', '2014-11-12', 'kjhv', '55', '2014-11-27', 'hgjhgf', '6', '0', null, null, null, null, null, null, null, '0', '2014-11-13 18:38:13', '000000');
INSERT INTO `campaign` VALUES ('80', '2015-01-01', '2015-01-31', 'Clientelle Legal', '500000', '2014-12-29', 'The new Clientelle Legal scheme for domestic employees', '6', null, null, null, null, null, null, null, null, '0', '2015-01-04 15:27:55', '000001');
INSERT INTO `campaign` VALUES ('81', '2014-12-01', '2015-01-31', 'Test Campaign 2', '350000', '2015-01-31', 'description description', '6', null, null, null, null, null, null, null, null, '0', '2015-01-01 02:01:39', '000000');
INSERT INTO `campaign` VALUES ('82', '2015-01-01', '2015-02-28', 'Test Campaign 4', '45000', '2015-01-05', 'yrdy', '6', null, null, null, null, null, null, null, null, '0', '2015-01-01 02:01:27', '000000');
INSERT INTO `campaign` VALUES ('83', '0000-00-00', '0000-00-00', 'tst', '200000', '0000-00-00', 'mhkjhvjhgv', '6', null, null, null, null, null, null, null, null, '0', '2015-01-03 10:03:57', '000000');
INSERT INTO `campaign` VALUES ('113', '2015-01-01', '2015-02-28', 'Audi Ad Campaign', '150000', '2015-01-10', 'Audi Ad Campaign description', '6', null, null, null, null, null, null, null, null, '0', '2015-01-05 00:05:46', '000000');
INSERT INTO `campaign` VALUES ('129', '0000-00-00', '0000-00-00', '0', '20000', '0000-00-00', '0', '7', null, null, null, null, null, null, null, null, '0', '2015-01-05 00:05:31', '000000');
INSERT INTO `campaign` VALUES ('130', '2015-01-01', '2015-02-28', 'BMW Ad Campaign', '135000', '2015-01-10', 'BMW Ad Campaign description', '7', null, null, null, null, null, null, null, null, '0', '2015-01-05 01:05:39', '000000');
INSERT INTO `campaign` VALUES ('131', '2015-01-01', '2015-02-28', 'BMW Ad Campaign', '135000', '2015-01-10', 'BMW Ad Campaign description', '7', null, null, null, null, null, null, null, null, '0', '2015-01-05 01:05:31', '000000');
INSERT INTO `campaign` VALUES ('132', '2015-01-31', '2015-02-28', 'Indigo Jan Ad', '100000', '2015-01-31', 'jhbkjvmnv', '6', null, null, null, null, null, null, null, null, '0', '2015-01-07 16:07:25', '000000');
INSERT INTO `campaign` VALUES ('133', '2015-01-01', '2015-01-31', 'Samsung Galaxy Note 4', '250000', '2015-01-12', 'Samsung Galaxy Note 4', '7', null, null, null, null, null, null, null, null, '0', '2015-01-09 23:09:15', '000000');
INSERT INTO `campaign` VALUES ('149', '2015-01-01', '2015-01-31', 'The new Chevrolet Adam', '250000', '2015-01-12', 'The new Chevrolet Adam is coming', '7', null, null, null, null, null, null, null, null, '0', '2015-01-10 00:10:03', '000000');
INSERT INTO `campaign` VALUES ('150', '2015-01-12', '2015-01-05', 'Huwawei Ascend P7 Jan 2015', '125000', '2015-02-28', 'Introducing the new Huwawei Ascend P7 - Jan 2015', '7', null, null, null, null, null, null, null, null, '0', '2015-01-10 18:07:53', '000001');
INSERT INTO `campaign` VALUES ('151', '2015-02-01', '2015-02-28', 'KFC Crushers', '200000', '2015-01-21', 'Launching a new product', '6', null, null, null, null, null, null, null, null, '0', '2015-01-13 13:13:44', '000000');
INSERT INTO `campaign` VALUES ('152', '2015-01-14', '2015-01-15', 'hgfdghf', '10000', '2015-01-01', 'asdfasdfa', '5', null, null, null, null, null, null, null, null, '0', '2015-01-14 09:14:38', '000000');
INSERT INTO `campaign` VALUES ('153', '0000-00-00', '0000-00-00', 'kjnkbknb', '20000', '0000-00-00', 'jhkjhgvkjhgvjh', '6', null, null, null, null, null, null, null, null, '0', '2015-01-14 11:14:18', '000000');
INSERT INTO `campaign` VALUES ('154', '2015-01-17', '2015-01-31', 'wer', '111111', '2015-01-31', 'kfc product launch\n', '6', null, null, null, null, null, null, null, null, '0', '2015-01-14 14:14:46', '000000');

-- ----------------------------
-- Table structure for `campaign_budget_date`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_budget_date`;
CREATE TABLE `campaign_budget_date` (
  `cbd_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cbd_start_date` datetime DEFAULT NULL,
  `cbd_end_date` datetime DEFAULT NULL,
  `cbd_quantity` int(11) DEFAULT NULL,
  `cbd_rate_per_unit` float DEFAULT NULL,
  `cbd_rate_card_rate` float DEFAULT NULL,
  `cbd_commision` float DEFAULT NULL,
  `cbd_VAT` float DEFAULT NULL,
  PRIMARY KEY (`cbd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign_budget_date
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_budget_type`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_budget_type`;
CREATE TABLE `campaign_budget_type` (
  `cat_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cat_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign_budget_type
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_locations`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_locations`;
CREATE TABLE `campaign_locations` (
  `cal_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cam_id` smallint(6) DEFAULT NULL,
  `cal_lattitude` varchar(255) DEFAULT NULL,
  `cal_longitude` varchar(255) DEFAULT NULL,
  `cal_GPS1` varchar(255) DEFAULT NULL,
  `cal_GPS2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign_locations
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_source_type`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_source_type`;
CREATE TABLE `campaign_source_type` (
  `cst_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cst_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign_source_type
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_status`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_status`;
CREATE TABLE `campaign_status` (
  `cas_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cst_id` smallint(6) DEFAULT NULL COMMENT 'FK: campaign_source_type',
  `cas_description` varchar(255) DEFAULT NULL,
  `dot_id` smallint(6) DEFAULT NULL COMMENT 'FK : pdocument_type',
  `cas_code` varchar(255) DEFAULT NULL,
  `cas_authorization` tinyint(4) DEFAULT NULL,
  `cas_update_authorization` tinyint(4) DEFAULT NULL,
  `cas_form_editable` tinyint(4) DEFAULT NULL,
  `cas_import_coce` varchar(255) DEFAULT NULL,
  `cas_validate_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cas_id`),
  KEY `dot_id_idx` (`dot_id`),
  CONSTRAINT `dot_id` FOREIGN KEY (`dot_id`) REFERENCES `document_type` (`dot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign_status
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_transaction`;
CREATE TABLE `campaign_transaction` (
  `camt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cam_id` smallint(6) DEFAULT NULL COMMENT 'FK: campaign',
  `mec_id` smallint(6) DEFAULT NULL COMMENT 'FK: media_category',
  `cam_latitude` varchar(20) DEFAULT NULL,
  `cam_longitude` varchar(20) DEFAULT NULL,
  `asi_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_size',
  `asg_id` smallint(6) DEFAULT NULL COMMENT 'FK: asset_group',
  `quantity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`camt_id`),
  KEY `cam_id_idx` (`cam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campaign_transaction
-- ----------------------------
INSERT INTO `campaign_transaction` VALUES ('1', '70', '8', '-26.1075663', '28.056700699999965', '26', '1', null);
INSERT INTO `campaign_transaction` VALUES ('2', '70', '8', '-26.1075663', '28.056700699999965', '26', '2', null);
INSERT INTO `campaign_transaction` VALUES ('3', '73', '9', '-26.1075663', '28.056700699999965', '26', '1', null);
INSERT INTO `campaign_transaction` VALUES ('4', '73', '9', '-26.1075663', '28.056700699999965', '26', '2', null);
INSERT INTO `campaign_transaction` VALUES ('5', '73', '9', '-26.1075663', '28.056700699999965', '26', '3', null);
INSERT INTO `campaign_transaction` VALUES ('6', '73', '9', '-26.1075663', '28.056700699999965', '26', '5', null);
INSERT INTO `campaign_transaction` VALUES ('7', '73', '9', '-26.067732', '27.935486', '26', '6', null);
INSERT INTO `campaign_transaction` VALUES ('8', '73', '9', '-26.1075663', '28.056700699999965', '26', '7', null);
INSERT INTO `campaign_transaction` VALUES ('9', '73', '9', '-26.1075663', '28.056700699999965', '27', '1', null);
INSERT INTO `campaign_transaction` VALUES ('10', '73', '9', '-26.1075663', '28.056700699999965', '27', '2', null);
INSERT INTO `campaign_transaction` VALUES ('11', '73', '9', '-26.1075663', '28.056700699999965', '27', '3', null);
INSERT INTO `campaign_transaction` VALUES ('12', '73', '9', '-26.1075663', '28.056700699999965', '27', '5', null);
INSERT INTO `campaign_transaction` VALUES ('13', '73', '9', '-26.1075663', '28.056700699999965', '27', '6', null);
INSERT INTO `campaign_transaction` VALUES ('14', '73', '9', '-26.1075663', '28.056700699999965', '27', '7', null);
INSERT INTO `campaign_transaction` VALUES ('15', '73', '9', '-26.1075663', '28.056700699999965', '28', '1', null);
INSERT INTO `campaign_transaction` VALUES ('16', '73', '9', '-26.1075663', '28.056700699999965', '28', '2', null);
INSERT INTO `campaign_transaction` VALUES ('17', '73', '9', '-26.1075663', '28.056700699999965', '28', '3', null);
INSERT INTO `campaign_transaction` VALUES ('18', '73', '9', '-26.1075663', '28.056700699999965', '28', '5', null);
INSERT INTO `campaign_transaction` VALUES ('19', '73', '9', '-26.1075663', '28.056700699999965', '28', '6', null);
INSERT INTO `campaign_transaction` VALUES ('20', '73', '9', '-26.1075663', '28.056700699999965', '28', '7', null);
INSERT INTO `campaign_transaction` VALUES ('21', '74', '8', '-26.1948812', '28.11585880000007', '26', '1', null);
INSERT INTO `campaign_transaction` VALUES ('22', '74', '8', '-26.1948812', '28.11585880000007', '26', '2', null);
INSERT INTO `campaign_transaction` VALUES ('23', '74', '8', '-26.1948812', '28.11585880000007', '26', '3', null);
INSERT INTO `campaign_transaction` VALUES ('24', '75', '7', '19.4326077', '-99.13320799999997', '26', '3', null);
INSERT INTO `campaign_transaction` VALUES ('25', '75', '7', '19.4326077', '-99.13320799999997', '26', '4', null);
INSERT INTO `campaign_transaction` VALUES ('26', '76', '1', '-26.1075663', '28.056700699999965', '26', '1', null);
INSERT INTO `campaign_transaction` VALUES ('27', '76', '1', '-26.1075663', '28.056700699999965', '26', '2', null);
INSERT INTO `campaign_transaction` VALUES ('28', '76', '1', '-26.1075663', '28.056700699999965', '26', '3', null);
INSERT INTO `campaign_transaction` VALUES ('29', '76', '1', '-26.1075663', '28.056700699999965', '27', '1', null);
INSERT INTO `campaign_transaction` VALUES ('30', '76', '1', '-26.1075663', '28.056700699999965', '27', '2', null);
INSERT INTO `campaign_transaction` VALUES ('31', '76', '1', '-26.1075663', '28.056700699999965', '27', '3', null);
INSERT INTO `campaign_transaction` VALUES ('32', '78', null, '46.227638', '2.213749000000007', null, '1', null);
INSERT INTO `campaign_transaction` VALUES ('33', '78', null, '46.227638', '2.213749000000007', null, '8', null);
INSERT INTO `campaign_transaction` VALUES ('34', '79', null, '-33.9248685', '18.424055299999964', null, '1', null);
INSERT INTO `campaign_transaction` VALUES ('35', '79', null, '-33.9248685', '18.424055299999964', null, '2', null);
INSERT INTO `campaign_transaction` VALUES ('36', '79', null, '-33.9248685', '18.424055299999964', null, '3', null);
INSERT INTO `campaign_transaction` VALUES ('37', '79', null, '-33.9248685', '18.424055299999964', null, '4', null);
INSERT INTO `campaign_transaction` VALUES ('38', '107', '3', '-25.9991795', '28.1262927', '1', '1', null);
INSERT INTO `campaign_transaction` VALUES ('39', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('40', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('41', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('42', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('43', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('44', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('45', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('46', '107', '3', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('47', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('48', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('49', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('50', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('51', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('52', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('53', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('54', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('55', '107', '4', '-25.9991795', '28.1262927', '28', '28', null);
INSERT INTO `campaign_transaction` VALUES ('56', '113', '3', '-25.9991795', '28.1262927', '26', '1', null);
INSERT INTO `campaign_transaction` VALUES ('57', '113', '3', '-25.9991795', '28.1262927', '26', '1', null);
INSERT INTO `campaign_transaction` VALUES ('58', '113', '4', '-25.9991795', '28.1262927', '29', '0', null);
INSERT INTO `campaign_transaction` VALUES ('59', '113', '4', '-25.9991795', '28.1262927', '30', '0', null);
INSERT INTO `campaign_transaction` VALUES ('60', '113', '4', '-25.9991795', '28.1262927', '31', '0', null);
INSERT INTO `campaign_transaction` VALUES ('61', '113', '4', '-25.9991795', '28.1262927', '32', '0', null);
INSERT INTO `campaign_transaction` VALUES ('62', '148', '4', '-26.0254685', '28.00397', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('63', '148', '5', '-26.0254685', '28.00397', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('64', '148', '8', '-26.0254685', '28.00397', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('65', '149', '4', '-26.0254685', '28.00397', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('66', '149', '5', '-26.0254685', '28.00397', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('67', '149', '8', '-26.0254685', '28.00397', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('68', '0', '0', '', '', '0', '0', '0');
INSERT INTO `campaign_transaction` VALUES ('69', '0', '0', '', '', '0', '0', '0');
INSERT INTO `campaign_transaction` VALUES ('70', '0', '0', '', '', '0', '0', '0');
INSERT INTO `campaign_transaction` VALUES ('71', '150', '4', '-26.093611', '28.006389', '0', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('72', '150', '6', '-26.093611', '28.006389', '0', '0', '10');
INSERT INTO `campaign_transaction` VALUES ('73', '150', '8', '-26.093611', '28.006389', '0', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('74', '150', '11', '-26.093611', '28.006389', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('75', '151', '1', '-25.746111', '28.188056', '0', '0', '3');
INSERT INTO `campaign_transaction` VALUES ('76', '151', '4', '-25.746111', '28.188056', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('77', '151', '6', '-25.746111', '28.188056', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('78', '151', '1', '-25.746111', '28.188056', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('79', '151', '4', '-25.746111', '28.188056', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('80', '151', '6', '-25.746111', '28.188056', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('81', '151', '1', '-29.8586804', '31.0218404', '0', '0', '3');
INSERT INTO `campaign_transaction` VALUES ('82', '151', '4', '-29.8586804', '31.0218404', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('83', '151', '6', '-29.8586804', '31.0218404', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('84', '151', '1', '-29.8586804', '31.0218404', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('85', '151', '4', '-29.8586804', '31.0218404', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('86', '151', '6', '-29.8586804', '31.0218404', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('87', '152', '3', '-26.1075663', '28.0567007', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('88', '152', '3', '-26.1075663', '28.0567007', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('89', '152', '3', '-26.1075663', '28.0567007', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('90', '152', '3', '-26.2041028', '28.0473051', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('91', '152', '3', '-26.2041028', '28.0473051', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('92', '152', '3', '-26.2041028', '28.0473051', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('93', '152', '3', '-26.141111', '28.152778', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('94', '152', '3', '-26.141111', '28.152778', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('95', '152', '3', '-26.141111', '28.152778', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('96', '153', '8', '-26.0755899', '28.01133', '32', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('97', '153', '8', '-26.0755899', '28.01133', '33', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('98', '153', '8', '-26.0755899', '28.01133', '32', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('99', '153', '8', '-26.0755899', '28.01133', '33', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('100', '153', '8', '-26.0755899', '28.01133', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('101', '153', '8', '-26.0755899', '28.01133', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('102', '153', '8', '-26.0755899', '28.01133', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('103', '153', '8', '-26.0755899', '28.01133', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('104', '153', '8', '-26.093611', '28.006389', '32', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('105', '153', '8', '-26.093611', '28.006389', '33', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('106', '153', '8', '-26.093611', '28.006389', '32', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('107', '153', '8', '-26.093611', '28.006389', '33', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('108', '153', '8', '-26.093611', '28.006389', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('109', '153', '8', '-26.093611', '28.006389', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('110', '153', '8', '-26.093611', '28.006389', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('111', '153', '8', '-26.093611', '28.006389', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('112', '153', '8', '-26.2125', '28.2625', '32', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('113', '153', '8', '-26.2125', '28.2625', '33', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('114', '153', '8', '-26.2125', '28.2625', '32', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('115', '153', '8', '-26.2125', '28.2625', '33', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('116', '153', '8', '-26.2125', '28.2625', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('117', '153', '8', '-26.2125', '28.2625', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('118', '153', '8', '-26.2125', '28.2625', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('119', '153', '8', '-26.2125', '28.2625', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('120', '153', '8', '-26.188333', '28.320556', '32', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('121', '153', '8', '-26.188333', '28.320556', '33', '0', '5');
INSERT INTO `campaign_transaction` VALUES ('122', '153', '8', '-26.188333', '28.320556', '32', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('123', '153', '8', '-26.188333', '28.320556', '33', '0', '2');
INSERT INTO `campaign_transaction` VALUES ('124', '153', '8', '-26.188333', '28.320556', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('125', '153', '8', '-26.188333', '28.320556', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('126', '153', '8', '-26.188333', '28.320556', '32', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('127', '153', '8', '-26.188333', '28.320556', '33', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('128', '154', '2', '-26.2041028', '28.0473051', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('129', '154', '3', '-26.2041028', '28.0473051', '0', '0', '1');
INSERT INTO `campaign_transaction` VALUES ('130', '154', '5', '-26.2041028', '28.0473051', '0', '0', '1');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `cat_id` int(4) NOT NULL AUTO_INCREMENT,
  `parent_id` int(4) DEFAULT NULL,
  `left_id` int(8) NOT NULL,
  `right_id` int(8) NOT NULL,
  `level` int(1) NOT NULL,
  `cat_name` tinytext,
  `sub_counter` int(11) DEFAULT '0',
  `counter` int(11) DEFAULT '0',
  `cat_colour` varchar(15) DEFAULT '',
  `cat_image` varchar(150) DEFAULT '',
  PRIMARY KEY (`cat_id`),
  KEY `left_id` (`left_id`,`right_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '-1', '1', '12', '-1', 'All', '0', '0', '', '');
INSERT INTO `categories` VALUES ('204', '1', '6', '11', '0', 'Traditional', '0', '0', '', '');
INSERT INTO `categories` VALUES ('205', '204', '9', '10', '1', 'Bill Boards', '0', '0', '', '');
INSERT INTO `categories` VALUES ('206', '204', '7', '8', '1', 'Bins', '0', '0', '', '');
INSERT INTO `categories` VALUES ('207', '1', '2', '5', '0', 'Digital', '0', '0', '', '');
INSERT INTO `categories` VALUES ('208', '207', '3', '4', '1', 'Street Poles', '0', '0', '', '');

-- ----------------------------
-- Table structure for `ci_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `is_logged_in` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('0fdc69677ad7d3d935100a8a39f1db55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', '1417165257', '', null, null, null);
INSERT INTO `ci_sessions` VALUES ('23018bd51fe958eefd7d1adbb3fc0d19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '1416491742', '', null, null, null);
INSERT INTO `ci_sessions` VALUES ('c3ec1493bd3f96dbd9da0589a4ef0165', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '1416466170', 'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:6:\"pintos\";s:12:\"is_logged_in\";b:1;s:7:\"user_id\";s:1:\"5\";s:9:\"user_type\";s:1:\"2\";s:10:\"user_photo\";s:0:\"\";i:0;O:8:\"stdClass\":35:{s:6:\"use_id\";s:1:\"5\";s:12:\"use_password\";s:6:\"pintos\";s:6:\"ust_id\";s:1:\"2\";s:12:\"use_username\";s:6:\"pintos\";s:10:\"use_status\";s:1:\"1\";s:6:\"pem_id\";N;s:21:\"use_registration_date\";s:19:\"2014-08-22 11:37:39\";s:16:\"use_date_updated\";N;s:16:\"use_date_deleted\";N;s:14:\"use_first_name\";s:11:\"media owner\";s:13:\"use_last_name\";s:9:\"developer\";s:9:\"use_email\";N;s:9:\"use_photo\";s:0:\"\";s:17:\"use_mobile_number\";s:0:\"\";s:16:\"use_company_name\";s:13:\"Indigo Vision\";s:17:\"use_street_number\";s:0:\"\";s:10:\"use_suburb\";s:0:\"\";s:8:\"use_city\";s:0:\"\";s:11:\"use_country\";s:0:\"\";s:20:\"use_terms_conditions\";s:0:\"\";s:18:\"use_watchlist_mail\";s:0:\"\";s:21:\"use_auction_bids_mail\";s:0:\"\";s:22:\"use_notifications_mail\";s:0:\"\";s:12:\"use_rfp_mail\";s:0:\"\";s:17:\"use_workflow_mail\";s:0:\"\";s:17:\"use_watchlist_sms\";s:0:\"\";s:19:\"use_auctionlist_sms\";s:0:\"\";s:13:\"use_notif_sms\";s:0:\"\";s:11:\"use_rfp_sms\";s:0:\"\";s:12:\"use_flow_sms\";s:0:\"\";s:18:\"use_current_status\";s:0:\"\";s:11:\"use_deposit\";s:0:\"\";s:17:\"use_auction_limit\";s:0:\"\";s:18:\"use_increase_limit\";s:0:\"\";s:11:\"user_status\";s:1:\"1\";}}', null, null, null);
INSERT INTO `ci_sessions` VALUES ('e7135448b5d7ae476cd448e5736f37c4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', '1417077065', '', null, null, null);

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cit_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cou_code` varchar(255) DEFAULT NULL,
  `cit_pos_code` int(11) DEFAULT NULL,
  `cit_name` varchar(255) DEFAULT NULL,
  `cit_lat` varchar(255) DEFAULT NULL,
  `cit_long` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', 'ZA', '6270', 'Aberdeen', '-32.4833', '24.0667');
INSERT INTO `city` VALUES ('2', 'ZA', '1227', 'Acornhoek', '-24.5833', '31.0833');
INSERT INTO `city` VALUES ('3', 'ZA', '6105', 'Addo', '-33.5667', '25.6833');
INSERT INTO `city` VALUES ('4', 'ZA', '5760', 'Adelaide', '-32.7', '26.3');
INSERT INTO `city` VALUES ('5', 'ZA', '6282', 'Adendorp', '-32.3', '24.55');
INSERT INTO `city` VALUES ('6', 'ZA', '6695', 'Albertina', '-34.2', '21.5833');
INSERT INTO `city` VALUES ('7', 'ZA', '6695', 'Albertinia', '-34.2', '21.5833');
INSERT INTO `city` VALUES ('8', 'ZA', '1447', 'Alberton', '-26.2333', '28.1333');
INSERT INTO `city` VALUES ('9', 'ZA', '8290', 'Alexander Bay', '-28.5833', '16.4833');
INSERT INTO `city` VALUES ('10', 'ZA', '6185', 'Alexandria', '-24.9167', '31.15');
INSERT INTO `city` VALUES ('11', 'ZA', '5700', 'Alice', '-32.7833', '26.8333');
INSERT INTO `city` VALUES ('12', 'ZA', '6135', 'Alicedale', '-33.3167', '26.0833');
INSERT INTO `city` VALUES ('13', 'ZA', '9750', 'Aliwal North', '-30.7', '26.7');
INSERT INTO `city` VALUES ('14', 'ZA', '9750', 'Aliwal-Noord', '-30.7', '26.7');
INSERT INTO `city` VALUES ('15', 'ZA', '9490', 'Allanridge', '-27.75', '26.6667');
INSERT INTO `city` VALUES ('16', 'ZA', '1709', 'Allen\'S Nek', '-31.6667', '28.0333');
INSERT INTO `city` VALUES ('17', 'ZA', '1428', 'Alrode', '-26.3', '28.1333');
INSERT INTO `city` VALUES ('18', 'ZA', '3279', 'Amanzimtoti', '-30.05', '30.8833');
INSERT INTO `city` VALUES ('19', 'ZA', '2490', 'Amersfoort', '-26.9833', '28.85');
INSERT INTO `city` VALUES ('20', 'ZA', '2375', 'Amsterdam', '-26.6167', '30.6667');
INSERT INTO `city` VALUES ('21', 'ZA', '4230', 'Anerley', '-30.6667', '30.5');
INSERT INTO `city` VALUES ('22', 'ZA', '9602', 'Arlington', '-28.0333', '27.85');
INSERT INTO `city` VALUES ('23', 'ZA', '6715', 'Ashton', '-33.8167', '20.05');
INSERT INTO `city` VALUES ('24', 'ZA', '7764', 'Athlone', '-33.9667', '18.5');
INSERT INTO `city` VALUES ('25', 'ZA', '7304', 'Atlantis', '-33.5667', '18.4833');
INSERT INTO `city` VALUES ('26', 'ZA', '749', 'Atok', '-23.95', '29.1333');
INSERT INTO `city` VALUES ('27', 'ZA', '8', 'Atteridgeville', '-25.7728', '28.0678');
INSERT INTO `city` VALUES ('28', 'ZA', '746', 'Bakone', '-23.95', '29.1333');
INSERT INTO `city` VALUES ('29', 'ZA', '2410', 'Balfour', '-26.65', '28.5833');
INSERT INTO `city` VALUES ('30', 'ZA', '432', 'Bamokgoko', '-25.1039', '28.5219');
INSERT INTO `city` VALUES ('31', 'ZA', '1300', 'Barberton', '-25.7833', '31.05');
INSERT INTO `city` VALUES ('32', 'ZA', '9786', 'Barkly East', '-30.9667', '27.6');
INSERT INTO `city` VALUES ('33', 'ZA', '8375', 'Barkly West', '-28.5333', '24.5167');
INSERT INTO `city` VALUES ('34', 'ZA', '6166', 'Bathurst', '-33.4833', '26.8333');
INSERT INTO `city` VALUES ('35', 'ZA', '8315', 'Beaconsfield', '-22.9333', '30.1167');
INSERT INTO `city` VALUES ('36', 'ZA', '6970', 'Beaufort Wes', '-32.35', '22.5833');
INSERT INTO `city` VALUES ('37', 'ZA', '6940', 'Beaufort West', '-32.35', '22.5833');
INSERT INTO `city` VALUES ('38', 'ZA', '6970', 'Beaufort-Wes', '-32.35', '22.5833');
INSERT INTO `city` VALUES ('39', 'ZA', '5780', 'Bedford', '-32.6833', '26.0833');
INSERT INTO `city` VALUES ('40', 'ZA', '2007', 'Bedfordview', '-26.1667', '28.15');
INSERT INTO `city` VALUES ('41', 'ZA', '1940', 'Bedworth Park', '-26.7167', '27.8833');
INSERT INTO `city` VALUES ('42', 'ZA', '1779', 'Bekkersdal', '-26.2833', '27.7167');
INSERT INTO `city` VALUES ('43', 'ZA', '1100', 'Belfast', '-25.6833', '30.0333');
INSERT INTO `city` VALUES ('44', 'ZA', '7493', 'Belhar', '-33.9222', '18.5333');
INSERT INTO `city` VALUES ('45', 'ZA', '7530', 'Bellville', '-33.9', '18.6333');
INSERT INTO `city` VALUES ('46', 'ZA', '1501', 'Benoni', '-26.1833', '28.3167');
INSERT INTO `city` VALUES ('47', 'ZA', '3350', 'Bergville', '-28.7333', '29.3667');
INSERT INTO `city` VALUES ('48', 'ZA', '7945', 'Bergvliet', '-34.0475', '18.4525');
INSERT INTO `city` VALUES ('49', 'ZA', '2309', 'Bethal', '-26.45', '29.4667');
INSERT INTO `city` VALUES ('50', 'ZA', '6028', 'Bethelsdorp', '-33.8833', '25.5');
INSERT INTO `city` VALUES ('51', 'ZA', '9700', 'Bethlehem', '-28.2333', '28.3');
INSERT INTO `city` VALUES ('52', 'ZA', '9992', 'Bethulie', '-30.5333', '21.2833');
INSERT INTO `city` VALUES ('53', 'ZA', '5605', 'Bisho', '-32.8667', '27.4333');
INSERT INTO `city` VALUES ('54', 'ZA', '8201', 'Bitterfontein', '-31.0333', '18.2667');
INSERT INTO `city` VALUES ('55', 'ZA', '4800', 'Bizana', '-30.85', '29.85');
INSERT INTO `city` VALUES ('56', 'ZA', '7580', 'Blackheath', '-26.1333', '27.9667');
INSERT INTO `city` VALUES ('57', 'ZA', '2250', 'Blinkpan', '-26.1', '29.4333');
INSERT INTO `city` VALUES ('58', 'ZA', '9300', 'Bloemfontein', '-29.1333', '26.2');
INSERT INTO `city` VALUES ('59', 'ZA', '2660', 'Bloemhof', '-27.65', '25.6');
INSERT INTO `city` VALUES ('60', 'ZA', '9364', 'Bloemspruit', '-29.1333', '26.25');
INSERT INTO `city` VALUES ('61', 'ZA', '3024', 'Blood River', '-28.1909', '30.2879');
INSERT INTO `city` VALUES ('62', 'ZA', '7441', 'Bloubergrant', '-33.8213', '18.4454');
INSERT INTO `city` VALUES ('63', 'ZA', '7441', 'Bloubergstrand', '-33.8213', '18.4454');
INSERT INTO `city` VALUES ('64', 'ZA', '4052', 'Bluff', '-29.85', '31.0167');
INSERT INTO `city` VALUES ('65', 'ZA', '626', 'Bochum', '-24.1667', '29');
INSERT INTO `city` VALUES ('66', 'ZA', '9702', 'Bohlokong', '-28.2333', '28.3');
INSERT INTO `city` VALUES ('67', 'ZA', '308', 'Boitekong', '-25.6667', '27.25');
INSERT INTO `city` VALUES ('68', 'ZA', '1446', 'Boksburg', '-26.2167', '28.25');
INSERT INTO `city` VALUES ('69', 'ZA', '474', 'Boleu', '-25.15', '29.3833');
INSERT INTO `city` VALUES ('70', 'ZA', '6730', 'Bonnievale', '-33.9333', '22.0333');
INSERT INTO `city` VALUES ('71', 'ZA', '182', 'Boordfontein', '-25.6771', '28.1867');
INSERT INTO `city` VALUES ('72', 'ZA', '182', 'Boordfontein West', '-25.6771', '28.1867');
INSERT INTO `city` VALUES ('73', 'ZA', '182', 'Boordfontein-Wes', '-25.6771', '28.1867');
INSERT INTO `city` VALUES ('74', 'ZA', '1286', 'Bosbokrand', '-24.8333', '31.0667');
INSERT INTO `city` VALUES ('75', 'ZA', '8340', 'Boshof', '-28.55', '25.2333');
INSERT INTO `city` VALUES ('76', 'ZA', '2528', 'Boskop', '-29.5', '26.2');
INSERT INTO `city` VALUES ('77', 'ZA', '3660', 'Botha\'S Hill', '-29.7167', '30.7333');
INSERT INTO `city` VALUES ('78', 'ZA', '9660', 'Bothaville', '-27.3667', '26.6167');
INSERT INTO `city` VALUES ('79', 'ZA', '9781', 'Botshabelo', '-29.2333', '26.7333');
INSERT INTO `city` VALUES ('80', 'ZA', '727', 'Boyne', '-23.9333', '29.8167');
INSERT INTO `city` VALUES ('81', 'ZA', '7560', 'Brackenfell', '-33.8667', '18.6833');
INSERT INTO `city` VALUES ('82', 'ZA', '1540', 'Brakpan', '-26.2333', '28.3667');
INSERT INTO `city` VALUES ('83', 'ZA', '1541', 'Brakpan North', '-26.2333', '28.3667');
INSERT INTO `city` VALUES ('84', 'ZA', '2054', 'Bramley', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('85', 'ZA', '9400', 'Brandfort', '-28.7', '26.4667');
INSERT INTO `city` VALUES ('86', 'ZA', '7281', 'Bredasdorp', '-34.5333', '20.0333');
INSERT INTO `city` VALUES ('87', 'ZA', '2330', 'Breyten', '-26.3', '29.9833');
INSERT INTO `city` VALUES ('88', 'ZA', '189', 'Brits', '-25.6333', '27.7833');
INSERT INTO `city` VALUES ('89', 'ZA', '8782', 'Britstown', '-30.5833', '23.5');
INSERT INTO `city` VALUES ('90', 'ZA', '2154', 'Bromhof', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('91', 'ZA', '1020', 'Bronkhorstspruit', '-25.8083', '28.7406');
INSERT INTO `city` VALUES ('92', 'ZA', '2021', 'Bryanston', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('93', 'ZA', '9670', 'Bultfontein', '-25.1167', '28.5667');
INSERT INTO `city` VALUES ('94', 'ZA', '3244', 'Bulwer', '-29.8', '29.75');
INSERT INTO `city` VALUES ('95', 'ZA', '9744', 'Burgersdorp', '-30.9833', '26.3167');
INSERT INTO `city` VALUES ('96', 'ZA', '1085', 'Burgersfort', '-24.6667', '30.3333');
INSERT INTO `city` VALUES ('97', 'ZA', '1255', 'Bushbuckridge', '-24.8333', '31.0667');
INSERT INTO `city` VALUES ('98', 'ZA', '4960', 'Butterworth', '-32.3333', '28.15');
INSERT INTO `city` VALUES ('99', 'ZA', '5455', 'Cala', '-31.5167', '27.7');
INSERT INTO `city` VALUES ('100', 'ZA', '7185', 'Caledon', '-34.2167', '19.4167');
INSERT INTO `city` VALUES ('101', 'ZA', '6660', 'Calitzdorp', '-33.5333', '21.6833');
INSERT INTO `city` VALUES ('102', 'ZA', '8190', 'Calvinia', '-31.4667', '19.7833');
INSERT INTO `city` VALUES ('103', 'ZA', '5247', 'Cambridge', '-32.9667', '27.8833');
INSERT INTO `city` VALUES ('104', 'ZA', '7100', 'Cape Town', '-33.9167', '18.4167');
INSERT INTO `city` VALUES ('105', 'ZA', '2495', 'Carletonville', '-26.3667', '27.4');
INSERT INTO `city` VALUES ('106', 'ZA', '2534', 'Carltonville', '-26.7167', '27.1');
INSERT INTO `city` VALUES ('107', 'ZA', '8922', 'Carnarvon', '-30.95', '22.1333');
INSERT INTO `city` VALUES ('108', 'ZA', '1185', 'Carolina', '-26.0693', '30.1149');
INSERT INTO `city` VALUES ('109', 'ZA', '5310', 'Cathcart', '-32.3', '27.1333');
INSERT INTO `city` VALUES ('110', 'ZA', '3680', 'Cato Ridge', '-29.7333', '30.5833');
INSERT INTO `city` VALUES ('111', 'ZA', '14', 'Centurion', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('112', 'ZA', '6835', 'Ceres', '-33.3667', '19.3167');
INSERT INTO `city` VALUES ('113', 'ZA', '3871', 'Ceza', '-27.9833', '31.3833');
INSERT INTO `city` VALUES ('114', 'ZA', '3604', 'Chatsworth', '-29.8167', '30.85');
INSERT INTO `city` VALUES ('115', 'ZA', '2680', 'Christiana', '-28.2333', '21.25');
INSERT INTO `city` VALUES ('116', 'ZA', '362', 'Chromite', '-24.6', '27.4');
INSERT INTO `city` VALUES ('117', 'ZA', '745', 'Chuenespoort', '-23.95', '29.1333');
INSERT INTO `city` VALUES ('118', 'ZA', '7340', 'Citrusdal', '-32.6', '19.0167');
INSERT INTO `city` VALUES ('119', 'ZA', '8120', 'Clanwilliam', '-32.1833', '18.9');
INSERT INTO `city` VALUES ('120', 'ZA', '7708', 'Claremont', '-33.9833', '18.4667');
INSERT INTO `city` VALUES ('121', 'ZA', '9707', 'Clarens', '-28.5167', '28.4167');
INSERT INTO `city` VALUES ('122', 'ZA', '5024', 'Clarkebury', '-31.7833', '28.3');
INSERT INTO `city` VALUES ('123', 'ZA', '3610', 'Clernaville', '-29.8139', '30.8389');
INSERT INTO `city` VALUES ('124', 'ZA', '9735', 'Clocolan', '-28.9', '27.5667');
INSERT INTO `city` VALUES ('125', 'ZA', '1033', 'Coalville', '-26.0333', '29.1667');
INSERT INTO `city` VALUES ('126', 'ZA', '5329', 'Cofimvaba', '-32.0167', '27.5833');
INSERT INTO `city` VALUES ('127', 'ZA', '6175', 'Colchester', '-33.6', '26.9');
INSERT INTO `city` VALUES ('128', 'ZA', '3360', 'Colenso', '-28.7333', '29.8167');
INSERT INTO `city` VALUES ('129', 'ZA', '9795', 'Colesberg', '-30.7333', '25.1');
INSERT INTO `city` VALUES ('130', 'ZA', '2725', 'Coligny', '-26.3333', '26.3167');
INSERT INTO `city` VALUES ('131', 'ZA', '7806', 'Constantia', '-34.0167', '18.45');
INSERT INTO `city` VALUES ('132', 'ZA', '5820', 'Cookhouse', '-32.75', '25.8167');
INSERT INTO `city` VALUES ('133', 'ZA', '9850', 'Cornelia', '-23.7167', '29.1333');
INSERT INTO `city` VALUES ('134', 'ZA', '5365', 'Cradock', '-32.1833', '25.6167');
INSERT INTO `city` VALUES ('135', 'ZA', '7764', 'Crawford', '-33.9833', '18.5');
INSERT INTO `city` VALUES ('136', 'ZA', '3263', 'Creighton', '-30.0333', '29.8333');
INSERT INTO `city` VALUES ('137', 'ZA', '1002', 'Cullinan', '-25.6756', '28.5222');
INSERT INTO `city` VALUES ('138', 'ZA', '1541', 'Dalpark', '-26.2333', '28.3667');
INSERT INTO `city` VALUES ('139', 'ZA', '3230', 'Dalton', '-29.3333', '30.6333');
INSERT INTO `city` VALUES ('140', 'ZA', '8405', 'Danielskuil', '-28.1833', '23.5333');
INSERT INTO `city` VALUES ('141', 'ZA', '3080', 'Dannhause', '-28', '30.05');
INSERT INTO `city` VALUES ('142', 'ZA', '3080', 'Dannhauser', '-28', '30.05');
INSERT INTO `city` VALUES ('143', 'ZA', '7345', 'Darling', '-26.9833', '29.3167');
INSERT INTO `city` VALUES ('144', 'ZA', '4480', 'Darnall', '-26.4', '23.25');
INSERT INTO `city` VALUES ('145', 'ZA', '7347', 'Dassenberg', '-33.0833', '18.75');
INSERT INTO `city` VALUES ('146', 'ZA', '1519', 'Daveyton', '-26.15', '28.4167');
INSERT INTO `city` VALUES ('147', 'ZA', '7000', 'De Aar', '-30.65', '24.0167');
INSERT INTO `city` VALUES ('148', 'ZA', '1884', 'De Deur', '-26.5333', '27.9333');
INSERT INTO `city` VALUES ('149', 'ZA', '9348', 'Dealesville', '-28.6667', '25.7667');
INSERT INTO `city` VALUES ('150', 'ZA', '2718', 'Delareyville', '-26.6833', '25.4667');
INSERT INTO `city` VALUES ('151', 'ZA', '7100', 'Delft', '-33.9778', '18.6167');
INSERT INTO `city` VALUES ('152', 'ZA', '2210', 'Delmas', '-26.15', '28.6833');
INSERT INTO `city` VALUES ('153', 'ZA', '1401', 'Delmore', '-26.2', '28.175');
INSERT INTO `city` VALUES ('154', 'ZA', '8377', 'Delportshoop', '-28.4167', '24.3');
INSERT INTO `city` VALUES ('155', 'ZA', '786', 'Dendron', '-23.3833', '29.3333');
INSERT INTO `city` VALUES ('156', 'ZA', '1932', 'Deneysville', '-26.8833', '28.1');
INSERT INTO `city` VALUES ('157', 'ZA', '160', 'Denneboom', '-25.7181', '28.3342');
INSERT INTO `city` VALUES ('158', 'ZA', '35', 'Derdepoortpark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('159', 'ZA', '4399', 'Desainagar', '-29.114', '30.6772');
INSERT INTO `city` VALUES ('160', 'ZA', '6220', 'Despatch', '-33.8', '25.4667');
INSERT INTO `city` VALUES ('161', 'ZA', '2260', 'Devon', '-26.35', '28.7667');
INSERT INTO `city` VALUES ('162', 'ZA', '9940', 'Dewetsdorp', '-29.5833', '26.6667');
INSERT INTO `city` VALUES ('163', 'ZA', '457', 'Dibasabophelo', '-24.9667', '29.3');
INSERT INTO `city` VALUES ('164', 'ZA', '7800', 'Diep River', '-34.0345', '18.4651');
INSERT INTO `city` VALUES ('165', 'ZA', '1804', 'Diepkloof', '-26.2333', '27.9333');
INSERT INTO `city` VALUES ('166', 'ZA', '9873', 'Dikgakeng', '-28.5333', '28.8');
INSERT INTO `city` VALUES ('167', 'ZA', '721', 'Dikgale', '-23.7333', '29.7833');
INSERT INTO `city` VALUES ('168', 'ZA', '2868', 'Dinokana', '-25.45', '25.8667');
INSERT INTO `city` VALUES ('169', 'ZA', '1723', 'Dobsonville', '-26.2167', '27.8667');
INSERT INTO `city` VALUES ('170', 'ZA', '3237', 'Donnybrook', '-29.9333', '29.8667');
INSERT INTO `city` VALUES ('171', 'ZA', '4126', 'Doonside', '-30.0667', '30.8833');
INSERT INTO `city` VALUES ('172', 'ZA', '17', 'Doornpoort', '-25.6333', '28.2667');
INSERT INTO `city` VALUES ('173', 'ZA', '5420', 'Dordrecht', '-31.3667', '27.05');
INSERT INTO `city` VALUES ('174', 'ZA', '4091', 'Dormerton', '-29.85', '31');
INSERT INTO `city` VALUES ('175', 'ZA', '8730', 'Douglas', '-29.0667', '23.7667');
INSERT INTO `city` VALUES ('176', 'ZA', '1128', 'Driekop', '-24.5833', '30.1667');
INSERT INTO `city` VALUES ('177', 'ZA', '1801', 'Dube', '-26.25', '27.9167');
INSERT INTO `city` VALUES ('178', 'ZA', '1494', 'Duduza', '-26.3667', '28.4167');
INSERT INTO `city` VALUES ('179', 'ZA', '815', 'Duiwelskloof', '-23.7', '30.1333');
INSERT INTO `city` VALUES ('180', 'ZA', '3000', 'Dundee', '-28.1667', '30.2333');
INSERT INTO `city` VALUES ('181', 'ZA', '2336', 'Dundonald', '-26.5333', '29.9833');
INSERT INTO `city` VALUES ('182', 'ZA', '1496', 'Dunnottar', '-26.35', '28.4167');
INSERT INTO `city` VALUES ('183', 'ZA', '3611', 'Durban', '-29.85', '31.0167');
INSERT INTO `city` VALUES ('184', 'ZA', '4019', 'Durban North', '-29.8', '31.0333');
INSERT INTO `city` VALUES ('185', 'ZA', '4051', 'Durban-Noord', '-29.8', '31.0333');
INSERT INTO `city` VALUES ('186', 'ZA', '7550', 'Durbanville', '-33.8333', '18.65');
INSERT INTO `city` VALUES ('187', 'ZA', '812', 'Dwars River', '-23.45', '29.75');
INSERT INTO `city` VALUES ('188', 'ZA', '955', 'Dzanani', '-22.8833', '30.1667');
INSERT INTO `city` VALUES ('189', 'ZA', '5201', 'East London', '-33.025', '27.9082');
INSERT INTO `city` VALUES ('190', 'ZA', '5740', 'Eastern Cape', '-32.765', '26.685');
INSERT INTO `city` VALUES ('191', 'ZA', '9908', 'Edenburg', '-29.7333', '25.9333');
INSERT INTO `city` VALUES ('192', 'ZA', '3201', 'Edendale', '-29.65', '30.2833');
INSERT INTO `city` VALUES ('193', 'ZA', '1609', 'Edenvale', '-26.1333', '28.1833');
INSERT INTO `city` VALUES ('194', 'ZA', '9535', 'Edenville', '-29.2667', '21.6333');
INSERT INTO `city` VALUES ('195', 'ZA', '7100', 'Eerste River', '-34', '18.7333');
INSERT INTO `city` VALUES ('196', 'ZA', '7100', 'Eerste Rivier', '-33.9778', '18.6167');
INSERT INTO `city` VALUES ('197', 'ZA', '7100', 'Eersterivier', '-34.0167', '18.7');
INSERT INTO `city` VALUES ('198', 'ZA', '22', 'Eersterus', '-25.7236', '28.3194');
INSERT INTO `city` VALUES ('199', 'ZA', '1021', 'Ekangala', '-25.6944', '28.7483');
INSERT INTO `city` VALUES ('200', 'ZA', '1429', 'Elandsfontein', '-26.3833', '27.8667');
INSERT INTO `city` VALUES ('201', 'ZA', '3226', 'Elandskop', '-29.3167', '29.7');
INSERT INTO `city` VALUES ('202', 'ZA', '1811', 'Eldoradopark', '-26.3', '27.9');
INSERT INTO `city` VALUES ('203', 'ZA', '5460', 'Elliot', '-30.9167', '26.6833');
INSERT INTO `city` VALUES ('204', 'ZA', '5070', 'Elliotdale', '-31.9667', '28.6833');
INSERT INTO `city` VALUES ('205', 'ZA', '531', 'Ellisras', '-23.6667', '27.7333');
INSERT INTO `city` VALUES ('206', 'ZA', '1409', 'Elsburg', '-26.2333', '28.2');
INSERT INTO `city` VALUES ('207', 'ZA', '7490', 'Elsies River', '-33.9222', '18.5222');
INSERT INTO `city` VALUES ('208', 'ZA', '7490', 'Elsiesrivier', '-33.9167', '18.5667');
INSERT INTO `city` VALUES ('209', 'ZA', '7764', 'Elspark', '-33.9778', '18.5167');
INSERT INTO `city` VALUES ('210', 'ZA', '2285', 'Embalenhle', '-26.5333', '29.0667');
INSERT INTO `city` VALUES ('211', 'ZA', '6011', 'Emerald Hill', '-34', '25.55');
INSERT INTO `city` VALUES ('212', 'ZA', '3101', 'Emondlo', '-28.2533', '29.9933');
INSERT INTO `city` VALUES ('213', 'ZA', '3875', 'Empangeni', '-28.75', '31.9');
INSERT INTO `city` VALUES ('214', 'ZA', '458', 'Empumalanga', '-25.3167', '31.1');
INSERT INTO `city` VALUES ('215', 'ZA', '5050', 'Engcobo', '-31.6833', '28');
INSERT INTO `city` VALUES ('216', 'ZA', '1824', 'Ennerdale', '-26.4167', '27.8333');
INSERT INTO `city` VALUES ('217', 'ZA', '2330', 'Ermelo', '-26.5333', '29.9833');
INSERT INTO `city` VALUES ('218', 'ZA', '3814', 'Eshowe', '-28.8833', '31.4667');
INSERT INTO `city` VALUES ('219', 'ZA', '3887', 'Esikhawini', '-28.8833', '31.9');
INSERT INTO `city` VALUES ('220', 'ZA', '6012', 'Estadeal', '-33.9667', '25.5833');
INSERT INTO `city` VALUES ('221', 'ZA', '3280', 'Estcourt', '-29', '29.8833');
INSERT INTO `city` VALUES ('222', 'ZA', '1519', 'Ethwathwa West Uit 2', '-26.15', '28.4167');
INSERT INTO `city` VALUES ('223', 'ZA', '2260', 'Evander', '-26.35', '28.7667');
INSERT INTO `city` VALUES ('224', 'ZA', '9760', 'Excelsior', '-25.8333', '30.5167');
INSERT INTO `city` VALUES ('225', 'ZA', '3381', 'Ezakheni', '-28.55', '29.7833');
INSERT INTO `city` VALUES ('226', 'ZA', '43', 'Faerie Glen', '-30.85', '30.3333');
INSERT INTO `city` VALUES ('227', 'ZA', '9978', 'Fauresmith', '-29.75', '25.3167');
INSERT INTO `city` VALUES ('228', 'ZA', '9730', 'Ficksburg', '-28.8833', '27.8833');
INSERT INTO `city` VALUES ('229', 'ZA', '7130', 'Firgrove', '-34.075', '18.8083');
INSERT INTO `city` VALUES ('230', 'ZA', '7975', 'Fish Hoek', '-34.0056', '18.4222');
INSERT INTO `city` VALUES ('231', 'ZA', '7975', 'Fishhoek', '-34.0056', '18.4222');
INSERT INTO `city` VALUES ('232', 'ZA', '4810', 'Flagstaff', '-31.0833', '29.4833');
INSERT INTO `city` VALUES ('233', 'ZA', '1700', 'Florida', '-26.1667', '27.9167');
INSERT INTO `city` VALUES ('234', 'ZA', '2515', 'Fochville', '-26.4833', '27.5');
INSERT INTO `city` VALUES ('235', 'ZA', '5720', 'Fort Beaufort', '-32.7833', '26.6333');
INSERT INTO `city` VALUES ('236', 'ZA', '2055', 'Four Ways', '-26.0333', '27.9833');
INSERT INTO `city` VALUES ('237', 'ZA', '9725', 'Fouriesburg', '-28.5833', '28.1333');
INSERT INTO `city` VALUES ('238', 'ZA', '9830', 'Frankfort', '-27.2833', '28.5');
INSERT INTO `city` VALUES ('239', 'ZA', '7690', 'Franschhoek', '-33.9166', '19.1166');
INSERT INTO `city` VALUES ('240', 'ZA', '6960', 'Fraserburg', '-31.9167', '21.5167');
INSERT INTO `city` VALUES ('241', 'ZA', '9430', 'Free State', '-28.1167', '26.9');
INSERT INTO `city` VALUES ('242', 'ZA', '838', 'Gakgapane', '-23.3167', '30.7167');
INSERT INTO `city` VALUES ('243', 'ZA', '8330', 'Galeshewe', '-27.9796', '25.1093');
INSERT INTO `city` VALUES ('244', 'ZA', '705', 'Ga-Maraba', '-23.7167', '29.3167');
INSERT INTO `city` VALUES ('245', 'ZA', '6241', 'Gambleville', '-33.7839', '25.3974');
INSERT INTO `city` VALUES ('246', 'ZA', '7220', 'Gans Bay', '-34.5833', '19.35');
INSERT INTO `city` VALUES ('247', 'ZA', '8582', 'Ganyesa', '-26.6', '24.1833');
INSERT INTO `city` VALUES ('248', 'ZA', '208', 'Ga-Rankuwa', '-25.5883', '28.0078');
INSERT INTO `city` VALUES ('249', 'ZA', '9775', 'Garapulana', '-29.3154', '27.4386');
INSERT INTO `city` VALUES ('250', 'ZA', '9775', 'Ga-Rapulana', '-29.3154', '27.4386');
INSERT INTO `city` VALUES ('251', 'ZA', '8221', 'Garies', '-30.55', '17.9833');
INSERT INTO `city` VALUES ('252', 'ZA', '42', 'Garsfontein', '-25.8008', '28.2956');
INSERT INTO `city` VALUES ('253', 'ZA', '9323', 'Gasehunelo', '-28.0833', '24.8917');
INSERT INTO `city` VALUES ('254', 'ZA', '9323', 'Ga-Sehunelo', '-27.0333', '23.5833');
INSERT INTO `city` VALUES ('255', 'ZA', '7762', 'Gatesville', '-33.9625', '18.4917');
INSERT INTO `city` VALUES ('256', 'ZA', '1438', 'Gauteng', '-26.3583', '28.2667');
INSERT INTO `city` VALUES ('257', 'ZA', '9468', 'Geduldpan', '-27.9833', '26.7333');
INSERT INTO `city` VALUES ('258', 'ZA', '6020', 'Gelvandale', '-33.9167', '25.55');
INSERT INTO `city` VALUES ('259', 'ZA', '6529', 'George', '-33.9667', '22.45');
INSERT INTO `city` VALUES ('260', 'ZA', '6529', 'George East', '-33.8167', '25.65');
INSERT INTO `city` VALUES ('261', 'ZA', '1401', 'Germiston', '-26.2167', '28.1833');
INSERT INTO `city` VALUES ('262', 'ZA', '3610', 'Gillitts', '-29.8', '30.8');
INSERT INTO `city` VALUES ('263', 'ZA', '3800', 'Gingindlovu', '-29.0167', '31.5833');
INSERT INTO `city` VALUES ('264', 'ZA', '826', 'Giyani', '-23.3167', '30.7167');
INSERT INTO `city` VALUES ('265', 'ZA', '2930', 'Glencoe', '-28.1833', '30.15');
INSERT INTO `city` VALUES ('266', 'ZA', '10', 'Glenstantia', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('267', 'ZA', '5257', 'Gonubie', '-32.9333', '28.0167');
INSERT INTO `city` VALUES ('268', 'ZA', '7460', 'Goodwood', '-33.9', '18.55');
INSERT INTO `city` VALUES ('269', 'ZA', '7140', 'Gordon\'S Bay', '-34.1667', '18.8667');
INSERT INTO `city` VALUES ('270', 'ZA', '6280', 'Graaff-Reinet', '-32.25', '24.55');
INSERT INTO `city` VALUES ('271', 'ZA', '8121', 'Graafwater', '-32.15', '18.6');
INSERT INTO `city` VALUES ('272', 'ZA', '7160', 'Grabouw', '-34.15', '19.0167');
INSERT INTO `city` VALUES ('273', 'ZA', '5805', 'Grahamstad', '-33.3', '26.5333');
INSERT INTO `city` VALUES ('274', 'ZA', '5805', 'Grahamstown', '-33.3', '26.5333');
INSERT INTO `city` VALUES ('275', 'ZA', '1270', 'Graskop', '-24.9333', '30.8333');
INSERT INTO `city` VALUES ('276', 'ZA', '7805', 'Grassy Park', '-34.05', '18.4833');
INSERT INTO `city` VALUES ('277', 'ZA', '6525', 'Great Brak River', '-34.0333', '22.2167');
INSERT INTO `city` VALUES ('278', 'ZA', '3233', 'Greytown', '-29.4333', '30.5833');
INSERT INTO `city` VALUES ('279', 'ZA', '8365', 'Griquatown', '-28.85', '23.25');
INSERT INTO `city` VALUES ('280', 'ZA', '470', 'Groblersdal', '-25.15', '29.3833');
INSERT INTO `city` VALUES ('281', 'ZA', '8826', 'Groblershoop', '-28.8833', '21.9833');
INSERT INTO `city` VALUES ('282', 'ZA', '6525', 'Groot-Brakrivier', '-34.0333', '22.2167');
INSERT INTO `city` VALUES ('283', 'ZA', '8822', 'Grootdrink', '-26.4833', '22.2333');
INSERT INTO `city` VALUES ('284', 'ZA', '7750', 'Gugulethu', '-33.9833', '18.575');
INSERT INTO `city` VALUES ('285', 'ZA', '7750', 'Guguletu', '-33.9833', '18.5667');
INSERT INTO `city` VALUES ('286', 'ZA', '6351', 'Hackney', '-32.3167', '26.6333');
INSERT INTO `city` VALUES ('287', 'ZA', '1684', 'Halfway House', '-25.9833', '28.1167');
INSERT INTO `city` VALUES ('288', 'ZA', '4399', 'Hambanathi Heights', '-29.114', '30.6772');
INSERT INTO `city` VALUES ('289', 'ZA', '400', 'Hammanskraal', '-25.4075', '28.2856');
INSERT INTO `city` VALUES ('290', 'ZA', '3670', 'Hammarsdale', '-29.8', '30.65');
INSERT INTO `city` VALUES ('291', 'ZA', '6350', 'Hankey', '-33.8333', '24.8833');
INSERT INTO `city` VALUES ('292', 'ZA', '7005', 'Hanover', '-31.0667', '24.45');
INSERT INTO `city` VALUES ('293', 'ZA', '4643', 'Harding', '-30.5833', '29.8833');
INSERT INTO `city` VALUES ('294', 'ZA', '3372', 'Harrismith', '-28.2833', '29.1333');
INSERT INTO `city` VALUES ('295', 'ZA', '2600', 'Hartbeesfontein', '-26.7667', '26.4167');
INSERT INTO `city` VALUES ('296', 'ZA', '216', 'Hartbeespoort', '-25.7333', '27.85');
INSERT INTO `city` VALUES ('297', 'ZA', '6520', 'Hartenbos', '-34.1167', '22.1167');
INSERT INTO `city` VALUES ('298', 'ZA', '8570', 'Hartswater', '-27.7667', '24.8167');
INSERT INTO `city` VALUES ('299', 'ZA', '83', 'Hatfield', '-25.7467', '28.2231');
INSERT INTO `city` VALUES ('300', 'ZA', '1240', 'Hazyview', '-25.3167', '31.0167');
INSERT INTO `city` VALUES ('301', 'ZA', '7945', 'Heathfield', '-34.05', '18.4667');
INSERT INTO `city` VALUES ('302', 'ZA', '1439', 'Heidelberg', '-26.5', '28.35');
INSERT INTO `city` VALUES ('303', 'ZA', '6665', 'Heidelberg Wc', '-33.5333', '21.6833');
INSERT INTO `city` VALUES ('304', 'ZA', '9650', 'Heilbron', '-27.2833', '27.9667');
INSERT INTO `city` VALUES ('305', 'ZA', '1098', 'Hendrina', '-26.15', '29.7167');
INSERT INTO `city` VALUES ('306', 'ZA', '68', 'Hercules', '-25.7167', '28.1833');
INSERT INTO `city` VALUES ('307', 'ZA', '7200', 'Hermanus', '-34.4166', '19.2333');
INSERT INTO `city` VALUES ('308', 'ZA', '9756', 'Herschel', '-30.6167', '27.1667');
INSERT INTO `city` VALUES ('309', 'ZA', '9482', 'Hertzogville', '-28.1333', '25.5');
INSERT INTO `city` VALUES ('310', 'ZA', '4200', 'Hibberdene', '-30.3167', '30.6667');
INSERT INTO `city` VALUES ('311', 'ZA', '3305', 'Highflats', '-30.2667', '30.2');
INSERT INTO `city` VALUES ('312', 'ZA', '157', 'Highveld', '-25.8049', '28.2056');
INSERT INTO `city` VALUES ('313', 'ZA', '3610', 'Hillcrest', '-29.7667', '30.7667');
INSERT INTO `city` VALUES ('314', 'ZA', '3937', 'Hlabisa', '-28.1333', '31.8667');
INSERT INTO `city` VALUES ('315', 'ZA', '3145', 'Hlobane', '-27.7167', '31');
INSERT INTO `city` VALUES ('316', 'ZA', '3950', 'Hluhluwe', '-28.0333', '32.2833');
INSERT INTO `city` VALUES ('317', 'ZA', '1362', 'Hluvukani', '-24.65', '31.3333');
INSERT INTO `city` VALUES ('318', 'ZA', '9740', 'Hobhouse', '-29.5333', '27.15');
INSERT INTO `city` VALUES ('319', 'ZA', '1371', 'Hoedspruit', '-24.35', '30.9667');
INSERT INTO `city` VALUES ('320', 'ZA', '5930', 'Hofmeyr', '-31.65', '25.8');
INSERT INTO `city` VALUES ('321', 'ZA', '7355', 'Hopefield', '-33.0667', '18.35');
INSERT INTO `city` VALUES ('322', 'ZA', '8750', 'Hopetown', '-29.6167', '24.0833');
INSERT INTO `city` VALUES ('323', 'ZA', '8467', 'Hotazel', '-27.2', '22.9667');
INSERT INTO `city` VALUES ('324', 'ZA', '7806', 'Hout Bay', '-33.9166', '18.4166');
INSERT INTO `city` VALUES ('325', 'ZA', '7806', 'Houtbaai', '-33.9166', '18.4166');
INSERT INTO `city` VALUES ('326', 'ZA', '3224', 'Howick', '-29.4667', '30.2333');
INSERT INTO `city` VALUES ('327', 'ZA', '7627', 'Huguenot', '-31.0833', '26.6');
INSERT INTO `city` VALUES ('328', 'ZA', '6300', 'Humansdorp', '-34.0333', '24.7667');
INSERT INTO `city` VALUES ('329', 'ZA', '6017', 'Hunter\'S Retreat', '-33.9667', '25.5833');
INSERT INTO `city` VALUES ('330', 'ZA', '2070', 'Hurlingham View', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('331', 'ZA', '5000', 'Idutywa', '-32.1', '28.3');
INSERT INTO `city` VALUES ('332', 'ZA', '4185', 'Ifafa Beach', '-30.45', '30.65');
INSERT INTO `city` VALUES ('333', 'ZA', '4126', 'Illovo Beach', '-30.1167', '30.85');
INSERT INTO `city` VALUES ('334', 'ZA', '3227', 'Impendle', '-29.6', '29.8667');
INSERT INTO `city` VALUES ('335', 'ZA', '4032', 'Inanda', '-26.1167', '28.05');
INSERT INTO `city` VALUES ('336', 'ZA', '5445', 'Indwe', '-31.4667', '27.3333');
INSERT INTO `city` VALUES ('337', 'ZA', '3964', 'Ingwavuma', '-27.1333', '31.9833');
INSERT INTO `city` VALUES ('338', 'ZA', '4066', 'Isipingo', '-29.9667', '30.8833');
INSERT INTO `city` VALUES ('339', 'ZA', '4115', 'Isipingo Beach', '-29.9833', '30.95');
INSERT INTO `city` VALUES ('340', 'ZA', '2717', 'Itsoseng', '-26.0667', '25.8833');
INSERT INTO `city` VALUES ('341', 'ZA', '1689', 'Ivory Park', '-25.9911', '28.1718');
INSERT INTO `city` VALUES ('342', 'ZA', '4260', 'Izingolweni', '-30.7833', '30.1333');
INSERT INTO `city` VALUES ('343', 'ZA', '4109', 'Jacobs', '-29.9333', '30.9833');
INSERT INTO `city` VALUES ('344', 'ZA', '8710', 'Jacobsdal', '-25.6333', '26.0667');
INSERT INTO `city` VALUES ('345', 'ZA', '9974', 'Jagersfontein', '-29.7667', '25.4167');
INSERT INTO `city` VALUES ('346', 'ZA', '9742', 'Jamestown', '-31.1167', '26.8');
INSERT INTO `city` VALUES ('347', 'ZA', '8534', 'Jan Kempdorp', '-27.9167', '24.85');
INSERT INTO `city` VALUES ('348', 'ZA', '6265', 'Jansenville', '-32.9333', '24.6667');
INSERT INTO `city` VALUES ('349', 'ZA', '6330', 'Jeffreys Bay', '-33.9028', '24.8675');
INSERT INTO `city` VALUES ('350', 'ZA', '6332', 'Jeffreysbaai', '-34.05', '24.9167');
INSERT INTO `city` VALUES ('351', 'ZA', '2094', 'Jeppestown', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('352', 'ZA', '2000', 'Johannesburg', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('353', 'ZA', '6410', 'Joubertina', '-30.85', '26.6833');
INSERT INTO `city` VALUES ('354', 'ZA', '2574', 'Jouberton', '-26.9', '26.6');
INSERT INTO `city` VALUES ('355', 'ZA', '3982', 'Jozini', '-27.4333', '32.0667');
INSERT INTO `city` VALUES ('356', 'ZA', '2153', 'Jukskeipark', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('357', 'ZA', '748', 'Juno', '-23.95', '29.1333');
INSERT INTO `city` VALUES ('358', 'ZA', '7100', 'Kaapstad', '-33.9778', '18.6167');
INSERT INTO `city` VALUES ('359', 'ZA', '1247', 'Kabokweni', '-25.3917', '30.9917');
INSERT INTO `city` VALUES ('360', 'ZA', '9309', 'Kagisanong', '-29.1833', '26.2333');
INSERT INTO `city` VALUES ('361', 'ZA', '1739', 'Kagiso', '-26.1', '27.7667');
INSERT INTO `city` VALUES ('362', 'ZA', '8870', 'Kakamas', '-28.75', '20.6333');
INSERT INTO `city` VALUES ('363', 'ZA', '8252', 'Kamieskroon', '-30.2', '17.9333');
INSERT INTO `city` VALUES ('364', 'ZA', '1214', 'Kanyamazane', '-25.4333', '31.2');
INSERT INTO `city` VALUES ('365', 'ZA', '6400', 'Kareedouw', '-30.7833', '25.85');
INSERT INTO `city` VALUES ('366', 'ZA', '118', 'Karenpark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('367', 'ZA', '1421', 'Katlehong', '-26.3333', '28.15');
INSERT INTO `city` VALUES ('368', 'ZA', '1431', 'Katlehong Ext', '-26.3583', '28.2667');
INSERT INTO `city` VALUES ('369', 'ZA', '8860', 'Keimoes', '-28.7', '20.9667');
INSERT INTO `city` VALUES ('370', 'ZA', '5680', 'Keiskammahoek', '-32.6833', '27.15');
INSERT INTO `city` VALUES ('371', 'ZA', '1618', 'Kempton Park', '-26.1', '28.25');
INSERT INTO `city` VALUES ('372', 'ZA', '4980', 'Kentani', '-32.5167', '28.3167');
INSERT INTO `city` VALUES ('373', 'ZA', '6191', 'Kenton On Sea', '-33.7', '26.6833');
INSERT INTO `city` VALUES ('374', 'ZA', '7780', 'Kenwyn', '-33.9722', '18.4667');
INSERT INTO `city` VALUES ('375', 'ZA', '9860', 'Kestell', '-28.3167', '28.7');
INSERT INTO `city` VALUES ('376', 'ZA', '7750', 'Khayalitsha', '-33.9833', '18.575');
INSERT INTO `city` VALUES ('377', 'ZA', '7784', 'Khayelitsha', '-33.9167', '18.4167');
INSERT INTO `city` VALUES ('378', 'ZA', '8300', 'Kimberley', '-28.7333', '24.7667');
INSERT INTO `city` VALUES ('379', 'ZA', '5601', 'King Williams Town', '-32.8833', '27.4');
INSERT INTO `city` VALUES ('380', 'ZA', '4931', 'King William\'S Town', '-32.8833', '27.4');
INSERT INTO `city` VALUES ('381', 'ZA', '6120', 'Kirkwood', '-33.4156', '25.4436');
INSERT INTO `city` VALUES ('382', 'ZA', '8145', 'Klawer', '-31.7833', '18.6167');
INSERT INTO `city` VALUES ('383', 'ZA', '7141', 'Kleinmond', '-34.35', '19.0333');
INSERT INTO `city` VALUES ('384', 'ZA', '8249', 'Kleinsee', '-29.6667', '17.0833');
INSERT INTO `city` VALUES ('385', 'ZA', '2571', 'Klerksdorp', '-26.8667', '26.6667');
INSERT INTO `city` VALUES ('386', 'ZA', '2574', 'Klerkskdorp', '-26.8833', '26.6333');
INSERT INTO `city` VALUES ('387', 'ZA', '6255', 'Klipplaat', '-33.0211', '24.3369');
INSERT INTO `city` VALUES ('388', 'ZA', '3610', 'Kloof', '-29.7833', '30.8333');
INSERT INTO `city` VALUES ('389', 'ZA', '6570', 'Knysna', '-34.034', '23.0343');
INSERT INTO `city` VALUES ('390', 'ZA', '1759', 'Kocksvlei', '-26.1111', '27.7722');
INSERT INTO `city` VALUES ('391', 'ZA', '9986', 'Koffiefontein', '-29.4', '25.0167');
INSERT INTO `city` VALUES ('392', 'ZA', '2515', 'Kokosi', '-26.5', '27.4667');
INSERT INTO `city` VALUES ('393', 'ZA', '3237', 'Kokstad', '-30.55', '29.4167');
INSERT INTO `city` VALUES ('394', 'ZA', '709', 'Koloti', '-23.7167', '29.3167');
INSERT INTO `city` VALUES ('395', 'ZA', '1341', 'Komatipoort', '-25.4333', '31.9333');
INSERT INTO `city` VALUES ('396', 'ZA', '4950', 'Komga', '-32.5833', '27.9');
INSERT INTO `city` VALUES ('397', 'ZA', '9540', 'Koppies', '-27.2333', '27.5833');
INSERT INTO `city` VALUES ('398', 'ZA', '348', 'Koster', '-25.8667', '26.9');
INSERT INTO `city` VALUES ('399', 'ZA', '8245', 'Kotzeshoop', '-28.7167', '17.5833');
INSERT INTO `city` VALUES ('400', 'ZA', '7570', 'Kraaifontein', '-33.8481', '18.7172');
INSERT INTO `city` VALUES ('401', 'ZA', '7572', 'Kraaifontein North', '-28.4278', '26.8278');
INSERT INTO `city` VALUES ('402', 'ZA', '1946', 'Kragbron', '-26.9', '27.8833');
INSERT INTO `city` VALUES ('403', 'ZA', '3268', 'Kranskop', '-30.5667', '26.9');
INSERT INTO `city` VALUES ('404', 'ZA', '2231', 'Kriel', '-26.2667', '29.2333');
INSERT INTO `city` VALUES ('405', 'ZA', '76', 'Kromdraai', '-25.4833', '28.2667');
INSERT INTO `city` VALUES ('406', 'ZA', '9499', 'Kroonstad', '-27.65', '27.2333');
INSERT INTO `city` VALUES ('407', 'ZA', '1718', 'Krugersdorp', '-26.1', '27.7667');
INSERT INTO `city` VALUES ('408', 'ZA', '7580', 'Kuils River', '-33.9333', '18.6667');
INSERT INTO `city` VALUES ('409', 'ZA', '7580', 'Kuilsriver', '-31.3333', '21.7667');
INSERT INTO `city` VALUES ('410', 'ZA', '7579', 'Kuilsrivier', '-25.15', '29.15');
INSERT INTO `city` VALUES ('411', 'ZA', '8460', 'Kuruman', '-27.45', '23.4333');
INSERT INTO `city` VALUES ('412', 'ZA', '3886', 'Kwadlangezwa', '-28.7767', '31.9');
INSERT INTO `city` VALUES ('413', 'ZA', '1073', 'Kwaguqa', '-25.8667', '29.2333');
INSERT INTO `city` VALUES ('414', 'ZA', '1347', 'Kwalugedlane', '-25.7333', '31.8167');
INSERT INTO `city` VALUES ('415', 'ZA', '4359', 'Kwamashu', '-29.75', '30.9833');
INSERT INTO `city` VALUES ('416', 'ZA', '4032', 'Kwa-Mashu', '-29.85', '31.0167');
INSERT INTO `city` VALUES ('417', 'ZA', '3915', 'Kwambonambi', '-28.6', '32.0833');
INSERT INTO `city` VALUES ('418', 'ZA', '1022', 'Kwamhlanga', '-25.4283', '28.7083');
INSERT INTO `city` VALUES ('419', 'ZA', '3978', 'Kwangkwanase', '-27.5278', '32.0333');
INSERT INTO `city` VALUES ('420', 'ZA', '6242', 'Kwanobuhle', '-33.8025', '25.3925');
INSERT INTO `city` VALUES ('421', 'ZA', '6506', 'Kwanonqaba', '-34.1833', '22.1333');
INSERT INTO `city` VALUES ('422', 'ZA', '1575', 'Kwathema', '-26.3', '28.4');
INSERT INTO `city` VALUES ('423', 'ZA', '1866', 'Kwaxuma', '-25.4333', '28.2889');
INSERT INTO `city` VALUES ('424', 'ZA', '6205', 'Kwazakhele', '-33.8667', '25.5833');
INSERT INTO `city` VALUES ('425', 'ZA', '1098', 'Kwazamokuhle', '-26.15', '29.7167');
INSERT INTO `city` VALUES ('426', 'ZA', '4032', 'Kwazimele', '-29.85', '31.0167');
INSERT INTO `city` VALUES ('427', 'ZA', '3250', 'Kwazulu/Natal', '-29.0667', '30.5833');
INSERT INTO `city` VALUES ('428', 'ZA', '1434', 'Kwenzekile', '-26.3583', '28.2667');
INSERT INTO `city` VALUES ('429', 'ZA', '6655', 'Ladismith', '-33.4833', '21.2667');
INSERT INTO `city` VALUES ('430', 'ZA', '5341', 'Lady Frere', '-31.7', '27.2333');
INSERT INTO `city` VALUES ('431', 'ZA', '9755', 'Lady Grey', '-30.7', '27.2333');
INSERT INTO `city` VALUES ('432', 'ZA', '9745', 'Ladybrand', '-29.2', '27.45');
INSERT INTO `city` VALUES ('433', 'ZA', '2900', 'Ladysmith', '-28.55', '29.7833');
INSERT INTO `city` VALUES ('434', 'ZA', '6901', 'Laingsburg', '-33.2', '20.85');
INSERT INTO `city` VALUES ('435', 'ZA', '7945', 'Lakeside', '-34.0833', '18.45');
INSERT INTO `city` VALUES ('436', 'ZA', '8130', 'Lambertsbaai', '-32.1', '18.3');
INSERT INTO `city` VALUES ('437', 'ZA', '4027', 'Lamontville', '-29.95', '30.9333');
INSERT INTO `city` VALUES ('438', 'ZA', '7780', 'Landsdowne', '-33.9722', '18.4667');
INSERT INTO `city` VALUES ('439', 'ZA', '7455', 'Langa', '-33.9333', '18.5167');
INSERT INTO `city` VALUES ('440', 'ZA', '7357', 'Langebaan', '-33.1', '18.0333');
INSERT INTO `city` VALUES ('441', 'ZA', '7700', 'Lansdowne', '-32.9389', '19.6667');
INSERT INTO `city` VALUES ('442', 'ZA', '37', 'Laudium', '-25.7833', '28.1');
INSERT INTO `city` VALUES ('443', 'ZA', '7945', 'Lavender Hill', '-34.0667', '18.4833');
INSERT INTO `city` VALUES ('444', 'ZA', '7490', 'Lavistown', '-33.9222', '18.5222');
INSERT INTO `city` VALUES ('445', 'ZA', '2640', 'Leeudoringstad', '-27.2333', '26.2333');
INSERT INTO `city` VALUES ('446', 'ZA', '486', 'Leeupoort', '-24.9', '27.7167');
INSERT INTO `city` VALUES ('447', 'ZA', '1809', 'Lenasia', '-26.2667', '27.8833');
INSERT INTO `city` VALUES ('448', 'ZA', '9503', 'Lengau', '-27.65', '27.2333');
INSERT INTO `city` VALUES ('449', 'ZA', '2868', 'Lerato', '-25.45', '25.8667');
INSERT INTO `city` VALUES ('450', 'ZA', '2265', 'Leslie', '-26.3667', '28.9167');
INSERT INTO `city` VALUES ('451', 'ZA', '870', 'Letaba', '-23.9', '30.0667');
INSERT INTO `city` VALUES ('452', 'ZA', '264', 'Letlhabile', '-25.6333', '27.7833');
INSERT INTO `city` VALUES ('453', 'ZA', '771', 'Letsitele', '-23.8833', '30.4');
INSERT INTO `city` VALUES ('454', 'ZA', '5160', 'Libode', '-31.5333', '29.0167');
INSERT INTO `city` VALUES ('455', 'ZA', '2730', 'Lichtenburg', '-26.15', '26.1667');
INSERT INTO `city` VALUES ('456', 'ZA', '9630', 'Lindley', '-27.8667', '27.9167');
INSERT INTO `city` VALUES ('457', 'ZA', '3610', 'Link Hills', '-29.8139', '30.8389');
INSERT INTO `city` VALUES ('458', 'ZA', '6025', 'Linton Grange', '-33.94', '25.56');
INSERT INTO `city` VALUES ('459', 'ZA', '8185', 'Loeriesfontein', '-30.9667', '19.45');
INSERT INTO `city` VALUES ('460', 'ZA', '710', 'Lonsdale', '-23.6', '29.1667');
INSERT INTO `city` VALUES ('461', 'ZA', '901', 'Louis Trichardt', '-23.05', '29.9');
INSERT INTO `city` VALUES ('462', 'ZA', '9982', 'Luckhoff', '-29.75', '24.7833');
INSERT INTO `city` VALUES ('463', 'ZA', '4820', 'Lusikisiki', '-31.35', '29.5833');
INSERT INTO `city` VALUES ('464', 'ZA', '8149', 'Lutzville', '-31.55', '18.35');
INSERT INTO `city` VALUES ('465', 'ZA', '1120', 'Lydenburg', '-25.1', '30.45');
INSERT INTO `city` VALUES ('466', 'ZA', '186', 'Lynn East', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('467', 'ZA', '51', 'Lyttelton', '-25.8333', '28.2167');
INSERT INTO `city` VALUES ('468', 'ZA', '190', 'Mabopane', '-25.5072', '28.1075');
INSERT INTO `city` VALUES ('469', 'ZA', '7130', 'Macassar', '-34.0667', '18.7667');
INSERT INTO `city` VALUES ('470', 'ZA', '5480', 'Maclear', '-31.0833', '28.3667');
INSERT INTO `city` VALUES ('471', 'ZA', '2951', 'Madadeni', '-27.75', '30.0333');
INSERT INTO `city` VALUES ('472', 'ZA', '2773', 'Madibogo', '-26.4167', '25.2');
INSERT INTO `city` VALUES ('473', 'ZA', '2736', 'Madikwe', '-25.35', '26.5333');
INSERT INTO `city` VALUES ('474', 'ZA', '1907', 'Mafatsana', '-26.5833', '27.8333');
INSERT INTO `city` VALUES ('475', 'ZA', '357', 'Mafikeng', '-25.8667', '25.65');
INSERT INTO `city` VALUES ('476', 'ZA', '4751', 'Magadla', '-30.6', '27.3167');
INSERT INTO `city` VALUES ('477', 'ZA', '2067', 'Magalies View', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('478', 'ZA', '150', 'Magalieskruin', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('479', 'ZA', '2067', 'Magaliessig', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('480', 'ZA', '8575', 'Magogong', '-27.6667', '24.8333');
INSERT INTO `city` VALUES ('481', 'ZA', '3856', 'Mahlabatini', '-28.25', '31.4333');
INSERT INTO `city` VALUES ('482', 'ZA', '626', 'Mahwelereng', '-24.15', '28.9833');
INSERT INTO `city` VALUES ('483', 'ZA', '4380', 'Maidstone', '-29.5667', '31.1333');
INSERT INTO `city` VALUES ('484', 'ZA', '7405', 'Maitland', '-33.9083', '18.45');
INSERT INTO `city` VALUES ('485', 'ZA', '2650', 'Makwassie', '-27.3167', '25.9833');
INSERT INTO `city` VALUES ('486', 'ZA', '816', 'Malamulele', '-23.5444', '29.9389');
INSERT INTO `city` VALUES ('487', 'ZA', '1331', 'Malelane', '-25.4833', '31.5167');
INSERT INTO `city` VALUES ('488', 'ZA', '7300', 'Malmesbury', '-33.45', '18.7333');
INSERT INTO `city` VALUES ('489', 'ZA', '4740', 'Maluti', '-30.25', '28.5333');
INSERT INTO `city` VALUES ('490', 'ZA', '4146', 'Malvern', '-26.2', '28.1');
INSERT INTO `city` VALUES ('491', 'ZA', '112', 'Mamelodi', '-25.7072', '28.3472');
INSERT INTO `city` VALUES ('492', 'ZA', '4276', 'Manaba Beach', '-30.85', '30.3667');
INSERT INTO `city` VALUES ('493', 'ZA', '8423', 'Mancorp Mine', '-28.3', '23.0167');
INSERT INTO `city` VALUES ('494', 'ZA', '3802', 'Mandeni', '-29.0167', '31.5833');
INSERT INTO `city` VALUES ('495', 'ZA', '7764', 'Manenberg', '-33.9833', '18.55');
INSERT INTO `city` VALUES ('496', 'ZA', '9307', 'Mangaung', '-29.1333', '26.2');
INSERT INTO `city` VALUES ('497', 'ZA', '8345', 'Mankurwane', '-28.55', '25.2333');
INSERT INTO `city` VALUES ('498', 'ZA', '753', 'Manyama', '-23.6774', '29.4869');
INSERT INTO `city` VALUES ('499', 'ZA', '4470', 'Mapumulo', '-29.15', '31.0667');
INSERT INTO `city` VALUES ('500', 'ZA', '449', 'Marble Hall', '-24.9667', '29.3');
INSERT INTO `city` VALUES ('501', 'ZA', '4035', 'Marble Ray', '-29.85', '31.0167');
INSERT INTO `city` VALUES ('502', 'ZA', '4275', 'Margate', '-30.85', '30.3667');
INSERT INTO `city` VALUES ('503', 'ZA', '4092', 'Marianhill', '-29.9', '30.9833');
INSERT INTO `city` VALUES ('504', 'ZA', '284', 'Marikana', '-25.613', '27.8843');
INSERT INTO `city` VALUES ('505', 'ZA', '2063', 'Marlboro', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('506', 'ZA', '9610', 'Marquard', '-28.6667', '27.4333');
INSERT INTO `city` VALUES ('507', 'ZA', '2111', 'Marshalltown', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('508', 'ZA', '743', 'Mashashane', '-23.95', '29.1333');
INSERT INTO `city` VALUES ('509', 'ZA', '1908', 'Masoheng', '-26.7', '27.8167');
INSERT INTO `city` VALUES ('510', 'ZA', '4730', 'Matatiele', '-30.3333', '28.8');
INSERT INTO `city` VALUES ('511', 'ZA', '7465', 'Matroosfontein', '-33.9333', '18.5833');
INSERT INTO `city` VALUES ('512', 'ZA', '4082', 'Mayville', '-29.85', '30.9833');
INSERT INTO `city` VALUES ('513', 'ZA', '3974', 'Mbazwana', '-27.6167', '32.0333');
INSERT INTO `city` VALUES ('514', 'ZA', '7655', 'Mbekweni', '-33.6833', '18.9833');
INSERT INTO `city` VALUES ('515', 'ZA', '449', 'Mbibane', '-25.365', '28.2189');
INSERT INTO `city` VALUES ('516', 'ZA', '5221', 'Mdantsane', '-32.95', '27.7667');
INSERT INTO `city` VALUES ('517', 'ZA', '1801', 'Meadowlands', '-26.2', '27.8833');
INSERT INTO `city` VALUES ('518', 'ZA', '190', 'Medunsa', '-25.6189', '28.0228');
INSERT INTO `city` VALUES ('519', 'ZA', '4246', 'Mehlomnyama', '-30.7571', '30.4452');
INSERT INTO `city` VALUES ('520', 'ZA', '7440', 'Melkbosstrand', '-33.7306', '18.4361');
INSERT INTO `city` VALUES ('521', 'ZA', '3835', 'Melmoth', '-28.5833', '31.3833');
INSERT INTO `city` VALUES ('522', 'ZA', '40', 'Menlo Park', '-25.7711', '28.3078');
INSERT INTO `city` VALUES ('523', 'ZA', '9483', 'Merafong', '-28.0778', '26.3778');
INSERT INTO `city` VALUES ('524', 'ZA', '3290', 'Merrivale', '-29.5167', '30.2333');
INSERT INTO `city` VALUES ('525', 'ZA', '900', 'Messina', '-22.35', '30.05');
INSERT INTO `city` VALUES ('526', 'ZA', '1871', 'Meyerton', '-26.5667', '28.0167');
INSERT INTO `city` VALUES ('527', 'ZA', '3750', 'Mid Illovo', '-29.9667', '30.5167');
INSERT INTO `city` VALUES ('528', 'ZA', '1050', 'Middelburg', '-30.05', '26.6167');
INSERT INTO `city` VALUES ('529', 'ZA', '1050', 'Middleburg', '-30.05', '26.6167');
INSERT INTO `city` VALUES ('530', 'ZA', '5686', 'Middledrift', '-32.8167', '26.9833');
INSERT INTO `city` VALUES ('531', 'ZA', '7435', 'Milnerton', '-33.9166', '18.4166');
INSERT INTO `city` VALUES ('532', 'ZA', '1541', 'Minnebron', '-26.2333', '28.3667');
INSERT INTO `city` VALUES ('533', 'ZA', '7784', 'Mitchells Plain', '-33.9167', '18.4167');
INSERT INTO `city` VALUES ('534', 'ZA', '7785', 'Mitchells Plein', '-33.9611', '18.4833');
INSERT INTO `city` VALUES ('535', 'ZA', '7785', 'Mitchellsplain', '-33.9611', '18.4833');
INSERT INTO `city` VALUES ('536', 'ZA', '7785', 'Mithchells Plain', '-33.9611', '18.4833');
INSERT INTO `city` VALUES ('537', 'ZA', '1246', 'Mkhuhlu', '-25.3917', '30.9917');
INSERT INTO `city` VALUES ('538', 'ZA', '3965', 'Mkuze', '-27.6167', '32.0333');
INSERT INTO `city` VALUES ('539', 'ZA', '2777', 'Mmabatho', '-25.85', '25.6333');
INSERT INTO `city` VALUES ('540', 'ZA', '4050', 'Mobeni', '-29.95', '30.95');
INSERT INTO `city` VALUES ('541', 'ZA', '1609', 'Modderfontein', '-26.0833', '28.1667');
INSERT INTO `city` VALUES ('542', 'ZA', '195', 'Mogwase', '-25.2667', '27.2333');
INSERT INTO `city` VALUES ('543', 'ZA', '1759', 'Mohlakeng', '-26.2333', '27.7');
INSERT INTO `city` VALUES ('544', 'ZA', '633', 'Mokamole', '-24.1833', '29.0167');
INSERT INTO `city` VALUES ('545', 'ZA', '9869', 'Mokodumela', '-28.5333', '28.8');
INSERT INTO `city` VALUES ('546', 'ZA', '827', 'Molototsi', '-23.3167', '30.7167');
INSERT INTO `city` VALUES ('547', 'ZA', '5500', 'Molteno', '-31.4', '26.3667');
INSERT INTO `city` VALUES ('548', 'ZA', '6720', 'Montagu', '-33.7833', '20.1167');
INSERT INTO `city` VALUES ('549', 'ZA', '159', 'Montanapark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('550', 'ZA', '7460', 'Monte Vista', '-33.8833', '18.5667');
INSERT INTO `city` VALUES ('551', 'ZA', '3300', 'Mooi River', '-29.2', '29.9833');
INSERT INTO `city` VALUES ('552', 'ZA', '7310', 'Moorreesburg', '-33.15', '18.6667');
INSERT INTO `city` VALUES ('553', 'ZA', '84', 'Moot', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('554', 'ZA', '44', 'Moreletapark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('555', 'ZA', '6501', 'Mossel Bay', '-34.1833', '22.1333');
INSERT INTO `city` VALUES ('556', 'ZA', '6503', 'Mosselbaai', '-34.1833', '22.1333');
INSERT INTO `city` VALUES ('557', 'ZA', '6506', 'Mosselbay', '-34.1833', '22.1333');
INSERT INTO `city` VALUES ('558', 'ZA', '6211', 'Motherwell', '-33.9667', '25.5833');
INSERT INTO `city` VALUES ('559', 'ZA', '8477', 'Mothibistad', '-27.05', '24.4733');
INSERT INTO `city` VALUES ('560', 'ZA', '9487', 'Motsethabang', '-28.0778', '26.3778');
INSERT INTO `city` VALUES ('561', 'ZA', '9463', 'Motsethabong', '-27.9833', '26.7333');
INSERT INTO `city` VALUES ('562', 'ZA', '4735', 'Mount Ayliff', '-30.8', '29.3667');
INSERT INTO `city` VALUES ('563', 'ZA', '4068', 'Mount Edgecombe', '-29.7', '31.0333');
INSERT INTO `city` VALUES ('564', 'ZA', '4770', 'Mount Fletcher', '-30.6833', '28.5167');
INSERT INTO `city` VALUES ('565', 'ZA', '5086', 'Mount Frere', '-30.9167', '28.9833');
INSERT INTO `city` VALUES ('566', 'ZA', '7700', 'Mowbray', '-33.9333', '18.4667');
INSERT INTO `city` VALUES ('567', 'ZA', '736', 'Mphahlele', '-23.9667', '29.7');
INSERT INTO `city` VALUES ('568', 'ZA', '412', 'Mphe-Batho', '-25.343', '28.2204');
INSERT INTO `city` VALUES ('569', 'ZA', '732', 'Mphogodiba', '-23.9667', '29.7');
INSERT INTO `city` VALUES ('570', 'ZA', '1078', 'Mpudulle', '-25.0167', '29.7333');
INSERT INTO `city` VALUES ('571', 'ZA', '1050', 'Mpumalanga', '-30.05', '26.6167');
INSERT INTO `city` VALUES ('572', 'ZA', '5079', 'Mqanduli', '-31.8167', '28.75');
INSERT INTO `city` VALUES ('573', 'ZA', '4961', 'Msobomvu', '-32.3333', '28.15');
INSERT INTO `city` VALUES ('574', 'ZA', '3925', 'Mtubatuba', '-28.4167', '32.1833');
INSERT INTO `city` VALUES ('575', 'ZA', '3867', 'Mtunzini', '-28.95', '31.75');
INSERT INTO `city` VALUES ('576', 'ZA', '7945', 'Muizenberg', '-34.1167', '18.4667');
INSERT INTO `city` VALUES ('577', 'ZA', '1739', 'Muldersdrif', '-26.1', '27.7667');
INSERT INTO `city` VALUES ('578', 'ZA', '992', 'Mungomani', '-22.95', '30.4667');
INSERT INTO `city` VALUES ('579', 'ZA', '4278', 'Munster', '-30.9833', '30.2333');
INSERT INTO `city` VALUES ('580', 'ZA', '948', 'Munzhedzi', '-23.05', '29.9');
INSERT INTO `city` VALUES ('581', 'ZA', '956', 'Mutale', '-22.4833', '30.9167');
INSERT INTO `city` VALUES ('582', 'ZA', '976', 'Muthathi', '-22.95', '30.4667');
INSERT INTO `city` VALUES ('583', 'ZA', '413', 'Mutlestad', '-25.343', '28.2204');
INSERT INTO `city` VALUES ('584', 'ZA', '560', 'Naboomspruit', '-24.5167', '28.7167');
INSERT INTO `city` VALUES ('585', 'ZA', '3604', 'Nagina', '-29.8167', '30.85');
INSERT INTO `city` VALUES ('586', 'ZA', '5241', 'Nahoon', '-33.0333', '27.9167');
INSERT INTO `city` VALUES ('587', 'ZA', '1861', 'Naledi', '-23.8333', '29.0833');
INSERT INTO `city` VALUES ('588', 'ZA', '1397', 'Namakgale', '-23.95', '31.0333');
INSERT INTO `city` VALUES ('589', 'ZA', '1052', 'Nasaret', '-26.2333', '28.8');
INSERT INTO `city` VALUES ('590', 'ZA', '4964', 'Ndabakazi', '-32.3333', '28.15');
INSERT INTO `city` VALUES ('591', 'ZA', '4242', 'Ndwedwe', '-30.75', '30.45');
INSERT INTO `city` VALUES ('592', 'ZA', '714', 'Neandertal', '-23.4833', '29.1833');
INSERT INTO `city` VALUES ('593', 'ZA', '1057', 'Nebo', '-24.9', '29.7667');
INSERT INTO `city` VALUES ('594', 'ZA', '7628', 'Nederburg', '-33.2033', '20.4933');
INSERT INTO `city` VALUES ('595', 'ZA', '1132', 'Nelspruit', '-25.4667', '30.9667');
INSERT INTO `city` VALUES ('596', 'ZA', '6200', 'New Brighton', '-33.9', '25.6');
INSERT INTO `city` VALUES ('597', 'ZA', '3610', 'New Germany', '-29.8', '30.8833');
INSERT INTO `city` VALUES ('598', 'ZA', '2940', 'Newcastle', '-27.75', '29.9333');
INSERT INTO `city` VALUES ('599', 'ZA', '7700', 'Newlands', '-33.9785', '18.4481');
INSERT INTO `city` VALUES ('600', 'ZA', '6045', 'Newton Park', '-33.95', '25.5667');
INSERT INTO `city` VALUES ('601', 'ZA', '5140', 'Ngqeleni', '-31.6667', '29.0333');
INSERT INTO `city` VALUES ('602', 'ZA', '8930', 'Niekerkshoop', '-29.3167', '22.8333');
INSERT INTO `city` VALUES ('603', 'ZA', '1490', 'Nigel', '-26.4167', '28.4667');
INSERT INTO `city` VALUES ('604', 'ZA', '156', 'Ninapark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('605', 'ZA', '3855', 'Nkandla', '-28.6167', '31.0833');
INSERT INTO `city` VALUES ('606', 'ZA', '616', 'Nkwe', '-23.4', '28.75');
INSERT INTO `city` VALUES ('607', 'ZA', '3836', 'Nongoma', '-27.9', '31.65');
INSERT INTO `city` VALUES ('608', 'ZA', '1687', 'Noordwyk', '-25.9833', '28.1167');
INSERT INTO `city` VALUES ('609', 'ZA', '2162', 'North Riding', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('610', 'ZA', '4093', 'Northdene', '-29.8333', '30.9333');
INSERT INTO `city` VALUES ('611', 'ZA', '7090', 'Northern Cape', '-31.2889', '23.5611');
INSERT INTO `city` VALUES ('612', 'ZA', '480', 'Northern Provice', '-24.8833', '28.2833');
INSERT INTO `city` VALUES ('613', 'ZA', '2155', 'Northwold', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('614', 'ZA', '5950', 'Noupoort', '-31.1874', '24.9499');
INSERT INTO `city` VALUES ('615', 'ZA', '4682', 'Nqabeni', '-30.7333', '30.0333');
INSERT INTO `city` VALUES ('616', 'ZA', '4990', 'Nqamakwe', '-32.2333', '28.0667');
INSERT INTO `city` VALUES ('617', 'ZA', '3005', 'Nqutu', '-28.2', '30.6667');
INSERT INTO `city` VALUES ('618', 'ZA', '4066', 'Ntokozweni', '-29.9667', '30.8833');
INSERT INTO `city` VALUES ('619', 'ZA', '2355', 'Nucam', '-26.5333', '29.9833');
INSERT INTO `city` VALUES ('620', 'ZA', '7708', 'Nuweland', '-33.9667', '18.4833');
INSERT INTO `city` VALUES ('621', 'ZA', '7750', 'Nyanga', '-33.9833', '18.5833');
INSERT INTO `city` VALUES ('622', 'ZA', '433', 'Nylstroom', '-24.7', '28.4');
INSERT INTO `city` VALUES ('623', 'ZA', '9476', 'Odendaalsrus', '-27.8667', '26.6833');
INSERT INTO `city` VALUES ('624', 'ZA', '1830', 'Odin Park', '-26.3167', '27.8333');
INSERT INTO `city` VALUES ('625', 'ZA', '2232', 'Ogies', '-26.05', '29.0667');
INSERT INTO `city` VALUES ('626', 'ZA', '8271', 'Okiep', '-29.6', '17.9');
INSERT INTO `city` VALUES ('627', 'ZA', '1666', 'Olifantsfontein', '-25.9639', '28.2394');
INSERT INTO `city` VALUES ('628', 'ZA', '8450', 'Olifantshoek', '-27.9333', '22.7333');
INSERT INTO `city` VALUES ('629', 'ZA', '7201', 'Onrus River', '-34.4167', '19.2333');
INSERT INTO `city` VALUES ('630', 'ZA', '5201', 'Oos-Londen', '-33.0333', '27.9167');
INSERT INTO `city` VALUES ('631', 'ZA', '1805', 'Orange Farm', '-26.2474', '27.8987');
INSERT INTO `city` VALUES ('632', 'ZA', '2192', 'Orange Grove', '-26.1667', '28.0833');
INSERT INTO `city` VALUES ('633', 'ZA', '1995', 'Oranjeville', '-26.9833', '28.2');
INSERT INTO `city` VALUES ('634', 'ZA', '2619', 'Orkney', '-26.9833', '26.6667');
INSERT INTO `city` VALUES ('635', 'ZA', '1804', 'Orlando', '-26.25', '27.9167');
INSERT INTO `city` VALUES ('636', 'ZA', '2952', 'Osizweni', '-27.7833', '30.15');
INSERT INTO `city` VALUES ('637', 'ZA', '7750', 'Ottery', '-33.9833', '18.575');
INSERT INTO `city` VALUES ('638', 'ZA', '2610', 'Ottosdal', '-26.8167', '26.0167');
INSERT INTO `city` VALUES ('639', 'ZA', '6625', 'Oudshoorn', '-33.5833', '22.2');
INSERT INTO `city` VALUES ('640', 'ZA', '6623', 'Oudtshoorn', '-33.5833', '22.2');
INSERT INTO `city` VALUES ('641', 'ZA', '3242', 'Ozwatini', '-29.4', '30.85');
INSERT INTO `city` VALUES ('642', 'ZA', '7405', 'Paarden Island', '-33.9083', '18.45');
INSERT INTO `city` VALUES ('643', 'ZA', '7622', 'Paarl', '-33.7333', '18.9667');
INSERT INTO `city` VALUES ('644', 'ZA', '6529', 'Pacaltsdorp', '-34.0167', '22.45');
INSERT INTO `city` VALUES ('645', 'ZA', '1914', 'Palm Springs', '-26.6972', '27.8278');
INSERT INTO `city` VALUES ('646', 'ZA', '7500', 'Parow', '-33.9', '18.6');
INSERT INTO `city` VALUES ('647', 'ZA', '9585', 'Parys', '-26.9', '27.45');
INSERT INTO `city` VALUES ('648', 'ZA', '6335', 'Patensie', '-33.7556', '24.8183');
INSERT INTO `city` VALUES ('649', 'ZA', '6130', 'Paterson', '-33.45', '25.9667');
INSERT INTO `city` VALUES ('650', 'ZA', '9800', 'Paul Roux', '-28.3', '27.95');
INSERT INTO `city` VALUES ('651', 'ZA', '3180', 'Paulpietersburg', '-27.4167', '30.8167');
INSERT INTO `city` VALUES ('652', 'ZA', '2056', 'Paulshof', '-26.05', '28.0333');
INSERT INTO `city` VALUES ('653', 'ZA', '5860', 'Pearston', '-32.5833', '25.1333');
INSERT INTO `city` VALUES ('654', 'ZA', '5612', 'Peddie', '-33.2', '27.1167');
INSERT INTO `city` VALUES ('655', 'ZA', '5209', 'Pefferville', '-33.0333', '27.9167');
INSERT INTO `city` VALUES ('656', 'ZA', '1154', 'Penge', '-24.3667', '30.3');
INSERT INTO `city` VALUES ('657', 'ZA', '4184', 'Pennington', '-30.2833', '30.75');
INSERT INTO `city` VALUES ('658', 'ZA', '8309', 'Pescodia', '-28.7333', '24.7667');
INSERT INTO `city` VALUES ('659', 'ZA', '1501', 'Petit', '-26.1', '28.3833');
INSERT INTO `city` VALUES ('660', 'ZA', '9640', 'Petrus Steyn', '-27.65', '28.1333');
INSERT INTO `city` VALUES ('661', 'ZA', '9932', 'Petrusburg', '-29.1167', '25.4167');
INSERT INTO `city` VALUES ('662', 'ZA', '8770', 'Petrusville', '-30.0833', '24.65');
INSERT INTO `city` VALUES ('663', 'ZA', '1390', 'Phalaborwa', '-23.95', '31.1167');
INSERT INTO `city` VALUES ('664', 'ZA', '29', 'Philip Nel Park', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('665', 'ZA', '9970', 'Philippolis', '-30.2667', '25.2833');
INSERT INTO `city` VALUES ('666', 'ZA', '8795', 'Philipstown', '-30.4333', '24.4667');
INSERT INTO `city` VALUES ('667', 'ZA', '4068', 'Phoenix', '-29.775', '31.025');
INSERT INTO `city` VALUES ('668', 'ZA', '9866', 'Phuthaditjhaba', '-28.5333', '28.8167');
INSERT INTO `city` VALUES ('669', 'ZA', '2380', 'Piet Retief', '-27', '30.8');
INSERT INTO `city` VALUES ('670', 'ZA', '3200', 'Pietermaritzburg', '-29.6167', '30.3833');
INSERT INTO `city` VALUES ('671', 'ZA', '632', 'Pietersburg', '-24.1833', '29.0167');
INSERT INTO `city` VALUES ('672', 'ZA', '7320', 'Piketberg', '-32.9', '18.7667');
INSERT INTO `city` VALUES ('673', 'ZA', '1808', 'Pimville', '-26.2667', '27.9');
INSERT INTO `city` VALUES ('674', 'ZA', '7450', 'Pinelands', '-33.9167', '18.5');
INSERT INTO `city` VALUES ('675', 'ZA', '3600', 'Pinetown', '-29.8167', '30.85');
INSERT INTO `city` VALUES ('676', 'ZA', '6600', 'Plettenberg Bay', '-34.0455', '23.3727');
INSERT INTO `city` VALUES ('677', 'ZA', '6600', 'Plettenbergbaai', '-34.0455', '23.3727');
INSERT INTO `city` VALUES ('678', 'ZA', '7800', 'Plumstead', '-34.0167', '18.4667');
INSERT INTO `city` VALUES ('679', 'ZA', '386', 'Podiphatshwa', '-24.6', '27.4');
INSERT INTO `city` VALUES ('680', 'ZA', '8892', 'Pofadder', '-29.1333', '19.3833');
INSERT INTO `city` VALUES ('681', 'ZA', '3011', 'Pomeroy', '-28.55', '30.4167');
INSERT INTO `city` VALUES ('682', 'ZA', '8611', 'Pomfret', '-26.95', '24.7333');
INSERT INTO `city` VALUES ('683', 'ZA', '3160', 'Pongola', '-27.3833', '31.6167');
INSERT INTO `city` VALUES ('684', 'ZA', '6170', 'Port Alfred', '-33.6', '26.9');
INSERT INTO `city` VALUES ('685', 'ZA', '4295', 'Port Edward', '-31.05', '30.2167');
INSERT INTO `city` VALUES ('686', 'ZA', '6000', 'Port Elizabeth', '-33.9667', '25.5833');
INSERT INTO `city` VALUES ('687', 'ZA', '8280', 'Port Nolloth', '-29.25', '16.8667');
INSERT INTO `city` VALUES ('688', 'ZA', '4226', 'Port Shepstone', '-30.75', '30.45');
INSERT INTO `city` VALUES ('689', 'ZA', '5120', 'Port St Johns', '-31.5833', '28.7833');
INSERT INTO `city` VALUES ('690', 'ZA', '6810', 'Porterville', '-33.0167', '18.9833');
INSERT INTO `city` VALUES ('691', 'ZA', '8420', 'Postmasburg', '-28.3167', '23.0667');
INSERT INTO `city` VALUES ('692', 'ZA', '2520', 'Potchefstroom', '-26.7167', '27.1');
INSERT INTO `city` VALUES ('693', 'ZA', '541', 'Potgietersrus', '-24.1833', '29.0167');
INSERT INTO `city` VALUES ('694', 'ZA', '643', 'Potgieterus', '-24.1833', '29.0167');
INSERT INTO `city` VALUES ('695', 'ZA', '7', 'Pretoria', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('696', 'ZA', '66', 'Pretoria North', '-25.6622', '28.1653');
INSERT INTO `city` VALUES ('697', 'ZA', '70', 'Pretoria West', '-25.75', '28.1667');
INSERT INTO `city` VALUES ('698', 'ZA', '182', 'Pretoria-Noord', '-25.6622', '28.1653');
INSERT INTO `city` VALUES ('699', 'ZA', '183', 'Pretoria-Wes', '-25.75', '28.1667');
INSERT INTO `city` VALUES ('700', 'ZA', '8930', 'Prieska', '-29.6667', '22.75');
INSERT INTO `city` VALUES ('701', 'ZA', '1401', 'Primrose', '-26.1833', '28.1667');
INSERT INTO `city` VALUES ('702', 'ZA', '6932', 'Prince Albert', '-33.2167', '22.0333');
INSERT INTO `city` VALUES ('703', 'ZA', '6835', 'Prince Alfred Hamlet', '-33.3', '19.3167');
INSERT INTO `city` VALUES ('704', 'ZA', '1818', 'Protea Glen', '-26.2917', '27.9');
INSERT INTO `city` VALUES ('705', 'ZA', '1513', 'Putfontein', '-26.1167', '28.4');
INSERT INTO `city` VALUES ('706', 'ZA', '120', 'Pyramid', '-25.5814', '28.2319');
INSERT INTO `city` VALUES ('707', 'ZA', '4743', 'Queens Mercy', '-30.25', '28.5333');
INSERT INTO `city` VALUES ('708', 'ZA', '4743', 'Queen\'S Mercy', '-30.25', '28.5333');
INSERT INTO `city` VALUES ('709', 'ZA', '4079', 'Queensburgh', '-29.8667', '30.9333');
INSERT INTO `city` VALUES ('710', 'ZA', '5319', 'Queenstown', '-31.9', '26.8833');
INSERT INTO `city` VALUES ('711', 'ZA', '5180', 'Qumbu', '-31.15', '28.8667');
INSERT INTO `city` VALUES ('712', 'ZA', '1632', 'Rabie Ridge', '-26.1', '28.25');
INSERT INTO `city` VALUES ('713', 'ZA', '2738', 'Radithuso', '-26.1811', '25.8339');
INSERT INTO `city` VALUES ('714', 'ZA', '718', 'Raditshaba', '-22.8333', '28.85');
INSERT INTO `city` VALUES ('715', 'ZA', '2032', 'Randburg', '-26.1', '27.9833');
INSERT INTO `city` VALUES ('716', 'ZA', '1759', 'Randfontein', '-26.1667', '27.7');
INSERT INTO `city` VALUES ('717', 'ZA', '2156', 'Randpark Ridge', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('718', 'ZA', '1873', 'Randvaal', '-26.5667', '28.0167');
INSERT INTO `city` VALUES ('719', 'ZA', '415', 'Rantebeng', '-25.365', '28.2189');
INSERT INTO `city` VALUES ('720', 'ZA', '7493', 'Ravensmead', '-33.9167', '18.6');
INSERT INTO `city` VALUES ('721', 'ZA', '617', 'Rebone', '-24.1833', '29.0167');
INSERT INTO `city` VALUES ('722', 'ZA', '9904', 'Reddersburg', '-29.65', '26.1667');
INSERT INTO `city` VALUES ('723', 'ZA', '387', 'Regorogile', '-24.6', '27.4');
INSERT INTO `city` VALUES ('724', 'ZA', '9810', 'Reitz', '-27.8', '28.4333');
INSERT INTO `city` VALUES ('725', 'ZA', '1980', 'Residensia', '-26.5833', '27.8333');
INSERT INTO `city` VALUES ('726', 'ZA', '7945', 'Retreat', '-31.9167', '26.9667');
INSERT INTO `city` VALUES ('727', 'ZA', '3900', 'Richards Bay', '-28.7901', '32.0971');
INSERT INTO `city` VALUES ('728', 'ZA', '3900', 'Richardsbaai', '-28.7901', '32.0971');
INSERT INTO `city` VALUES ('729', 'ZA', '3780', 'Richmond', '-29.8667', '30.2667');
INSERT INTO `city` VALUES ('730', 'ZA', '8701', 'Ritchie', '-29.05', '24.6');
INSERT INTO `city` VALUES ('731', 'ZA', '6670', 'Riversdale', '-34.1', '21.2667');
INSERT INTO `city` VALUES ('732', 'ZA', '7250', 'Riviersonderend', '-34.15', '19.9');
INSERT INTO `city` VALUES ('733', 'ZA', '2128', 'Rivonia', '-26.05', '28.05');
INSERT INTO `city` VALUES ('734', 'ZA', '6705', 'Robertson', '-33.8', '19.8833');
INSERT INTO `city` VALUES ('735', 'ZA', '580', 'Roedtan', '-24.5777', '28.202');
INSERT INTO `city` VALUES ('736', 'ZA', '7700', 'Rondebosch', '-33.9633', '18.4764');
INSERT INTO `city` VALUES ('737', 'ZA', '1714', 'Roodepoort', '-26.1667', '27.8667');
INSERT INTO `city` VALUES ('738', 'ZA', '1724', 'Rooderpoort', '-26.1767', '27.8667');
INSERT INTO `city` VALUES ('739', 'ZA', '154', 'Rooihuiskraal', '-25.9', '28.1');
INSERT INTO `city` VALUES ('740', 'ZA', '2195', 'Roosevelt Park', '-26.15', '27.9833');
INSERT INTO `city` VALUES ('741', 'ZA', '9720', 'Rosendal', '-28.5167', '27.9333');
INSERT INTO `city` VALUES ('742', 'ZA', '2190', 'Rosettenville', '-26.25', '28.05');
INSERT INTO `city` VALUES ('743', 'ZA', '1936', 'Roshnee', '-26.5667', '27.9333');
INSERT INTO `city` VALUES ('744', 'ZA', '4072', 'Rossburgh', '-29.9', '30.9667');
INSERT INTO `city` VALUES ('745', 'ZA', '182', 'Rosslyn', '-25.6771', '28.1867');
INSERT INTO `city` VALUES ('746', 'ZA', '9958', 'Rouxville', '-30.4167', '26.8333');
INSERT INTO `city` VALUES ('747', 'ZA', '7405', 'Rugby', '-33.9', '18.4833');
INSERT INTO `city` VALUES ('748', 'ZA', '1473', 'Rusloo', '-26.2167', '28.25');
INSERT INTO `city` VALUES ('749', 'ZA', '405', 'Rust De Winter', '-25.1986', '28.6092');
INSERT INTO `city` VALUES ('750', 'ZA', '299', 'Rustenberg', '-25.613', '27.8843');
INSERT INTO `city` VALUES ('751', 'ZA', '202', 'Rustenburg', '-25.6667', '27.25');
INSERT INTO `city` VALUES ('752', 'ZA', '1260', 'Sabie', '-25.1', '30.7833');
INSERT INTO `city` VALUES ('753', 'ZA', '2431', 'Sakhile', '-26.9667', '29.2');
INSERT INTO `city` VALUES ('754', 'ZA', '7282', 'Saldanha', '-34.5333', '20.0333');
INSERT INTO `city` VALUES ('755', 'ZA', '6059', 'Saltville', '-33.9667', '25.5833');
INSERT INTO `city` VALUES ('756', 'ZA', '2172', 'Sandton', '-26.05', '27.9667');
INSERT INTO `city` VALUES ('757', 'ZA', '2760', 'Sannieshof', '-26.5333', '25.8');
INSERT INTO `city` VALUES ('758', 'ZA', '1946', 'Sasolburg', '-26.8167', '27.8167');
INSERT INTO `city` VALUES ('759', 'ZA', '318', 'Saulspoort', '-24.9333', '27.15');
INSERT INTO `city` VALUES ('760', 'ZA', '2775', 'Schweizer-Reneke', '-27.1833', '25.3333');
INSERT INTO `city` VALUES ('761', 'ZA', '4180', 'Scottburgh', '-30.2833', '30.75');
INSERT INTO `city` VALUES ('762', 'ZA', '3204', 'Scottsville', '-29.6167', '30.3833');
INSERT INTO `city` VALUES ('763', 'ZA', '1907', 'Sebokeng', '-26.5833', '27.8333');
INSERT INTO `city` VALUES ('764', 'ZA', '2300', 'Secunda', '-26.55', '29.1667');
INSERT INTO `city` VALUES ('765', 'ZA', '6573', 'Sedgefield', '-34.0167', '22.8');
INSERT INTO `city` VALUES ('766', 'ZA', '1058', 'Sekhukhune', '-26.3611', '28.7722');
INSERT INTO `city` VALUES ('767', 'ZA', '9783', 'Selosesha', '-29.2', '26.8167');
INSERT INTO `city` VALUES ('768', 'ZA', '9485', 'Senekal', '-28.3167', '27.6');
INSERT INTO `city` VALUES ('769', 'ZA', '699', 'Seshego', '-23.85', '29.3833');
INSERT INTO `city` VALUES ('770', 'ZA', '430', 'Settlers', '-24.95', '28.5333');
INSERT INTO `city` VALUES ('771', 'ZA', '4215', 'Sezela', '-30.4167', '30.6833');
INSERT INTO `city` VALUES ('772', 'ZA', '4430', 'Shakaskraal', '-29.45', '31.2167');
INSERT INTO `city` VALUES ('773', 'ZA', '4093', 'Shallcross', '-29.8333', '30.9333');
INSERT INTO `city` VALUES ('774', 'ZA', '1913', 'Sharpeville', '-26.6833', '27.8833');
INSERT INTO `city` VALUES ('775', 'ZA', '4240', 'Shelly Beach', '-30.8', '30.4167');
INSERT INTO `city` VALUES ('776', 'ZA', '873', 'Shiluvane', '-24.0333', '30.2667');
INSERT INTO `city` VALUES ('777', 'ZA', '1331', 'Shongwe Mission', '-25.4667', '31.9');
INSERT INTO `city` VALUES ('778', 'ZA', '906', 'Sibasa', '-22.95', '30.4667');
INSERT INTO `city` VALUES ('779', 'ZA', '170', 'Silverton', '-25.7317', '28.3347');
INSERT INTO `city` VALUES ('780', 'ZA', '7975', 'Simon\'S Town', '-34.0056', '18.4222');
INSERT INTO `city` VALUES ('781', 'ZA', '7975', 'Simonstad', '-34.1833', '18.4333');
INSERT INTO `city` VALUES ('782', 'ZA', '462', 'Siyabuswa', '-25.1167', '29.05');
INSERT INTO `city` VALUES ('783', 'ZA', '431', 'Skilpadfontein', '-25.0167', '28.8');
INSERT INTO `city` VALUES ('784', 'ZA', '1351', 'Skukuza', '-24.9833', '31.6');
INSERT INTO `city` VALUES ('785', 'ZA', '9966', 'Smithfield', '-30.2167', '26.5333');
INSERT INTO `city` VALUES ('786', 'ZA', '810', 'Soekmekaar', '-23.4833', '29.9333');
INSERT INTO `city` VALUES ('787', 'ZA', '5850', 'Somerset East', '-32.7167', '25.5833');
INSERT INTO `city` VALUES ('788', 'ZA', '7110', 'Somerset West', '-34.0833', '18.85');
INSERT INTO `city` VALUES ('789', 'ZA', '7130', 'Somerset-Wes', '-34.075', '18.8083');
INSERT INTO `city` VALUES ('790', 'ZA', '152', 'Soshanguve', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('791', 'ZA', '7800', 'Southfield', '-34.0333', '18.4833');
INSERT INTO `city` VALUES ('792', 'ZA', '6172', 'Southseas', '-33.6', '26.9');
INSERT INTO `city` VALUES ('793', 'ZA', '727', 'Sovenga', '-23.9333', '29.8167');
INSERT INTO `city` VALUES ('794', 'ZA', '1803', 'Soweto', '-26.2667', '27.8667');
INSERT INTO `city` VALUES ('795', 'ZA', '8240', 'Springbok', '-29.6667', '17.8833');
INSERT INTO `city` VALUES ('796', 'ZA', '9917', 'Springfontein', '-30.2667', '25.7');
INSERT INTO `city` VALUES ('797', 'ZA', '1558', 'Springs', '-26.25', '28.4');
INSERT INTO `city` VALUES ('798', 'ZA', '3936', 'St Lucia Estuary', '-28.4167', '32.1833');
INSERT INTO `city` VALUES ('799', 'ZA', '3609', 'St Wendolins', '-29.8167', '30.85');
INSERT INTO `city` VALUES ('800', 'ZA', '2425', 'Standerton', '-26.95', '29.25');
INSERT INTO `city` VALUES ('801', 'ZA', '3815', 'Stanger', '-28.8833', '31.4667');
INSERT INTO `city` VALUES ('802', 'ZA', '3373', 'Steadville', '-28.55', '29.7833');
INSERT INTO `city` VALUES ('803', 'ZA', '7945', 'Steenberg', '-34.0667', '18.4667');
INSERT INTO `city` VALUES ('804', 'ZA', '7600', 'Stellenbosch', '-33.9302', '18.8449');
INSERT INTO `city` VALUES ('805', 'ZA', '9762', 'Sterkspruit', '-25.3667', '30.5333');
INSERT INTO `city` VALUES ('806', 'ZA', '5425', 'Sterkstroom', '-31.5667', '26.55');
INSERT INTO `city` VALUES ('807', 'ZA', '5920', 'Steynsburg', '-31.3', '25.8167');
INSERT INTO `city` VALUES ('808', 'ZA', '6250', 'Steytlerville', '-33.3328', '24.3447');
INSERT INTO `city` VALUES ('809', 'ZA', '6674', 'Stilbaai', '-34.3667', '21.4167');
INSERT INTO `city` VALUES ('810', 'ZA', '2551', 'Stilfontein', '-26.85', '26.7833');
INSERT INTO `city` VALUES ('811', 'ZA', '6674', 'Still Bay', '-34.3667', '21.4');
INSERT INTO `city` VALUES ('812', 'ZA', '7140', 'Strand', '-34.1167', '18.8333');
INSERT INTO `city` VALUES ('813', 'ZA', '7798', 'Strandfontein', '-34.0833', '18.55');
INSERT INTO `city` VALUES ('814', 'ZA', '2031', 'Strathavon', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('815', 'ZA', '1724', 'Strubens Valley', '-26.1767', '27.8667');
INSERT INTO `city` VALUES ('816', 'ZA', '1724', 'Strubensvallei', '-26.1767', '27.8667');
INSERT INTO `city` VALUES ('817', 'ZA', '8765', 'Strydenburg', '-29.95', '23.6833');
INSERT INTO `city` VALUES ('818', 'ZA', '4930', 'Stutterheim', '-32.5667', '27.4167');
INSERT INTO `city` VALUES ('819', 'ZA', '2200', 'Sundra', '-26.2311', '29.0356');
INSERT INTO `city` VALUES ('820', 'ZA', '778', 'Superbia', '-23.8833', '30.4');
INSERT INTO `city` VALUES ('821', 'ZA', '6920', 'Sutherland', '-32.4', '20.6667');
INSERT INTO `city` VALUES ('822', 'ZA', '418', 'Swartbooistad', '-25.2728', '28.1683');
INSERT INTO `city` VALUES ('823', 'ZA', '351', 'Swartklip', '-24.9333', '27.15');
INSERT INTO `city` VALUES ('824', 'ZA', '6210', 'Swartkops', '-33.8667', '25.6');
INSERT INTO `city` VALUES ('825', 'ZA', '2835', 'Swartruggens', '-25.65', '26.7');
INSERT INTO `city` VALUES ('826', 'ZA', '6740', 'Swellendam', '-34.0333', '20.4333');
INSERT INTO `city` VALUES ('827', 'ZA', '5130', 'Tabankulu', '-30.9667', '29.3');
INSERT INTO `city` VALUES ('828', 'ZA', '7441', 'Table View', '-33.8167', '18.4833');
INSERT INTO `city` VALUES ('829', 'ZA', '5370', 'Tarkastad', '-32.0167', '26.2667');
INSERT INTO `city` VALUES ('830', 'ZA', '8576', 'Taung', '-24.4833', '30.4167');
INSERT INTO `city` VALUES ('831', 'ZA', '8576', 'Taung Sta', '-27.7167', '24.825');
INSERT INTO `city` VALUES ('832', 'ZA', '8537', 'Taung Station', '-28.0167', '24.85');
INSERT INTO `city` VALUES ('833', 'ZA', '407', 'Temba', '-25.365', '28.2189');
INSERT INTO `city` VALUES ('834', 'ZA', '1632', 'Tembisa', '-26.1', '28.25');
INSERT INTO `city` VALUES ('835', 'ZA', '1632', 'Tembisa Ext', '-26.1', '28.25');
INSERT INTO `city` VALUES ('836', 'ZA', '9783', 'Thaba Nchu', '-29.2167', '26.8333');
INSERT INTO `city` VALUES ('837', 'ZA', '319', 'Thabazimbi', '-24.6', '27.4');
INSERT INTO `city` VALUES ('838', 'ZA', '157', 'The Reeds', '-25.8049', '28.2056');
INSERT INTO `city` VALUES ('839', 'ZA', '155', 'Theresapark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('840', 'ZA', '9701', 'Theronville', '-28.2333', '28.3');
INSERT INTO `city` VALUES ('841', 'ZA', '9410', 'Theunissen', '-28.4', '26.7167');
INSERT INTO `city` VALUES ('842', 'ZA', '929', 'Thohoyandou', '-22.95', '30.4833');
INSERT INTO `city` VALUES ('843', 'ZA', '734', 'Tholongwe', '-23.9667', '29.7');
INSERT INTO `city` VALUES ('844', 'ZA', '1365', 'Thulamahashe', '-24.6167', '31.2083');
INSERT INTO `city` VALUES ('845', 'ZA', '419', 'Thulwe', '-25.2167', '28.2167');
INSERT INTO `city` VALUES ('846', 'ZA', '7945', 'Tokai', '-34.0667', '18.4333');
INSERT INTO `city` VALUES ('847', 'ZA', '1426', 'Tokoza', '-26.3667', '28.0667');
INSERT INTO `city` VALUES ('848', 'ZA', '1426', 'Tokoza Ext', '-26.35', '28.1083');
INSERT INTO `city` VALUES ('849', 'ZA', '4380', 'Tongaat', '-29.5833', '31.1333');
INSERT INTO `city` VALUES ('850', 'ZA', '6880', 'Touws River', '-33.3333', '20.0333');
INSERT INTO `city` VALUES ('851', 'ZA', '6880', 'Touwsrivier', '-33.3333', '20.0333');
INSERT INTO `city` VALUES ('852', 'ZA', '891', 'Trichardtsdal', '-24.1667', '30.4');
INSERT INTO `city` VALUES ('853', 'ZA', '9913', 'Trompsburg', '-30.0333', '25.7833');
INSERT INTO `city` VALUES ('854', 'ZA', '1550', 'Tsakane', '-26.35', '28.3833');
INSERT INTO `city` VALUES ('855', 'ZA', '1814', 'Tshiawelo', '-26.2917', '27.9');
INSERT INTO `city` VALUES ('856', 'ZA', '5170', 'Tsolo', '-31.3167', '28.75');
INSERT INTO `city` VALUES ('857', 'ZA', '5400', 'Tsomo', '-32.0333', '27.8');
INSERT INTO `city` VALUES ('858', 'ZA', '3010', 'Tugela Ferry', '-28.7333', '30.45');
INSERT INTO `city` VALUES ('859', 'ZA', '6820', 'Tulbagh', '-33.2833', '19.15');
INSERT INTO `city` VALUES ('860', 'ZA', '9820', 'Tweeling', '-27.55', '28.5167');
INSERT INTO `city` VALUES ('861', 'ZA', '850', 'Tzaneen', '-23.8333', '30.1667');
INSERT INTO `city` VALUES ('862', 'ZA', '3970', 'Ubombo', '-27.5667', '32.0833');
INSERT INTO `city` VALUES ('863', 'ZA', '6021', 'Uitenhage', '-33.7653', '25.4022');
INSERT INTO `city` VALUES ('864', 'ZA', '3838', 'Ulundi', '-28.3333', '31.4167');
INSERT INTO `city` VALUES ('865', 'ZA', '4126', 'Umbogintwini', '-30.0333', '30.9167');
INSERT INTO `city` VALUES ('866', 'ZA', '4105', 'Umbumbulu', '-29.9833', '30.7');
INSERT INTO `city` VALUES ('867', 'ZA', '4391', 'Umhlali', '-29.114', '30.6772');
INSERT INTO `city` VALUES ('868', 'ZA', '4021', 'Umhlanga Rocks', '-29.7167', '31.0667');
INSERT INTO `city` VALUES ('869', 'ZA', '4170', 'Umkomaas', '-30.2', '30.8');
INSERT INTO `city` VALUES ('870', 'ZA', '4031', 'Umlazi', '-29.9667', '30.8833');
INSERT INTO `city` VALUES ('871', 'ZA', '4740', 'Umtata', '-31.5833', '28.7833');
INSERT INTO `city` VALUES ('872', 'ZA', '4235', 'Umtentweni', '-30.7167', '30.4667');
INSERT INTO `city` VALUES ('873', 'ZA', '3239', 'Umzimkulu', '-30.2667', '29.9333');
INSERT INTO `city` VALUES ('874', 'ZA', '3263', 'Umzinto', '-30.0333', '29.8333');
INSERT INTO `city` VALUES ('875', 'ZA', '4225', 'Umzumbe', '-30.6167', '30.55');
INSERT INTO `city` VALUES ('876', 'ZA', '6460', 'Uniondale', '-33.65', '23.1333');
INSERT INTO `city` VALUES ('877', 'ZA', '8801', 'Upington', '-28.45', '21.25');
INSERT INTO `city` VALUES ('878', 'ZA', '2980', 'Utrecht', '-27.65', '30.3333');
INSERT INTO `city` VALUES ('879', 'ZA', '4270', 'Uvongo', '-31.4', '26.5833');
INSERT INTO `city` VALUES ('880', 'ZA', '537', 'Vaalwater', '-24.1667', '28.1');
INSERT INTO `city` VALUES ('881', 'ZA', '185', 'Valhalla', '-25.8117', '28.1503');
INSERT INTO `city` VALUES ('882', 'ZA', '2245', 'Van Dyksdrif', '-26.2311', '29.0356');
INSERT INTO `city` VALUES ('883', 'ZA', '1900', 'Vanderbijlpark', '-26.7', '27.8167');
INSERT INTO `city` VALUES ('884', 'ZA', '8771', 'Vanderkloof', '-30', '24.7333');
INSERT INTO `city` VALUES ('885', 'ZA', '8170', 'Vanrhynsdorp', '-31.6167', '18.7333');
INSERT INTO `city` VALUES ('886', 'ZA', '7365', 'Velddrif', '-32.7833', '18.1667');
INSERT INTO `city` VALUES ('887', 'ZA', '9450', 'Ventersburg', '-28.0833', '27.1333');
INSERT INTO `city` VALUES ('888', 'ZA', '2710', 'Ventersdorp', '-26.3167', '26.8167');
INSERT INTO `city` VALUES ('889', 'ZA', '9798', 'Venterstad', '-30.7833', '25.8');
INSERT INTO `city` VALUES ('890', 'ZA', '1904', 'Vereeniging', '-26.6667', '27.9333');
INSERT INTO `city` VALUES ('891', 'ZA', '4319', 'Verulam', '-29.65', '31.05');
INSERT INTO `city` VALUES ('892', 'ZA', '7070', 'Victoria West', '-31.4', '23.1167');
INSERT INTO `city` VALUES ('893', 'ZA', '9520', 'Viljoenskroon', '-27.2167', '26.95');
INSERT INTO `city` VALUES ('894', 'ZA', '9840', 'Villiers', '-27.0333', '28.6');
INSERT INTO `city` VALUES ('895', 'ZA', '8246', 'Vioolsdrif', '-28.7667', '17.65');
INSERT INTO `city` VALUES ('896', 'ZA', '9430', 'Virginia', '-28.1167', '26.9');
INSERT INTO `city` VALUES ('897', 'ZA', '7975', 'Vishoek', '-34.0056', '18.4222');
INSERT INTO `city` VALUES ('898', 'ZA', '2465', 'Volksrust', '-27.3667', '29.8833');
INSERT INTO `city` VALUES ('899', 'ZA', '187', 'Voortrekkerhoogte', '-25.8', '28.1167');
INSERT INTO `city` VALUES ('900', 'ZA', '9835', 'Vrede', '-27.4167', '29.1667');
INSERT INTO `city` VALUES ('901', 'ZA', '9595', 'Vredefort', '-27.0167', '27.3833');
INSERT INTO `city` VALUES ('902', 'ZA', '7375', 'Vredenburg', '-32.9', '17.9833');
INSERT INTO `city` VALUES ('903', 'ZA', '8146', 'Vredendal', '-31.6667', '18.5');
INSERT INTO `city` VALUES ('904', 'ZA', '8474', 'Vryburg', '-26.95', '24.7333');
INSERT INTO `city` VALUES ('905', 'ZA', '3002', 'Vryheid', '-27.7667', '30.8');
INSERT INTO `city` VALUES ('906', 'ZA', '2778', 'Vyrburg', '-26.5389', '25.3833');
INSERT INTO `city` VALUES ('907', 'ZA', '2480', 'Wakkerstroom', '-27.35', '30.1333');
INSERT INTO `city` VALUES ('908', 'ZA', '1876', 'Walkerville', '-26.4167', '27.9667');
INSERT INTO `city` VALUES ('909', 'ZA', '6070', 'Walmer', '-33.9833', '25.5833');
INSERT INTO `city` VALUES ('910', 'ZA', '50', 'Wapadrand', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('911', 'ZA', '9890', 'Warden', '-27.85', '28.9667');
INSERT INTO `city` VALUES ('912', 'ZA', '480', 'Warmbad', '-24.8833', '28.2833');
INSERT INTO `city` VALUES ('913', 'ZA', '406', 'Warmbaths', '-24.8833', '28.2833');
INSERT INTO `city` VALUES ('914', 'ZA', '8530', 'Warrenton', '-28.1167', '24.85');
INSERT INTO `city` VALUES ('915', 'ZA', '3233', 'Wartburg', '-29.4333', '30.5833');
INSERT INTO `city` VALUES ('916', 'ZA', '2920', 'Wasbank', '-29.7167', '26.3833');
INSERT INTO `city` VALUES ('917', 'ZA', '145', 'Waterkloof', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('918', 'ZA', '9438', 'Welkom', '-27.9833', '26.7333');
INSERT INTO `city` VALUES ('919', 'ZA', '7655', 'Wellington', '-33.6333', '19');
INSERT INTO `city` VALUES ('920', 'ZA', '9944', 'Wepener', '-29.7333', '27.0333');
INSERT INTO `city` VALUES ('921', 'ZA', '9680', 'Wesselsbron', '-27.85', '26.3667');
INSERT INTO `city` VALUES ('922', 'ZA', '6655', 'Western Cape', '-33.55', '21.8889');
INSERT INTO `city` VALUES ('923', 'ZA', '1772', 'Westonaria', '-26.3167', '27.65');
INSERT INTO `city` VALUES ('924', 'ZA', '3629', 'Westville', '-29.8333', '30.9333');
INSERT INTO `city` VALUES ('925', 'ZA', '1240', 'White River', '-25.3167', '31.0167');
INSERT INTO `city` VALUES ('926', 'ZA', '1254', 'Whiteriver', '-24.9333', '31.0917');
INSERT INTO `city` VALUES ('927', 'ZA', '5360', 'Whittlesea', '-32.1667', '26.8167');
INSERT INTO `city` VALUES ('928', 'ZA', '109', 'Wierdapark', '-25.7069', '28.2294');
INSERT INTO `city` VALUES ('929', 'ZA', '6446', 'Willowmore', '-33.2833', '23.4833');
INSERT INTO `city` VALUES ('930', 'ZA', '5040', 'Willowvale', '-32.2667', '28.5167');
INSERT INTO `city` VALUES ('931', 'ZA', '9420', 'Winburg', '-28.5333', '27.0167');
INSERT INTO `city` VALUES ('932', 'ZA', '8510', 'Windsorton', '-28.3333', '24.7167');
INSERT INTO `city` VALUES ('933', 'ZA', '153', 'Wingate Park', '-25.8333', '28.25');
INSERT INTO `city` VALUES ('934', 'ZA', '4126', 'Winklespruit', '-30.1', '30.85');
INSERT INTO `city` VALUES ('935', 'ZA', '3331', 'Winterton', '-28.8', '29.5333');
INSERT INTO `city` VALUES ('936', 'ZA', '1032', 'Witbank', '-25.8667', '29.2333');
INSERT INTO `city` VALUES ('937', 'ZA', '2068', 'Witkoppen', '-26.2', '28.0833');
INSERT INTO `city` VALUES ('938', 'ZA', '1240', 'Witrivier', '-25.3167', '31.0167');
INSERT INTO `city` VALUES ('939', 'ZA', '9868', 'Witsieshoek', '-28.5333', '28.8');
INSERT INTO `city` VALUES ('940', 'ZA', '2630', 'Wolmaransstad', '-27.2', '25.9667');
INSERT INTO `city` VALUES ('941', 'ZA', '6830', 'Wolseley', '-33.4167', '19.2');
INSERT INTO `city` VALUES ('942', 'ZA', '7925', 'Woodstock', '-33.9167', '18.4333');
INSERT INTO `city` VALUES ('943', 'ZA', '6845', 'Worcester', '-33.65', '19.4333');
INSERT INTO `city` VALUES ('944', 'ZA', '7800', 'Wynberg', '-34', '18.4667');
INSERT INTO `city` VALUES ('945', 'ZA', '1281', 'Ximhungwe', '-24.8333', '31.0667');
INSERT INTO `city` VALUES ('946', 'ZA', '452', 'Xipame', '-24.9667', '29.3');
INSERT INTO `city` VALUES ('947', 'ZA', '4004', 'Yellowwood Park', '-29.85', '31.0167');
INSERT INTO `city` VALUES ('948', 'ZA', '7405', 'Ysterplaat', '-33.9', '18.4833');
INSERT INTO `city` VALUES ('949', 'ZA', '1949', 'Zamdela', '-26.8333', '27.85');
INSERT INTO `city` VALUES ('950', 'ZA', '9945', 'Zastron', '-30.3', '27.0833');
INSERT INTO `city` VALUES ('951', 'ZA', '2851', 'Zeerust', '-25.5333', '26.0833');
INSERT INTO `city` VALUES ('952', 'ZA', '6004', 'Zwide', '-33.8667', '25.5667');

-- ----------------------------
-- Table structure for `closedrelisted`
-- ----------------------------
DROP TABLE IF EXISTS `closedrelisted`;
CREATE TABLE `closedrelisted` (
  `auction` int(32) DEFAULT '0',
  `relistdate` varchar(8) NOT NULL DEFAULT '',
  `newauction` int(32) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of closedrelisted
-- ----------------------------

-- ----------------------------
-- Table structure for `comm_messages`
-- ----------------------------
DROP TABLE IF EXISTS `comm_messages`;
CREATE TABLE `comm_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boardid` int(11) NOT NULL DEFAULT '0',
  `msgdate` varchar(14) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  KEY `msg_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comm_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `comment_sheet`
-- ----------------------------
DROP TABLE IF EXISTS `comment_sheet`;
CREATE TABLE `comment_sheet` (
  `com_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `com_date` datetime DEFAULT NULL,
  `com_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comment_sheet
-- ----------------------------

-- ----------------------------
-- Table structure for `commission`
-- ----------------------------
DROP TABLE IF EXISTS `commission`;
CREATE TABLE `commission` (
  `comm_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `comt_id` smallint(6) DEFAULT NULL,
  `comm_percentage` decimal(3,3) DEFAULT NULL,
  PRIMARY KEY (`comm_id`),
  KEY `comt_id_idx` (`comt_id`),
  CONSTRAINT `comt_id` FOREIGN KEY (`comt_id`) REFERENCES `commission_type` (`comt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of commission
-- ----------------------------

-- ----------------------------
-- Table structure for `commission_type`
-- ----------------------------
DROP TABLE IF EXISTS `commission_type`;
CREATE TABLE `commission_type` (
  `comt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `commt_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of commission_type
-- ----------------------------

-- ----------------------------
-- Table structure for `community`
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `messages` int(11) NOT NULL DEFAULT '0',
  `lastmessage` varchar(14) NOT NULL DEFAULT '0',
  `msgstoshow` int(11) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '1',
  KEY `msg_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('1', 'Selling', '0', '', '30', '1');
INSERT INTO `community` VALUES ('2', 'Buying', '0', '20050823103800', '30', '1');

-- ----------------------------
-- Table structure for `contact_address_format`
-- ----------------------------
DROP TABLE IF EXISTS `contact_address_format`;
CREATE TABLE `contact_address_format` (
  `caf_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `caf_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`caf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contact_address_format
-- ----------------------------

-- ----------------------------
-- Table structure for `contract`
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `con_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `con_date` datetime DEFAULT NULL,
  `cnt_id` smallint(6) DEFAULT NULL,
  `ope_id` smallint(6) DEFAULT NULL,
  `contractcol` varchar(45) DEFAULT NULL,
  `cam_id` smallint(6) DEFAULT NULL,
  `con_start_date` datetime DEFAULT NULL,
  `con_end_date` datetime DEFAULT NULL,
  `con_notes` varchar(4005) DEFAULT NULL,
  `use_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`con_id`),
  KEY `cnt_id_idx` (`cnt_id`),
  KEY `ope_id_idx` (`ope_id`),
  KEY `cam_id_idx` (`cam_id`),
  KEY `use_id_idx` (`use_id`),
  CONSTRAINT `cam_id` FOREIGN KEY (`cam_id`) REFERENCES `campaign` (`cam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cnt_id` FOREIGN KEY (`cnt_id`) REFERENCES `contract_type` (`cnt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ope_id` FOREIGN KEY (`ope_id`) REFERENCES `operator` (`ope_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `use_id` FOREIGN KEY (`use_id`) REFERENCES `ads2trade_user` (`use_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for `contract_type`
-- ----------------------------
DROP TABLE IF EXISTS `contract_type`;
CREATE TABLE `contract_type` (
  `cnt_id` smallint(6) NOT NULL,
  `cnt_description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contract_type
-- ----------------------------

-- ----------------------------
-- Table structure for `counters`
-- ----------------------------
DROP TABLE IF EXISTS `counters`;
CREATE TABLE `counters` (
  `users` int(11) DEFAULT '0',
  `inactiveusers` int(11) NOT NULL DEFAULT '0',
  `auctions` int(11) DEFAULT '0',
  `closedauctions` int(11) NOT NULL DEFAULT '0',
  `bids` int(11) NOT NULL DEFAULT '0',
  `suspendedauctions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of counters
-- ----------------------------
INSERT INTO `counters` VALUES ('0', '0', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `country` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('Afghanistan');
INSERT INTO `countries` VALUES ('Albania');
INSERT INTO `countries` VALUES ('Algeria');
INSERT INTO `countries` VALUES ('American Samoa');
INSERT INTO `countries` VALUES ('Andorra');
INSERT INTO `countries` VALUES ('Angola');
INSERT INTO `countries` VALUES ('Anguilla');
INSERT INTO `countries` VALUES ('Antarctica');
INSERT INTO `countries` VALUES ('Antigua And Barbuda');
INSERT INTO `countries` VALUES ('Argentina');
INSERT INTO `countries` VALUES ('Armenia');
INSERT INTO `countries` VALUES ('Aruba');
INSERT INTO `countries` VALUES ('Australia');
INSERT INTO `countries` VALUES ('Austria');
INSERT INTO `countries` VALUES ('Azerbaijan Republic');
INSERT INTO `countries` VALUES ('Bahamas');
INSERT INTO `countries` VALUES ('Bahrain');
INSERT INTO `countries` VALUES ('Bangladesh');
INSERT INTO `countries` VALUES ('Barbados');
INSERT INTO `countries` VALUES ('Belarus');
INSERT INTO `countries` VALUES ('Belgium');
INSERT INTO `countries` VALUES ('Belize');
INSERT INTO `countries` VALUES ('Benin');
INSERT INTO `countries` VALUES ('Bermuda');
INSERT INTO `countries` VALUES ('Bhutan');
INSERT INTO `countries` VALUES ('Bolivia');
INSERT INTO `countries` VALUES ('Bosnia and Herzegowina');
INSERT INTO `countries` VALUES ('Botswana');
INSERT INTO `countries` VALUES ('Bouvet Island');
INSERT INTO `countries` VALUES ('Brazil');
INSERT INTO `countries` VALUES ('British Indian Ocean Territory');
INSERT INTO `countries` VALUES ('Brunei Darussalam');
INSERT INTO `countries` VALUES ('Bulgaria');
INSERT INTO `countries` VALUES ('Burkina Faso');
INSERT INTO `countries` VALUES ('Burma');
INSERT INTO `countries` VALUES ('Burundi');
INSERT INTO `countries` VALUES ('Cambodia');
INSERT INTO `countries` VALUES ('Cameroon');
INSERT INTO `countries` VALUES ('Canada');
INSERT INTO `countries` VALUES ('Cape Verde');
INSERT INTO `countries` VALUES ('Cayman Islands');
INSERT INTO `countries` VALUES ('Central African Republic');
INSERT INTO `countries` VALUES ('Chad');
INSERT INTO `countries` VALUES ('Chile');
INSERT INTO `countries` VALUES ('China');
INSERT INTO `countries` VALUES ('Christmas Island');
INSERT INTO `countries` VALUES ('Cocos &#40;Keeling&#41; Islands');
INSERT INTO `countries` VALUES ('Colombia');
INSERT INTO `countries` VALUES ('Comoros');
INSERT INTO `countries` VALUES ('Congo');
INSERT INTO `countries` VALUES ('Congo, the Democratic Republic');
INSERT INTO `countries` VALUES ('Cook Islands');
INSERT INTO `countries` VALUES ('Costa Rica');
INSERT INTO `countries` VALUES ('Cote d&#39;Ivoire');
INSERT INTO `countries` VALUES ('Croatia');
INSERT INTO `countries` VALUES ('Cyprus');
INSERT INTO `countries` VALUES ('Czech Republic');
INSERT INTO `countries` VALUES ('Denmark');
INSERT INTO `countries` VALUES ('Djibouti');
INSERT INTO `countries` VALUES ('Dominica');
INSERT INTO `countries` VALUES ('Dominican Republic');
INSERT INTO `countries` VALUES ('East Timor');
INSERT INTO `countries` VALUES ('Ecuador');
INSERT INTO `countries` VALUES ('Egypt');
INSERT INTO `countries` VALUES ('El Salvador');
INSERT INTO `countries` VALUES ('Equatorial Guinea');
INSERT INTO `countries` VALUES ('Eritrea');
INSERT INTO `countries` VALUES ('Estonia');
INSERT INTO `countries` VALUES ('Ethiopia');
INSERT INTO `countries` VALUES ('Falkland Islands');
INSERT INTO `countries` VALUES ('Faroe Islands');
INSERT INTO `countries` VALUES ('Fiji');
INSERT INTO `countries` VALUES ('Finland');
INSERT INTO `countries` VALUES ('France');
INSERT INTO `countries` VALUES ('French Guiana');
INSERT INTO `countries` VALUES ('French Polynesia');
INSERT INTO `countries` VALUES ('French Southern Territories');
INSERT INTO `countries` VALUES ('Gabon');
INSERT INTO `countries` VALUES ('Gambia');
INSERT INTO `countries` VALUES ('Georgia');
INSERT INTO `countries` VALUES ('Germany');
INSERT INTO `countries` VALUES ('Ghana');
INSERT INTO `countries` VALUES ('Gibraltar');
INSERT INTO `countries` VALUES ('Great Britain');
INSERT INTO `countries` VALUES ('Greece');
INSERT INTO `countries` VALUES ('Greenland');
INSERT INTO `countries` VALUES ('Grenada');
INSERT INTO `countries` VALUES ('Guadeloupe');
INSERT INTO `countries` VALUES ('Guam');
INSERT INTO `countries` VALUES ('Guatemala');
INSERT INTO `countries` VALUES ('Guinea');
INSERT INTO `countries` VALUES ('Guinea-Bissau');
INSERT INTO `countries` VALUES ('Guyana');
INSERT INTO `countries` VALUES ('Haiti');
INSERT INTO `countries` VALUES ('Heard and Mc Donald Islands');
INSERT INTO `countries` VALUES ('Honduras');
INSERT INTO `countries` VALUES ('Hong Kong');
INSERT INTO `countries` VALUES ('Hungary');
INSERT INTO `countries` VALUES ('Iceland');
INSERT INTO `countries` VALUES ('India');
INSERT INTO `countries` VALUES ('Indonesia');
INSERT INTO `countries` VALUES ('Ireland');
INSERT INTO `countries` VALUES ('Israel');
INSERT INTO `countries` VALUES ('Italy');
INSERT INTO `countries` VALUES ('Jamaica');
INSERT INTO `countries` VALUES ('Japan');
INSERT INTO `countries` VALUES ('Jordan');
INSERT INTO `countries` VALUES ('Kazakhstan');
INSERT INTO `countries` VALUES ('Kenya');
INSERT INTO `countries` VALUES ('Kiribati');
INSERT INTO `countries` VALUES ('Korea &#40;South&#41;');
INSERT INTO `countries` VALUES ('Kuwait');
INSERT INTO `countries` VALUES ('Kyrgyzstan');
INSERT INTO `countries` VALUES ('Lao People&#39;s Democratic Republic');
INSERT INTO `countries` VALUES ('Latvia');
INSERT INTO `countries` VALUES ('Lebanon');
INSERT INTO `countries` VALUES ('Lesotho');
INSERT INTO `countries` VALUES ('Liberia');
INSERT INTO `countries` VALUES ('Liechtenstein');
INSERT INTO `countries` VALUES ('Lithuania');
INSERT INTO `countries` VALUES ('Luxembourg');
INSERT INTO `countries` VALUES ('Macau');
INSERT INTO `countries` VALUES ('Macedonia');
INSERT INTO `countries` VALUES ('Madagascar');
INSERT INTO `countries` VALUES ('Malawi');
INSERT INTO `countries` VALUES ('Malaysia');
INSERT INTO `countries` VALUES ('Maldives');
INSERT INTO `countries` VALUES ('Mali');
INSERT INTO `countries` VALUES ('Malta');
INSERT INTO `countries` VALUES ('Marshall Islands');
INSERT INTO `countries` VALUES ('Martinique');
INSERT INTO `countries` VALUES ('Mauritania');
INSERT INTO `countries` VALUES ('Mauritius');
INSERT INTO `countries` VALUES ('Mayotte');
INSERT INTO `countries` VALUES ('Mexico');
INSERT INTO `countries` VALUES ('Micronesia, Federated States of');
INSERT INTO `countries` VALUES ('Moldova, Republic of');
INSERT INTO `countries` VALUES ('Monaco');
INSERT INTO `countries` VALUES ('Mongolia');
INSERT INTO `countries` VALUES ('Montserrat');
INSERT INTO `countries` VALUES ('Morocco');
INSERT INTO `countries` VALUES ('Mozambique');
INSERT INTO `countries` VALUES ('Namibia');
INSERT INTO `countries` VALUES ('Nauru');
INSERT INTO `countries` VALUES ('Nepal');
INSERT INTO `countries` VALUES ('Netherlands');
INSERT INTO `countries` VALUES ('Netherlands Antilles');
INSERT INTO `countries` VALUES ('New Caledonia');
INSERT INTO `countries` VALUES ('New Zealand');
INSERT INTO `countries` VALUES ('Nicaragua');
INSERT INTO `countries` VALUES ('Niger');
INSERT INTO `countries` VALUES ('Nigeria');
INSERT INTO `countries` VALUES ('Niuev');
INSERT INTO `countries` VALUES ('Norfolk Island');
INSERT INTO `countries` VALUES ('Northern Mariana Islands');
INSERT INTO `countries` VALUES ('Norway');
INSERT INTO `countries` VALUES ('Oman');
INSERT INTO `countries` VALUES ('Pakistan');
INSERT INTO `countries` VALUES ('Palau');
INSERT INTO `countries` VALUES ('Panama');
INSERT INTO `countries` VALUES ('Papua New Guinea');
INSERT INTO `countries` VALUES ('Paraguay');
INSERT INTO `countries` VALUES ('Peru');
INSERT INTO `countries` VALUES ('Philippines');
INSERT INTO `countries` VALUES ('Pitcairn');
INSERT INTO `countries` VALUES ('Poland');
INSERT INTO `countries` VALUES ('Portugal');
INSERT INTO `countries` VALUES ('Puerto Rico');
INSERT INTO `countries` VALUES ('Qatar');
INSERT INTO `countries` VALUES ('Reunion');
INSERT INTO `countries` VALUES ('Romania');
INSERT INTO `countries` VALUES ('Russian Federation');
INSERT INTO `countries` VALUES ('Rwanda');
INSERT INTO `countries` VALUES ('Saint Kitts and Nevis');
INSERT INTO `countries` VALUES ('Saint Lucia');
INSERT INTO `countries` VALUES ('Saint Vincent and the Grenadin');
INSERT INTO `countries` VALUES ('Samoa &#40;Independent&#41;');
INSERT INTO `countries` VALUES ('San Marino');
INSERT INTO `countries` VALUES ('Sao Tome and Principe');
INSERT INTO `countries` VALUES ('Saudi Arabia');
INSERT INTO `countries` VALUES ('Senegal');
INSERT INTO `countries` VALUES ('Seychelles');
INSERT INTO `countries` VALUES ('Sierra Leone');
INSERT INTO `countries` VALUES ('Singapore');
INSERT INTO `countries` VALUES ('Slovakia');
INSERT INTO `countries` VALUES ('Slovenia');
INSERT INTO `countries` VALUES ('Solomon Islands');
INSERT INTO `countries` VALUES ('Somalia');
INSERT INTO `countries` VALUES ('South Africa');
INSERT INTO `countries` VALUES ('South Georgia');
INSERT INTO `countries` VALUES ('Spain');
INSERT INTO `countries` VALUES ('Sri Lanka');
INSERT INTO `countries` VALUES ('St. Helena');
INSERT INTO `countries` VALUES ('St. Pierre and Miquelon');
INSERT INTO `countries` VALUES ('Suriname');
INSERT INTO `countries` VALUES ('Svalbard and Jan Mayen Islands');
INSERT INTO `countries` VALUES ('Swaziland');
INSERT INTO `countries` VALUES ('Sweden');
INSERT INTO `countries` VALUES ('Switzerland');
INSERT INTO `countries` VALUES ('Taiwan');
INSERT INTO `countries` VALUES ('Tajikistan');
INSERT INTO `countries` VALUES ('Tanzania');
INSERT INTO `countries` VALUES ('Thailand');
INSERT INTO `countries` VALUES ('Togo');
INSERT INTO `countries` VALUES ('Tokelau');
INSERT INTO `countries` VALUES ('Tonga');
INSERT INTO `countries` VALUES ('Trinidad and Tobago');
INSERT INTO `countries` VALUES ('Tunisia');
INSERT INTO `countries` VALUES ('Turkey');
INSERT INTO `countries` VALUES ('Turkmenistan');
INSERT INTO `countries` VALUES ('Turks and Caicos Islands');
INSERT INTO `countries` VALUES ('Tuvalu');
INSERT INTO `countries` VALUES ('Uganda');
INSERT INTO `countries` VALUES ('Ukraine');
INSERT INTO `countries` VALUES ('United Arab Emiratesv');
INSERT INTO `countries` VALUES ('United Kingdom');
INSERT INTO `countries` VALUES ('United States');
INSERT INTO `countries` VALUES ('Uruguay');
INSERT INTO `countries` VALUES ('Uzbekistan');
INSERT INTO `countries` VALUES ('Vanuatu');
INSERT INTO `countries` VALUES ('Venezuela');
INSERT INTO `countries` VALUES ('Viet Nam');
INSERT INTO `countries` VALUES ('Virgin Islands &#40;British&#41;');
INSERT INTO `countries` VALUES ('Virgin Islands &#40;U.S.&#41;');
INSERT INTO `countries` VALUES ('Wallis and Futuna Islands');
INSERT INTO `countries` VALUES ('Western Sahara');
INSERT INTO `countries` VALUES ('Yemen');
INSERT INTO `countries` VALUES ('Zambia');
INSERT INTO `countries` VALUES ('Zimbabwe');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `cou_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cou_name` varchar(255) DEFAULT NULL,
  `adf_id` smallint(6) DEFAULT NULL COMMENT 'FK: address_format',
  `cou_zip_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`cou_id`),
  KEY `adf_id_idx` (`adf_id`),
  CONSTRAINT `adf_id` FOREIGN KEY (`adf_id`) REFERENCES `country_address_format` (`adf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'South Africa', '1', '277');

-- ----------------------------
-- Table structure for `country_address_format`
-- ----------------------------
DROP TABLE IF EXISTS `country_address_format`;
CREATE TABLE `country_address_format` (
  `adf_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `adr_address_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country_address_format
-- ----------------------------
INSERT INTO `country_address_format` VALUES ('1', 'country, region, city, surbub, plot number, street');

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `cur_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cur_code` varchar(255) DEFAULT NULL,
  `cur_description` varchar(255) DEFAULT NULL,
  `cur_EMU` tinyint(4) DEFAULT NULL,
  `cur_rounding_precision` float DEFAULT NULL,
  `cur_decimal_places` int(11) DEFAULT NULL,
  `cur_invoice_rounding_precision` float DEFAULT NULL,
  `cur_unit_rounding_precision` float DEFAULT NULL,
  `cur_unit_decimal_places` float DEFAULT NULL,
  `cur_application_rounding_precision` float DEFAULT NULL,
  `cur_date_adjusted` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currency
-- ----------------------------

-- ----------------------------
-- Table structure for `currentaccesses`
-- ----------------------------
DROP TABLE IF EXISTS `currentaccesses`;
CREATE TABLE `currentaccesses` (
  `day` char(2) NOT NULL DEFAULT '0',
  `month` char(2) NOT NULL DEFAULT '0',
  `year` char(4) NOT NULL DEFAULT '0',
  `pageviews` int(11) NOT NULL DEFAULT '0',
  `uniquevisitors` int(11) NOT NULL DEFAULT '0',
  `usersessions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currentaccesses
-- ----------------------------

-- ----------------------------
-- Table structure for `currentbrowsers`
-- ----------------------------
DROP TABLE IF EXISTS `currentbrowsers`;
CREATE TABLE `currentbrowsers` (
  `month` char(2) NOT NULL DEFAULT '0',
  `year` varchar(4) NOT NULL DEFAULT '0',
  `browser` varchar(50) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currentbrowsers
-- ----------------------------

-- ----------------------------
-- Table structure for `currentplatforms`
-- ----------------------------
DROP TABLE IF EXISTS `currentplatforms`;
CREATE TABLE `currentplatforms` (
  `month` char(2) NOT NULL DEFAULT '0',
  `year` varchar(4) NOT NULL DEFAULT '0',
  `platform` varchar(50) NOT NULL DEFAULT '0',
  `counter` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currentplatforms
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `cus_group_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cus_group_name` varchar(255) DEFAULT NULL,
  `cus_GCP_id` tinyint(4) DEFAULT NULL,
  `time_type_id` tinyint(4) DEFAULT NULL,
  `pay_id` tinyint(4) DEFAULT NULL,
  `cus_group_customer` varchar(255) DEFAULT NULL,
  `cus_holding_company` varchar(255) DEFAULT NULL,
  `cur_id` tinyint(4) DEFAULT NULL,
  `cou_id` varchar(255) DEFAULT NULL,
  `cus_group_name2` varchar(255) DEFAULT NULL,
  `cus_legal_entity_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cus_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `dis_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lot_id` smallint(6) DEFAULT NULL,
  `dis_description` varchar(255) DEFAULT NULL,
  `dis_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of district
-- ----------------------------

-- ----------------------------
-- Table structure for `document_status`
-- ----------------------------
DROP TABLE IF EXISTS `document_status`;
CREATE TABLE `document_status` (
  `dos_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `dos_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of document_status
-- ----------------------------

-- ----------------------------
-- Table structure for `document_type`
-- ----------------------------
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type` (
  `dot_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `dot_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of document_type
-- ----------------------------

-- ----------------------------
-- Table structure for `durations`
-- ----------------------------
DROP TABLE IF EXISTS `durations`;
CREATE TABLE `durations` (
  `days` int(11) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of durations
-- ----------------------------
INSERT INTO `durations` VALUES ('1', '2 weeks');
INSERT INTO `durations` VALUES ('2', '3 weeks');
INSERT INTO `durations` VALUES ('3', '1 month');
INSERT INTO `durations` VALUES ('7', '2 months');
INSERT INTO `durations` VALUES ('14', '3 months');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `emt_id` smallint(6) DEFAULT NULL COMMENT 'FK: employee_type',
  `emp_first_name` varchar(255) DEFAULT NULL,
  `emp_surname` varchar(255) DEFAULT NULL,
  `jot_id` smallint(6) DEFAULT NULL COMMENT 'FK: job_type',
  `emp_tel_code` int(11) DEFAULT NULL,
  `emp_tel` int(11) DEFAULT NULL,
  `emp_cell_code` int(11) DEFAULT NULL,
  `emp_cell` int(11) DEFAULT NULL,
  `emp_comment` varchar(255) DEFAULT NULL,
  `cnd_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emt_id_idx` (`emt_id`),
  KEY `jot_id_idx` (`jot_id`),
  KEY `cnd_id_idx` (`cnd_id`),
  CONSTRAINT `cnd_id` FOREIGN KEY (`cnd_id`) REFERENCES `contact_details` (`cnd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emt_id` FOREIGN KEY (`emt_id`) REFERENCES `employee_type` (`emt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jot_id` FOREIGN KEY (`jot_id`) REFERENCES `job_title` (`jot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', null, 'John', 'Doe', null, null, null, null, null, null, null);
INSERT INTO `employee` VALUES ('2', null, 'John', 'Butch', null, null, null, null, null, null, null);
INSERT INTO `employee` VALUES ('3', null, 'John', 'Michael', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `employee_type`
-- ----------------------------
DROP TABLE IF EXISTS `employee_type`;
CREATE TABLE `employee_type` (
  `emt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `emt_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee_type
-- ----------------------------

-- ----------------------------
-- Table structure for `face`
-- ----------------------------
DROP TABLE IF EXISTS `face`;
CREATE TABLE `face` (
  `fac_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fac_description` varchar(255) DEFAULT NULL,
  `fac_number` int(11) DEFAULT NULL,
  `fac_reference_number` varchar(255) DEFAULT NULL,
  `fac_name` varchar(255) DEFAULT NULL,
  `inv_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of face
-- ----------------------------

-- ----------------------------
-- Table structure for `faqs`
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of faqs
-- ----------------------------
INSERT INTO `faqs` VALUES ('2', 'Registering', 'To register as a new user, click on Register at the top of the window. You will be asked for your name, a username and password, and contact information, including your email address.\r\n\r\n<B>You must be at least 18 years of age to register.</B>!', '1');
INSERT INTO `faqs` VALUES ('4', 'Item Watch', '<b>Item watch</b> notifies you when someone bids on the auctions that you have added to your Item Watch. ', '3');
INSERT INTO `faqs` VALUES ('5', 'What is a Dutch auction?', 'Dutch auction is a type of auction where the auctioneer begins with a high asking price which is lowered until some participant is willing to accept the auctioneer\'s price. The winning participant pays the last announced price.', '1');

-- ----------------------------
-- Table structure for `faqs_translated`
-- ----------------------------
DROP TABLE IF EXISTS `faqs_translated`;
CREATE TABLE `faqs_translated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` char(2) NOT NULL DEFAULT '',
  `question` varchar(200) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of faqs_translated
-- ----------------------------
INSERT INTO `faqs_translated` VALUES ('2', 'EN', 'Registering', 'To register as a new user, click on Register at the top of the window. You will be asked for your name, a username and password, and contact information, including your email address.\r\n\r\n<B>You must be at least 18 years of age to register.</B>!');
INSERT INTO `faqs_translated` VALUES ('2', 'ES', 'Registrarse', 'Para registrar un nuevo usuario, haz click en <B>Reg&iacute;Ã‚Â­strate</B> en la parte superior de la pantalla. Se te preguntar&aacute;n tus datos personales, un nombre de usuario, una contrase&ntilde;a e informacion de contacto como la direccion e-mail.\r\n\r\n<B>¡Tienes que ser mayor de edad para poder registrarte!</B>');
INSERT INTO `faqs_translated` VALUES ('4', 'EN', 'Item Watch', '<b>Item watch</b> notifies you when someone bids on the auctions that you have added to your Item Watch. ');
INSERT INTO `faqs_translated` VALUES ('4', 'ES', 'En la Mira', '<i><b>En la Mira</b></i> te env&iacute;a una notificacion por e-mail, cada vez que alguien puja en una de las subastas que has a&ntilde;adido a tu lista <i>En la Mira</i>. ');
INSERT INTO `faqs_translated` VALUES ('6', 'ES', 'Auction Watch', '<i><B>Auction Watch</b></i> es tu asistente para saber cuando se abre una subasta cuya descripcion contiene palabras clave de tu interes.\r\n\r\nPara usar esta opcion inserta las palabras clave en las que est&aacute;s interesado en la lista de <i>Auction Watch</i>. Todas las palabras claves deben estar separadas por un espacio. Cuando estas palabras claves aparezcan en alg&uacute;n t&iacute;tulo o descripcion de subasta, recibir&aacute;s un e-mail con la informacion de que una subasta que contiene tus palabras claves ha sido creada. Tambi&aacute;n puedas agregar el nombre del usuario como palabra clave. ');

-- ----------------------------
-- Table structure for `faqscat_translated`
-- ----------------------------
DROP TABLE IF EXISTS `faqscat_translated`;
CREATE TABLE `faqscat_translated` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang` char(2) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of faqscat_translated
-- ----------------------------
INSERT INTO `faqscat_translated` VALUES ('3', 'EN', 'Buying');
INSERT INTO `faqscat_translated` VALUES ('3', 'ES', 'Comprar');
INSERT INTO `faqscat_translated` VALUES ('1', 'EN', 'General');
INSERT INTO `faqscat_translated` VALUES ('1', 'ES', 'General');
INSERT INTO `faqscat_translated` VALUES ('2', 'EN', 'Selling');
INSERT INTO `faqscat_translated` VALUES ('2', 'ES', 'Vender');

-- ----------------------------
-- Table structure for `faqscategories`
-- ----------------------------
DROP TABLE IF EXISTS `faqscategories`;
CREATE TABLE `faqscategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of faqscategories
-- ----------------------------
INSERT INTO `faqscategories` VALUES ('1', 'General');
INSERT INTO `faqscategories` VALUES ('2', 'Selling');
INSERT INTO `faqscategories` VALUES ('3', 'Buying');

-- ----------------------------
-- Table structure for `feedbacks`
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rated_user_id` int(32) DEFAULT NULL,
  `rater_user_nick` varchar(20) DEFAULT NULL,
  `feedback` mediumtext,
  `rate` int(2) DEFAULT NULL,
  `feedbackdate` int(15) NOT NULL,
  `auction_id` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------

-- ----------------------------
-- Table structure for `fees`
-- ----------------------------
DROP TABLE IF EXISTS `fees`;
CREATE TABLE `fees` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `fee_from` double(16,4) NOT NULL DEFAULT '0.0000',
  `fee_to` double(16,4) NOT NULL DEFAULT '0.0000',
  `fee_type` enum('flat','perc') NOT NULL DEFAULT 'flat',
  `value` double(8,4) NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fees
-- ----------------------------
INSERT INTO `fees` VALUES ('1', '0.0000', '0.0000', 'flat', '0.0000', 'signup_fee');
INSERT INTO `fees` VALUES ('2', '0.0000', '0.0000', 'flat', '0.0000', 'buyer_fee');
INSERT INTO `fees` VALUES ('3', '0.0000', '0.0000', 'flat', '0.0000', 'setup');
INSERT INTO `fees` VALUES ('4', '0.0000', '0.0000', 'flat', '0.0000', 'hpfeat_fee');
INSERT INTO `fees` VALUES ('5', '0.0000', '0.0000', 'flat', '0.0000', 'bolditem_fee');
INSERT INTO `fees` VALUES ('6', '0.0000', '0.0000', 'flat', '0.0000', 'hlitem_fee');
INSERT INTO `fees` VALUES ('7', '0.0000', '0.0000', 'flat', '0.0000', 'rp_fee');
INSERT INTO `fees` VALUES ('8', '0.0000', '0.0000', 'flat', '0.0000', 'picture_fee');
INSERT INTO `fees` VALUES ('9', '0.0000', '0.0000', 'flat', '0.0000', 'subtitle_fee');
INSERT INTO `fees` VALUES ('10', '0.0000', '0.0000', 'flat', '0.0000', 'excat_fee');
INSERT INTO `fees` VALUES ('11', '0.0000', '0.0000', 'flat', '0.0000', 'relist_fee');
INSERT INTO `fees` VALUES ('12', '0.0000', '0.0000', 'flat', '0.0000', 'buyout_fee');
INSERT INTO `fees` VALUES ('13', '0.0000', '0.0000', 'flat', '0.0000', 'endauc_fee');

-- ----------------------------
-- Table structure for `filterwords`
-- ----------------------------
DROP TABLE IF EXISTS `filterwords`;
CREATE TABLE `filterwords` (
  `word` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filterwords
-- ----------------------------
INSERT INTO `filterwords` VALUES ('');

-- ----------------------------
-- Table structure for `gateways`
-- ----------------------------
DROP TABLE IF EXISTS `gateways`;
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

-- ----------------------------
-- Records of gateways
-- ----------------------------
INSERT INTO `gateways` VALUES ('paypal,authnet,worldpay,moneybookers,toocheckout', '', '0', '1', '', '', '0', '1', '', '0', '1', '', '0', '1', '', '0', '1');

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_sell` int(1) NOT NULL DEFAULT '0',
  `can_buy` int(1) NOT NULL DEFAULT '0',
  `count` int(15) NOT NULL DEFAULT '0',
  `auto_join` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'Sellers', '1', '0', '0', '1');
INSERT INTO `groups` VALUES ('2', 'Buyers', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `img_id` int(6) NOT NULL AUTO_INCREMENT,
  `ass_id` int(6) NOT NULL,
  `url` varchar(40) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', '1', '../../assets/images/add1.jpg');
INSERT INTO `images` VALUES ('2', '2', '../../assets/images/add2.jpg');
INSERT INTO `images` VALUES ('3', '3', '../../assets/images/m4.png');

-- ----------------------------
-- Table structure for `images_all`
-- ----------------------------
DROP TABLE IF EXISTS `images_all`;
CREATE TABLE `images_all` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  ` img_id` int(6) NOT NULL,
  `url` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images_all
-- ----------------------------
INSERT INTO `images_all` VALUES ('1', '1', '../../assets/add1.jpg');
INSERT INTO `images_all` VALUES ('2', '1', '../../assets/add2.jpg');
INSERT INTO `images_all` VALUES ('3', '1', '../../assets/images/m5.png');

-- ----------------------------
-- Table structure for `increments`
-- ----------------------------
DROP TABLE IF EXISTS `increments`;
CREATE TABLE `increments` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `low` double(16,4) DEFAULT NULL,
  `high` double(16,4) DEFAULT NULL,
  `increment` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of increments
-- ----------------------------
INSERT INTO `increments` VALUES ('1', '0.0000', '0.9900', '0.2800');
INSERT INTO `increments` VALUES ('2', '1.0000', '9.9900', '0.5000');
INSERT INTO `increments` VALUES ('3', '10.0000', '29.9900', '1.0000');
INSERT INTO `increments` VALUES ('4', '30.0000', '99.9900', '2.0000');
INSERT INTO `increments` VALUES ('5', '100.0000', '249.9900', '5.0000');
INSERT INTO `increments` VALUES ('6', '250.0000', '499.9900', '10.0000');
INSERT INTO `increments` VALUES ('7', '500.0000', '999.9900', '25.0000');

-- ----------------------------
-- Table structure for `inventory_status`
-- ----------------------------
DROP TABLE IF EXISTS `inventory_status`;
CREATE TABLE `inventory_status` (
  `ins_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ins_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ins_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventory_status
-- ----------------------------

-- ----------------------------
-- Table structure for `job_title`
-- ----------------------------
DROP TABLE IF EXISTS `job_title`;
CREATE TABLE `job_title` (
  `jot_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `jot_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of job_title
-- ----------------------------

-- ----------------------------
-- Table structure for `lms_user`
-- ----------------------------
DROP TABLE IF EXISTS `lms_user`;
CREATE TABLE `lms_user` (
  `use_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`use_id`),
  KEY `per_id_idx` (`pem_id`),
  KEY `ust_id_idx` (`ust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_user
-- ----------------------------

-- ----------------------------
-- Table structure for `location_costing`
-- ----------------------------
DROP TABLE IF EXISTS `location_costing`;
CREATE TABLE `location_costing` (
  `lcc_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `wor_id` smallint(6) DEFAULT NULL COMMENT 'FK: work_type',
  `meu_id` smallint(6) DEFAULT NULL,
  `lcc_quantity` int(11) DEFAULT NULL,
  `lcc_unit_price_SCY` float DEFAULT NULL,
  `lcc_total_price_SCY` float DEFAULT NULL,
  `lcc_total_billed_SCY` float DEFAULT NULL,
  `lcc_billable_percentage` float DEFAULT NULL,
  `lcc_unit_cost_BCY` float DEFAULT NULL,
  `lcc_total_cost_BCY` float DEFAULT NULL,
  `lcc_total_invoiced` float DEFAULT NULL,
  PRIMARY KEY (`lcc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_costing
-- ----------------------------

-- ----------------------------
-- Table structure for `location_direction`
-- ----------------------------
DROP TABLE IF EXISTS `location_direction`;
CREATE TABLE `location_direction` (
  `ldi_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ldi_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ldi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_direction
-- ----------------------------

-- ----------------------------
-- Table structure for `location_gender`
-- ----------------------------
DROP TABLE IF EXISTS `location_gender`;
CREATE TABLE `location_gender` (
  `log_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `log_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_gender
-- ----------------------------

-- ----------------------------
-- Table structure for `location_group`
-- ----------------------------
DROP TABLE IF EXISTS `location_group`;
CREATE TABLE `location_group` (
  `lgr_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lgr_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lgr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_group
-- ----------------------------

-- ----------------------------
-- Table structure for `location_owner_type`
-- ----------------------------
DROP TABLE IF EXISTS `location_owner_type`;
CREATE TABLE `location_owner_type` (
  `lwt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lwt_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lwt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_owner_type
-- ----------------------------

-- ----------------------------
-- Table structure for `location_photo_type`
-- ----------------------------
DROP TABLE IF EXISTS `location_photo_type`;
CREATE TABLE `location_photo_type` (
  `lpt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lpt_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lpt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_photo_type
-- ----------------------------

-- ----------------------------
-- Table structure for `location_position`
-- ----------------------------
DROP TABLE IF EXISTS `location_position`;
CREATE TABLE `location_position` (
  `lop_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `met_id` smallint(6) DEFAULT NULL,
  `lop_description` varchar(255) DEFAULT NULL,
  `lop_media_description` varchar(255) DEFAULT NULL,
  `lop_risk_calculation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`lop_id`),
  KEY `met_id_idx` (`met_id`),
  CONSTRAINT `met_id` FOREIGN KEY (`met_id`) REFERENCES `medium_type` (`met_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_position
-- ----------------------------

-- ----------------------------
-- Table structure for `location_rating`
-- ----------------------------
DROP TABLE IF EXISTS `location_rating`;
CREATE TABLE `location_rating` (
  `lor_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lor_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_rating
-- ----------------------------

-- ----------------------------
-- Table structure for `location_road_orientation`
-- ----------------------------
DROP TABLE IF EXISTS `location_road_orientation`;
CREATE TABLE `location_road_orientation` (
  `lro_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lro_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_road_orientation
-- ----------------------------

-- ----------------------------
-- Table structure for `location_status`
-- ----------------------------
DROP TABLE IF EXISTS `location_status`;
CREATE TABLE `location_status` (
  `lss_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lss_description` varchar(255) DEFAULT NULL,
  `lss_voided` tinyint(4) DEFAULT NULL,
  `lss_start_date` datetime DEFAULT NULL,
  `lss_end_date` datetime DEFAULT NULL,
  `lsd_id` smallint(6) DEFAULT NULL COMMENT 'FK: location_status_document',
  PRIMARY KEY (`lss_id`),
  KEY `lsd_id_idx` (`lsd_id`),
  CONSTRAINT `lsd_id` FOREIGN KEY (`lsd_id`) REFERENCES `location_status_document` (`lsd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_status
-- ----------------------------

-- ----------------------------
-- Table structure for `location_status_document`
-- ----------------------------
DROP TABLE IF EXISTS `location_status_document`;
CREATE TABLE `location_status_document` (
  `lsd_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lsd_url` varchar(255) DEFAULT NULL,
  `lsd_number` varchar(255) DEFAULT NULL,
  `lsd_version` varchar(255) DEFAULT NULL,
  `dos_id` smallint(6) DEFAULT NULL COMMENT 'FK: document_status',
  `lsd_description` varchar(255) DEFAULT NULL,
  `lsd_creator` smallint(6) DEFAULT NULL,
  `lsd_creation_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lsd_id`),
  KEY `dos_id_idx` (`dos_id`),
  CONSTRAINT `dos_id` FOREIGN KEY (`dos_id`) REFERENCES `document_status` (`dos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_status_document
-- ----------------------------

-- ----------------------------
-- Table structure for `location_type`
-- ----------------------------
DROP TABLE IF EXISTS `location_type`;
CREATE TABLE `location_type` (
  `lot_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lot_description` varchar(255) DEFAULT NULL,
  `mec_id` smallint(6) DEFAULT NULL COMMENT 'FK: madia_category',
  `lot_description2` varchar(255) DEFAULT NULL,
  `lot_telmar_code` varchar(255) DEFAULT NULL,
  `lot_medium_link` tinyint(4) DEFAULT NULL,
  `lot_base_rate` float DEFAULT NULL,
  PRIMARY KEY (`lot_id`),
  KEY `mec_id_idx` (`mec_id`),
  CONSTRAINT `mec_id` FOREIGN KEY (`mec_id`) REFERENCES `media_category` (`mec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location_type
-- ----------------------------
INSERT INTO `location_type` VALUES ('1', 'suburb', null, null, null, null, null);

-- ----------------------------
-- Table structure for `maintainance`
-- ----------------------------
DROP TABLE IF EXISTS `maintainance`;
CREATE TABLE `maintainance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` enum('y','n') DEFAULT NULL,
  `superuser` varchar(32) DEFAULT NULL,
  `maintainancetext` text,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of maintainance
-- ----------------------------
INSERT INTO `maintainance` VALUES ('1', 'n', 'renlok', '<br>\r\n<center>\r\n<b>Under maintainance!!!!!!!</b>\r\n</center>');

-- ----------------------------
-- Table structure for `markers`
-- ----------------------------
DROP TABLE IF EXISTS `markers`;
CREATE TABLE `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of markers
-- ----------------------------

-- ----------------------------
-- Table structure for `market_type`
-- ----------------------------
DROP TABLE IF EXISTS `market_type`;
CREATE TABLE `market_type` (
  `mat_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `mat_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of market_type
-- ----------------------------

-- ----------------------------
-- Table structure for `master_medium_type`
-- ----------------------------
DROP TABLE IF EXISTS `master_medium_type`;
CREATE TABLE `master_medium_type` (
  `mam_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `met_description` varchar(255) DEFAULT NULL,
  `met_sequence` varchar(255) DEFAULT NULL,
  `met_auto_editions` tinyint(4) DEFAULT NULL,
  `met_editions_mandatory` tinyint(4) DEFAULT NULL,
  `mef_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`mam_id`),
  KEY `mef_id_idx` (`mef_id`),
  CONSTRAINT `mef_id` FOREIGN KEY (`mef_id`) REFERENCES `media_family` (`mef_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_medium_type
-- ----------------------------
INSERT INTO `master_medium_type` VALUES ('1', 'print (traditional)', null, null, null, '2');
INSERT INTO `master_medium_type` VALUES ('2', 'street assets (digital)', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('3', 'street assets (traditional)', null, null, null, '2');
INSERT INTO `master_medium_type` VALUES ('6', 'airport (digital)', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('7', 'airport (traditional)', null, null, null, '2');
INSERT INTO `master_medium_type` VALUES ('8', 'outdoor (digital)', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('9', 'outdoor (traditional)', null, null, null, '2');
INSERT INTO `master_medium_type` VALUES ('10', 'online', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('11', 'transit (digital)', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('12', 'transit (traditional)', null, null, null, '2');
INSERT INTO `master_medium_type` VALUES ('13', 'radio', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('14', 'television', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('15', 'Indoor (digital)', null, null, null, '1');
INSERT INTO `master_medium_type` VALUES ('16', 'Indoor (traditional)', null, null, null, '2');

-- ----------------------------
-- Table structure for `measurement_unit`
-- ----------------------------
DROP TABLE IF EXISTS `measurement_unit`;
CREATE TABLE `measurement_unit` (
  `meu_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `meu_description` varchar(255) DEFAULT NULL,
  `meu_code` varchar(255) DEFAULT NULL,
  `meu_unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`meu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of measurement_unit
-- ----------------------------
INSERT INTO `measurement_unit` VALUES ('1', 'second', 'SEC', 'second');
INSERT INTO `measurement_unit` VALUES ('2', 'minute', 'MIN', 'minute');
INSERT INTO `measurement_unit` VALUES ('3', 'hour', 'HR', 'hour');
INSERT INTO `measurement_unit` VALUES ('4', 'day', 'DAY', 'day');
INSERT INTO `measurement_unit` VALUES ('5', 'week', 'WK', 'week');
INSERT INTO `measurement_unit` VALUES ('6', 'fortnight', 'FTN', 'fortnight');
INSERT INTO `measurement_unit` VALUES ('7', 'month', 'MONTH', 'month');
INSERT INTO `measurement_unit` VALUES ('8', 'year', 'YR', 'year');
INSERT INTO `measurement_unit` VALUES ('9', 'centimeter', 'CM', 'centimeter');
INSERT INTO `measurement_unit` VALUES ('10', 'meter', 'M', 'metre');
INSERT INTO `measurement_unit` VALUES ('11', 'inch', '\"', 'inch');
INSERT INTO `measurement_unit` VALUES ('12', 'kilometer', 'KM', 'kilometer');

-- ----------------------------
-- Table structure for `media_category`
-- ----------------------------
DROP TABLE IF EXISTS `media_category`;
CREATE TABLE `media_category` (
  `mec_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`mec_id`),
  KEY `mam_id_idx` (`mam_id`),
  CONSTRAINT `mam_id` FOREIGN KEY (`mam_id`) REFERENCES `master_medium_type` (`mam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of media_category
-- ----------------------------
INSERT INTO `media_category` VALUES ('1', 'poster', '1', null, null, null, '0', null, '0', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('2', 'bench', '2', null, null, null, '0', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('3', 'bus (Digital)', '2', null, null, null, '1', null, '0', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('4', 'bus (Traditional)', '3', null, null, null, '1', null, '0', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('5', 'street pole (Digital)', '2', null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('6', 'street pole (Traditional)', '3', null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('7', 'bill board (Digital)', '2', null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('8', 'bill board (Traditional)', '3', null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('9', 'taxi tv digital network', '2', null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('10', 'cafe digital network', '2', null, null, null, '1', null, '1', null, null, null, null, null);
INSERT INTO `media_category` VALUES ('11', 'magazine advert ', '1', null, null, null, '0', null, '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `media_family`
-- ----------------------------
DROP TABLE IF EXISTS `media_family`;
CREATE TABLE `media_family` (
  `mef_id` smallint(6) NOT NULL,
  `mef_description` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`mef_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of media_family
-- ----------------------------
INSERT INTO `media_family` VALUES ('1', 'digital');
INSERT INTO `media_family` VALUES ('2', 'traditional');
INSERT INTO `media_family` VALUES ('3', 'print');

-- ----------------------------
-- Table structure for `membertypes`
-- ----------------------------
DROP TABLE IF EXISTS `membertypes`;
CREATE TABLE `membertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedbacks` int(11) NOT NULL DEFAULT '0',
  `membertype` varchar(30) NOT NULL DEFAULT '',
  `discount` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of membertypes
-- ----------------------------
INSERT INTO `membertypes` VALUES ('14', '49', '10', '0', 'starY.gif');
INSERT INTO `membertypes` VALUES ('15', '99', '50', '0', 'starB.gif');
INSERT INTO `membertypes` VALUES ('16', '999', '100', '0', 'starT.gif');
INSERT INTO `membertypes` VALUES ('17', '4999', '1000', '0', 'starR.gif');
INSERT INTO `membertypes` VALUES ('19', '24999', '10000', '0', 'starFY.gif');
INSERT INTO `membertypes` VALUES ('20', '49999', '25000', '0', 'starFT.gif');
INSERT INTO `membertypes` VALUES ('21', '99999', '50000', '0', 'starFV.gif');
INSERT INTO `membertypes` VALUES ('22', '999999', '100000', '0', 'starFR.gif');
INSERT INTO `membertypes` VALUES ('23', '9999', '5000', '0', 'starG.gif');
INSERT INTO `membertypes` VALUES ('24', '9', '', '0', 'transparent.gif');

-- ----------------------------
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
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
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('1', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '1', 'This is a test emil', '1', '0', '0', '0', '2014-12-07 23:25:03');
INSERT INTO `messages` VALUES ('2', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '1', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('3', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '1', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('4', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '0', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('5', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '0', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('6', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '0', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('7', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '0', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('8', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '0', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('9', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '1', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('10', '7', '7', '.', '0', 'This is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil', '1', 'This is a test emil', '1', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('11', '8', '7', '.', '0', 'This is a test emil 2', '0', 'This is a test emil', '0', '0', '0', '0', '2014-11-25 14:34:19');
INSERT INTO `messages` VALUES ('12', '9', '7', '.', '0', 'This is a test sent messages', '0', 'This is a test sent messages', '0', '0', '0', '0', '0000-00-00 00:00:00');
INSERT INTO `messages` VALUES ('13', '7', '9', '.', '0', 'Sample message to the advertiser from Simon\r\nSample message to the advertiser from Simon\r\n\r\nSample message to the advertiser from Simon\r\nSample message to the advertiser from Simon', '0', 'Sample message to the advertiser from Simon', '0', '0', '0', '1', '0000-00-00 00:00:00');
INSERT INTO `messages` VALUES ('14', '9', '5', '.', '0', 'Good day buyer,\n\nPlease note that i have 2 billboards that are in a prime location in the Sandton CBD available from December 1st till Jan 31st 2015 and will be putting these on auction.\n\nLet me know if you want these so I can try to reserve them for you.\n\nRegards\nMedia Owner', '0', 'I have new billboards in sandton', '0', '0', '0', '0', '0000-00-00 00:00:00');
INSERT INTO `messages` VALUES ('15', '7', '7', '.', '0', 'This is a reply to the original email\n\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-11-25 14:34:19\nTo: <developer,advertiser> \nSubject: This is a test emil\n\nThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil\n\n=====================================================', '1', 'RE:This is a test emil ', '0', '1', '0', '0', '0000-00-00 00:00:00');
INSERT INTO `messages` VALUES ('16', '7', '7', '.', '0', 'Replied\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-11-25 14:34:19\nTo: <developer,advertiser> \nSubject: This is a test emil\n\nThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emilThis is a test emil\n\n=====================================================', '0', 'RE:This is a test emil', '0', '10', '0', '0', '0000-00-00 00:00:00');
INSERT INTO `messages` VALUES ('17', '8', '7', '.', '0', 'Looking for BillboardsLooking for BillboardsLooking for BillboardsLooking for Billboards\nLooking for BillboardsLooking for Billboards', '1', 'Looking for Billboards', '1', '0', '0', '0', '2014-12-07 23:28:47');
INSERT INTO `messages` VALUES ('18', '6', '7', '.', '0', 'FYI\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-12-07 23:28:47\nTo: <developer,media owner> \nSubject: Looking for Billboards\n\nLooking for BillboardsLooking for BillboardsLooking for BillboardsLooking for Billboards\nLooking for BillboardsLooking for Billboards\n\n=====================================================', '1', 'FWD:Looking for Billboards', '1', '17', '0', '0', '2014-12-07 23:31:24');
INSERT INTO `messages` VALUES ('19', '7', '6', '.', '0', 'Got it,\n\nThanks!\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-12-07 23:31:24\nTo: <developer,advertiser> \nSubject: FWD:Looking for Billboards\n\nFYI\n\n=====================================================\nFrom: <developer,advertiser> Date/Time:2014-12-07 23:28:47\nTo: <developer,media owner> \nSubject: Looking for Billboards\n\nLooking for BillboardsLooking for BillboardsLooking for BillboardsLooking for Billboards\nLooking for BillboardsLooking for Billboards\n\n=====================================================\n\n=====================================================', '1', 'RE:FWD:Looking for Billboards', '0', '18', '0', '0', '2014-12-08 00:21:56');
INSERT INTO `messages` VALUES ('20', '5', '6', '.', '0', 'testing from bless', '0', 'testing from bless', '0', '0', '0', '0', '0000-00-00 00:00:00');
INSERT INTO `messages` VALUES ('21', '8', '7', '.', '0', 'This is a test', '0', 'Hello world', '0', '0', '0', '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `messages_cc`
-- ----------------------------
DROP TABLE IF EXISTS `messages_cc`;
CREATE TABLE `messages_cc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `sentto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messages_cc
-- ----------------------------
INSERT INTO `messages_cc` VALUES ('1', '2', '10');
INSERT INTO `messages_cc` VALUES ('2', '9', '10');
INSERT INTO `messages_cc` VALUES ('3', '10', '10');
INSERT INTO `messages_cc` VALUES ('4', '14', '10');
INSERT INTO `messages_cc` VALUES ('5', '18', '7');
INSERT INTO `messages_cc` VALUES ('6', '19', '8');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `news_date` datetime NOT NULL,
  `suspended` int(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('16', 'New Campaign Sample', 'News feed content. Test', '2014-10-10 00:00:00', '1', '2014-10-19 02:48:12', '2014-12-11 07:38:46');
INSERT INTO `news` VALUES ('17', 'Developer Test', 'This is a test feed', '0000-00-00 00:00:00', '1', '2014-11-14 11:17:42', '2014-12-11 07:40:49');
INSERT INTO `news` VALUES ('18', 'trymore test', 'trymore test', '0000-00-00 00:00:00', '0', '2014-12-11 07:42:10', '2014-12-11 07:42:10');

-- ----------------------------
-- Table structure for `news_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `news_group_access`;
CREATE TABLE `news_group_access` (
  `news_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`user_type_id`),
  CONSTRAINT `NEWS_GROUP_IDX` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_group_access
-- ----------------------------
INSERT INTO `news_group_access` VALUES ('16', '1');
INSERT INTO `news_group_access` VALUES ('16', '2');
INSERT INTO `news_group_access` VALUES ('16', '3');
INSERT INTO `news_group_access` VALUES ('17', '1');
INSERT INTO `news_group_access` VALUES ('18', '1');
INSERT INTO `news_group_access` VALUES ('18', '2');
INSERT INTO `news_group_access` VALUES ('18', '3');

-- ----------------------------
-- Table structure for `news_translated`
-- ----------------------------
DROP TABLE IF EXISTS `news_translated`;
CREATE TABLE `news_translated` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang` char(2) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of news_translated
-- ----------------------------

-- ----------------------------
-- Table structure for `online`
-- ----------------------------
DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `ID` bigint(21) NOT NULL AUTO_INCREMENT,
  `SESSION` varchar(32) NOT NULL DEFAULT '',
  `time` bigint(21) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of online
-- ----------------------------
INSERT INTO `online` VALUES ('35', 'uId-2', '1407880072');

-- ----------------------------
-- Table structure for `operator_status`
-- ----------------------------
DROP TABLE IF EXISTS `operator_status`;
CREATE TABLE `operator_status` (
  `ops_status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ops_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ops_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of operator_status
-- ----------------------------

-- ----------------------------
-- Table structure for `owner_status`
-- ----------------------------
DROP TABLE IF EXISTS `owner_status`;
CREATE TABLE `owner_status` (
  `ows_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ows_description` varchar(255) DEFAULT NULL,
  `ows_authorization` tinyint(4) DEFAULT NULL,
  `ows_update_authorization` tinyint(4) DEFAULT NULL,
  `ost_id` smallint(6) DEFAULT NULL COMMENT 'FK: owner_status_type',
  `ows_import_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ows_id`),
  KEY `ost_id_idx` (`ost_id`),
  CONSTRAINT `ost_id` FOREIGN KEY (`ost_id`) REFERENCES `owner_status_type` (`ost_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of owner_status
-- ----------------------------

-- ----------------------------
-- Table structure for `owner_status_type`
-- ----------------------------
DROP TABLE IF EXISTS `owner_status_type`;
CREATE TABLE `owner_status_type` (
  `ost_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ost_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of owner_status_type
-- ----------------------------

-- ----------------------------
-- Table structure for `payment_agreement`
-- ----------------------------
DROP TABLE IF EXISTS `payment_agreement`;
CREATE TABLE `payment_agreement` (
  `pay_id` tinyint(4) DEFAULT NULL,
  `pay_code` varchar(255) DEFAULT NULL,
  `pay_description` varchar(255) DEFAULT NULL,
  `bal_account_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for `payment_method`
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `pam_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pam_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_method
-- ----------------------------

-- ----------------------------
-- Table structure for `pendingnotif`
-- ----------------------------
DROP TABLE IF EXISTS `pendingnotif`;
CREATE TABLE `pendingnotif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `winners` text NOT NULL,
  `auction` text NOT NULL,
  `seller` text NOT NULL,
  `thisdate` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pendingnotif
-- ----------------------------

-- ----------------------------
-- Table structure for `proposal`
-- ----------------------------
DROP TABLE IF EXISTS `proposal`;
CREATE TABLE `proposal` (
  `pro_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  `p_assets` varchar(120) NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `rfp_id_idx` (`cam_id`),
  KEY `med_id_idx` (`med_id`),
  KEY `con_id_idx` (`con_id`),
  KEY `ope_id_idx` (`ope_id`),
  KEY `pro_status_id_idx` (`pro_status_id`),
  KEY `prb_id_idx` (`prb_id`),
  KEY `met_id_idx` (`met_id`),
  KEY `pro_creator_use_id_idx` (`pro_creator_use_id`),
  KEY `prt_id_idx` (`prt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proposal
-- ----------------------------
INSERT INTO `proposal` VALUES ('1', '74', null, null, null, null, null, null, '2014-10-25 00:00:00', null, null, null, null, null, null, null, '28.11585880000007', '-26.1948812', ',16');
INSERT INTO `proposal` VALUES ('2', '75', '5', null, null, '1', null, null, '2014-12-11 08:51:38', null, null, null, null, null, null, null, '-99.13320799999997', '19.4326077', ',6');
INSERT INTO `proposal` VALUES ('3', '70', '8', null, null, null, null, null, '2014-11-08 00:00:00', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',15');
INSERT INTO `proposal` VALUES ('4', '70', '5', null, null, null, null, null, '2014-11-08 00:00:00', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',16');
INSERT INTO `proposal` VALUES ('5', '73', '5', null, null, null, null, null, '2014-11-13 00:00:00', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',14');
INSERT INTO `proposal` VALUES ('6', '76', '5', null, null, null, null, null, '2014-11-22 00:00:00', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',1');
INSERT INTO `proposal` VALUES ('7', '76', '8', null, null, null, null, null, '2014-11-22 00:00:00', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',7,8');
INSERT INTO `proposal` VALUES ('8', '80', '8', null, null, null, null, null, '2015-01-04 00:00:00', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',9,15');
INSERT INTO `proposal` VALUES ('9', '80', '5', null, null, null, null, null, '2015-01-04 19:50:13', null, null, null, null, null, null, null, '28.056700699999965', '-26.1075663', ',16,9,15');
INSERT INTO `proposal` VALUES ('10', '150', '5', null, null, '1', null, null, '2015-01-10 18:10:45', null, null, null, null, null, null, null, '28.006389', '-26.093611', ',4,11');

-- ----------------------------
-- Table structure for `proposal_details`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_details`;
CREATE TABLE `proposal_details` (
  `trans_id` int(10) NOT NULL AUTO_INCREMENT,
  `pd_use_id` int(10) NOT NULL,
  `pd_ass_id` int(10) NOT NULL,
  `pd_available_from` int(2) NOT NULL,
  `pd_available_to` int(2) NOT NULL,
  `pd_price` decimal(15,2) NOT NULL,
  `pd_prop_id` int(10) NOT NULL,
  `pd_date` date NOT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proposal_details
-- ----------------------------
INSERT INTO `proposal_details` VALUES ('1', '8', '9', '46', '47', '2000.00', '3', '2014-11-05');
INSERT INTO `proposal_details` VALUES ('2', '8', '15', '46', '48', '2000.00', '3', '2014-11-05');
INSERT INTO `proposal_details` VALUES ('3', '5', '6', '50', '51', '5000.00', '2', '2014-12-11');
INSERT INTO `proposal_details` VALUES ('4', '5', '11', '3', '3', '6500.00', '10', '2015-01-10');
INSERT INTO `proposal_details` VALUES ('5', '5', '4', '3', '3', '5000.00', '10', '2015-01-10');

-- ----------------------------
-- Table structure for `proposal_number_specification`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_number_specification`;
CREATE TABLE `proposal_number_specification` (
  `pns_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pns_starting_date` date DEFAULT NULL,
  `pns_last_date_used` date DEFAULT NULL,
  `pns_starting_number` varchar(255) DEFAULT NULL,
  `pns_ending_number` varchar(255) DEFAULT NULL,
  `pns_warning_number` varchar(255) DEFAULT NULL,
  `pns_increment_number` int(11) DEFAULT NULL,
  `pns_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proposal_number_specification
-- ----------------------------

-- ----------------------------
-- Table structure for `proposal_status`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_status`;
CREATE TABLE `proposal_status` (
  `pro_status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prs_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pro_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proposal_status
-- ----------------------------
INSERT INTO `proposal_status` VALUES ('1', 'Proposal Sent To Media Owner');
INSERT INTO `proposal_status` VALUES ('2', 'Proposal Sent Back To Operator');
INSERT INTO `proposal_status` VALUES ('3', 'Proposal Sent Back To Media Owner For Corrections');
INSERT INTO `proposal_status` VALUES ('4', 'Artwork Required');

-- ----------------------------
-- Table structure for `proposal_type`
-- ----------------------------
DROP TABLE IF EXISTS `proposal_type`;
CREATE TABLE `proposal_type` (
  `prt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prt_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proposal_type
-- ----------------------------

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `pro_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(255) DEFAULT NULL,
  `cou_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cou_id_idx` (`cou_id`),
  CONSTRAINT `cou_id` FOREIGN KEY (`cou_id`) REFERENCES `country` (`cou_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('3', 'Gauteng', '1');
INSERT INTO `province` VALUES ('4', 'KwaZulu-Natal', '1');
INSERT INTO `province` VALUES ('5', 'Limpopo', '1');
INSERT INTO `province` VALUES ('6', 'Mpumalanga', '1');
INSERT INTO `province` VALUES ('7', 'North West', '1');
INSERT INTO `province` VALUES ('8', 'Northern Cape', '1');
INSERT INTO `province` VALUES ('9', 'Western Cape', '1');

-- ----------------------------
-- Table structure for `proxybid`
-- ----------------------------
DROP TABLE IF EXISTS `proxybid`;
CREATE TABLE `proxybid` (
  `itemid` int(32) DEFAULT NULL,
  `userid` int(32) DEFAULT NULL,
  `bid` double(16,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proxybid
-- ----------------------------

-- ----------------------------
-- Table structure for `rate_card`
-- ----------------------------
DROP TABLE IF EXISTS `rate_card`;
CREATE TABLE `rate_card` (
  `rat_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  `rat_end_date` date DEFAULT NULL,
  PRIMARY KEY (`rat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate_card
-- ----------------------------
INSERT INTO `rate_card` VALUES ('1', 'Premium ', '122', '1', null, '5', '100', null, '7', null, '10', null, '5', null, null, null, null, null);

-- ----------------------------
-- Table structure for `rate_card_bk_2014-11-22`
-- ----------------------------
DROP TABLE IF EXISTS `rate_card_bk_2014-11-22`;
CREATE TABLE `rate_card_bk_2014-11-22` (
  `rat_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`rat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate_card_bk_2014-11-22
-- ----------------------------
INSERT INTO `rate_card_bk_2014-11-22` VALUES ('1', 'Premium ', '122', '1', null, '5', '100', null, '7', null, '10', null, '5', null, null, null);

-- ----------------------------
-- Table structure for `rate_card_loading_method`
-- ----------------------------
DROP TABLE IF EXISTS `rate_card_loading_method`;
CREATE TABLE `rate_card_loading_method` (
  `rlm_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `rlm_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rlm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate_card_loading_method
-- ----------------------------

-- ----------------------------
-- Table structure for `rate_card_status`
-- ----------------------------
DROP TABLE IF EXISTS `rate_card_status`;
CREATE TABLE `rate_card_status` (
  `ras_id` smallint(6) NOT NULL,
  `ras_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ras_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate_card_status
-- ----------------------------

-- ----------------------------
-- Table structure for `rate_type`
-- ----------------------------
DROP TABLE IF EXISTS `rate_type`;
CREATE TABLE `rate_type` (
  `rat_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `rat_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate_type
-- ----------------------------

-- ----------------------------
-- Table structure for `rates`
-- ----------------------------
DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` tinytext NOT NULL,
  `valuta` tinytext NOT NULL,
  `symbol` char(3) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rates
-- ----------------------------
INSERT INTO `rates` VALUES ('1', 'Great Britain', 'Pound Sterling ', 'GBP');
INSERT INTO `rates` VALUES ('2', 'Argentina', 'Argentinian Peso', 'ARS');
INSERT INTO `rates` VALUES ('3', 'Australia', 'Australian Dollar ', 'AUD');
INSERT INTO `rates` VALUES ('4', 'Burma', 'Myanmar (Burma) Kyat', 'MMK');
INSERT INTO `rates` VALUES ('5', 'Brazil', 'Brazilian Real ', 'BRL');
INSERT INTO `rates` VALUES ('6', 'Chile', 'Chilean Peso ', 'CLP');
INSERT INTO `rates` VALUES ('7', 'China', 'Chinese Renminbi ', 'CNY');
INSERT INTO `rates` VALUES ('8', 'Colombia', 'Colombian Peso ', 'COP');
INSERT INTO `rates` VALUES ('9', 'Neth. Antilles', 'Neth. Antilles Guilder', 'ANG');
INSERT INTO `rates` VALUES ('10', 'Czech. Republic', 'Czech. Republic Koruna ', 'CZK');
INSERT INTO `rates` VALUES ('11', 'Denmark', 'Danish Krone ', 'DKK');
INSERT INTO `rates` VALUES ('12', 'European Union', 'EURO', 'EUR');
INSERT INTO `rates` VALUES ('13', 'Fiji', 'Fiji Dollar ', 'FJD');
INSERT INTO `rates` VALUES ('14', 'Jamaica', 'Jamaican Dollar', 'JMD');
INSERT INTO `rates` VALUES ('15', 'Trinidad & Tobago', 'Trinidad & Tobago Dollar', 'TTD');
INSERT INTO `rates` VALUES ('16', 'Hong Kong', 'Hong Kong Dollar', 'HKD');
INSERT INTO `rates` VALUES ('17', 'Ghana', 'Ghanaian Cedi', 'GHC');
INSERT INTO `rates` VALUES ('18', 'Iceland', 'Icelandic Krona ', 'INR');
INSERT INTO `rates` VALUES ('19', 'India', 'Indian Rupee', 'INR');
INSERT INTO `rates` VALUES ('20', 'Indonesia', 'Indonesian Rupiah ', 'IDR');
INSERT INTO `rates` VALUES ('21', 'Israel', 'Israeli New Shekel ', 'ILS');
INSERT INTO `rates` VALUES ('22', 'Japan', 'Japanese Yen', 'JPY');
INSERT INTO `rates` VALUES ('23', 'Malaysia', 'Malaysian Ringgit', 'MYR');
INSERT INTO `rates` VALUES ('24', 'Mexico', 'New Peso', 'MXN');
INSERT INTO `rates` VALUES ('25', 'Morocco', 'Moroccan Dirham ', 'MAD');
INSERT INTO `rates` VALUES ('26', 'Honduras', 'Honduras Lempira', 'HNL');
INSERT INTO `rates` VALUES ('27', 'Hungaria', 'Hungarian Forint', 'HUF');
INSERT INTO `rates` VALUES ('28', 'New Zealand', 'New Zealand Dollar', 'NZD');
INSERT INTO `rates` VALUES ('29', 'Norway', 'Norwege Krone', 'NOK');
INSERT INTO `rates` VALUES ('30', 'Pakistan', 'Pakistan Rupee ', 'PKR');
INSERT INTO `rates` VALUES ('31', 'Panama', 'Panamanian Balboa ', 'PAB');
INSERT INTO `rates` VALUES ('32', 'Peru', 'Peruvian New Sol', 'PEN');
INSERT INTO `rates` VALUES ('33', 'Philippine', 'Philippine Peso ', 'PHP');
INSERT INTO `rates` VALUES ('34', 'Poland', 'Polish Zloty', 'PLN');
INSERT INTO `rates` VALUES ('35', 'Russian', 'Russian Rouble', 'RUR');
INSERT INTO `rates` VALUES ('36', 'Singapore', 'Singapore Dollar ', 'SGD');
INSERT INTO `rates` VALUES ('37', 'Slovakia', 'Koruna', 'SKK');
INSERT INTO `rates` VALUES ('38', 'Slovenia', 'Slovenian Tolar', 'SIT');
INSERT INTO `rates` VALUES ('39', 'South Africa', 'South African Rand', 'ZAR');
INSERT INTO `rates` VALUES ('40', 'South Korea', 'South Korean Won', 'KRW');
INSERT INTO `rates` VALUES ('41', 'Sri Lanka', 'Sri Lanka Rupee ', 'LKR');
INSERT INTO `rates` VALUES ('42', 'Sweden', 'Swedish Krona', 'SEK');
INSERT INTO `rates` VALUES ('43', 'Switzerland', 'Swiss Franc', 'CHF');
INSERT INTO `rates` VALUES ('44', 'Taiwan', 'Taiwanese New Dollar ', 'TWD');
INSERT INTO `rates` VALUES ('45', 'Thailand', 'Thailand Thai Baht ', 'THB');
INSERT INTO `rates` VALUES ('46', 'Pacific Financial Community', 'Pacific Financial Community Franc', 'CFP');
INSERT INTO `rates` VALUES ('47', 'Tunisia', 'Tunisisan Dinar', 'TND');
INSERT INTO `rates` VALUES ('48', 'Turkey', 'Turkish Lira', 'TRL');
INSERT INTO `rates` VALUES ('49', 'United States', 'U.S. Dollar', 'USD');
INSERT INTO `rates` VALUES ('50', 'Venezuela', 'Bolivar ', 'VEB');
INSERT INTO `rates` VALUES ('51', 'Bahamas', 'Bahamian Dollar', 'BSD');
INSERT INTO `rates` VALUES ('52', 'Croatia', 'Croatian Kuna', 'HRK');
INSERT INTO `rates` VALUES ('53', 'East Caribe', 'East Caribbean Dollar', 'XCD');
INSERT INTO `rates` VALUES ('54', 'CFA Franc (African Financial Community)', 'African Financial Community Franc', 'CFA');
INSERT INTO `rates` VALUES ('55', 'Canadian', 'Canadian Dollar', 'CAD');

-- ----------------------------
-- Table structure for `rememberme`
-- ----------------------------
DROP TABLE IF EXISTS `rememberme`;
CREATE TABLE `rememberme` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `hashkey` char(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rememberme
-- ----------------------------

-- ----------------------------
-- Table structure for `responsibility_center`
-- ----------------------------
DROP TABLE IF EXISTS `responsibility_center`;
CREATE TABLE `responsibility_center` (
  `rec_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `rec_name` varchar(255) DEFAULT NULL,
  `loc_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `loc_id_idx` (`loc_id`),
  CONSTRAINT `loc_id` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of responsibility_center
-- ----------------------------

-- ----------------------------
-- Table structure for `rfp`
-- ----------------------------
DROP TABLE IF EXISTS `rfp`;
CREATE TABLE `rfp` (
  `rfp_id` int(6) NOT NULL AUTO_INCREMENT,
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
  `p_assets` varchar(50) NOT NULL,
  PRIMARY KEY (`rfp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rfp
-- ----------------------------
INSERT INTO `rfp` VALUES ('3', '10000', '2014-09-04', '6', 'trymore test', 'ujkjok', '2014-09-04', '2014-09-04', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('4', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('5', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('6', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('7', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('8', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('9', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('10', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('11', '10000', '2014-09-05', '6', 'trymore test', 'impementation testing', '2014-09-05', '2014-09-05', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('32', '40000', '2014-09-19', '6', 'trymore test', 'efff', '2014-09-19', '2014-09-19', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('33', '40000', '2014-10-07', '6', 'trymore test', 'qsqs', '2014-10-07', '2014-10-07', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('34', '444444444', '2014-10-07', '6', 'trymore test', 'soft test', '2014-10-07', '2014-10-07', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('35', '444444444', '2014-10-07', '6', 'trymore test', 'soft test', '2014-10-07', '2014-10-07', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('36', '444444444', '2014-10-07', '6', 'trymore test', 'soft test', '2014-10-07', '2014-10-07', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('37', '444444444', '2014-10-07', '6', 'trymore test', 'soft test', '2014-10-07', '2014-10-07', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('38', '444444444', '2014-10-07', '6', 'trymore test', 'soft test', '2014-10-07', '2014-10-07', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('41', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('42', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('43', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('44', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('45', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('46', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('47', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('48', '200000', '2014-10-08', '6', 'trymore test', 'wdede', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('49', '5000000', '2014-10-08', '6', 'trymore test', 'rfrfrf', '2014-10-08', '2014-10-08', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('50', '5000000', '2014-10-09', '6', 'trymore test', 'r4r4r4', '2014-10-09', '2014-10-09', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('52', '5000000', '2014-10-09', '6', 'trymore test', 'www', '2014-10-09', '2014-10-09', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('53', '5000000', '2014-10-09', '6', 'trymore test', 'www', '2014-10-09', '2014-10-09', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('54', '90000000', '2014-10-09', '6', 'trymore test', 'soft test          ', '2014-10-09', '2014-10-09', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('55', '5000000', '2014-10-15', '6', 'trymore test', '                               trymore t', '2014-10-15', '2014-10-15', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('65', '200000', '2014-10-16', '6', 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('66', '200000', '2014-10-16', '6', 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('67', '200000', '2014-10-16', '6', 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('68', '200000', '2014-10-16', '6', 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('69', '200000', '2014-10-16', '6', 'trymore test', 'soft test                          ', '2014-10-16', '2014-10-16', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('70', '40000', '2014-10-16', '6', 'trymore test', 'testingi             ', '2014-10-16', '2014-10-16', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('71', '7500000', '2014-10-17', '6', 'trymore test', 'harare, zimbabwe                        ', '2014-10-17', '2014-10-17', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('72', '10000', '2014-10-17', '6', 'trymore test', 'fake                            ', '2014-10-17', '2014-10-17', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('73', '80000', '2014-10-17', '6', 'trymore test', 'very last test                          ', '2014-10-17', '2014-10-17', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('74', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('75', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('76', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('77', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('78', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('79', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('80', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('81', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('82', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('83', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('84', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('85', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('86', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('87', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('88', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('89', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('90', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('91', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('92', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('93', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('94', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('95', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('96', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('97', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('98', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('99', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('100', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('101', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('102', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('103', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('104', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('105', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('106', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('107', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('108', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('109', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('110', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('111', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('112', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('113', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('114', '3000', '2014-10-18', '5', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('115', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('116', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('117', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('118', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('119', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('120', '10000', '2014-10-18', '7', 'trymore test', 'ujkjok', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('121', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('122', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('123', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('124', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('125', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('126', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('127', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('128', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('129', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('130', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('131', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('132', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('133', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('134', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('135', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('136', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('137', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('138', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('139', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('140', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('141', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('142', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('143', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('144', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('145', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('146', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('147', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('148', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('149', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('150', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('151', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('152', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('153', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('154', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('155', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('156', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('157', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('158', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('159', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('160', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('161', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('162', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('163', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('164', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('165', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('166', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('167', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('168', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('169', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('170', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('171', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('172', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('173', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('174', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('175', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('176', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('177', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('178', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('179', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('180', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('181', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('182', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('183', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('184', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('185', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('186', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('187', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('188', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('189', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('190', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('191', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('192', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('193', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('194', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('195', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '0', '0');
INSERT INTO `rfp` VALUES ('196', '3000', '2014-10-18', '7', 'trymore test', 'All is OK', '2014-10-18', '2014-10-18', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('197', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('198', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('199', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('200', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('201', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('202', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('203', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('204', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('205', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('206', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('207', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('208', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('209', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('210', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('214', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('215', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('216', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('217', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('218', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('219', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('220', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('221', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('222', '3000', '2014-10-19', '5', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('223', '3000', '2014-10-19', '5', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('224', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('225', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('226', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('227', '3000', '2014-10-19', '5', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('228', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('229', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('230', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('231', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('232', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('233', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('234', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('235', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('236', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('237', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('238', '3000', '2014-10-19', '7', 'trymore test', 'All is OK', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('239', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('240', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('241', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('242', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('243', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('244', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('245', '450000', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('246', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('247', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('248', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('249', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('250', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('251', '0', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('252', '450000', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('253', '450000', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('254', '450000', '2014-10-19', '7', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('255', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('256', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('257', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('258', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('259', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('260', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('261', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('262', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('263', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('264', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('265', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('266', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('267', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('268', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('269', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('270', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('271', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('272', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('273', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('274', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('275', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('276', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('277', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('278', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('279', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('280', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('281', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('282', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('283', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('284', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('285', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('286', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('287', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('288', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('289', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('290', '10000000', '2014-10-19', '7', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('291', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('292', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('293', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('294', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('295', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('296', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('297', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('298', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('299', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('300', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('301', '10000000', '2014-10-19', '6', 'trymore test', 'Test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('302', '0', '2014-10-19', '5', 'trymore test', '<div style=', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('303', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('304', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('305', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('306', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('307', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('308', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('309', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('310', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('311', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('312', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('313', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('314', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('315', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('316', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('317', '450000', '2014-10-19', '7', 'trymore test', 'indigo test', '2014-10-19', '2014-10-19', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('318', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('319', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('320', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('321', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('322', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('323', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('324', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('325', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('326', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('327', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('328', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('329', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('330', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('331', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('332', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('333', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('334', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('335', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('336', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('337', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('338', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('339', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('340', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('341', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('342', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('343', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('344', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('345', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('346', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('347', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('348', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('349', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('350', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('351', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('352', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('353', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('354', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('355', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('356', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('357', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('358', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('359', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('360', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('361', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('362', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('363', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('364', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('365', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('366', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('367', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('368', '450000', '2014-10-20', '7', 'trymore test', 'indigo test', '2014-10-20', '2014-10-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('369', '90000000', '2014-11-09', '6', 'trymore test', '                              muvindi   ', '2014-11-09', '2014-11-09', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('370', '10000', '2014-11-11', '6', 'trymore test', '           dcdcd                        ', '2014-11-11', '2014-11-11', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('371', '5000000', '2014-11-12', '6', 'trymore test', '                  dedede                ', '2014-11-12', '2014-11-12', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('372', '55', '2014-11-13', '6', 'trymore test', '                                       h', '2014-11-13', '2014-11-13', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('373', '55', '2014-11-13', '6', 'trymore test', '                                       h', '2014-11-13', '2014-11-13', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('374', '90000000', '2014-11-14', '6', 'trymore test', 'soft test              ', '2014-11-14', '2014-11-14', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('375', '90000000', '2014-11-14', '6', 'trymore test', 'soft test              ', '2014-11-14', '2014-11-14', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('376', '10000', '2014-11-20', '6', 'trymore test', 'shdd', '2014-11-20', '2014-11-20', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('377', '20000', '2014-12-01', '7', 'trymore test', 'testing', '2014-12-01', '2014-12-01', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('378', '20000', '2014-12-01', '7', 'trymore test', 'testing', '2014-12-01', '2014-12-01', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('379', '20000', '2014-12-01', '7', 'trymore test', 'testing', '2014-12-01', '2014-12-01', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('380', '200000', '2014-12-02', '6', 'trymore test', ' test                                   ', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('381', '23', '2014-12-02', '6', 'trymore test', '                dsa                     ', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('382', '200000', '2014-12-02', '6', 'trymore test', ' test                                   ', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('384', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('385', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('386', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('387', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('388', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('389', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('390', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('391', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('392', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('393', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('394', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('395', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('396', '20000', '2014-12-02', '6', 'trymore test', 'testing', '2014-12-02', '2014-12-02', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('397', '20000', '2014-12-03', '7', 'trymore test', 'testing', '2014-12-03', '2014-12-03', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('398', '20000', '2014-12-03', '7', 'trymore test', 'testing', '2014-12-03', '2014-12-03', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('399', '5000', '2014-12-04', '7', 'TEST RFP 1', 'TEST Campaign 1', '2014-12-14', '2014-12-28', '1', '', '1', '', '');
INSERT INTO `rfp` VALUES ('400', '20000', '2014-12-03', '7', 'trymore test', 'testing', '2014-12-03', '2014-12-03', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('401', '20000', '2014-12-03', '7', 'trymore test', 'testing', '2014-12-03', '2014-12-03', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('402', '20000', '2014-12-03', '7', 'trymore test', 'testing', '2014-12-03', '2014-12-03', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('410', '20000', '2014-12-09', '7', 'trymore test', 'testing', '2014-12-09', '2014-12-09', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('412', '350000', '2014-12-31', '6', 'Liberty Hospital Cash back pla', 'Introducing the new liberty hopsital cas', '2014-11-30', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('413', '500000', '2014-12-29', '6', 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('414', '500000', '2014-12-29', '6', 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('415', '500000', '2014-12-29', '6', 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('416', '500000', '2014-12-29', '6', 'Clientelle Legal', 'The new Clientelle Legal scheme for dome', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('417', '200000', '2014-12-29', '6', 'trymore test', 'test stuff                              ', '2014-12-29', '2014-12-29', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('418', '350000', '2014-12-29', '6', 'trymore test', 'Google_Radio_TV_Youtube_Twitter_Other Ca', '2014-12-29', '2014-12-29', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('419', '350000', '2014-12-29', '6', 'trymore test', 'Google_Radio_TV_Youtube_Twitter_Other Ca', '2014-12-29', '2014-12-29', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('420', '200000', '2014-12-29', '6', 'trymore test', 'yes test                                ', '2014-12-29', '2014-12-29', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('421', '45000', '2014-12-30', '6', 'trymore test', 'Test 5  ', '2014-12-30', '2014-12-30', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('422', '350000', '2014-12-31', '6', 'trymore test', '               blue_icon.png            ', '2014-12-31', '2014-12-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('423', '350000', '2014-12-31', '6', 'trymore test', '                                        ', '2014-12-31', '2014-12-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('424', '350000', '2015-01-31', '6', 'Test Campaign 2', 'description description', '2014-12-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('425', '45000', '2015-01-05', '6', 'Test Campaign 4', 'yrdy', '2015-01-01', '2015-02-28', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('426', '200000', '0000-00-00', '6', 'tst', 'mhkjhvjhgv', '0000-00-00', '0000-00-00', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('456', '150000', '2015-01-10', '6', 'Audi Ad Campaign', 'Audi Ad Campaign description', '2015-01-01', '2015-02-28', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('471', '20000', '0000-00-00', '7', '0', '0', '0000-00-00', '0000-00-00', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('472', '135000', '2015-01-10', '7', 'BMW Ad Campaign', 'BMW Ad Campaign description', '2015-01-01', '2015-02-28', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('473', '135000', '2015-01-10', '7', 'BMW Ad Campaign', 'BMW Ad Campaign description', '2015-01-01', '2015-02-28', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('474', '100000', '2015-01-31', '6', 'Indigo Jan Ad', 'jhbkjvmnv', '2015-01-31', '2015-02-28', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('475', '250000', '2015-01-12', '7', 'Samsung Galaxy Note 4', 'Samsung Galaxy Note 4', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('476', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('477', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('478', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('479', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('480', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('481', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('482', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('483', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('484', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('485', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('486', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('487', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('488', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('489', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('490', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('491', '250000', '2015-01-12', '7', 'The new Chevrolet Adam', 'The new Chevrolet Adam is coming', '2015-01-01', '2015-01-31', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('492', '125000', '2015-02-28', '7', 'Huwawei Ascend P7 Jan 2015', 'Introducing the new Huwawei Ascend P7 - ', '2015-01-12', '2015-01-05', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('493', '200000', '2015-01-21', '6', 'KFC Crushers', 'Launching a new product', '2015-02-01', '2015-02-28', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('494', '10000', '2015-01-01', '5', 'hgfdghf', 'asdfasdfa', '2015-01-14', '2015-01-15', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('495', '20000', '0000-00-00', '6', 'kjnkbknb', 'jhkjhgvkjhgvjh', '0000-00-00', '0000-00-00', '0', '3', '0', '', '');
INSERT INTO `rfp` VALUES ('496', '111111', '2015-01-31', '6', 'wer', 'kfc product launch\n', '2015-01-17', '2015-01-31', '0', '3', '0', '', '');

-- ----------------------------
-- Table structure for `rfp_detail`
-- ----------------------------
DROP TABLE IF EXISTS `rfp_detail`;
CREATE TABLE `rfp_detail` (
  `rfp_d_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfp_id` int(6) NOT NULL,
  `mec_id` int(6) NOT NULL,
  `position` varchar(30) NOT NULL,
  `address` varchar(90) NOT NULL,
  `proximity` int(6) NOT NULL,
  PRIMARY KEY (`rfp_d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rfp_detail
-- ----------------------------
INSERT INTO `rfp_detail` VALUES ('1', '1', '1', '-26.066344,27.95042', '', '0');
INSERT INTO `rfp_detail` VALUES ('2', '1', '2', '-26.043682,27.936344', '', '0');

-- ----------------------------
-- Table structure for `rfp_status`
-- ----------------------------
DROP TABLE IF EXISTS `rfp_status`;
CREATE TABLE `rfp_status` (
  `rfp_status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rfp_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rfp_status
-- ----------------------------
INSERT INTO `rfp_status` VALUES ('1', 'Submitted');
INSERT INTO `rfp_status` VALUES ('2', 'Received');

-- ----------------------------
-- Table structure for `road_grade`
-- ----------------------------
DROP TABLE IF EXISTS `road_grade`;
CREATE TABLE `road_grade` (
  `roa_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `roa_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of road_grade
-- ----------------------------

-- ----------------------------
-- Table structure for `sale`
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sal_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pay_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`sal_id`),
  KEY `pay_id_idx` (`pay_id`),
  CONSTRAINT `pay_id` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`pay_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sale
-- ----------------------------

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
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

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('Ads2trade', 'http://localhost/ads2trade/auction/', '', '1.0.2', '1', '1', '5', '15', '1', '2', '2', 'GBP', '1', 'By clicking below you agree to the terms of this website.', '', '1', '1', 'logo.gif', '0', '2', '30', 'EUR', 'An unexpected error occurred. The error has been forwarded to our technical team and will be fixed shortly', '1', '5', '2', '120', '120', '8', '8', '0', 'y', 'y', 'y', '', 'y', '', 'y', '', 'United Kingdom', 'EN', 'alpha', 'y', '', '', '51200', 'always', 'default', '20', 'n', 'y', '0', '1', 'n', '', 'n', '50', 'n', '1', 'y', 'n', 'n', '1', '25.0000', '0.0000', 'y', 'disabled', '120', '300', 'y', '24', '1', '468', '60', 'y', 'y', 'y', '', 'a:7:{s:9:\"birthdate\";s:1:\"y\";s:7:\"address\";s:1:\"y\";s:4:\"city\";s:1:\"y\";s:4:\"prov\";s:1:\"y\";s:7:\"country\";s:1:\"y\";s:3:\"zip\";s:1:\"y\";s:3:\"tel\";s:1:\"y\";}', 'a:7:{s:17:\"birthdate_regshow\";s:1:\"y\";s:15:\"address_regshow\";s:1:\"y\";s:12:\"city_regshow\";s:1:\"y\";s:12:\"prov_regshow\";s:1:\"y\";s:15:\"country_regshow\";s:1:\"y\";s:11:\"zip_regshow\";s:1:\"y\";s:11:\"tel_regshow\";s:1:\"y\";}', 'y', 'y', 'y', 'y', '', '', '1', '1', 'n', 'a:2:{i:0;s:13:\"Wire Transfer\";i:1;s:6:\"Cheque\";}', 'y', '10');

-- ----------------------------
-- Table structure for `special_deal`
-- ----------------------------
DROP TABLE IF EXISTS `special_deal`;
CREATE TABLE `special_deal` (
  `spd_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `spd_description` varchar(255) DEFAULT NULL,
  `spd_start_date` datetime DEFAULT NULL,
  `spd_end_date` datetime DEFAULT NULL,
  `cur_code_customer` smallint(6) DEFAULT NULL,
  `cur_code_location_owner` smallint(6) DEFAULT NULL,
  `spd_discount_percentage` decimal(3,3) DEFAULT NULL,
  `spd_availability` tinyint(4) DEFAULT NULL,
  `mec_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`spd_id`),
  KEY `med_id_idx` (`mec_id`),
  CONSTRAINT `med_id` FOREIGN KEY (`mec_id`) REFERENCES `media_owner` (`med_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of special_deal
-- ----------------------------
INSERT INTO `special_deal` VALUES ('1', 'My Special', '2014-08-23 10:10:46', '2014-08-23 10:10:46', null, null, null, null, null);

-- ----------------------------
-- Table structure for `statssettings`
-- ----------------------------
DROP TABLE IF EXISTS `statssettings`;
CREATE TABLE `statssettings` (
  `activate` enum('y','n') NOT NULL DEFAULT 'y',
  `accesses` enum('y','n') NOT NULL DEFAULT 'y',
  `browsers` enum('y','n') NOT NULL DEFAULT 'y',
  `domains` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of statssettings
-- ----------------------------
INSERT INTO `statssettings` VALUES ('n', 'y', 'y', 'y');

-- ----------------------------
-- Table structure for `surbub`
-- ----------------------------
DROP TABLE IF EXISTS `surbub`;
CREATE TABLE `surbub` (
  `sur_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sur_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of surbub
-- ----------------------------

-- ----------------------------
-- Table structure for `system_events`
-- ----------------------------
DROP TABLE IF EXISTS `system_events`;
CREATE TABLE `system_events` (
  `event_type` int(11) NOT NULL,
  `event_user` int(11) NOT NULL,
  `event_object_id` int(11) NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_details` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_events
-- ----------------------------
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:48', 'Advertiser advertiser logged in successfully', '1');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:47', 'Advertiser advertiser logged in successfully', '2');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:52', 'Advertiser advertiser logged in successfully', '3');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:18', 'Advertiser advertiser logged in successfully', '4');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:01', 'Advertiser advertiser logged in successfully', '5');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:10', 'User logged out successfully', '6');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 14:23:14', 'Operator operator logged in successfully', '7');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 14:23:28', 'User logged out successfully', '8');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:32', 'Advertiser advertiser logged in successfully', '9');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 14:23:57', 'User logged out successfully', '10');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-23 14:23:05', 'Media Owner pintos logged in successfully', '11');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-23 14:23:11', 'User logged out successfully', '12');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 14:23:14', 'Operator operator logged in successfully', '13');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 15:23:55', 'Operator operator logged in successfully', '14');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 15:23:58', 'Operator operator logged in successfully', '15');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 15:23:37', 'User logged out successfully', '16');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 15:23:47', 'Advertiser advertiser logged in successfully', '17');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 16:23:34', 'User logged out successfully', '18');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 16:23:37', 'Operator operator logged in successfully', '19');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 16:23:55', 'Operator operator logged in successfully', '20');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 16:23:14', 'User logged out successfully', '21');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-23 16:23:23', '22');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-23 22:23:49', '23');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-23 22:23:45', '24');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-23 22:23:57', 'User logged out successfully', '25');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 22:23:00', 'Advertiser advertiser logged in successfully', '26');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 23:23:53', 'User logged out successfully', '27');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-23 23:23:59', 'Advertiser advertiser logged in successfully', '28');
INSERT INTO `system_events` VALUES ('2', '5', '1', '2014-11-23 23:23:44', '10 Bid placed', '29');
INSERT INTO `system_events` VALUES ('6', '6', '2', '2014-11-24 00:24:45', 'Asset id:2 removed from user:6\'s watchlist', '30');
INSERT INTO `system_events` VALUES ('2', '6', '1', '2014-11-24 00:24:17', '450.00 Bid placed', '31');
INSERT INTO `system_events` VALUES ('1', '6', '3', '2014-11-24 00:24:08', 'Asset id: added to user:6\'s watchlist', '32');
INSERT INTO `system_events` VALUES ('5', '0', '0', '2014-11-24 00:24:45', 'User logged out successfully', '33');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 00:24:46', '34');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 00:24:24', '35');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-11-24 00:24:15', '125.00 Bid placed', '36');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 00:24:59', '37');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-24 00:24:17', 'User logged out successfully', '38');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 00:24:23', '39');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 00:24:27', 'User logged out successfully', '40');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 00:24:30', 'Advertiser advertiser logged in successfully', '41');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 00:24:37', 'User logged out successfully', '42');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-24 00:24:40', 'Media Owner pintos logged in successfully', '43');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 00:24:55', '44');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 00:24:14', '45');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 11:24:34', '46');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 13:24:21', '47');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 13:24:00', '48');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 13:24:01', '49');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 13:24:29', '50');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-24 13:24:55', 'User logged out successfully', '51');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-24 13:24:05', 'Media Owner pintos logged in successfully', '52');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-24 13:24:28', 'User logged out successfully', '53');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 13:24:40', 'Advertiser advertiser logged in successfully', '54');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 14:24:24', 'User logged out successfully', '55');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-24 14:24:27', '56');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-24 14:24:32', 'User logged out successfully', '57');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-24 14:24:41', 'Media Owner pintos logged in successfully', '58');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-24 14:24:50', 'User logged out successfully', '59');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 14:24:56', 'Advertiser advertiser logged in successfully', '60');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 14:24:38', 'Advertiser advertiser logged in successfully', '61');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-24 14:24:05', 'Advertiser advertiser logged in successfully', '62');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 06:25:15', 'Advertiser advertiser logged in successfully', '63');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 06:25:19', 'User logged out successfully', '64');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 06:25:24', '65');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 06:25:26', 'User logged out successfully', '66');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 06:25:31', 'Media Owner pintos logged in successfully', '67');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 07:25:13', 'Media Owner pintos logged in successfully', '68');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 07:25:44', 'Media Owner pintos logged in successfully', '69');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 07:25:57', 'User logged out successfully', '70');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 07:25:03', '71');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 07:25:19', 'User logged out successfully', '72');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 07:25:28', 'Advertiser advertiser logged in successfully', '73');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 07:25:54', 'User logged out successfully', '74');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 07:25:58', '75');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 07:25:14', 'User logged out successfully', '76');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 07:25:19', 'Advertiser advertiser logged in successfully', '77');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 07:25:23', 'User logged out successfully', '78');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 07:25:25', 'Advertiser advertiser logged in successfully', '79');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 07:25:00', 'Advertiser advertiser logged in successfully', '80');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 08:25:27', 'User logged out successfully', '81');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 08:25:31', '82');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 08:25:41', 'User logged out successfully', '83');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 08:25:44', 'Media Owner pintos logged in successfully', '84');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 09:25:19', 'User logged out successfully', '85');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 09:25:23', '86');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 09:25:27', 'User logged out successfully', '87');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 09:25:28', '88');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 09:25:51', 'User logged out successfully', '89');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 09:25:56', 'Media Owner pintos logged in successfully', '90');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 09:25:00', 'User logged out successfully', '91');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 09:25:04', 'Advertiser advertiser logged in successfully', '92');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 09:25:55', 'User logged out successfully', '93');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 09:25:59', '94');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 14:25:02', 'User logged out successfully', '95');
INSERT INTO `system_events` VALUES ('5', '9', '9', '2014-11-25 14:25:12', 'Advertiser Simon logged in successfully', '96');
INSERT INTO `system_events` VALUES ('5', '9', '9', '2014-11-25 14:25:02', 'User logged out successfully', '97');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 14:25:07', 'Advertiser advertiser logged in successfully', '98');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 14:25:11', 'User logged out successfully', '99');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 14:25:17', '100');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 15:25:18', '101');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-25 15:25:38', 'User logged out successfully', '102');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 15:25:42', 'Advertiser advertiser logged in successfully', '103');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-25 15:25:49', 'User logged out successfully', '104');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 15:25:53', 'Media Owner pintos logged in successfully', '105');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-25 15:25:00', 'User logged out successfully', '106');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-25 15:25:04', '107');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-26 07:26:25', 'Media Owner pintos logged in successfully', '108');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-26 07:26:57', 'User logged out successfully', '109');
INSERT INTO `system_events` VALUES ('5', '9', '9', '2014-11-26 07:26:54', 'Advertiser Simon logged in successfully', '110');
INSERT INTO `system_events` VALUES ('5', '9', '9', '2014-11-26 08:26:33', 'Advertiser Simon logged in successfully', '111');
INSERT INTO `system_events` VALUES ('5', '9', '9', '2014-11-26 08:26:32', 'User logged out successfully', '112');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-26 08:26:41', 'Advertiser advertiser logged in successfully', '113');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-26 08:26:57', 'User logged out successfully', '114');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-26 08:26:01', '115');
INSERT INTO `system_events` VALUES ('5', '0', '0', '2014-11-26 12:26:35', 'User logged out successfully', '116');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-26 12:26:42', '117');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-26 12:26:41', '118');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-11-26 12:26:15', 'User logged out successfully', '119');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-26 12:26:25', 'Advertiser advertiser logged in successfully', '120');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-26 12:26:10', 'User logged out successfully', '121');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-26 12:26:19', 'Media Owner pintos logged in successfully', '122');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-11-26 12:26:37', 'User logged out successfully', '123');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-26 12:26:42', '124');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-11-27 11:27:50', 'Advertiser advertiser logged in successfully', '125');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-11-27 23:27:06', '126');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-02 09:02:26', 'Advertiser advertiser logged in successfully', '127');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-03 20:3:55', '128');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-03 21:3:30', '129');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-03 21:03:32', 'User logged out successfully', '130');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-03 21:03:37', 'Advertiser advertiser logged in successfully', '131');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-09 14:09:16', 'Advertiser advertiser logged in successfully', '132');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-09 19:09:19', 'Advertiser advertiser logged in successfully', '133');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-10 08:10:14', 'Advertiser advertiser logged in successfully', '134');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 20:10:54', 'Media Owner pintos logged in successfully', '135');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 20:10:54', 'Media Owner pintos logged in successfully', '136');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 20:10:37', 'Media Owner pintos logged in successfully', '137');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-10 20:10:13', 'User logged out successfully', '138');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 20:10:15', 'Media Owner pintos logged in successfully', '139');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 21:10:30', 'User logged out successfully', '140');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 21:10:12', 'Media Owner pintos logged in successfully', '141');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 21:10:29', 'Media Owner pintos logged in successfully', '142');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-10 21:10:43', 'User logged out successfully', '143');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-10 21:10:01', 'Advertiser advertiser logged in successfully', '144');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:00', 'Advertiser advertiser logged in successfully', '145');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:50', 'Advertiser advertiser logged in successfully', '146');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:39', 'Advertiser advertiser logged in successfully', '147');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:44', 'User logged out successfully', '148');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:46', 'Advertiser advertiser logged in successfully', '149');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:30', 'User logged out successfully', '150');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:32', 'Advertiser advertiser logged in successfully', '151');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:27', 'User logged out successfully', '152');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:29', 'Advertiser advertiser logged in successfully', '153');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:55', 'User logged out successfully', '154');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:57', 'Advertiser advertiser logged in successfully', '155');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:16', 'User logged out successfully', '156');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:18', 'Advertiser advertiser logged in successfully', '157');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:41', 'User logged out successfully', '158');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 07:11:43', 'Advertiser advertiser logged in successfully', '159');
INSERT INTO `system_events` VALUES ('1', '6', '1', '2014-12-11 07:11:46', 'Asset id:1 added to user:6\'s watchlist', '160');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 08:11:12', 'User logged out successfully', '161');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 08:11:15', 'Advertiser advertiser logged in successfully', '162');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 08:11:50', 'User logged out successfully', '163');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 08:11:59', '164');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 08:11:47', 'User logged out successfully', '165');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 08:11:51', '166');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 08:11:00', 'User logged out successfully', '167');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 08:11:03', '168');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 08:11:08', 'User logged out successfully', '169');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 08:11:09', '170');
INSERT INTO `system_events` VALUES ('1', '7', '0', '2014-12-11 08:11:26', '0 Auctions removed by User id:7', '171');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 08:11:00', 'User logged out successfully', '172');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 08:11:02', '173');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 08:11:13', 'User logged out successfully', '174');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 08:11:30', '175');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 08:11:34', 'User logged out successfully', '176');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 08:11:46', 'Media Owner pintos logged in successfully', '177');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 08:11:52', 'User logged out successfully', '178');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 08:11:05', 'Media Owner pintos logged in successfully', '179');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 08:11:59', 'Media Owner pintos logged in successfully', '180');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 09:11:59', 'Advertiser advertiser logged in successfully', '181');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 09:11:40', 'User logged out successfully', '182');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 09:11:47', 'Media Owner pintos logged in successfully', '183');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 09:11:00', 'User logged out successfully', '184');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 09:11:06', 'Advertiser advertiser logged in successfully', '185');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 09:11:08', 'User logged out successfully', '186');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 09:11:15', '187');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 09:11:26', '188');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 09:11:41', '189');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-11 10:11:45', '190');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-11 10:11:20', 'User logged out successfully', '191');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 10:11:27', 'Media Owner pintos logged in successfully', '192');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 19:11:29', 'Media Owner pintos logged in successfully', '193');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-11 20:11:54', 'User logged out successfully', '194');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 20:11:03', 'Advertiser advertiser logged in successfully', '195');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 20:11:09', 'Advertiser advertiser logged in successfully', '196');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-11 20:11:11', 'Advertiser advertiser logged in successfully', '197');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-13 19:13:57', 'Advertiser advertiser logged in successfully', '198');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-13 19:13:06', 'Advertiser advertiser logged in successfully', '199');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-13 21:13:50', 'Advertiser advertiser logged in successfully', '200');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-13 22:13:22', 'User logged out successfully', '201');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-13 22:13:24', 'Advertiser advertiser logged in successfully', '202');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-13 22:13:43', 'Advertiser advertiser logged in successfully', '203');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-14 01:14:48', ' Bid placed', '204');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-14 01:14:34', '25200 Bid placed', '205');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-14 09:14:50', '206');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-14 09:14:14', 'User logged out successfully', '207');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-14 09:14:26', 'Advertiser advertiser logged in successfully', '208');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-14 15:14:05', 'Advertiser advertiser logged in successfully', '209');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-14 15:14:17', 'Advertiser advertiser logged in successfully', '210');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-14 20:14:31', 'Advertiser advertiser logged in successfully', '211');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-14 22:14:21', '25000 Bid placed', '212');
INSERT INTO `system_events` VALUES ('5', '8', '8', '2014-12-15 09:15:22', 'Media Owner tawanda logged in successfully', '213');
INSERT INTO `system_events` VALUES ('5', '8', '8', '2014-12-15 09:15:48', 'User logged out successfully', '214');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-15 09:15:59', '215');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-15 09:15:33', 'User logged out successfully', '216');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-15 09:15:34', 'Advertiser advertiser logged in successfully', '217');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-15 19:15:21', 'Advertiser advertiser logged in successfully', '218');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-15 19:15:32', ' Bid placed', '219');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-15 19:15:00', '5525.00 Bid placed', '220');
INSERT INTO `system_events` VALUES ('5', '0', '0', '2014-12-16 13:16:50', 'User logged out successfully', '221');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-16 13:16:10', 'Advertiser advertiser logged in successfully', '222');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-16 19:16:15', 'Advertiser advertiser logged in successfully', '223');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-16 20:16:55', 'Advertiser advertiser logged in successfully', '224');
INSERT INTO `system_events` VALUES ('1', '6', '7', '2014-12-16 22:16:58', 'Asset id: added to user:6\'s watchlist', '225');
INSERT INTO `system_events` VALUES ('2', '6', '1', '2014-12-16 22:16:48', '37500 Bid placed', '226');
INSERT INTO `system_events` VALUES ('1', '6', '5', '2014-12-16 23:16:53', 'Asset id: added to user:6\'s watchlist', '227');
INSERT INTO `system_events` VALUES ('1', '6', '5', '2014-12-17 00:17:49', 'Asset id: added to user:6\'s watchlist', '228');
INSERT INTO `system_events` VALUES ('2', '6', '5', '2014-12-17 00:17:51', '401 Bid placed', '229');
INSERT INTO `system_events` VALUES ('6', '6', '2', '2014-12-17 00:17:43', 'Asset id:2 removed from user:6\'s watchlist', '230');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-17 00:17:13', '231');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-17 00:17:37', 'User logged out successfully', '232');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-17 00:17:42', '233');
INSERT INTO `system_events` VALUES ('1', '7', '0', '2014-12-17 00:17:51', '0 Auctions added by User id:7', '234');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-17 09:17:29', 'Advertiser advertiser logged in successfully', '235');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 08:18:22', 'Advertiser advertiser logged in successfully', '236');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 09:18:22', 'Advertiser advertiser logged in successfully', '237');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 09:18:58', 'Advertiser advertiser logged in successfully', '238');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-18 09:18:18', '129 Bid placed', '239');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 09:18:53', 'User logged out successfully', '240');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 09:18:37', 'Advertiser advertiser logged in successfully', '241');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-18 09:18:40', 'Media Owner pintos logged in successfully', '242');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-18 09:18:18', 'Media Owner pintos logged in successfully', '243');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-18 09:18:54', 'User logged out successfully', '244');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 09:18:04', 'Advertiser advertiser logged in successfully', '245');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 09:18:51', 'Advertiser advertiser logged in successfully', '246');
INSERT INTO `system_events` VALUES ('1', '6', '1', '2014-12-18 10:18:45', 'Asset id: added to user:6\'s watchlist', '247');
INSERT INTO `system_events` VALUES ('1', '6', '5', '2014-12-18 10:18:48', 'Asset id: added to user:6\'s watchlist', '248');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 18:18:37', 'Advertiser advertiser logged in successfully', '249');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 18:18:09', 'Advertiser advertiser logged in successfully', '250');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 18:18:46', 'Advertiser advertiser logged in successfully', '251');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 18:18:56', 'Advertiser advertiser logged in successfully', '252');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 18:18:29', 'Advertiser advertiser logged in successfully', '253');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-18 18:18:39', '100 Bid placed', '254');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 18:18:59', 'User logged out successfully', '255');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 19:18:02', 'Advertiser advertiser logged in successfully', '256');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 19:18:45', 'Advertiser advertiser logged in successfully', '257');
INSERT INTO `system_events` VALUES ('2', '6', '7', '2014-12-18 20:18:29', ' Bid placed', '258');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-18 20:18:37', '500 Bid placed', '259');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 21:18:01', 'User logged out successfully', '260');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-18 21:18:06', '261');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-18 21:18:16', 'User logged out successfully', '262');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-18 21:18:20', 'Advertiser advertiser logged in successfully', '263');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-18 21:18:13', '600 Bid placed', '264');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-18 21:18:17', '552 Bid placed', '265');
INSERT INTO `system_events` VALUES ('2', '6', '1', '2014-12-18 21:18:02', '40000 Bid placed', '266');
INSERT INTO `system_events` VALUES ('6', '6', '5', '2014-12-18 21:18:47', 'Asset id:5 added to user:6\'s watchlist', '267');
INSERT INTO `system_events` VALUES ('2', '6', '1', '2014-12-18 22:18:03', '250 Bid placed', '268');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-19 08:19:22', 'Advertiser advertiser logged in successfully', '269');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-19 11:19:38', 'Advertiser advertiser logged in successfully', '270');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-19 13:19:37', '800 Bid placed', '271');
INSERT INTO `system_events` VALUES ('2', '6', '5', '2014-12-19 13:19:06', '800 Bid placed', '272');
INSERT INTO `system_events` VALUES ('2', '6', '5', '2014-12-19 13:19:37', '1000 Bid placed', '273');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-20 10:20:14', 'Advertiser advertiser logged in successfully', '274');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-20 15:20:02', 'Advertiser advertiser logged in successfully', '275');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-21 09:21:16', 'Advertiser advertiser logged in successfully', '276');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-21 09:21:24', 'Advertiser advertiser logged in successfully', '277');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-21 10:21:27', 'Advertiser advertiser logged in successfully', '278');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-21 10:21:58', 'User logged out successfully', '279');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-21 10:21:11', '280');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-21 10:21:38', 'User logged out successfully', '281');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-21 10:21:46', 'Media Owner pintos logged in successfully', '282');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-21 10:21:02', 'User logged out successfully', '283');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-21 10:21:10', 'Advertiser advertiser logged in successfully', '284');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-21 15:21:56', 'Advertiser advertiser logged in successfully', '285');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2014-12-21 15:21:40', 'Asset id: added to user:6\'s watchlist', '286');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2014-12-21 16:21:35', '12100 Bid placed', '287');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-22 08:22:28', 'Advertiser advertiser logged in successfully', '288');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-22 08:22:12', 'User logged out successfully', '289');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2014-12-22 08:22:20', '290');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2014-12-22 08:22:36', 'User logged out successfully', '291');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-22 08:22:41', 'Advertiser advertiser logged in successfully', '292');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-23 06:23:59', 'Advertiser advertiser logged in successfully', '293');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-23 09:23:18', 'Advertiser advertiser logged in successfully', '294');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-23 09:23:08', 'Media Owner  logged in successfully', '295');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-23 09:23:13', 'Advertiser advertiser logged in successfully', '296');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-27 12:27:52', 'Advertiser advertiser logged in successfully', '297');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-27 20:27:00', 'Advertiser advertiser logged in successfully', '298');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-28 15:28:26', 'Advertiser advertiser logged in successfully', '299');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-29 09:29:06', 'Advertiser advertiser logged in successfully', '300');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-29 09:29:58', 'Advertiser advertiser logged in successfully', '301');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2014-12-29 10:29:02', 'Asset id: added to user:6\'s watchlist', '302');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-29 10:29:57', 'Advertiser advertiser logged in successfully', '303');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-29 19:29:30', 'Media Owner  logged in successfully', '304');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-29 19:29:40', 'Advertiser advertiser logged in successfully', '305');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-30 19:30:18', 'Media Owner  logged in successfully', '306');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-30 19:30:23', 'Advertiser advertiser logged in successfully', '307');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-31 09:31:37', 'Advertiser advertiser logged in successfully', '308');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-31 16:31:34', 'Media Owner  logged in successfully', '309');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-31 16:31:32', 'Advertiser advertiser logged in successfully', '310');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2014-12-31 18:31:15', 'Media Owner  logged in successfully', '311');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-31 18:31:19', 'Advertiser advertiser logged in successfully', '312');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2014-12-31 23:31:03', 'Advertiser advertiser logged in successfully', '313');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2015-01-01 02:01:08', 'Asset id: added to user:6\'s watchlist', '314');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 10:03:24', 'Advertiser advertiser logged in successfully', '315');
INSERT INTO `system_events` VALUES ('1', '6', '2', '2015-01-03 10:03:16', 'Asset id:2 added to user:6\'s watchlist', '316');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 10:3:28', '317');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 11:03:08', 'Advertiser advertiser logged in successfully', '318');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 11:3:26', '319');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 11:3:10', '320');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-03 11:03:53', 'User logged out successfully', '321');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-03 11:03:53', 'User logged out successfully', '322');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 11:03:57', 'Advertiser advertiser logged in successfully', '323');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 11:03:59', 'User logged out successfully', '324');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 11:3:11', '325');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 12:3:23', '326');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-03 12:03:10', 'User logged out successfully', '327');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 12:03:19', 'Advertiser advertiser logged in successfully', '328');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-03 20:03:02', 'Media Owner  logged in successfully', '329');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 20:03:23', 'Advertiser advertiser logged in successfully', '330');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-03 20:03:26', 'User logged out successfully', '331');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 20:3:31', '332');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 20:3:49', '333');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-03 22:3:12', '334');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 12:4:16', '335');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 12:4:46', '336');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-04 13:04:06', 'Advertiser advertiser logged in successfully', '337');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-04 13:04:43', 'User logged out successfully', '338');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 13:4:46', '339');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 14:4:58', '340');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 14:4:35', '341');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 14:4:00', '342');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-04 14:04:05', 'User logged out successfully', '343');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 14:4:09', '344');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 19:4:53', '345');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-04 19:04:31', 'User logged out successfully', '346');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-04 19:04:42', 'Media Owner pintos logged in successfully', '347');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-04 20:04:10', 'User logged out successfully', '348');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 20:4:15', '349');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 20:4:58', '350');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-04 20:4:43', '351');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-04 20:04:45', 'Advertiser advertiser logged in successfully', '352');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-04 21:04:22', 'Advertiser advertiser logged in successfully', '353');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-05 00:05:36', 'User logged out successfully', '354');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-05 00:5:40', '355');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-05 00:05:58', 'User logged out successfully', '356');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-05 00:05:02', 'Advertiser advertiser logged in successfully', '357');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-05 00:05:34', 'User logged out successfully', '358');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-05 00:5:37', '359');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-06 11:06:54', 'Advertiser advertiser logged in successfully', '360');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-06 12:06:41', 'Advertiser advertiser logged in successfully', '361');
INSERT INTO `system_events` VALUES ('1', '6', '5', '2015-01-06 12:06:11', 'Asset id:5 added to user:6\'s watchlist', '362');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-06 12:06:54', 'Advertiser advertiser logged in successfully', '363');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-06 14:06:43', 'Media Owner pintos logged in successfully', '364');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-06 14:06:08', 'User logged out successfully', '365');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-06 18:06:41', 'Advertiser advertiser logged in successfully', '366');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-06 20:6:12', '367');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-07 10:07:53', 'Advertiser advertiser logged in successfully', '368');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-07 14:07:15', 'Advertiser advertiser logged in successfully', '369');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2015-01-07 14:07:38', 'Asset id: added to user:6\'s watchlist', '370');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-07 16:07:24', 'Media Owner pintos logged in successfully', '371');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-07 16:07:57', 'Advertiser advertiser logged in successfully', '372');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-07 16:07:56', 'Advertiser advertiser logged in successfully', '373');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2015-01-07 16:07:03', 'Asset id: added to user:6\'s watchlist', '374');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2015-01-07 16:07:11', 'Asset id: added to user:6\'s watchlist', '375');
INSERT INTO `system_events` VALUES ('6', '6', '0', '2015-01-07 16:07:13', 'Asset id: added to user:6\'s watchlist', '376');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-07 16:7:02', '377');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-07 17:07:50', 'User logged out successfully', '378');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-07 17:7:56', '379');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-09 19:9:38', '380');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-10 09:10:57', '381');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-10 11:10:20', '382');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-10 18:10:23', 'User logged out successfully', '383');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-10 18:10:28', 'Media Owner pintos logged in successfully', '384');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-10 18:10:50', 'User logged out successfully', '385');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-10 18:10:56', '386');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-10 18:10:10', 'User logged out successfully', '387');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-11 13:11:34', '388');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-13 13:13:44', 'Advertiser advertiser logged in successfully', '389');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2015-01-13 13:13:29', '23000 Bid placed', '390');
INSERT INTO `system_events` VALUES ('1', '6', '1', '2015-01-13 13:13:55', 'Asset id:1 added to user:6\'s watchlist', '391');
INSERT INTO `system_events` VALUES ('2', '6', '1', '2015-01-13 13:13:50', '3500 Bid placed', '392');
INSERT INTO `system_events` VALUES ('2', '6', '0', '2015-01-13 13:13:02', '23000 Bid placed', '393');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-13 13:13:39', 'User logged out successfully', '394');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-13 14:13:08', 'Media Owner pintos logged in successfully', '395');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-13 14:13:05', 'User logged out successfully', '396');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-13 14:13:21', '397');
INSERT INTO `system_events` VALUES ('5', '7', '7', '2015-01-13 14:13:36', 'User logged out successfully', '398');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-13 14:13:44', 'Advertiser advertiser logged in successfully', '399');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-14 09:14:14', 'Media Owner pintos logged in successfully', '400');
INSERT INTO `system_events` VALUES ('0', '0', '7', '0000-00-00 00:00:00', '2015-01-14 09:14:40', '401');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-14 09:14:39', 'Media Owner pintos logged in successfully', '402');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-14 11:14:07', 'Advertiser advertiser logged in successfully', '403');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-14 13:14:06', 'Advertiser advertiser logged in successfully', '404');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-14 13:14:37', 'User logged out successfully', '405');
INSERT INTO `system_events` VALUES ('5', '5', '5', '2015-01-14 13:14:45', 'Media Owner pintos logged in successfully', '406');
INSERT INTO `system_events` VALUES ('5', '6', '6', '2015-01-14 13:14:24', 'Advertiser advertiser logged in successfully', '407');

-- ----------------------------
-- Table structure for `system_events_type`
-- ----------------------------
DROP TABLE IF EXISTS `system_events_type`;
CREATE TABLE `system_events_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_events_type
-- ----------------------------
INSERT INTO `system_events_type` VALUES ('1', 'Auction', 'Auction related events', '1');
INSERT INTO `system_events_type` VALUES ('2', 'Bids', 'Bids related events', '1');
INSERT INTO `system_events_type` VALUES ('3', 'Campaign', 'Campaign related events', '1');
INSERT INTO `system_events_type` VALUES ('4', 'News', 'News related events', '1');
INSERT INTO `system_events_type` VALUES ('5', 'User', 'User related events', '1');
INSERT INTO `system_events_type` VALUES ('6', 'Asset', '', '1');

-- ----------------------------
-- Table structure for `tax`
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `tax_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tax_code` varchar(45) DEFAULT NULL,
  `tax_percentage` float DEFAULT NULL,
  `tax_mandatory` tinyint(4) DEFAULT NULL,
  `txt_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`tax_id`),
  KEY `txt_id_idx` (`txt_id`),
  CONSTRAINT `txt_id` FOREIGN KEY (`txt_id`) REFERENCES `tax_type` (`txt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tax
-- ----------------------------

-- ----------------------------
-- Table structure for `tax_type`
-- ----------------------------
DROP TABLE IF EXISTS `tax_type`;
CREATE TABLE `tax_type` (
  `txt_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `txt_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`txt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tax_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tmp_prop`
-- ----------------------------
DROP TABLE IF EXISTS `tmp_prop`;
CREATE TABLE `tmp_prop` (
  `cam_id` int(4) NOT NULL,
  `use_id` int(4) NOT NULL,
  `assets` int(4) NOT NULL,
  `mec_id` int(4) NOT NULL,
  `lon` varchar(20) NOT NULL,
  `lat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tmp_prop
-- ----------------------------

-- ----------------------------
-- Table structure for `town`
-- ----------------------------
DROP TABLE IF EXISTS `town`;
CREATE TABLE `town` (
  `tow_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tow_description` varchar(255) DEFAULT NULL,
  `tow_code` varchar(255) DEFAULT NULL,
  `lot_id` smallint(6) DEFAULT NULL COMMENT 'FK : location_type',
  PRIMARY KEY (`tow_id`),
  KEY `lot_id_idx` (`lot_id`),
  CONSTRAINT `lot_id` FOREIGN KEY (`lot_id`) REFERENCES `location_type` (`lot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of town
-- ----------------------------
INSERT INTO `town` VALUES ('1', 'johannesburg', 'JHB', '1');
INSERT INTO `town` VALUES ('2', 'pretoria', 'PRE', '1');

-- ----------------------------
-- Table structure for `transaction_category`
-- ----------------------------
DROP TABLE IF EXISTS `transaction_category`;
CREATE TABLE `transaction_category` (
  `tctg_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tctg_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transaction_category
-- ----------------------------

-- ----------------------------
-- Table structure for `uploaded_documents`
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_documents`;
CREATE TABLE `uploaded_documents` (
  `upd_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `upd_url` varchar(250) NOT NULL,
  `upd_filesize` varchar(250) NOT NULL,
  `upd_file_name` varchar(250) NOT NULL,
  `upd_file_type` varchar(250) NOT NULL,
  `upt_id` varchar(250) NOT NULL COMMENT 'FK to uploaded_file_type table',
  `ass_id` smallint(6) NOT NULL COMMENT 'FK to asset table',
  `use_id` smallint(6) DEFAULT NULL,
  `rfp_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`upd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of uploaded_documents
-- ----------------------------
INSERT INTO `uploaded_documents` VALUES ('1', '/usr/www/users/indigfajaw/ads2trade/upload/asset_photos/py.png', '91.81', 'py.png', 'image/png', '0', '1', null, null);
INSERT INTO `uploaded_documents` VALUES ('2', 'http://indigostorage.co.za/ads2trade/upload/asset_photos/10484991_10152411287073547_6592022208326102484_n.jpg', '81.31', '10484991_10152411287073547_6592022208326102484_n.jpg', 'image/jpeg', '0', '12', null, null);
INSERT INTO `uploaded_documents` VALUES ('3', 'http://indigostorage.co.za/ads2trade/upload/asset_photos/call_me.png', '143.34', 'call_me.png', 'image/png', '0', '12', null, null);

-- ----------------------------
-- Table structure for `uploaded_file_type`
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_file_type`;
CREATE TABLE `uploaded_file_type` (
  `upt_id` smallint(6) NOT NULL,
  `upt_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of uploaded_file_type
-- ----------------------------
INSERT INTO `uploaded_file_type` VALUES ('0', 'image/png');
INSERT INTO `uploaded_file_type` VALUES ('0', 'image/jpeg');
INSERT INTO `uploaded_file_type` VALUES ('0', 'image/png');

-- ----------------------------
-- Table structure for `uploaded_photos`
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_photos`;
CREATE TABLE `uploaded_photos` (
  `upl_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `upl_url` varchar(250) NOT NULL,
  `ass_id` smallint(6) NOT NULL,
  PRIMARY KEY (`upl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of uploaded_photos
-- ----------------------------
INSERT INTO `uploaded_photos` VALUES ('1', '/usr/www/users/indigfajaw/ads2trade/upload/asset_photos/Tamera1.jpg', '14');
INSERT INTO `uploaded_photos` VALUES ('2', '/usr/www/users/indigfajaw/ads2trade/upload/asset_photos/call_me.png', '11');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `use_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
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
  `user_status` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`use_id`),
  KEY `per_id_idx` (`pem_id`),
  KEY `ust_id_idx` (`ust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'pintos', '2', 'pintos', '1', null, '2014-08-22 11:37:39', '2014-12-11 08:12:20', null, 'media owner', 'developer', '', '', '', 'Indigo Vision', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2000', '', '1');
INSERT INTO `user` VALUES ('6', 'advertiser', '1', 'advertiser', '1', null, '2014-07-18 16:09:41', null, null, 'advertiser', 'developer', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1');
INSERT INTO `user` VALUES ('7', 'operator', '3', 'operator', '1', null, '2014-07-18 16:09:41', null, null, 'advertiser', 'developer', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1');
INSERT INTO `user` VALUES ('8', 'tawanda', '2', 'tawanda', '1', null, '2014-07-16 19:33:59', null, null, 'media owner', 'developer', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1');
INSERT INTO `user` VALUES ('9', 'd5cbfe9ff07fef1ecc93861ce5dd4f3b', '1', 'Simon', '1', null, '2014-08-22 11:51:09', null, null, 'Simon', 'Simon', 'monepim@webmail.co.za', '', '0987654323', 'Iscor', '6789', 'Brixton', 'johannesburg', 'South Africa', 'on', 'on', '0', 'on', 'on', '0', 'on', 'on', '0', '0', 'on', '', '', '', '', '1');
INSERT INTO `user` VALUES ('10', 'd5cbfe9ff07fef1ecc93861ce5dd4f3b', '1', 'Simon', '0', null, '2014-10-19 18:51:58', null, null, 'Simon', 'Mohoalali', 'simon@4waysunited.org.za', '', '011 465 7869', 'Indigo', '6789', 'Bryanston', 'johannesburg', 'South Africa', 'on', 'on', '0', 'on', 'on', '0', 'on', 'on', '0', '0', 'on', '', '', '', '', '0');

-- ----------------------------
-- Table structure for `user_permission`
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `usp_id` smallint(6) NOT NULL,
  `ust_id` smallint(6) DEFAULT NULL,
  `usp_description` varchar(45) DEFAULT NULL,
  `usp_edited_by` smallint(6) DEFAULT NULL,
  `usp_date_edited` datetime DEFAULT NULL,
  `usp_date_created` timestamp NULL DEFAULT NULL,
  `usp_created_by` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`usp_id`),
  KEY `usp_created_by_idx` (`usp_created_by`),
  KEY `ust_id_idx` (`ust_id`),
  CONSTRAINT `usp_created_by` FOREIGN KEY (`usp_created_by`) REFERENCES `ads2trade_user` (`use_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ust_id` FOREIGN KEY (`ust_id`) REFERENCES `user_type` (`ust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `user_status`
-- ----------------------------
DROP TABLE IF EXISTS `user_status`;
CREATE TABLE `user_status` (
  `user_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_status_name` varchar(32) NOT NULL,
  PRIMARY KEY (`user_status_id`),
  UNIQUE KEY `user_status_name` (`user_status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='User status table';

-- ----------------------------
-- Records of user_status
-- ----------------------------
INSERT INTO `user_status` VALUES ('2', 'Active');
INSERT INTO `user_status` VALUES ('4', 'Blocked');
INSERT INTO `user_status` VALUES ('1', 'Incoming');
INSERT INTO `user_status` VALUES ('3', 'Suspended');

-- ----------------------------
-- Table structure for `user_type`
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `ust_id` smallint(6) NOT NULL,
  `ust_description` varchar(45) DEFAULT NULL,
  `caf_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ust_id`),
  KEY `caf_id_idx` (`caf_id`),
  CONSTRAINT `caf_id` FOREIGN KEY (`caf_id`) REFERENCES `contact_address_format` (`caf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('1', 'advertiser', '1');
INSERT INTO `user_type` VALUES ('2', 'media owner', '1');
INSERT INTO `user_type` VALUES ('3', 'operator', '1');

-- ----------------------------
-- Table structure for `userfees`
-- ----------------------------
DROP TABLE IF EXISTS `userfees`;
CREATE TABLE `userfees` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `auc_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `amt` double(6,4) NOT NULL DEFAULT '0.0000',
  `paid` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userfees
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
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
  `language` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'pintos', '0abf7e7895315a44a76f900145e08102', 'nlo9', 'mann', 'wrer', 'asad', 'adsf', 'South Africa', '0028', '12343', 'manntawee@gmail.com', '1406225100', '0', '0', '19810713', '8888', '1', '0', 'TEST WATCH', null, 'one', 'yes', 'html', '2014-08-12 21:47:52', null, '2,1', 'y', '0', '', '', '', '', '', '', 'EN');

-- ----------------------------
-- Table structure for `usersips`
-- ----------------------------
DROP TABLE IF EXISTS `usersips`;
CREATE TABLE `usersips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `type` enum('first','after') NOT NULL DEFAULT 'first',
  `action` enum('accept','deny') NOT NULL DEFAULT 'accept',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usersips
-- ----------------------------
INSERT INTO `usersips` VALUES ('1', '2', ' 127.0.0.1', 'first', 'accept');
INSERT INTO `usersips` VALUES ('2', '2', '::1', 'after', 'accept');

-- ----------------------------
-- Table structure for `watch_list`
-- ----------------------------
DROP TABLE IF EXISTS `watch_list`;
CREATE TABLE `watch_list` (
  `watch_id` int(6) NOT NULL AUTO_INCREMENT,
  `ass_id` int(6) NOT NULL,
  `start_date` int(28) NOT NULL,
  `status` int(2) NOT NULL,
  `auction` int(6) NOT NULL,
  `use_id` int(6) NOT NULL,
  PRIMARY KEY (`watch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of watch_list
-- ----------------------------
INSERT INTO `watch_list` VALUES ('1', '5', '2147483647', '1', '1', '0');
INSERT INTO `watch_list` VALUES ('2', '1', '2147483647', '0', '2', '0');
INSERT INTO `watch_list` VALUES ('3', '2', '2014', '1', '2', '0');
INSERT INTO `watch_list` VALUES ('4', '2', '2014', '1', '2', '0');
INSERT INTO `watch_list` VALUES ('5', '2', '2014', '1', '2', '0');
INSERT INTO `watch_list` VALUES ('6', '2', '2014', '1', '2', '0');
INSERT INTO `watch_list` VALUES ('7', '10', '2014', '1', '0', '0');
INSERT INTO `watch_list` VALUES ('8', '0', '2014', '1', '1', '0');
INSERT INTO `watch_list` VALUES ('9', '2', '2014', '1', '2', '0');
INSERT INTO `watch_list` VALUES ('10', '2', '2014', '1', '2', '0');
INSERT INTO `watch_list` VALUES ('11', '1', '2014', '1', '1', '6');
INSERT INTO `watch_list` VALUES ('12', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('13', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('14', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('15', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('16', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('17', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('18', '0', '2014', '1', '7', '6');
INSERT INTO `watch_list` VALUES ('19', '0', '2014', '1', '5', '6');
INSERT INTO `watch_list` VALUES ('20', '0', '2014', '1', '5', '6');
INSERT INTO `watch_list` VALUES ('21', '0', '2014', '1', '1', '6');
INSERT INTO `watch_list` VALUES ('22', '2', '2014', '1', '5', '6');
INSERT INTO `watch_list` VALUES ('23', '5', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('24', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('25', '0', '2014', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('26', '0', '2015', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('27', '2', '2015', '1', '2', '6');
INSERT INTO `watch_list` VALUES ('28', '5', '2015', '1', '5', '6');
INSERT INTO `watch_list` VALUES ('29', '0', '2015', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('30', '0', '2015', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('31', '0', '2015', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('32', '0', '2015', '1', '0', '6');
INSERT INTO `watch_list` VALUES ('33', '1', '2015', '1', '1', '6');

-- ----------------------------
-- Table structure for `winners`
-- ----------------------------
DROP TABLE IF EXISTS `winners`;
CREATE TABLE `winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `ff_paid` int(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of winners
-- ----------------------------

-- ----------------------------
-- Table structure for `work_type`
-- ----------------------------
DROP TABLE IF EXISTS `work_type`;
CREATE TABLE `work_type` (
  `wor_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `wor_description` varchar(255) DEFAULT NULL,
  `wor_IE` varchar(255) DEFAULT NULL,
  `wor_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of work_type
-- ----------------------------
