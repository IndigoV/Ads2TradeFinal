<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class password extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('user_model', 'user');
        $this->load->model('user_type_model', 'user_type');
        $this->load->model('country_model', 'country');      
        $this->load->model('user_status_model', 'user_status');
        
    }

    public function index() {
    	$this->load->view('password_reminder', null);
    }
}    