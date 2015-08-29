<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class rfp_for_submission extends CI_Model {

    function createRFPForSubmission($mediaOwnerID, $campaignID) {
        $query = $this->db->query("INSERT INTO rfp_for_submission (`media_owner_id`, `campaign_id`, `operator_id`, `proccessed_operator`) VALUES ('". $mediaOwnerID ."', '". $campaignID ."', '". $this->session->userdata('user_id') ."', '1')");

        return $this->db->insert_id();
    }

    function getAllRFPsForMediaOwner($mediaOwnerID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission INNER JOIN campaign on (rfp_for_submission.campaign_id =campaign.cam_id) WHERE media_owner_id = '" . $mediaOwnerID . "' AND proccessed_media_owner = '0' ORDER BY campaign.cam_id DESC");
        return $query->result();
    }

    function getRFPWithCampaignIDForMediaOwner($mediaOwnerID, $campaignID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE media_owner_id = '" . $mediaOwnerID . "' AND campaign_id = '". $campaignID ."'");
        return $query->result();
    }

    function getRFPWithCampaignIDForOperator($operatorID, $campaignID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE operator_id = '" . $operatorID . "' AND campaign_id = '". $campaignID ."'");
        return $query->result();
    }

    function checkIDAndMediaOwnerID($campaignID, $mediaOwnerID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE media_owner_id = '". $mediaOwnerID ."' AND campaign_id = '". $campaignID ."' AND operator_id = '". $this->session->userdata('user_id') ."'");
        return $query->result();
    }

    function getAllAssetsOnTable($campaignID, $mediaOwnerID, $operatorID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_assets_selected INNER JOIN rfp_for_submission ON rfp_for_submission.rfp_for_submission_id = rfp_for_submission_assets_selected.rfp_for_submission_id WHERE rfp_for_submission_assets_selected.accepted_by_media_owner = 1 AND rfp_for_submission_assets_selected.rfp_for_submission_id = ". $campaignID ." AND rfp_for_submission.media_owner_id = ". $mediaOwnerID ." AND rfp_for_submission.operator_id = ". $operatorID);
        return $query->result();
    }

    function getMediaOwnerIDFromRfpLocationID($rfp4SubmissionID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE rfp_for_submission_id = " . $rfp4SubmissionID);
        echo '<pre>';
        print_r($query->result());
        echo '</pre>';
//        $rfps[$i]->media_owner_id
    }

    function getRFPForMediaOwnerIDAndCampaignID($campaignID, $mediaOwnerID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE campaign_id = " . $campaignID . " AND media_owner_id = " . $mediaOwnerID);
        return $query->result()[0];
    }

    function finishRFP($rfpID, $campaignID, $mediaOwnerID) {
        $this->db->query("UPDATE rfp_for_submission SET complete = '1' WHERE rfp_for_submission_id = '". $rfpID ."' AND campaign_id = '". $campaignID ."' AND media_owner_id = '". $mediaOwnerID ."'");
    }

    function getAllRFPsForMediaOwnerAcceptedProposals() {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE media_owner_id = '" . $this->session->userdata('user_id') . "' AND (process = '1' OR process = '2' OR complete = '1')");
        return $query->result();
    }

    function getAllRFPsForOperatorAcceptedProposals($id) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission WHERE operator_id = '" . $id . "' AND (process = '2' OR complete = '1')");
        return $query->result();
    }

    function updateData($id, $data) {
        $this->db->where('rfp_for_submission_id', $id);
        $this->db->update('rfp_for_submission', $data);
    }

    function findById($id) {
        return $this->db->query("select * from rfp_for_submission where rfp_for_submission_id = $id")->result()[0];
    }

    public function getCompleteRfpForSubmissions($advertiser_id) {
        $allCampaigns = $this->db->query("SELECT * FROM campaign INNER JOIN rfp_for_submission ON rfp_for_submission.campaign_id = campaign.cam_id INNER JOIN user ON user.use_id = rfp_for_submission.media_owner_id WHERE campaign.adv_id = " . $advertiser_id . " AND campaign.cam_requested_start_date <> '0000-00-00' AND campaign.cam_requested_end_date <> '0000-00-00' AND campaign.cam_requested_response_date <> '0000-00-00' AND rfp_for_submission.complete = '1' ORDER BY cam_id DESC")->result();
        return $allCampaigns;
    }

}