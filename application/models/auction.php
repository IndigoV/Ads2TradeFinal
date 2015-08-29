<?php error_reporting(0);?>
<?php ob_start(); ?>
<?php

//following class accesses the lms_user tuple
class auction extends CI_Model {

        //11.12.2014 - for use with new functions
 	      protected $auctions_table = "auctions";
        protected $assets_table   = "asset";
        protected $invoices_table = "invoice";

        public function __construct()
        {
          parent::__construct();

          $this->load->model('asset'); 

        }

        // Create Auction - Single Item
        // Return the auction id
        function create($auction = null){
          //print_r($auction);
          //exit;
          if(!is_null($auction)){
            //echo "before";
            $this->db->insert($this->auctions_table, $auction);
            //echo $this->db->last_query(); 
            ///echo " after "; 
            return $this->db->insert_id();
          } else {
            return 0;
          }

        }

        //Checks whether asset is in auction or rfp and returns true or false
        function assetReserved($id){
          //check auctions
          if($id>0){
            // Auctions
            $this->db->where('ass_id',$id);
            $this->db->not('status',9);
            $query = $this->db->get('auction');   
            $row =  $query->row(); 
            if(empty($row)) {
              return false;
            } else {
              return true;
            }
          } else {
            return false;
          }
        }

        function create_auction () {
          
          $ass_id = $_POST['ass_id'];
          $user = $this->session->userdata('user_id');
          $title = $_POST['ass_name'];
          $from_date = $_POST['from_date'];
          //      $to_date = $_POST['to_date'];
          $duration = $_POST['duration'];
          $price = $_POST['price'];
          $buy_now = $_POST['buy_now'];
          $increment = $_POST['increment'];

          $this->db->query(
                 "INSERT INTO `auctions` (`ass_id`,`use_id`,`title`,`subtitle`,`starts`,`duration`,`minimum_bid`,`buy_now`,`auction_type`,`increment`) 
                 VALUES ('$ass_id','$user','$title','$title','$from_date','$duration','$price','$buy_now','1','$increment')"
                 );
          //Get the auction id for event logging
          $auct_id = $this->db->insert_id();
          // $this->db->insert('assssssetsi', $data);

          //TODO:Also insert into system events log type 1 event
          $event_object_type = 1; //Auction
          $this->events->log_event($user, $auct_id, date('Y-m-d H:j:s'), "Auction for Asset id:$ass_id created", $event_object_type);

        } 
        
        function approve_auction ($delete=0) {
          $user = $this->session->userdata('user_id');
          //$approve = $this->input->post_get('approve');
          //$decline = $this->input->post_get('decline');
          //$ass_id = $_POST['ass_id'];
          //$ass_id = $this->input->post_get('asst_id');
          $ass_id = isset($_REQUEST['auction_id'])?$_REQUEST['auction_id']:0;
          if (!isset($ass_id)){
             $ass_id = $_REQUEST['auction_id'];
          }

          if (isset($_REQUEST['approve'])) {
           $this->db->query("Update `auctions` set status = '1' where id ='$ass_id'" );
           $action = 'approved';    //for event log
          }

          if (isset($_REQUEST['decline'])) {
           $this->db->query("Update `auctions` set status = '9' where id ='$ass_id'" );
           $action = 'declined';    //for event log
          }

          if (isset($_REQUEST['delete']) && $delete == 1) {
           $this->db->query("Update `auctions` set status = '9' where id ='$ass_id'" );
           $action = 'deleted';    //for event log
          }

          //TODO:Also insert into system events log type 1 event
          $event_object_type = 1; //Auction
          $this->events->log_event($user, $auct_id, date('Y-m-d H:j:s'), "Auction for Asset id:$ass_id $action", $event_object_type);
          // $this->db->insert('assssssetsi', $data); 

        } 

        function add_all_auction () {
         
          $user = $this->session->userdata('user_id');    //for event log
          $this->db->query("Update `auctions` set status = '1' where status='0'" );

          $total = $this->db->affected_rows();            //for event log
          //TODO:Maybe Also insert into system events log type 1 event
          $event_object_type = 1; //Auction
          $this->events->log_event($user, 0, date('Y-m-d H:j:s'), "$total Auctions added by User id:$user", $event_object_type);

        }
        
