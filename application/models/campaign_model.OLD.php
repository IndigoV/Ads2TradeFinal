<?php

//following class accesses the lms_user tuple
class Campaign_model extends CI_Model {

    function returnCampaignDetails($campaignID) {
        $query = $this->db->query("SELECT * FROM campaign WHERE cam_id = " . $campaignID);
        return $query->result()[0];
    }

    public function getAllOtherOptionsData() {
        $returnArray = array();
        $array = array();
        $count = 0;
        $sql = "SELECT
                asset_size.asi_id,
                asset_size.asi_description,
                asset_size.mec_id,
                asset_size.meu_id,
                asset_size.asi_photo_url,
                asset_size.asi_quantity,
                asset_size.asi_width,
                asset_size.asi_length,
                asset_size.asi_printable_width,
                asset_size.asi_printable_length,
                asset_size.asi_page_trim_width,
                asset_size.asi_notes,
                asset_size.asi_page_trim_length,
                asset_size.asi_frequency,
                asset_size.asi_frequency_meu_id,
                asset_size.asi_size,
                asset_size.asi_size_meu_id,
                media_category.mec_description,
                measurement_unit.meu_description,
                MEU.meu_description
                FROM
                asset_size
                INNER JOIN media_category ON asset_size.mec_id = media_category.mec_id
                INNER JOIN measurement_unit ON asset_size.meu_id = measurement_unit.meu_id
                INNER JOIN measurement_unit AS MEU ON asset_size.asi_size_meu_id = MEU.meu_id";
        $query = $this->db->query($sql);
        $jsonArray = $query->result();
        $count = 0;
        $mediaTypeAlreadyIn = [];
        $mediaTypeAlreadyInMap = [];
        $mediaTypesObject = array();

        foreach($jsonArray as $ja => $a) {
            $asi_id = $a->asi_id;
            $asi_description = $a->asi_description;
            $mec_id = $a->mec_id;
            $meu_id = $a->meu_id;
            $asi_photo_url = $a->asi_photo_url;
            $asi_quantity = $a->asi_quantity;
            $asi_width = $a->asi_width;
            $asi_length = $a->asi_length;
            $asi_printable_width = $a->asi_printable_width;
            $asi_printable_length = $a->asi_printable_length;
            $asi_page_trim_width = $a->asi_page_trim_width;
            $asi_notes = $a->asi_notes;
            $asi_page_trim_length = $a->asi_page_trim_length;
            $asi_frequency = $a->asi_frequency;
            $asi_frequency_meu_id = $a->asi_frequency_meu_id;
            $asi_size = $a->asi_size;
            $asi_size_meu_id = $a->asi_size_meu_id;
            $mec_description = $a->mec_description;
            $meu_description = $a->meu_description;
            if(!in_array($mec_description, $mediaTypeAlreadyIn)) {
                $mediaTypesObject[$mec_description] = array();
                $mediaTypesObject[$mec_description][$count][$asi_description] = array(
                    'asi_id' => $asi_id,
                    'asi_description' => $asi_description,
                    'asi_size' => $asi_size,
                    'asi_size_meu_id' => $asi_size_meu_id,
                    'mec_id' => $mec_id,
                    'meu_id' => $meu_id,
                    'asi_photo_url' => $asi_photo_url,
                    'asi_quantity' => $asi_quantity,
                    'asi_width' => $asi_width,
                    'asi_length' => $asi_length,
                    'asi_printable_width' => $asi_printable_width,
                    'asi_printable_length' => $asi_printable_length,
                    'asi_page_trim_width' => $asi_page_trim_width,
                    'asi_notes' => $asi_notes,
                    'asi_page_trim_length' => $asi_page_trim_length,
                    'asi_frequency' => $asi_frequency,
                    'asi_frequency_meu_id' => $asi_frequency_meu_id,
                    'mec_description' => $mec_description,
                    'meu_description' => $meu_description
                );
                $mediaTypeAlreadyIn[$count] = $mec_description;
                $count++;

            } else {
                $mediaTypesObject[$mec_description][$count][$asi_description] = array(
                    'asi_id' => $asi_id,
                    'asi_description' => $asi_description,
                    'asi_size' => $asi_size,
                    'asi_size_meu_id' => $asi_size_meu_id,
                    'mec_id' => $mec_id,
                    'meu_id' => $meu_id,
                    'asi_photo_url' => $asi_photo_url,
                    'asi_quantity' => $asi_quantity,
                    'asi_width' => $asi_width,
                    'asi_length' => $asi_length,
                    'asi_printable_width' => $asi_printable_width,
                    'asi_printable_length' => $asi_printable_length,
                    'asi_page_trim_width' => $asi_page_trim_width,
                    'asi_notes' => $asi_notes,
                    'asi_page_trim_length' => $asi_page_trim_length,
                    'asi_frequency' => $asi_frequency,
                    'asi_frequency_meu_id' => $asi_frequency_meu_id,
                    'mec_description' => $mec_description,
                    'meu_description' => $meu_description
                );
                $count++;
            }
        }

//        echo '<pre>';
//        print_r($mediaTypesObject);
//        echo '</pre>';

        $returnArray = $mediaTypesObject;
        return $returnArray;
//        echo '<pre>';
//        print_r($returnArray);
//        echo '</pre>';
        /*
         *   ARRAY STORED AS FOLLOWS:
         */
//        Array (
//        [7] => Array (                // [7] = ID of media item
//            [0] => stdClass Object (  // [0] = Number in list of asset sizes
//                    [asi_id] => 52
//                    [asi_description] => A0
//                    [mec_id] => 7
//                    [meu_id] => 11
//                    [asi_photo_url] =>
//                    [asi_quantity] =>
//                    [asi_width] => 24.000
//                    [asi_length] => 12.000
//                    [asi_printable_width] =>
//                    [asi_printable_length] =>
//                    [asi_page_trim_width] =>
//                    [asi_notes] =>
//                    [asi_page_trim_length] =>
//                    [asi_frequency] =>
//                    [asi_frequency_meu_id] =>
//                    [asi_size] => 10
//                    [asi_size_meu_id] => 1
//                    [mec_description] => bill board (Digital)
//                    [meu_description] => second
//             )
//
//            [1] => stdClass Object (
//                    [asi_id] => 53
//                    [asi_description] => A1
//                    [mec_id] => 7
//                    [meu_id] => 11
//                    [asi_photo_url] =>
//                    [asi_quantity] =>
//                    [asi_width] => 24.000
//                    [asi_length] => 12.000
//                    [asi_printable_width] =>
//                    [asi_printable_length] =>
//                    [asi_page_trim_width] =>
//                    [asi_notes] =>
//                    [asi_page_trim_length] =>
//                    [asi_frequency] =>
//                    [asi_frequency_meu_id] =>
//                    [asi_size] => 20
//                    [asi_size_meu_id] => 1
//                    [mec_description] => bill board (Digital)
//                    [meu_description] => second
//              )
//          )

//        $submissionArray = array();
//        $jsonArray = array();
//        foreach($array as $a => $v) {
//            foreach($v as $value) {
//                $jsonArray[$a]['asi_id'] = $value->asi_id;
//                $jsonArray[$a]['asi_description'] = $value->asi_description;
//                $jsonArray[$a]['mec_id'] = $value->mec_id;
//                $jsonArray[$a]['meu_id'] = $value->meu_id;
//                $jsonArray[$a]['asi_photo_url'] = $value->asi_photo_url;
//                $jsonArray[$a]['asi_quantity'] = $value->asi_quantity;
//                $jsonArray[$a]['asi_width'] = $value->asi_width;
//                $jsonArray[$a]['asi_length'] = $value->asi_length;
//                $jsonArray[$a]['asi_printable_width'] = $value->asi_printable_width;
//                $jsonArray[$a]['asi_printable_length'] = $value->asi_printable_length;
//                $jsonArray[$a]['asi_notes'] = $value->asi_notes;
//                $jsonArray[$a]['asi_page_trim_length'] = $value->asi_page_trim_length;
//                $jsonArray[$a]['asi_frequency'] = $value->asi_frequency;
//                $jsonArray[$a]['asi_frequency_meu_id'] = $value->asi_frequency_meu_id;
//                $jsonArray[$a]['asi_size'] = $value->asi_size;
//                $jsonArray[$a]['asi_size_meu_id'] = $value->asi_size_meu_id;
//                $jsonArray[$a]['mec_description'] = $value->mec_description;
//                $jsonArray[$a]['meu_description'] = $value->meu_description;
//            }
//        }
//        echo '<pre>';
//        var_dump($jsonArray);
//        echo '</pre>';

//        return $jsonArray;
    }

