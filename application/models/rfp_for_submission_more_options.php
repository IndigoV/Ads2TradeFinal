<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class rfp_for_submission_more_options extends CI_Model {

    function createRFPForSubmissionMoreOptions($moreOptionsID, $rfpID, $locationID, $mediaCategoriesID) {
//        $querySelect = $this->db->query("SELECT mec_id FROM media_category WHERE UPPER(mec_description) = UPPER('". $item ."')")->result()[0]->mec_id;

        $query = $this->db->query("INSERT INTO rfp_for_submission_more_options (`more_options_id`, `rfp_for_submission_id`, `rfp_for_submission_location_id`, `rfp_for_submission_media_categories_id`) VALUES ('". $moreOptionsID ."', '". $rfpID ."', '". $locationID ."', '". $mediaCategoriesID ."')");
        return $this->db->insert_id();

    }

    function getMoreOptionsForId($locID, $catID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_more_options WHERE rfp_for_submission_location_id = '". $locID ."' AND rfp_for_submission_media_categories_id = '". $catID ."'");
        return $query->result();
    }

    function getMoreOptionsForMediaCategoryID($mediaCategoryID, $locID, $rfpID) {
//        echo $mediaCategoryID;
        $query = $this->db->query("SELECT * FROM rfp_for_submission_more_options WHERE rfp_for_submission_media_categories_id = '". $mediaCategoryID ."' AND rfp_for_submission_location_id = '". $locID ."' AND rfp_for_submission_id = '". $rfpID ."'");
        return $query->result();
//        return $query->result();
    }

    function getMoreOptionsForRFP($rfpID, $locationID, $mediaCategoryID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_more_options INNER JOIN asset_size ON asset_size.asi_id = rfp_for_submission_more_options.more_options_id INNER JOIN `rfp_for_submission_media_categories` ON `rfp_for_submission_more_options`.`rfp_for_submission_media_categories_id` = `rfp_for_submission_media_categories`.`rfp_for_submission_media_categories_id` WHERE rfp_for_submission_more_options.rfp_for_submission_id = " . $rfpID . " AND rfp_for_submission_more_options.rfp_for_submission_location_id = " . $locationID . " AND rfp_for_submission_more_options.rfp_for_submission_media_categories_id = " . $mediaCategoryID);
        return $query->result();
    }

}