        function remove_all_auction ($remove_all_auctionS_for_user=0) {
             
           $user = $this->session->userdata('user_id');    //for event log
           $user_type = $this->session->userdata('user_type');

           //if this is not an operator then limit to only that user's assets/auctions
           $where_condition = '';
           if($user_type != 3 || $remove_all_auctionS_for_user == 1){
              $where_condition = "AND auctions.use_id = '$user_id'";
           }

           $this->db->query("Update `auctions` set status = '9' where status='0' $where_condition" );

           $total = $this->db->affected_rows();             //for event log
           //TODO:Maybe Also insert into system events log type 1 event
           $event_object_type = 1; //Auction
           $this->events->log_event($user, 0, date('Y-m-d H:j:s'), "$total Auctions removed by User id:$user", $event_object_type);
           
        } 

        function create_bid() {
          $amount = 0;
          if(isset($_GET) && !empty($_GET)){   //Added empty check coz in CI get wll almost always be present but could be any epmty array
            //Array (  )
              $amount = $_GET['bid'];
              $ass_id = $_GET['ass_id'];
              $id = $_GET['auct_id'];
              $auct_id = $_POST['auct_id'];
              //print_r( $this->input->get() );
          }else{
            //Array ( [auct_id] => 1 [ass_id] => 1 [email] => 5.00 )
              $amount = $_POST['email'];
              $amount = $this->input->post('email'); //TODO: Change this to 'amount' on the auction creation form
              $ass_id = $_POST['ass_id'];
              $id = $_POST['auct_id'];
              $auct_id = $_POST['auct_id'];
              //print_r( $this->input->post() );
          }
          ///$user = 5;// $this->session->userdata('user_id');
          $user_id = $this->session->userdata('user_id'); //echo $user_id;
          
          $this->db->query(
                       "INSERT INTO `bids` (`auction`,`bidder`,`bid`,`bidwhen`,`quantity`,`winner`)
                       VALUES ('$auct_id','$user_id','$amount',now(),'1',0)"
                       );
          //update current bid
          $this->db->query(
                       "Update `auctions` 
                          set current_bid = '$amount',
                          current_bidder='$user_id' 
                        where id = '$id'"
                       );
          //Maybe Also insert into system events log type 2 event
          $event_object_type = 2; //Bid
          $this->events->log_event($user_id, $auct_id, date('Y-m-d H:j:s'), "$amount Bid placed", $event_object_type);

          //echo $user_id;

          //TODO: Maybe notify user who has just been outbid
          $outbid_details_array = $this->auctionLastMaxBidder($auct_id);
          $outbid_user_id = $outbid_details_array[0];
          $outbid_amt     = $outbid_details_array[1];
          $buyer_id       = $user_id;
          $seller_id      = $this->asset->getAssetOwnerId($id);
          $auction_id     = $auct_id;
          $invoice_no     = ''; //N/A
          $invoice_amount = $amount;
          $invoice_description = $this->getAuctionDescription($id);

          //echo $user_id;

          //Send notifications
          $this->events->systemBidNowNotification($outbid_user_id, $outbid_amt, $buyer_id, $seller_id, $auction_id, $invoice_no, $invoice_amount, $invoice_description);

          // Update Asset status fields to unavailbale (non zero)
          // ass_status: 0=available, id of campaign or auction
          // ass_status_detail: 0=available, 1=auction, 2=campaign
          $this->db->query("UPDATE asset SET ass_status = '$auct_id', 
                                              ass_status_detail=1 
                                         WHERE ass_id = '$ass_id' LIMIT 1");

        }
        
        
        function buy_now() {

          $amount = $_REQUEST['buy_now']; 
          $ass_id = $_REQUEST['ass_id'];
          $id = $_REQUEST['auct_id'];
          $user = $this->session->userdata('user_id');

          $id = 1;

          //echo " *** inside buy now *** "; exit;
          //echo 'to payment gateway';exit;
          //echo ($asst_id < 0); exit;

          //create invoice here if not already created
          if($this->auctionInvoiceNotAlreadyExists($id, $user)){

              //Invoice does not already exist for this auction and user 
              $invoice = array();
              $invoice['asset_id']    = $this->getAuctionAssetId($id);
              $invoice['owner_id']    = $this->asset->getAssetOwnerId($id);
              //No agent_id/operator ( only applies to campaigns ??)          
              $invoice['auction_id']  = $id;
              $invoice['description'] = $this->getAuctionDescription($id);
              $invoice['amount']      = ($amount>0)?$amount:$this->getAssetBuyNowPrice($id);
              $invoice['customer_id'] = $user;

              $this->db->insert($this->invoices_table, $invoice);
              $invoice_no = $this->db->insert_id();

              //Maybe Also insert into system events log type 1 event
              $event_object_type = 7; //Invoice
              $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "New invoice:$invoice_no created for {$invoice['amount']}", $event_object_type);

              //Maybe Also insert into system events log type 1 event
              $event_object_type = 1; //Auction
              $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "Asset id:$ass_id sold for {$invoice['amount']}", $event_object_type);

              //Send Notificatication messages
              $buyer_id = $user;
              $seller_id = $invoice['owner_id'];
              $auction_id = $invoice['auction_id'];
              $invoice_amount=$invoice['amount'];
              $invoice_description = $invoice['description'];

              $this->events->systemBuyNowNotification($buyer_id, $seller_id, $auction_id, $invoice_no, $invoice_amount, $invoice_description);

              // Update Asset status fields to unavailbale (non zero)
              // ass_status: 0=available, id of campaign or auction
              // ass_status_detail: 0=available, 1=auction, 2=campaign
              $this->db->query("UPDATE asset SET ass_status = '$auction_id', 
                                                  ass_status_detail=1 
                                             WHERE ass_id = '{$invoice['asset_id']}' LIMIT 1");
              //update auction status to status=2(sold) closed=1 and sold=y
              $this->db->query("UPDATE auctions SET sold = 'y', 
                                    closed=1, `status`=2
                               WHERE id = '$id' LIMIT 1");              


          } else {

              //Invoice already exists for this auction for this user
              //Maybe Also insert into system events log type 1 event
              $event_object_type = 7; //Invoice
              $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "Invoice already exists for this auction/advertiser", $event_object_type);
              /*
              //Send Notificatication messages
              $invoice_no = 3000096;
              $buyer_id = 5;
              $seller_id = 5;
              $auction_id = 3;
              $invoice_amount=45000;
              $invoice_description = 'AUction # 665 / Sandton Drive Asset 456789';

              $this->events->systemBuyNowNotification($buyer_id, $seller_id, $auction_id, $invoice_no, $invoice_amount, $invoice_description);
              */

          }
        
        }