    public function getOtherOptionsData($mediaTypeIds) {
//        echo '<pre>';
//        var_dump($mediaTypeIds);
//        echo '</pre><br /><br />';
        $array = array();
        $count = 0;
        foreach($mediaTypeIds as $id => $val) {
            foreach($val as $v) {
                $sql = "SELECT
                        asset_size.asi_id,
                        asset_size.asi_description,
                        asset_size.mec_id,
                        asset_size.meu_id,
                        asset_size.asi_photo_url,
                        asset_size.asi_quantity,
                        asset_size.asi_width,
                        asset_size.asi_length,
                        asset_size.asi_printable_width,
                        asset_size.asi_printable_length,
                        asset_size.asi_page_trim_width,
                        asset_size.asi_notes,
                        asset_size.asi_page_trim_length,
                        asset_size.asi_frequency,
                        asset_size.asi_frequency_meu_id,
                        asset_size.asi_size,
                        asset_size.asi_size_meu_id,
                        media_category.mec_description,
                        measurement_unit.meu_description,
                        MEU.meu_description
                        FROM
                        asset_size
                        INNER JOIN media_category ON asset_size.mec_id = media_category.mec_id
                        INNER JOIN measurement_unit ON asset_size.meu_id = measurement_unit.meu_id
                        INNER JOIN measurement_unit AS MEU ON asset_size.asi_size_meu_id = MEU.meu_id
                        WHERE asset_size.mec_id = '".$v."'";
                $query = $this->db->query($sql);
                $array[$v] = $query->result();
                $count++;
            }

        }
    /*
     *   ARRAY STORED AS FOLLOWS:
     */
//        Array (
//        [7] => Array (                // [7] = ID of media item
//            [0] => stdClass Object (  // [0] = Number in list of asset sizes
//                    [asi_id] => 52
//                    [asi_description] => A0
//                    [mec_id] => 7
//                    [meu_id] => 11
//                    [asi_photo_url] =>
//                    [asi_quantity] =>
//                    [asi_width] => 24.000
//                    [asi_length] => 12.000
//                    [asi_printable_width] =>
//                    [asi_printable_length] =>
//                    [asi_page_trim_width] =>
//                    [asi_notes] =>
//                    [asi_page_trim_length] =>
//                    [asi_frequency] =>
//                    [asi_frequency_meu_id] =>
//                    [asi_size] => 10
//                    [asi_size_meu_id] => 1
//                    [mec_description] => bill board (Digital)
//                    [meu_description] => second
//             )
//
//            [1] => stdClass Object (
//                    [asi_id] => 53
//                    [asi_description] => A1
//                    [mec_id] => 7
//                    [meu_id] => 11
//                    [asi_photo_url] =>
//                    [asi_quantity] =>
//                    [asi_width] => 24.000
//                    [asi_length] => 12.000
//                    [asi_printable_width] =>
//                    [asi_printable_length] =>
//                    [asi_page_trim_width] =>
//                    [asi_notes] =>
//                    [asi_page_trim_length] =>
//                    [asi_frequency] =>
//                    [asi_frequency_meu_id] =>
//                    [asi_size] => 20
//                    [asi_size_meu_id] => 1
//                    [mec_description] => bill board (Digital)
//                    [meu_description] => second
//              )
//          )

        $submissionArray = array();
        $jsonArray = array();
        foreach($array as $a => $v) {
           foreach($v as $value) {
                $jsonArray[$a]['asi_id'] = $value->asi_id;
                $jsonArray[$a]['asi_description'] = $value->asi_description;
                $jsonArray[$a]['mec_id'] = $value->mec_id;
                $jsonArray[$a]['meu_id'] = $value->meu_id;
                $jsonArray[$a]['asi_photo_url'] = $value->asi_photo_url;
                $jsonArray[$a]['asi_quantity'] = $value->asi_quantity;
                $jsonArray[$a]['asi_width'] = $value->asi_width;
                $jsonArray[$a]['asi_length'] = $value->asi_length;
                $jsonArray[$a]['asi_printable_width'] = $value->asi_printable_width;
                $jsonArray[$a]['asi_printable_length'] = $value->asi_printable_length;
                $jsonArray[$a]['asi_notes'] = $value->asi_notes;
                $jsonArray[$a]['asi_page_trim_length'] = $value->asi_page_trim_length;
                $jsonArray[$a]['asi_frequency'] = $value->asi_frequency;
                $jsonArray[$a]['asi_frequency_meu_id'] = $value->asi_frequency_meu_id;
                $jsonArray[$a]['asi_size'] = $value->asi_size;
                $jsonArray[$a]['asi_size_meu_id'] = $value->asi_size_meu_id;
                $jsonArray[$a]['mec_description'] = $value->mec_description;
                $jsonArray[$a]['meu_description'] = $value->meu_description;
           }
       }
//        echo '<pre>';
//        var_dump($jsonArray);
//        echo '</pre>';

        return $jsonArray;

    }

