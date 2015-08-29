<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class our_ajax extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('assets','assssssetsi1');
        $this->load->model('province');
        $this->load->model('town');
        $this->load->model('asset_type');
        $this->load->library('googlemaps');
        $this->load->model('duration');
    }

    public function index() {
       
        error_reporting(0);

        if($_POST["action"]=="get_asset_details"){ ?>


          <div id="dialog_content"><form>
                    
                    <div class="Faces">
                        <div class="col-xs-4">
                            <input type="radio" name="face" checked="checked" id="fa" class="dbfl">
                            <label for="fa" class="dbfl">Face A</label>
                        </div>
                        <div class="col-xs-6">
                            <input type="radio" name="face" id="fb" class="dbfl">
                            <label  for="fb" class="dbfl">Face B</label>
                        </div>
                    </div>
                    
                    <div class="face_a_content">
                        <div class="btn-group tabs_wrap">
                            <a href="#" class="btn btn-default active" id="basic">Basic Info</a>
                            <a href="#" class="btn btn-default" id="production">Production Info</a>
                            <a href="#" class="btn btn-default" id="rate">Rate Info</a>            
                        </div>

                        <div class="tab_content active" id="basic">
                            <label>Title</label>
                            <input type="text" name="title" class="form-control">
                            <label>Media Type</label>
                            <select name="title" class="form-control">
                                <option value="Billboards">Billboards</option>
                                <option value="Billboards">Billboards</option>
                                <option value="Billboards">Billboards</option>
                                <option value="Billboards">Billboards</option>            
                            </select>
                            <label>Description</label>
                            <textarea type="text" name="title" class="form-control"></textarea>
                            <input type="hidden" name="action" value="add_new_asset" >
                            
                        </div>
                        <div class="tab_content" id="production">
                            Product Content
                        </div>
                        <div class="tab_content" id="rate">
                            Rate Content
                        </div>
                    </div>
                    
                    <div class="face_b_content dn">
                        <div class="btn-group tabs_wrap">
                            <a href="#" class="btn btn-default active" id="basic">Basic Info</a>
                            <a href="#" class="btn btn-default" id="production">Production Info</a>
                            <a href="#" class="btn btn-default" id="rate">Rate Info</a>            
                        </div>

                        <div class="tab_content active" id="basic">
                            <label>Title</label>
                            <input type="text" name="title" class="form-control">
                            <label>Media Type</label>
                            <select name="title" class="form-control">
                                <option value="Billboards">Billboards</option>
                                <option value="Billboards">Billboards</option>
                                <option value="Billboards">Billboards</option>
                                <option value="Billboards">Billboards</option>            
                            </select>
                            <label>Description</label>
                            <textarea type="text" name="title" class="form-control"></textarea>
                            <input type="hidden" name="action" value="add_new_asset" >
                            
                        </div>
                        <div class="tab_content" id="production">
                            Product Content Face B
                        </div>
                        <div class="tab_content" id="rate">
                            Rate Content Face B
                        </div>
                    </div>

                    <div class="buttons_wrap">
                        <input type="hidden" class="form-control latlong" name="position"  value="" >
                        <a href="#" class="save_new_asset btn btn-primary">Save Asset</a>
                        <a href="#" class="delete_new_asset btn btn-primary">Delete Asset</a>
                    </div><br>
                </form></div>
            <div class="clear"></div>
        <?php } 


        if($_POST["action"]=="add_new_asset"){
          //use position as the unique ID 
            //$parentage_data = $this->input->post('position');

            $ass_is_mall = $this->input->post('ass_is_mall');
            if(is_null($ass_is_mall) || $ass_is_mall == ''){
                $ass_is_mall = 0;
            } else {
                $ass_is_mall = 1;
            }

            $asset_or_mall_id = $this->assssssetsi1->addAsset();
            unset($_POST["action"]);    
            if($ass_is_mall == 1 && $asset_or_mall_id > 0){
                //redirect to malls page
                //redirect("malls/mall/$asset_or_mall_id",'refresh'); 
                echo $asset_or_mall_id;
            } else {
                echo $asset_or_mall_id; //return the asset id to calling page
            }
        }

        if($_POST["action"]=="save_exist_asset"){ 
          //use position as the unique ID
            //TODO: save asset details + mall details 
        }

        if($_POST["action"]=="delete_asset"){ 
          //use position as the unique ID
        }

        if($_POST["action"]=="table_data"){ 
          //use position as the unique ID
          //redirect('load_stock');
        }

    }

    function do_upload(){
        
        $config['upload_path'] = './upload/asset_photos';
		$config['allowed_types'] = "gif|jpg|jpeg|png";
		$config['max_size']	= "5000";
		$config['max_width']  = "1907";
		$config['max_height']  = "1280";

		$this->load->library('upload', $config);

        if (!$this->upload->do_upload())
		{       
                        $failure_message = $this->upload->display_errors();
                        $return_messages = array('success' => $failure_message); 
                        //get the uploaded regions
                        $provinces['my_provinces'] = $this->province->getRegions();
                        //get the uploaded towns
                        $towns['my_towns'] = $this->town->getTowns();
                        //get asset_types
                        $asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                        
                        $this->layouts->view('upload_stock', null, array_merge(
                        $provinces, $towns, $asset_types,$return_messages 
                        ));
			
		} else {
			
            $return_messages = array('success' => 'Photo was added');
                        //getting a file name and path to add to database
                        $image_data = $this->upload->data();
                        $fname=$image_data['file_name'];
                        $fpath=$image_data['file_path'].$fname;
                        
                        $ass_id = $this->assssssetsi->getAssId();
                        
                        $this->assssssetsi->insertFile($fpath, $ass_id);
                        
                        //get the uploaded regions
                        $provinces['my_provinces'] = $this->province->getRegions();
                        //get the uploaded towns
                        $towns['my_towns'] = $this->town->getTowns();
                        //get asset_types
                        $asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                        //var_dump($provinces);exit;
                        $this->layouts->view('upload_stock', null, array_merge(
                        $provinces, $towns, $asset_types,$return_messages 
                        ));
                }
                
        
    }
}

   
        
    