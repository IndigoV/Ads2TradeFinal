<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class user extends CI_Model {

 	var $username;
	var $password;
        
        
        function getLoginDetails () {

		
		$this->db->where('use_username', $this->input->post('username'));
		$this->db->where('use_password', $this->input->post('password'));
		$this->db->where('use_status', 1);
		$select_query = $this->db->get('user');
			
		if ($select_query->num_rows > 0){

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
        
        function createAccount(){
            
            $data = array(
                'use_password' => $this->input->post('password'),
                'use_username' => $this->input->post('firstname'),
                'use_status' => 1,
                'ust_id' => $this->input->post('ust'),
                'use_registration_date' => date('Y-m-d H:i:s'),
                'use_first_name' => $this->input->post('firstname'),
                'use_last_name' => $this->input->post('lastname'),
                'use_email' => $this->input->post('email'),
                'use_mobile_number' => $this->input->post('number'),
                'use_company_name' => $this->input->post('comname'),
                'use_street_number' => $this->input->post('strnum'),
                'use_suburb' => $this->input->post('suburb'),
                'use_city' => $this->input->post('city'),
                'use_country' => $this->input->post('country'),
                'use_terms_conditions' => $this->input->post('terms'),
                'use_watchlist_mail' => $this->input->post('watchlistemail'),
                'use_workflow_mail' => $this->input->post('flowmail'),
                'use_rfp_mail' => $this->input->post('rfpmail'),
                'use_rfp_sms' => $this->input->post('rfpsms'),
                'use_flow_sms' => $this->input->post('flowsms'),
                'use_watchlist_sms' => $this->input->post('watchlistsms'),
                'use_auctionlist_sms' => $this->input->post('auctionsms'),
                'use_auction_bids_mail' => $this->input->post('auctionemail'),
                'use_workflow_mail' => $this->input->post('flowmail'),
                'use_notifications_mail' => $this->input->post('notifmail'),
                'use_notif_sms' => $this->input->post('notifsms')
                //'use_current_status' => $this->input->post('status'),
                //'use_deposit' => $this->input->post('deposit'),
                //'use_auction_limit' => $this->input->post('limit'),
                //'use_increase_limit' => $this->input->post('increase')
            );
            
            $this->db->insert('user', $data);
            
        }
        
        //function to select all data from user type
        function getUserType(){
            $query = $this->db->get('user_type', 2);
            if($query){
                foreach ($query->result() as $row){
                    $data[] = $row;
                }
                return $data;
            }
            else{
                $query->free_result();
                return false;
            }
        }
        
        // function to get user data by id
        function getUserById($use_id){
            $query = $this->db->get_where('user', array('use_id' => $use_id));
            if($query){
                foreach ($query->result() as $row){
                    $data[] = $row;
                }
                return $data;
            }
            else{
                $query->free_result();
                return false;
            }
        }
        
        function updateUser(){
            
            $user_id = $this->input->post('use_id');
            
            $data = array(
                'use_password' => md5($this->input->post('password')),
                //'use_username' => $this->input->post('firstname')
                'use_status' => 1,
                'ust_id' => $this->input->post('ust'),
                'use_date_updated' => date('Y-m-d H:i:s'),
                'use_first_name' => $this->input->post('firstname'),
                'use_last_name' => $this->input->post('lastname'),
                'use_email' => $this->input->post('email'),
                'use_mobile_number' => $this->input->post('number'),
                'use_company_name' => $this->input->post('comname'),
                'use_street_number' => $this->input->post('strnumber'),
                'use_suburb' => $this->input->post('suburb'),
                'use_city' => $this->input->post('city'),
                'use_country' => $this->input->post('country'),
                'use_terms_conditions' => $this->input->post('terms'),
                'use_watchlist_mail' => $this->input->post('watchlistemail'),
                'use_workflow_mail' => $this->input->post('flowmail'),
                'use_rfp_mail' => $this->input->post('rfpmail'),
                'use_rfp_sms' => $this->input->post('rfpsms'),
                'use_flow_sms' => $this->input->post('flowsms'),
                'use_watchlist_sms' => $this->input->post('watchlistsms'),
                'use_auctionlist_sms' => $this->input->post('auctionsms'),
                'use_auction_bids_mail' => $this->input->post('auctionemail'),
                'use_workflow_mail' => $this->input->post('flowmail'),
                'use_notifications_mail' => $this->input->post('notifmail'),
                'use_notif_sms' => $this->input->post('notifsms'),
                //'use_current_status' => $this->input->post('status'),
                //'use_deposit' => $this->input->post('deposit'),
                //'use_auction_limit' => $this->input->post('limit'),
                'use_increase_limit' => $this->input->post('increase')
            );
            
            $this->db->where('use_id', $user_id);
            $this->db->update('user', $data);
        }
        
        function getEmployee(){
            $query = $this->db->get('employee');
            if($query->num_rows > 0){
                foreach ($query->result() as $row){
                    $data[] = $row;
                }
                return $data;
            }
            else{
                
                $query->free_result();
                return false;
            }
        }
            
    

}