CREATE TABLE `rfp_campaign_screenshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cam_id` int(11) NOT NULL,
  `image_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE `rfp_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cam_id` int(11) NOT NULL,
  `adv_id` int(11) NOT NULL,
  `lat` float NOT NULL,
  `long` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;