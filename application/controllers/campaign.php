<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class campaign extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('campaign_model', 'campaign');
        $this->load->model('User_model', 'users');
		//For logging entries to the system events module
		//$this->load->model('sysevents_model', 'sysevents');
    }

    public function index() {
        //if (!isset($is_logged_in) || $is_logged_in != true) {
            redirect('new_campaign/campaigns');
        //}
    }

function getCatName($i){
switch($i){
 case 1: "Outdoor"; break;
 case 2: "Indoor"; break;
 case 3: "Rolling Media"; break;
 case 4: "Print"; break;
 case 5: "Othe"; break;
}
}
    /*
		Campaign workflow home page
    */	
    public function setup_topmenu_filters($data) {

               /* Filter Values */
               $data['filter_advertiser'] = $this->input->post('filter_advertiser');
               $data['filter_contract'] = $this->input->post('filter_contract');
               $data['filter_media_owner'] = $this->input->post('filter_media_owner');
               $data['filter_media_category'] = $this->input->post('filter_media_category');
               $data['selected_filter_category'] = "Selected:";
               for ($i=1; $i<6;$i++) {
                  if(isset($data['filter_media_category']) && in_array($i, $data['filter_media_category'])){
                        switch($i){
                           case 1: $category = "Outdoor"; break;
                           case 2: $category = "Indoor"; break;
                           case 3: $category = "Rolling Media"; break;
                           case 4: $category = "Print"; break;
                           case 5: $category = "Other"; break;
                        default: $category = "";
                       }
                       $data['selected_filter_category'] .= $category.",";
                 }
               }
               /* End Filter Values */

    }

    public function workflow() {

    	$data = array();

		/* Filter Values */
		$data['filter_advertiser'] = $this->input->post('filter_advertiser');
		$data['filter_contract'] = $this->input->post('filter_contract');
		$data['filter_media_owner'] = $this->input->post('filter_media_owner');
		$data['filter_media_category'] = $this->input->post('filter_media_category');
		$data['selected_filter_category'] = "<b>";
		for ($i=1; $i<6;$i++) {
		   if(isset($data['filter_media_category']) && in_array($i, $data['filter_media_category'])){            
			 switch($i){
			    case 1: $category = "Outdoor"; break;
			    case 2: $category = "Indoor"; break;
			    case 3: $category = "Rolling Media"; break;
			    case 4: $category = "Print"; break;
			    case 5: $category = "Other"; break;
		   	 default: $category = "";
			}				
            		$data['selected_filter_category'] .= $category.",";
	          }
	        }
		$data['selected_filter_category'] .= "</b>";
		$data['filter_campaign_status'] = $this->input->post('filter_campaign_status');
		/* End Filter Values */

		//$this->setup_topmenu_filters($data);

		/* Filters */
		// Get All Media Owners
		$data['media_owners'] = $this->campaign->getAllMediaOwners();

		// Get All Advertisers
		$data['advertisers'] = $this->campaign->getAllAdvertisers();

		// Get All Contract Numbers
		$data['contracts'] = $this->campaign->getContractNumbers();

		// Get All Workflow Origin Options
		$data['origins'] = $this->campaign->getWorkflowOrigins();

    	$this->layouts->view('campaign/workflow', 
			null, 
			array_merge($data), 
			false); //set this to false to use custom auctions header/footer

    }

    /*
		Campaign reports home page
    */
	public function reports(){

    	$data = array();

    	$this->layouts->view('campaign/reports', 
			null, 
			array_merge($data), 
			false); //set this to false to use custom auctions header/footer

	}	

	/*
		Workflow Main (List of Campaigns)
	*/
	public function workflow_main() {


		//echo "main";
		$this->load->library('Datatable', array('model' => 'campaign_dt', 'rowIdCol' => 'c.cam_id'));
		//echo "main";
		
		//$this->datatable->group_by('c.cam_id');

		$jsonArray = $this->datatable->datatableJson(array(
                'cam_creation_date'=>'date',
                'cam_budget'=>'currency'
            ));

		$this->output->set_header("Pragma: no-cache");
        $this->output->set_header("Cache-Control: no-store, no-cache");
        $this->output->set_content_type('application/json') -> set_output(json_encode($jsonArray));
		
	}	

	/*
		View / Edit Campaign Workflow Details
	*/
	public function workflow_details() {
		//
		$data = array();
		$EventTypeId = 3; //Campaign Type Events

		// Campaign Id
		$campaign_id = $this->input->get('id'); 

              /* Filter Values */
              $data['filter_advertiser'] = $this->input->post('filter_advertiser');
              $data['filter_contract'] = $this->input->post('filter_contract');
              $data['filter_media_owner'] = $this->input->post('filter_media_owner');
              $data['filter_media_category'] = $this->input->post('filter_media_category');
              $data['selected_filter_category'] = "<b>";
              for ($i=1; $i<6;$i++) {
                 if(isset($data['filter_media_category']) && in_array($i, $data['filter_media_category'])){
                       switch($i){
                          case 1: $category = "Outdoor"; break;
                          case 2: $category = "Indoor"; break;
                          case 3: $category = "Rolling Media"; break;
                          case 4: $category = "Print"; break;
                          case 5: $category = "Other"; break;
                       default: $category = "";
                      }
                      $data['selected_filter_category'] .= $category.",";
                }
              }
              $data['selected_filter_category'] .= "</b>";
	      $data['filter_campaign_status'] = $this->input->post('filter_campaign_status');	
              /* End Filter Values */
		
		// Get filters
		//$this->setup_topmenu_filters($data);
		
		// Get Campaign Details
		$data['campaign'] = $this->campaign->getCampaignDetails($campaign_id);

		// Get Campaign Assets
		$data['campaign_assets'] = $this->campaign->getCampaignDetailsLineItems($campaign_id);

		// Get predefined workflow statuses
		$data['workflow_status'] = $this->campaign->getWorkflowStatuses();

		// Get predefined workflow statuses
		$data['asset_status'] = $this->campaign->getWorkflowAssetStatuses();

		// Get this campaign's workflow status transactions 
		$data['workflow_status_history'] = $this->campaign->getWorkflowStatusHistory($campaign_id);

		// Get this campaign's workflow events/notifications transactions 
		$data['workflow_events_history'] = $this->events->getEventsForObjectAndType($campaign_id, $EventTypeId);	

		// Get this campaign's workflow attachments
		$data['workflow_attachments'] = $this->campaign->getWorkflowAttachments($campaign_id);	

		/* Filters */
		// Get All Media Owners
		$data['media_owners'] = $this->campaign->getAllMediaOwners();

		// Get All Advertisers
		$data['advertisers'] = $this->campaign->getAllAdvertisers();

		// Get All Contract Numbers
		$data['contracts'] = $this->campaign->getContractNumbers();

		// Get All Workflow Origin Options
		$data['origins'] = $this->campaign->getWorkflowOrigins();

		//echo $this->db->last_query();
		//echo "<pre>"; print_r($data['workflow_status_history']); exit;

		// Supporting data
		//  upload document types
		$data['document_types'] = $this->campaign->getDocumentTypes();

		//  available users to email
		$users_list = $this->users->get_allusers();
		foreach ($users_list->result() as $row){
			//$data['sendto_options'][] = array($row->use_id => $row->use_first_name.', '.$row->use_last_name);
			$data['sendto_options'][$row->use_id] = $row->use_first_name.', '.$row->use_last_name;
		}

    	$this->layouts->view('campaign/workflow_details', 
			null, 
			array_merge($data), 
			false); //set this to false to use custom auctions header/footer
	}

	/*
		Update the workflow status + any comments
	*/
	public function updateWorkflowStatus() {
		
		$user_id = $this->session->userdata('user_id');
		$campaign_id = $this->input->post('campaign_id');
		$comments = $this->input->post('comments');
		$invoice_amount = $this->input->post('invoice_amount');
		$invoice_type = $this->input->post('invoice_type');
		$new_status = $this->input->post('new_status');

		$workflow_status_record = array(
			'campaign_id' => $campaign_id, 
			'proposal_status_id' => $this->input->post('new_status'), 
			'user_id' => $user_id, 
			'comments' => $comments, 
			'created_at' => date('Y-m-d H:j:s'),
			'updated_at' => date('Y-m-d H:j:s')
			);

		  $id = $this->campaign->updateWorkflowStatus($workflow_status_record);

		  //invoice details
	      if($new_status == 9 || $new_status == 11){

				  $advertiser = $this->campaign->getCampaignAdvertiser($campaign_id);
				  $advertiser_id = isset($advertiser[0]->adv_id)?$advertiser[0]->adv_id:0;

	      	      $invoice = array();
	      	      $invoice['asset_id']    = "";
	      	      $invoice['agent_id']    = $user_id; //Operator
	      	      $invoice['owner_id']    = $user_id; //Media Owner ID - For now the invoice is between Advertiser and Adreach Operator
	      	      //No agent_id/operator ( only applies to campaigns ??)          
	      	      $invoice['campaign_id'] = $campaign_id;
	      	      $invoice['description'] = 'Campaign '.$invoice_type .' - '.$comments;
	      	      $invoice['amount']      = $this->input->post('invoice_amount');
	      	      $invoice['customer_id'] = $advertiser_id; //TODO: get advertiser id
	      
	      	      $this->db->insert('invoice', $invoice);
	      	      $invoice_no = $this->db->insert_id();
	      
	      	      //Maybe Also insert into system events log type 1 event
	      	      $event_object_type = 7; //Invoice
	      	      $this->events->log_event($user_id, $id, date('Y-m-d H:j:s'), "New invoice ($invoice_type):$invoice_no created for $invoice_amount", $event_object_type);		

	      		  $event_object_type = 3; //Campaign
	      		  $this->events->log_event($user_id, $campaign_id, date('Y-m-d H:j:s'), "New invoice ($invoice_type):$invoice_no created for $invoice_amount", $event_object_type);	      	      		  
	      
	      }		
	      
	      // Notifications
	      //System Events
	      $event_object_type = 3; //Campaign
	      $this->events->log_event($user_id, $campaign_id, date('Y-m-d H:j:s'), "Campaign Workflow Status Updated ", $event_object_type);

		if($id > 0){
			echo "success";
		} else {
			echo "error";
		}			

	}

	
	/*
		Update the selected workflow assets statuses + any comments
	*/
	public function updateAssetStatus() {
		
		$user_id = $this->session->userdata('user_id');
		$campaign_id = $this->input->post('campaign_id');
		$new_status = $this->input->post('new_status');
		$update_all = $this->input->post('update_status_all');
		$selected_assets = $this->input->post('assets');
		$comments = $this->input->post('comments');
		
		/** Testing
		$campaign_id = 3240;
		$update_status_all = 0;
		$new_status = 1;
		$selected_assets = "0,23,34,1,5";
		$comments = 'Automated Testing';
		*/

		if($selected_assets == 0 && $update_all){ // get all campaign assets
			$selected_assets = array();
			$temp_selected_assets = $this->campaign->getCampaignDetailsLineItems($campaign_id);

			foreach ($temp_selected_assets as $row) {
				# Only get the asset_id 
				# TODO: Maybe create a model function that only returns asset ids array to avoid this foreach loop ????
				$selected_assets[] = $row->asset_id;
			}
		} else {
			$selected_assets = explode(",", $selected_assets);
		}
		
		//print_r($selected_assets);

		if(empty($selected_assets)){
			//no assets to update
			$total_assets = 0;
			$id = 1; //return cuccess since there was nothing to update
		
		} else {
			//update selected assets 
			$total_assets = count($selected_assets);

			//update states for all
			$create_update_date_time = date('Y-m-d H:j:s');

			$insert_status_records = array(); //batch of records to insert
			$count_assets_updated = 0;
			if(is_array($selected_assets)){

				for($i=0; $i<count($selected_assets); $i++){
					if($selected_assets[$i] == 0){
						//ignore this dummy asset_id 
					} else {
						$count_assets_updated++;
						$insert_status_records[] = array(
							'campaign_id' => $campaign_id, 
							'asset_status_id' => $new_status, 
							'asset_id' => $selected_assets[$i],
							'user_id' => $user_id, 
							'comments' => $comments, 
							'created_at' => $create_update_date_time,
							'updated_at' => $create_update_date_time
						);
					}
				}
			} else {

				foreach($selected_assets as $asset_id){
					$count_assets_updated++;
					$insert_status_records[] = array(
						'campaign_id' => $campaign_id, 
						'asset_status_id' => $new_status, 
						'asset_id' => $asset_id,
						'user_id' => $user_id, 
						'comments' => $comments, 
						'created_at' => $create_update_date_time,
						'updated_at' => $create_update_date_time
					);
				}

			}


			//print_r($insert_status_records);
			$id = $this->campaign->updateWorkflowAssetsStatuses($insert_status_records); //array of assets arrays/we use batch insert

		}
		//$count_assets_updated = ($update_all>=1)?'All Assets':$count_assets_updated;
		// Notifications/audit trail

		// Notifications
	    //System Events
	    $event_object_type = 3; //Campaign
	    $this->events->log_event($user_id, $campaign_id, date('Y-m-d H:j:s'), "Campaign Assets Statuses Updated. $count_assets_updated updated ", $event_object_type);

		if($id > 0){
			echo "success";
		} else {
			echo "error";
		}			

	}

	/*
		Workflow List of Campaigns for DataTable
	*/
	public function workflow_list_dt() {
		// Storing  request (ie, get/post) global array to a variable  
		$requestData = $_REQUEST;

		//Action buttons
		$buttons_string = "<span class='glyphicon glyphicon-map-marker'>Edit</span><span>Map</span><span>Spec</span>";

		// Columns to be displayed
		$columns = array( 
		// datatable column index  => database column name
			0 => 'cam_id', 
			1 => 'CONCAT(IF(cam_status=0,"P","C"),LPAD(cam_id, 6, "0")) AS cam_title',
			2 => 'DATE_FORMAT(cam_creation_date,"%d/%m/%y") AS cam_creation_date',
			3 => 'DATE_FORMAT(cam_requested_start_date,"%d/%m/%y") AS cam_requested_start_date',
			4 => 'DATE_FORMAT(cam_requested_end_date,"%d/%m/%y") AS cam_requested_end_date',
			5 => 'FLOOR(RAND()*(13-1)+1) as site_qty',    /* generate ranom int between 1 & 13 for this wednesday */
			6 => 'IF(cam_status=0,"Proposal","Contract") as cam_status',
			7 => 'IF(cam_status=0,"WIP","Completed") as cam_workflow',
			8 => '0.00 as cam_rental',
			9 => '0.00 as cam_commission',
			10 => '0.00 as cam_production',
			11 => 'GREATEST(ROUND(TIMESTAMPDIFF(MONTH, cam_requested_start_date, cam_requested_end_date) +
					  DATEDIFF(
					    cam_requested_end_date,
					    cam_requested_start_date + INTERVAL
					      TIMESTAMPDIFF(MONTH, cam_requested_start_date, cam_requested_end_date)
					    MONTH
					  ) /
					  DATEDIFF(
					    cam_requested_start_date + INTERVAL
					      TIMESTAMPDIFF(MONTH, cam_requested_start_date, cam_requested_end_date) + 1
					    MONTH,
					    cam_requested_start_date + INTERVAL
					      TIMESTAMPDIFF(MONTH, cam_requested_start_date, cam_requested_end_date)
					    MONTH
					  ),2),0) as cam_contract_duration',
			//12 => '"" as cam_status',
			//13 => '"" as cam_status',
			12 => '"[ED][MP][SP][DS][IN]"'	//ED-Edit, MP-MapView,SP-Spec(mini),DS-Spec(detail),IN-Invoicing
		);

		foreach ($columns as $col => $val) {
			# code...
			$columns_to_text .= "$val,";
		}
		$columns_to_text .= "0 as dummycolumn";

		//print_r($columns); 
		//echo $columns_to_text;
		//exit;
		// Getting total number records without any search
		$sql = "SELECT cam_id, cam_title, cam_creation_date ";
		$sql = "SELECT $columns_to_text ";
		$sql.=" FROM campaign";
		$result = $this->db->query($sql);
		$totalData = $result->num_rows();
		$totalFiltered = $totalData;  // when there is no search parameter then total number rows = total number filtered rows.

		//echo '<br>1 ',$this->db->last_query();exit;

		// Getting total number of records when filtered
		$sql = "SELECT cam_id, cam_title, cam_creation_date ";
		$sql = "SELECT $columns_to_text ";
		$sql.=" FROM campaign WHERE 1=1";
		
		if( !empty($requestData['search']['value']) ) {   // if there is a search parameter, $requestData['search']['value'] contains search parameter
			$sql.=" AND ( cam_id LIKE '".$requestData['search']['value']."%' ";    
			$sql.=" OR cam_title LIKE '".$requestData['search']['value']."%' ";
			$sql.=" OR cam_creation_date LIKE '".$requestData['search']['value']."%' )";
		}

		$result = $this->db->query($sql);
		$totalFiltered = $result->num_rows(); // when there is a search parameter then we have to modify total number filtered rows as per search result. 
		
		//echo '<br>2 ',$this->db->last_query();

		// Order the resultset
		//echo "before if";
		if ( !empty($requestData['order'][0]['column']) ){
			$sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		} else {
			$sql.=" ORDER BY ". $columns[0]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";
		}
		/* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc  */	
		//echo "be4 3";
		$result = $this->db->query($sql);

		//echo '<br>3 ',$this->db->last_query();

		//Action buttons
		$buttons_string = "<span class='glyphicon glyphicon-map-marker'></span><span>Map</span><span>Spec</span>";

		$data = array();

		if ($result->num_rows() > 0)
		{
		   foreach ($result->result() as $row)
		   {
			$nestedData=array(); 
			//print_r($row);
			//$nestedData[] = $row->cam_id;
			//$nestedData[] = $row->cam_title;
			//$nestedData[] = $row->cam_creation_date;
			$firstCol = true;
			foreach ($row as $cols => $value) {
				# code...
				if($firstCol){
					$firstCol = false;
					str_pad($value, 10, "0", STR_PAD_LEFT);
				}
				$nestedData[] = $value;
			}
			//$nestedData[] = $buttons_string; //add the buttons
			// Add the buttons
			//	Replace [ED] with the span and glyphicon glyphicon-edit
			$nestedData = str_replace("[ED]", "<span class='glyphicon glyphicon-edit edit_campaign' title='Edit/View Campaign'></span>&nbsp;", $nestedData);
			$nestedData = str_replace("[MP]", "<span class='glyphicon glyphicon-map-marker map_campaign' title='View on Map'></span>&nbsp;", $nestedData);
			$nestedData = str_replace("[SP]", "<span class='glyphicon glyphicon-file spec_campaign' title='View Mini Spec'></span>&nbsp;", $nestedData);
			$nestedData = str_replace("[DS]", "<span class='glyphicon glyphicon-book dspec_campaign' title='View Detailed Spec'></span>&nbsp;", $nestedData);
			$nestedData = str_replace("[IN]", "<span class='glyphicon glyphicon-usd invoice_campaign' title='Invoicing'></span>&nbsp;", $nestedData);
			$data[] = $nestedData;		      
		   }
		}

		//glyphicon-duplicate


		$json_data = array(
					"draw"            => intval( $requestData['draw'] ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
					"recordsTotal"    => intval( $totalData ),  // total number of records
					"recordsFiltered" => intval( $totalFiltered ), // total number of records after searching, if there is no searching then totalFiltered = totalData
					"data"            => $data   // total data array
					);

		echo json_encode($json_data);  // send data as json format

	}

	function do_upload(){

        $rfp_id = $this->input->post('campaign_id');
        $dot_id = $this->input->post('dot_id');
        $user_id = $this->session->userdata('user_id');

		$config['upload_path'] = './upload/workflow/'.$rfp_id; //we will upload into workflow/{rfp_id}, create it if it doesnt exist
		$config['allowed_types'] = "gif|jpg|jpeg|png";
		$config['max_size']	= "5000";
		$config['max_width']  = "1907";
		$config['max_height']  = "1280";

		$this->load->library('upload');

		$this->upload->initialize($config);

		// make sure paths exist
        if (!is_dir('upload')) {
            mkdir('./upload', 0777, true);
        }
        if (!is_dir('upload/workflow')) {
            mkdir('./upload/workflow', 0777, true);
        }        
        if (!is_dir('upload/workflow/'.$rfp_id)) {
            mkdir('./upload/workflow/'.$rfp_id, 0777, true);
        }

		$upload_result = $this->upload->do_upload('userfile');

		if ($upload_result == false) {
		        $this->upload->display_errors();
		        echo "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png|doc|docx|pdf|xls|xlsx";
		} else {

				//echo "Getting file info";
		        $file_info = $this->upload->data('userfile');
		        //file name
		        $fname = $file_info['file_name'];
		        //file path/url
		        $fpath = $file_info['file_path'].$fname;

		        $custom_base_path = str_replace("system/", "", BASEPATH);

		        $relative_path = str_replace($custom_base_path,"",$fpath);

		        $fpath1 = base_url().$relative_path;
		        //file type
		        $ftype = $file_info['file_type'];
		        //file size
		        $fsize = $file_info['file_size'];
		        $f_type = $this->assets->upload_file_type($ftype);
		        
		        echo " Uploading File: $fpath1 $fsize $fname $ftype $f_type ";

		        $img_data = array(
		            'upd_url' => $fpath1,
		            'upd_filesize' => $fsize,
		            'upd_file_name' => $fname,
		            'upd_file_type' => $ftype,
		            'use_id' => $user_id,
		            'ass_id' => 0,
		            'upt_id' => 0,
		            'fac_id' => 0,
		            'dot_id' => $dot_id,
		            'rfp_id' => $rfp_id,
		            'upd_date' => date('Y-m-d H:j:s')
		        );
		        
		        $this->db->insert('uploaded_documents', $img_data); 

				// Notifications
			    //System Events
			    $event_object_type = 3; //Campaign
			    $this->events->log_event($user_id, $campaign_id, date('Y-m-d H:j:s'), "Campaign Attachment Added <a href='$fpath1' target='_blank'>$fname</a>", $event_object_type);

		        // Return
		        echo " File upload success";

		        redirect(site_url('campaign/workflow_details/?id='.$rfp_id));
		}

	}

