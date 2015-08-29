<?php
error_reporting(null);

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class new_campaign extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('media_category');
        $this->load->model('city');
        $this->load->library('googlemaps');
        $this->load->model('asset_size');
        $this->load->model('uploaded_documents');
        $this->load->model('rfp');
        $this->load->model('media_family');
        $this->load->model('asset');
        $this->load->model('campaign_model');
        $this->load->model('user');
        $this->load->model('rfp_for_submission');
        $this->load->model('rfp_for_submission_assets_selected');
        $this->load->model('rfp_for_submission_locations');
        $this->load->model('rfp_for_submission_media_categories');
        $this->load->model('rfp_for_submission_more_options');
        $this->load->library('Pdf');
        $this->load->model('workflow_status');
        $this->load->model('rfp_for_submission_comment');
    }

    public function media_owner_accepted_proposals() {

        /**
         *  1. GET all completed RFP's
         */
        $rfps = $this->rfp_for_submission->getAllRFPsForMediaOwnerAcceptedProposals($this->session->userdata('user_id'));
        $allCampaignDetails = array();
        for ($i = 0; $i < count($rfps); $i++) {
            $allCampaignDetails[] = $this->rfp->getRfpForIdForComplete($rfps[$i]->campaign_id);
        }

        $data['campaignDetails'] = $allCampaignDetails;

        /**
         *  2. RETURN
         */
        $this->load->view('media_owner_accepted_proposals', array_merge($data));

    }

    public function accepted_proposals() {
        /**
         *  1. GET all completed RFP's
         */
        $rfps = $this->rfp_for_submission->getAllRFPsForOperatorAcceptedProposals($this->session->userdata('user_id'));
        $allCampaignDetails = array();
        for ($i = 0; $i < count($rfps); $i++) {
            $allCampaignDetails[] = $this->rfp->getRfpForIdForComplete($rfps[$i]->campaign_id);
        }

        $data['campaignDetails'] = $allCampaignDetails;

        /**
         *  2. RETURN
         */
        $this->load->view('accepted_proposal', array_merge($data));
    }

    public function submitProposalToMediaOwner() {

        $POST = $this->input->post();
        $id = $POST['id'];
        $moid = $POST['moid'];
        $data = json_decode($POST['data']);
        $totalAmount = $POST['total'];
        $discountedTotal = $POST['discounted_total'];
        $operatorID = $this->session->userdata('user_id');

        /*
         *  1. Get RFP
         */
        /*
         *  1. GET RFP ID
         */
        $rfp = $this->rfp_for_submission->getRFPForMediaOwnerIDAndCampaignID($id, $moid);
        $rfpID = $rfp->rfp_for_submission_id;

        /*
         *  2. Update RFP for submission assets selected
         */
        $this->db->query("UPDATE rfp_for_submission_assets_selected SET active = 0 WHERE rfp_for_submission_id = '". $rfpID ."'");

        /*
         *  3. Insert new assets selected
         */
        $created_timestamp = date('Y-m-d H:i:s');
        foreach($data as $assetID => $assets) {
            foreach($assets as $location => $asset) {
                $lat = $asset->lat;
                $lng = $asset->lng;
                $start = $asset->start;
                $end = $asset->end;
                $mecid = $asset->mecid;
                $loc = $asset->location;
                $price = $asset->price;
                $cost = $asset->cost;
                $assetName = $asset->assetName;
                $type = $asset->type;

                $this->rfp_for_submission_assets_selected->insertAssetSelectedOperator($rfpID, $mecid, $assetID, $operatorID, $start, $end, $location, $rfp->media_owner_id, $created_timestamp);
            }
        }

        /*
         *  4. Update main RFP
         */
        $this->db->query("UPDATE rfp_for_submission SET `total` = '". $totalAmount ."', `discount` = '". $discountedTotal ."', `proccessed_operator` = '1', `proccessed_media_owner` = '0', `process` = '0', `complete` = '0' WHERE rfp_for_submission_id = '". $rfpID ."'");

        /*
         *  5. RETURN
         */
        $this->output->set_content_type('application/json');
        $arr = array();
        $arr = array('success' => 'true');
        $this->output->set_output(json_encode($arr));
    }

    public function acceptOperatorsProposal() {
        $POST = $this->input->post();
        
        $campaignID = $POST['id'];
        $operatorID = $POST['oid'];

        /**
         *  1. GET main RFP
         */
        $rfp = $this->rfp_for_submission->getRFPForMediaOwnerIDAndCampaignID($campaignID, $this->session->userdata('user_id'));
        $rfpID = $rfp->rfp_for_submission_id;

        /**
         *  2. UPDATE main RFP
         *      - processed_media_owner
         *      - process = 1
         */
        $mainRFPSQL = "UPDATE rfp_for_submission SET `proccessed_media_owner` = 1, `process` = 1 WHERE `rfp_for_submission_id` = " . $rfpID;
        $this->db->query($mainRFPSQL);

        /**
         *  3. UPDATE SELECTED ASSETS
         *      - accepted_by_media_owner
         */
        $selectedAssetsSQL = "UPDATE rfp_for_submission_assets_selected SET `accepted_by_media_owner` = 1 WHERE `rfp_for_submission_id` = " . $rfpID;
        $this->db->query($selectedAssetsSQL);

        /**
         *  4. RETURN
         */
        $this->output->set_content_type('application/json');
        $arr = array();
        $arr = array('success' => 'true');
        $this->output->set_output(json_encode($arr));

    }

    public function quotesFromOperator() {
        $id = $this->session->userdata('user_id');

        $allCampaigns = $this->rfp_for_submission->getCompleteRfpForSubmissions($id);

        $data['campaignDetails'] = $allCampaigns;

        $this->load->view('advertiser_quote_list', array_merge($data));
    }

    public function cancelRFP() {

        $this->db->delete('campaign',array('cam_id'=>$_GET['id']));

        redirect('/new_campaign/ad_campaigns', 'refresh');
    }

    public function getQuote() {
        // get the id of the relevant campaign
        //$campaignID = $_GET['id'];
        $rfp_for_submission_id = $_GET['id'];
        // get the rfp for that campaign
        //$rfp = $this->db->query("SELECT * FROM rfp_for_submission WHERE campaign_id = ".$rfp_for_submission_id." AND (process = 1 OR process = 2) ORDER BY rfp_for_submission_id DESC")->result()[0];


        // get the selected assets
        //$allSelectedAssets = $this->db->query("SELECT * FROM rfp_for_submission_assets_selected INNER JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id WHERE rfp_for_submission_id = ".$rfp_for_submission_id." AND accepted_by_media_owner = 1")->result();
        $allSelectedAssets = $this->rfp_for_submission_assets_selected->getRfpSubmissionSelectedAssets($rfp_for_submission_id);

        $allInfoHTML = "";
        $data = array();

        foreach($allSelectedAssets as $asset) {
            $tempHTML = "";

            $name = $asset->ass_name;
            $description = $asset->ass_description;
            $position = $asset->position;
            $price = $asset->ass_production_price_SCY;
            $address = $asset->ass_address;
            $reference = $asset->ass_ref;
            $mecid = $asset->mec_id;
            $mediaCategory = $this->db->query("SELECT * FROM media_categories WHERE mec_id = ".$mecid)->result()[0]->description;
            if(!isset($data[$asset->location])) {
                $data[$asset->location] = array();
            }
            if( isset($data[$asset->location][$mediaCategory]) ) {
                $data[$asset->location][$mediaCategory] = array();
            }
            $data[$asset->location][$mediaCategory][] = $asset;
            $tempHTML = '
                <h3>'. $name .'</h3>
                <small><p><em>'. $description .'</em></p></small><br /><br />
                <p><strong>Reference:</strong> '. $reference .'</p>
                <p><strong>Media Category:</strong> '. $mediaCategory .'</p>
                <p><strong>Price:</strong> '. $price .'</p>
                <p><strong>Address:</strong> '. $address .'</p>
                <p><strong>Position:</strong> '. $position .'</p>
                <br /><br /><hr><br /><br />
            ';

            $allInfoHTML .= $tempHTML;

        }
//        exit;
        // create PDF
        $pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
        // Add a page
        $pdf->AddPage();
        $html = "<h1>Ads 2 trade</h1><hr /><br /><br />".$allInfoHTML.'<br />>'.$tempHTML;

        $html = $this->load->view('quotation_pdf_sheet', array('data'=>$data), true);

        $pdf->writeHTML($html, true, false, true, false, '');


        // output PDF
        $pdf->Output('example_001.pdf', 'I');
    }

    public function submitProposalToAdvertiserFinalApproval() {

        $campaignID = $_GET['id'];
        $mediaOwnerID = $_GET['moid'];

        /**
         *  1. GET main RFP
         */
        $rfp = $this->rfp_for_submission->getRFPForMediaOwnerIDAndCampaignID($campaignID, $mediaOwnerID);
        $rfpID = $rfp->rfp_for_submission_id;

        $count = count($this->rfp_for_submission_assets_selected->getAssetSelectedCount($rfpID, $mediaOwnerID, $campaignID));

        if($count > 0) {
            /**
             *  2. UPDATE main RFP
             *      - process = 2
             *      - complete = 1
             */
            $updateMainRFPSQL = "UPDATE rfp_for_submission SET `process` = 2, `complete` = 1 WHERE rfp_for_submission_id = " . $rfpID;
            $this->db->query($updateMainRFPSQL);

            /**
             *  3. UPDATE assets selected for RFP
             */
            $updateAssetsSelectedSQL = "UPDATE rfp_for_submission_assets_selected SET `active` = 2, `completed` = 1 WHERE rfp_for_submission_id = " . $rfpID . " AND accepted_by_operator = 1 AND accepted_by_media_owner = 1";
            $this->db->query($updateAssetsSelectedSQL);

            /**
             *  4. RETURN
             */
            $this->load->view('final_quote_sent_to_advertiser', array_merge(array()));
        } else {
            $this->load->view('final_quote_not_sent_to_advertiser', array_merge(array()));
        }
    }


    public function saveSendToOperator() {

        /**
         *  $Variables
         */
        $POST = $this->input->post();
        $id = $POST['id'];
        $operatorID =  $POST['oid'];
        $data = json_decode($POST['data']);
        $t = false;
        $assetsAlreadySelected = $POST['assetsAlreadySelected'];

        /**
         *  1. SELECT main RFP
         */
        $rfp = $this->db->query("SELECT * FROM rfp_for_submission WHERE campaign_id = '" . $id . "' AND media_owner_id = '". $this->session->userdata('user_id') ."'")->result()[0];
        // 1.1 get RFPID
        $rfpID = $rfp->rfp_for_submission_id;
        // 1.2 get operatorID
        $operatorID = $rfp->operator_id;
        $mediaOwnerID = $rfp->media_owner_id;

        /**
         *  2. UPDATE all assets already selected
         */
        if($assetsAlreadySelected == "true") {
            $this->db->query("UPDATE rfp_for_submission_assets_selected SET active = 0 WHERE rfp_for_submission_id = '". $rfpID ."'");
        }

        /**
         *  3. INSERT all Assets Selected
         */
        $created_timestamp = date('Y-m-d H:i:s');
        foreach($data as $assetID => $assets) {
            foreach($assets as $location => $asset) {
                $lat = $asset->lat;
                $lng = $asset->lng;
                $start = $asset->start;
                $end = $asset->end;
                $mecid = $asset->mecid;
                $loc = $asset->location;
                $price = $asset->price;
                $cost = $asset->cost;
                $assetName = $asset->assetName;
                $type = $asset->type;

                $this->rfp_for_submission_assets_selected->insertAssetSelected($rfpID, $mecid, $assetID, $operatorID, $start, $end, $location, $mediaOwnerID, $created_timestamp);
            }
        }

        /**
         *  4. UPDATE rfp with total price, discounted total price and processed by operator
         */
        $this->db->query("UPDATE rfp_for_submission SET `total` = '". $POST['finalPrice'] ."', `discount` = '". $POST['discountedTotal'] ."', `proccessed_operator` = '0', `proccessed_media_owner` = '1' WHERE rfp_for_submission_id = '". $rfpID ."'");

        $statusData = array(
            'campaign_id' => $id,
            'proposal_status_id' => 2,
            'user_id' => $this->session->userdata('user_id'),
            'created_at' => date('Y-m-d H:j:s'),
            'updated_at' => date('Y-m-d H:j:s')
        );
        $this->workflow_status->createStatus($statusData);


        /**
         *  5. RETURN
         */
        $this->output->set_content_type('application/json');
        $arr = array();
        $arr = array('success' => 'true');
        $this->output->set_output(json_encode($arr));
    }

    public function media_owner_campaign_list()
    {
        $rfps = $this->rfp_for_submission->getAllRFPsForMediaOwner($this->session->userdata('user_id'));
        $allCampaignDetails = array();
        for ($i = 0; $i < count($rfps); $i++) {
            $allCampaignDetails[] = $this->rfp->getRfpForId($rfps[$i]->campaign_id)[0];
        }

        $data['campaignDetails'] = $allCampaignDetails;

        $this->load->view('media_owner_campaign_list', array_merge($data));
    }

    public function getMecName($id)
    {
        $query = $this->db->query("SELECT description FROM media_categories WHERE mec_id = '" . $id . "'");
        return $query->result();
    }

    public function operator_campaign_management_details() {
        $campaignID = $_GET['id'];
        $mediaOwnerID = $_GET['moid'];
        $noResults = array();
        $allTypes = array();
        $allTypesWithIdKeys = array();
        $allData = array();
        $allSelectedAssets = array();
        $selectedAssets = array();
        $campDeets = $this->rfp->getRfpForId($campaignID);
        $allData['campaignDetails'] = $campDeets;
        #get the asset details
        $media_cats['media_cats'] = $this->campaign_model->getGeMecID($campaignID);
        //echo $media_cats->mec_id;
        $rfps = null;
        foreach($media_cats as  $data)
        {
            foreach($data as  $key)
            {
                $mec_id = (int)($key->mec_id);
                $asset_details['asset_details'] = $this->asset->assetByID($campaignID , $key->mec_id);
            }
        }

        $locations = array();
        // get all the data for the location -> type -> options requested
        $rfps = $this->rfp_for_submission->getRFPWithCampaignIDForMediaOwner($mediaOwnerID, $campDeets[0]->cam_id); //$this->session->userdata('user_id')

        $allData['totalAmount'] = $rfps[0]->total;
        $allData['discountAmount'] = $rfps[0]->discount;

        $rfps_more_options = array();
        $allCampaignDetails = array();
        if ($rfps) {
            $rfps_locations = $this->rfp_for_submission_locations->getLocationsForID($rfps[0]->rfp_for_submission_id);
            for ($i = 0; $i < count($rfps_locations); $i++) {

                // get location name from coordinates
                $locations[$i] = $rfps_locations[$i]->lat . ',' . $rfps_locations[$i]->long;
                $locAddress = $this->getAddressFromLatLong($rfps_locations[$i]->lat, $rfps_locations[$i]->long);
                $locStuff = explode(',', $locAddress);
                if (isset($locStuff[3])) {
                    $loc = trim($locStuff[1]) . ', ' . trim($locStuff[3]);
                } else {
                    if (isset($locStuff[1])) {
                        $loc = trim($locStuff[0]) . ', ' . trim($locStuff[1]);
                    } else {
                        if ($locStuff[0] != "not available") {
                            $loc = trim($locStuff[0]);
                        } else {
                            $loc = $locations[$i];
                        }
                    }
                }

                $allCampaignDetails[$loc] = array();
                $mediaCategories = $this->rfp_for_submission_media_categories->getMediaCategoriesForLocationAndRFPID($rfps_locations[$i]->rfp_for_submission_locations_id, $campaignID, $mediaOwnerID); //$this->session->userdata('user_id')
                $alreadyInMediaCategories = array();
                $count = 0;
                for ($j = 0; $j < count($mediaCategories); $j++) {
                    $moreOptionsTemp = $this->rfp_for_submission_more_options->getMoreOptionsForMediaCategoryID($mediaCategories[$j]->media_category_id, $rfps_locations[$i]->rfp_for_submission_locations_id, $rfps[0]->rfp_for_submission_id);
                    $mediaCategoryName = $this->media_category->getMediaCategoryNameFromID($mediaCategories[$j]->media_category_id);
                    $mo = "";
                    for ($k = 0; $k < count($moreOptionsTemp); $k++) {
                        $moName = $this->asset_size->getNameForMoreOptionByID($moreOptionsTemp[$k]->more_options_id);
                        if ($mo == "") {
                            $mo = $moName;
                        } else {
                            $mo .= ', ' . $moName;
                        }
                    }
                    if (!in_array($mediaCategoryName, $allTypes)) {
                        $allTypes[] = $mediaCategoryName;
                        $allTypesWithIdKeys[$mediaCategories[$j]->media_category_id] = $mediaCategoryName;
                    }
                    $allCampaignDetails[$loc][$mediaCategoryName]['more_options'] = $mo;
                    $allCampaignDetails[$loc][$mediaCategoryName]['quantity'] = $mediaCategories[$j]->quantity;
//                    echo $quantity;
                    $allCampaignDetails[$loc][$mediaCategoryName]['cat_id'] = $mediaCategories[$j]->media_category_id;
                    $allCampaignDetails[$loc][$mediaCategoryName]['ass_id'] = $mediaCategories[$j]->ass_id;
                    $allCampaignDetails[$loc][$mediaCategoryName]['type'] = $this->media_category->getMediaCategoryNameFromID($mediaCategories[$j]->media_category_id);
                    $allCampaignDetails[$loc][$mediaCategoryName]['lat'] = $rfps_locations[$i]->lat;
                    $allCampaignDetails[$loc][$mediaCategoryName]['long'] = $rfps_locations[$i]->long;
                }
            }
            // get all assets in location
            $selectedAssets = $this->rfp_for_submission_assets_selected->getSelectedAssets($rfps[0]->rfp_for_submission_id, $mediaOwnerID); //$this->session->userdata('user_id')
        }
//        echo 'this<pre>';
//        print_r($allCampaignDetails);
//        echo '</pre>';
//        die();
        $allData['allCampaignDetails'] = $allCampaignDetails;
//        $id = $this->session->userdata('id');
//        // echo $id;
        // get all assets from media to choose from
        $allAssets = array();
        for ($i = 0; $i < count($locations); $i++) {
            $locationsLatLngs = explode(",", $locations[$i]);
            $lat = $locationsLatLngs[0];
            $lng = $locationsLatLngs[1];
            $latLngAddress = $this->getAddressFromLatLong($lat, $lng);
//            // echo $latLngAddress;
            $latLngAddressStuff = explode(",", $latLngAddress);

            if (isset($latLngAddressStuff[1])) {
                $city = trim($latLngAddressStuff[1]);
            } else {
                $city = "";
            }
            if (isset($latLngAddressStuff[3])) {
                $country = trim($latLngAddressStuff[3]);
            } else {
                $country = "";
            }

            $mainAddress = $city . ', ' . $country;
//            // echo $mainAddress . '<br />';
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
            3956*2*ASIN(SQRT(POWER(SIN((" . $lat . " - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1))*pi()/180 / 2), 2) + COS(" . $lat . " * pi() / 180) * COS(SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) * pi()/180) * POWER(SIN((" . $lng . " - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1))*pi()/180 / 2),2))) AS distance
            FROM
            asset
            INNER JOIN media_category ON asset.mec_id = media_category.mec_id
            WHERE
            asset.med_id = " . $mediaOwnerID . "
            HAVING distance < 12")->result();

            $allLocations = array();
            $tempAsset = array();
            $count = 0;
            $alreadyInArray = array();

            for ($j = 0; $j < count($answer); $j++) {
                $tempAsset['ass_id'] = $answer[$j]->ass_id;
                $tempAsset['ast_id'] = $answer[$j]->ast_id;
                $tempAsset['ass_name'] = $answer[$j]->ass_name;
                $tempAsset['ass_description'] = $answer[$j]->ass_description;
                $tempAsset['position'] = $answer[$j]->position;
                $tempAsset['ass_ref'] = $answer[$j]->ass_ref;
                $tempAsset['emp_id_maintenance'] = $answer[$j]->emp_id_maintenance;
                $tempAsset['ass_disposed_of'] = $answer[$j]->ass_disposed_of;
                $tempAsset['ass_acquisition_cost'] = $answer[$j]->ass_acquisition_cost;
                $tempAsset['ass_book_value'] = $answer[$j]->ass_book_value;
                $tempAsset['ass_printable_height'] = $answer[$j]->ass_printable_height;
                $tempAsset['ass_proportional_costs'] = $answer[$j]->ass_proportional_costs;
                $tempAsset['ass_printable_width'] = $answer[$j]->ass_printable_width;
                $tempAsset['ass_production_cost_BCY'] = ($answer[$j]->ass_production_cost_BCY != null) ? $answer[$j]->ass_production_cost_BCY : '0';
                $tempAsset['ass_production_price_SCY'] = ($answer[$j]->ass_production_price_SCY != null) ? $answer[$j]->ass_production_price_SCY : '0';
                $tempAsset['ass_address'] = $answer[$j]->ass_address;
                $tempAsset['mat_id'] = $answer[$j]->mat_id;
                $tempAsset['loc_id'] = $answer[$j]->loc_id;
                $tempAsset['med_id'] = $answer[$j]->med_id;
                $tempAsset['met_id'] = $answer[$j]->met_id;
                $tempAsset['img_id'] = $answer[$j]->img_id;
                $tempAsset['ass_lead_time'] = $answer[$j]->ass_lead_time;
                $tempAsset['meu_id_lead_time'] = $answer[$j]->meu_id_lead_time;
                $tempAsset['ass_production_requirements'] = $answer[$j]->ass_production_requirements;
                $tempAsset['use_id'] = $answer[$j]->use_id;
                $tempAsset['mec_id'] = $answer[$j]->mec_id;
                $tempAsset['lot_id'] = $answer[$j]->lot_id;
                $tempAsset['ass_position'] = $answer[$j]->ass_position;
                $tempAsset['ass_height_meu_id'] = $answer[$j]->ass_height_meu_id;
                $tempAsset['ass_width_meu_id'] = $answer[$j]->ass_width_meu_id;
                $tempAsset['ass_street_address'] = $answer[$j]->ass_street_address;
                $tempAsset['ass_city'] = $answer[$j]->ass_city;
                $tempAsset['ass_province'] = $answer[$j]->ass_province;
                $tempAsset['ass_country'] = $answer[$j]->ass_country;
                $tempAsset['ass_date'] = $answer[$j]->ass_date;
                $tempAsset['ass_is_mall'] = $answer[$j]->ass_is_mall;
                $tempAsset['mec_description'] = $answer[$j]->mec_description;
                $latLngs = explode(",", $answer[$j]->position);
                $address = $this->getAddressFromLatLong($latLngs[0], $latLngs[1]);
                $addressStuff = explode(',', $address);
                $tempCity = "";
                if(isset($addressStuff[1])) {
                    $tempCity = trim($addressStuff[1]);
                }
                $tempCountry = "";
                if(isset($addressStuff[3])) {
                    $tempCountry = trim($addressStuff[3]);
                }
                $tempAddress = $tempCity . ', ' . $tempCountry;
                $tempAsset['asset_address'] = $tempAddress;
                if (in_array($answer[$j]->mec_description, $alreadyInArray)) {
                    $count++;

                } else {
                    $count = 0;
                    $alreadyInArray[] = $answer[$j]->mec_description;
                }
                $allAssets[$mainAddress][$answer[$j]->mec_description][$count] = $tempAsset;
            }
            if (count($answer) == 0) {
                $noResults[] = $mainAddress;
            }
            $allData['allAssets'] = $allAssets;
            $allData['noResults'] = $noResults;
        }

        $comment = $this->rfp_for_submission_comment->get_latest_comment($rfps[0]->rfp_for_submission_id);

        $allData['allTypes'] = $allTypes;
        $allData['allTypesWithIdKeys'] = $allTypesWithIdKeys;
        $allData['allSelectedAssets'] = $selectedAssets;
        $allData['comment'] = $comment;


        $this->load->view('operator_campaign_management_details', array_merge($allData, $asset_details));
    }

    public function media_owner_campaign_management()
    {
        $campaignID = $_GET['id'];
        $noResults = array();
        $allTypes = array();
        $allTypesWithIdKeys = array();
        $allData = array();
        $allSelectedAssets = array();
        $selectedAssets = array();
        $campDeets = $this->rfp->getRfpForId($campaignID);
        $allData['campaignDetails'] = $campDeets;
        #get the asset details
		$media_cats['media_cats'] = $this->campaign_model->getGeMecID($campaignID);
		//echo $media_cats->mec_id;
        $rfps = null;
		foreach($media_cats as  $data)
		{
			foreach($data as  $key)
			{
				$mec_id = (int)($key->mec_id);
				$asset_details['asset_details'] = $this->asset->assetByID($campaignID , $key->mec_id);
			}	
		}
		
        $locations = array();
        // get all the data for the location -> type -> options requested
        $rfps = $this->rfp_for_submission->getRFPWithCampaignIDForMediaOwner($this->session->userdata('user_id'), $campDeets[0]->cam_id);

        $allData['totalAmount'] = $rfps[0]->total;
        $allData['discountAmount'] = $rfps[0]->discount;

        $rfps_more_options = array();
        $allCampaignDetails = array();
        if ($rfps) {
            $rfps_locations = $this->rfp_for_submission_locations->getLocationsForID($rfps[0]->rfp_for_submission_id);
            for ($i = 0; $i < count($rfps_locations); $i++) {

                // get location name from coordinates
                $locations[$i] = $rfps_locations[$i]->lat . ',' . $rfps_locations[$i]->long;
                $locAddress = $this->getAddressFromLatLong($rfps_locations[$i]->lat, $rfps_locations[$i]->long);
                $locStuff = explode(',', $locAddress);
                if (isset($locStuff[3])) {
                    $loc = trim($locStuff[1]) . ', ' . trim($locStuff[3]);
                } else {
                    if (isset($locStuff[1])) {
                        $loc = trim($locStuff[0]) . ', ' . trim($locStuff[1]);
                    } else {
                        if ($locStuff[0] != "not available") {
                            $loc = trim($locStuff[0]);
                        } else {
                            $loc = $locations[$i];
                        }
                    }
                }

                $allCampaignDetails[$loc] = array();
                $mediaCategories = $this->rfp_for_submission_media_categories->getMediaCategoriesForLocationAndRFPID($rfps_locations[$i]->rfp_for_submission_locations_id, $campaignID, $this->session->userdata('user_id'));
                $alreadyInMediaCategories = array();
                $count = 0;
                for ($j = 0; $j < count($mediaCategories); $j++) {
                    $moreOptionsTemp = $this->rfp_for_submission_more_options->getMoreOptionsForMediaCategoryID($mediaCategories[$j]->media_category_id, $rfps_locations[$i]->rfp_for_submission_locations_id, $rfps[0]->rfp_for_submission_id);
                    $mediaCategoryName = $this->media_category->getMediaCategoryNameFromID($mediaCategories[$j]->media_category_id);
                    $mo = "";
                    for ($k = 0; $k < count($moreOptionsTemp); $k++) {
                        $moName = $this->asset_size->getNameForMoreOptionByID($moreOptionsTemp[$k]->more_options_id);
                        if ($mo == "") {
                            $mo = $moName;
                        } else {
                            $mo .= ', ' . $moName;
                        }
                    }
                    if (!in_array($mediaCategoryName, $allTypes)) {
                        $allTypes[] = $mediaCategoryName;
                        $allTypesWithIdKeys[$mediaCategories[$j]->media_category_id] = $mediaCategoryName;
                    }
                    $allCampaignDetails[$loc][$mediaCategoryName]['more_options'] = $mo;
                    $allCampaignDetails[$loc][$mediaCategoryName]['quantity'] = $mediaCategories[$j]->quantity;
//                    echo $quantity;
                    $allCampaignDetails[$loc][$mediaCategoryName]['cat_id'] = $mediaCategories[$j]->media_category_id;
                    $allCampaignDetails[$loc][$mediaCategoryName]['ass_id'] = $mediaCategories[$j]->ass_id;
                    $allCampaignDetails[$loc][$mediaCategoryName]['type'] = $this->media_category->getMediaCategoryNameFromID($mediaCategories[$j]->media_category_id);
                    $allCampaignDetails[$loc][$mediaCategoryName]['lat'] = $rfps_locations[$i]->lat;
                    $allCampaignDetails[$loc][$mediaCategoryName]['long'] = $rfps_locations[$i]->long;
                }
            }
            // get all assets in location
            $selectedAssets = $this->rfp_for_submission_assets_selected->getSelectedAssets($rfps[0]->rfp_for_submission_id, $this->session->userdata('user_id'));
        }
//        echo 'this<pre>';
//        print_r($allCampaignDetails);
//        echo '</pre>';
//        die();
        $allData['allCampaignDetails'] = $allCampaignDetails;
//        $id = $this->session->userdata('id');
//        // echo $id;
        // get all assets from media to choose from
        $allAssets = array();
        for ($i = 0; $i < count($locations); $i++) {
            $locationsLatLngs = explode(",", $locations[$i]);
            $lat = $locationsLatLngs[0];
            $lng = $locationsLatLngs[1];
            $latLngAddress = $this->getAddressFromLatLong($lat, $lng);
//            // echo $latLngAddress;
            $latLngAddressStuff = explode(",", $latLngAddress);

            if (isset($latLngAddressStuff[1])) {
                $city = trim($latLngAddressStuff[1]);
            } else {
                $city = "";
            }
            if (isset($latLngAddressStuff[3])) {
                $country = trim($latLngAddressStuff[3]);
            } else {
                $country = "";
            }

            $mainAddress = $city . ', ' . $country;
//            // echo $mainAddress . '<br />';
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
            3956*2*ASIN(SQRT(POWER(SIN((" . $lat . " - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1))*pi()/180 / 2), 2) + COS(" . $lat . " * pi() / 180) * COS(SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) * pi()/180) * POWER(SIN((" . $lng . " - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1))*pi()/180 / 2),2))) AS distance
            FROM
            asset
            INNER JOIN media_category ON asset.mec_id = media_category.mec_id
            WHERE
            asset.med_id = " . $this->session->userdata('user_id') . "
            HAVING distance < 12")->result();

            $allLocations = array();
            $tempAsset = array();
            $count = 0;
            $alreadyInArray = array();

            for ($j = 0; $j < count($answer); $j++) {
                $tempAsset['ass_id'] = $answer[$j]->ass_id;
                $tempAsset['ast_id'] = $answer[$j]->ast_id;
                $tempAsset['ass_name'] = $answer[$j]->ass_name;
                $tempAsset['ass_description'] = $answer[$j]->ass_description;
                $tempAsset['position'] = $answer[$j]->position;
                $tempAsset['ass_ref'] = $answer[$j]->ass_ref;
                $tempAsset['emp_id_maintenance'] = $answer[$j]->emp_id_maintenance;
                $tempAsset['ass_disposed_of'] = $answer[$j]->ass_disposed_of;
                $tempAsset['ass_acquisition_cost'] = $answer[$j]->ass_acquisition_cost;
                $tempAsset['ass_book_value'] = $answer[$j]->ass_book_value;
                $tempAsset['ass_printable_height'] = $answer[$j]->ass_printable_height;
                $tempAsset['ass_proportional_costs'] = $answer[$j]->ass_proportional_costs;
                $tempAsset['ass_printable_width'] = $answer[$j]->ass_printable_width;
                $tempAsset['ass_production_cost_BCY'] = ($answer[$j]->ass_production_cost_BCY != null) ? $answer[$j]->ass_production_cost_BCY : '0';
                $tempAsset['ass_production_price_SCY'] = ($answer[$j]->ass_production_price_SCY != null) ? $answer[$j]->ass_production_price_SCY : '0';
                $tempAsset['ass_address'] = $answer[$j]->ass_address;
                $tempAsset['mat_id'] = $answer[$j]->mat_id;
                $tempAsset['loc_id'] = $answer[$j]->loc_id;
                $tempAsset['med_id'] = $answer[$j]->med_id;
                $tempAsset['met_id'] = $answer[$j]->met_id;
                $tempAsset['img_id'] = $answer[$j]->img_id;
                $tempAsset['ass_lead_time'] = $answer[$j]->ass_lead_time;
                $tempAsset['meu_id_lead_time'] = $answer[$j]->meu_id_lead_time;
                $tempAsset['ass_production_requirements'] = $answer[$j]->ass_production_requirements;
                $tempAsset['use_id'] = $answer[$j]->use_id;
                $tempAsset['mec_id'] = $answer[$j]->mec_id;
                $tempAsset['lot_id'] = $answer[$j]->lot_id;
                $tempAsset['ass_position'] = $answer[$j]->ass_position;
                $tempAsset['ass_height_meu_id'] = $answer[$j]->ass_height_meu_id;
                $tempAsset['ass_width_meu_id'] = $answer[$j]->ass_width_meu_id;
                $tempAsset['ass_street_address'] = $answer[$j]->ass_street_address;
                $tempAsset['ass_city'] = $answer[$j]->ass_city;
                $tempAsset['ass_province'] = $answer[$j]->ass_province;
                $tempAsset['ass_country'] = $answer[$j]->ass_country;
                $tempAsset['ass_date'] = $answer[$j]->ass_date;
                $tempAsset['ass_is_mall'] = $answer[$j]->ass_is_mall;
                $tempAsset['mec_description'] = $answer[$j]->mec_description;
                $latLngs = explode(",", $answer[$j]->position);
                $address = $this->getAddressFromLatLong($latLngs[0], $latLngs[1]);
                $addressStuff = explode(',', $address);
                $tempCity = "";
                if(isset($addressStuff[1])) {
                    $tempCity = trim($addressStuff[1]);
                }
                $tempCountry = "";
                if(isset($addressStuff[3])) {
                    $tempCountry = trim($addressStuff[3]);
                }
                $tempAddress = $tempCity . ', ' . $tempCountry;
                $tempAsset['asset_address'] = $tempAddress;
                if (in_array($answer[$j]->mec_description, $alreadyInArray)) {
                    $count++;

                } else {
                    $count = 0;
                    $alreadyInArray[] = $answer[$j]->mec_description;
                }
                $allAssets[$mainAddress][$answer[$j]->mec_description][$count] = $tempAsset;
            }
            if (count($answer) == 0) {
                $noResults[] = $mainAddress;
            }
            $allData['allAssets'] = $allAssets;
            $allData['noResults'] = $noResults;
        }

        $comment = $this->rfp_for_submission_comment->get_latest_comment($rfps[0]->rfp_for_submission_id);

        $allData['allTypes'] = $allTypes;
        $allData['allTypesWithIdKeys'] = $allTypesWithIdKeys;
        $allData['allSelectedAssets'] = $selectedAssets;
        $allData['comment'] = $comment;


        $this->load->view('media_owner_campaign_management', array_merge($allData, $asset_details));
    }

    public function loadrfp()
    {
        $data = array();
        $data['rfp_det'] = $this->rfp->rfp_add_assets();
        $this->load->view('loadrfp', null, array_merge($data));
    }


    public function index()
    {

        //get the media categories from the database
        $media_cat['my_categories'] = $this->media_category->getMediaCategories();
        $this->layouts->view('new_campaign', null, array_merge($media_cat));
    }

    public function mo_proposals()
    {

        //get the media categories from the database

        $data3 = array();
        $data3['rfps'] = $this->rfp->mo_getRfp();
        $this->layouts->view('mo_proposal', null, array_merge($data3));
    }

    public function ad_proposals()
    {

        //get the media categories from the database

        $data3 = array();
        //  $data3['rfps'] = $this->rfp->ad_getRfp();
        $data3['rfps'] = $this->rfp->getRfp();
        $this->layouts->view('ad_proposal', null, array_merge($data3));
    }

    public function add_assets()
    {

        //get the media categories from the database

        $id = $_GET['id'];
        $this->rfp->add_media_owner();
        $this->campaigns1();
    }

    public function submit_assets()
    {

        //get the media categories from the database

        $this->rfp->create_proposal();
        $this->layouts->view('record_created', null);
    }

    public function submit_proposal()
    {

        //get the media categories from the database

        $this->rfp->submit_proposal();
        $this->layouts->view('record_created', null);
    }

    public function campaigns()
    {
        $data3 = array();
        $data3['rfps'] = $this->rfp->getRfp();
        $this->layouts->view('op_campaign', null, array_merge($data3));
    }

    public function ad_campaigns()
    {
        $data3 = array();
        $data3['rfps'] = $this->rfp->getRfp();
//        // echo '<pre>';
//        var_dump($data3);
//        // echo '</pre>';
        $this->layouts->view('ad_campaign', null, array_merge($data3));
    }


    public function proposals()
    {
        $data3 = array();
        $proposals = $this->rfp->getRfpProposal();

        $grouped = array();
        $groupedRFPProposal = array();
        $count = 0;
        $allCampaignIDS = array();
        foreach ($proposals as $proposal) {

            $campaignData = $this->db->query("SELECT * FROM rfp_for_submission WHERE rfp_for_submission_id = " . $proposal->rfp_for_submission_id . " AND (proccessed_operator = '0' OR process = '1')")->result();
            foreach ($campaignData as $campaign_data) {
                if (!in_array($campaign_data->campaign_id, $allCampaignIDS)) {
                    $allCampaignIDS[] = $campaign_data->campaign_id;
                }
            }

            if (!in_array($proposal->campaign_id, $grouped)) {
                // first time that this rfp submission is found, create it and start adding assets
                $count = 0;
                $groupedRFPProposal[$proposal->rfp_for_submission_id][$count] = $proposal;
                $grouped[] = $proposal->campaign_id;
            } else {
                // this rfp already exists, add to its assets
                $groupedRFPProposal[$proposal->rfp_for_submission_id][$count] = $proposal;
            }
            $count++;


        }

        $data3['proposals'] = $groupedRFPProposal;

        $allCampaignData = array();
        foreach ($allCampaignIDS as $campainId) {
            $query = "
                SELECT c.*, u.use_first_name as advertiser_firstname, u.use_last_name as advertiser_surname
                FROM campaign as c
                INNER JOIN user u on u.use_id = c.adv_id
                WHERE c.cam_id = $campainId
            ";
            $campaign = $this->db->query($query)->result()[0];
            $allCampaignData[] = $campaign;
        }

        //echo "<pre>". print_r($allCampaignData, 1) . "</pre>"; exit();

        $data3['campaignData'] = $allCampaignData;
        $this->layouts->view('op_proposal', null, array_merge($data3));

    }

    public function view_campaign_quotations() {
        $campaignId = $_GET['id'];

        $campaign_details = $this->campaign_model->returnCampaignDetails($campaignId);

        $data = array();
        $data['campaign_details'] = $campaign_details;
        $proposals = $this->rfp->getRfpProposal($campaignId);

        $grouped = array();
        $groupedRFPProposal = array();
        $count = 0;
        $allCampaignIDS = array();
        foreach ($proposals as $proposal) {

            $campaignData = $this->db->query("SELECT * FROM rfp_for_submission WHERE rfp_for_submission_id = " . $proposal->rfp_for_submission_id . " AND (proccessed_operator = '0' OR process = '1')")->result();
            foreach ($campaignData as $campaign_data) {
                if (!in_array($campaign_data->campaign_id, $allCampaignIDS)) {
                    $allCampaignIDS[] = $campaign_data->campaign_id;
                }
            }

            if (!in_array($proposal->campaign_id, $grouped)) {
                // first time that this rfp submission is found, create it and start adding assets
                $count = 0;
                $groupedRFPProposal[$proposal->rfp_for_submission_id][$count] = $proposal;
                $grouped[] = $proposal->campaign_id;
            } else {
                // this rfp already exists, add to its assets
                $groupedRFPProposal[$proposal->rfp_for_submission_id][$count] = $proposal;
            }
            $count++;


        }

        $data['propsals'] = $groupedRFPProposal;


        $allCampaignData = array();
        foreach ($allCampaignIDS as $campainId) {
            $query = "
                SELECT c.*, u.use_first_name as advertiser_firstname, u.use_last_name as advertiser_surname
                FROM campaign as c
                INNER JOIN user u on u.use_id = c.adv_id
                WHERE c.cam_id = $campainId
            ";
            $campaign = $this->db->query($query)->result()[0];
            $allCampaignData[] = $campaign;
        }

        //echo "<pre>". print_r($data, 1) . "</pre>"; exit();

        $data['campaigns'] = $allCampaignData;
        $this->layouts->view('campaign_quotations', null, array_merge($data));
    }

    public function getNewLocationInfo()
    {
        $POST = $this->input->post();
        $address = $POST['address'];
        $lat = $POST['lat'];
        $long = $POST['long'];
        $mediaTypes = $POST['media'];

        $areas = explode(',', $address);
        $area = $areas[0];

        $aap = array();
        foreach ($mediaTypes as $key) {
            $aap[$key] = $this->asset->averageAssetPriceForArea(str_replace(' ', '', $area), $key);
        }
//        $asset_average_prices['average_price'][] = $aap;
//          $avg_price = $this->asset->averageAssetPriceForArea($value, $cn);
//          $asset_average_prices['avg_prices'][] = $this->asset->averageAssetPriceForArea($value);
//            $lat_long['area_lat_long'][$key] = $lat . ',' . $long;
////
//            $latitude_longitude = $lat_long['area_lat_long'][$key];
//            $latlong2['lat'] = $latitude_longitude;
//            $addresses[$i]['address'] = $address;
//            $latlang = explode(',', $latitude_longitude);

//        $addresses[$i]['lat'] = $lat;
//        $addresses[$i]['long'] = $long;
//        $addresses[$i]['address'] = $address;
//        $allAddresses['allAddresses'][$i] = $addresses[$i];
        $finalDataArray = array();
        $finalDataArray['lat'] = $lat;
        $finalDataArray['long'] = $long;
        $finalDataArray['address'] = $address;
        $finalDataArray['average_price'] = $aap;
        $this->output->set_content_type('application/json');
        $this->output->set_output(json_encode($finalDataArray));
    }

    /**
     *
     */
    public function saveCampaignSendToMediaOwner()
    {
        // VARIABLES
        $id = "";
        $campaignID = $this->input->post()['campaignID'];
        $locations = array();
        $stuff = array();
        $IDS = array();
        $firstNames = array();
        $lastNames = array();

        $POST = json_decode($this->input->post('data'));

        // "already in" arrays
        $alreadyInIds = array();
        $alreadyInNames = array();
        $alreadyInLocations = array();
        $alreadyInTypes = array();

        $tempArray = array();
        for($i = 0; $i < count($POST); $i++) {
            if(isset($POST[$i])) {
                $id = "";
                for($j = 0; $j < count($POST[$i]); $j++) {
                    if(isset($POST[$i][$j])) {

                        if($j == 0) {
                            if(!in_array($POST[$i][$j], $alreadyInIds)) {
                                $tempArray[$POST[$i][$j]] = array();
                                $id = $POST[$i][$j];
                                $alreadyInIds[] = $POST[$i][$j];
                            }
                        }
                        if($j != 0 && $j != 1 && $j != 2) {
                            // can deal with other shit here

                            if(isset($POST[$i][$j])) {

                                $rfpID = $this->rfp_for_submission->createRFPForSubmission($id, $campaignID);
                                $this->db->query("UPDATE campaign SET `processed` = '1' WHERE `cam_id` = '". $campaignID ."'");
                                $statusData = array(
                                    'campaign_id' => $campaignID,
                                    'proposal_status_id' => 13,
                                    'user_id' => $this->session->userdata('user_id'),
                                    'created_at' => date('Y-m-d H:j:s'),
                                    'updated_at' => date('Y-m-d H:j:s'),
                                );
                                $this->workflow_status->createStatus($statusData);
                                foreach($POST[$i][$j] as $location => $types) {
                                    if($location != "location") {
                                        $latLng = $this->getCoordinates($location);
                                        $latLngStuff = explode(',', $latLng);
                                        $lat = "";
                                        $long = "";
                                        if(isset($latLngStuff[1])) {
                                            $lat = $latLngStuff[0];
                                            $long = $latLngStuff[1];
                                        }
                                        $locationID = $this->rfp_for_submission_locations->createRFPForSubmissionLocation($rfpID, $lat, $long);

                                        foreach($types as $type => $items) {
//                                            echo $type;

                                            $mec_id = $this->db->query("SELECT mec_id FROM media_category WHERE UPPER(mec_description) = UPPER('". $type ."')")->result()[0]->mec_id;
//                                            echo $mec_id;

                                            $qty = $items->qty;
                                            $assetNumber = $items->assetNumber;

                                            $mediaCategoryID = $this->rfp_for_submission_media_categories->createRFPForSubmissionMediaCategory($rfpID, $type, $qty, $locationID);

                                            $moreOptions = $items->moreOptions;
                                            for($k = 0; $k < count($moreOptions); $k++) {
                                                $this->rfp_for_submission_more_options->createRFPForSubmissionMoreOptions($moreOptions[$k], $rfpID, $locationID, $mec_id);
//
                                            }
                                        }
                                    }
                                }
                            }

                        }
                    }
                }
            }
        }
        return "done";
    }

    public function campaigns1()
    {
        //get the media categories from the database
        $data1 = array();
    $config['center'] = '-26.2044,28.0456';
	$config['zoom'] = '7';
      $config['places'] = TRUE;

        $config['placesAutocompleteInputID'] = 'myPlaceTextBox';
        $config['placesAutocompleteBoundsMap'] = TRUE;
       $config['placesAutocompleteOnChange'] = 'var geocoder = new google.maps.Geocoder();
			       var address = document.getElementById("myPlaceTextBox").value;
			       var image = "http://localhost/maps/images/blue_icon.png";

			                geocoder.geocode({ "address": address }, function (results, status) {
			            if (status == google.maps.GeocoderStatus.OK) {
			               //if(typeof marker != "undefined"){marker.setMap(null)};
			                $("#location").parent().removeClass("has-error");
			                var latitude = results[0].geometry.location.lat();
		                var longitude = results[0].geometry.location.lng();
			                $("#latitude").val(latitude);
			                $("#longitude").val(longitude);

			mezmerize(address,latitude, longitude);


			map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
			map.setZoom(9);
//			//google.maps.event.addListener(marker, "dragend", function (event) {
//			//              latitude = this.getPosition().lat();
//			//              longitude = this.getPosition().lng();
//			//              $("#latitude").val(latitude);
//			//              $("#longitude").val(longitude);
//			//              });
//			            }
//			        });
//
//			';

        $campaign_header = array();
        $category_names = array();
        $allAddresses = array();
        $asset_average_prices = array();
        $lat_long = array();
        $latlong2 = array();
        $mecStuffAll = array();
        $mediaOwners = array();

        $mediaOwners['media_owners'] = $this->media_category->getMediaOwners();
        $media_categories['mec_stuff'] = $this->media_category->getMediaCategoriesByCampaignID($_GET['id']);
        $mecStuffAll['mec_stuffAll'] = $this->media_category->getMediaFamilies();
        $media_family = array();
        $count = 0;
        $alreadyIn = array();
        foreach ($media_categories as $mc) {
            foreach ($mc as $m) {
                if (!in_array($m['family'], $alreadyIn)) {
                    $alreadyIn[$count] = $m['family'];
                    $media_family['media_families'][$count] = $m['family'];
                }
                $count++;
            }
        }
        $media_types = array();
        $count = 0;
        $alreadyIn = array();
        foreach ($media_categories as $mc) {
            foreach ($mc as $m) {
                if (!in_array($m['description'], $alreadyIn)) {
                    $alreadyIn[$count] = $m['description'];
                    $media_types['media_types'][$count] = $m['description'];
                }
                $count++;
            }
        }
        $media_types_id = array();
        $count = 0;
        $alreadyIn = array();
        foreach ($media_categories as $mc) {
            foreach ($mc as $m) {
                if (!in_array($m['id'], $alreadyIn)) {
                    $alreadyIn[$count] = $m['id'];
                    $media_types_id['media_types_id'][$count] = $m['id'];
                }
                $count++;
            }
        }
        $media_other_options = $this->campaign_model->getOtherOptionsData($media_types_id);
        $media_all_other_options = $this->campaign_model->getAllOtherOptionsData();
        $moo['media_other_options'] = $media_other_options;
        $moo['media_all_other_options'] = $media_all_other_options;
        $addresses = array();
        $i = 0;
        $street_add['streetAdd'] = $this->campaign_model->getAllLocationsFromCampaignId($_GET['id']);
        foreach ($street_add['streetAdd'] as $key => $value) {
            $lat = $value->lat;
            $long = $value->long;
            $address = "";
            $area = "";
            $URL = "http://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&sensor=false";
            // Extract the location lat and lng values
            $data = file($URL);
            foreach ($data as $line_num => $line) {
                if (false != strstr($line, "\"formatted_address\"")) {
                    $addr = substr(trim($line), 22, -2);

                    $addressData = explode(',', $addr);
                    if (isset($addressData[3])) {
                        $address = trim($addressData[count($addressData) - 3] . ', ' . $addressData[count($addressData) - 1]);
                    } else {
                        $address = trim($addressData[1]);
                    }
//                    echo $address;
                    $area = trim($addressData[1]);
                    break;
                }
            }
            $aap = array();
            foreach ($media_categories['mec_stuff'] as $key => $v) {
                $aap[$address][$v['description']] = $this->asset->averageAssetPriceForArea(str_replace(' ', '', $area), $v['description']);
            }
            $asset_average_prices['average_price'][] = $aap;
            $addresses[$i]['lat'] = $lat;
            $addresses[$i]['long'] = $long;
            $addresses[$i]['address'] = $address;
            $allAddresses['allAddresses'][$i] = $addresses[$i];
            $i++;
        }


        // get all screenshot links
        $screenshots = $this->rfp->getAllScreenShotsForCampaign($_GET['id']);
        $screens = array();
        $screens['screenshots'] = $screenshots;
//        // // echo '<pre>';
//        var_dump($asset_average_prices);
//        // echo '</pre>';
		$this->googlemaps->initialize($config);
		$data1['map1'] = $this->googlemaps->create_map();
//        $data1['map1'] = "";
        $data3 = array();
        $data['rfps'] = $this->rfp->getRfp();
        $data1['rfp_det'] = $this->rfp->getRfpDet();
        $locations = array();
        $locations['locations'] = $this->rfp->getLocations();
        $this->layouts->view('op_campaign_det', null, array_merge($data, $data1, $media_types, $media_categories, $media_types_id, $locations, $allAddresses, $asset_average_prices, $screens, $mecStuffAll, $mediaOwners, $moo));

    }

    public function getAverageAssetPriceForItemAndLocations()
    {
        $POST = $this->input->post();
        $type = $POST['type'];
        $addresses = $POST['addresses'];
        $aap = $this->campaign_model->getAverageAssetPrice($type, $addresses);
        $this->output->set_content_type('application/json');
        $this->output->set_output(json_encode($aap));
    }


    public function acceptProposalFromMediaOwner()
    {

        // operator accepted proposal from media owner, fill out details
        $campaignID = $_GET['id'];
        $mediaOwnerID = $_GET['moid'];

        // 1. Check if campaign ID exists
        // 2. Check if campaign ID belongs to operator with media owner ID
        $checkedID = $this->rfp_for_submission->checkIDAndMediaOwnerID($campaignID, $mediaOwnerID);
//        echo '<pre>';
//        print_r($checkedID);
//        echo '</pre>';
        if (count($checkedID) > 0) {
            // campaign exists and it belongs to the current media owner
            // 3. Loop through all assets currently available on the 'table' and set accepted by operator to 1
            $allAssets = $this->rfp_for_submission->getAllAssetsOnTable($campaignID, $mediaOwnerID, $this->session->userdata('user_id'));
            print_r($allAssets);
//            foreach($allAssets as $asset => $assetDetails) {
//                // echo '<pre>';
//                print_r($assetDetails);
//                // echo '</pre>';
//            }
//            $this->db->query("UPDATE rfp_for_submission_assets_selected SET (accepted_by_operator = 1)");
            // 4. Set completed to 1

        }


    }


    public function campaigns2()
    {
        // Purpose:
        //  1. To display all types, locations, quantities, more options and selected assets from media owner
        //  2. To accept and deny assets that was put forward from the media owner
        //  3. To add assets to the proposal

        $campaignID = $_GET['id'];
        $mediaOwnerID = $_GET['moid'];

        /*
         *  1. Get rfp by using the campaign ID (id) and the media owners ID (moid)
         */
        $rfp = $this->rfp_for_submission->getRFPForMediaOwnerIDAndCampaignID($campaignID, $mediaOwnerID);

        $rfpID = $rfp->rfp_for_submission_id;
        $operatorID = $rfp->operator_id;
        $moid = $rfp->media_owner_id;


        /*
         *  2. Get campaign using the campaign ID
         */
        $campaign = $this->campaign_model->returnCampaignDetails($campaignID);


        /*
         *  3. Get all rfp information...
         */
        /* 3.1 - Get Locations */
        $locations = $this->rfp_for_submission_locations->getLocationsForRFP($rfpID);

        /* 3.2 - Get Media Categories */
        // loop through locations to get media for each location
        $media = array();
        $allAssets = array();
        $noResults = array();
        $selectedAssets = array();
        for ($i = 0; $i < count($locations); $i++) {
            $lat = $locations[$i]->lat;
            $lng = $locations[$i]->long;
            
            $mediaCategories = $this->rfp_for_submission_media_categories->getMediaForRFP($rfpID, $locations[$i]->rfp_for_submission_locations_id);

            /* 3.3 - Get More Options */
            // loop through media categories to get more options for each type
            $count = 0;
            $alreadyInMediaCategoriesIDS = array();
            $mediaCategoriesTemp = array();
            $mainAddress = $this->getAddressFromLatLong($locations[$i]->lat, $locations[$i]->long);
            $mainAddressArray = explode(',', $mainAddress);
            $address = "";
            if (isset($mainAddressArray[3])) {
                $address = trim($mainAddressArray[1]) . ', ' . trim($mainAddressArray[3]);
            } else if (isset($mainAddressArray[2])) {
                $address = trim($mainAddressArray[0]) . ', ' . trim($mainAddressArray[2]);
            } else if (isset($mainAddressArray[1])) {
                $address = trim($mainAddressArray[1]);
            } else {
                $address = trim($mainAddressArray[0]);
            }
            $assetsSelected = array();
            for ($j = 0; $j < count($mediaCategories); $j++) {
                if (!in_array($mediaCategories[$j]->media_category_id, $alreadyInMediaCategoriesIDS)) {
                    // first one for this media type / category, start a new position
                    $count = 0;
                    // add to the array so that it does not create multiple 'new' types of the same type
                    $alreadyInMediaCategoriesIDS[] = $mediaCategories[$j]->media_category_id;
                }
                // get all the more options for the rfp that the operator selected (the requested sizes)
                $options = $this->rfp_for_submission_more_options->getMoreOptionsForRFP($rfpID, $locations[$i]->rfp_for_submission_locations_id, $mediaCategories[$j]->media_category_id);

                // DEBUGGING - Process to follow
                // 1. Get all assets from media owner for current location and media type
                // 2. Check if one of the assets are in the selected assets
                // 3. Add Asset to asset list for this location
                // 4. Add selected asset to assets in this location

                /*
                 *  4. Get All Assets For Media Owner With Radius For Current Media Category / Type
                 */
//                $assetsInLocation = $this->rfp_for_submission_assets_selected->getAssetsForLocationForMediaTypeForMediaOwnerForRFP($rfpID, $mediaOwnerID, $locations[$i]->lat, $locations[$i]->long, $mediaCategories[$j]->mec_id);
                $assetsInLocation = $this->rfp_for_submission_assets_selected->getAssetsInLocation($mediaOwnerID, $locations[$i]->lat, $locations[$i]->long, $mediaCategories[$j]->media_category_id);

                /*
                 *  5. Get All Selected Assets From Media Owner
                 */
//                $selectedAssets = $this->rfp_for_submission_assets_selected->getAssetsSelectedForRFP($rfpID, $mediaOwnerID, $mediaCategories[$j]->mec_id, $locations[$i]->rfp_for_submission_locations_id);
                // loop through assetsInLocation and get any assets that appear in the rfp_for_submission_assets_selected table
                $assetsTemp = array();
                $selectedTemp = array();

                for ($k = 0; $k < count($assetsInLocation); $k++) {
                    $c = 0;
                    $isIn = $this->db->query("SELECT * FROM rfp_for_submission_assets_selected INNER JOIN rfp_for_submission_locations ON rfp_for_submission_assets_selected.rfp_for_submission_location_id = rfp_for_submission_locations.rfp_for_submission_locations_id INNER JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id INNER JOIN media_categories ON media_categories.mec_id = rfp_for_submission_assets_selected.media_categories_id WHERE rfp_for_submission_assets_selected.asset_id = '". $assetsInLocation[$k]->ass_id ."' AND rfp_for_submission_assets_selected.accepted_by_media_owner = '1' AND rfp_for_submission_assets_selected.rfp_for_submission_id = '". $rfpID ."' AND rfp_for_submission_assets_selected.rfp_for_submission_location_id = '". $locations[$i]->rfp_for_submission_locations_id ."'")->result();
                    for($h = 0; $h < count($isIn); $h++) {
                        $assetsTemp[$c] = $isIn[$h];
                        $c++;
                    }
                }

                // load all info into temp media category variable
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['rfp_for_submission_media_categories_id'] = $mediaCategories[$j]->rfp_for_submission_media_categories_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['rfp_for_submission_id'] = $mediaCategories[$j]->rfp_for_submission_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['rfp_for_location_id'] = $mediaCategories[$j]->rfp_for_location_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['media_category_id'] = $mediaCategories[$j]->media_category_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['quantity'] = $mediaCategories[$j]->quantity;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_id'] = $mediaCategories[$j]->mec_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_description'] = $mediaCategories[$j]->mec_description;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mam_id'] = $mediaCategories[$j]->mam_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_tearsheet_printing'] = $mediaCategories[$j]->mec_tearsheet_printing;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_editions_mandatory'] = $mediaCategories[$j]->mec_editions_mandatory;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_contractor'] = $mediaCategories[$j]->mec_contractor;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_time_dependant'] = $mediaCategories[$j]->mec_time_dependant;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_height_dependant'] = $mediaCategories[$j]->mec_height_dependant;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_site_dependant'] = $mediaCategories[$j]->mec_site_dependant;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_interval_billing'] = $mediaCategories[$j]->mec_interval_billing;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_base_rate'] = $mediaCategories[$j]->mec_base_rate;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_rate_card_nett'] = $mediaCategories[$j]->mec_rate_card_nett;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['rlm_id'] = $mediaCategories[$j]->rlm_id;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mec_export_code'] = $mediaCategories[$j]->mec_export_code;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['mef_id'] = $mediaCategories[$j]->mef_id;
//                $mediaCategoriesTemp[$count]['address'] = $this->getAddressFromLatLong($locations[$i]->lat, $locations[$i]->long);
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['more_options'] = $options;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['assetsInLocation'] = $assetsInLocation;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['selectedAssets'] = $assetsTemp;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['lat'] = $locations[$i]->lat;
                $mediaCategoriesTemp[$mediaCategories[$j]->mec_description]['lng'] = $locations[$i]->long;
                // increase counter
                $count++;

            }


            // load temp into main media array
            $media[$address] = $mediaCategoriesTemp;

            // get assets near for media owner
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
            3956*2*ASIN(SQRT(POWER(SIN((" . $lat . " - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1))*pi()/180 / 2), 2) + COS(" . $lat . " * pi() / 180) * COS(SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) * pi()/180) * POWER(SIN((" . $lng . " - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1))*pi()/180 / 2),2))) AS distance
            FROM
            asset
            INNER JOIN media_category ON asset.mec_id = media_category.mec_id
            WHERE
            asset.med_id = " . $mediaOwnerID . "
            HAVING distance < 12")->result();

            $allLocations = array();
            $tempAsset = array();
            $count = 0;
            $alreadyInArray = array();

            for ($j = 0; $j < count($answer); $j++) {
                $tempAsset['ass_id'] = $answer[$j]->ass_id;
                $tempAsset['ast_id'] = $answer[$j]->ast_id;
                $tempAsset['ass_name'] = $answer[$j]->ass_name;
                $tempAsset['ass_description'] = $answer[$j]->ass_description;
                $tempAsset['position'] = $answer[$j]->position;
                $tempAsset['ass_ref'] = $answer[$j]->ass_ref;
                $tempAsset['emp_id_maintenance'] = $answer[$j]->emp_id_maintenance;
                $tempAsset['ass_disposed_of'] = $answer[$j]->ass_disposed_of;
                $tempAsset['ass_acquisition_cost'] = $answer[$j]->ass_acquisition_cost;
                $tempAsset['ass_book_value'] = $answer[$j]->ass_book_value;
                $tempAsset['ass_printable_height'] = $answer[$j]->ass_printable_height;
                $tempAsset['ass_proportional_costs'] = $answer[$j]->ass_proportional_costs;
                $tempAsset['ass_printable_width'] = $answer[$j]->ass_printable_width;
                $tempAsset['ass_production_cost_BCY'] = $answer[$j]->ass_production_cost_BCY;
                $tempAsset['ass_production_price_SCY'] = $answer[$j]->ass_production_price_SCY;
                $tempAsset['ass_address'] = $answer[$j]->ass_address;
                $tempAsset['mat_id'] = $answer[$j]->mat_id;
                $tempAsset['loc_id'] = $answer[$j]->loc_id;
                $tempAsset['med_id'] = $answer[$j]->med_id;
                $tempAsset['met_id'] = $answer[$j]->met_id;
                $tempAsset['img_id'] = $answer[$j]->img_id;
                $tempAsset['ass_lead_time'] = $answer[$j]->ass_lead_time;
                $tempAsset['meu_id_lead_time'] = $answer[$j]->meu_id_lead_time;
                $tempAsset['ass_production_requirements'] = $answer[$j]->ass_production_requirements;
                $tempAsset['use_id'] = $answer[$j]->use_id;
                $tempAsset['mec_id'] = $answer[$j]->mec_id;
                $tempAsset['lot_id'] = $answer[$j]->lot_id;
                $tempAsset['ass_position'] = $answer[$j]->ass_position;
                $tempAsset['ass_height_meu_id'] = $answer[$j]->ass_height_meu_id;
                $tempAsset['ass_width_meu_id'] = $answer[$j]->ass_width_meu_id;
                $tempAsset['ass_street_address'] = $answer[$j]->ass_street_address;
                $tempAsset['ass_city'] = $answer[$j]->ass_city;
                $tempAsset['ass_province'] = $answer[$j]->ass_province;
                $tempAsset['ass_country'] = $answer[$j]->ass_country;
                $tempAsset['ass_date'] = $answer[$j]->ass_date;
                $tempAsset['ass_is_mall'] = $answer[$j]->ass_is_mall;
                $tempAsset['mec_description'] = $answer[$j]->mec_description;
                $latLngs = explode(",", $answer[$j]->position);
                $tempAsset['lat'] = $latLngs[0];
                $tempAsset['lng'] = $latLngs[1];
                if (in_array($answer[$j]->mec_description, $alreadyInArray)) {
                    $count++;

                } else {
                    $count = 0;
                    $alreadyInArray[] = $answer[$j]->mec_description;
                }
                $allAssets[$address][$answer[$j]->mec_description][$count] = $tempAsset;
            }
            if (count($answer) == 0) {
                $noResults[] = $address;
            }
            $allData['allAssets'] = $allAssets;
            $allData['noResults'] = $noResults;
        }


        /*
         *  6. Get all selected assets
         */
        $sql = "SELECT * FROM rfp_for_submission_assets_selected INNER JOIN media_category ON media_category.mec_id = rfp_for_submission_assets_selected.media_categories_id INNER JOIN asset ON asset.ass_id = rfp_for_submission_assets_selected.asset_id WHERE rfp_for_submission_id = '". $rfpID ."' AND accepted_by_media_owner = '1' AND active = 1 AND (from_id = '". $mediaOwnerID ."' OR to_id = '". $mediaOwnerID ."')";
        echo $sql;
        $moSelectedAssets = $this->db->query($sql)->result();


        /*
         *  7. Merge All Into An Array
         */
        $return = array();
        $return['campaign'] = $campaign;
        $return['locations'] = $locations;
        $return['media'] = $media;
        $return['allAssets'] = $allData['allAssets'];
