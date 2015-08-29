<?php //var_dump($region); 
    //var_dump($_POST);
  ?>


<style>
    html, body, #map-canvas {
        height: 500px;
        margin: 0px;
        padding: 0px
    }
    
    #asset_details {
        margin-top: 500px;
    }
    
    #mapModal{
  position:fixed; 
  top:0; 
  left:0; 
  width:900px; 
  height:700px; 
  background:#FFF; 
  display:none; 
  padding:5px; 
  border:3px double #CCC; 
  z-index:10;
  -moz-border-radius:6px;
  -webkit-border-radius:6px; 
  -moz-box-shadow:3px 3px 6px #666;
  -webkit-box-shadow:3px 3px 6px #666; 
}
    

    .tabs_wrap{ border:solid 1px #e1e1e1; }
    .tabs_wrap a.active{ background-color: #cbc9c9; }
    .dn{ display:none;}
    .Faces{ border-bottom: solid 1px #e1e1e1; padding-bottom: 10px; height: 30px; margin-bottom: 10px; }
    .dbfl{float:left; display:inline-block;}
    .tab_content{display:none; height: 215px; overflow: auto;}
    .tab_content.active{display:block;}
    #dialog_content .buttons_wrap a{ margin-right: 10px;}
    #dialog_content{ float:left; width:100%;}
    #dialog_content label{ display: block; margin: 0px;}
    #dialog_content .form-control{ outline: none!important; border-shadow: none; margin: 0px;outline: none; border: solid 2px #e1e1e1; width: 250px; padding: 6px; margin-bottom: 10px;}
    

    
</style>

<!-- Below style is for bootstrap modal -->
<style type="text/css">
    
    #modalbak {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: #333333;
		display: none;
		opacity: 0.40;
		z-index: 9;
	}

	#modalwin {
		position: fixed;
		top: 0;
		left: 0;
		width: 900px;
		height: 600px;
		background: #FFF;
		display: none;
		padding: 5px;
		border: 3px double #CCC;
		z-index: 10;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-moz-box-shadow: 3px 3px 6px #666;
		-webkit-box-shadow: 3px 3px 6px #666;
	}

	#modalmsg {
		text-align: center;
		/* Add more style to your message */
	}
    
</style>
<!--
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>

<script src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js" type="text/javascript"></script>
<link href="//cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css" rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
-->

<div id="popup_content" style="display:none">
    <div id="dialog_content"><form>
            
            <div class="Faces">
                <div class="col-xs-4">
                    <input type="radio" name="face" checked="checked" id="fa" class="dbfl">
                    <label for="fa" class="dbfl">Face A</label>
                </div>
                <div class="col-xs-4">
                    <input type="radio" name="face" id="fb" class="dbfl">
                    <label  for="fb" class="dbfl">Face B</label>
                </div>
                <div class="col-xs-4">
                    <input type="radio" name="ass_is_mall" id="ass_is_mall" class="dbfl" value="1">
                    <label  for="fb" class="dbfl">Is a Mall?</label>
                </div>                
            </div>
            
            <div class="face_a_content">
<!--                <div class="btn-group tabs_wrap">
                    
                    <a href="#" class="btn btn-default active" id="basic">Basic Info</a>
                    
                    <a href="#" class="btn btn-default" id="production">Production Info</a>
                    <a href="#" class="btn btn-default" id="rate">Rate Info</a>      
                         
                </div>