        // ***************** To be scheduled to run every x minutes ************************
        //1) End auctions when we have reached the end date/time
        //2) If Auction id is supplied then only end that particular auction
        //---------------------------------------------------------------------
        //  1) Set status to closed
        //  2) Generate invoice for winning bidder
        //  3) Send notifications to winning bidder, media owner
        // *********************************************************************************
        function end_auction($auction_id=0) {

          //if auction id <> 0 then get all open auctions that have passed their end date/time
          // else just get the particular auction
          $amount = $_REQUEST['buy_now']; 
          $ass_id = $_REQUEST['ass_id'];
          $id = $_REQUEST['auct_id'];
          $user = $this->session->userdata('user_id');

          $id = 1;

          //echo " *** inside buy now *** "; exit;
          //echo 'to payment gateway';exit;
          //echo ($asst_id < 0); exit;

          //create invoice here if not already created
          if($this->auctionInvoiceNotAlreadyExists($id, $user)){

              //Invoice does not already exist for this auction and user 
              $invoice = array();
              $invoice['asset_id']    = $this->getAuctionAssetId($id);
              $invoice['owner_id']    = $this->asset->getAssetOwnerId($id);
              //No agent_id/operator ( only applies to campaigns ??)          
              $invoice['auction_id']  = $id;
              $invoice['description'] = $this->getAuctionDescription($id);
              $invoice['amount']      = ($amount>0)?$amount:$this->getAssetBuyNowPrice($id);
              $invoice['customer_id'] = $user;

              $this->db->insert($this->invoices_table, $invoice);
              $invoice_no = $this->db->insert_id();

              //Maybe Also insert into system events log type 1 event
              $event_object_type = 7; //Invoice
              $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "New invoice:$invoice_no created for {$invoice['amount']}", $event_object_type);

              //Maybe Also insert into system events log type 1 event
              $event_object_type = 1; //Auction
              $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "Asset id:$ass_id sold for {$invoice['amount']}", $event_object_type);

              //Send Notificatication messages
              $buyer_id = $user;
              $seller_id = $invoice['owner_id'];
              $auction_id = $invoice['auction_id'];
              $invoice_amount=$invoice['amount'];
              $invoice_description = $invoice['description'];

              $this->events->systemBuyNowNotification($buyer_id, $seller_id, $auction_id, $invoice_no, $invoice_amount, $invoice_description);

