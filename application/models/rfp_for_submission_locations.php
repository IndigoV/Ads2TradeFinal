<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class rfp_for_submission_locations extends CI_Model {

    function createRFPForSubmissionLocation($rf4sID, $lat, $long) {

        $query = $this->db->query("INSERT INTO rfp_for_submission_locations (`rfp_for_submission_id`, `lat`, `long`) VALUES ('". $rf4sID ."', '". $lat ."', '". $long ."')");
        return $this->db->insert_id();

    }

    function getLocationsForID($id) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_locations WHERE rfp_for_submission_id = '". $id ."'");
        return $query->result();
    }

    function getLocationsForRFP($rfpID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_locations WHERE rfp_for_submission_id = " . $rfpID);
        return $query->result();
    }

}