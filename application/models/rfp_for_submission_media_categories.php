<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class rfp_for_submission_media_categories extends CI_Model {

    function createRFPForSubmissionMediaCategory($rf4sID, $item, $qty, $locID) {
        $querySelect = $this->db->query("SELECT mec_id FROM media_category WHERE UPPER(mec_description) = UPPER('". $item ."')")->result()[0]->mec_id;

        $query = $this->db->query("INSERT INTO rfp_for_submission_media_categories (`rfp_for_submission_id`, `media_category_id`, `quantity`, `rfp_for_location_id`) VALUES ('". $rf4sID ."', '". $querySelect ."', '". $qty ."', '". $locID ."')");
        return $querySelect;

    }

    function getMediaCategoriesForID($id) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_media_categories WHERE rfp_for_submission_id = '". $id ."'");
        return $query->result();
    }

    function getMediaCategoriesForLocationAndRFPID($locID, $campaignID, $mediaOwnerId) {
//        echo $locID;
        $getRFPID = $this->db->query("SELECT rfp_for_submission_id FROM rfp_for_submission WHERE campaign_id = '". $campaignID ."' AND media_owner_id = '". $mediaOwnerId ."'");
//        return $getRFPID->result()[0];
//        $query = $this->db->query("SELECT * FROM rfp_for_submission_media_categories WHERE rfp_for_submission_id = '". $getRFPID->result()[0]->rfp_for_submission_id ."' AND rfp_for_location_id = '". $locID ."'");
//        $query = $this->db->query("SELECT * FROM rfp_for_submission_media_categories");
        $all = $this->db->query("SELECT * FROM rfp_for_submission_media_categories WHERE rfp_for_submission_id = '" . $getRFPID->result()[0]->rfp_for_submission_id . "' AND rfp_for_location_id = '" . $locID . "'");
        return $all->result();
    }

    function getMediaCategoriesForLocationAndRFPIDOperator($locID, $campaignID, $operatorID) {
//        echo $locID;
        $getRFPID = $this->db->query("SELECT rfp_for_submission_id FROM rfp_for_submission WHERE campaign_id = '". $campaignID ."' AND operator_id = '". $operatorID ."'");
//        return $getRFPID->result()[0];
//        $query = $this->db->query("SELECT * FROM rfp_for_submission_media_categories WHERE rfp_for_submission_id = '". $getRFPID->result()[0]->rfp_for_submission_id ."' AND rfp_for_location_id = '". $locID ."'");
//        $query = $this->db->query("SELECT * FROM rfp_for_submission_media_categories");
        $all = $this->db->query("SELECT * FROM rfp_for_submission_media_categories WHERE rfp_for_submission_id = '" . $getRFPID->result()[0]->rfp_for_submission_id . "' AND rfp_for_location_id = '" . $locID . "'");
        return $all->result();
    }

    function getMediaForRFP($rfpID, $locationID) {
        // SELECT *
        // FROM `rfp_for_submission_media_categories` INNER JOIN `media_category` ON `rfp_for_submission_media_categories`.`media_category_id` = `media_category`.`mec_id`
        // WHERE `rfp_for_submission_media_categories`.`rfp_for_submission_id` = 1 AND `rfp_for_submission_media_categories`.`rfp_for_location_id` = 1

        $query = $this->db->query("SELECT * FROM `rfp_for_submission_media_categories` INNER JOIN `media_category` ON `rfp_for_submission_media_categories`.`media_category_id` = `media_category`.`mec_id` WHERE `rfp_for_submission_media_categories`.`rfp_for_submission_id` = ". $rfpID ." AND `rfp_for_submission_media_categories`.`rfp_for_location_id` = " . $locationID);
        return $query->result();
    }

    function getMediaTypeNamesFromIDS($allIDS) {
        $allNames = array();
        for($i = 0; $i < count($allIDS); $i++) {
            $name = $this->db->query("SELECT * FROM media_category WHERE mec_id = " . $allIDS[$i])->result()[0]->mec_id;
            $allNames[] = $name;
        }
        return $allNames;
    }

}