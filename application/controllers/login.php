<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('assets');
        $this->load->model('auction');
		//For logging entries to the system events module
		//$this->load->model('sysevents_model', 'sysevents');
    }

    public function index() {
        if (!isset($is_logged_in) || $is_logged_in != true) {

            //  $message = array('error' => 'You do not have permission to access this page');
            $this->load->view('login', null);
            //redirect('../');
            //redirect(base_url());exit;
        }
    }

    public function register(){
        $this->load->view('register', null);
    }
  /*
	private function log_event($user, $object_id, $event_date, $event_datails){
		$event = new stdClass;
		$event->event_type = 5; //User related event
		$event->event_user = $user;
		$event->event_object_id = $object_id; //same as event user in this case but differs in other modules
		$event->event_date = $event_date;
		$event->event_details = $event_datails;
		$this->sysevents->save($event);		
	}
	 */
    public function logout() {
		
		//Log this event to system events
		//log_event($this->session->userdata('user_id'), $this->session->userdata('user_id'), date('Y-m-d H:j:s'), "User logged out successfully");
		
		$this->events->log_event($this->session->userdata('user_id'), $this->session->userdata('user_id'), date('Y-m-d H:j:s'), "User logged out successfully");
		
        $this->session->unset_userdata('all_session_data');
        $this->session->unset_userdata('user_id');
        $this->session->unset_userdata('use_id');
        $this->session->unset_userdata('school_id');
        $this->session->unset_userdata('user_type');
        $this->session->sess_destroy();
        redirect('../');
        //$this->load->view('login', null);
    }

    public function validate_credentials() {

        $this->load->model('user');
        $result = $this->user->getLoginDetails();


        if ($result) {//if the user credentials are valid
            //GET USER TYPE
            //echo 'baba'; exit;
            $user_type = $result[0]->ust_id;

            $data = array();

            //temporary code to implement ACL
            switch ($user_type) {

                case 1://advertiser login

                    $user_session_data = array(
                        'username' => $this->input->post('username'),
                        'is_logged_in' => TRUE,
                        'user_id' => $result[0]->use_id,
                        'use_id' => $result[0]->use_id,
                        'user_type' => $result[0]->ust_id,
                        'user_photo' => $result[0]->use_photo
                    );

                    $user_type = $this->session->userdata('user_type');

                    $all_session_data = array_merge($user_session_data, $result);
                    $this->session->set_userdata($all_session_data);
                    $user_id = $this->session->userdata('user_id');
                    $user_id = $this->session->userdata('user_id');
                    //Log this event to system events
					$this->events->log_event($user_id, $user_id, date('Y-m-d H:j:s'), "Advertiser ". $this->input->post('username'). " logged in successfully");

                    $this->get_dashboard_figures();

					$this->layouts->view('index', null);
                    break;
                case 2://media owner login
                    $user_session_data = array(
                        'username' => $this->input->post('username'),
                        'is_logged_in' => TRUE,
                        'user_id' => $result[0]->use_id,
                        'use_id' => $result[0]->use_id,
                        //'school_id' => $result[0]->sch_id,
                        'user_type' => $result[0]->ust_id,
                        'user_photo' => $result[0]->use_photo
                    );

                    $user_type = $this->session->userdata('user_type');

                    $all_session_data = array_merge($user_session_data, $result);
                    //echo '<pre>',print_r($all_session_data),'</pre>';exit;
                    $this->session->set_userdata($all_session_data);

                    $user_id = $this->session->userdata('user_id');

                    //echo  "this is the student login"; exit;
                    $user_id = $this->session->userdata('user_id');
                    //echo $user_id;exit();

					//Log this event to system events
					$this->events->log_event($user_id, $user_id, date('Y-m-d H:j:s'), "Media Owner ". $this->input->post('username'). " logged in successfully");

                    $this->get_dashboard_figures();

                    // $this->layouts->view('media_owner_dashboard', null);
                    $this->layouts->view('index_media', null, array_merge($data));

                    break;
               

                case 3://operator login

                    $user_session_data = array(
                        'username' => $this->input->post('username'),
                        'is_logged_in' => TRUE,
                        'user_id' => $result[0]->use_id,
                        'use_id' => $result[0]->use_id,
                        //'school_id' => $result[0]->sch_id,
                        'user_type' => $result[0]->ust_id,
                        'user_photo' => $result[0]->use_photo
                    );

                    $user_type = $this->session->userdata('user_type');

                    $all_session_data = array_merge($user_session_data, $result);
                    //echo '<pre>',print_r($all_session_data),'</pre>';exit;
                    $this->session->set_userdata($all_session_data);

                    $user_id = $this->session->userdata('user_id');

                    //echo  "this is the student login"; exit;
                    $user_id = $this->session->userdata('user_id');
                    //echo $user_id;exit();

					//Log this event to system events
					$this->events->log_event($this, $user_id, $user_id, date('Y-m-d H:j:s'), "Operator ". $this->input->post('username'). " logged in successfully");
					
                    $this->get_dashboard_figures();

                    // $this->layouts->view('operator_dashboard', null);
                    $this->layouts->view('index_operator', null);
                    break;
               

                default:

					//Log this event to system events
					$this->events->log_event($user_id, $user_id, date('Y-m-d H:j:s'), "Unknown user  ". $this->input->post('username'). " failed to login: " . htmlspecialchars(var_dump($result)));
					
                    $this->session->unset_userdata('all_session_data');
                    redirect(base_url());
                    break;
            }
        } else {

            //exit;
            // $message = array('error' => 'You do not have permission to access this page');

            redirect(base_url());
        }
    }
    

    public function register_user() {
        $this->load->view('register_user');
    }

    public function is_logged_in() {
        $is_logged_in = $this->session->userdata('is_logged_in');
        if (!isset($is_logged_in) || $is_logged_in != TRUE) {
            $message = array('error' => 'You do not have permission to access this page');
            $this->load->view('login', null);
        }
    }

    public function get_dashboard_figures(){

        global $data;

        //Get Dashboard figures
        // 1) Assets
        $allAssets = $this->assets->getAllAsset($user_id);
        //$data['allAssets'] = $allAssets;
        $data['allAssetsCount'] = count($allAssets);

        foreach ($allAssets as $row ) {
        # Add Acquisition Cost only if it is > 0
        $allAssetsValue += ($row->ass_acquisition_cost>0)?$row->ass_acquisition_cost:0;
        }
        $data['allAssetsValue'] = $allAssetsValue;

        // 2) Bids
        $allBids = $this->auction->allUserBids($user_id);
        $data['allBids'] = $allBids;
        $data['allBidsCount'] = count($allBids);
        $allBidsValue = 0;
        foreach ($allBids as $row ) {
        # Add Bid amount if it is > 0
        $allBidsValue += ($row->bid>0)?$row->bid:0;
        }
        $data['allBidsValue'] = $allBidsValue;

        // 3) Auctions

        $allAuctions = $this->auction->allUserAuctions($user_id);//var_dump($allAuctions); exit;
        $data['allAuctions'] = $allAuctions;
        $data['allAuctionsCount'] = count($allAuctions);
        $allAuctionsValue = 0;
        $bid_count = 0;
        foreach ($allAuctions as $row ) {
        # Add Auction amount if it is > 0
        $allAuctionsValue += ($row->bid>0)?$row->bid:0;
        if($row->bid != null){
        $bid_count += 1;  
        }
        }
        $data['allAuctionsValue'] = $allAuctionsValue;

        // 4) RFP/Campaign Summaries (** Josh **)

        $allRFPs = array();//var_dump($allAuctions); exit;
        $data['allRFPs'] = $allBids;
        $data['allRFPsCount'] = count($allRFPs);
        $allRFPsValue = 0;
        foreach ($allRFPs as $row ) {
        # Add RFP amount if it is > 0
        $allRFPsValue += ($row->amount>0)?$row->amount:0;
        }
        $data['allRFPsValue'] = $allRFPsValue;


        // 5) Invoices (updaid)

        $allInvoices = $this->auction->allUserInvoices($user_id);//var_dump($allAuctions); exit;
        $data['allInvoices'] = $allInvoices;
        $data['allInvoicesCount'] = count($allInvoices);
        $allInvoicesValue = 0;
        foreach ($allInvoices as $row ) {
        # Add Invoice amount if it is > 0
        $allInvoicesValue += ($row->amount>0)?$row->amount:0;
        }
        $data['allInvoicesValue'] = $allInvoicesValue;

        $user_dashboard_data = array(
        'allAssetsCount' => count($allAssets),
        'allAssetsValue' => $allAssetsValue,
        'allAuctionsCount' => count($allAuctions),
        'allAuctionsValue' => $allAuctionsValue,
        'auBidCount' => $bid_count,
        'auLatestBid' => $allAuctions[0]->bid,
        'allBidsCount' => count($allBids),
        'allBidsValue' => $allBidsValue,
        'bdLatestBid' => $allBids[0]->bid,
        'allInvoicesCount' => count($allInvoices),
        'allInvoicesValue' => $allInvoicesValue,
        );

        $this->session->set_userdata($user_dashboard_data);

    }

}