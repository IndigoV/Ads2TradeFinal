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

  div #frmEditItem{
    /* new custom width */
    width: 860px;
  }

</style>
<style type="text/css">
/** FIX for Bootstrap and Google Maps Info window styes problem 
infoWindow X button was not showing **/
img[src*="gstatic.com/"], img[src*="googleapis.com/"] {
max-width: none;
}
</style>

        <div class="breadcrumbs">
          <h1><span class="glyphicon glyphicon-list-alt"></span>Auctions / Create</h1>
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

                    <select name="mef_id[]" id="mef_id" data-placeholder="Select Media Type" style="width:100%;" multiple="multiple" class="select2dropdown" tabindex="8">

                        <?php 
                        $ar3 = $this->input->post('mef_id'); //print_r($ar); exit;
                        foreach ($ar3 as $data) {
                            echo "<option value='".$data."' selected>".$data."</option>";
                        }?>

                        <?php foreach ($my_families as $data) {
                            echo "<option value='".$data->mef_description."'>".$data->mef_description."</option>";
                        }?>
                    </select>                
                </p>
              </div>

              <div class="col-sm-3">
                <p>
                  <label for="first_name">Master Media Type</label>        

                    <select name="mec_id[]" id="mec_id" data-placeholder="Select Media Type" style="width:100%;" multiple="multiple" class="select2dropdown" tabindex="8">
                        <?php 
                        $ar2 = $this->input->post('mec_id'); //print_r($ar); exit;
                        foreach ($ar2 as $data) {
                            echo "<option value='".$data."' selected>".$data."</option>";
                        }?>

                        <?php
                        //$ar = $_POST['duration'];
                        //$ar2 = $this->input->post('mec_id'); //print_r($ar); exit;
                        foreach ($all_media as $data) {?>
                          <option 
                          <?php 
                          for($i=0;$i<count($ar2);$i++){
                                if ($ar2[$i] == $data->description){ 
                                  if(!is_null($data->description) && $data->description <>''){
                                    echo 'Selected';
                                  }
                                }
                            } ?> value="<?php echo $data->description;?>" > <?php echo  $data->description; ?></option>
                        <?php 
                            }
                        ?>

                    </select>

                </p>
              </div>
              <div class="col-sm-3">

                <p>
                  <label for="myPlaceTextBox">Enter Locations Required</label>
                  <input class="form-control" type="text" id="myPlaceTextBox" name="location" placeholder="Enter a location" multiple="multiple" class="select2dropdown" autocomplete="off"/><br />
                </p>
                <ul class="interests_wrapper" id="likes">
                </ul>

              </div>
              <div class="col-sm-3">
                <p>
                  <label for="duration">Duration</label>   
                  <br>                      
                  <select name="duration[]" data-placeholder="Select Duration" multiple="multiple" class="select2dropdown" tabindex="8" style="width:100%;">

                    <?php
                    //$ar = $_POST['duration'];
                    $ar = $this->input->post('duration');
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
      <?php 
      //$all_filters = var_dump($mec_id).' - '.$location. ' - '. var_dump($duration);
      ?>
      <h4 class="h4">Items Found matching filter <i>"<?php echo isset($filter)?$filter:'';?>"</i></h4>
      <table class="table table-bordered headed table-striped" cellspacing="0" width="100%">
        <thead>
          <tr>
              <th></th>
              <th>Name/Ref</th>
              <th>Type</th>
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

      if (!empty($mm)) {
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
          $disabled = false;
          $action = "Deactivate";
          $create_auction_msg = "Create Auction"; 

          if($row->reserved > 0){
            $status = 'Reserved';
            $disabled = true;
            $action = "Activate";
            $asset_status_detail = $row->ass_status_detail;
            if($asset_status_detail == 1){ // Auction
              $create_auction_msg = "This Asset is currently on an active Auction";
            } 
            if($asset_status_detail == 2) {
              $create_auction_msg = "This Asset is currently on an active RFP/Campaign";
            }
            
            $create_auction_msg = "This Asset needs to be activated";
          }
          //id suspended?
          if($row->reserved>0 ){
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
              <td><?php echo $row->mec_description; ?></td>
              <td><?php echo $row->ass_street_address, ', ', $row->ass_city; ?></td>
              <td align="right"><?php echo "R",number_format($row->ass_acquisition_cost,2); ?></td>
              <td align="right"><?php echo "R",number_format($row->ass_proportional_costs,2); ?></td>
              <td><?php echo $status; ?></td>
              <td colspan="2" align="center" id="<?php echo $row->ass_id; ?>">
                <a title="<?php echo $create_auction_msg; ?>" style="cursor:pointer" data-toggle="modal" data-target="#addAuctionCart" 
                  data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>"
                  class="<?php echo ($disabled)?'btn-disabled':''; ?>">
                  <span class="h4 glyphicon <?php echo ($disabled)?'glyphicon-lock':'glyphicon-shopping-cart'; ?>"></span>
                </a>

                <a title="<?php echo $action;?> Site" style="cursor:pointer" data-toggle="modal" data-target="#siteActivate"
                  data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>"
                  data-modal-action="<?php echo $action;?>">
                <span class="h4 <?php echo ($disabled)?'glyphicon glyphicon-unchecked':'glyphicon glyphicon-check'; ?>"></span></a>

                <a title="Edit Site" style="cursor:pointer" data-toggle="modal" data-target="#editItemDetails" data-id="<?php echo $row->ass_id; ?>">
                  <span class="h4 glyphicon glyphicon-edit"></span>
                </a>

                <a title="View PDF Specsheet" style="cursor:pointer" href="<?php echo site_url('load_stock/spec_sheet?ass_id='.$row->ass_id); ?>" target="_blank"><span class="h4 glyphicon glyphicon-book"></span></a>

              </td>
          </tr>
      <?php
          } //end foreach
        } else { 
      ?>
          <tr>
              <td colspan="8">No Items/Sites Found</td> 
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
          <div id="map-canvas-sell" style="width:1053px;height:500px;"> Loading AdsMap... </div>
    </div>
              

      
        </form><!--Main -->


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
          <input type="checkbox" name="allow_buy_now" value="1" id="allow_buy_now" checked="checked">
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

<!-- Activate / Desctivate Modal -->

<form name="frmActivate" method="post" action="create?action=activate&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva">
<div class="modal fade" id="siteActivate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-check"></span>
      <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action">Activated/Deactivated</span> Stock Item';?></h4>
    </div>  
    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0>
      <input type="hidden" value="" name="ass_name" id="ass_name">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>-->
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
      <h4 class="text-center">This Stock Item will be <span id="modal-action2" name="modal-action">Activated/Deactivate</span>d</h4>
    </div>
    <div class="modal-footer">
      <button type="button" onclick="document.frmActivate.submit();return false;" class="btn btn-primary" data-dismiss="modal">
      <span id="modal-action3" name="modal-action">Proceed</span>
      </button>
    </div>
  </div>
</div>
</div></form>

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

<!-- Mapping Requirements -->
<!--
<script>
function initialize() {
var fenway = new google.maps.LatLng('-26.2044,28.0456');
var mapOptions = {
center: fenway,
zoom: 14
};
var map = new google.maps.Map(
  document.getElementById('map-canvas'), mapOptions);
var panoramaOptions = {
position: fenway,
pov: {
  heading: 34,
  pitch: 10
}
};
var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
map.setStreetView(panorama);
}
<?php echo "initialize();";?>

</script>
-->

<script>
function bid_now(id){
    
bid =  document.getElementById('bid').value * 1;
min =  document.getElementById('minimum').value * 1;
auct_id =  document.getElementById('auct_id').value;
if (bid < min ){ 
    alert("Please Enter An Amount Greater of Equal to Minimum Bid Amount "+ min);
    return;
  }else{
     location.href="bid?bid="+bid+"&ass_id="+id+"&auct_id="+auct_id;
  }
}

//initialize();

</script>


<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>

<script type="text/javascript">
  var raw_markers = <?php echo json_encode($mmm);?>;
  var base_url = '<?php echo base_url();?>';
  var adsMap = false;
  var map, mapA; //map (main map): mapA (for asset popup)

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

    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker;

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
        //console.log('Ugly hack to fix missing mec_id field');
        //console.log(marker_details);
        if (!marker_details.hasOwnProperty('mec_id')) {
          marker_details.mec_id = marker_details.med_id;
        }
        var position_parts = marker_details.position.split(',');

        var latLng = new google.maps.LatLng(position_parts[0], position_parts[1]);
        //var marker = new google.maps.Marker({
        marker = new google.maps.Marker({
          position: latLng,
          map: map,
          type: parseInt(marker_details.mec_id),
          asset_id: marker_details.ass_id
        });
        markers.push(marker);

        // Allow each marker to have an info window    
        //infoWindow content
        var infoWindowContent = '<div>' +
                                '<b>'+marker_details.ass_name+'</b><br>' +
                                '<p>'+marker_details.ass_description+'</p>' +    
                                //'<a href="#" onclick("modalshow('+marker_details.ass_id+')")> More Info ...</a>' +
                                '</div>';

        google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
            return function() {
            //open the infowindow when it's not open yet
            if(infoWindowContent!=infoWindow.getContent()){
                infoWindow.setContent( infoWindowContent );
                infoWindow.open(map, marker);
              }

            }
        })(marker, i));


        google.maps.event.addListener(marker, 'click', function(marker, i) {
            //when the infowindow is open, close it, open the asset details popup, and clear the contents of the infoWindow
            if(infoWindowContent==infoWindow.getContent())
            {
              infoWindow.close(map, marker);
              infoWindow.setContent('');
              //alert('Loading Asset Popup...');
              modalshow(marker_details.ass_id);
            }
            //otherwise trigger mouseover to open the infowindow
            else
            {
              google.maps.event.trigger(marker, 'mouseover');
            }
        });

        //clear the contents of the infwindow on closeclick
        google.maps.event.addListener(infoWindow, 'closeclick', function(marker, i) {
              infoWindow.setContent('');
        });

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
        modalshow(clicked_marker.asset_id);   /// ****** SHOW ASSET MODAL 
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

    //Initilize Asset maps/streetview 
    var assetLatLong = new google.maps.LatLng(-26.2044, 28.0456);
    var assetMapOptions = {
    center: assetLatLong,
    zoom: 14
    };
    
    mapA = new google.maps.Map(
    document.getElementById('map-canvas'), assetMapOptions);
    var panoramaOptions = {
      position: assetLatLong,
      pov: {
      heading: 34,
      pitch: 10
    }
    };
    var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
    mapA.setStreetView(panorama);

  }

  google.maps.event.addDomListener(window, 'load', initialize);

  function search_poi() {
    adsMap.add_message('Please click on the area where you would like to search.', 10);
    adsMap.search_poi();
    //alert(map.getCenter());     //**** POI Map Center
    //form-control mapping_poi_radius
  }

