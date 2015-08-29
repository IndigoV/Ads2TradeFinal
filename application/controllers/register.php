<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Register extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('user_model', 'user');
        $this->load->model('user_type_model', 'user_type');
        $this->load->model('country_model', 'country');      
        $this->load->model('user_status_model', 'user_status');
        
    }

    public function index() {
        
        $action = $this->input->post('action');

        //maybe create a new user
        if($action == 'register'){
            
            $user = array();

            //get form data and create the new user
            $user['use_company_name'] = $this->input->post('company_name');
            $user['use_mobile_number'] = $this->input->post('mobile_number');
            $user['email'] = $this->input->post('email');
            $user['ust_id'] = $this->input->post('account_type');
            $user['password'] = $this->generatePassword();

        }

    	$this->load->view('register', null);

    }
}    