--> 
                <div class="tab_content active" id="basic">
                    <label>Title</label>
                    <input type="text" name="title" class="form-control">
                    <label>Media Type</label>
                    <select name="mec_id" class="form-control">
                        <option value="" disabled selected>Select media cat</option>
                        <?php foreach ($media_category as $row):?>
                        <option value="<?php echo $row->mec_id;?>"><?php echo $row->description;?></option> 
                        <?php endforeach;?>            
                    </select>
                    <label>Description</label>
                    <textarea name="desc" class="form-control"></textarea>                  
                    <input type="hidden" name="action" value="add_new_asset" >
                    
                </div>
                <!--
                <div class="tab_content" id="production">
                    Product Content
                </div>
                <div class="tab_content" id="rate">
                    Rate Content
                </div>
                -->
            </div>
            
            <div class="face_b_content dn">
      <!--                
                <div class="btn-group tabs_wrap">
                    <a href="#" class="btn btn-default active" id="basic">Basic Info</a>
                    <a href="#" class="btn btn-default" id="production">Production Info</a>
                    <a href="#" class="btn btn-default" id="rate">Rate Info</a>          
                </div>
      -->
                <div class="tab_content active" id="basic">
                    <label>Title</label>
                    <input type="text" name="title1" class="form-control">
                    <label>Media Type</label>
                    <select name="mec_id1" class="form-control">
                        <option value="" disabled selected>Select media cat</option>
                        <?php foreach ($media_category as $row):?>
                        <option value="<?php echo $row->mec_id;?>"><?php echo $row->mec_description;?></option>
                        <?php endforeach;?>            
                    </select>
                    <label>Description</label>
                    <textarea name="desc1" class="form-control"></textarea>
                    <input type="hidden" name="action" value="add_new_asset" >
                    
                </div>
                <!--
                <div class="tab_content" id="production">
                    Product Content Face B
                </div>
                <div class="tab_content" id="rate">
                    Rate Content Face B
                </div>
                -->
            </div>

            <div class="buttons_wrap">
                <input type="hidden" class="form-control latlong" name="position"  value="" >
				

                <a href="#" class="save_new_asset btn btn-primary" id="button">Save Asset</a>
                <a href="#" class="delete_new_asset btn btn-primary">Delete Asset</a>
            </div><br>
        </form></div>
    <div class="clear"></div>
    </div>
    
    <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog" style="width: 75%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<h4 class="modal-title" id="myModalLabel">View Location Map</h4>
			</div>
			<div class="modal-body">
				<div id="campaign_map_canvas" style="width: 100%; height: 500px"></div>
				<div id="campaign_images" style="width: 100%; height: 800px;"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>

<!-- mapping requirements -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
        
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>
<!-- mapping requirements end -->


<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>Load Stock</h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}
?>

<div class="main col-xs-12">
    <ul class="nav navbar-nav section-menu">
        <li class="active"><a href="<?php echo site_url('load_stock'); ?>">Outdoor Assets</a></li>
        <li><a href="<?php echo site_url('malls')?>">Indoor Assets</a></li>
    </ul>   

    <div class="clear"></div>

    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        If you have a large number of assets to load, please email upload@ads2trade.co.za and one of our Account Managers will work with you directly.</div>

    <br>
    <div class="row col-md-12">
        <div class="col-xs-12">
                
                <label>Send Map To</label>
                <input type="text" id="myPlaceTextBox" placeholder="Enter location" autocomplete="off" class="form-control" />
                
            

        </div> 
    <!--</div>

    <div clss="row">-->    
    <div class="col-xs-12" style="padding-top: 20px;">

            <div class="map_wrap" style="margin-bottom: 60px; width:100%; ">
                <div id="map-canvas"></div>
            </div>
        </div>
    </div> 
    
    <br/>
    <br/>
    <br/>
    
    <h3 id="asset_details">Asset Details</h3>
    <div class="table_div">
    <table class="table table-bordered headed " id="example" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Asset name</th>
                <th>Description</th>
                <th>Media type</th>
                <th>Position</th>
                <th>Status</th>
                <th>Date, time added</th>
                
            </tr>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
    </table>


        <table class="table table-bordered headed " id="demotbl" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Asset name 44</th>
                <th>Description 44</th>
                <th>Media type</th>
                <th>Position</th>
                <th>Status</th>
                <th>Date, time added</th>
                
            </tr>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
    </table>
    </div>


