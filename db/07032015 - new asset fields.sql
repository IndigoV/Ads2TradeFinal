ALTER TABLE asset
ADD COLUMN `ass_status` tinyint(1) DEFAULT '0' COMMENT '0=available, id of campaign or auction',
ADD COLUMN `ass_status_detail` tinyint(1) DEFAULT '0' COMMENT '0=available, 1=auction, 2=campaign';