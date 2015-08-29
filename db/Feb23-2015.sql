CREATE TABLE IF NOT EXISTS `rfp_for_submission` (
  `rfp_for_submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_owner_id` int(11) NOT NULL,
  PRIMARY KEY (`rfp_for_submission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `rfp_for_submission_locations` (
  `rfp_for_submission_locations_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfp_for_submission_id` int(11) NOT NULL,
  `lat` float NOT NULL,
  `long` float NOT NULL,
  PRIMARY KEY (`rfp_for_submission_locations_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `rfp_for_submission_media_categories` (
  `rfp_for_submission_media_categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `rfp_for_submission_id` int(11) NOT NULL,
  `media_category_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  PRIMARY KEY (`rfp_for_submission_media_categories_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `rfp_for_submission_more_options` (
  `rfp_for_submission_more_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `more_options_id` int(11) NOT NULL,
  PRIMARY KEY (`rfp_for_submission_more_options_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;