</div><!--Main -->


<!-- POPUPS -->

<!-- View/Edit Asset Site Details-->

<form name="frmEditItem" id="frmEditItem" method="post" action="create?action=edititem&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva">
<div class="modal fade" id="editItemDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog" style="width: 860px;">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-edit"></span>
      <?php echo isset($ass_name)?$ass_name:'View/Edit Site Details: ';?><span id="ass_name_header" name="ass_name"></span></h4>
    </div>

    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0 id="auction_min_text">
      <input type="hidden" value="" name="ass_name" id="ass_name_text">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
-->
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Asset Details</a></li>
        <li><a href="#tab2" data-toggle="tab">Auctions History</a></li>
      </ul>
      <div class="tab-content">

        <div class="tab-pane active" id="tab1">
          <div id="response"></div>
          <div class="row"> 
              <div class="col-xs-3">
                <a class="thumbnail" href="#">
            <img src="<?php echo base_url('assets/add1.jpg'); ?>">
                </a>
              </div>
              <div id="map-canvas" style="width: 300px; height: 190px;"></div>
              <div id="pano" style="position:absolute; left:523px; top: 60px; width: 300px; height: 190px;"></div>
          </div>

  
          <div class="col-xs-12" class="row"> 
                <div >
                      <table style="" class="table table-striped">  
                      <tbody>  
                      <tr>  
                        <td colspan="8">
                          <div class="form-group">
                            <div class="input-group">
                              <a href="<?php echo site_url('load_stock/watch_list'); ?>">
                                <button type="button" class="btn btn-primary">Watchlists</button>
                              </a>
                              <a href="<?php echo site_url('load_stock/won_bids'); ?>">
                                <button type="button" class="btn btn-primary">Go To My Shopping Basket</button>
                              </a>
                              <a href="<?php echo site_url('auctions/spec_sheet?ass_id=5'); ?>" target="_blank">
                                <button type="button" class="btn btn-primary">View Spec Sheet</button>
                              </a>
                              <!--
                              <a href="#" onclick="modalshow3('<?php echo $row->ass_id; ?>','2')"  class="input-group-addon btn btn-primary">Watch Lists</a>&nbsp;
                              <a href="../load_stock/won_bids"  class="input-group-addon btn btn-primary">Go To My Shopping Basket</a>&nbsp;
                              <a href="spec_sheet?ass_id=<?php echo $row->ass_id;?>"  class="input-group-addon btn btn-primary">View Spec Sheet</a>
                              -->
                            </div>
                          </div> 
                        </td>
                      </tr>
                      <tr>  
                        <td><strong>Asset Name:</strong></td>  
                        <td> <span id="ass_name"></span></td>  
                        <td><strong>Buy Now Price</strong></td>  
                        <td>R <span id="buy_now"></span></td> 
                        <td><strong>Minimum Bid:</strong> </td>  
                        <td>R <span id="minimum_bid"></span></td> 
                        <td><strong>Current Bid:</strong></td>
                        <td>R <span id="current_bid"></span></td>
                      </tr>  
                      <tr>  
                        <td><strong>Ass Descrption</strong></td>  
                        <td> <span id="ass_description"></span></td>  
                        <td><strong></strong></td>  
                        <td></td>  
                        <td colspan="2">  
                          <input  name="bid" id="bid" type="text" placeholder="Enter Bid Amount 0 or more">
                          <input  name="minimum" id="minimum" type="hidden" value="">
                          <input  name="auct_id" id="auct_id" type="hidden" value="">
                        </td>
                        <td><strong>Your Last Bid</strong></td>
                        <td>R <span id="you_last_bid"></span></td>
                      </tr>  
                      <tr>  
                        <td>
                          <strong>Asset Type:</strong>
                        </td>  
                        <td align="left"><span id="ass_type"></span></td>  
                        <td>
                          <a href="buynow?p=<?php echo $p; ?>">
                            <button type="submit" class="btn btn-primary" data-dismiss="modal">Buy Now</button>
                          </a>
                        </td>  
                        <td></td>
                        <td colspan="2"> 
                          <a href="#" onclick="bid_now(<?php echo $row->ass_id;?>)">
                            <button type="submit" class="btn btn-primary" data-dismiss="modal">Place Bid</button>
                          </a>
                        </td>
                        <td><strong>Increment:</strong></td>
                        <td>R<?php echo $increment; ?><span id="increment"></span></td>
                      </tr>
                      <tr>  
                        <td><strong>Asset Address:</strong></td>  
                        <td colspan="2"><?php echo $row->ass_address;?><span id="ass_address"></span></td>  
                          
                        <td></td><td colspan="2"> </td>
                        <td><strong>Traffic Count:</strong></td>
                        <td>500<span id="traffic_count"></span></td>
                      </tr>
                      </tbody>  
                      </table> 

                  </div>
              
             </div>

        </div>
        <div class="tab-pane" id="tab2">
          <p>
          There is no auction history for this Asset at the moment
          </p>
        </div>
      </div>

    </div>

    <div class="modal-footer" style="padding-top:30px;">
      <button type="submit" class="btn btn-primary" data-dismiss="modal"> Close </button>
    </div>
  </div>