public function upload_campaign() {

		$image_path_base = 'uploaded_documents/campaign_assets/map_snapshots/';
		$map_path_base = 'uploaded_documents/campaign_assets/map_snapshots/';

		$user_id = $this->session->userdata('user_type');  
		$camp_id = $_GET['id'];

		$campaign = array(
			'id' => '',
			'images' => array(
			'user' => array(),
			'map' => array()
			)
		);

		if (array_key_exists('campaign_id', $_POST)) {
			$campaign['id'] = $_POST['campaign_id'];
			unset($_POST['campaign_id']);
		}

		foreach ($_POST as $key => $value) {
			list($type, $id, $desc_or_image) = explode('_', $key);
			if (!array_key_exists($id, $campaign['images'][$type])) {
				$campaign['images'][$type][$id] = array(
				    'description' => '',
				    'image_path' => ''
				);
			}
		if ($desc_or_image == 'description') {
		$campaign['images'][$type][$id]['description'] = $value;
		} else {
		//Convert the image, move it and link its url
		list($img_type, $data) = explode(';', $value);
		list(, $ext) = explode('/', $img_type);
		if (trim($ext) == '') {
		    
		}
		list(, $data) = explode(',', $data);
		$data = base64_decode($data);
		do {
		    $filename = uniqid($type . "_") . "." . $ext;
		    $full_path = $image_path_base . $filename;
		} while (file_exists($full_path));
		if (!file_put_contents($full_path, $data)) {
		    $campaign['images'][$type][$id]['image_path'] = 'Error';
		}
		$campaign['images'][$type][$id]['image_path'] = $full_path;

		if ($type == "map"):
		$dot_id =1;
		elseif ($type == "user"):
		$dot_id =2;
		endif;

		$uploaded_data = array(
		'upd_url' =>  $full_path,
		'upd_file_type' => $ext,
		'upt_id' => $img_type,
		'dot_id' => $dot_id,
		'use_id' => $user_id, 
		'rfp_id' => $camp_id
		);
		#insert into the uploaded documents table
		$this->rfp->uploadDetails($uploaded_data);

		}


		}	
    }

	public function sendMessage()
	{
		$message = new stdClass;
		$temp_message = new stdClass;
		$sendto_media_owners = array();
		$sendto_all_users = array();

		$user_id = $this->session->userdata('user_id');
		$campaign_id = $this->input->post('campaign_id');
		$sendto_media_owner = $this->input->post('send_to_media_owner');
		$sendto_advertiser = $this->input->post('send_to_advertiser');
		$attach_site_refs = $this->input->post('email_site'); 	

		$subject = $this->input->post('subject',TRUE); 
		$message = $this->input->post('message',TRUE); 

		if($sendto_media_owner == 1){
			$media_owners = $this->campaign->getCampaignMediaOwners($campaign_id);
			foreach ($media_owners as $row) {
				# code...
				$sendto_media_owners[] = $row->media_owner_id;
			}
		}
		//echo $this->db->last_query();

		if($sendto_advertiser == 1){
			$advertiser = $this->campaign->getCampaignAdvertiser($campaign_id);
			$sendto_advertiser = isset($advertiser[0]->adv_id)?$advertiser[0]->adv_id:0;
		}
		

		//Set message defaults
		/*
		echo $campaign_id;
		echo '<pre>';
		print_r($media_owners);
		print_r($advertiser);
		echo '<hr>';
		print_r($this->input->post('sendto')); echo '<hr>';
		print_r($this->input->post());
		echo '</pre>';
		//exit;
		*/
		$sendto_all_users = $this->input->post('sendto');
		if(!empty($sendto_media_owners)){
			$sendto_all_users = array_merge($sendto_all_users, $sendto_media_owners);
		}

		if($sendto_advertiser > 0){
			$sendto_all_users[] = $sendto_advertiser;
		}

		//Populate message details from posted values
		$message->sentfrom = $this->session->userdata('user_id');
		$message->sentto = $this->input->post('sendto');
		$message->subject = $this->input->post('subject',TRUE);
		$message->message = $this->input->post('message',TRUE);
		$message->datetime = $this->input->post('datetime', TRUE);
		$message->public = 0;
		$message->reply_of = 0;

		//echo is_array($message->sentto);

		//exit;
		//Send message
		//TODO: Fix this 
		//$message_id = $this->events->sendMessage($message, $temp_message, $message->reply_of);

		// Workflow Messages Record
		$workflow_message = array(
			'campaign_id'=>$campaign_id, 
			'message_id'=>$message_id, 
			'subject'=>$subject, 
			'message'=>$message, 
			'created_at'=>date('Y-m-d H:j:s'));
		
		$workflow_message_id = $this->campaign->createWorkflowMessages($workflow_message);

		// Notifications
	    //System Events
	    $event_object_type = 3; //Campaign
	    $this->events->log_event($user_id, $campaign_id, date('Y-m-d H:j:s'), "Message sent to multiple recipients", $event_object_type);

		//echo $message_id;
		//Redirect to sent messages when done
		//redirect('/messages/inbox/?sent=1', 'refresh');
		redirect(site_url('campaign/workflow_details/?id='.$campaign_id));
	}

}
