<?php
/*
Maybe will replace load_stock
*/
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class auctions extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('province');
		$this->load->model('town');
		$this->load->model('asset_type');
		$this->load->model('media_category');
		$this->load->model('media_family');
		$this->load->model('assets','assssssetsi'); //TODO: we need to replace assssssetsi eventually
		$this->load->library('googlemaps');
		$this->load->model('duration');
		$this->load->model('auction');
		$this->load->model('ajax_asset');
		$this->load->model('bids');

	}

	public function index()
	{
		//take points from db
		$data = array();
		$data['mmm'] = $this->assssssetsi->getAssetDetails();
		$data['mmm1'] = $this->assssssetsi->getAssetDetail();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
        $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
        $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assssssetsi->getAssetDetails1();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);

		//11.12.2014 - Get Area/City Auctions Counts
		$post_criteria['auction_areas'] = $this->auction->getCityAreaAuctionCounts($user_id);
		//print_r($post_criteria['auction_areas']); exit;
              //  $this->layouts->view('sell_stock', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));

		$this->layouts->view('auctions_new_rooms', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));


	}


	/* BEGIN New Auction Functions */

    public function search(){
    	//filter auctions listing + map by form filters

    }

    public function searchByMap(){
    	//filter auctions listing by map center and radius
    }


	/*
	1. List / Search Available Sites/Items to Auction
	2. Select One or more ( the or more bit to come later) sites or items to place on auction
	3. Create a new auction item(s)
		- Could be Auction only Or Auction and Buy Now
		- NOTE: approx production/lead time for Ads2trade is 7 days so take this into consideration when creating a new auction item
			- e.g. for a 4 week auction, first week is for prep/production and the 3 weeks for running the campaign
	*/
	public function create(){

		//Action: Create
		$action = $this->input->get('action');
		if($action == 'create'){
		  //normal 'next auction' object holder
		  $auction = array();
		  //placeholder in case user wants to add asset to current auction for this week
		  $auction_current = array();

		  ///print_r($_POST);
		  //exit;

/*
          $this->db->query(
                 "INSERT INTO `auctions` (`ass_id`,`use_id`,`title`,`subtitle`,`starts`,`duration`,`minimum_bid`,`buy_now`,
                 `auction_type`,`increment`) 
                 VALUES ('$ass_id','$user','$title','$title','$from_date','$duration','$price','$buy_now','1','$increment')"
                 );
*/
		  //Add item to multiple auctions
		  //Add to the auction currently underway (optional)
		  $add_to_current = $this->input->post('add_to_current');	
		  //Default - add to the next auction (starting next monday)		  
		  $add_to_next = $this->input->post('add_to_next');

          //Next Auction Dates
		  $from_next_monday = date('Y-m-d 12:00:00', strtotime('next monday'));
		  $to_next_sunday = date('Y-m-d 23:59:59', strtotime('next sunday'));

		  $auction['ass_id'] = $this->input->post('ass_id');
          $auction['use_id'] = $this->session->userdata('user_id');
          $auction['title'] = $this->input->post('ass_name');
          $auction['subtitle'] = $auction['title'];
          $auction['campaign_starts'] = $this->input->post('from_date');
          
          $auction['auction_type'] = 1;
          $temp_duration = $this->input->post('duration');
          $auction['duration'] = $temp_duration;

          $row_duration = $this->duration->getDurationText($temp_duration); //print_r($row_duration[0]->description);
		  $temp_duration = $row_duration[0]->description; 
          $temp_duration = str_replace("weeks", "week", $temp_duration);
          $temp_duration = str_replace("months", "month", $temp_duration);
          //echo " +$temp_duration";
          /*
			$date = date("Y-m-d");// current date

			$date = strtotime(date("Y-m-d", strtotime($date)) . " +1 day");
			$date = strtotime(date("Y-m-d", strtotime($date)) . " +1 week");
			$date = strtotime(date("Y-m-d", strtotime($date)) . " +2 week");
			$date = strtotime(date("Y-m-d", strtotime($date)) . " +1 month");
			$date = strtotime(date("Y-m-d", strtotime($date)) . " +30 days");
          */
          $to_date = date("Y-m-d",strtotime(date("Y-m-d", strtotime($auction['starts'])) . " +$temp_duration"));
          //auction starts next monday
          $auction['starts'] = $from_next_monday;
          //auction ends next sunday
          $to_next_sunday = date('Y-m-d 23:59:59', strtotime('next sunday, 11:59am', strtotime($from_next_monday)));
          $auction['ends'] = $to_next_sunday;

          $auction['minimum_bid'] = $this->input->post('price');

          $allow_buy_now = $this->input->post('allow_buy_now');
          if($allow_buy_now == 1){
			$auction['buy_now'] = $this->input->post('buy_now');
          } else {
          	$auction['buy_now'] = 0;
          }
          
          $auction['increment'] = $this->input->post('increment');
          //print_r($auction);
          //exit;
          //Save Auction to database and return the id
          $auction_id = $this->auction->create($auction);

          //Record auction event
		  $event_object_type = 1; //Auction
          $this->events->log_event($auction['use_id'], $auction_id, date('Y-m-d H:j:s'), "Auction for Asset ".$auction['title']." (".$auction['ass_id'].") created", $event_object_type);

          //If user wants asset added to current auction as well then add it
          if($add_to_current == 1){
          	$auction_current = $auction;
			//Current Auction Dates
			$from_current_monday = date('Y-m-d 12:00:00', strtotime('previous monday'));
			//$end = strtotime('next sunday, 11:59am', strtotime($from_prev_monday));
			$to_current_sunday = date('Y-m-d 23:59:59', strtotime('next sunday, 11:59am', strtotime($from_current_monday)));

			//Update the start/end dates to be start (monday) /end (sunday) of current auction
			$auction_current['starts'] = $from_current_monday;	
			$auction_current['ends'] = $to_current_sunday;

            //Save Auction to database and return the id
            $auction_current_id = $this->auction->create($auction_current);

            //Record auction event
		    $event_object_type = 1; //Auction
            $this->events->log_event($auction['use_id'], $auction_id, date('Y-m-d H:j:s'), "Auction (current) for Asset ".$auction['title']." (".$auction['ass_id'].") created", $event_object_type);

          }          
		  
		  //Redirect to my pending auctions
		  //redirect('my_stock/op_index'); exit;
		  redirect($_SERVER['HTTP_REFERER'].'?&auctionsaved='.$auction_current_id);

		}

		//Action: none/nil 
		//Setup needed data arrays 
		$data = array();

		//filters
		$filter = $this->input->post('filter');
		$mec_id = $this->input->post('mec_id');
		$duration = $this->input->post('duration');
		$location = $this->input->post('location');

		$data['filter'] = $filter;
		$data['mec_id'] = $mec_id;
		$data['duration'] = $duration;
		$data['location'] = $location;

        $dat['mm'] = $this->assssssetsi->getMyAsset($filter);
		$data['mmm'] = $this->assssssetsi->getAssetDetailsm();
		$data['mmm1'] = $this->assssssetsi->getAssetDetailm();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1m();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
        $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
        $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assssssetsi->getAssetDetails1m();
        //get Media Families
        $media_fam['my_families'] = $this->media_family->getMediaFamilies();
        //Get all media types
        $media_types['all_media'] = $this->media_category->getMediaCategories();
		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);
		//echo "<pre>";
		//print_r($dat);
		//exit;
		$this->layouts->view('auction/create', 
			null, 
			array_merge($asset_family,$media_types, $media_fam,$asset_master,$data, $data1, $data2, $provinces, $dat,$towns, $asset_types, $durations, $post_criteria), 
			false); //set this to false to use custom auctions header/footer

	}

    public function cart(){
    	//shopping cart functions
    	$action = $this->input->get('action');

    	switch($action){
    		case 'add':
    			break;
    		case 'del':
    			break;
    		case 'save':
    			break;
    		default:
    			//all
    	}
    }

    public function pending(){

		//Action: none/nil 
		//Setup needed data arrays 
		$data = array();
		$data["subtitle"] = "Pending";
		//filter
		$filter = $this->input->post('filter');

		$data['filter'] = $filter;

        $dat['mm'] = $this->assssssetsi->getMyAsset($filter);
		$data['mmm'] = $this->assssssetsi->getAssetDetailsm();
		$data['mmm1'] = $this->assssssetsi->getAssetDetailm();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1m();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assssssetsi->getAssetDetails1m();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);

		$this->layouts->view('auction/list', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $dat,$towns, $asset_types, $durations, $post_criteria), false);

    }

    public function active(){

		//Action: none/nil 
		//Setup needed data arrays 
		$data = array();
		$data["subtitle"] = "Active";
		//filter
		$filter = $this->input->post('filter');

		$data['filter'] = $filter;

        $dat['mm'] = $this->assssssetsi->getMyAsset($filter);
		$data['mmm'] = $this->assssssetsi->getAssetDetailsm();
		$data['mmm1'] = $this->assssssetsi->getAssetDetailm();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1m();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assssssetsi->getAssetDetails1m();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);

		$this->layouts->view('auction/list', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $dat,$towns, $asset_types, $durations, $post_criteria), false);

    }

    public function reports(){
    	//auctions reports
    }

    public function activate(){

    	//activate asset
    	$ass_id 	= $this->input->post('ass_id');
    	$ass_action = $this->input->post('ass_action');
    	if($ass_action == 'Deactivate'){
    		//deactivate asset, set asset.ass_status = 1, asset.ass_status_detail = 3 (1=on auction, 2=on campaign, 3=deactiated manually)
  			$asset = array('ass_status' 		=> 1,  //inactive
  						   'ass_status_detail' 	=> 3); //manually inactivated
    	} else {
  			$asset = array('ass_status' 		=> 0,  //active
  						   'ass_status_detail' 	=> 0); //active
    	}

    	$result = $this->assssssetsi->activate($ass_id, $asset);
    	
    	echo $ass_action;
    }

    public function deactivate(){
    	//deactivate asset
    }

	/* END New Auction Functions */

	public function spec_sheet($asset_name="", $asset_ref="", $asset_description="")
	{
		//get the uploaded regions

		//TODO(blessed): Get details from selected Asset
		//asset id
		$asset_id = $this->input->get('ass_id');
		
		//main asset details
		$asset_details = $this->assets->getAsset();
		foreach($asset_details as $row){
		    $asset_name = $row->ass_name;
		    $ass_ref = $row->ass_ref;
		    $ass_description = $row->ass_description;
		}
		//Setup PDF Doc details:
		//	Title 
		//	Filename
		//	Orientation
		$doc_title = 'Ads2Trade - Asset Specsheet # '.$ass_ref .' - '. $ass_description; //TODO(blessed): Get details from selected Asset
		$doc_name  = 'Asset_Specsheet_'.$ass_ref;
		$doc_orientation = 'L';

		//Load HTML doc
        $data = array();
        $doc_html = $this->load->view('spec_sheet_new', $data, true);

        //make PDF 
		make_pdf($doc_html, $doc_name, $doc_title, $doc_orientation);
	}

	public function spec_sheet_list($asset_name="", $asset_ref="", $asset_description="")
	{
		//asset id
		$asset_ids = $this->input->get('asset_ids');
		
		//Setup PDF Doc details:
		//	Title 
		//	Filename
		//	Orientation
		$doc_title = 'Ads2Trade - Asset Specsheet Summaries '; 
		$doc_name  = 'Ads2trade_Specsheet_Summary_'.date('Ymd_hjs');
		$doc_orientation = 'L';

		//Load HTML doc
        $data = array();
        $doc_html = $this->load->view('spec_sheet_list_summary', $data, true);
        //echo $doc_html;
        //make PDF 
		make_pdf($doc_html, $doc_name, $doc_title, $doc_orientation);
	}

    public function proposal()
	{
		//get the uploaded regions

		$this->load->view('proposal', null);
	}

	public function drop_pins()
	{
		//get post variables

		$region = $this->input->post('region');
		$location = $this->input->post('location');
		$loc_ref = $this->input->post('loc_ref');

		//call the centrallised map for the chosen region
		//define the map data base on the chosen region
		$city = $region . $location . 'SA';
		$array = $this->lookup($city);
		$this->center_map($array['latitude'], $array['longitude']);
	}

	public function asset_detais()
	{

		$region = $this->input->post('region');
		$location = $this->input->post('location');
		$loc_ref = $this->input->post('loc_ref');
		$asset_type = $this->input->post('med_type');
		$data = array();
		$data['region'] = $region;
		$data['location'] = $location;
		$data['loc_ref'] = $loc_ref;
		$data['asset_type'] = $asset_type;
		//select existing Asset Details
		$this->layouts->view('load_stock3', null, $data
		);
	}

	public function asset()
	{
		//asset id
		$asset_id = $this->input->get('ass_id');
		$auction_id = $this->input->get('auction_id');
		
		//main asset details
		$data1['asset_details'] = $this->assets->getAsset();
		$data1['mmm']; //will need to retire this and replace it with a meaningful name
		//asset image(s) (if any, else we will show the placeholder picture/thumbnail)
		$data1['asset_images'] = $this->assets->getAssetImages($asset_id);
		//asset rate card(s)
		$data1['asset_rates'] = $this->assets->getAssetRateCards($asset_id);

		//$data1['auction_id'] = $_REQUEST['auction_id']; 
		foreach ($data1['asset_details'] as $row) {
			if(is_numeric($row->latitude) && is_numeric($row->longitude)){
			
				$position = $row->latitude.','.$row->longitude;
				$lat = $row->latitude;
				$lng = $row->longitude;

			} else {
				
				$position = $row->position;
				$string = explode(',', $row->position);
				$lat = $string[0];
				$lng = $string[1];

			}
			$config['center'] = $position;
			$config['zoom'] = 15;
			$config['map_name'] = 'map';
			if (isset($_POST['view'])) {

				$config['center'] = $position;
				$config['map_type'] = 'STREET';
				$config['streetViewPovHeading'] = 90;

			} elseif (isset($_POST['map'])) {
				
				$config['map_div_id'] = 'map_canvas';
				$marker = array();
				$marker['position'] = $position;
				$marker['infowindow_content'] = $row->ass_name;
				$this->googlemaps->add_marker($marker);

			} else {

				$config['map_div_id'] = 'map_canvas';
				$marker = array();
				$marker['position'] = $position;
				$marker['infowindow_content'] = $row->ass_name;
				$this->googlemaps->add_marker($marker);

			}
			$this->googlemaps->initialize($config);

		}
		$data['map'] = $this->googlemaps->create_map();
		//get current bid on an asset
        $auction_id =  $_REQUEST['ass_id'];
        $bid_data['current_bid'] = $this->bids->getBidDetail($_REQUEST['auction_id']);
       	$this->layouts->view('auction/view_stock', null, array_merge($data, $data1, $bid_data));
	}

	public function asset_details2()
	{
		//take points from db
		$data = array();
		$data['mmm'] = $this->assssssetsi->getAssetDetails();
		//var_dump($data);exit;
		$this->layouts->view('load_stock4', null, array_merge($data));
	}

	public function spiderfy()
	{
		//take points from db
		$data = array();
		$data['mmm'] = $this->assssssetsi->getAssetSpiderfy();
		//var_dump($data);exit;
		$this->layouts->view('my_spidefy', null, array_merge($data));
	}


	public function home()
	{
		//take points from db
		$this->layouts->view('media_owner_dashboard', null);
	}


	public function asset_details3()
	{
		//take points from db
		$data = array();
		$data['mmm'] = $this->assssssetsi->getAssetDetails();
		$data['mmm1'] = $this->assssssetsi->getAssetDetail();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assssssetsi->getAssetDetails1();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);

		//11.12.2014 - Get Area/City Auctions Counts
		$post_criteria['auction_areas'] = $this->auction->getCityAreaAuctionCounts($user_id);
		//print_r($post_criteria['auction_areas']); exit;
              //  $this->layouts->view('sell_stock', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));

		$this->layouts->view('auctions_new_rooms', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria), false);


	}
        
        
        public function view_my_assets()
	{
		//take points from db
		$data = array();
                $dat['mm'] = $this->assssssetsi->getMyAsset();
		$data['mmm'] = $this->assssssetsi->getAssetDetailsm();
		$data['mmm1'] = $this->assssssetsi->getAssetDetailm();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1m();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assssssetsi->getAssetDetails1m();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);



		$this->layouts->view('sell_my_assets', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $dat,$towns, $asset_types, $durations, $post_criteria));


	}



	public function cluster()
	{


		$data1['mmm'] = $this->assssssetsi->getAssetDetails1();
		$this->load->library('googlemaps');
		$count = 0;
		foreach ($data1['mmm'] as $row) {
			if ($count == 0) {
				$config['center'] = $row->position;
				$config['zoom'] = 'auto';
				$config['cluster'] = TRUE;
				$this->googlemaps->initialize($config);
				$count = $count + 1;
			}
			$marker = array();
			$marker['position'] = $row->position;
			$this->googlemaps->add_marker($marker);


		}
		$data['map'] = $this->googlemaps->create_map();

		$this->layouts->view('active_bids', null, array_merge($data));
	}

	public function bid()
	{

		$data = array();
		$this->auction->create_bid();
		$this->layouts->view('bid', null, array_merge($data));
	}

	public function buynow()
	{
		$data = array();
		//  do buy now queries
		$this->auction->buy_now();

		$this->layouts->view('buy_now', null, array_merge($data));
	}


	public function addwatch()
	{
		$data = array();
		$this->auction->add_watch();


		$this->layouts->view('active_bids', null, array_merge($data));
	}


	public function auction_details()
	{
		
		//area filter
		$area_filter = $this->input->get('area');
		$mef_id_filter = $this->input->get('mef_id');
		$mam_id_filter = $this->input->get('mam_id');
		$duration_filter = $this->input->get('duration');
      
      	$user_id = $this->session->userdata('user_id');
      	$auction_id = $this->input->get_post('auction_id');   //$_REQUEST[] equivalent
		//take points from db
		$data = array();
		$data1 = array();
		$data['room_details'] = $this->auction->getAuctionRooms();
	
		$data1['asset_details'] = $this->auction->getAssetDetails1($area_filter, $duration_filter, $mef_id_filter, $mam_id_filter);

		$data1['auction_id'] = $auction_id;
		$provinces['my_provinces'] = $this->province->getRegions();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		$bid_data['current_bid'] = $this->bids->getBidDetail($auction_id);
        //get my last bid
        $current_bid['last_bid'] = $this->bids->getUserAuctionBid($user_id, $auction_id);

		$a = 0; //
		/*
		foreach ($data1['asset_details'] as $row) {
			$a = $a + 1;
			// Map One
			$mapname = 'map_' . $a;
			$mapcanv = 'map_canvas' . $a;
			$config['center'] = $row->position;
			$config['zoom'] = 9;
			$config['map_name'] = $mapname;
			$config['map_div_id'] = $mapcanv;
			$this->googlemaps->initialize($config);
			$marker = array();
			$marker['position'] = $row->position;
			$marker['infowindow_content'] = $row->ass_name;
			$this->googlemaps->add_marker($marker);
            $data[$mapname] = $this->googlemaps->create_map();
            
		}
		*/

		$this->layouts->view('auction/auction_details', 
			null, 
			array_merge($data, $data1, $provinces, $towns, $asset_types, 
				$durations, $bid_data, $current_bid),
			false); //set this to false to use custom auctions header/footer

		}



	public function center_map($rekutanga, $rechipiri)
	{
		$center_position = $rekutanga . ", " . $rechipiri;
		$this->load->library('googlemaps');
		$config['center'] = $center_position;
		$config['zoom'] = 'auto';
		$this->googlemaps->initialize($config);
		$config['onclick'] = 'createMarker_map({ map: map, position:event.latLng, draggable:true });';
		$this->googlemaps->initialize($config);
		$data['map'] = $this->googlemaps->create_map();
		$this->layouts->view('load_stock2', null, $data);
	}

	public function active_bids()
	{
		$this->layouts->view('active_bids');
	}
        public function all_active_bids()
	{
		$this->layouts->view('all_active_bids');
	}
	public function watch_list()
	{
		$this->layouts->view('watch_list');
	}
        public function all_watch_list()
	{
		$this->layouts->view('all_watch_list');
	}
	public function won_bids()
	{
		$this->layouts->view('won_bids');
	}
    public function all_won_bids()
	{
		$this->layouts->view('all_won_bids');
	}
        
    public function remove_watch()
	{      
		$this->auction->remove_watch();
		//$this->layouts->view('watch_list');
		redirect('watch_list','refresh');
	}
        
	public function lost_bids()
	{
		$this->layouts->view('lost_bids');
	}


	public function lookup($string)
	{

		$string = str_replace(" ", "+", urlencode($string));
		$details_url = "http://maps.googleapis.com/maps/api/geocode/json?address=" . $string . "&sensor=false";

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $details_url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$response = json_decode(curl_exec($ch), true);

		// If Status Code is ZERO_RESULTS, OVER_QUERY_LIMIT, REQUEST_DENIED or INVALID_REQUEST
		if ($response['status'] != 'OK') {
			return null;
		}

		//print_r($response);
		$geometry = $response['results'][0]['geometry'];

		$longitude = $geometry['location']['lng'];
		$latitude = $geometry['location']['lat'];

		$array = array(
			'latitude'      => $geometry['location']['lat'],
			'longitude'     => $geometry['location']['lng'],
			'location_type' => $geometry['location_type'],
		);

		return $array;
	}

	public function loadajax()
	{

		$this->load->view('loadajax', null);
	}
        
        
        
	public function bid_pop()
	{

		$this->load->view('test', null);
	}


	public function our_ajax()
	{

		if ($_POST["action"] == "get_asset_details") {
			?>
			<div id="dialog_content">
				<form>
					<h2>Edit Assets</h2>
					<label>Title</label>
					<input type="text" name="title" class="form-control">

					<label>Description</label>
					<textarea type="text" name="title" class="form-control"></textarea>

					<input type="hidden" name="action" value="save_exist_asset">
					<input type="hidden" name="position" value="12312312,31231212">

					<div class="buttons">
						<a href="#" class="save_asset">Save Asset</a>
						<a href="#" class="delete_asset">Delete Asset</a>
					</div>
					<br>
				</form>
			</div>
		<?php
		}


		if ($_POST["action"] == "add_new_asset") {
			//use position as the unique ID


		}

		if ($_POST["action"] == "save_exist_asset") {
			//use position as the unique ID


		}

		if ($_POST["action"] == "delete_asset") {
			//use position as the unique ID


		}

	}
	/********************************************************************************
	 * 11.12.2014																	*
	 * NEW FUNCTIONS FOR NEW LAYOUTS/DESIGN											*
	 *																				*
	 *******************************************************************************/

	public function jsonGetAssetDetails($ass_id){

		echo $this->assssssetsi->jsonGetAssetDetails($ass_id);

	}

    public function ajax_get_mediatypes(){
        /*
        Example call http://indigostorage.co.za/ads_final/index.php/new_campaign/ajax_get_mediatypes/?id=digital,traditional

        Result: [{"id":"2","text":"bench"},{"id":"3","text":"bus (Digital)"},{"id":"5","text":"street pole (Digital)"},{"id":"7","text":"bill board (Digital)"},{"id":"9","text":"taxi tv digital network"},{"id":"10","text":"cafe digital network"},{"id":"1","text":"poster"},{"id":"11","text":"magazine advert "},{"id":"4","text":"bus (Traditional)"},{"id":"6","text":"street pole (Traditional)"},{"id":"8","text":"bill board (Traditional)"}]
        */
        $all_media = array();
        $new_media = array();

        if($this->input->get('id')) {
            $all_media = $this->media_category->getMediaCategoriesByFamily($this->input->get('id'));
        } else {
            $all_media = $this->media_category->getMediaCategoriesByFamily();
        }
        foreach ($all_media as $row) {
            # code...
            $new_media[] = array('id' => $row->mec_id, 'text'=>$row->mec_description);
        }
        echo json_encode($new_media);
    }

	public function auctions()
	{

		//Get filters if any

		//Get Session data required
		$user_id = $this->session->userdata('user_id');
		
		//Get data from db
		//take points from db
		$data = array();
		$data['mmm'] = $this->assssssetsi->getAssetDetails();
		$data['mmm1'] = $this->assssssetsi->getAssetDetail();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assssssetsi->getAssetDetails1();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();

		$durations['durations'] = $this->duration->getDudarion();

		$data1['mmm'] = $this->assssssetsi->getAssetDetails1();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);

		//11.12.2014 - Get Area/City Auctions Counts
		$post_criteria['auction_areas'] = $this->auction->getCityAreaAuctionCounts(0);

		//$this->layouts->view('auctions_new', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));

		//Build view data array
		//$data = array();
		$data['user_id'] = $user_id;

		//Load view
		$this->layouts->view('auctions_new_home', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));
	}
}
/* end of file auctions.php */