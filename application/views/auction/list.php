<style>
  table {
    border-collapse: collapse;
    border-spacing: 0;
  }

  p {
    margin: 0.75em 0;
  }
        #map-canvas-sell {
    /*height: 100%;*/
    height: 500px;
    width:1053px;
    bottom: 0;
        position: absolute;
        left: 0;
    right: 0;
    top: 0;
    max-width:none; /* fix issue with grey areas on map*/
  }
  /* left align the text and checkboxes */
  div.mapping_legend{text-align: left;}

  @media print {
    #map_canvas {
      height: 950px;
    }
  }

  .filterBtn{
    width:auto;  /* overidde input width on the filter button */
  }

</style>

        <div class="breadcrumbs">
          <h1><span class="glyphicon glyphicon-list-alt"></span>Auctions / <?php echo $subtitle; ?></h1>
        </div>
<?PHP
//print_r($auction_areas);
?>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}
?>
        <form method="post" class="main col-xs-12 actions_home_page" action="">

          <div class="top_form">
            <div class="row">
              <div class="col-sm-3">
                <p>
                  <label for="first_name">Media Family</label>                         
                 <select name="mef_id[]" id="mef_id" data-placeholder="Media Family" style="width:100%;" multiple
                    class="chosen-select" tabindex="8">
             
                  <?php
                  $arry1 = $_POST['mef_id'];

                  foreach ($may_asset_family as $row) {?>
                  <option <?php for($i=0;$i<count($arry1);$i++){
                  if ($arry1[$i] == $row->mef_id){ echo 'Selected';}

                  } ?> value="<?php echo $row->mef_id;?>"  ><?php echo $row->mef_description;?></option>
                  <?php }
                  ?>
                
                </select>
                </p>
              </div>

              <div class="col-sm-3">
                <p>
                  <label for="first_name">Master Media</label>                         
                  <select name="mam_id[]" id="mam_id" data-placeholder="Master Media" style="width:100%;" multiple
                      class="chosen-select" tabindex="8">

                  <?php
                  $arry = $_POST['mam_id'];                            
                  foreach ($may_asset_master as $row) {?>
                      <option <?php 
                      for($i=0;$i<count($arry);$i++){
                            if ($arry[$i] == $row->mam_id){ 
                                echo 'Selected';
                            }
                          } ?> value="<?php echo $row->mam_id;?>"  ><?php echo $row->met_description;?></option>
                  <?php }
                  ?>
                </select>
                </p>
              </div>
              <div class="col-sm-3">
                <p>
                  <label for="first_name">Location</label>                         
                  <input class="form-control"  type="text" id="myPlaceTextBox"/>
                </p>
              </div>
              <div class="col-sm-3">
                <p>
                  <label for="duration">Duration</label>   
                  <br>                      
                  <select name="duration[]" data-placeholder="Select Duration" multiple
                  class=" chosen-select" tabindex="8">

                    <?php
                    $ar = $_POST['duration'];
                    foreach ($durations as $row) {?>
                      <option <?php for($i=0;$i<count($ar);$i++){
                                                                    if ($ar[$i] == $row->days){ echo 'Selected';}
                        } ?> value="<?php echo $row->days;?>" > <?php echo  $row->description; ?></option>
                    <?php 
                        }
                    ?>

                  </select>
                </p>
              </div>
<!--
              <div class="col-sm-3">
                <div class="row">
                  <p class="col-xs-6">
                    <label for="first_name">From Date</label>                           
                    <input type="date" vname="from_date" id="from_date" class="form-control">
                  </p>
                  <p class="col-xs-6">
                    <label for="first_name">To Date</label>                           
                    <input type="date" vname="to_date" id="to_date" class="form-control">
                  </p>
                </div>
              </div>

