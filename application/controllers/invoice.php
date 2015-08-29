<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class invoice extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('invoices');
    }

    public function index() {

    	$data['user_id'] =  $this->session->userdata('user_id');
        $data['user_type'] =  $this->session->userdata('user_type');
        $data['invoices'] = $this->invoices->getAll($user_id);
        
        $this->layouts->view('invoices', null, $data);

    }

    public function view(){

        //get the uploaded regions

        //TODO(blessed): Get details from selected invoice
        //asset id
        /*
        $asset_id = $this->input->get('ass_id');
        
        //main asset details
        $asset_details = $this->assets->getAsset();
        foreach($asset_details as $row){
            $asset_name = $row->ass_name;
            $ass_ref = $row->ass_ref;
            $ass_description = $row->ass_description;
        }
        */
        //Setup PDF Doc details:
        //  Title 
        //  Filename
        //  Orientation
        $doc_title = 'Ads2Trade - Invoice # '.$ass_ref .' - '. $ass_description; //TODO(blessed): Get details from selected Asset
        $doc_name  = 'Auction_Invoice_'.$ass_ref;
        $doc_orientation = 'P';

        //Load HTML doc
        $data = array();
        $doc_html = $this->load->view('view_invoice', $data, true);

        //make PDF
        echo $doc_html; exit; 
        make_pdf($doc_html, $doc_name, $doc_title, $doc_orientation);

    }
}

/* End of file invoice.php */