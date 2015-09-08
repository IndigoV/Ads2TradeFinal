<?php ob_start(); ?>
<?php

//to replace asssssssetsi model
//
class Assets extends CI_Model
{

	function getDurations(){
		$data = array();
		$select_query = $this->db->get('durations');
			
		if ($select_query->num_rows > 0){
			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;
		} else {
			return false;
		}
	}


	function addAsset($parentage_data=null) {
	    
	    if(is_null($parentage_data)){

	    	$ass_is_mall = $this->input->post('ass_is_mall');
	    	if(!is_null($ass_is_mall) && $ass_is_mall != ''){
	    		//$ass_is_mall = 0;
	    	} else {
	    		$ass_is_mall = 0;
	    	}
    	   
    	    $data = array(
    	            'ass_name' => $this->input->post('title'),
    	            'ass_description' => $this->input->post('desc'),
    	            'position' => $this->input->post('position'),
    	            'mec_id' => $this->input->post('mec_id'),
    	            'ass_date' => date('Y-m-d H:i:s'),
    	            'ass_is_mall' => $ass_is_mall,
    	            'use_id' => $this->session->userdata('user_id')
    	   );
	    	     
	       $this->db->insert('asset', $data); 
	       $asset_id = $this->db->insert_id();
	       /* Also create a Mall table record if ass_is_mall=1 
	       	  TODO: Check asset editing logic and also manipulate the mall table as appropriate when changes are done in asset for a ass_is_mall=1*/
	       	if($ass_is_mall == 1){
	       		$mall_position = $this->input->post('position');
	       		$mall_position = explode(",", $mall_position);
   	    	    $mall_data = array(
   	    	            'mall_name' => $this->input->post('title'),
   	    	            'mall_latitude' => $mall_position[0],
   	    	            'mall_longitude' => $mall_position[1],
   	    	            'ass_id' => $asset_id,
   	    	            'user_id' => $this->session->userdata('user_id')
   	    	   	);

   	    	   	$this->db->insert('mall', $mall_data);  
   	    	   	$mall_id = $this->db->insert_id(); //returns mall id (used in our_ajax controller )
   	    	   	return $asset_id;
	       	} else {
	       		return $asset_id; //returns the asset id
	       	}

	    } else {
	    	$this->db->query(
			"INSERT INTO `asset` (`position`) VALUES ('$parentage_data')"
			);
			return $this->db->insert_id();
	    }
	}  

	function getAssetDetails()
	{
		if (isset($_POST['filter'])) {
                    if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
			$ass_types = $_POST['mec_id'];
			
				foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
				}
			}
                        
                        if (isset($_POST['mef_id']) && !empty($_POST['mef_id'])) {
                        $ass_family = $_POST['mef_id'];
			
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
				}
			}
                        if (isset($_POST['mam_id']) && !empty($_POST['mam_id'])) {
                        $ass_master = $_POST['mam_id'];
			
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
				}
			}
                       
                        
			if (isset($_POST['duration']) && !empty($_POST['duration'])) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
				}
			}
			
			
		}
		if (isset($_POST['media_category']) && !empty($_POST['media_category'])) {
				$media_cat = $_POST['media_category'];
				foreach ($media_cat as $med_cat) {
					$this->db->or_where('media_category.mec_description', $med_cat);
				}
			}
			
			if (isset($_POST['media_type']) && !empty($_POST['media_type'])) {
				$media_type = $_POST['media_type'];
				foreach ($media_type as $med_type) {
					$this->db->or_where('master_medium_type.met_description', $med_type);
				}
			}
			
			if (isset($_POST['auction_status']) && !empty($_POST['auction_status'])) {
				$auction_status = $_POST['auction_status'];
				foreach ($auction_status as $auction_stat) {
					$this->db->or_where('auctions.status', $auction_stat);
				}
			}
			
			if (isset($_POST['activeNotActive']) && !empty($_POST['activeNotActive'])) {
				$active_not_active = $_POST['activeNotActive'];
				foreach ($active_not_active as $activeNot) {
					$this->db->or_where('asset_status.asset_status', $activeNot);
				}
			}
			
			if (isset($_POST['media_status']) && !empty($_POST['media_status'])) {
				$media_status = $_POST['media_status'];
				foreach ($media_status as $media_stat) {
					$this->db->or_where('asset_status.asset_status', $media_stat);
				}
			}

		
		//TODO: do we need a username here????
		$this->db->where('asset.use_id', $this->session->userdata('user_id'));
		$this->db->where('auctions.status', '1');
		$this->db->select('asset.*,auctions.*');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id', 'left outer');
                $this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
                $this->db->join('master_medium_type', 'media_category.mam_id = master_medium_type.mam_id');
                $this->db->join('media_family', 'master_medium_type.mef_id = media_family.mef_id');
                $this->db->join('asset_status', 'asset.asset_status_id = asset_status.asset_status_id');
		$select_query = $this->db->get();
		

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
function getAssetDetailsm()
	{
		if (isset($_POST['filter'])) {
                    if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
			$ass_types = $_POST['mec_id'];
			
				foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
				}
			}
                        
                        if (isset($_POST['mef_id']) && !empty($_POST['mef_id'])) {
                        $ass_family = $_POST['mef_id'];
			
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
				}
			}
                        if (isset($_POST['mam_id']) && !empty($_POST['mam_id'])) {
                        $ass_master = $_POST['mam_id'];
			
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
				}
			}
                       
                        
			if (isset($_POST['duration']) && !empty($_POST['duration'])) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
				}
			}

		}
        
        $user_id = $this->session->userdata('user_id');

        $this->db->where('asset.use_id', $user_id);
		$this->db->where('auctions.status', '1');
		$this->db->select('*');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id', 'left outer');
                $this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
                $this->db->join('master_medium_type', 'media_category.mam_id = master_medium_type.mam_id');
                $this->db->join('media_family', 'master_medium_type.mef_id = media_family.mef_id');
		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
