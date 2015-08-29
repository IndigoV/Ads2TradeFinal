<?php
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

#divSpecsheet div{
  
}
#divSpecsheet .modal .modal-dialog{ 
  width: 90%; 
  width: 900px;
}   
#frmSpecsheet .modal-body{
    overflow-y: scroll;
    height: 400px;
}

</style>

<!-- mapping requirements -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
        
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>
<!-- mapping requirements end -->

<div class="breadcrumbs" style="margin-top:-100px;">
	<h1><span class="glyphicon glyphicon-gift"></span> Indoor Assets </h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}
?>

<div id="popup_content" style="display:none">
    <div id="dialog_content">

    <form>
    <input type="hidden" name="ass_is_mall" id="ass_is_mall" class="dbfl" value="1">
    <input type="hidden" name="face" id="face" class="dbfl" value="fa">    
    <!--    
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
    -->        
            <div class="face_a_content">
<!--                <div class="btn-group tabs_wrap">
                    
                    <a href="#" class="btn btn-default active" id="basic">Basic Info</a>
                    
                    <a href="#" class="btn btn-default" id="production">Production Info</a>
                    <a href="#" class="btn btn-default" id="rate">Rate Info</a>      
                         
                </div>
--> 
                <div class="tab_content active" id="basic">
                    <button type="button" class="delete_new_asset close" aria-hidden="true">X</button>

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

<div class="main col-xs-12">

<ul class="nav navbar-nav section-menu">
	<li><a href="<?php echo site_url('load_stock'); ?>">Outdoor Assets</a></li>
	<li class="active"><a href="<?php echo site_url('malls'); ?>">Indoor Assets</a></li>
	<!--
	<li><a href="#" title="Coming Soon ...">Incoming Proposals<span class="badge"><?php echo $select_query->num_rows; ?></span></a></li>
	<li><a href="#" title="Coming Soon ...">Sold Items<span	class="badge"><?php echo $select_query1->num_rows; ?></span></a></li>
	-->
	
</ul>

    <div class="clear"></div>

    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        If you have a large number of assets to load, please email upload@ads2trade.co.za and one of our Account Managers will work with you directly.
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select the mode View, Edit or Add depending on what you want to do with your assets</div>

    <!-- 
    Buttons to determine the Mode (default to view mode)
    -->
    <input type="hidden" id="asset_mode" value="view" />
    <div class="btn-group asset_mode" data-toggle="buttons">
          <label class="btn btn-primary">
            <input value="view" type="radio" name="asset_mode" id="opt_add" title="Add Asset Mode">View
          </label>
        
          <label class="btn btn-primary">
            <input value="edit" type="radio" name="asset_mode" id="opt_edit" title="Edit Asset Mode">Edit
          </label>
        
          <label class="btn btn-primary">
            <input value="add" type="radio" name="asset_mode" id="opt_view" title="View Assets Mode">Add
          </label>  
    </div>

<!-- Maps -->
<br><br>
<div class="row col-md-12">
	<div class="col-xs-12">                
	  <label>Send Map To</label>
	  <input type="text" id="myPlaceTextBox" placeholder="Enter location" autocomplete="off" class="form-control" />
	</div>   
	<div class="col-xs-12" style="padding-top: 20px;">
	    <div class="map_wrap" style="margin-bottom: 60px; width:100%; ">
	        <div id="map-canvas"></div>
	    </div>
	</div>
</div> 

<br/>
<br/>

<!-- End Maps -->

<a href="<?php echo site_url("malls/mall"); ?>" class="btn btn-primary">Add New</a>
<table class="table table-bordered headed">
	<thead>
	<tr>
		<th>Mall Name</th>
		<th>&nbsp;</th>
	</tr>
	</thead>
	<?php foreach ($malls as $mall):?>
	<tr>
		<td><?php echo $mall['mall_name']?>&nbsp;</td>
		<?php $mall_id = $mall['mall_id']; ?>
		<td><a href="<?php echo site_url("malls/mall/$mall_id"); ?>" class="btn btn-primary">Edit</a></td>
	</tr>
	<?php endforeach; ?>
</table>
<a href="#" name="asset_edit_url" id="asset_edit_url"></a>
</div>

