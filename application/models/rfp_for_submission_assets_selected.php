<?php ob_start(); ?>
<?php

class rfp_for_submission_assets_selected extends CI_Model {

    function insertAssetSelected($rfpID, $mecid, $assetID, $operatorID, $start, $end, $location, $mediaOwnerID,$created_timestamp) {
        $transactionDate = date("Y-m-d");
        $this->db->query("INSERT INTO rfp_for_submission_assets_selected (`rfp_for_submission_id`, `media_categories_id`, `asset_id`, `accepted_by_media_owner`, `from_id`, `to_id`, `transaction_date`, `active`, `from_date`, `to_date`, `location`,`created_timestamp`) VALUES ('". $rfpID ."', '". $mecid ."', '". $assetID ."', '1', '". $mediaOwnerID ."', '". $operatorID ."', '". $transactionDate ."', '1', '". date($start) ."', '". date($end) ."', '". $location ."', '". $created_timestamp . "')");
        return $this->db->insert_id();
    }

    function insertAssetSelectedOperator($rfp4subID, $mecid, $assetid, $operatorID, $startDate, $endDate, $location, $mediaOwnerID, $created_timestamp) {
        $transactionDate = date("Y-m-d");
        $sql = "INSERT INTO rfp_for_submission_assets_selected (`rfp_for_submission_id`, `media_categories_id`, `asset_id`, `accepted_by_operator`, `accepted_by_media_owner`, `from_id`, `to_id`, `transaction_date`, `active`, `from_date`, `to_date`, `location`, `created_timestamp`) VALUES ('". $rfp4subID ."', '". $mecid ."', '". $assetid ."', '1', '0', '". $this->session->userdata('user_id') ."', '". $mediaOwnerID ."', '". $transactionDate ."', '1', '". date($startDate) ."', '". date($endDate) ."', '". $location ."','" . $created_timestamp ."')";
        $this->db->query($sql);
        return $this->db->insert_id();
    }

    function getAssetsSelectedForRfpSubmission($rfpID, $locID, $mediaCategoryID) {

    }

    function getAllSelectedAssets($campaignID, $operatorID, $mediaOwnerID) {

    }

    function getAssetSelectedCount($rfpID, $mediaOwnerID, $campaignID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_assets_selected WHERE (from_id = '" . $mediaOwnerID . "' OR to_id = '". $mediaOwnerID ."') AND active = 1 AND rfp_for_submission_id = ". $rfpID);
        return $query->result();
    }

    function isInAssetsSelected($campaignID, $mediaOwnerID, $locationID, $assetID) {
        $query = $this->db->query("SELECT * FROM rfp_for_submission_assets_selected WHERE from_id = " . $mediaOwnerID . " AND rfp_for_submission_location_id = " . $locationID . " AND asset_id =" . $assetID);
        return $query->result();
    }

    function getAssetsSelectedForRFP($rfpID, $mediaOwnerID, $mediaCategoryID, $locationID) {
//        echo $rfpID . '<br />';
//        echo $mediaCategoryID . '<br />';
//        echo $locationID . '<br />';
        $query = $this->db->query("SELECT * FROM rfp_for_submission_assets_selected INNER JOIN rfp_for_submission_locations ON rfp_for_submission_assets_selected.rfp_for_submission_location_id = rfp_for_submission_locations.rfp_for_submission_locations_id INNER JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id  WHERE rfp_for_submission_assets_selected.rfp_for_submission_id = " . $rfpID . " AND rfp_for_submission_assets_selected.active = 1 AND rfp_for_submission_assets_selected.rfp_for_submission_location_id = " . $locationID . " AND media_categories_id = " . $mediaCategoryID);
//        echo "<br />";
//        echo "SELECT * FROM rfp_for_submission_assets_selected INNER JOIN rfp_for_submission_locations ON rfp_for_submission_assets_selected.rfp_for_submission_location_id = rfp_for_submission_locations.rfp_for_submission_locations_id INNER JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id  WHERE rfp_for_submission_assets_selected.rfp_for_submission_id = " . $rfpID . " AND rfp_for_submission_assets_selected.active = 1 AND rfp_for_submission_assets_selected.rfp_for_submission_location_id = " . $locationID . " AND media_categories_id = " . $mediaCategoryID;
//        echo "<br />";
        return $query->result();
    }

    function getSelectedAssets($rfpID, $mediaOwnerID) {
        $sql = "SELECT * FROM rfp_for_submission_assets_selected INNER JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id  WHERE rfp_for_submission_assets_selected.rfp_for_submission_id = " . $rfpID . " AND rfp_for_submission_assets_selected.active = 1 AND (rfp_for_submission_assets_selected.from_id = " . $mediaOwnerID . " OR rfp_for_submission_assets_selected.to_id = " . $mediaOwnerID . ")";
        $query = $this->db->query($sql);
        return $query->result();
    }

    function getAllMediaOwnerAssets($mediaOwnerID) {
//        $query = $this->db->query("SELECT * FROM ");
//        return $query->result();
    }

