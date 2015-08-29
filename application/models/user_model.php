<?php

//following class accesses the lms_user tuple
class User_model extends CI_Model {

    public function get_users($conditions = null) {

        $this->db->select("u.*, ut.ust_description, c.cou_name, us.user_statu_name");
        $this->db->from("user u");
        $this->db->join("user_type ut", "ut.ust_id=u.ust_id", "left");
        $this->db->join("country c", "u.use_country=c.cou_id", "left");
        $this->db->join("user_status us", "u.user_status=us.user_status_id", "left");
        
        $query = $this->db->get();
        
        return $query->result();
    }
    
    public function getFilterUsers($conditions = null) {

        $this->db->select("u.*, ut.ust_description, c.cou_name");
        $this->db->from("user u");
        $this->db->join("user_type ut", "ut.ust_id=u.ust_id", "left");
        $this->db->join("country c", "u.use_country=c.cou_id", "left");
        
        
        if( isset($conditions['status']) ) {
            $this->db->where('u.use_status', $conditions['status']);
        }
        if( isset($conditions['user_type']) ) {
            $this->db->where('u.ust_id', $conditions['user_type']);
        }

        //Now we handle the filters
        if($this->input->get_post('user_type')) {
            $this->db->where('u.ust_id', $this->input->get_post('user_type'));
        }
        if($this->input->get_post('status')) {
            $this->db->where('u.use_status', $this->input->get_post('status'));
        }
        if($this->input->get_post('country')) {
            $this->db->where('u.use_country', $this->input->get_post('country'));
        }
        if($this->input->get_post('city')) {
            $this->db->where('u.use_city', $this->input->get_post('city'));
        } 
        if($this->input->get_post('user_name')) {
            $this->db->like('u.use_username', $this->input->get_post('user_name'), 'after');
        }
        if($this->input->get_post('name')) {
            $this->db->like('u.use_first_name', $this->input->get_post('name'), 'after');
        }
        
        
        
        $query = $this->db->get();
        
        return $query->result();
    }
    
    public function saveUser($user = null) {
        
        if( isset($user->use_id) and ($user->use_id != null or !empty($user->use_id)) ) {
            
            $user->use_date_updated = date('Y-m-d h:m:s');
            
            $this->db->where("use_id", $user->use_id);
            $this->db->update("user", $user);
            
        } else { //we are inserting
            $user->use_date_updated = date('Y-m-d h:m:s');
            
            $this->db->insert("user", $user);
        }
    }


    public function get_user($id) {
        return $this->getById($id);
    }
    
    public function getById($id) {
        $this->db->select("u.*");
        $this->db->from("user u");

        //Conditions
        $this->db->where("u.use_id", $id);

        $query = $this->db->get();

        return $query->row();
    }
    
    public function getDetailedById($id) {
        $this->db->select("u.*, ut.ust_description, c.cou_name, us.user_status_name");
        $this->db->from("user u");
        $this->db->join("user_type ut", "ut.ust_id=u.ust_id", "left");
        $this->db->join("country c", "u.use_country=c.cou_id", "left");
        $this->db->join("user_status us", "u.user_status=us.user_status_id", "left");

        //Conditions
        $this->db->where("u.use_id", $id);

        $query = $this->db->get();

        return $query->row();
    }
    
    public function get_status_options() {
        
        $options = array(
            '' => '',
            1 => 'Active',
            2 => 'Suspended',
            3 => 'Blocked'
        );
        
        return $options;
    }

    public function getStatus($status_id) {
        
        $statuses = $this->get_status_options();
        
        if(array_key_exists($status_id, $statuses)) {
            return $statuses[$status_id];
        }
        
        return null;
    }
    
    public function getStatusId($status) {
        
        $id = 0;
        
        switch( strtolower($status) ) {
            
            case 'new':
                $id = -1;
            break;
            case 'active':
                $id = 1;
            break;
            case 'suspended':
                $id = 2;
            break;
            case 'blocked':
                $id = 3;
            break;
        }
        
        return $id;
    }
    
	//
	public function get_allusers($conditions = null) {

        $this->db->select("u.*");
        $this->db->from("user u");
        $query = $this->db->get();
        
        return $query;
    }

    /**** BEGIN for loadasset app compatibility  ****/

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
        } else{
            
            $query->free_result();
            return false;
        }
    }

    /**** END for LoadAsset app compatibility  ****/
}