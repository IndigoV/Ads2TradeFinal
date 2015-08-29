<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class assssssetsi1 extends CI_Model {

 	
        function addAsset () {
            
            
            $data = array(
                   
                    'ass_name' => $this->input->post('title'),
                   
                    'ass_description' => $this->input->post('desc'),
                
                    'position' => $this->input->post('position'),
		   
                    'mec_id' => $this->input->post('mec_id'),
                    'ass_date' => date('Y-m-d H:i:s a'),
		    
                    'use_id' => $this->session->userdata('user_id')

		   );
             
             
             $this->db->insert('asset', $data); 

	}  
        
        function lastAssetPositionByUserId($user_id){
            
            $query = $this->db->query("SELECT position FROM asset WHERE use_id = $user_id ORDER BY ass_id DESC LIMIT 1");
            if($query->num_rows > 0){
                foreach ($query->result() as $row){
                    $data = $row;
                }
                return $data;
            }
            else{
                return false;
            }
            
        }
        
        function lastMedCategoryByUserId($user_id){
            
             $query = $this->db->query("SELECT mec_id FROM asset WHERE use_id = $user_id ORDER BY ass_id DESC LIMIT 1");
            if($query->num_rows > 0){
                foreach ($query->result() as $row){
                    $data = $row;
                }
                return $data;
            }
            else{
                return false;
            }
            
        }
        
        
        function addFinalAsset($position,$mec_id) {
            foreach ($position as $position1):
                
            foreach ($mec_id as $mec_id1):    
            $data = array(
                
                   'ast_id' => $this->input->post('med_type'),
		   'position' => $position1,
		   'emp_id_maintenance' => $this->input->post('employee_maintenance'),
		   //'ass_disposed_of' => $this->input->post('ass_disposed_of'),
		   'ass_acquisition_cost' => $this->input->post('acq_cost'),
		   'ass_book_value' => $this->input->post('book_value'),
		   'ass_printable_height' => $this->input->post('pri_height'),
		   'ass_proportional_costs' => $this->input->post('proportional_costs'),
		   'ass_printable_width' => $this->input->post('pri_width'),
		   'ass_production_cost_BCY' => $this->input->post('pro_cost_bcy'),
		   'ass_production_price_SCY' => $this->input->post('pro_cost_scy'),
		   'mat_id' => $this->input->post('mat_type'),
		   'lot_id' => $this->input->post('loc_type'),
                   'mec_id' => $mec_id1,
		   'met_id' => $this->input->post('ass_proportional_costs'),
		   'ass_lead_time' => $this->input->post('lead_time'),
                   'ass_position' => $this->input->post('position_1'),
                   //'ass_num_faces' => $this->input->post('numfaces'),
		   'ass_production_requirements' => $this->input->post('pro_requirements'),
                   'ass_height_meu_id' => $this->input->post('pri_length_unit'),
                   'ass_width_meu_id' => $this->input->post('pri_width_unit'), 
		   'use_id' => $this->session->userdata('user_id')

		   );
                   endforeach;
                   endforeach;
             
             
             $this->db->insert('asset', $data); 

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
                   'ass_country' => $address['country']

            );
            
            $this->db->where('ass_id', $ass_id);
            $this->db->update('asset', $data);
            
        }
                
        function getAssetDetails () {
                if (isset($_POST['filter'])  ){
                
                $this->db->where('ast_id', $this->input->post('ast_id'));
                
		//$this->db->where('position', $this->input->post('location'));
		//$this->db->where('use_status', 1);
       
                }
                
		$select_query = $this->db->get('asset');
			
		if ($select_query->num_rows > 0){//echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
		//print_r($data); exit();
			return $data;

		}
		else{
		return false;
		}

	}  
        
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
        
            
            function getAssetByuserId($user_id){
                $query = $this->db->query("SELECT * FROM asset WHERE ass_name IS NOT NULL AND ass_description IS NOT NULL"
                        . " AND use_id = $user_id");
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
               function getAssetDetail () {
                if (isset($_POST['filter'])){
                
                $this->db->where('ast_id', $this->input->post('ast_id'));
                
		//$this->db->where('position', $this->input->post('location'));
		//$this->db->where('use_status', 1);
       
                }
                $this->db->group_by('ast_id');
                $this->db->select('count(*)as counts,`lot_id`,`ast_id`');
		$select_query = $this->db->get('asset');
			
		if ($select_query->num_rows > 0){//echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
		//print_r($data); exit();
			return $data;

		}
		else{
		return false;
		}
               }
               function getAssetDetails1 () {
                if (isset($_REQUEST['aset'])){
                
                $this->db->where('ast_id', $_REQUEST['aset']);
                
		//$this->db->where('position', $this->input->post('location'));
		//$this->db->where('use_status', 1);
       
                }
                //$this->db->group_by('ast_id');
                //$this->db->select('count(*)as counts,`loc_id`,`ast_id`');
		$select_query = $this->db->get('asset');
			
		if ($select_query->num_rows > 0){//echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
		//print_r($data); exit();
			return $data;

		}
		else{
		return false;
		}

	} 
        
        
        function getAsset () {
                if (isset($_REQUEST['ass_id'])){
                
                $this->db->where('ass_id', $_REQUEST['ass_id']);
                
	       
                }
             
		$select_query = $this->db->get('asset');
			
		if ($select_query->num_rows > 0){//echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

			foreach ($select_query->result() as $row){
				$data[]=$row;
			}
		//print_r($data); exit();
			return $data;

		}
		else{
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
		//print_r($data); exit();
			return $data;

		}
		else{
		return false;
		}

	}
        
        //function to get the last ass_id of asset table
        function getAssId(){
            $query = $this->db->query("SELECT ass_id FROM asset ORDER BY ass_id DESC LIMIT 1");
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


        //function to insert photo details to the database
        function insertFile($fpath, $fsize,$fname,$ftype,$upt_id){
       
            $data = array(
                'upd_url' => $fpath,
                'upd_filesize' => $fsize,
                'upd_file_name' => $fname,
                'upd_file_type' => $ftype,
                'ass_id' => $this->input->post('ass_id'),
                'upt_id' => $upt_id
            );
            $this->db->insert('uploaded_documents', $data);
        }
        
        function getAllAsset(){
            $query = $this->db->get('asset');
            
            if($query->num_rows() > 0){
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
    
        //function to upload file type to the database
        function upload_file_type($ftype){
            
            $this->db->insert('uploaded_file_type', array('upt_description' => $ftype));
            
        }
        
        //function to get the last inserted file type
        function get_last_inserted_ftype_id(){
            $query = $this->db->query("SELECT upt_id FROM uploaded_file_type ORDER BY upt_id DESC LIMIT 1");
            
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

}