    function getAssetsInLocation($mediaOwnerID, $lat, $long, $mediaCategoryID) {
        $answer = $this->db->query("
            SELECT
            asset.ass_id,
            asset.ast_id,
            asset.ass_name,
            asset.ass_description,
            asset.position,
            asset.ass_ref,
            asset.emp_id_maintenance,
            asset.ass_disposed_of,
            asset.ass_acquisition_cost,
            asset.ass_book_value,
            asset.ass_printable_height,
            asset.ass_proportional_costs,
            asset.ass_printable_width,
            asset.ass_production_cost_BCY,
            asset.ass_production_price_SCY,
            asset.ass_address,
            asset.mat_id,
            asset.loc_id,
            asset.med_id,
            asset.met_id,
            asset.img_id,
            asset.ass_lead_time,
            asset.meu_id_lead_time,
            asset.ass_production_requirements,
            asset.use_id,
            asset.mec_id,
            asset.lot_id,
            asset.ass_position,
            asset.ass_height_meu_id,
            asset.ass_width_meu_id,
            asset.ass_street_address,
            asset.ass_city,
            asset.ass_province,
            asset.ass_country,
            asset.ass_date,
            asset.ass_is_mall,
            media_category.mec_description,
            SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) as lat,
            SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1) as lng,
            3956*2*ASIN(SQRT(POWER(SIN((".$lat." - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1))*pi()/180 / 2), 2) + COS(".$lat." * pi() / 180) * COS(SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) * pi()/180) * POWER(SIN((".$long." - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1))*pi()/180 / 2),2))) AS distance
            FROM asset
            INNER JOIN media_category ON asset.mec_id = media_category.mec_id
            WHERE asset.med_id = ". $mediaOwnerID ."
            AND asset.mec_id = ". $mediaCategoryID ."
            HAVING distance < 12")->result();

        return $answer;
    }

    function getAssetsForLocationForMediaTypeForMediaOwnerForRFP($rfpID, $mediaOwnerID, $lat, $long, $mediaCategoryID) {

        $answer = $this->db->query("
            SELECT
            asset.ass_id,
            asset.ast_id,
            asset.ass_name,
            asset.ass_description,
            asset.position,
            asset.ass_ref,
            asset.emp_id_maintenance,
            asset.ass_disposed_of,
            asset.ass_acquisition_cost,
            asset.ass_book_value,
            asset.ass_printable_height,
            asset.ass_proportional_costs,
            asset.ass_printable_width,
            asset.ass_production_cost_BCY,
            asset.ass_production_price_SCY,
            asset.ass_address,
            asset.mat_id,
            asset.loc_id,
            asset.med_id,
            asset.met_id,
            asset.img_id,
            asset.ass_lead_time,
            asset.meu_id_lead_time,
            asset.ass_production_requirements,
            asset.use_id,
            asset.mec_id,
            asset.lot_id,
            asset.ass_position,
            asset.ass_height_meu_id,
            asset.ass_width_meu_id,
            asset.ass_street_address,
            asset.ass_city,
            asset.ass_province,
            asset.ass_country,
            asset.ass_date,
            asset.ass_is_mall,
            media_category.mec_description,
            SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) as lat,
            SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1) as lng,
            3956*2*ASIN(SQRT(POWER(SIN((".$lat." - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1))*pi()/180 / 2), 2) + COS(".$lat." * pi() / 180) * COS(SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) * pi()/180) * POWER(SIN((".$long." - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1))*pi()/180 / 2),2))) AS distance
            FROM asset
            INNER JOIN media_category ON asset.mec_id = media_category.mec_id
            WHERE asset.med_id = ". $mediaOwnerID ."
            AND asset.mec_id = ". $mediaCategoryID ."
            HAVING distance < 12")->result();

        return $answer;

    }

    function finishRFP($rfpID) {
        $this->db->query("UPDATE `rfp_for_submission_assets_selected` SET active = '2', completed = '1', accepted_by_operator = '1' WHERE rfp_for_submission_id = ". $rfpID ." AND accepted_by_media_owner = 1 AND active = 1 AND completed = 0 AND accepted_by_operator = 1;");
    }

    public function getRfpSubmissionSelectedAssets($rfp_for_submission_id) {
        $sql = "
            select
                *
            from rfp_for_submission_assets_selected
            inner join asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id
            where rfp_for_submission_id = $rfp_for_submission_id and accepted_by_media_owner = 1
            order by created_timestamp desc
            limit 1;
        ";
        $data = array();
        $recs = $this->db->query($sql)->result();
        if(count($recs) > 0 ) {
            $rec = $recs[0];
            $created_timestamp = $rec->created_timestamp;
            $sql2 = "
                select
                    *
                from rfp_for_submission_assets_selected
                inner join asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id
                where rfp_for_submission_id = $rfp_for_submission_id and created_timestamp = '$created_timestamp'
                and accepted_by_media_owner = 1
            ";
            $data = $this->db->query($sql2)->result();
        }
        return $data;
    }
} 