</div>
</div></form>

<!-- END POPUPS -->


<script type="text/javascript" language="javascript" class="init">

$(document).ready(function() {
    $('#demotbl').dataTable(
        "processing": true,
        "serverSide": true,
        "ajax": <?php echo site_url('load_stock/ajax_my_assets'); ?>,
        "deferLoading": 100
      );
} );

</script>


<script type="text/javascript">
    var raw_markers = <?php echo json_encode($asset);?>; /* Load all assets for this user*/
    var base_url = '<?php echo base_url();?>';
    var mall_assets_url = '<?php echo site_url("malls/");?>';
    var adsMap = false;
    var disableListener = false;
    var centerposition = new google.maps.LatLng(-26.063214,27.943271);
    var marker_icon = base_url + 'assets/mapping/images/media_11.png';

    function initialize() {
        var mapOptions = {zoom: 6, center: centerposition};
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        var addAssetListener = google.maps.event.addListener(map, 'click', function(event) {
            if (disableListener) {
                return;
            }
            addMarker(event.latLng);
        });
        var markers = [];
        for (var i in raw_markers) {
            (function (i) {
                var marker_details = raw_markers[i]
                console.log('Ugly hack to fix missing mec_id field');
                if (!marker_details.hasOwnProperty('mec_id')) {
                    marker_details.mec_id = marker_details.med_id;
                }

                if(marker_details.ass_is_mall == 1){
                    marker_icon = base_url + 'assets/mapping/images/media_11.png';     /* Shopping Mall Icon */
                } else {
                    marker_icon = base_url + 'assets/mapping/images/media_'+marker_details.mec_id+'.png'; /* use icon as per mec_id default */
                }

                var position_parts = marker_details.position.split(',');

                var latLng = new google.maps.LatLng(position_parts[0], position_parts[1]);
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    type: parseInt(marker_details.mec_id),
                    icon: marker_icon,
                    title: ""+marker_details.ass_name + " (" + marker_details.ass_description + ")",
                    is_mall: marker_details.ass_is_mall,
                    asset_id: marker_details.ass_id,
                    mall_id: marker_details.mall_id
                });

                //Marker click event

                // Attach the marker click event to hijack click event for Malls
                google.maps.event.addListener(marker, 'click', function (event) {
                    //debugger;
                    var chagedPos = marker.position;
                    var asset_id = marker.asset_id;
                    var asset_is_mall = marker.is_mall;
                    var asset_mec_id = marker.type;
                    var asset_mall_id = marker.mall_id;

                    console.log(' maker clicked : ' + asset_id);
                    if(asset_is_mall == 1){
                        //map.originalEvent.preventDefault();
                        // this is a mall go to mall assets management
                        // or better yet prompt user to either choose to go manage auctions or manage mall items
                        console.log(mall_assets_url + '/mall/'+asset_mall_id);
                        window.location = mall_assets_url + '/mall/'+asset_mall_id;
                        /*
                        if(confirm("Click OK to go to Mall Assets")){
                            alert('Manage Mall Assets...');
                            console.log(mall_assets_url + '/mall/'+asset_mall_id);
                        } else {
                            //alert('Redirecting to Mall Assets Auctions...');
                        }*/
                        //stop event propagation
                        //map.originalEvent.stopPropagation();
                    } else {
                        // this not a mall, create/manage auctions
                        //alert('Manage Asset Auction(s) popup will load here, work still in progress ...');
                    }
                    /*marker.getPosition()*/
                    /*
                    $.post(update_url, {postition: chagedPos}, function(result){
                        //result of the POST 
                        console.log(' marker drag/upd/post complete:'+result);
                    });
                */
                });

                markers.push(marker);


//              google.maps.event.addListener(marker, 'click', function () {
//
//                  modalshow(marker_details.ass_id);
//              });
            })(i);

        }
        var optOptions = {
            urlBase: base_url,
            markers: markers,
            showRadii: false,
            showSearchPOIButton: function() {
                disableListener = true;
                adsMap.add_message('Please click on the map.', 10);
                adsMap.search_poi(false, function() {
                    disableListener = false;
                });
                return false;
            },
            showFilterButton: function() {
                disableListener = true;
                adsMap.add_message('Please click on the map.', 10);
                adsMap.filter_markers_in_radius(false, function() {
                    disableListener = false;
                });
                return false;
            }
        };
        var clusterOptions = {};
        var spiderOptions = {
                    keepSpiderfied: true
                };
        var html2canvasOptions = {
            logging: true
        };
        adsMap = new AdsMap(map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
                //Now add the click events to the markers
        document.addEventListener('AdsMaploaded', function(e) {
            adsMap.spider.addListener('click', function(clicked_marker) {
                modalshow(clicked_marker.asset_id);
            });
        }, false);
                
                
                
                
                /** Autocomplete Places */
        var input = document.getElementById('myPlaceTextBox');
        var image = base_url + 'assets/mapping/images/user_marker.png';
        var marker_location = new google.maps.Marker({
            map: map,
            draggable: true,
            icon: image,
            animation: google.maps.Animation.DROP,
            visible: false
        });
        var autoCompleteOnChange = function () {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById("myPlaceTextBox").value;

            geocoder.geocode({ "address": address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {

                    $("#location").parent().removeClass("has-error");
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    $("#latitude").val(latitude);
                    $("#longitude").val(longitude);
                    marker_location.setVisible(true);
                    marker_location.setPosition(results[0].geometry.location);
                    console.log(results[0].geometry.location);
                    map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
                    map.setZoom(9);
                    google.maps.event.addListener(marker_location, "dragend", function (event) {
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

        }
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);
        google.maps.event.addListener(autocomplete, 'place_changed', autoCompleteOnChange);
    }

    google.maps.event.addDomListener(window, 'load', initialize);
        
        function search_poi() {
        adsMap.add_message('Please click on the area where you would like to search.', 10);
        adsMap.search_poi();
    }


 
    var centerposition = new google.maps.LatLng(-26.063214,27.943271);
    var marker;
    var markers = [];
    var map;
    var ajax_file = "<?php echo site_url('our_ajax'); ?>";
    var openInfoWindow;
    var image = base_url + 'assets/blue_icon.png';

    function populate_table(){
        var mediaowner_id = $("#mediaowner_id").val();
        $.ajax({type: "POST",url: ajax_file,
            data: { action:'table_data', mediaowner_id:mediaowner_id},
            success:function(html){
                //openInfoWindow.close();
                //$(".table_div").html(html);
                window.location.reload();
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
    }

    function setup_marker(marker){
        

        var mLatLang = marker.getPosition().toUrlValue();
        google.maps.event.addListener(marker, 'click', function() {
            if (openInfoWindow) {
                openInfoWindow.close();
            }

            var infowindow = new google.maps.InfoWindow({
                content: ''
            });
            $.post( ajax_file, { action: "get_asset_details", position: mLatLang},function( data ) {
            
                var contentString = $('<div>'+data+'</div>');    

                infowindow.setContent(contentString[0]);
                infowindow.open(map,marker);
                openInfoWindow = infowindow;

                //Find remove button in infoWindow
                var removeBtn = contentString.find('.delete_asset')[0];
                var saveBtn = contentString.find('.save_asset')[0];

                //add click listner to remove marker button
                google.maps.event.addDomListener(removeBtn, "click", function(event) {
                    //call remove_marker function to remove the marker from the map
                    remove_marker(marker);
                });

                //add click listner to save marker button
                google.maps.event.addDomListener(saveBtn, "click", function(event) {
                    //call remove_marker function to remove the marker from the map
                    save_current_asset(marker,infowindow);
                });
            });
          
        });
    }

    function remove_marker(Marker){
        //Remove saved marker from DB and map using jQuery Ajax
        var mLatLang = Marker.getPosition().toUrlValue(); //get marker position
        
        var myData = {action : 'delete_asset', latlang : mLatLang}; //post variables
        $.ajax({
            type: "POST",
            url: ajax_file,
            data: myData,
            success:function(data){
                Marker.setMap(null); 
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
      
    }

    function save_current_asset(Marker,infowindow){
        
        var myData = $(infowindow.content).find('form').serialize();
        $.ajax({
            type: "POST",
            url: ajax_file,
            data: myData,
            success:function(data){
                openInfoWindow.close();
                populate_table();
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
      
    }

    function save_new_asset(Marker,infowindow){
        var myData = $(infowindow.content).find('form').serialize();
        
        $.ajax({type: "POST",url: ajax_file,
            data: myData,
            success:function(data){
                openInfoWindow.close();
                populate_table();
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
    }

    function addMarker(location) {
        if (openInfoWindow) {
            openInfoWindow.close();
        }

      
        var marker = new google.maps.Marker({
            position: location,
            draggable:true,
            icon:image,
            map: map
        });

        markers.push(marker);

        var mLatLang = marker.getPosition().toUrlValue();
        var popupcontent = $("#popup_content").html();
        
        var contentString = $('<div>'+popupcontent+'</div>');    
        contentString.find('.latlong').val(mLatLang);

        var infowindow = new google.maps.InfoWindow({
            content: '',maxWidth: 360 ,Height: 600 
        });
        infowindow.setContent(contentString[0]);
        openInfoWindow = infowindow;
        infowindow.open(map,marker);

        //Find remove button in infoWindow
        var removeBtn = contentString.find('.delete_new_asset');
        var saveBtn = contentString.find('.save_new_asset');

        //add click listner to remove marker button
        removeBtn.on('click', function( ){
            marker.setMap(null);
        })
        google.maps.event.addListener(infowindow, "closeclick", function(event) {
            marker.setMap(null); 
        });

        //add click listner to save marker button
        saveBtn.on("click", function(event) {
            save_new_asset(marker,openInfoWindow);
        });

        setup_marker(marker);
      

    }
      
</script>

<script>

    function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin, mapA;
    console.log('modal show' + a);

    //$("#frmEditItem").find('span[id="description"]').html(' Asset ID: ' + a);

    //Get Asset/Site Details and populate modal 
    //$('#response').html("<b>Loading asset/site details...</b>");
    $.ajax({
        type: 'GET',
        url: "<?php echo site_url('auctions/jsonGetAssetDetails'); ?>",
        data: { c: a, p: "details" }
    })
    .done(function (data) {
        console.log(data);
        var jsonAsset = $.parseJSON(data); 
        console.log(jsonAsset);
        /*
          {"ass_id":"16","ass_name":"Myne","ass_type":"bill board (Traditional)","ast_id":null,"ass_ref":"Ref My\/000","ass_description":"My Myne",
           "ass_street_address":"419 Valley","ass_city":"Roodepoort","position":"-26.046604,27.944069",
           "current_bid":null,"yobid":0,"minimum_bid":null,"buy_now":null,"increment":null,"auction_id":null}
        */        
       //$('#response').html(jsonAsset.ass_id);
       //$("#frmEditItem").find('span[id="ass_name"]').html();
       var asset_name = jsonAsset.ass_name + " (" + jsonAsset.ass_ref + ")";
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;

       $("#frmEditItem").find('span[id="ass_name"]').html(asset_name);
       $("#frmEditItem").find('span[id="ass_name_header"]').html(asset_name);
       $("#frmEditItem").find('span[id="ass_description"]').html(jsonAsset.ass_description);
       $("#frmEditItem").find('span[id="ass_type"]').html(jsonAsset.ass_type);
       $("#frmEditItem").find('span[id="ass_address"]').html(asset_address);
       
       $("#frmEditItem").find('span[id="you_last_bid"]').html(jsonAsset.yobid);
       $("#frmEditItem").find('span[id="buy_now"]').html(jsonAsset.buy_now);
       $("#frmEditItem").find('span[id="increment"]').html(jsonAsset.increment);
       $("#frmEditItem").find('span[id="minimum_bid"]').html(jsonAsset.minimum_bid);
       $("#frmEditItem").find('span[id="current_bid"]').html(jsonAsset.current_bid);

       //Adjust map center
      if (typeof google === 'object' && typeof google.maps === 'object'){
          var assetLatLong = jsonAsset.position.split(",");
          var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
            var assetMapOptions = {
                center: assetLatLong,
                zoom: 14
            };
            
          mapA = new google.maps.Map(document.getElementById('map-canvas'), assetMapOptions);

          mapA.setCenter(assetLatLongObject);
          //mapA.setZoom(savedMapZoom);
          //Update Street View as well
          var panoramaOptions = {
            position: assetLatLongObject,
            pov: {
              heading: 34,
              pitch: 10
            }
          };
          document.getElementById('pano').value('');
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
          mapA.setStreetView(panorama);
      }

    })
    .fail(function () {
        alert("Error getting Asset/Site details");
        //$('#response').html("<b>Error getting Asset/Site details!</b>");
        //$("#frmEditItem .modal-body").find('span[id="description"]').html(' Asset ID: ' + a);

    });


    //Modal options
    var options = {
        "backdrop" : "true",
        "show" : "true"
    }

    //Show modal
    $('#editItemDetails').modal(options);
    }

        
	function modalshow_old(a) {
            
                var url = "<?php echo site_url();?>";
		var width, height, padding, top, left, modalbak, modalwin;
		width = 900;
		height = 500;
		padding = 64;
		top = (window.innerHeight - height - padding) / 2;
		left = (window.innerWidth - width - padding) / 2;


		$("#modalwin").load(url + "loadajax_1?c=" +a);

		modalbak = document.getElementById("modalbak");
		modalbak.style.display = "block";

		modalwin = document.getElementById("modalwin");
		modalwin.style.top = top + "px";
		modalwin.style.left = left + "px";
		modalwin.style.display = "block";
	}

	function modalhide() {
		document.getElementById("modalbak").style.display = "none";
		document.getElementById("modalwin").style.display = "none";
	}

</script>

<div id='modalbak'></div>
<div id='modalwin'>


</div>