    public function getAverageAssetPrice($type, $addresses) {
        $allAddresses = array();
        for($i = 0; $i < count($addresses); $i++) {
            $allAddresses[$i] = $addresses[$i];
        }

        $result = array();
        $count = 0;
        foreach($allAddresses as $address) {
            $aa = explode(',', $address);
            $area = $aa[0];
            $sqlSelect = "SELECT MAX(ass_production_price_SCY) FROM asset INNER JOIN media_category ON asset.mec_id = media_category.mec_id WHERE media_category.mec_description = '". htmlspecialchars($type) ."' AND (ass_city = '". htmlspecialchars($area) ."' OR ass_province = '". htmlspecialchars($area) ."' OR ass_country = '". htmlspecialchars($area) ."')";

            $query = $this->db->query($sqlSelect);
            $max = 0;
            foreach($query->result()[0] as $q => $v) {
                $max = $v;
            }

            $sqlSelect2 = "SELECT MIN(ass_production_price_SCY) FROM asset INNER JOIN media_category ON asset.mec_id = media_category.mec_id WHERE media_category.mec_description = '". htmlspecialchars($type) ."' AND (ass_city = '". htmlspecialchars($area) ."' OR ass_province = '". htmlspecialchars($area) ."' OR ass_country = '". htmlspecialchars($area) ."')";
            $query2 = $this->db->query($sqlSelect2);
            $min = 0;
            foreach($query2->result()[0] as $q => $v) {
                $min = $v;
            }

            $result[$count]['categoryid'] = $this->db->query("select * from media_category WHERE media_category.mec_description = '". htmlspecialchars($type) ."'")->result();
            $result[$count]['address'] = $address;
            $result[$count]['type'] = $type;
            $result[$count]['aap'] = ($max + $min) / 2;

            $count++;
        }
        return $result;
    }