//			print_r($data); exit();
			return $data;

		} else {
			return false;
		}

	}
	function getAssetSpiderfy()
	{
		if (isset($_POST['filter'])) {

			$this->db->where('asset.ast_id', $this->input->post('ast_id'));

			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}
		//$this->db->where('auctions.status', '1');
		$this->db->select('auctions.id, asset.position,asset.loc_id,asset.ast_id, asset.ass_id, asset.ass_name, asset.ass_description');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id');
		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}

	}

        function getAssetDetailm()
	{
             
		if (isset($_POST['filter'])) {

                    if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
			$ass_types = $_POST['mec_id'];
			foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
				}
			}
                        if (isset($_POST['mef_id']) && !empty($_POST['mef_id'])) {
                        $ass_family = $_POST['mef_id'];
			
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
				}
			}
                        if (isset($_POST['mam_id']) && !empty($_POST['mam_id'])) {
                        $ass_master = $_POST['mam_id'];
			
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
				}
			}
                        
                      
                        
			if (isset($_POST['duration']) && !empty($_POST['duration'])) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
				}
			}

		}

		$user_id = $this->session->userdata('user_id');

		$this->db->where('asset.use_id', $user_id);
		$this->db->group_by('mec_id');
                $this->db->group_by('duration');
                $this->db->order_by('duration', 'desc');
		//$this->db->select('count(*)as counts,`loc_id`,`ast_id`'); 
		$this->db->select('auctions.id, count(*) as counts, auctions.duration as loc_id,asset.mec_id');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id');
                
                $this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
                $this->db->join('master_medium_type', 'media_category.mam_id = master_medium_type.mam_id');
                $this->db->join('media_family', 'master_medium_type.mef_id = media_family.mef_id');
		$select_query = $this->db->get();
   
		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}
	}
	
	function getAssetDetail()
	{
             
		if (isset($_POST['filter'])) {

                    if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
			$ass_types = $_POST['mec_id'];
			foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
				}
			}
                        if (isset($_POST['mef_id']) && !empty($_POST['mef_id'])) {
                        $ass_family = $_POST['mef_id'];
			
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
				}
			}
                        if (isset($_POST['mam_id']) && !empty($_POST['mam_id'])) {
                        $ass_master = $_POST['mam_id'];
			
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
				}
			}
                        
                      
                        
			if (isset($_POST['duration']) && !empty($_POST['duration'])) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
				}
			}

		}
		//$this->db->where('auctions.status', '1');
		$this->db->group_by('mec_id');
                $this->db->group_by('duration');
                $this->db->order_by('duration', 'desc');
		//$this->db->select('count(*)as counts,`loc_id`,`ast_id`');
		$this->db->select('auctions.id, count(*) as counts, auctions.duration as loc_id,asset.mec_id, auctions.starts,auctions.ends,auctions.status, auctions.closed, auctions.suspended, media_category.description as mec_description, master_medium_type.met_description, asset.ass_city, asset.ass_street_address');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id');
                
        //$this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
        $this->db->join('media_categories media_category', 'asset.mec_id = media_category.mec_id');
        $this->db->join('master_medium_type', 'media_category.mam_id = master_medium_type.mam_id');
        $this->db->join('media_family', 'master_medium_type.mef_id = media_family.mef_id');
		$select_query = $this->db->get();
   
		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}
	}
	function getAssetDetails1m()
	{
            
		if (isset($_REQUEST['aset'])) {

			$this->db->or_where('asset.mec_id', $_REQUEST['aset']);

			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}
                if (isset($_GET['duration'])) {

			$this->db->or_where('auctions.duration', $_GET['duration']);

			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}
                
                
                if (isset($_POST['filter'])) {

                    if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
			$ass_types = $_POST['mec_id'];
			foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
				}
			}
                        if (isset($_POST['mef_id']) && !empty($_POST['mef_id'])) {
                        $ass_family = $_POST['mef_id'];
			
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
				}
			}
                        if (isset($_POST['mam_id']) && !empty($_POST['mam_id'])) {
                        $ass_master = $_POST['mam_id'];
			
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
				}
			}
                        
                        
                        
			if (isset($_POST['duration']) && !empty($_POST['duration'])) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
				}
			}

		}
		$user = $this->session->userdata('user_id');
		$user_id = $user;
		// $this->db->where('auctions.status', '1');
		$this->db->where('asset.use_id', $user_id);
		$this->db->select('auctions.id,auctions.current_bid,asset.ass_address,asset.ass_description,asset.ass_id, asset.mec_id, asset.position, asset.ass_name');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id', 'left outer');
		$this->db->join('images', 'asset.img_id = images.img_id', 'left outer');

		//for pintos            

		$this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
		$this->db->join('master_medium_type', 'media_category.mam_id = master_medium_type.mam_id');
		$this->db->join('media_family', 'master_medium_type.mef_id = media_family.mef_id');
		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}

	}
	function getAssetDetails1($area='')
	{
		//setup conditions
		$where_condition = '1 ';
		$no_area = true;

		//area filter if any is specified
		if($area !='' && !is_null($area)){
			$this->db->where('asset.ass_city', $area);	
			$where_condition .= "AND (asset.ass_city ='$area') ";
			$no_area = false;
		}

            
		if (isset($_REQUEST['aset']) && $_REQUEST['aset'] !='' && $no_area) {

			$this->db->or_where('asset.mec_id', $_REQUEST['aset']);
			$where_condition .=  " OR (asset.mec_id = '".$_REQUEST['aset']."')";
			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}
        
        if (isset($_GET['duration']) && $no_area) {

			$this->db->where('auctions.duration', $_GET['duration']);
			$where_condition .=  " AND (auctions.duration = '".$_REQUEST['duration']."')";
			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}
                

        if (isset($_GET['mec_id2']) && $no_area) {

			$this->db->where('asset.mec_id', $_GET['mec_id2']);
			$where_condition .=  " AND (asset.mec_id = '".$_REQUEST['mec_id2']."')";
			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}

                
        if (isset($_POST['filter']) && $no_area) {

            if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
				$ass_types = $_POST['mec_id'];
				foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
					$where_condition .=  " OR (asset.mec_id = '".$ast_id."')";
				}
			}
            
            if (isset($_POST['mef_id']) && !empty($_POST['mef_id']) && $no_area) {
                $ass_family = $_POST['mef_id'];
	
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
					$where_condition .=  " OR (media_family.mef_id = '".$mef_id."')";
				}
			}
            
            if (isset($_POST['mam_id']) && !empty($_POST['mam_id']) && $no_area) {
                $ass_master = $_POST['mam_id'];
	
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
					$where_condition .=  " OR (master_medium_type.mam_id = '".$mam_id."')";
				}
			}
                
			if (isset($_POST['duration']) && !empty($_POST['duration']) && $no_area) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
					$where_condition .=  " OR (auctions.duration = '".$dur."')";
				}
			}
		}

		//Rooms page filters
		$rooms_mec_id = $this->input->get('rmec_id');
		$rooms_duration = $this->input->get('rduration');

		if($rooms_duration > 0 && $rooms_mec_id > 0){

		}

		$user = $this->session->userdata('use_id');
		// $this->db->where('auctions.status', '1');
		$this->db->where('asset.use_id', '$user');
		$this->db->select('auctions.id,auctions.status,auctions.current_bid,asset.ass_address,asset.ass_description,asset.ass_id, asset.mec_id, asset.position, asset.ass_name,asset.ass_street_address, asset.ass_city, asset.ass_province');
		$this->db->from('asset');
		$this->db->join('auctions', 'asset.ass_id = auctions.ass_id', 'left outer');
        $this->db->join('images', 'asset.img_id = images.img_id', 'left outer');
                
		//for pintos            
                
		$this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
		$this->db->join('master_medium_type', 'media_category.mam_id = master_medium_type.mam_id');
		$this->db->join('media_family', 'master_medium_type.mef_id = media_family.mef_id');
		$select_query = $this->db->get();

		//echo $this->db->last_query();
		//echo "<hr>"; 
		//echo $where_condition;
		//exit;

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();
				foreach ($select_query->result() as $row) {
					$data[] = $row;
				}
				//print_r($data); exit();
				return $data;
			} else {
				return false;
		}

	}


    function getMediaCategoryIdByName($descr) {
        $query = $this->db->query("SELECT mec_id FROM media_category WHERE mec_description = '" . $descr ."'");
        foreach ($query->result() as $row)
		{
		   return $row->mec_id;
		}
    }

	function getMyAsset($filter='')
	{
		if (isset($_REQUEST['aset'])) {

			$this->db->where('asset.ast_id', $_REQUEST['aset']);

			//$this->db->where('position', $this->input->post('location'));
			//$this->db->where('use_status', 1);

		}

		//filters
		$mec_ids = $this->input->post('mec_id'); 	//array of mec_descriptions
		$duration = $this->input->post('duration');	//array of duration ids
		$location = $this->input->post('location');	//text
			
		// first one
		$first_mec = 1;


		$where_mec_id_in = array();

		foreach ($mec_ids as $mec_description) {
			// get mec_id
			$where_mec_id_in[]  = $this->getMediaCategoryIdByName($mec_description);
		}

		if(!empty($where_mec_id_in)){
			$this->db->where_in('asset.mec_id', $where_mec_id_in);
		}
		//$filter = $this->input->post('filter');

		if(isset($filter)){
			if(($filter != '') && (!is_null($filter))){
				// filter asset selection
				$this->db->like('asset.ass_ref',$filter);
				$this->db->or_like('asset.ass_name',$filter);
				$this->db->or_like('asset.ass_description',$filter);
				$this->db->or_like('asset.ass_street_address',$filter);
				$this->db->or_like('asset.ass_city',$filter);
			}
		}

		//TODO: User id from session
		//$user = '5'; 
		$user_id = $this->session->userdata('user_id');

		$this->db->where('use_id', $user_id);
		$this->db->select('asset.loc_id,asset.position,asset.ass_name,asset.ass_id, asset.ass_ref, asset.mec_id, mec_description, asset.ass_street_address, 
			asset.ass_city, ass_acquisition_cost, ass_production_cost_BCY, ass_proportional_costs, media_category.mec_description, 
			asset.ass_description, images.url,asset.ass_address, asset.ass_status as reserved, asset.ass_status_detail');
		$this->db->from('asset');                
                $this->db->join('images', 'asset.img_id = images.img_id', 'left outer');
		$this->db->join('media_category', 'asset.mec_id = media_category.mec_id');
		
        $select_query = $this->db->get();

        //echo $this->db->last_query();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}

	}

    function getMyAsset_op()
	{
		if (isset($_REQUEST['aset'])) {
			$this->db->where('asset.ast_id', $_REQUEST['aset']);
		}

		//Get user_id and user type
        $user_id = $this->session->userdata('user_id');
        $user_type = $this->session->userdata('user_type');

		//setup conditions
		//$where_condition = '1 ';
		$no_area = true;

		//filter by user if user is not an operator
		if($user_type == 2){
			$where_condition .= " AND (auctions.use_id='$user_id') ";
		}

        //additional filters for auction approval page        
        if (isset($_POST['filter']) && $no_area) {

            if (isset($_POST['mec_id']) && !empty($_POST['mec_id'])) {
				$ass_types = $_POST['mec_id'];
				foreach ($ass_types as $ast_id) {
					$this->db->or_where('asset.mec_id', $ast_id);
					$where_condition .=  " OR (asset.mec_id = '".$ast_id."')";
				}
			}
            
            if (isset($_POST['mef_id']) && !empty($_POST['mef_id']) && $no_area) {
                $ass_family = $_POST['mef_id'];
	
				foreach ($ass_family as $mef_id) {
					$this->db->or_where('media_family.mef_id', $mef_id);
					$where_condition .=  " OR (media_family.mef_id = '".$mef_id."')";
				}
			}
            
            if (isset($_POST['mam_id']) && !empty($_POST['mam_id']) && $no_area) {
                $ass_master = $_POST['mam_id'];
	
				foreach ($ass_master as $mam_id) {
					$this->db->or_where('master_medium_type.mam_id', $mam_id);
					$where_condition .=  " OR (master_medium_type.mam_id = '".$mam_id."')";
				}
			}
                
			if (isset($_POST['duration']) && !empty($_POST['duration']) && $no_area) {
				$duration = $_POST['duration'];
				foreach ($duration as $dur) {
					$this->db->or_where('auctions.duration', $dur);
					$where_condition .=  " OR (auctions.duration = '".$dur."')";
				}
			}
		}

		$user = $this->session->userdata('user_id');

        $sql_select = "
        	SELECT
				auctions.id,asset.ass_id,asset.ass_name,asset.ass_description,
				asset.position,asset.ass_ref,asset.ass_proportional_costs,
				asset.ass_lead_time,asset.mec_id,asset.ass_position,
				location_type.lot_description,auctions.`starts`,
				auctions.duration as duration_id,auctions.increment,auctions.buy_now,
				auctions.minimum_bid,auctions.`ends`,uploaded_documents.upd_url,
				measurement_unit.meu_description AS lead_time_unit,durations.description as duration
			FROM
				asset
			INNER JOIN auctions ON auctions.ass_id = asset.ass_id
				LEFT JOIN location_type ON location_type.lot_id = asset.lot_id
				LEFT JOIN uploaded_documents ON uploaded_documents.ass_id = asset.ass_id
				LEFT JOIN measurement_unit ON measurement_unit.meu_id = asset.meu_id_lead_time
				INNER JOIN durations ON auctions.duration = durations.id
			WHERE
				auctions.`status` = 0
				$where_condition";

        $select_query = $this->db->query($sql_select);

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}

	}

	function getAsset(){

	   if (isset($_REQUEST['ass_id'])){
		   $this->db->where('asset.ass_id', $this->input->get_post('ass_id'));
	   }

	   if (isset($_REQUEST['auction_id'])){
		   $this->db->where('au.id', $this->input->get_post('auction_id'));
	   }

	   $this->db->select('asset.*,au.*,up.*,rc.*,mu.meu_unit,mu.meu_unit as rate_unit,mu3.meu_unit as h_unit,mu2.meu_unit as w_unit,mu4.meu_unit as lead_time_unit');
	   $this->db->from('asset');
	   $select_query =  $this->db->join('rate_card rc', 'asset.ass_id = rc.ass_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu', 'mu.meu_id = rc.meu_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu2', 'mu2.meu_id = asset.ass_width_meu_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu3', 'mu3.meu_id = asset.ass_height_meu_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu4', 'mu4.meu_id = asset.meu_id_lead_time', 'left outer');
	   $select_query =  $this->db->join('auctions au', 'au.ass_id = asset.ass_id', 'left outer');
	   $select_query =  $this->db->join('uploaded_documents up', 'up.ass_id = asset.ass_id', 'left');

		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { 
			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			return $data;
		} else {
			return false;
		}
	}

	function getAssetList($asset_id_list){

	   if (isset($asset_id_list) && $asset_id_list != ''){
	   	   $where_asset_id_in_list = " asset.ass_id IN ($asset_id_list)";
		   $this->db->where($where_asset_id_in_list, NULL, false);
	   }
	   /*
	   if (isset($_REQUEST['auction_id'])){
		   $this->db->where('au.id', $this->input->get_post('auction_id'));
	   }
	   */
	   $this->db->select('asset.*,au.*,rc.*,mu.meu_unit,mu.meu_unit as rate_unit,mu3.meu_unit as h_unit,
	   	mu2.meu_unit as w_unit,mu4.meu_unit as lead_time_unit');
	   $this->db->from('asset');
	   $select_query =  $this->db->join('rate_card rc', 'asset.ass_id = rc.ass_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu', 'mu.meu_id = rc.meu_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu2', 'mu2.meu_id = asset.ass_width_meu_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu3', 'mu3.meu_id = asset.ass_height_meu_id', 'left outer');
	   $select_query =  $this->db->join('measurement_unit mu4', 'mu4.meu_id = asset.meu_id_lead_time', 'left outer');
	   $select_query =  $this->db->join('auctions au', 'au.ass_id = asset.ass_id', 'left outer');
	   //$select_query =  $this->db->join('uploaded_documents up', 'up.ass_id = asset.ass_id', 'left');

	   $this->db->distinct();
	   $select_query = $this->db->get();

		if ($select_query->num_rows > 0) { 
			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			return $data;
		} else {
			return false;
		}
	}

	/*
	Returns All of the asset's uploaded images records
	*/
	function getAssetImages($asset_id){

		if (isset($asset_id) && $asset_id > 0){
			$this->db->where('uploaded_documents.ass_id', $asset_id);
		}
		    
		$this->db->select('*');
		$this->db->from('uploaded_documents');		

		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();
			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;
		} else {
			return false;
		}
	}

	/*
	Returns All of the asset's rate_card records
	*/
	function getAssetRateCards($asset_id){

		if (isset($asset_id) && $asset_id > 0){
			$this->db->where('rate_card.ass_id', $asset_id);
		}
		    
		$this->db->select('*');
		$this->db->from('rate_card');		

		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();
			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;
		} else {
			return false;
		}
	}

	/*
	Returns All of the asset's rate_card records
	*/
	function getAssetLeadTime($asset_id){

		//if ($asset_id > 0){
		$this->db->where('asset.ass_id', $asset_id);
		//}
		    
		$this->db->select('asset.ass_id, ass_lead_time, 
			meu_id_lead_time, meu_unit, meu_description,
			meu_unit_php5_date');
		$this->db->from('asset');	
		$this->db->join('measurement_unit','measurement_unit.meu_id=asset.meu_id_lead_time');		

		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { 
			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;
		} else {
			return false;
		}
	}

	function jsonGetAssetDetails($ass_id=0){
		//Also return mall_id (if any)

		$jsonAsset = array();
		$a = $_GET['c']; 
		$p = $_GET['p'];
		$current_bid = 0;
		$buy_now = 0;
		$yobid = 0;
		$ast_id = 0;
		$minimum_bid = 0;
		$increment = 0;
		$current_bid = 0;
		$auction_id = 0;
		$ass_type = '';


		if (isset($_GET['c'])){
	        $ass_id =  $_GET['c'];
	        $this->db->where('asset.ass_id', $ass_id);
	        $this->db->select('uploaded_documents.upd_url, auctions.closed,auctions.sold,auctions.status, auctions.minimum_bid, auctions.current_bid, asset.position, asset.latitude, asset.longitude,asset.mec_id, asset.ass_name, asset.ass_ref, asset.ass_street_address, 
	        					asset.ass_city, auctions.id, media_category.mec_description, auctions.buy_now, auctions.increment, buy_now, asset.ass_description, 
								asset.ass_status, asset.ass_status_detail, 	        					
	        					mall.mall_id');
			$this->db->from('asset');
	        $this->db->join('auctions','asset.ass_id = auctions.ass_id','left outer');
	        $this->db->join('media_category','asset.mec_id = media_category.mec_id', 'left outer');
	        $this->db->join('mall','asset.ass_id = mall.ass_id', 'left outer');
	        $this->db->join('uploaded_documents','asset.ass_id = uploaded_documents.ass_id', 'left');
	        $select_query = $this->db->get();
		       
			if ($select_query->num_rows > 0){
				foreach ($select_query->result() as $rows){
					$current_bid= $rows->current_bid;
	                $ass_name = $rows->ass_name;
	                $ass_type = $rows->mec_description;
	                $buy_now = $rows->buy_now;
	                $increment = $rows->increment;
	                $auction_id = $rows->id;
	                $status = $rows->status;
	                $status_details = $rows->ass_status_detail;
	                $upd_url = $rows->upd_url;

					$jsonAsset['ass_id'] = $ass_id;
					$jsonAsset['ass_name'] = $ass_name;
					$jsonAsset['ass_type'] = ucwords($ass_type);	
					$jsonAsset['ast_id'] = $current_bid;

	                $jsonAsset['ass_ref'] = $rows->ass_ref;
	                $jsonAsset['ass_description'] = $rows->ass_description;
	                $jsonAsset['ass_street_address'] = $rows->ass_street_address;
	                $jsonAsset['ass_city'] = $rows->ass_city;
	                $jsonAsset['position'] = $rows->position;
	                $jsonAsset['status'] = $status;
	                $jsonAsset['ass_status'] = $status;
	                $jsonAsset['ass_status_detail'] = $status_details;
	                $jsonAsset['asset_image'] = $upd_url;
	              
	                if ($current_bid>0){
	                $minimum_bid = $current_bid + $increment;}else{
	                  $minimum_bid =   $rows->minimum_bid;
	                }
				}
		        
		    }
		    if (isset($auction_id) && $auction_id <> '0' ){
		        $this->db->where('auction', $auction_id);
		        $this->db->where('bidder', $this->session->userdata('user_id'));
		        $select_query = $this->db->get('bids');
				if ($select_query->num_rows > 0){
					foreach ($select_query->result() as $rows){
						$yobid=$rows->bid;
					}
		        }
		    }

		}


		$jsonAsset['current_bid'] = $current_bid;
		$jsonAsset['yobid'] = $yobid;
		$jsonAsset['minimum_bid'] = $minimum_bid;
		$jsonAsset['buy_now'] = $buy_now;
		$jsonAsset['increment'] = $increment;
		$jsonAsset['auction_id'] = $auction_id;

		//print_r($jsonAsset)
		return json_encode($jsonAsset);

	}

	/**** BEGIN for loadasset app compatibility  ****/
    
    function getMediaCat(){
	    $query = $this->db->get('media_category');
	    if($query->num_rows > 0){
	        foreach ($query->result() as $row){
	            $data[] = $row;
	        }
	        return $data;
	    }
	    else {
	        return false;
	    }
	}

    function getAssetByuserId($user_id, $is_mall=0){
    	//Also return mall_id (if any)
        $query = $this->db->query("
        	SELECT asset.*, mall.mall_id FROM asset  
        	LEFT OUTER JOIN mall on mall.ass_id = asset.ass_id 
        	WHERE ass_name IS NOT NULL 
        		AND ass_description IS NOT NULL 
        		AND use_id = '$user_id'
        		AND ass_is_mall='$is_mall'");
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        }
        else {
            return false;
        }
    }	

    function getMallsByuserId($user_id){
    	//Also return mall_id (if any)
        $query = $this->db->query("
        	SELECT asset.*, mall.mall_id FROM mall  
        	LEFT JOIN asset on mall.ass_id = asset.ass_id 
        	WHERE mall.user_id = '$user_id'");
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        }
        else {
            return false;
        }
    }

    function getAssetDetails1_loadasset() { //was just getAssetDetails1 but renamed to avoid conflict with already existing method in asset

        if (isset($_REQUEST['aset'])){
            $this->db->where('ast_id', $_REQUEST['aset']);
        }
        
        $select_query = $this->db->get('asset');

        if ($select_query->num_rows > 0){

            foreach ($select_query->result() as $row){
                $data[]=$row;
            }
            return $data;

        } else{
            return false;
        }

    } 

    function getAssetByAssetId($ass_id){
        $query = $this->db->get_where('asset', array('ass_id' => $ass_id));
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        }
        else {
            return false;
        }
    }

    /*
	Get All user's assets. If is_mall is not specified (-1) then do not filter by that field
    */
    function getAllAsset($user_id=0, $is_mall=-1){

    	if($user_id <= 0){
    		$user_id = $this->session->userdata('user_id');
    	}
    	if($is_mall == 0 || $is_mall == 1){
			$this->db->where('ass_is_mall', $is_mall);    		
    	}

    	$this->db->where('use_id', $user_id);
        $query = $this->db->get('asset');
        //echo $this->db->last_query(); 
        if($query->num_rows() > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        } else {
            $query->free_result();
            return false;
        }
    }

   	function getMeasurements(){
        $query = $this->db->get('measurement_unit');
        
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        }
        else {
            $query->free_result();
            return false;
        }
    }    

    //function to get asset details by ass_id
    function assetAjaxProReq($ass_id) {
            
		//$this->db->select('ass_production_requirements');
		$this->db->where('ass_id', $ass_id);
		$select_query = $this->db->get('asset');

		if ($select_query->num_rows > 0){//echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
			return $data;

		} else{
			return false;
		}

	}   

    //function to insert photo details to the database
    
    function insertFileNoAssId($fpath, $fsize,$fname,$ftype,$upt_id){
   	
   		echo " B4 UPLOAD: $fpath1 $fsize $fname $ftype $f_type ";

        $data = array(
            'upd_url' => $fpath,
            'upd_filesize' => $fsize,
            'upd_file_name' => $fname,
            'upd_file_type' => $ftype,
            'ass_id' => $this->input->post('ass_id'),
            'upt_id' => $upt_id
        );
        
        $this->db->insert('uploaded_documents', $data);

        echo "AFTER: UPLOAD ";
    }
	
    //function to upload file type to the database
    function upload_file_type($ftype){
        
        $this->db->insert('uploaded_file_type', array('upt_description' => $ftype));
        return $this->db->insert_id();
        
    }
    
    //function to get the last inserted file type
    function get_last_inserted_ftype_id(){
        $query = $this->db->query("SELECT upt_id FROM uploaded_file_type ORDER BY upt_id DESC LIMIT 1");
        
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data = $row->upt_id;
            }
            return $data;
        } else {
            $query->free_result();
            return false;
        }
    }

    function updateAsset($ass_id){
            
            $position = $this->get_position_by_id($ass_id);
            
            $address = $this->Get_Address_From_Google_Maps($position);
                        
            $data = array(      
			   'ass_name' => $this->input->post('ass_ref'),
			   'ass_description' => $this->input->post('asset_desc'),
			   'emp_id_maintenance' => $this->input->post('employee_maintenance'),
			   'ass_acquisition_cost' => $this->input->post('acq_cost'),
			   'ass_book_value' => $this->input->post('book_value'),
			   'ass_printable_height' => $this->input->post('pri_height'),
			   'ass_proportional_costs' => $this->input->post('proportional_costs'),
			   'ass_printable_width' => $this->input->post('pri_width'),
			   'ass_production_cost_BCY' => $this->input->post('pro_cost_bcy'),
			   'ass_production_price_SCY' => $this->input->post('pro_cost_scy'),
			   'mat_id' => $this->input->post('mat_type'),
			   'lot_id' => $this->input->post('loc_type'),
	           'mec_id' => $this->input->post('mec_id'),
			   'ass_lead_time' => $this->input->post('lead_time'),
	           'ass_position' => $this->input->post('position_1'),
			   'ass_production_requirements' => $this->input->post('pro_requirements'),
	           'ass_height_meu_id' => $this->input->post('pri_length_unit'),
	           'ass_width_meu_id' => $this->input->post('pri_width_unit'),
	           'ass_date' => date('Y-m-d H:i:s a'), 
			   'use_id' => $this->session->userdata('user_id'),
	           'ass_street_address' => $address['street'],
	           'ass_city' => $address['city'],
	           'ass_province' => $address['province'],
	           'ass_country' => $address['country'],
				//new fields
			   'ass_duration' => $this->input->post('ass_duration'),
	           'ass_duration_type' => $this->input->post('ass_duration_type'),
			   'ass_population_group' => $this->input->post('ass_population_group'),
	           'ass_monthly_volumes' => $this->input->post('ass_monthly_volumes'),
	           'ass_daily_volumes' => $this->input->post('ass_daily_volumes')	                   
	            );
            
            $this->db->where('ass_id', $ass_id);
            $this->db->update('asset', $data);
            
    }

    function activate($ass_id, $data){
    		//update the asset table with active/inactive status details
            $this->db->where('ass_id', $ass_id);
            $this->db->update('asset', $data); 
            return $ass_id;           
    }

    function get_position_by_id($ass_id){
        
        $this->db->select('position');
        $query = $this->db->get_where('asset', array('ass_id' => $ass_id));
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data = $row;
            }
            return $data;
        }
        else {
            $query->free_result();
            return false;
        }
        
    }
    
    function Get_Address_From_Google_Maps($position) {
            
            //print_r($position);
            foreach ($position as $post){
                $post;
            }
          
            $url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$post&sensor=false";

            // Make the HTTP request
            $data = file_get_contents($url);
            // Parse the json response
            $jsondata = json_decode($data,true);

            // If the json data is invalid, return empty array
            if (!$this->check_status($jsondata))	return array();

            $address = array(
                'country' => $this->google_getCountry($jsondata),
                'province' => $this->google_getProvince($jsondata),
                'city' => $this->google_getCity($jsondata),
                'street' => $this->google_getStreet($jsondata),
                'postal_code' => $this->google_getPostalCode($jsondata),
                'country_code' => $this->google_getCountryCode($jsondata),
                'formatted_address' => $this->google_getAddress($jsondata),
            );

            return $address;
    }

    /* 
    * Check if the json data from Google Geo is valid 
    */

    function check_status($jsondata) {
            if ($jsondata["status"] == "OK") return true;
            return false;
    }

    /*
    * Given Google Geocode json, return the value in the specified element of the array
    */

    function google_getCountry($jsondata) {
            return $this->Find_Long_Name_Given_Type("country", $jsondata["results"][0]["address_components"]);
    }
    function google_getProvince($jsondata) {
            return $this->Find_Long_Name_Given_Type("administrative_area_level_1", $jsondata["results"][0]["address_components"], true);
    }
    function google_getCity($jsondata) {
            return $this->Find_Long_Name_Given_Type("locality", $jsondata["results"][0]["address_components"]);
    }
    function google_getStreet($jsondata) {
            return $this->Find_Long_Name_Given_Type("street_number", $jsondata["results"][0]["address_components"]) . ' ' . $this->Find_Long_Name_Given_Type("route", $jsondata["results"][0]["address_components"]);
    }
    function google_getPostalCode($jsondata) {
            return $this->Find_Long_Name_Given_Type("postal_code", $jsondata["results"][0]["address_components"]);
    }
    function google_getCountryCode($jsondata) {
            return $this->Find_Long_Name_Given_Type("country", $jsondata["results"][0]["address_components"], true);
    }
    function google_getAddress($jsondata) {
            return $jsondata["results"][0]["formatted_address"];
    }

    /*
    * Searching in Google Geo json, return the long name given the type. 
    * (If short_name is true, return short name)
    */

    function Find_Long_Name_Given_Type($type, $array, $short_name = false) {
            foreach( $array as $value) {
                    if (in_array($type, $value["types"])) {
                            if ($short_name)	
                                    return $value["short_name"];
                            return $value["long_name"];
                    }
            }
    }
                                	         
    /**** END for loadasset app compatibility  ****/

    /* 
    Indoor Assets Functions 
    */
	public function getMallAssets() {
		if (isset($_REQUEST['aset'])) {
			$this->db->where('asset.ast_id', $_REQUEST['aset']);
		}


		$user = $this->session->userdata('use_id');
		//$this->session->userdata('use_id');
		$this->db->where('status', '0');
		$this->db->where('auctions.use_id', $user);
		$this->db->where('asset.ass_is_mall', 1);
		$this->db->select('auctions.id, asset.loc_id,asset.position,asset.ass_name,asset.ass_id,media_category.mec_description, asset.ass_description, images.url,asset.ass_address');
		$this->db->from('asset');
		$this->db->join('images', 'asset.img_id = images.img_id', 'left outer');
		$this->db->join('auctions', 'auctions.ass_id = asset.ass_id','left outer');
		$this->db->join('media_category', 'asset.mec_id = media_category.mec_id');

		$select_query = $this->db->get();

		if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row) {
				$data[] = $row;
			}
			//print_r($data); exit();
			return $data;

		} else {
			return false;
		}
	}    

	function test_upload(){
		echo "<br>this is a test upload";
	}
	//function to record a successful insert
	function insertFile($fpath1,$fsize, $fname, $ftype, $fac_id, $ass_id){

        /*$sql_insert = "INSERT INTO `uploaded_documents` 
        	(`upd_url`, `upd_filesize`, `upd_file_name`, `upd_file_type`, `upt_id`, `ass_id`, `rfp_id`, `fac_id`) 
        	VALUES 
        	('path', '1', 'name', 'image/jpeg', '0', '0', '0', '0')";*/
        echo "BEFORE: Upload";
        $img_data = array(
            'upd_url' => $fpath1,
            'upd_filesize' => $fsize,
            'upd_file_name' => $fname,
            'upd_file_type' => $ftype,
            'ass_id' => $ass_id,
            'upt_id' => 0,
            'fac_id' => 0,
            'rfp_id' => 0
        );
        
        $this->db->insert('uploaded_documents', $img_data);  
        echo "AFTER: Upload";      	
        //return $sql_insert;
        //$this->db->query($sql_insert);
        //return $this->db->last_query();
	}
    
    //update the asset detais
	function updateAssetData(){
       //echo "babanguweeee mapindu";
       exit;
       
	}

	//insert new asset details
	function insertNewAsset($rate_array){
		$this->db->insert('rate_card', $rate_array);
	}

	//
	// Get Assets and Workflow Timelines By User ID
	// Modification of getAssetByuserId
	//
    function getOutdoorAssetTimelinesByuserId($user_id, $is_mall=0){
    	
    	//Also return mall_id (if any)
    	$query = $this->db->query("
    		SELECT DISTINCT
				campaign.cam_title,
				proposal_status.prs_description AS campaign_status,
				rfp_for_submission_assets_selected.accepted_by_operator,
				rfp_for_submission_assets_selected.accepted_by_media_owner,
				rfp_for_submission_assets_selected.from_date,
				rfp_for_submission_assets_selected.to_date,
				rfp_for_submission_assets_selected.completed,
				rfp_for_submission_assets_selected.asset_id,
				asset.*, mall.mall_id
			FROM
				rfp_for_submission_assets_selected
			INNER JOIN rfp_for_submission ON rfp_for_submission.rfp_for_submission_id = rfp_for_submission_assets_selected.rfp_for_submission_id
			INNER JOIN campaign ON campaign.cam_id = rfp_for_submission.campaign_id
			INNER JOIN proposal_status ON proposal_status.pro_status_id = campaign.pro_status_id
			RIGHT JOIN asset ON asset.ass_id = asset_id
			LEFT OUTER JOIN mall on mall.ass_id = asset.ass_id 
			WHERE asset.use_id = '$user_id'
				AND ass_name IS NOT NULL 
				AND ass_description IS NOT NULL 
				AND ass_is_mall <> 1
			ORDER BY cam_title, campaign_status, asset_id
    		");
    	
        if($query->num_rows > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        }
        else {
            return false;
        }
    }

    // Asset Filtering
    /**
	Indoor - 1
	mec_id: 1,10,15,16,24,25

	Outdoor - 2
	mec_id: 1,2,3,4,5,6,7,8,9,13,14,15,16,17,18,20,21

	Rolling Media - 3
	mec_id: 3,5,7,9,10,13,15,17,20,22,23,24

	Print - 4
	mec_id: 11,12

	Other - 5
	mec_id: 19,22,23
    */
    // Get All Assets for a given category
    // Default to 2 = Outdoor Assets
    function getAllCategoryAsset($user_id=0, $asset_category=2){

    	if($user_id <= 0){
    		$user_id = $this->session->userdata('user_id');
    	}

    	switch($asset_category){
    		case 1: $array_mec_ids = array(1,10,15,16,24,25); break;
    		case 2: $array_mec_ids = array(1,2,3,4,5,6,7,8,9,13,14,15,16,17,18,20,21); break;
    		case 3: $array_mec_ids = array(3,5,7,9,10,13,15,17,20,22,23,24); break;
    		case 4: $array_mec_ids = array(11,12); break;
    		case 5: $array_mec_ids = array(19,22,23); break;
    		default: $array_mec_ids = array(1,2,3,4,5,6,7,8,9,13,14,15,16,17,18,20,21);     		
    	}
    	
    	$this->db->where_in('mec_id', $array_mec_ids);

    	$this->db->where('use_id', $user_id);
        $query = $this->db->get('asset');
        //echo $this->db->last_query(); 
        if($query->num_rows() > 0){
            foreach ($query->result() as $row){
                $data[] = $row;
            }
            return $data;
        } else {
            $query->free_result();
            return false;
        }
    }    

}
/* end of assets.php */