<script type="text/javascript">

	$(".asset_mode .btn").click(function() {
	    // whenever a button is clicked, set the hidden helper
	    $("#asset_mode").val($.trim($(this).text()));
	});

    var raw_markers = <?php echo json_encode($malls);?>; /* Load all assets for this user*/
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
            //check the Mode and determine whether or not to show the add asset marker modal
            //var asset_mode = $('input[name=asset_mode]').val();
            var asset_mode = $('#asset_mode').val();
            //alert("Asset Mode:" + asset_mode);

            if (disableListener || (asset_mode.toLowerCase() == "edit" || asset_mode.toLowerCase() == "view")) {
                //if view mode then zoom into map on click
                if(asset_mode.toLowerCase() == "view"){
                  //map.setCenter(map.setCenter());    //marker is marker to center on
                  map.setZoom(map.getZoom() + 1);                 
                }
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
                    //marker_details.mec_id = marker_details.med_id;
                    marker_details.mec_id = 25;
                }
                marker_details.ass_is_mall = 1;
                /*
                if(marker_details.ass_is_mall == 1){
                    marker_icon = base_url + 'assets/mapping/images/media_1.png';    
                } else {
                    marker_icon = base_url + 'assets/mapping/images/media_'+marker_details.mec_id+'.png'; 
                */
                marker_icon = base_url + 'assets/mapping/images/media_11.png';    

                //var position_parts = marker_details.position.split(',');

                var latLng = new google.maps.LatLng(marker_details.mall_latitude, marker_details.mall_longitude);
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    type: parseInt(marker_details.mec_id),
                    icon: marker_icon,
                    title: ""+marker_details.mall_name,
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
                    var mall_edit_url = '<?php echo site_url("malls/mall/"); ?>';

                    console.log(' maker clicked : ' + mall_edit_url+'/'+asset_mall_id);

                    $('#selected_asset_id').val(asset_id);

                    $("#asset_edit_url").attr("href",mall_edit_url+'/'+asset_mall_id);

                    $("#asset_edit_url").trigger('click');

                    window.location.href=mall_edit_url+'/'+asset_mall_id;

                    if(asset_is_mall == 1){
                        //map.originalEvent.preventDefault();
                        // this is a mall go to mall assets management
                        // or better yet prompt user to either choose to go manage auctions or manage mall items
                        //console.log(mall_assets_url + '/mall/'+asset_mall_id);
                        //window.location = mall_assets_url + '/mall/'+asset_mall_id;
                        //stop event propagation
                        //map.originalEvent.stopPropagation();
                    } 
                    //alert(' selected: ' + $('#selected_asset_id').val());
                    /*marker.getPosition()*/
                    /*
                    $.post(update_url, {postition: chagedPos}, function(result){
                        //result of the POST 
                        console.log(' marker drag/upd/post complete:'+result);
                    });
                */
                });

                //InfoWindow for popup with operations options
                //Edit - Auction - Specsheet - Activate/Diactivate - Streetview

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
    var AssetId = a;

    //Set the selected Asset id
    $('#selected_asset_id').val(AssetId);

    console.log('modal show' + a);

    $.ajax({
        type: 'GET',
        url: "<?php echo site_url('auctions/jsonGetAssetDetails'); ?>",
        data: { c: a, p: "details" }
    })
    .done(function (data) {
       console.log(data);
       var jsonAsset = $.parseJSON(data); 
       console.log(jsonAsset);

       var asset_name = " "+jsonAsset.ass_name;
       var asset_img = jsonAsset.asset_image;
       var dft_asset_img = "<?php echo base_url('assets/add1.jpg'); ?>";

       if(jsonAsset.ass_ref != ""){
        asset_name += " (" + jsonAsset.ass_ref + ")";
       }
       
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;
       var availability = "";
       if(jsonAsset.status == 1){
        availability = " In Active Auction "; 
       } else {
        availability = " Available "; 
       }

       if(asset_img !="" && asset_img != null){
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",asset_img);
       } else {
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",dft_asset_img);
       }

       $("#frmAssetOptions").find('span[id="ass_name"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="ass_reference"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="description"]').html(jsonAsset.ass_description);
       $("#frmAssetOptions").find('span[id="availability"]').html(availability);

       $("#frmAssetOptions .opAuction").attr("data-target","#addAuctionCart");
       $("#frmAssetOptions .opAuction").attr("data-toggle","modal");
       $("#frmAssetOptions .opAuction").attr("data-id",AssetId);
       $("#frmAssetOptions .opAuction").attr("data-name",asset_name);
       $("#frmAssetOptions .opAuction").attr("data-price",0);

       //Activate/deactivate button attributes
       //data-dismiss="modal"
       $("#frmAssetOptions .opActivate").attr("data-target","#siteActivate");
       $("#frmAssetOptions .opActivate").attr("data-toggle","modal");
       $("#frmAssetOptions .opActivate").attr("data-dismiss","modal");
       $("#frmAssetOptions .opActivate").attr("data-id",AssetId);
       $("#frmAssetOptions .opActivate").attr("data-name",asset_name);
       $("#frmAssetOptions .opActivate").attr("data-opActivate","Deactivate");

       $("#frmAssetOptions .opSpecsheet").attr("data-target","#frmSpecsheet");

       //Adjust map center
      if (typeof google === 'object' && typeof google.maps === 'object'){
          var assetLatLong = jsonAsset.position;
          console.log(' position: '+jsonAsset.position);
          assetLatLong = assetLatLong.split(",");
          //debugger;
          var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
            var assetMapOptions = {
                center: assetLatLongObject,
                zoom: 14
            };
            
          mapA = new google.maps.Map(document.getElementById('map-canvas-popup'), assetMapOptions);

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
          document.getElementById('pano-popup').innerHTML='';
          //$('div[id="pano"]').val('');
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano-popup').innerHTML, panoramaOptions);
          mapA.setStreetView(panorama);

          console.log(mapA);
          console.log(panoramaOptions);

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
    //$('#editItemDetails').modal(options);
    $('#frmAssetOptions').modal(options);
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