    public function get_campaigns($conditions = null) {
        
        $this->db->select("c.*, u.use_username");
        $this->db->from("campaign c");
        $this->db->join("user u", "u.use_id=c.adv_id");
        
        //TODO: Implements the conditions here.
        
        $query = $this->db->get();
        
        return $query->result();
    }

    public function get_user_campaigns($user_id, $conditions = null) {
        
        $this->db->select("c.*, u.use_username");
        $this->db->from("campaign c");
        $this->db->join("user u", "u.use_id=c.adv_id");
        $this->db->where('c.adv_id', $user_id);
        
        
        //TODO: Implements the conditions here.
        
        $query = $this->db->get();
        
        return $query->result();
    }

    public function saveCampaignHeaderInfo($requestedStartDate, $requestedEndDate, $title, $budget, $requestedResponseDate, $description, $partialAvailabilityStatus) {

        $id =$this->session->userdata('user_id');
        $data = array(
            'cam_requested_start_date' => $requestedStartDate,
            'cam_requested_end_date' => $requestedEndDate,
            'cam_title' => $title,
            'cam_budget' => $budget,
            'cam_requested_response_date' => $requestedResponseDate,
            'cam_description' => $description,
            'cam_partial_availability_status' => $partialAvailabilityStatus,
            'adv_id' => $id,
            'pro_status_id' => 1
        );
        $this->db->insert('campaign', $data);
        return $this->db->insert_id();
    }

