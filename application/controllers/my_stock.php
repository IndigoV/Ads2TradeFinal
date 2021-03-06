<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class my_stock extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('province');
        $this->load->model('town');
        $this->load->model('asset_type');
        $this->load->model('assets','assssssetsi');
        $this->load->library('googlemaps');
        $this->load->model('duration');
        $this->load->model('auction');
        
        
    }

    public function index() {
        //take points from db
        $data = array();
        $data1 = array();
        $data1['mmm'] = $this->assssssetsi->getMyAsset();
        $provinces['my_provinces'] = $this->province->getRegions();
        ////get the uploaded towns
       $towns['my_towns'] = $this->town->getTowns();
        ////get asset_types
        $asset_types['may_asset_types'] = $this->asset_type->getAssetType();
       ////var_dump($provinces);exit;     
       $durations['durations'] = $this->duration->getDudarion();
        //// var_dump($durations);exit; 
       
        $this->load->library('googlemaps');
        $a = 0;
       foreach ($data1['mmm'] as $row) {
       $a = $a + 1;
            // Map One
            $mapname = 'map_'.$a;    
            $mapcanv = 'map_canvas'.$a;
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
        $user_type = $this->session->userdata('user_type'); 
         switch ($user_type) {

                case 1://advertiser login   
                $this->layouts->view('auction_dashboard', null);
                    break;
                case 2:       
               $this->layouts->view('my_stock',null, array_merge($data,$data1,$provinces, $towns, $asset_types,$durations));
                 break;
               case 3:       
                 $this->layouts->view('stock',null, array_merge($data,$data1,$provinces, $towns, $asset_types,$durations));
                 break;
                
       }
      }

    
    public function op_index($result="") {
        //take points from db
        $data = array();
        $data1 = array(); //echo " ext out "; exit;
        $data1['result'] = $result;
        $data1['mmm'] = $this->assssssetsi->getMyAsset_op();
        
        $provinces['my_provinces'] = $this->province->getRegions();
        ////get the uploaded towns
        $towns['my_towns'] = $this->town->getTowns();
        ////get asset_types
        $asset_types['may_asset_types'] = $this->asset_type->getAssetType();
        $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
        $asset_master['may_asset_master'] = $this->asset_type->getMasterType();        
        ////var_dump($provinces);exit;     
        $durations['durations'] = $this->duration->getDudarion();
        //// var_dump($durations);exit; 

        $post_criteria = array(
            'filter_criteria' => $_POST
        );

        $this->load->library('googlemaps');
        $a = 0;
        foreach ($data1['mmm'] as $row) {
            $a = $a + 1;
            // Map One
            $mapname = 'map_'.$a;    
            $mapcanv = 'map_canvas'.$a;
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

        $user_type = $this->session->userdata('user_type'); 

        $this->layouts->view('stock',
            null, 
            array_merge($asset_family, $asset_master, $asset_types, 
                $data, $data1, $provinces, $towns, 
                $durations, $post_criteria));

    }   
      
     public function op_index_remove($result="") {
        //take points from db
        $data = array();
        $data1 = array(); //echo " ext out "; exit;

        $user = $this->session->userdata('user_id');
        $user_type = $this->session->userdata('user_type');

        $data1['result'] = $result;
        $remove_only = 1; //only items to be removed from auction that are elligible i.e. no bids yet or not yet approved
        $data1['mmm'] = $this->assssssetsi->getMyAsset_op($remove_only);
        
        $provinces['my_provinces'] = $this->province->getRegions();
        ////get the uploaded towns
        $towns['my_towns'] = $this->town->getTowns();
        ////get asset_types
        $asset_types['may_asset_types'] = $this->asset_type->getAssetType();
        $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
        $asset_master['may_asset_master'] = $this->asset_type->getMasterType();        
        ////var_dump($provinces);exit;     
        $durations['durations'] = $this->duration->getDudarion();
        //// var_dump($durations);exit; 

        $post_criteria = array(
            'filter_criteria' => $_POST
        );

        $this->load->library('googlemaps');
        $a = 0;
        foreach ($data1['mmm'] as $row) {
            $a = $a + 1;
            // Map One
            $mapname = 'map_'.$a;    
            $mapcanv = 'map_canvas'.$a;
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

        $user_type = $this->session->userdata('user_type'); 

        $this->layouts->view('stock_remove',
            null, 
            array_merge($asset_family, $asset_master, $asset_types, 
                $data, $data1, $provinces, $towns, 
                $durations, $post_criteria));

    }   
           

    public function asset() {
        $data = array();
        $data1 = array();
        $this->load->library('googlemaps');
        $data1['mmm'] = $this->assssssetsi->getAsset();
        $asset_types['asset_types'] = $this->asset_type->getAssetType();
        $durations['durations'] = $this->duration->getDudarion();
        
        foreach ($data1['mmm'] as $row) {
        $config['center'] = $row->position;
        $config['zoom'] = 9;
        $config['map_name'] = 'map';
        $config['map_div_id'] = 'map_canvas';
        $this->googlemaps->initialize($config);
        
        $marker = array();
        $marker['position'] = $row->position;
        $marker['infowindow_content'] = $row->ass_name;
        $this->googlemaps->add_marker($marker);
        }
        $data['map'] = $this->googlemaps->create_map();
        //select existing Asset Details
        $user_type = $this->session->userdata('user_type'); 
  
                $this->layouts->view('my_stock_details', null, array_merge($data,$data1,$asset_types,$durations) );
               
      
         
    }

    public function op_asset() {
        $data = array();
        $data1 = array();
        $this->load->library('googlemaps');
        $data1['mmm'] = $this->assssssetsi->getAsset();
        $asset_types['asset_types'] = $this->asset_type->getAssetType();
        $durations['durations'] = $this->duration->getDudarion();
        
        foreach ($data1['mmm'] as $row) {
        $config['center'] = $row->position;
        $config['zoom'] = 9;
        $config['map_name'] = 'map';
        $config['map_div_id'] = 'map_canvas';
        $this->googlemaps->initialize($config);
        
        $marker = array();
        $marker['position'] = $row->position;
        $marker['infowindow_content'] = $row->ass_name;
        $this->googlemaps->add_marker($marker);
        }
        $data['map'] = $this->googlemaps->create_map();
        //select existing Asset Details
        $user_type = $this->session->userdata('user_type'); 

        $this->layouts->view('stock_details', null, array_merge($data,$data1,$asset_types,$durations) );
         
    }

    public function approve(){
        $this->auction->approve_auction();
          
        //$this->layouts->view('record_created',null);
        $result = isset($_REQUEST['approve'])?"Auction Approved":"Auction Declined";
        $this->op_index($result);
    }
 
    public function delete(){
        $delete_this_auction = 1;
        $this->auction->approve_auction($delete_this_auction);
          
        //$this->layouts->view('record_created',null);
        $result = isset($_REQUEST['delete'])?"Auction Deleted":"Auction Deleted";
        $this->op_index_remove($result);
    }

    public function add_all(){
        $this->auction->add_all_auction();
          
        //$this->layouts->view('record_created',null);
        $result = "The selected auctions have been approved";
        $this->op_index($result);        
    }
    
    public function remove_all(){
        $this->auction->remove_all_auction();
          
        //$this->layouts->view('record_created',null);
        $result = "The selected auctions have been declined";
        $this->op_index($result);         
    }
  
    public function delete_all(){
        $delete_auctions_for_user = 1;
        $this->auction->remove_all_auction($delete_auctions_for_user);
          
        //$this->layouts->view('record_created',null);
        $result = "The selected auctions have been deleted";
        $this->op_index_remove($result);         
    }  
    
    public function auction(){
        $this->auction->create_auction();
          
        $this->layouts->view('record_created',null);
    }
   
}

