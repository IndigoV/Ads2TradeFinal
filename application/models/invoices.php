<?php

class invoices extends CI_Model{
	
        //11.12.2014 - for use with new functions
 	    protected $auctions_table = "auctions";
        protected $assets_table   = "asset";
        protected $invoices_table = "invoice";
        protected $campaign_table = ""; //TBA

        public function __construct(){
          parent::__construct();
          //Load any other models needed here
        }

	    /*
	    Get All user's current auctions, latest auction first
	    */
	    function getAll($user_id=0){
	        $data = array();
	        if($user_id <= 0){
	          $user_id = $this->session->userdata('user_id');
	        }

	        $query = $this->db->query("
	            SELECT DISTINCT
	              i.id, i.datetime, i.description, 
	              i.amount, i.auction_id, i.campaign_id,
	              i.`status`
	            FROM
	              $this->invoices_table i
	            WHERE 
	              i.customer_id = '$user_id'
	          ");
	        foreach ($query->result() as $row){     
	            $data[]=$row;
	        }  
	        return $data;   
	    }  	  

}