    public function saveCampaignTransactionInfo($cam_id, $mec_id, $lat, $long, $quantity) {
        $query = $this->db->query("INSERT INTO campaign_transaction (`cam_id`, `mec_id`, `cam_latitude`, `cam_longitude`, `quantity`) VALUES ('". $cam_id ."', '". $mec_id ."', '". $lat ."', '". $long ."', '". $quantity ."')");
    }

    public function saveCampaignLocationInfo($campaignID, $adv_id, $lat, $long, $media_types) {

        $query = $this->db->query("INSERT INTO rfp_transactions (`cam_id`, `adv_id`, `lat`, `long`) VALUES ('". $campaignID ."', '". $adv_id ."', '". $lat ."', '". $long ."')");

        $rfp_transaction_id = $this->db->insert_id();

//        foreach($media_types as $mt) {
            foreach($media_types as $mt) {
                $mec_id_data = $this->db->query("SELECT mec_id FROM media_category WHERE mec_description = '". $mt ."'");
                $mec_id_2 = $mec_id_data->result()[0];
                $mec_id = $mec_id_2->mec_id;
                $q2 = $this->db->query("INSERT INTO campaign_transaction (`cam_id`, `rfp_transaction_id`, `quantity`, `mec_id`) VALUES ('". $campaignID ."', '". $rfp_transaction_id ."', '1', '". $mec_id ."')");
            }
//        }
    }

    public function saveCampaignScreenshots($campaignID, $imageName) {
        $data = array(
            'cam_id' => $campaignID,
            'image_name' => $imageName
        );
        $this->db->insert('rfp_campaign_screenshot', $data);
        return $this->db->insert_id();
    }

    public function getAllLocationsFromCampaignId($id) {
        $query = $this->db->query("SELECT * FROM rfp_transactions WHERE cam_id = '". $id ."'");
        return $query->result();
    }

    /* Begin Workflow Functions */

    public function getCampaignDetails($campaignID) {
        $query = $this->db->query("SELECT *,
                                        CONCAT(IF(cam_status=0,'P','C'),LPAD(cam_id, 6, '0')) AS cam_ref,
                                        IF(cam_status=0,'Proposal','Contract') as cam_status_text,
                                        IF(cam_status=0,'WIP','Completed') as cam_workflow_text 
                                   FROM campaign 
                                    WHERE 
                                    cam_id = " . $campaignID, 
                                    false);
        return $query->result();
    }

    public function getGeMecID($campaignID) {
        $query = $this->db->query("SELECT mec_id FROM campaign_transaction WHERE cam_id = " . $campaignID);
        return $query->result();
    }

    public function saveCampaignLocationData($campaignID, $lat, $long, $mediaTypes) {
        $data = array(
            'cam_id' => $campaignID,
            'adv_id' => $this->session->userdata('user_id'),
            'lat' => $lat,
            'long' => $long
        );
        $this->db->insert('rfp_transactions', $data);
        $id = $this->db->insert_id();
        foreach($mediaTypes as $media_type) {
            $mec_id = $this->db->query("SELECT mec_id FROM media_category WHERE mec_description = '". $media_type ."'")->result()[0]->mec_id;
            $tran_data = array(
                'cam_id' => $campaignID,
                'rfp_transaction_id' => $id,
                'quantity' => 1,
                'mec_id' => $mec_id
            );
            $this->db->insert('campaign_transaction', $tran_data);
        }
    }

    public function updateData($id, $data) {
        $this->db->where('cam_id', $id);
        $this->db->update('campaign', $data);
    }