//        echo '<pre>';
//        print_r($allData['allAssets']);
//        echo '</pre>';
//        die();
        $return['moSelectedAssets'] = $moSelectedAssets;
        $return['totalForAllSelectedAssets'] = $rfp->total;
        $return['discountForAllSelectedAssets'] = $rfp->discount;


        /*
         *  8. Output to view
         */
        return $this->layouts->view('op_proposal_det', null, array_merge($return));

    }

    public function mo_campaigns1()
    {

        //get proposal details

        $config['center'] = '-26.2044,28.0456';
        $config['zoom'] = '7';
        $config['places'] = TRUE;

        $config['placesAutocompleteInputID'] = 'myPlaceTextBox';
        $config['placesAutocompleteBoundsMap'] = TRUE;
        $config['placesAutocompleteOnChange'] = 'var geocoder = new google.maps.Geocoder();
        var address = document.getElementById("myPlaceTextBox").value;
       var image = "http://localhost/maps/images/blue_icon.png";

                geocoder.geocode({ "address": address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
               //if(typeof marker != "undefined"){marker.setMap(null)};
                $("#location").parent().removeClass("has-error");
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                $("#latitude").val(latitude);
                $("#longitude").val(longitude);

mezmerize(address,latitude, longitude);


map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
map.setZoom(9);
//google.maps.event.addListener(marker, "dragend", function (event) {
//              latitude = this.getPosition().lat();
//              longitude = this.getPosition().lng();
//              $("#latitude").val(latitude);
//              $("#longitude").val(longitude);
//              });
            }
        });

