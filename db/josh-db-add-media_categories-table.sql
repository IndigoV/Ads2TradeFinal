--
-- Table structure for table `media_categories`
--

CREATE TABLE `media_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `met_editions_mandatory` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `media_categories`
--

INSERT INTO `media_categories` (`id`, `description`, `mec_time_dependant`, `mec_site_dependant`, `media_family_id`, `mam_id`, `mec_tearsheet_printing`, `mec_editions_mandatory`, `mec_contractor`, `mec_height_dependant`, `mec_interval_billing`, `mec_base_rate`, `mec_rate_card_nett`, `rlm_id`, `mec_export_code`, `met_sequence`, `met_auto_editions`, `met_editions_mandatory`) VALUES
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