    public function getCampaignSendFromOperator($advertiserID, $campaignID) {
        $sql = "
            select
                *
            from campaign
            where cam_id = $campaignID and adv_id = $advertiserID
            and pro_status_id = 14
        ";
        $query = $this->db->query($sql);
        return $query->result();
    }

    public function getCampaignDetailsLineItems($campaignID) {

        if($campaignID > 0){

            $query = $this->db->query("SELECT DISTINCT
                CONCAT(`user`.use_first_name,',',`user`.use_last_name) as ass_owner,
                'Owner Ref#' as ass_owner_site,
                rfp_for_submission.rfp_for_submission_id,
                rfp_for_submission.campaign_id,
                rfp_for_submission_locations.lat,
                rfp_for_submission_locations.`long`,
                'Outdoor' as ass_site_category,
                media_categories.description AS ass_site_type,
                asset_size.asi_description AS asset_size,
                rfp_for_submission_assets_selected.asset_id,
                asset.ass_name as ass_site,
                asset.ass_description,
                asset.position,
                asset.ass_ref,
                asset.ass_street_address,
                asset.ass_city,
                asset.ass_province,
                asset.ass_country,
                asset.asset_status_id,
                asset_status.asset_status,
                rfp_for_submission_assets_selected.from_date,
                rfp_for_submission_assets_selected.to_date
                FROM
                rfp_for_submission
                INNER JOIN rfp_for_submission_more_options ON rfp_for_submission_more_options.rfp_for_submission_id = rfp_for_submission.rfp_for_submission_id
                INNER JOIN rfp_for_submission_media_categories ON rfp_for_submission_media_categories.rfp_for_submission_id = rfp_for_submission.rfp_for_submission_id
                INNER JOIN rfp_for_submission_locations ON rfp_for_submission_locations.rfp_for_submission_id = rfp_for_submission_media_categories.rfp_for_submission_id
                INNER JOIN media_categories ON media_categories.mec_id = rfp_for_submission_media_categories.media_category_id
                INNER JOIN asset_size ON asset_size.asi_id = rfp_for_submission_more_options.more_options_id
                INNER JOIN rfp_for_submission_assets_selected ON rfp_for_submission_assets_selected.rfp_for_submission_id = rfp_for_submission_more_options.rfp_for_submission_id
                LEFT JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id
                LEFT JOIN asset_status ON asset_status.asset_status_id = asset.asset_status_id
                INNER JOIN `user` ON `user`.use_id = rfp_for_submission.media_owner_id
                WHERE
                rfp_for_submission.campaign_id = '$campaignID'
                ORDER BY
                lat,
                asset.ass_province ASC,
                asset.ass_city ASC
            ");

            $query = $this->db->query("SELECT DISTINCT
                rfp_for_submission.campaign_id,
                rfp_for_submission_assets_selected.rfp_for_submission_id,
                rfp_for_submission.operator_id,
                rfp_for_submission_assets_selected.media_categories_id,
                rfp_for_submission_assets_selected.asset_id,
                CONCAT(`user`.use_first_name,',',`user`.use_last_name) AS ass_owner,
                'Owner Ref#' AS ass_owner_site,
                'Outdoor' AS ass_site_category,
                rfp_for_submission_assets_selected.transaction_date,
                rfp_for_submission_assets_selected.from_date,
                rfp_for_submission_assets_selected.to_date,
                rfp_for_submission_assets_selected.active,
                rfp_for_submission_assets_selected.completed,
                rfp_for_submission_assets_selected.location,
                IFNULL(asset_status.asset_status,'Not Yet Started') as asset_status,
                asset.ass_name as ass_site,
                asset.ass_description,
                asset.position,
                asset.ass_ref,
                asset.ass_city,
                asset.ass_province,
                asset.ass_country,
                asset.ass_status,
                media_categories.description AS ass_site_type, 
                rfp_for_submission_more_options.more_options_id,
                IFNULL(asset_size.asi_description ,'A0') as asset_size,
		Max(workflow_asset_status.id)
                FROM
                rfp_for_submission_assets_selected
                INNER JOIN rfp_for_submission ON rfp_for_submission.rfp_for_submission_id = rfp_for_submission_assets_selected.rfp_for_submission_id
                LEFT JOIN workflow_asset_status ON workflow_asset_status.campaign_id = rfp_for_submission.campaign_id AND workflow_asset_status.asset_id = rfp_for_submission_assets_selected.asset_id
                LEFT JOIN asset_status ON asset_status.asset_status_id = workflow_asset_status.asset_status_id
                LEFT JOIN asset ON rfp_for_submission_assets_selected.asset_id = asset.ass_id
                INNER JOIN `user` ON `user`.use_id = asset.use_id
                INNER JOIN media_categories ON media_categories.mec_id = asset.mec_id
                LEFT JOIN rfp_for_submission_more_options ON rfp_for_submission_more_options.rfp_for_submission_id = rfp_for_submission_assets_selected.rfp_for_submission_id
                LEFT JOIN asset_size ON asset_size.asi_id = rfp_for_submission_more_options.more_options_id
                WHERE
                	rfp_for_submission.campaign_id = '$campaignID'
		GROUP BY
rfp_for_submission.campaign_id,
rfp_for_submission_assets_selected.rfp_for_submission_id,
rfp_for_submission.operator_id,
rfp_for_submission_assets_selected.media_categories_id,
rfp_for_submission_assets_selected.asset_id,
rfp_for_submission_assets_selected.transaction_date,
rfp_for_submission_assets_selected.from_date,
rfp_for_submission_assets_selected.to_date,
rfp_for_submission_assets_selected.active,
rfp_for_submission_assets_selected.completed,
rfp_for_submission_assets_selected.location,
asset.ass_name,
asset.ass_description,
asset.position,
asset.ass_ref,
asset.ass_city,
asset.ass_province,
asset.ass_country,
asset.ass_status,
media_categories.description,
rfp_for_submission_more_options.more_options_id


            ");

            return $query->result();   
        } else {
            return false; //No Campaign ID supplied
        }
    }

    public function getCampaignMediaOwners($campaign_id) {


        $this->db->where('campaign_id',$campaign_id);
        return $this->db->get('rfp_for_submission')->result();

    }

    public function getCampaignAdvertiser($campaign_id) {

        $this->db->where('cam_id',$campaign_id);
        return $this->db->get('campaign')->result();

    }

    public function getWorkflowStatuses() {

        $this->db->where('pro_status_id >=','6');
        return $this->db->get('proposal_status')->result();

    }

    public function getWorkflowStatusHistory($campaignID) {

        $query = $this->db->query("
                        SELECT
                            workflow_status.proposal_status_id,
                            proposal_status.prs_description,
                            workflow_status.user_id,
                            `user`.use_username,
                            workflow_status.comments,
                            workflow_status.created_at,
                            workflow_status.updated_at
                        FROM
                            workflow_status
                        INNER JOIN proposal_status 
                            ON proposal_status.pro_status_id = workflow_status.proposal_status_id
                        LEFT JOIN `user` ON `user`.use_id = workflow_status.user_id
                        WHERE workflow_status.campaign_id = '$campaignID'");

        return $query->result();

    }

    public function getWorkflowAssetStatuses() {

        return $this->db->get('asset_status')->result();

    }

    public function getWorkflowAssetStatusHistory($campaignID) {

        $query = $this->db->query("
                        SELECT
                            workflow_asset_status.proposal_status_id,
                            asset_status.prs_description,
                            workflow_asset_status.user_id,
                            `user`.use_username,
                            workflow_asset_status.comments,
                            workflow_asset_status.created_at,
                            workflow_asset_status.updated_at
                        FROM
                            workflow_asset_status
                        INNER JOIN asset_status 
                            ON asset_status.asset_status_id = workflow_asset_status.asset_status_id
                        LEFT JOIN `user` ON `user`.use_id = workflow_asset_status.user_id
                        WHERE workflow_asset_status.campaign_id = '$campaignID'");

        return $query->result();

    }

    // Begin Workflow Updates
    public function updateWorkflowStatus($data) {
        // create workflow_status record
        $this->db->insert('workflow_status', $data);

        // Return the workflow_status record if just created
        return $this->db->insert_id();
    }

    public function updateWorkflowAssetsStatuses($data) {
        //if we have an array of records then use batch insert else use single row insert
        if($this->isMultiArray($data)){
            // create multiple workflow_asset_status record
            $this->db->insert_batch('workflow_asset_status', $data);
        } else {
            // create one workflow_asset_status record
            $this->db->insert('workflow_asset_status', $data);
        }
        // Return the workflow_status record if just created
        return $this->db->insert_id();
    }

    public function createWorkflowMessages($data) {
        // create workflow_status record
        $this->db->insert('workflow_messages', $data);

        // Return the workflow_status record if just created
        return $this->db->insert_id();
    }

    // End Workflow Updates

    // Workflow events
    public function getWorkflowEvents($campaign_id) {
        $this->db->select("e.*");
        $this->db->from('system_events'." e");

        //Conditions
        $this->db->where("e.event_object_id", $campaign_id);
        $this->db->where("e.event_type", 3); // campaign
        $query = $this->db->get();     
        $row =  $query->row();       
        if(empty($row)) {
            return null;
        }
        return $query->result();
    }

    // Workflow attachments
    public function getWorkflowAttachments($campaign_id) {

        $this->db->select("u.*,d.dot_description");
        $this->db->from('uploaded_documents'." u");
        $this->db->join('document_type d','d.dot_id=u.dot_id');
        //Conditions
        $this->db->where("u.rfp_id", $campaign_id);
        $query = $this->db->get();     
        $row =  $query->row();       
        if(empty($row)) {
            return null;
        }
        return $query->result();
    }

    //Begin Get Filters Data
    public function getAllMediaOwners() {
        $this->db->where('ust_id', 2); //All Media Owners
        return $this->db->get('user')->result();
    }

    public function getAllAdvertisers() {
        $this->db->where('ust_id', 1); //All Advertisers
        return $this->db->get('user')->result();
    }

    public function getContractNumbers() {
        $query = $this->db->query("SELECT cam_id, CONCAT(IF(cam_status=0,'P','C'),LPAD(cam_id, 6, '0')) AS cam_ref,
                                        IF(cam_status=0,'Proposal','Contract') as cam_status_text,
                                        IF(cam_status=0,'WIP','Completed') as cam_workflow_text ,
                                        CONCAT(SUBSTR(cam_title,1,15),'...') as cam_title
                                   FROM campaign 
                                   LIMIT 1,30", 
                                    false);
        return $query->result();
    }

    public function getWorkflowOrigins() {
        return $this->db->get('workflow_origin')->result();
    }

    //End Get Filters Data

    /* End Workflow Functions */

    function saveCampaignLocationData($campaignID, $lat, $long, $mediaTypes) {
        $query = $this->db->query("INSERT INTO rfp_transactions (`cam_id`, `adv_id`, `lat`, `long`) VALUES ('" . $campaignID . "', '" . $this->session->userdata('user_id') . "', '" . $lat . "', '" . $long . "')");
        $id = $this->db->insert_id();
        for($i = 0; $i < count($mediaTypes); $i++) {
            $mec_id = $this->db->query("SELECT mec_id FROM media_category WHERE mec_description = '". $mediaTypes[$i] ."'")->result()[0]->mec_id;
            $query2 = $this->db->query("INSERT INTO campaign_transaction (`cam_id`, `rfp_transaction_id`, `quantity`, `mec_id`) VALUES ('". $campaignID ."', '". $id ."', '1', '". $mec_id ."')");
        }
    }

    // Utility functions

    public function getDocumentTypes() {
        return $this->db->get('document_type')->result();
    }

    /* Check if argument is a multi-dimentional array*/
    function isMultiArray($a){
        foreach($a as $v) 
            if(is_array($v)) 
                return true;
        return false;
    }   
    
}

/* **********************************************************************************
CI Insert Batch Example

$data = array(
   array(
      'title' => 'My title' ,
      'name' => 'My Name' ,
      'date' => 'My date'
   ),
   array(
      'title' => 'Another title' ,
      'name' => 'Another Name' ,
      'date' => 'Another date'
   )
);

$this->db->insert_batch('mytable', $data);

***********************************************************************************/