';
        $this->googlemaps->initialize($config);
        $data2['map'] = $this->googlemaps->create_map();
        $data['rfps'] = $this->rfp->pro_getRfp();
        $data1['rfp_det'] = $this->rfp->mo_getRfpDet();
        $data3['mmm'] = $this->rfp->mo_getRfpDet();
        $this->layouts->view('mo_campaign_det', null, array_merge($data, $data1, $data2, $data3));
    }

    public function ad_campaigns1()
    {

        //get proposal details

        $config['center'] = '-26.2044,28.0456';
        $config['zoom'] = '7';
        $config['places'] = TRUE;

        $config['placesAutocompleteInputID'] = 'myPlaceTextBox';
        $config['placesAutocompleteBoundsMap'] = TRUE;
        $config['placesAutocompleteOnChange'] = 'var geocoder = new google.maps.Geocoder();
        var address = document.getElementById("myPlaceTextBox").value;
       var image = "http://localhost/maps/images/blue_icon.png";

                geocoder.geocode({ "address": address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
               //if(typeof marker != "undefined"){marker.setMap(null)};
                $("#location").parent().removeClass("has-error");
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                $("#latitude").val(latitude);
                $("#longitude").val(longitude);

mezmerize(address,latitude, longitude);


map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
map.setZoom(9);
//google.maps.event.addListener(marker, "dragend", function (event) {
//              latitude = this.getPosition().lat();
//              longitude = this.getPosition().lng();
//              $("#latitude").val(latitude);
//              $("#longitude").val(longitude);
//              });
            }
        });

