<?php

//following class accesses the lms_user tuple
class dashboard extends CI_Model {

    function userBids ($user_id=0, $bid_type=1) {
    	//Bid types: 1=Active, 2=Won, 3=Lost

    	switch ($bid_type) {
    		case 2:
    			# Won Bids
    			$bidtype_filter = "AND (auctions.`status` IN (2) AND auctions.`current_bidder` = bids.bidder)";
    			break;

    		case 3:
    			# Lost bids
    			$bidtype_filter = "AND (auctions.`status` IN (2) AND auctions.`current_bidder` <> bids.bidder) ";
    			break;
    		
    		default:
    			# Active bids (auction still in progress)
    			$bidtype_filter = "AND CURRENT_TIMESTAMP <= auctions.`ends` AND auctions.`status` NOT IN (0,2,9) ";
    			break;
    	}

    	//filter by user id if provided, else get all active bids for auctions not yet won
    	$user_filter = ($user_id>0)?"  AND bids.bidder = '$user_id'":'';

		$select_query = $this->db->query("
			SELECT
				bids.id,
				Max(bids.bid) AS bid,
				Max(bids.bidwhen) as bidwhen,
				auctions.id AS auction_id,
				auctions.title AS ass_name,
				auctions.ass_id,
				auctions.`starts`,
				auctions.`ends`,
				auctions.`buy_now`,
				auctions.`current_bid`,
				auctions.`current_bidder`,
				media_categories.description,
				auctions.`status`
			FROM
				bids
			INNER JOIN auctions ON bids.auction = auctions.id
			LEFT JOIN asset ON asset.ass_id = auctions.ass_id
			LEFT JOIN media_categories ON asset.mec_id = media_categories.mec_id			
			WHERE
				bid>0
				$bidtype_filter
				$user_filter
			GROUP BY
				auctions.id
			ORDER BY bidwhen DESC");
		//echo $this->db->last_query();
		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}  
    
    function userLatestBid ($user_id=0) {

    	//filter by user id if provided, else get all active bids for auctions not yet won
    	$user_filter = ($user_id>0)?"  AND bids.bidder = '$user_id'":'';

		$select_query = $this->db->query("
			SELECT
				bids.id,
				bid,
				bids.bidwhen,
				auctions.id AS auction_id,
				auctions.ass_id,
				auctions.`ends`
			FROM
				bids
			INNER JOIN auctions ON bids.auction = auctions.id
			WHERE
				auctions.`status` NOT IN (0,2,9)
				$user_filter
			ORDER BY id DESC limit 1");

		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}

    function userWatchList ($user_id=0) {

    	//filter by user id if provided, else get all active bids for auctions not yet won
    	$user_filter = ($user_id>0)?"  AND watch_list.use_id = '$user_id'":'';

		$select_query = $this->db->query("
			SELECT
				DISTINCT
				auctions.id AS auction_id,
				auctions.title,
				auctions.`starts`,
				auctions.minimum_bid,
				auctions.buy_now,
				auctions.increment,
				auctions.`ends`,
				auctions.closed,
				auctions.current_bid,
				auctions.sold,
				auctions.`status`,
				asset.ass_id,
				asset.ass_name,
				asset.position,
				asset.mec_id,
				asset.ass_position,
				asset.latitude,
				asset.longitude,
				media_categories.description,
				watch_list.`status` as watch_list_status
			FROM
				watch_list
			INNER JOIN auctions ON watch_list.auction = auctions.id
			INNER JOIN asset ON asset.ass_id = watch_list.ass_id
			INNER JOIN media_categories ON asset.mec_id = media_categories.mec_id
			WHERE 1 
				AND watch_list.`status` > 0
				$user_filter
			ORDER BY watch_id DESC");

		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}

    function totalAuctions ($user_id=0) {

    	//filter by user id if provided, else get all active bids for auctions not yet won
    	$user_filter = ($user_id>0)?"  AND auctions.use_id = '$user_id'":'';

		$select_query = $this->db->query("
			SELECT
				Count(auctions.id) as total
			FROM auctions
			WHERE 
				`status`=1
				$user_filter
			");

		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}

    function totalAssets ($user_id=0) {

    	//filter by user id if provided, else get all active bids for auctions not yet won
    	$user_filter = ($user_id>0)?"  AND asset.use_id = '$user_id'":'';
    	
		$select_query = $this->db->query("
			SELECT
				Count(asset.ass_id) AS total_assets,
				Sum(asset.ass_acquisition_cost) as total_acquisition_cost
			FROM asset
			WHERE 1
				$user_filter
			");

		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}

}