</script>
<!-- End Mapping Requirements -->


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

$('#siteActivate').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     //var AssetPrice = $(e.relatedTarget).data('price');
     var ModalAction = $(e.relatedTarget).data('modal-action');

     //console.log('ID:'+AssetId + AssetName + AssetPrice);
     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="description"]').html(AssetName);
     $(e.currentTarget).find('input[name="ass_name"]').val(AssetName);
     
     //data-modal-action
     $(e.currentTarget).find('span[name="modal-action"]').html(ModalAction);

     // price details, minimum bid etc
     //$(e.currentTarget).find('input[name="price"]').val(AssetPrice);
     //$(e.currentTarget).find('input[name="auction_min"]').val(AssetPrice);
     
});


</script>

<script>

  function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin;
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

  function specSheetModal(a) {
    alert('Loading Specsheet ...');
    var width, height, padding, top, left, modalbak, modalwin;
    width = 900;
    height = 500;
    padding = 64;
    top = (window.innerHeight - height - padding) / 2;
    left = (window.innerWidth - width - padding) / 2;


    $("#modalwin").load("load_stock/spec_sheet?ass_id=" + a +"&session=sadsadsadde#QddSCscdscdc&d=jvnfvjfnvjn&f=577585");

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

<div id="ajax-modal" class="modal fade" tabindex="-1" style="display: none;"> ccccc </div>

<div id='modalbak'></div>
<div id='modalwin'>
</div>