';
        $this->googlemaps->initialize($config);
        $data2['map'] = $this->googlemaps->create_map();
        $data['rfps'] = $this->rfp->pro_getRfp();
        $data1['rfp_det'] = $this->rfp->mo_getRfpDet();
        $data3['mmm'] = $this->rfp->mo_getRfpDet();
        $this->layouts->view('ad_campaign_det', null, array_merge($data, $data1, $data2, $data3));
    }

    function headerInfo()
    {

        $config['center'] = '-26.2044,28.0456';
        $config['zoom'] = '7';
        $config['places'] = TRUE;

        $config['placesAutocompleteInputID'] = 'myPlaceTextBox';
        $config['placesAutocompleteBoundsMap'] = TRUE;
        $config['placesAutocompleteOnChange'] = 'var geocoder = new google.maps.Geocoder();
				        var address = document.getElementById("myPlaceTextBox").value;
				       var image = "http://localhost/maps/images/blue_icon.png";

				                geocoder.geocode({ "address": address }, function (results, status) {
				            if (status == google.maps.GeocoderStatus.OK) {
				               //if(typeof marker != "undefined"){marker.setMap(null)};
				                $("#location").parent().removeClass("has-error");
				                var latitude = results[0].geometry.location.lat();
				                var longitude = results[0].geometry.location.lng();
				                $("#latitude").val(latitude);
				                $("#longitude").val(longitude);

				mezmerize(address,latitude, longitude);


				map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
				map.setZoom(9);
				            }
				        });

				';

        //GET ALL THE MEDIA TYPES
        $media_types['all_media'] = $this->media_category->getMediaCategories();
        //get Media Family
        $media_types2['all_media2'] = $this->media_category->getMediaCategoriesByFamily();
        //get Media Family
        $media_fam['my_families'] = $this->media_family->getMediaFamilies();
        $this->googlemaps->initialize($config);
        $data3['map1'] = $this->googlemaps->create_map();
//        $data3 = array();
        $this->layouts->view('new_campaign2', null, array_merge($data3, $media_types, $media_fam, $media_types2));
    }

    public function dynamic_table()
    {
        $this->load->view('dynamic_table', null);
    }

    public function city_cell()
    {
        //get the size options from the database
        $sizes['size_options'] = $this->asset_size->getMediaSizes();
        // var_dump($sizes); exit;
        $this->load->view('city_cell', $sizes);

    }

    public function saveCampaignSummaryHeaderInfo()
    {
        $POST = $this->input->post();

        // Get Standard
        $campaignTitle = $POST['camp_title'];
        $budget = $POST['budget'];
        $fromDate = $POST['from_date'];
        $toDate = $POST['to_date'];
        $respondByDate = $POST['respond_date'];
        $description = $POST['description'];
        $partialAvailability = ($POST['partial_availability'] == "on") ? 1 : 0;
        if(isset($POST['screenshots'])) {
            $screenshots = $POST['screenshots'];
        } else {
            $screenshots = "";
        }
        $locations = $POST['chosen_location'];
        $media_types = $POST['mec_id'];

        $b = str_replace(',', '', $budget);
        $b = str_replace(' ', '', $b);

        $campaignID = $this->campaign_model->saveCampaignHeaderInfo($fromDate, $toDate, $campaignTitle, $b, $respondByDate, $description, $partialAvailability);

        $c = 0;
        if (isset($screenshots)) {
            if(is_object($screenshots)) {
                foreach ($screenshots as $ss) {
                    // get each individual image
                    $img = str_replace('data:image/png;base64,', '', $ss);
                    $img = str_replace(' ', '+', $img);
                    file_put_contents('assets/images/screenshots/' . $this->session->userdata('user_id') . '_' . $campaignID . '_' . $c . '.jpg', base64_decode($img));
                    $q2 = $this->campaign_model->saveCampaignScreenshots($campaignID, '/assets/images/screenshots/' . $this->session->userdata('user_id') . '_' . $campaignID . '_' . $c . '.jpg');
                    $c++;
                }
            }
        }

        for($i = 0; $i < count($locations); $i++) {
            $latlong = $this->getCoordinates($locations[$i]);
            $ll = explode(',', $latlong);
            $insertLocationToDB = $this->campaign_model->saveCampaignLocationData($campaignID, $ll[0], $ll[1], $media_types);
        }

//         NB - Manage media types and media families

        $data3 = array();
        $data3['rfps'] = $this->rfp->getRfp();
        $this->ad_campaigns();
    }

    public function campaignSummary()
    {
        //get the longitude and latitude values
        #to deal with this later baba, not your problem for now :-)
        //end lon lat

        $campaign_header = array();
        $category_names = array();
        $asset_average_prices = array();
        $lat_long = array();
        $latlong2 = array();


        $budget = $this->input->post('budget');
        $budget = str_replace(' ', '', $budget);
        $campaign_header['camp_title'] = $this->input->post('camp_title');
        $campaign_header['budget'] = $budget;
        $campaign_header['description'] = $this->input->post('description');
        $campaign_header['partial_availability'] = $this->input->post('partial_availability');
        $campaign_header['respond_date'] = $this->input->post('respond_date');
        $campaign_header['from_date'] = $this->input->post('from_date');
        $campaign_header['to_date'] = $this->input->post('to_date');
        $media_categories['mec_stuff'] = $this->input->post('mec_id');
        $media_categories['mec_id'] = $this->input->post('mec_id');
        $media_categories['mec_ids'] = $this->media_category->getAllIds($this->input->post('mec_id'));
        $media_fam['mef_id'] = $this->input->post('mef_id');
        //get the media descs
        foreach ($media_categories as $key => $value) {
            for ($count = 0; $count < count($value); $count++) {
                //go grab your media category descriptions

                $category_names['my_categories'][$count] = $value[$count];
                //end grab
            }
        }
        $addresses = array();
        $i = 0;
        $street_add['streetAdd'] = $_POST['chosen_location'];
        foreach ($street_add['streetAdd'] as $key => $value) {
            $address = $value;
            $value = explode(",", $value);
            $value = $value[0];
//            // echo $value;
//            print_r($media_categories['mec_stuff']);
            $aap = array();
            foreach ($media_categories['mec_stuff'] as $key => $v) {
                $aap[$value][$v] = $this->asset->averageAssetPriceForArea($value, $v);
            }
            $asset_average_prices['average_price'][] = $aap;
//                $avg_price = $this->asset->averageAssetPriceForArea($value, $cn);
//            $asset_average_prices['avg_prices'][] = $this->asset->averageAssetPriceForArea($value);
            $lat_long['area_lat_long'][$key] = $this->getLangLongFromAddress($address);

            $latitude_longitude = $lat_long['area_lat_long'][$key];
            $latlong2['lat'] = $latitude_longitude;
            $addresses[$i]['address'] = $address;
            $latlang = explode(',', $latitude_longitude);
            $addresses[$i]['lat'] = $latlang[0];
            $addresses[$i]['long'] = $latlang[1];
            $allAddresses['allAddresses'][$i] = $addresses[$i];
            $i++;
        }
//        print_r($asset_average_prices);
//        // echo '<br />';
//        $latlon['lat'] = $_POST['latitude']; //moved inside foreach above to get it for each chosen area
//        $this->googlemaps->initialize($config);
//        $data3['map1'] = $this->googlemaps->create_map();
        $data3 = array();
//        // echo '<pre>';
//        var_dump(array_merge($data3, $campaign_header, $media_categories, $street_add, $latlong2, $category_names, $media_fam, $asset_average_prices, $lat_long, $allAddresses));
//        // echo '</pre>';
        $this->layouts->view('create_new_campaign', null, array_merge($data3, $campaign_header, $media_categories, $street_add, $latlong2, $category_names, $media_fam, $asset_average_prices, $lat_long, $allAddresses));
//        print_r(array_merge($campaign_header, $media_categories, $street_add, $latlong2, $category_names,  $data3, $media_fam, $asset_average_prices, $lat_long));
//        print_r($this->input->post());

        //

//        $this->layouts->view('new_campaign3');
    }

    public function upload_campaign()
    {

        $image_path_base = 'uploaded_documents/campaign_assets/user_photos/';
        $map_path_base = 'uploaded_documents/campaign_assets/map_snapshots/';

        $campaign = array(
            'id' => '',
            'images' => array(
                'user' => array(),
                'map' => array()
            )
        );


        if (array_key_exists('campaign_id', $_POST)) {
            $campaign['id'] = $_POST['campaign_id'];
            unset($_POST['campaign_id']);
        }


        foreach ($_POST as $key => $value) {
            list($type, $id, $desc_or_image) = explode('_', $key);
            if (!array_key_exists($id, $campaign['images'][$type])) {
                $campaign['images'][$type][$id] = array(
                    'description' => '',
                    'image_path' => ''
                );
            }
            if ($desc_or_image == 'description') {
                $campaign['images'][$type][$id]['description'] = $value;
            } else {
                //Convert the image, move it and link its url
                list($img_type, $data) = explode(';', $value);
                list(, $ext) = explode('/', $img_type);
                if (trim($ext) == '') {

                }
                list(, $data) = explode(',', $data);
                $data = base64_decode($data);
                do {
                    $filename = uniqid($type . "_") . "." . $ext;
                    $full_path = $image_path_base . $filename;
                } while (file_exists($full_path));
                if (!file_put_contents($full_path, $data)) {
                    $campaign['images'][$type][$id]['image_path'] = 'Error';
                }
                $campaign['images'][$type][$id]['image_path'] = $full_path;
            }
        }

        print_r($campaign);
        // // echo (count($campaign));
        //Use $campaign

        //now store the campaign data in the uploaded documents table
        // for($i=0;$i<count($campaign); $i++){
        //print_r($campaign[$i]);
        //$this->uploaded_documents->rfpDocs($this->session->userdata('user_id'));

    }//}

    public function saveCampaign()
    {

        // Counters
        $numberOfPlaces = 0; // how many locations
        $types = 0; // how many media types
        $families = 0; // how many media families we have
        $totalValues = 0; // locations * media types - so we know how which value belongs to which media type and to which

//            // echo '<pre>';
//            var_dump($this->input->post('partial_availability'));
//            // echo '</pre>';
//
//            // echo '<br /><br /><br /><br />';

        $POST = $this->input->post();

//        echo '<pre>';
//        print_r($POST);
//        echo '</pre>';
//exit;

        // Get Standard
        $campaignTitle = $POST['camp_title'][0];
        $budget = $POST['budget'][0];
        $fromDate = $POST['from_date'][0];
        $toDate = $POST['to_date'][0];
        $respondByDate = $POST['respond_date'][0];
        $description = $POST['description'][0];
        $subtotal = $POST['subtotal'][0];
        $partialAvailability = $POST['partial_availability'][0];

        // Get all Places
        $streetAddresses = $POST['street_address'];
        foreach ($streetAddresses as $address) {
            $numberOfPlaces++;
        }

        // Get all Media Types
        $mediaTypes = $POST['media_types'];
        foreach ($mediaTypes as $type) {
            $allTypes = explode(',', $type);
            foreach ($allTypes as $at) {
                if ($at != "") {
                    $types++;
                }
            }
        }

        // Get all Media Families
        $mediaFamilies = $POST['media_families'];
        foreach ($mediaFamilies as $family) {
            $families++;
        }

        // get the quantities
        $quantities = $POST['med_quantity'];

        // get the average totals
        $average_totals = $POST['avg_total'];

        // get the rem total
        $rem_totals = $POST['rem_total'];

        // get the total items on page
        $totalValues = $types * $numberOfPlaces; // get total amount of values for correct indexing

        // create an array to hold all average prices
        $average_prices = array();
        $count = 0;
        foreach ($streetAddresses as $address) {
            // create an array to hold each individual item so we do not duplicate
            $typesAlreadyIndexed = array();
            // loop through the media types (we can get each individual row, then we can get the average price
            foreach ($POST['mec_id'] as $type) {
                $allTypes = explode(',', $type);
                for ($i = 0; $i < count($allTypes); $i++) {
                    if (!in_array($allTypes[$i], $typesAlreadyIndexed)) {
                        if ($allTypes[$i] != "") {
                            // type and area is available here
                            $typesAlreadyIndexed[] = $allTypes[$i];
                            $av_price = $this->asset->averageAssetPriceForArea($address, $allTypes[$i]);
                            $average_prices[$count]['av_price'] = $av_price;
                            $average_prices[$count]['address'] = $address;
                            $average_prices[$count]['type'] = $allTypes[$i];
                            $count++;
                        }

                    }

                }
            }

        }
        $dataInfo = array();
        // all info now stored in $dataInfo variable. Quantity, Address, Type and Average Price.
        for ($i = 0; $i < count($quantities); $i++) {
            $dataInfo[$i]['qty'] = $quantities[$i];
            $dataInfo[$i]['address'] = $average_prices[$i]['address'];
            $dataInfo[$i]['type'] = $average_prices[$i]['type'];
            $dataInfo[$i]['av_price'] = $average_prices[$i]['av_price'];
        }

        $total = 0;
        // get the subtotal
        for ($i = 0; $i < count($dataInfo); $i++) {
            $subt = $dataInfo[$i]['qty'] * $dataInfo[$i]['av_price'];
            $total += $subt;
        }
//            // echo number_format($total,2);
        $b = str_replace(',', '', $budget);

//        // echo '<pre>';
//        var_dump($dataInfo);
//        // echo '</pre>';

        $q = $this->campaign_model->saveCampaignHeaderInfo($fromDate, $toDate, $campaignTitle, $b, $respondByDate, $description, $partialAvailability);

        $campaignID = $this->db->insert_id();

        foreach ($dataInfo as $di) {
//                print_r($di);

//                // echo $di['address'];
            $latlong = $this->getCoordinates($di['address']);
            $ll = explode(',', $latlong);
            $quantity = $di['qty'];
            $mec_id = $this->db->query("select mec_id FROM media_category WHERE mec_description = '" . $di['type'] . "'");
            $mec_id_to_pass = 0;
            foreach ($mec_id->result() as $mi) {
                $mec_id_to_pass = $mi;
            }
            $q2 = $this->campaign_model->saveCampaignTransactionInfo($campaignID, $mec_id_to_pass, $ll[0], $ll[1], $quantity);

        }
        $data3 = array();
        $data3['rfps'] = $this->rfp->getRfp();
        $this->ad_campaigns();
    }

    function getCoordinates($address)
    {

        $address = str_replace(" ", "+", $address); // replace all the white space with "+" sign to match with google search pattern
        $address = str_replace("++", "+", $address);
        $url = "http://maps.google.com/maps/api/geocode/json?sensor=false&address=$address";

        $response = file_get_contents($url);

        $json = json_decode($response, TRUE); //generate array object from the response from the web

//        print_r($json);
        if ($json != "" && $json != null) {
            return ($json['results'][0]['geometry']['location']['lat'] . "," . $json['results'][0]['geometry']['location']['lng']);
        }


    }

    public function ajax_get_mediatypes()
    {
        /*
        Example call http://indigostorage.co.za/ads_final/index.php/new_campaign/ajax_get_mediatypes/?id=digital,traditional

        Result: [{"id":"2","text":"bench"},{"id":"3","text":"bus (Digital)"},{"id":"5","text":"street pole (Digital)"},{"id":"7","text":"bill board (Digital)"},{"id":"9","text":"taxi tv digital network"},{"id":"10","text":"cafe digital network"},{"id":"1","text":"poster"},{"id":"11","text":"magazine advert "},{"id":"4","text":"bus (Traditional)"},{"id":"6","text":"street pole (Traditional)"},{"id":"8","text":"bill board (Traditional)"}]
        */
        $all_media = array();
        $new_media = array();

//            // echo $this->input->get('media_family_id');
        if ($this->input->get('id')) {
            $all_media = $this->media_category->getMediaCategoriesByFamily($this->input->get('id'));
        } else {
            $all_media = $this->media_category->getMediaCategoriesByFamily();
        }
        foreach ($all_media as $row) {
            # code...
            $new_media[] = array('id' => $row->mec_id, 'text' => $row->mec_description);
        }
        echo json_encode($new_media);
    }

    /* Utility functions google maps*/
    // function to get the address
    public function getLangLongFromAddress($address)
    {

        $address = str_replace(" ", "+", $address);

        //$json = file_get_contents("http://maps.google.com/maps/api/geocode/json?address=$address&sensor=false&region=$region");
        $json = file_get_contents("http://maps.google.com/maps/api/geocode/json?address=$address&sensor=false&region=");
        $json = json_decode($json);

        $lat = $json->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
        $long = $json->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};
        return $lat . ',' . $long;
    }

    public function getAddressFromLatLong($lat, $lng)
    {

        $url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' . trim($lat) . ',' . trim($lng) . '&sensor=false';
        $json = @file_get_contents($url);
        $data = json_decode($json);
        $status = $data->status;
        if ($status == "OK")

            return $data->results[0]->formatted_address;
        else
            return "not available";

    }

    public function send_back_to_media_owner() {
        $rfp_for_submission_id = $_GET['id'];
        $this->load->view('send_back_to_media_owner', array('id' => $rfp_for_submission_id));
    }

    public function do_send_back_to_media_owner() {
        try {
            $comment = $_POST['comment'];
            $rfp_for_submission_id = $_POST['id'];
            $rfp = $this->rfp_for_submission->findById($rfp_for_submission_id);
            $data = array(
                'comments' => $comment,
                'rfp_for_submission_id' => $rfp_for_submission_id,
                'user_id' => $this->session->userdata('user_id'),
                'created_at' => date('Y-m-d H:j:s')
            );
            $id = $this->rfp_for_submission_comment->create($data);
            if(is_numeric($id)) {
                $rfp_data = array(
                    'proccessed_operator' => 1,
                    'proccessed_media_owner' => 0
                );
                $this->rfp_for_submission->updateData($rfp_for_submission_id, $rfp_data);
                $statusData = array(
                    'campaign_id' => $rfp->campaign_id,
                    'proposal_status_id' => 3,
                    'user_id' => $this->session->userdata('user_id'),
                    'created_at' => date('Y-m-d H:j:s'),
                    'updated_at' => date('Y-m-d H:j:s'),
                );
                $this->workflow_status->createStatus($statusData);
            }
            echo json_encode(array('success' => true, 'message' => 'Proposal sent back to media owner!'));
        }catch( Exception $ex) {
            echo json_encode(array('success' => false, 'message' => 'Proposal not sent back to media owner: ' . $ex->getMessage()));
        }
    }

    public function send_proposal_to_advertiser() {
        try {
            $rfp_for_submission_ids = $_POST['rfp_sub_ids'];
            $ids = explode('_', $rfp_for_submission_ids);
            $campaign_id = '';
            foreach ($ids as $rfp_for_submission_id) {
                $rfp_for_sub = $this->rfp_for_submission->findById($rfp_for_submission_id);
                $campaign_id = $rfp_for_sub->campaign_id;
                $rfp_data = array(
                    'proccessed_operator' => 1,
                    'proccessed_media_owner' => 1,
                    'complete' => 1
                );
                $this->rfp_for_submission->updateData($rfp_for_submission_id, $rfp_data);
                // Change status for campaign to 14
                $campaign_data = array(
                    'pro_status_id' => 14
                );
                $this->campaign_model->updateData($rfp_for_sub->campaign_id, $campaign_data);
            }
            echo json_encode(array('success' => true, 'message' => 'Quotations(s) sent to advertiser', 'campaign_id' => $campaign_id));
        }catch (Exception $ex) {
            echo json_encode(array('success' => false, 'message' => $ex->getMessage()));
        }
    }

    public function dummy() {

        $statusData = array(
            'campaign_id' => 1,
            'proposal_status_id' => 3,
            'user_id' => $this->session->userdata('user_id'),
            'created_at' => date('Y-m-d H:j:s'),
            'updated_at' => date('Y-m-d H:j:s'),
        );
        echo "here"; exit();
        $this->workflow_status->createStatus($statusData);
        echo "comes here";
    }

}
