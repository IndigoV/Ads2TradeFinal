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
			$status = $_POST['status'];
			$invoice_no_description = $_POST['text_filter'];
			
			$date1 = $_POST['date1'];
			$date1_e = date("Y-m-d",strtotime($date1));
			$date2 = $_POST['date2'];
			$date2_e = date("Y-m-d",strtotime($date2));
			$date3 = $_POST['date3'];
			$date3_e = date("Y-m-d",strtotime($date3));
			
			$amount1 = $_POST['amount1'];
			$amount2 = $_POST['amount2'];
			$amount3 = $_POST['amount3'];
			//echo "$date1 -- $date2 -- $date3 -- $amount1 -- $amount2 -- $amount3 -- $invoice_no_description";
			//exit;
			 foreach ($status as $key=>$status_value){
			}
			if ($status_value <> "" && $invoice_no_description == "" && $date1 == ""  && $date2 == "" && $date3 == ""  && $amount1 == "" && $amount2 == "" && $amount3 == "") 
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`status`= '$status_value'
				  ");
			}
			elseif ($status_value == "" && $invoice_no_description <> "" && $date1 == ""  && $date2 == "" && $date3 == ""  && $amount1 == "" && $amount2 == "" && $amount3 == "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`id`= '$invoice_no_description' or i.`description`= '$invoice_no_description'
				  ");
			}
			elseif ($status_value == "" && $invoice_no_description == "" && $date1 <> ""  && $date2 == "" &&  $date3 == ""  && $amount1 == "" && $amount2 == "" && $amount3 == "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`datetime` LIKE '%$date1_e%'
				  ");
			}
			elseif ($status_value == "" && $invoice_no_description == "" && $date1 == ""  && $date2 <> "" &&  $date3 <> ""  && $amount1 == "" && $amount2 == "" && $amount3 == "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`datetime` >= '$date2_e' and i.`datetime` <= '$date3_e'
				  ");
			}
			elseif ($status_value == "" && $invoice_no_description == "" && $date1 == ""  && $date2 == "" &&  $date3 == ""  && $amount1 <> "" && $amount2 == "" && $amount3 == "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`amount` = '$amount1'
				  ");
			}
			elseif ($status_value == "" && $invoice_no_description == "" && $date1 == ""  && $date2 == "" &&  $date3 == ""  && $amount1 == "" && $amount2 <> "" && $amount3 <> "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`amount` >= '$amount2' and i.`amount` <= '$amount3'
				  ");
			}
			elseif ($status_value <> "" && $invoice_no_description <> "" && $date1 <> ""  && $date2 == "" &&  $date3 == ""  && $amount1 <> "" && $amount2 == "" && $amount3 == "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and i.`id`= '$invoice_no_description' 
					  or i.`description`= '$invoice_no_description' and i.`amount` = '$amount1' 
					  and  i.`status`='$status_value' and i.datetime = '$date1_e'
				  ");
			}
			elseif ($status_value <> "" && $invoice_no_description <> "" && $date1 == ""  && $date2 <> "" &&  $date3 <> ""  && $amount1 == "" && $amount2 <> "" && $amount3 <> "")
			{
				$query = $this->db->query("
					SELECT DISTINCT
					  i.id, i.datetime, i.description, 
					  i.amount, i.auction_id, i.campaign_id,
					  i.`status`
					FROM
					  $this->invoices_table i
					WHERE 
					  i.customer_id = '$user_id' and  i.`description`= '$invoice_no_description' or i.`id`= '$invoice_no_description' 
					  and i.`amount` >= '$amount2'  and i.`amount` <= '$amount3' 
					  and  i.`status`='$status_value' and i.datetime >= '$date2_e' and i.datetime <= '$date3_e'
				  ");
			}
			else
			{
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
			}
	        foreach ($query->result() as $row){     
	            $data[]=$row;
	        }  
	        return $data;   
	    }  	  

}