<?php

class asset extends CI_Model{
	
	function insertAsset ($latitude){
		$sql = "INSERT INTO ads_asset (longitutde)
        VALUES ($latitude)";
		mysql_query($sql);
	}

	function averageAssetPriceForArea($area, $item){


        $sqlSelect = "SELECT MAX(ass_production_price_SCY) as max FROM asset INNER JOIN media_category ON asset.mec_id = media_category.mec_id WHERE media_category.mec_description = '". $item ."' AND (ass_city = '". $area ."' OR ass_province = '". $area ."' OR ass_country = '". $area ."')";

		$query = $this->db->query($sqlSelect);
        $max = 0;
        foreach($query->result() as $q => $v) {
            $max = $v;
        }

        $sqlSelect2 = "SELECT MIN(ass_production_price_SCY) as min FROM asset INNER JOIN media_category ON asset.mec_id = media_category.mec_id WHERE media_category.mec_description = '". $item ."' AND (ass_city = '". $area ."' OR ass_province = '". $area ."' OR ass_country = '". $area ."')";
        $query2 = $this->db->query($sqlSelect2);
        $min = 0;
        foreach($query2->result() as $q => $v) {
            $min = $v;
        }

        return ($max->max + $min->min) / 2;

	}

    function getAssetOwnerId($id) {
        $query = $this->db->query("SELECT use_id FROM asset WHERE ass_id = '" . $id ."'");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            return $row->use_id;   
        } 
    } 
    #get asset details by ID
    function assetByID($campaign_id, $mec_id) {
     
        $select_query = $this->db->query("SELECT
        campaign_transaction.camt_id,
        campaign_transaction.cam_id,
        campaign_transaction.mec_id,
        campaign_transaction.cam_latitude,
        campaign_transaction.cam_longitude,
        campaign_transaction.asi_id,
        campaign_transaction.asg_id,
        campaign_transaction.quantity,
        campaign_transaction.rfp_transaction_id,
        asset.asset_status_id,
        asset.ass_name,
        asset.ass_id,
		asset.position,
        asset.ass_production_cost_BCY,
        asset.ass_production_price_SCY,
        asset_status.asset_status,
	asset.mec_id,
        asset.ass_city
        FROM
        campaign_transaction
        INNER JOIN asset ON campaign_transaction.mec_id = asset.mec_id
        INNER JOIN asset_status ON asset.asset_status_id = asset_status.asset_status_id
        WHERE
        campaign_transaction.mec_id = '$mec_id' AND
        campaign_transaction.cam_id = '$campaign_id'
        ");
		
		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
//			print_r($data); exit();
			//echo $this->db->last_query(); 

			return $data;

		} else {
			return false;
		}
		
    }  

}