-->
            </div>

        <div class="row">
          <div class="col-sm-6">


              <p>
                <label for="filter">Site Name, Description or Location</label>  
                <input type="text" class="form-control" placeholder="Type Site Name, Description or Location ..." value="<?php echo isset($filter)?$filter:'';?>" name="filter">

              </p><!-- /input-group -->
              <!-- /.col-lg-6 -->

          </div>

          <div class="col-sm-2">
            <label for="first_name" style="padding:5px;">&nbsp;</label><br>
            <input type="submit" class="btn btn-primary filterBtn" value="Apply Filter">
          </div>

        </div>

            <div class="clear"></div>
          </div>
            
            
            <div class="text-center">
              <br>
              <div class="btn-group">
                <button type="button" class="btn btn-default show_auctions_locations active">Show Locations</button>
                <button type="button" class="btn btn-default show_auctions_map" id="showmap">Show Map</button>
              </div>
            </div>
            
      
      <div class="locations_view">

      <!-- Results Table -->
      <div class="locations_view" style="padding:30px;" id="wrap">
      <h4 class="h4">Items Found matching filter <i>"<?php echo isset($filter)?$filter:'';?>"</i></h4>
      <table class="table table-bordered headed table-striped" cellspacing="0" width="100%">
        <thead>
          <tr>
              <th></th>
              <th>Name/Ref</th>
              <th>Location</th>
              <!--<th>Product Group</th>-->
              <th align="right">Price/Rate</th>
              <th align="right">Fees</th>
              <th>Status</th>
              <th></th>
              <th>&nbsp;</th>
          </tr>
        </thead>
        <tbody>

      <?php

      $count = 0;
      $dat = '';
      //print_r($mm);

      if (!empty($mmm1)) {
        foreach ($mm as $row) {
          $count = $count + 1;
          $this->db->where('mec_id', $row->mec_id);
          $select_query = $this->db->get('media_category');
          if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

            foreach ($select_query->result() as $rows) {
              $dat = $rows->mec_description;
            }
          }
                                                                                  
          $this->db->where('days', $row->loc_id);
          $select_query = $this->db->get('durations');
          if ($select_query->num_rows > 0) { //echo "tapinda tapinda amai niyasha. musabaika bus service";exit();

            foreach ($select_query->result() as $rows) {
              $duration = $rows->description;
            }
          }

          //requires php 5.3+
          $date1 = new DateTime($row->starts);
          $date2 = new DateTime($row->ends);
          $difference = $date2->diff($date1);
          $diff = $difference->format("%a");

          //TODO: Find out what status id is in auctions table
          $status = 'Available'; 
          //id closed?
          //if($this->assssssetsi->assetReserved($row->ass_id)){
          if($row->reserved > 0){
            $status = 'Reserved';
            $diabled = "disabled";
          }
          //id suspended?
          if($row->reserved>0){
            //Either:
            // - A bid has been placed
            // - A buy now offer has been made
            // - ITem has been added to an RFP
            // - Item was manuyally marked as "reserved" by the Media owner
            $status = 'Reserved';
          }  

          $total = ($row->ass_acquisition_cost + $row->ass_proportional_costs);      
          ?>

          <tr>
              <td ><input type="checkbox" name="chosen_assets[]" value="<?php echo $row->ass_id; ?>"></td>
              <td id="<?php echo $row->ass_id; ?>">
                <span class="name"><?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?></span>
                <span style="visibility:hidden;" class="price"><?php echo $total; ?></span>
              </td>
              <td><?php echo $row->ass_street_address, ', ', $row->ass_city; ?></td>
              <!--<td></td>-->
              <td align="right"><?php echo "R",number_format($row->ass_acquisition_cost,2); ?></td>
              <td align="right"><?php echo "R",number_format($row->ass_proportional_costs,2); ?></td>
              <td><?php echo $status; ?></td>
              <td colspan="2" align="center" id="<?php echo $row->ass_id; ?>">
              <!--
              <a href="#">[PDF]</a>  
              <a href="#">[Edit]</a> 
              <a href="#">[Create Auction]</a> 
              <a href="#">[Activate]</a>
              -->
              
              <!--
              -->


              <a title="Create Auction" style="cursor:pointer" data-toggle="modal" data-target="#addAuctionCart" 
                data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>">
                <span class="h4 glyphicon glyphicon-shopping-cart"></span>
              </a>
              <a title="Activate Site" style="cursor:pointer"><span class="h4 glyphicon glyphicon-check"></span></a>
              <a title="Edit Site" style="cursor:pointer"><span class="h4 glyphicon glyphicon-edit"></span></a>
              <a title="View PDF Specsheet" style="cursor:pointer"><span class="h4 glyphicon glyphicon-book"></span></a>

              <!--
              <span style="visibility:hidden;z-index:-100;" class="name"><?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?></span>
              <span style="visibility:hidden;z-index:-100;" class="price"><?php echo $total; ?></span>
              -->

              </td>
          </tr>
      <?php
          } //end foreach
        } else { 
      ?>
          <tr>
              <td colspan="8">No Items Found</td> 
          </tr>
      <?php
        }
      ?>

        </tbody>
      </table>
      </div>


    </div>

        <!-- Locations view-->
    <div class="map_view">        
          <div id="map-canvas-sell" style="width:1053px;height:500px;"> Loading ... </div>
    </div>
              

      
        </form><!--Main -->