              // Update Asset status fields to unavailbale (non zero)
              // ass_status: 0=available, id of campaign or auction
              // ass_status_detail: 0=available, 1=auction, 2=campaign
              $this->db->query("UPDATE asset SET ass_status = '$auction_id', 
                                                  ass_status_detail=1 
                                             WHERE ass_id = '{$invoice['asset_id']}' LIMIT 1");
              //update auction status to status=2(sold) closed=1 and sold=y
              $this->db->query("UPDATE auctions SET sold = 'y', 
                                    closed=1, `status`=2
                               WHERE id = '$id' LIMIT 1");              


          } else {

              //Invoice already exists for this auction for this user
              //Maybe Also insert into system events log type 1 event
              $event_object_type = 7; //Invoice
              $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "Invoice already exists for this auction/advertiser", $event_object_type);

          }
        
        }

              
        function add_watch() {

          $id = $_POST['auct_id'];
          $ass_id = $_REQUEST['ass_id'];
          $user = $this->session->userdata('user_id');
          $id = $_REQUEST['auct_id'];   print_r($_POST);
          $this->db->query(
                     "INSERT INTO `watch_list` (`ass_id`,`use_id`,`auction`,`start_date`,`status`) 
                     VALUES ('$ass_id','$user','$id',now(),'1')"
                     );

          //Also insert into system events log type 6 event
          if($id > 0){
          //valid auction id
          $event_object_type = 1;

          } else {
          //assume asset id
          $event_object_type = 6;
          $id = $ass_id;
          }

          $this->events->log_event($user, $id, date('Y-m-d H:j:s'), "Asset id:$ass_id added to user:$user's watchlist", $event_object_type);

        }
        
        function remove_watch() {
          //$id = $_POST['auct_id'];
          $ass_id = $_REQUEST['ass_id'];
          $auction_id = $_REQUEST['auction_id'];
          $user = $this->session->userdata('user_id');    //changed all instances of use_id to user_id
          //$id = $_REQUEST['auct_id'];

          $this->db->query(
                     "UPDATE 
                        `watch_list` 
                      SET `status` = '0' 
                      WHERE 
                        ass_id='$ass_id' AND auction='$auction_id' AND use_id='$user'"
                     );
          //echo $this->db->last_query(); exit;
          //Maybe Also insert into system events log type 6 event
          $event_object_type = 6;
          $this->events->log_event($user, $ass_id, date('Y-m-d H:j:s'), "Asset id:$ass_id removed from user:$user's watchlist", $event_object_type);

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

          } else{
            return false;
          }

        } 
    
        /********************************************************************************
        * 11.12.2014                                 *
        * NEW FUNCTIONS FOR NEW LAYOUTS/DESIGN                     *
        *                                        *
        *******************************************************************************/        
        /*
        Get this user's messages
        @param    user_id   int
        @param    isread   int (0 = all unread messages, 1 - all read messages)
        @returns  recordset - list of emails
        */

        function getLatLngForArea($area){
          global $lat;
          global $lng;

          $area_lat_lng = $this->getLatLngFromCityTable($area);
          $lat = $area_lat_lng->cit_lat;
          $lng = $area_lat_lng->cit_long;
          //echo "<br>1 $area $lat $lng:".is_null($area_lat_lng);   
          //var_dump($area_lat_lng);
          //print_r($area_lat_lng);
          if(($area_lat_lng == "null") || is_null($area_lat_lng) || !(bool)($area_lat_lng) ){
            $area_lat_lng = $this->getlatLngFromCityName($area); 
            $lat = $area_lat_lng->lat;
            $lng = $area_lat_lng->lng;
            //echo "<br>2 $area:";   
            //var_dump($area_lat_lng);
            //echo "<br>2 $area: returns ".$area_lat_lng->lat.",".$area_lat_lng->lng;  
            return $area_lat_lng->lat.",".$area_lat_lng->lng;
          } else {
            //echo "<br>1 $area: returns ".$area_lat_lng->cit_lat.",".$area_lat_lng->cit_long;  
            return $area_lat_lng->cit_lat.",".$area_lat_lng->cit_long;
          }
        }

        function getLatLngFromCityTable($area) {
            $query = $this->db->query("SELECT cit_lat, cit_long FROM city WHERE cit_name = '" . $area ."'");
            //return $query->result()[0];
            foreach ($query->result() as $row){     
                return $row;   
            } 
        } 

        public function getlatLngFromCityName($area){

          $geocode_stats = file_get_contents("http://maps.googleapis.com/maps/api/geocode/json?address=$area&sensor=false");
          $output_deals = json_decode($geocode_stats);
          $latLng = $output_deals->results[0]->geometry->location;
          $lat = $latLng->lat;

          $lng = $latLng->lng;

          return $latLng;

        }

        public function getCityAreaAuctionCounts($user_id=0) {       

          //Setup user condition if any
          $condition = '';
          if($user_id>0){
            $condition = " AND (au.use_id = '$user_id') ";
          }    

          //Setup condition based on filters (if any)
          //Ignore user id
          $condition = '';
          $mef_ids = $this->input->post('mef_id');//media family
          if(count($mef_ids)>0 && !empty($mef_ids)){
              $mef_id_list = implode(',', $mef_ids);
              $condition .= " AND ( media_family.mef_id IN ($mef_id_list) ) ";
          }

          $mam_ids = $this->input->post('mam_id');//master media
          if(count($mam_ids)>0 && !empty($mam_ids)){
              $mam_id_list = implode(',', $mam_ids);
              $condition .= " AND ( master_medium_type.mam_id IN ($mam_id_list) ) ";
          }          
          
          $duration = $this->input->post('duration');//duration
          $mef_ids = $this->input->post('mef_id');//media family
          if(count($duration)>0 && !empty($duration)){
              $duration_list = implode(',', $duration);
              $condition .= " AND ( au.duration IN ($duration_list) ) ";
          }                   

          $filter = $this->input->post('filter');//filter
          if($filter != ''){
            $condition .= " 
            AND ( 
              au.title like '%$filter%' 
              OR as.ass_description LIKE '%$filter%' 
              OR as.ass_name LIKE '%$filter%'
            ) ";
          }

          $query = $this->db->query("
            SELECT au.id, UCASE(`as`.ass_city) as ass_city, Count(`as`.ass_city) AS area_count
            FROM auctions AS au 
              INNER JOIN asset AS `as` ON au.ass_id = `as`.ass_id
              RIGHT OUTER JOIN durations ON durations.days = au.duration
              RIGHT OUTER JOIN media_categories ON as.mec_id = media_categories.mec_id
              LEFT JOIN master_medium_type ON master_medium_type.mam_id = media_categories.media_family_id
              LEFT JOIN media_family ON media_family.mef_id = master_medium_type.mef_id              
            WHERE 1
              $condition
            GROUP BY ass_city");

          //echo $this->db->last_query(); 

          if(empty($query)) {
            return null;
          }
          return $query->result();
        }       

        public function getAuctionRooms(){

          //Setup condition based on filters (if any)
          $condition = '';
          $mef_ids = $this->input->post('mef_id');//media family
          if(count($mef_ids)>0 && !empty($mef_ids)){
              $mef_id_list = implode(',', $mef_ids);
              $condition .= " AND ( media_family.mef_id IN ($mef_id_list) ) ";
          }

          $mam_ids = $this->input->post('mam_id');//master media
          if(count($mam_ids)>0 && !empty($mam_ids)){
              $mam_id_list = implode(',', $mam_ids);
              $condition .= " AND ( master_medium_type.mam_id IN ($mam_id_list) ) ";
          }          
          
          $duration = $this->input->post('duration');//duration
          $mef_ids = $this->input->post('mef_id');//media family
          if(count($duration)>0 && !empty($duration)){
              $duration_list = implode(',', $duration);
              $condition .= " AND ( auctions.duration IN ($duration_list) ) ";
          }                   

          $filter = $this->input->post('filter');//filter
          if($filter != ''){
            $condition .= " 
            AND ( 
              auctions.title like '%$filter%' 
              OR asset.ass_description LIKE '%$filter%' 
              OR asset.ass_name LIKE '%$filter%'
            ) ";
          }

          //filter by mec_id is set in the querystring
          $mec_id = $this->input->get('mec_id');//mec_id
          if($mec_id != ''){
            $condition .= " 
            AND ( asset.mec_id = '$mec_id' ) ";
          }

          //echo "<pre>$mef_id_list <br>";
          //echo "$mam_id_list <br>";
          //echo "$duration_list <br>";
          //echo "$filter <br>";
          
          //print_r($_POST); //exit;

          $query = $this->db->query("
              SELECT
                asset.mec_id,
                Min(auctions.`starts`) AS `starts`, auctions.duration, Max(auctions.`ends`) AS `ends`, 
                durations.description AS duration_label, media_categories.description AS mec_description,
                Count(auctions.id) AS total
              FROM
                auctions
              INNER JOIN asset ON auctions.ass_id = asset.ass_id
              RIGHT OUTER JOIN durations ON durations.days = auctions.duration
              RIGHT OUTER JOIN media_categories ON asset.mec_id = media_categories.mec_id
              LEFT JOIN master_medium_type ON master_medium_type.mam_id = media_categories.media_family_id
              LEFT JOIN media_family ON media_family.mef_id = master_medium_type.mef_id
              WHERE
                1 
                $condition
              GROUP BY
                asset.mec_id, auctions.duration, durations.description, media_categories.description
              HAVING
                total > 0
              ORDER BY
                durations.type,
                mec_description ASC,
                total DESC
            ");
          //echo "$query"; exit;
          //echo $this->db->last_query(); exit;
          if(empty($query)) {
            return null;
          }
          return $query->result();

        } 

  function getAssetDetails()
  {

      //Setup condition based on filters (if any)
      $condition = '';
      $mef_ids = $this->input->post('mef_id');//media family
      if(count($mef_ids)>0 && !empty($mef_ids)){
          $mef_id_list = implode(',', $mef_ids);
          $condition .= " AND ( media_family.mef_id IN ($mef_id_list) ) ";
      }

      $mam_ids = $this->input->post('mam_id');//master media
      if(count($mam_ids)>0 && !empty($mam_ids)){
          $mam_id_list = implode(',', $mam_ids);
          $condition .= " AND ( master_medium_type.mam_id IN ($mam_id_list) ) ";
      }          
      
      $duration = $this->input->post('duration');//duration
      $mef_ids = $this->input->post('mef_id');//media family
      if(count($duration)>0 && !empty($duration)){
          $duration_list = implode(',', $duration);
          $condition .= " AND ( auctions.duration IN ($duration_list) ) ";
      }                   

      $filter = $this->input->post('filter');//filter
      if($filter != ''){
        $condition .= " 
        AND ( 
          auctions.title like '%$filter%' 
          OR asset.ass_description LIKE '%$filter%' 
          OR asset.ass_name LIKE '%$filter%'
        ) ";
      }

      $query = $this->db->query("
          SELECT
            asset.*,
            auctions.*
          FROM
            auctions
          INNER JOIN asset ON auctions.ass_id = asset.ass_id
          RIGHT OUTER JOIN durations ON durations.days = auctions.duration
          RIGHT OUTER JOIN media_categories ON asset.mec_id = media_categories.mec_id
          LEFT JOIN master_medium_type ON master_medium_type.mam_id = media_categories.media_family_id
          LEFT JOIN media_family ON media_family.mef_id = master_medium_type.mef_id
          WHERE
            1 
            $condition
        ");

      if(empty($query)) {
        return null;
      }
      return $query->result();

  }

//auctions.id, count(*) as counts, auctions.duration as loc_id,asset.mec_id, auctions.starts,auctions.ends,auctions.status, auctions.closed, auctions.suspended, media_category.description as mec_description, master_medium_type.met_description, asset.ass_city, asset.ass_street_address

  function getAssetDetail()
  {
             
      //Setup condition based on filters (if any)
      $condition = '';
      $mef_ids = $this->input->post('mef_id');//media family
      if(count($mef_ids)>0 && !empty($mef_ids)){
          $mef_id_list = implode(',', $mef_ids);
          $condition .= " AND ( media_family.mef_id IN ($mef_id_list) ) ";
      }

      $mam_ids = $this->input->post('mam_id');//master media
      if(count($mam_ids)>0 && !empty($mam_ids)){
          $mam_id_list = implode(',', $mam_ids);
          $condition .= " AND ( master_medium_type.mam_id IN ($mam_id_list) ) ";
      }          
      
      $duration = $this->input->post('duration');//duration
      $mef_ids = $this->input->post('mef_id');//media family
      if(count($duration)>0 && !empty($duration)){
          $duration_list = implode(',', $duration);
          $condition .= " AND ( auctions.duration IN ($duration_list) ) ";
      }                   

      $filter = $this->input->post('filter');//filter
      if($filter != ''){
        $condition .= " 
        AND ( 
          auctions.title like '%$filter%' 
          OR asset.ass_description LIKE '%$filter%' 
          OR asset.ass_name LIKE '%$filter%'
        ) ";
      }

      $query = $this->db->query("
          SELECT DISTINCT 
            auctions.id, count(*) as counts, auctions.duration as loc_id,asset.mec_id, auctions.starts,auctions.ends,auctions.status, 
            auctions.closed, auctions.suspended, media_categories.description as mec_description, master_medium_type.met_description, 
            asset.ass_city, asset.ass_street_address
          FROM
            auctions
          INNER JOIN asset ON auctions.ass_id = asset.ass_id
          RIGHT OUTER JOIN durations ON durations.days = auctions.duration
          RIGHT OUTER JOIN media_categories ON asset.mec_id = media_categories.mec_id
          LEFT JOIN master_medium_type ON master_medium_type.mam_id = media_categories.media_family_id
          LEFT JOIN media_family ON media_family.mef_id = master_medium_type.mef_id
          WHERE
            1 
            $condition
          GROUP BY
            auctions.id,
            auctions.duration,
            asset.mec_id,
            auctions.`starts`,
            auctions.`ends`,
            auctions.`status`,
            auctions.closed,
            auctions.suspended,
            media_categories.description,
            master_medium_type.met_description,
            asset.ass_city,
            asset.ass_street_address            
        ");

      if(empty($query)) {
        return null;
      }
      return $query->result();

  }


  function getAssetDetails1($area = '', $duration='', $mef_id='', $mam_id='')
  {
             
      //Setup condition based on filters (if any
      $condition = '';
      $radius_search = '';
      $radius_search_condition = '';
      $lat = 0;
      $lng = 0;

      //area filter if any is specified
      // if area is set then do a radius search on the given area name
      if($area !='' && !is_null($area)){
        //$this->db->where('asset.ass_city', $area);  

        $area_lat_lng = $this->getLatLngFromCityTable($area);
        $lat = $area_lat_lng->cit_lat;
        $lng = $area_lat_lng->cit_long;

        if(($area_lat_lng == "null") || is_null($area_lat_lng) || !(bool)($area_lat_lng) ){
          $area_lat_lng = $this->getlatLngFromCityName($area); 
          $lat = $area_lat_lng->lat;
          $lng = $area_lat_lng->lng;
        }

        $radius_search = ",
SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) as lat,
SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1) as lng,
3956*2*ASIN(SQRT(POWER(SIN(($lat - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1))*pi()/180 / 2), 2) + COS($lat * pi() / 180) * COS(SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 1), ',', -1) * pi()/180) * POWER(SIN(($lng - SUBSTRING_INDEX(SUBSTRING_INDEX(position, ',', 2), ',', -1))*pi()/180 / 2),2))) AS distance
";
        //echo $radius_search; exit;
        $condition .= "AND (asset.ass_city ='$area') ";
        $radius_search_condition = "HAVING distance <= 5000"; /* 50 wasn't cutting, may need to relook this*/
        $no_area = false;
      }

      //duration filter if any is specified from rooms view
      if($duration !='' && !is_null($duration)){
        //$this->db->where('asset.ass_city', $area);  
        $condition .= "AND ( auctions.duration IN ($duration) ) ";
        $no_duration = false;
      }
      
      //mef_id filter if any is specified from rooms view
      if($mef_id !='' && !is_null($mef_id)){
        //$this->db->where('asset.ass_city', $area);  
        $condition .= "AND ( media_family.mef_id IN ($mef_id) ) ";
        $no_mecid = false;
      }

      //mam_id filter if any is specified from rooms view
      if($mam_id !='' && !is_null($mam_id)){
        //$this->db->where('asset.ass_city', $area);  
        $condition .= "AND ( master_medium_type.mam_id IN ($mam_id) ) ";
        $no_mecid = false;
      }

      $mef_ids = $this->input->post('mef_id');//media family
      if(count($mef_ids)>0 && !empty($mef_ids)){
          $mef_id_list = implode(',', $mef_ids);
          $condition .= " AND ( media_family.mef_id IN ($mef_id_list) ) ";
      }

      $mam_ids = $this->input->post('mam_id');//master media
      if(count($mam_ids)>0 && !empty($mam_ids)){
          $mam_id_list = implode(',', $mam_ids);
          $condition .= " AND ( master_medium_type.mam_id IN ($mam_id_list) ) ";
      }          
      
      $duration = $this->input->post('duration');//duration
      $mef_ids = $this->input->post('mef_id');//media family
      if(count($duration)>0 && !empty($duration)){
          $duration_list = implode(',', $duration);
          $condition .= " AND ( auctions.duration IN ($duration_list) ) ";
      }                   

      $filter = $this->input->post('filter');//filter
      if($filter != ''){
        $condition .= " 
        AND ( 
          auctions.title like '%$filter%' 
          OR asset.ass_description LIKE '%$filter%' 
          OR asset.ass_name LIKE '%$filter%'
        ) ";
      }

      $query = $this->db->query("
          SELECT DISTINCT
            auctions.id, auctions.status, auctions.current_bid, asset.ass_address, asset.ass_description,
            asset.ass_id, asset.mec_id, asset.position,asset.mec_id,
            auctions.starts, auctions.ends, auctions.minimum_bid, auctions.buy_now, auctions.increment,
            asset.ass_name,asset.ass_street_address, asset.ass_city, asset.ass_province, auctions.status,
            auctions.closed,auctions.sold
            $radius_search
          FROM
            auctions
          INNER JOIN asset ON auctions.ass_id = asset.ass_id
          LEFT OUTER JOIN images ON asset.img_id = images.img_id
          RIGHT OUTER JOIN durations ON durations.days = auctions.duration
          RIGHT OUTER JOIN media_categories ON asset.mec_id = media_categories.mec_id
          LEFT JOIN master_medium_type ON master_medium_type.mam_id = media_categories.media_family_id
          LEFT JOIN media_family ON media_family.mef_id = master_medium_type.mef_id
          WHERE
            1 
            AND asset.ass_id IS NOT NULL
            $condition
            $radius_search_condition
        ");

      //echo $this->db->last_query(); 
      if(empty($query)) {
        return null;
      }
      return $query->result();

  }

