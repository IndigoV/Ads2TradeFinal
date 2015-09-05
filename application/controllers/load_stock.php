<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

error_reporting(E_ALL);
ini_set("error_reporting", E_ALL);

class load_stock extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('province');
		$this->load->model('town');
		$this->load->model('asset_type');
		$this->load->model('assets','assets');
		$this->load->model('upload');
		$this->load->model('asset'); 
		$this->load->library('googlemaps');
		$this->load->library('datatables');
		$this->load->model('duration');
		$this->load->model('media_category'); /* for load stock compatibility*/
		$this->load->model('auction');
		$this->load->model('ajax_asset');
		$this->load->model('bids');
        $this->load->model('user');
        $this->load->model('uploaded_documents');
        $this->load->model('dashboard'); //for auctions bids/watches totals
        $this->form_validation->set_error_delimiters('<div class="error">', '</div>');

	}

    public function index() {
        
		/*$media_cat = $_POST['media_category'];
		$media_type = $_POST['media_type'];
		$auction_status = $_POST['auction_status'];
		$active_not_active = $_POST['activeNotActive'];
		$media_status = $_POST['media_stauts'];*/
		
        $data = array();
        $type = $this->input->get('type');

        $data['mmm'] = $this->assets->getAssetDetails();			//not using assets1 anymore
        $data['durations'] = $this->duration->getDudarion();

        $user_id = $this->session->userdata('user_id'); 
        $media_category['media_category'] = $this->media_category->getMediaCat();
        $asset['asset'] = $this->assets->getAssetByuserId($user_id);	
        $med['med'] = $this->assets->getMediaCat();
        
        //$data1['mmm'] = $this->assets->getAssetDetails1(); 
        $data1['mmm'] = $this->assets->getAssetDetails1_loadasset(); //renamed from getAssetDetails1()
        $this->load->library('googlemaps');
        $count = 0;
        //echo "<pre>";
        //print_r($data['mmm']);exit;
        foreach ($data1['mmm'] as $row) {
	        if ($count == 0){    
		        $config['center'] = $row->position;
		        $config['zoom'] = 'auto';
		        $config['places'] = TRUE;
		        $config['placesAutocompleteInputID'] = 'myPlaceTextBox';
		        $config['placesAutocompleteBoundsMap'] = TRUE; // set results biased towards the maps viewport
		        $config['placesAutocompleteOnChange'] = '
					var geocoder = new google.maps.Geocoder();
					        var address = document.getElementById("location").value;
					        geocoder.geocode({ "address": address }, function (results, status) {
					            if (status == google.maps.GeocoderStatus.OK) {
					                if(typeof marker != "undefined"){marker.setMap(null)};
					                $("#location").parent().removeClass("has-error");
					                var latitude = results[0].geometry.location.lat();
					                var longitude = results[0].geometry.location.lng();
					                $("#latitude").val(latitude);
					                $("#longitude").val(longitude);
					                 marker = new google.maps.Marker({
					map:map,
					draggable:true,
					animation: google.maps.Animation.DROP,
					position: new google.maps.LatLng(latitude, longitude)
					});
					map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
					map.setZoom(9);
					google.maps.event.addListener(marker, "dragend", function (event) {
					latitude = this.getPosition().lat();
					longitude = this.getPosition().lng();
					$("#latitude").val(latitude);
					$("#longitude").val(longitude);
					});
					            } else {
					                alert("Request failed.")
					                $("#location").parent().addClass("has-error");
					            }
					        });

					';
		        $config['cluster'] = TRUE;
		        $this->googlemaps->initialize($config);
		        $count = $count + 1;
        	}

	        $marker = array();
	        $marker['position'] = $row->position;
	        $marker['infowindow_content'] = '</div><div style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden;" tabindex="-1" id="PhotoSheetMap">
	        <div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 200;"><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div></div><div style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 201;"><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 28px; top: -105px;"><canvas width="256" height="256" style="-moz-user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;" draggable="false"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 28px; top: 151px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -228px; top: -105px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -228px; top: 151px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 284px; top: -105px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 284px; top: 151px;"></div></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 202;"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: -105px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: 151px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: -105px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: 151px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: -105px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: 151px;"></div></div></div></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><div style="overflow: hidden; width: 425px; height: 150px;"><img src="http://maps.googleapis.com/maps/api/js/StaticMapService.GetMapImage?1m2&amp;1i507364&amp;2i812905&amp;2e1&amp;3u13&amp;4m2&amp;1u425&amp;2u150&amp;5m4&amp;1e0&amp;5sen-US&amp;6sus&amp;10b1&amp;token=59781" style="width: 425px; height: 150px;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: -105px;"><img draggable="false" src="http://mt0.googleapis.com/vt?lyrs=m@271288050&amp;src=apiv3&amp;hl=en-US&amp;x=1982&amp;y=3175&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: 151px;"><img draggable="false" src="http://mt0.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1982&amp;y=3176&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: -105px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1981&amp;y=3175&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: 151px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1981&amp;y=3176&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: -105px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271288050&amp;src=apiv3&amp;hl=en-US&amp;x=1983&amp;y=3175&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: 151px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1983&amp;y=3176&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div></div></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a title="Click to see this area on Google Maps" href="http://maps.google.com/maps?ll=37.4503,-92.86871&amp;z=13&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3" target="_blank" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 62px; height: 26px; cursor: pointer;"><img draggable="false" src="http://maps.gstatic.com/mapfiles/api-3/images/google_white2.png" style="position: absolute; left: 0px; top: 0px; width: 62px; height: 26px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div></a></div><div style="z-index: 1000001; position: absolute; right: 269px; bottom: 0px; width: 55px;" class="gmnoprint"><div class="gm-style-cc" style="-moz-user-select: none;" draggable="false"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer;">Map Data</a><span style="display: none;">Map data ©2014 Google</span></div></div></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto,Arial,sans-serif; color: rgb(34, 34, 34); box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2); z-index: 10000002; display: none; width: 256px; height: 108px; position: absolute; left: 63px; top: 5px;"><div style="padding: 0px 0px 10px; font-size: 16px;">Map Data</div><div style="font-size: 13px;">Map data ©2014 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img draggable="false" src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt3.png" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div></div><div style="position: absolute; right: 0px; bottom: 0px;" class="gmnoscreen"><div style="font-family: Roboto,Arial,sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2014 Google</div></div><div draggable="false" style="z-index: 1000001; position: absolute; -moz-user-select: none; right: 96px; bottom: 0px;" class="gmnoprint gm-style-cc"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a target="_blank" href="http://www.google.com/intl/en-US_US/help/terms_maps.html" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms of Use</a></div></div><div class="gm-style-cc" style="-moz-user-select: none; position: absolute; right: 0px; bottom: 0px;" draggable="false"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a href="http://maps.google.com/maps?ll=37.4503,-92.86871&amp;z=13&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3&amp;skstate=action:mps_dialog$apiref:1&amp;output=classic" style="font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;" title="Report errors in the road map or imagery to Google" target="_new">Report a map error</a></div></div><div class="gm-style-cc" style="-moz-user-select: none; position: absolute; right: 167px; bottom: 0px;" draggable="false"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><span>1 km&nbsp;</span><div style="position: relative; display: inline-block; height: 8px; bottom: -1px; width: 66px;"><div style="width: 100%; height: 4px; position: absolute; background-color: rgb(255, 255, 255); bottom: 0px; left: 0px;"></div><div style="position: absolute; left: 0px; top: 0px; width: 4px; height: 8px; background-color: rgb(255, 255, 255);"></div><div style="width: 4px; height: 8px; position: absolute; background-color: rgb(255, 255, 255); bottom: 0px; right: 0px;"></div><div style="position: absolute; background-color: rgb(102, 102, 102); height: 2px; bottom: 1px; right: 1px; left: 1px;"></div><div style="position: absolute; left: 1px; top: 1px; width: 2px; height: 6px; background-color: rgb(102, 102, 102);"></div><div style="width: 2px; height: 6px; position: absolute; background-color: rgb(102, 102, 102); bottom: 1px; right: 1px;"></div></div></div></div></div></div></div><div class="clear"></div><div id="PanelInfoTable" class="InfoTable"><table><tbody><tr><td class="popupLabelText">Panel:</td><td class="popupText">89012</td><div><table><tbody><tr><td><div><img height="80px" width="150px" src="../../assets/add1.jpg"></div></td><td> <div></div></td></tr></tbody></table></div>';
	        $this->googlemaps->add_marker($marker);

        }
        
        //print_r($this->googlemaps);exit;
		
        $this->layouts->view('auction/load_stock4',null, array_merge($data,
                $media_category,
                $asset,
                $med),
        		false); //use the auctions header/footers
    }

    public function index44() {
        
        $data = array();
        $data['mmm'] = $this->assets->getAssetDetails();			//not using assets1 anymore

        $data['durations'] = $this->duration->getDudarion();

        $user_id = $this->session->userdata('user_id'); 
        $media_category['media_category'] = $this->media_category->getMediaCat();
        $asset['asset'] = $this->assets->getAssetByuserId(5);	
        $med['med'] = $this->assets->getMediaCat();
        
        //$data1['mmm'] = $this->assets->getAssetDetails1(); 
        $data1['mmm'] = $this->assets->getAssetDetails1_loadasset(); //renamed from getAssetDetails1()
        $this->load->library('googlemaps');
        $count = 0;
        //echo "<pre>";
        //print_r($data['mmm']);exit;
        foreach ($data1['mmm'] as $row) {
	        if ($count == 0){    
		        $config['center'] = $row->position;
		        $config['zoom'] = 'auto';
		        $config['places'] = TRUE;
		        $config['placesAutocompleteInputID'] = 'myPlaceTextBox';
		        $config['placesAutocompleteBoundsMap'] = TRUE; // set results biased towards the maps viewport
		        $config['placesAutocompleteOnChange'] = '
					var geocoder = new google.maps.Geocoder();
					        var address = document.getElementById("location").value;
					        geocoder.geocode({ "address": address }, function (results, status) {
					            if (status == google.maps.GeocoderStatus.OK) {
					                if(typeof marker != "undefined"){marker.setMap(null)};
					                $("#location").parent().removeClass("has-error");
					                var latitude = results[0].geometry.location.lat();
					                var longitude = results[0].geometry.location.lng();
					                $("#latitude").val(latitude);
					                $("#longitude").val(longitude);
					                 marker = new google.maps.Marker({
					map:map,
					draggable:true,
					animation: google.maps.Animation.DROP,
					position: new google.maps.LatLng(latitude, longitude)
					});
					map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
					map.setZoom(9);
					google.maps.event.addListener(marker, "dragend", function (event) {
					latitude = this.getPosition().lat();
					longitude = this.getPosition().lng();
					$("#latitude").val(latitude);
					$("#longitude").val(longitude);
					});
					            } else {
					                alert("Request failed.")
					                $("#location").parent().addClass("has-error");
					            }
					        });

					';
		        $config['cluster'] = TRUE;
		        $this->googlemaps->initialize($config);
		        $count = $count + 1;
        	}

	        $marker = array();
	        $marker['position'] = $row->position;
	        $marker['infowindow_content'] = '</div><div style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden;" tabindex="-1" id="PhotoSheetMap">
	        <div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 200;"><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div></div><div style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 201;"><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 28px; top: -105px;"><canvas width="256" height="256" style="-moz-user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;" draggable="false"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 28px; top: 151px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -228px; top: -105px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -228px; top: 151px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 284px; top: -105px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 284px; top: 151px;"></div></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 202;"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: -105px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: 151px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: -105px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: 151px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: -105px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: 151px;"></div></div></div></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><div style="overflow: hidden; width: 425px; height: 150px;"><img src="http://maps.googleapis.com/maps/api/js/StaticMapService.GetMapImage?1m2&amp;1i507364&amp;2i812905&amp;2e1&amp;3u13&amp;4m2&amp;1u425&amp;2u150&amp;5m4&amp;1e0&amp;5sen-US&amp;6sus&amp;10b1&amp;token=59781" style="width: 425px; height: 150px;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1;"><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: -105px;"><img draggable="false" src="http://mt0.googleapis.com/vt?lyrs=m@271288050&amp;src=apiv3&amp;hl=en-US&amp;x=1982&amp;y=3175&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 28px; top: 151px;"><img draggable="false" src="http://mt0.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1982&amp;y=3176&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: -105px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1981&amp;y=3175&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -228px; top: 151px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1981&amp;y=3176&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: -105px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271288050&amp;src=apiv3&amp;hl=en-US&amp;x=1983&amp;y=3175&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 284px; top: 151px;"><img draggable="false" src="http://mt1.googleapis.com/vt?lyrs=m@271000000&amp;src=apiv3&amp;hl=en-US&amp;x=1983&amp;y=3176&amp;z=13&amp;apistyle=s.t%3A33%7Cs.e%3Al%7Cp.v%3Aoff&amp;style=47,37%7Csmartmaps" style="width: 256px; height: 256px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div></div></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a title="Click to see this area on Google Maps" href="http://maps.google.com/maps?ll=37.4503,-92.86871&amp;z=13&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3" target="_blank" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 62px; height: 26px; cursor: pointer;"><img draggable="false" src="http://maps.gstatic.com/mapfiles/api-3/images/google_white2.png" style="position: absolute; left: 0px; top: 0px; width: 62px; height: 26px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div></a></div><div style="z-index: 1000001; position: absolute; right: 269px; bottom: 0px; width: 55px;" class="gmnoprint"><div class="gm-style-cc" style="-moz-user-select: none;" draggable="false"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer;">Map Data</a><span style="display: none;">Map data ©2014 Google</span></div></div></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto,Arial,sans-serif; color: rgb(34, 34, 34); box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2); z-index: 10000002; display: none; width: 256px; height: 108px; position: absolute; left: 63px; top: 5px;"><div style="padding: 0px 0px 10px; font-size: 16px;">Map Data</div><div style="font-size: 13px;">Map data ©2014 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img draggable="false" src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt3.png" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px;"></div></div><div style="position: absolute; right: 0px; bottom: 0px;" class="gmnoscreen"><div style="font-family: Roboto,Arial,sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2014 Google</div></div><div draggable="false" style="z-index: 1000001; position: absolute; -moz-user-select: none; right: 96px; bottom: 0px;" class="gmnoprint gm-style-cc"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a target="_blank" href="http://www.google.com/intl/en-US_US/help/terms_maps.html" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms of Use</a></div></div><div class="gm-style-cc" style="-moz-user-select: none; position: absolute; right: 0px; bottom: 0px;" draggable="false"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><a href="http://maps.google.com/maps?ll=37.4503,-92.86871&amp;z=13&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3&amp;skstate=action:mps_dialog$apiref:1&amp;output=classic" style="font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;" title="Report errors in the road map or imagery to Google" target="_new">Report a map error</a></div></div><div class="gm-style-cc" style="-moz-user-select: none; position: absolute; right: 167px; bottom: 0px;" draggable="false"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto,Arial,sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right;"><span>1 km&nbsp;</span><div style="position: relative; display: inline-block; height: 8px; bottom: -1px; width: 66px;"><div style="width: 100%; height: 4px; position: absolute; background-color: rgb(255, 255, 255); bottom: 0px; left: 0px;"></div><div style="position: absolute; left: 0px; top: 0px; width: 4px; height: 8px; background-color: rgb(255, 255, 255);"></div><div style="width: 4px; height: 8px; position: absolute; background-color: rgb(255, 255, 255); bottom: 0px; right: 0px;"></div><div style="position: absolute; background-color: rgb(102, 102, 102); height: 2px; bottom: 1px; right: 1px; left: 1px;"></div><div style="position: absolute; left: 1px; top: 1px; width: 2px; height: 6px; background-color: rgb(102, 102, 102);"></div><div style="width: 2px; height: 6px; position: absolute; background-color: rgb(102, 102, 102); bottom: 1px; right: 1px;"></div></div></div></div></div></div></div><div class="clear"></div><div id="PanelInfoTable" class="InfoTable"><table><tbody><tr><td class="popupLabelText">Panel:</td><td class="popupText">89012</td><div><table><tbody><tr><td><div><img height="80px" width="150px" src="../../assets/add1.jpg"></div></td><td> <div></div></td></tr></tbody></table></div>';
	        $this->googlemaps->add_marker($marker);

        }
        
        //print_r($this->googlemaps);exit;
		
        $this->layouts->view('auction/load_stock44',null, array_merge($data,
                $media_category,
                $asset,
                $med),
        		false); //use the auctions header/footers
    }

    public function ajax_my_assets(){

	 
	  $user_id =$user_id = $this->session->userdata('user_id'); 
	  $row = 0;
	  $this->datatables
	  	->where('use_id', $user_id)
	  	//->where('ass_id', 28)
	    ->select("(@cnt := @cnt + 1) as `DT_RowId`, ass_id, ass_name, ass_description, 
		position, latitude, longitude, ass_status, ass_date, media_categories.description",false)
	    ->from('asset')
	    ->join('media_categories', 'media_categories.mec_id = asset.mec_id');
	    //->select('country')
	    //->join('tbl_states', 'tbl_profile.state_id = tbl_states.id')
	    //->select('state');
	    //->add_column('view', '<a href="' . base_url() . 'admin/profiles/view/$1"><img src="' . base_url() . 'assets/images/admin/vcard.png" alt="View" title="View" /></a>', 'id')
	    //->add_column('edit', '<a href="' . base_url() . 'admin/profiles/edit/$1"><img src="' . base_url() . 'assets/images/admin/vcard_edit.png" alt="Edit" title="Edit" /></a>', 'id')
	    //->add_column('delete', '<a href="' . base_url() . 'admin/profiles/delete/$1"><img src="' . base_url() . 'assets/images/admin/vcard_delete.png" alt="Delete" title="Delete" /></a>', 'id');

  		$data['result'] = $this->datatables->generate();

  		echo $data['result'];
    }

    public function ajax_raw_markers(){

	  $ids = $this->input->get('ids');
	  //echo $ids; 
	  //$string = "1,2,3,4,5";
	  //$int_array = array_map("intval", explode(",", $string));
	  $ids = array_map("intval", explode(",", $ids));
	  //$ids = explode($ids, ',');
	  //print_r($int_array);
	  //print_r(expression)
	  //print_r($ids); exit;
	  $user_id =$user_id = $this->session->userdata('user_id'); 
	  $row = 0;
	  $this->datatables
	  	->where('use_id', $user_id)
	  	//->where('ass_id', 28)
	    ->select("(@cnt := @cnt + 1) as `DT_RowId`, ass_id, ass_id as asset_id, ass_name, ass_description, 
		position, latitude, longitude, ass_status, ass_date, asset.mec_id,  asset.mec_id as med_id, media_categories.description, ass_is_mall, 0 as mall_id ",false)
	    ->from('asset')
	    ->where_in('ass_id', $ids)
	    ->join('media_categories', 'media_categories.mec_id = asset.mec_id');
	    //->select('country')
	    //->join('tbl_states', 'tbl_profile.state_id = tbl_states.id')
	    //->select('state');
	    //->add_column('view', '<a href="' . base_url() . 'admin/profiles/view/$1"><img src="' . base_url() . 'assets/images/admin/vcard.png" alt="View" title="View" /></a>', 'id')
	    //->add_column('edit', '<a href="' . base_url() . 'admin/profiles/edit/$1"><img src="' . base_url() . 'assets/images/admin/vcard_edit.png" alt="Edit" title="Edit" /></a>', 'id')
	    //->add_column('delete', '<a href="' . base_url() . 'admin/profiles/delete/$1"><img src="' . base_url() . 'assets/images/admin/vcard_delete.png" alt="Delete" title="Delete" /></a>', 'id');

  		$data['result'] = $this->datatables->generate('raw_markers');
  		//echo $this->db->last_query();
  		echo $data['result'];
    }

	public function spec_sheet($asset_name="", $asset_ref="", $asset_description="")
	{
		//get the uploaded regions
		$asset_id = $this->input->get('ass_id');

		redirect(site_url('auctions/spec_sheet/?ass_id='.$asset_id)); exit;
		//TODO(blessed): Get details from selected Asset
		//Setup PDF Doc details:
		//	Title 
		//	Filename
		//	Orientation
		$doc_title = 'Ads2Trade - Asset Specsheet #'.$ass; //TODO(blessed): Get details from selected Asset
		$doc_name  = 'Asset_Specsheet';
		$doc_orientation = 'L';

		//Load HTML doc
        //$data = array();echo $doc_title. $doc_name . $doc_orientation; exit;
        $doc_html = $this->load->view('spec_sheet_new', $data, true);

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
		$data['mmm'] = $this->assets->getAssetDetails();
		$data['durations'] = $this->duration->getDudarion();
		//var_dump($data);exit;
		$this->layouts->view('load_stock4', null, array_merge($data));
	}

	public function spiderfy()
	{
		//take points from db
		$data = array();
		$data['mmm'] = $this->assets->getAssetSpiderfy();
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
		//$data['mmm'] = $this->assets->getAssetDetails();
		$data['mmm'] = $this->auction->getAssetDetails();
		$data['mmm1'] = $this->auction->getAssetDetail();
		//
		//echo " testing "; exit;
		$data['auction_rooms'] = $this->auction->getAuctionRooms(); //
		//echo " test "; exit;
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->auction->getAssetDetails1();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->auction->getAssetDetails1();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);

		//11.12.2014 - Get Area/City Auctions Counts
		$post_criteria['auction_areas'] = $this->auction->getCityAreaAuctionCounts($user_id);
		//print_r($post_criteria['auction_areas']); exit;
              //  $this->layouts->view('sell_stock', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));

		//$this->layouts->view('auctions_new_rooms', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria));
		$this->layouts->view('auction/rooms', 
			null, 
			array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $towns, $asset_types, $durations, $post_criteria),
			false); //use the auctions header/footer 


	}
        
        
    public function view_my_assets()
	{
		//take points from db
		$data = array();
        $dat['mm'] = $this->assets->getMyAsset(); 
		$data['mmm'] = $this->assets->getAssetDetailsm();
		$data['mmm1'] = $this->assets->getAssetDetailm();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assets->getAssetDetails1m();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();
		//var_dump($provinces);exit;
		$durations['durations'] = $this->duration->getDudarion();
		// var_dump($durations);exit;
		$data1['mmm'] = $this->assets->getAssetDetails1m();

		$post_criteria = array(
			'filter_criteria' => $_POST
		);
		unset($post_criteria['filter_criteria']['filter']);



		$this->layouts->view('sell_my_assets', null, array_merge($asset_family,$asset_master,$data, $data1, $data2, $provinces, $dat,$towns, $asset_types, $durations, $post_criteria));


	}



	public function cluster()
	{


		$data1['mmm'] = $this->assets->getAssetDetails1();
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
			false);   //set this to false to use custom auctions header/footer

		}


	public function center_map($lat, $Lng)
	{
		$center_position = $lat . ", " . $lng;
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
	{      $this->auction->remove_watch();
		$this->layouts->view('watch_list');
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
	public function auctions()
	{

		//Get filters if any

		//Get Session data required
		$user_id = $this->session->userdata('user_id');
		
		//Get data from db
		//take points from db
		$data = array();
		$data['mmm'] = $this->assets->getAssetDetails();
		$data['mmm1'] = $this->assets->getAssetDetail();
		$provinces['my_provinces'] = $this->province->getRegions();
		$data2['mmm2'] = $this->assets->getAssetDetails1();
		//get the uploaded towns
		$towns['my_towns'] = $this->town->getTowns();
		//get asset_types
		$asset_types['may_asset_types'] = $this->asset_type->getAssetType();
                $asset_family['may_asset_family'] = $this->asset_type->getFamilyType();
                $asset_master['may_asset_master'] = $this->asset_type->getMasterType();

		$durations['durations'] = $this->duration->getDudarion();

		$data1['mmm'] = $this->assets->getAssetDetails1();

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

	/**** BEGIN for loadasset app compatibility  ****/

    function view_asset(){

        if(isset($_GET['ass_id']) && $_GET['ass_id']){
            $ass_id = $_GET['ass_id'];
            $user_id = $this->session->userdata('user_id'); 
            //print_r($ass_id); 
            //exit();
            $data['mmm'] = $this->assets->getAssetDetails(); 
            $photos['photos'] = $this->uploaded_documents->get_all_data_by_ass_id($ass_id);
            //var_dump($photos);exit();
            $asset_by_id['asset_by_id'] = $this->assets->getAssetByAssetId($ass_id);
            $unit['unit'] = $this->assets->getMeasurements();
            $med_cat['med_cat'] = $this->media_category->getMediaCat();
            //$data['asset'] = $this->assets->getAllAsset();
            $data['asset'] = $this->assets->getAssetByuserId($user_id);
            $employee['employee'] = $this->user->getEmployee();
            //echo " emp "; exit; 
            $this->layouts->view('auction/view_asset', null, array_merge(
                    $data,
                    //$asset,
                    $photos,
                    $asset_by_id,
                    $unit,
                    $med_cat,
                    $employee),
            false);
        }

    }

    //function to get asset details by ID
    public function getAssetByAjax1(){
  
        if($this->input->post('ajax')){
            
            $ass_id = $this->input->post('ass_id');
        
            echo json_encode($this->assets->assetAjaxProReq($ass_id));
        }
  
    }

	function do_upload(){
        $fac_id = $this->input->post('fac_id');
        $ass_id = $this->input->post('ass_id');

		$config['upload_path'] = './upload/asset_photos';
		$config['allowed_types'] = "gif|jpg|jpeg|png";
		$config['max_size']	= "5000";
		$config['max_width']  = "1907";
		$config['max_height']  = "1280";

		$this->load->library('upload');

		//echo "Initializing upload ...";
		//file_put_contents(filename, data);
		$this->upload->initialize($config);

		$upload_result = $this->upload->do_upload('userfile');
		//echo "Upload result: $upload_result";

		if ($upload_result == false) {
		        $this->upload->display_errors();
		        echo "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png";
		} else {

				//echo "Getting file info";
		        $file_info = $this->upload->data('userfile');
		        //file name
		        $fname = $file_info['file_name'];
		        //file path/url
		        $fpath = $file_info['file_path'].$fname;
		        //C:/Program Files/EasyPHP-DevServer-14.1VC11/data/localweb/ads2trade/upload/asset_photos/10484991_10152411287073547_6592022208326102484_n.jpg
		        ///usr/www/users/indigfajaw/ads2trade/upload/asset_photos/py.png
		        //echo "File sent to server";

		        $custom_base_path = str_replace("system/", "", BASEPATH);

		        //echo "Custom basepath $custom_base_path";

		        $relative_path = str_replace($custom_base_path,"",$fpath);
		        //$relative_path = str_replace("C:/Program Files/EasyPHP-DevServer-14.1VC11/data/localweb/ads2trade/","",$fpath);
		        //echo "Relative path $relative_path";
		        $fpath1 = base_url().$relative_path;
		        //file type
		        $ftype = $file_info['file_type'];
		        //file size
		        $fsize = $file_info['file_size'];
		        //echo "files size:$fsize file type: $ftype path: $fpath1";
		        $f_type = $this->assets->upload_file_type($ftype);
		        
		        //file type id from the last inserted one, and loop through it to get an object of an array
		        //$f_type = $this->assets->get_last_inserted_ftype_id();
		        //echo " file type id ".$f_type;
		        //$upt_id = "";
		        //foreach ($f_type as $upt_id1){
		            //$upt_id = $upt_id1;
		        //}
		        //echo 'A:'.APPPATH.' F:'.FCPATH.' B:'.BASEPATH.' S: '.SYSDIR . ' SELF:'.SELF. '***';
		       	//$upload_file = array();
		       	//$upload_file[] = $fpath1;
		        echo " Uploading File: $fpath1 $fsize $fname $ftype $f_type ";
		        //$this->assssssetsi->insertFile($fpath1,$fsize, $fname, $ftype, $fac_id, $ass_id);
		        //$this->assets->insertFileNoAssId($fpath1, $fsize,$fname,$ftype,$upt_id);
		        /*
		    	$fpath1 = '/url';
		    	$fsize = 10;
		    	$fname = 'file name.jpg';
		    	$ftype = 'image/jpeg';
		    	$ass_id = 1;
		    	*/
		        $img_data = array(
		            'upd_url' => $fpath1,
		            'upd_filesize' => $fsize,
		            'upd_file_name' => $fname,
		            'upd_file_type' => $ftype,
		            'ass_id' => $ass_id,
		            'upt_id' => 0,
		            'fac_id' => 0,
		            'rfp_id' => 0
		        );
		        
		        $this->db->insert('uploaded_documents', $img_data); 

		        //$this->assets>insertFile($fpath1,$fsize, $fname, $ftype, 0, $ass_id);
		        
		        echo " File upload success";
		}

	}

    function update_asset(){
                
        //asset id posted on a hidden field
        $ass_id = $this->input->post('ass_id');
        
        $this->form_validation->set_rules('ass_ref', 'Asset Name', 'required');
        $this->form_validation->set_rules('asset_desc', 'Asset Description', 'trim|xss_clean|required');
        $this->form_validation->set_rules('employee_maintenance', 'Employee (Maintenance)', 'required');
        $this->form_validation->set_rules('acq_cost', 'Acquisition Cost', 'required');
        $this->form_validation->set_rules('book_value', 'Asset Book Value', 'required');
        $this->form_validation->set_rules('pri_height', 'Printable Length', 'required');
        $this->form_validation->set_rules('pri_length_unit', 'Unit', 'required');
        $this->form_validation->set_rules('proportional_costs', 'Proportional_Costs', 'required');
        $this->form_validation->set_rules('pri_width', 'Printable Width', 'required');
        $this->form_validation->set_rules('pri_width_unit', 'Unit', 'required');
        //$this->form_validation->set_rules('pro_cost_scy', 'Production Cost (SCY)', 'required');
        //$this->form_validation->set_rules('pro_cost_bcy', 'Production Cost (BCY)', 'required');
        $this->form_validation->set_rules('mat_type', 'Material Type', 'required');
        $this->form_validation->set_rules('loc_type', 'Location Type', 'required');
        $this->form_validation->set_rules('lead_time', 'Production Lead Time', 'required');
        $this->form_validation->set_rules('position_1', 'Position', 'required');
        $this->form_validation->set_rules('pro_requirements', 'Production Requirements', 'required');
  

        if ($this->form_validation->run() == false){       
                //if(isset($_GET['ass_id']) && $_GET['ass_id']){
                //$ass_id = $_GET['ass_id'];
                //print_r($ass_id); 
                //exit();
        	//echo " validatio failed"; exit;
                $data['mmm'] = $this->assets->getAssetDetails();
                $data['asset'] = $this->assets->getAllAsset();
                $data['durations'] = $this->duration->getDudarion();
                $asset_by_id['asset_by_id'] = $this->assets->getAssetByAssetId($ass_id);
                $unit['unit'] = $this->assets->getMeasurements();
                $med_cat['med_cat'] = $this->media_category->getMediaCat();
                $employee['employee'] = $this->user->getEmployee();

                redirect('load_stock/view_asset?ass_id='.$ass_id.'&error=1','refresh'); 

                $return_messages =  array(
                                	'error' => "Fill in all form fields..."
                                    );
                $this->layouts->view('auction/view_asset', null, array_merge(
                        $data,
                        $asset_by_id,
                        $unit,
                        $med_cat,
                        $employee,
                        $return_messages,
                        false));
            } else {
                
                //get the data for update

                $update_array = array(

					'ass_description' => $this->input->post('asset_desc'),
					'position' => $this->input->post('position_1'),
					'ass_ref' => $this->input->post('asset_ref'),
					'emp_id_maintenance' => $this->input->post('employee_maintenance'),
					//'ass_disposed_of' => $this->input->post('asset_desc'),
					'ass_acquisition_cost' => $this->input->post('acq_cost'),
					'ass_book_value' => $this->input->post('book_value'),
					'ass_printable_height' => $this->input->post('pri_height'),
					'ass_proportional_costs' => $this->input->post('proportional_costs'),
					'ass_printable_width' => $this->input->post('pri_width'),
					//'ass_production_cost_BCY' => $this->input->post('asset_desc'),
					//'ass_production_price_SCY' => $this->input->post('asset_desc'),
					//'ass_address' => $this->input->post('asset_desc'),
					'mat_id' => $this->input->post('mat_type'),
					'loc_id' => $this->input->post('loc_type'),
					//'med_id' => $this->input->post('asset_desc'),
					//'met_id' => $this->input->post('asset_desc'),
					//'img_id' => $this->input->post('asset_desc'),
					'ass_lead_time' => $this->input->post('lead_time'),
					'meu_id_lead_time' => $this->input->post('meu_id_lead_time'),
					'ass_production_requirements' => $this->input->post('pro_requirements'),
					//'use_id' => $this->input->post('asset_desc'),
					//'mec_id' => $this->input->post('asset_desc'),
					'lot_id' => $this->input->post('loc_type'),
					'ass_position' => $this->input->post('asset_desc'),
					'ass_height_meu_id' => $this->input->post('pri_length_unit'),
					'ass_width_meu_id' => $this->input->post('pri_width_unit'),
					//'ass_street_address' => $this->input->post('asset_desc'),
					//'ass_city' => $this->input->post('asset_desc'),
					//'ass_province' => $this->input->post('asset_desc'),
					//'ass_country' => $this->input->post('asset_desc'),
					//'ass_date' => $this->input->post('asset_desc'),
					//'ass_is_mall' => $this->input->post('asset_desc'),
					//'ass_status' => $this->input->post('asset_desc'),
					//'ass_status_detail' => $this->input->post('asset_desc'),
					//'latitude' => $this->input->post('asset_desc'),
					//'longitude' => $this->input->post('asset_desc'),
					'ass_restrictions' => $this->input->post('ass_restrictions'),
					'ass_exposure_time' => $this->input->post('exposure_time'),
					'exposure_time_meu_id' => $this->input->post('exposure_time_unit'),
					'obstruction_factor' => $this->input->post('obs_factor'),
					'viewing_angle' => $this->input->post('view_angle'),
					'visual_competition' => $this->input->post('viewing_competition'),
					'ass_illumination' => $this->input->post('illumination'),
					'ass_substrate' => $this->input->post('substrate'),
					'ass_orientation' => $this->input->post('orientation')
                
    			);

				 $rate_array = array(
				    'rat_description' => $this->input->post('rate_desc'),
				    'rat_rate' => $this->input->post('std_rate'),
				    'rat_frequency' => $this->input->post('rate_frequency'),
				    //'rat_frequency_meu_id' => $this->input->post('rate_freq_meu'),
				    'rat_start_date' => $this->input->post('start_date'),
				    'rat_end_date' => $this->input->post('end_date'),
				    'ass_id' => $ass_id
				 	);

//exit('here');
                #update the asset data
                $this->assets->updateAsset($ass_id);
                //echo "Asset Updated";
//exit('here');
                #record the rate card data
                $this->assets->insertNewAsset($rate_array);
                //echo "Asset Rate Info Updated";

                $return_messages =  array(
                                	'error' => "You have saved your asset successfully..."
                                    );

                redirect('load_stock/view_asset?ass_id='.$ass_id.'&updated=1','refresh'); 
                exit;
                
                $data = array();
                $data['mmm'] = $this->assets->getAssetDetails();
                $data['durations'] = $this->duration->getDudarion();
                //echo " validatio success"; exit;
                $user_id = $this->session->userdata('user_id'); 
                $media_category['media_category'] = $this->media_category->getMediaCat();
                //echo " validatio success"; exit;
                $asset['asset'] = $this->assets->getAssetByuserId($user_id);
                //echo " validatio success 2"; exit;
                $med['med'] = $this->assets->getMediaCat();
                //echo " validatio success"; exit;
                $this->layouts->view('auction/load_stock4', null, array_merge(
                        $return_messages,
                        $data,
                        $media_category,
                        $asset,
                        $med,
                        false));
            }    

    }

    /* Update Asset Position (called from ajax request )*/
    function update_pos(){
    	$ass_id = $this->input->post('ass_id');
    	$lat = $this->input->post('lat');
    	$lng = $this->input->post('lng');

    	//TODO: Move this into the assets model
    	$this->db->query("UPDATE 
    						asset SET position='$lat,$lng', latitude='$lat', longitude='$lng'
    					  WHERE 
    					  	ass_id='$ass_id'
    					  LIMIT 1"); 
		echo "Asset Position Updated";
    }

    function test_upload(){
    	echo "<br>Before model";
    	//$this->upload>test_upload();
    	echo "BEFORE: Upload";
    	$fpath1 = '/url';
    	$fsize = 10;
    	$fname = 'file name.jpg';
    	$ftype = 'image/jpeg';
    	$ass_id = 1;
        $img_data = array(
            'upd_url' => $fpath1,
            'upd_filesize' => $fsize,
            'upd_file_name' => $fname,
            'upd_file_type' => $ftype,
            'ass_id' => $ass_id,
            'upt_id' => 0,
            'fac_id' => 0,
            'rfp_id' => 0
        );
        
        $this->db->insert('uploaded_documents', $img_data);  
        echo "AFTER: Upload";   
    	echo "<br>After model upload";
    }

    function saveCampaign(){
    	//empty function to take care of 404 errors noted in js console
    }

	/**** END for loadasset app compatibility  ****/
}
/* 
	End of file load_stock.php 
*/