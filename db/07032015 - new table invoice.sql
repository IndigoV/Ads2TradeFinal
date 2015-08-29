/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : indigfajaw_ads2trade

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-03-07 17:10:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_number` varchar(30) DEFAULT 'N/A',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `asset_id` int(11) DEFAULT NULL,
  `auction_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL COMMENT 'Media owner',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Advertiser',
  `agent_id` int(11) DEFAULT NULL COMMENT 'operator',
  `status` int(11) DEFAULT '0' COMMENT '0=new/unpaid,1=paid (partial),2=paid(fully)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300004 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('300001', 'N/A', '2015-03-07 17:08:03', 'Test Invoice', '3', '3', null, '5000', '5', '3', '6', '0');
INSERT INTO `invoice` VALUES ('300002', 'N/A', '2015-03-07 17:09:20', 'Test Invoice #2', '5', null, '5', '25000', '5', '3', '6', '0');
INSERT INTO `invoice` VALUES ('300003', 'N/A', '2015-03-07 17:09:24', null, null, null, null, null, null, null, null, '0');