//auctions.id,auctions.status,auctions.current_bid,asset.ass_address,asset.ass_description,asset.ass_id, asset.mec_id, asset.position, asset.ass_name,asset.ass_street_address, asset.ass_city, asset.ass_province
  function getAssetDetails1111($area='')
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

    function getAssetBuyNowPrice($id) {
        $query = $this->db->query("SELECT buy_now FROM auctions WHERE id = '" . $id ."'");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            return $row->buy_now;   
        } 
    }   

    function getAuctionAssetId($id) {
        $query = $this->db->query("SELECT ass_id FROM auctions WHERE id = '" . $id ."'");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            return $row->ass_id;   
        } 
        //print_r($query->result());
    }  

    function getAuctionDescription($id) {
        $query = $this->db->query("SELECT title FROM auctions WHERE id = '" . $id ."'");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            return $row->title;   
        } 
        //print_r($query->result());
    } 

    function auctionInvoiceNotAlreadyExists($id, $user_id){
        $query = $this->db->query("SELECT id 
                                    FROM $this->invoices_table 
                                   WHERE auction_id = '" . $id ."' 
                                    AND customer_id='$user_id' ");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            return false;   
        }
        return true;       
    }

    /*
    * Get the auction's last max bidder
    * Return array(bidder_id, bid_amount) 
    */
    function auctionLastMaxBidder($id){

        $query = $this->db->query("SELECT 
                                    MAX(bid) as max_bid, bidder, bid 
                                   FROM bids WHERE auction = '" . $id ."' 
                                   GROUP BY bidder, bid
                                   HAVING bid=MAX(bid)
                                   ORDER BY bid DESC
                                   LIMIT 1");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            return array($row->bidder, $row->bid);   
          //return $row->bidder;
        }     
    }

    /*
    * Get the given user's auction's last max bidder
    * Return bid_amount
    */
    function auctionUserLastMaxBid($id, $user_id){

        $query = $this->db->query("SELECT 
                                    MAX(bid) as max_bid, bidder, bid 
                                   FROM bids 
                                   WHERE 
                                    auction = '" . $id ."' AND bidder = '$user_id'
                                   GROUP BY bidder, bid
                                   HAVING bid=MAX(bid)
                                   ORDER BY bid DESC
                                   LIMIT 1");
        //return $query->result()[0];
        foreach ($query->result() as $row){     
            //return array($row->bidder, $row->bid);   
            return $row->bid;
        }     
    }

    /*
    Get All user's current bids, latest bid first
    */
    function allUserBids($user_id=0){
        $data = array();
        if($user_id <= 0){
          $user_id = $this->session->userdata('user_id');
        }

        $query = $this->db->query("SELECT bidder, MAX(bid) as bid FROM bids WHERE bidder = '$user_id' AND winner = 0
                                   GROUP BY bidder, auction
                                   ORDER BY bidwhen, bid DESC
                                  ");
        foreach ($query->result() as $row){     
            $data[]=$row;
        }  
        return $data;   
    }

    /*
    Get All user's current auctions, latest auction first
    */
    function allUserAuctions($user_id=0){
        $data = array();
        if($user_id <= 0){
          $user_id = $this->session->userdata('user_id');
        }

        $query = $this->db->query("
          SELECT 
            DISTINCT auctions.id, Max(bids.bid) AS bid 
          FROM auctions LEFT JOIN bids ON bids.auction = auctions.id
            WHERE auctions.use_id = '$user_id' GROUP BY auctions.id ORDER BY bids.bidwhen DESC
          ");
        foreach ($query->result() as $row){     
            $data[]=$row;
        }  
        return $data;   
    }

    /*
    Get All user's current auctions, latest auction first
    */
    function allUserInvoices($user_id=0){
        $data = array();
        if($user_id <= 0){
          $user_id = $this->session->userdata('user_id');
        }

        $query = $this->db->query("
            SELECT DISTINCT
              invoice.amount, invoice.auction_id, invoice.campaign_id
            FROM
              invoice
            WHERE 
              invoice.customer_id = '$user_id' AND invoice.amount > 0 AND invoice.`status` = 0
          ");
        foreach ($query->result() as $row){     
            $data[]=$row;
        }  
        return $data;   
    }

    /*
SELECT MAX(bid), bidder, bid FROM bids WHERE auction = 5
GROUP BY bidder, bid
HAVING bid=MAX(bid)
ORDER BY bid DESC
LIMIT 1
    */

}