<!-- Mapping Requirements -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>
<script type="text/javascript">
  var raw_markers = <?php echo json_encode($mmm);?>;
  var base_url = '<?php echo base_url();?>';
  var adsMap = false;
  var map;

  $('#showmap').click(function(e){
    initialize();
    if(map){
      //alert('Show Map CLicked');
      //we have to set center for map after resize, but we need to know center BEFORE we resize it
      //$(window).resize();
      $(window).trigger('resize');
      var center = map.getCenter();
      google.maps.event.trigger(map, "resize"); //this fix the problem with not completely map
      map.setCenter(center);
      /*if (document.createEventObject) {   // IE before version 9
          var resizeEvent = document.createEventObject (window.event);
          //clickEvent.button = 1;  // left click
          window.fireEvent ("onresize", resizeEvent);
      }*/
    }
  });

  function initialize() {
    console.log('Initializing AdsMap');
    var mapOptions = {
      center: new google.maps.LatLng(-26.2044, 28.0456),
      zoom: 10 /*changed from 6 to remove grey area*/
    };
    map = new google.maps.Map(document.getElementById("map-canvas-sell"), mapOptions);

    google.maps.event.addListenerOnce(map, 'idle', function(){
        $(window).resize();
        //map.setCenter(-26.2044, 28.0456);
      //we have to set center for map after resize, but we need to know center BEFORE we resize it
      var center = map.getCenter();
      google.maps.event.trigger(map, "resize"); //this fix the problem with not completely map
      map.setCenter(center);
    });

    //Load markers
    var dont_show_info = false;
    var markers = [];
    for (var i in raw_markers) {
      (function (i) {
        var marker_details = raw_markers[i]
        console.log('Ugly hack to fix missing mec_id field');
        if (!marker_details.hasOwnProperty('mec_id')) {
          marker_details.mec_id = marker_details.med_id;
        }
        var position_parts = marker_details.position.split(',');

        var latLng = new google.maps.LatLng(position_parts[0], position_parts[1]);
        var marker = new google.maps.Marker({
          position: latLng,
          map: map,
          type: parseInt(marker_details.mec_id),
          asset_id: marker_details.ass_id
        });
        markers.push(marker);

//        google.maps.event.addListener(marker, 'click', function () {
//
//          modalshow(marker_details.ass_id);
//        });
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

</script>
<!-- End Mapping Requirements -->

<form name="frmCreateAuction" id="frmCreateAuction" method="post" action="create?action=create&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva">
<div class="modal fade" id="addAuctionCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-shopping-cart"></span>
      <?php echo isset($ass_name)?$ass_name:'Create A New Auction';?></h4>
    </div>

    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0>
      <input type="hidden" value="" name="ass_name" id="ass_name">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>-->
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
    <div class="row">
      <p class="col-xs-6">
      <label for="from_date">Duration: <span id="price" name="price"></span></label> 
      <select class="form-control" name="duration" id="duration">
      <?php                                    
      $ar = $this->input->post('duration');
      foreach ($durations as $row) {?>
        <option <?php for($i=0;$i<count($ar);$i++){
                        if ($ar[$i] == $row->days){ echo 'Selected';}
                      } ?> 
          value="<?php echo $row->days;?>" > <?php echo  $row->description; ?></option>
      <?php }
      ?>

      </select>
      </p>
      <!--
      <p class="col-xs-6">
          <label for="from_date">Price: <span id="price" name="price"></span></label>                           
          <input type="hidden" name="price" value="" id="price" class="form-control">
      </p>   
      -->  
      <?php
      //Get the next monday
      $from_next_monday = date('Y-m-d', strtotime('next monday'));
      ?> 
      <p class="col-xs-6">
          <label for="from_date">Start Date</label>                           
          <input type="date" name="from_date" value="<?php echo $from_next_monday;?>" id="from_date" class="form-control">
          <input type="hidden" name="to_date" value="" id="to_date" class="form-control">
      </p>
      <p class="col-xs-6">
          <label for="price">Minimum Bid Amount</label>                           
          <input type="text" name="price" value="<?php echo $minimum_bid;?>" id="price" class="form-control">
      </p> 
      <p class="col-xs-6">
          <label for="increment">Bid Increment Amount</label>                           
          <input type="text" name="increment" value="<?php echo $increment;?>" id="increment" class="form-control">
      </p> 
      <p class="col-xs-6"> 
          <label for="buy_now">Allow Buy Now</label>                           
          <input type="checkbox" name="allow_buy_now" value="1" id="allow_buy_now" >
      </p>
      <p class="col-xs-6"> 
          <label for="buy_now">Buy Now Price</label>                           
          <input type="text" name="buy_now" value="<?php echo $buy_now;?>" id="buy_now" class="form-control">
      </p>
      </div>
    </div>

    <div class="modal-footer" style="padding-top:30px;">
      <button type="submit" onclick="document.frmCreateAuction.submit();return false;" class="btn btn-primary" data-dismiss="modal">Create Auction</button>
    </div>
  </div>
</div>
</div></form>

<script language="javascript" type="text/javascript">

$('#frmCreateAuction').on('submit', function(){
  alert('Creating Auction ...');
});

//triggered when modal is about to be shown
$('#addAuctionCart').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     var AssetPrice = $(e.relatedTarget).data('price');

     //console.log('ID:'+AssetId + AssetName + AssetPrice);
     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="description"]').html(AssetName);
     $(e.currentTarget).find('input[name="ass_name"]').val(AssetName);

     // price details, minimum bid etc
     $(e.currentTarget).find('input[name="price"]').val(AssetPrice);
     $(e.currentTarget).find('input[name="auction_min"]').val(AssetPrice);
     
});

</script>

<script>
  function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin;
    width = 900;
    height = 500;
    padding = 64;
    top = (window.innerHeight - height - padding) / 2;
    left = (window.innerWidth - width - padding) / 2;


    $("#modalwin").load("loadajax?c=" + a +"&p=asset_details3");

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

