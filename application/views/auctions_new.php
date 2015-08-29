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
          <h1><span class="glyphicon glyphicon-list-alt"></span>Auctions</h1>
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
              <div class="col-sm-2">
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

              <div class="col-sm-2">
                <p>
                  <label for="first_name">Master Media</label>                         
                  <select name="mam_id[]" id="mam_id" data-placeholder="Master Media" style="width:100%;" multiple
				        class="chosen-select" tabindex="8">

					<?php
                                        $arry = $_POST['mam_id'];
                                        
					foreach ($may_asset_master as $row) {?>
                                    <option <?php for($i=0;$i<count($arry);$i++){
                                        if ($arry[$i] == $row->mam_id){ echo 'Selected';}

} ?> value="<?php echo $row->mam_id;?>"  ><?php echo $row->met_description;?></option>
					<?php }
					?>
				</select>
                </p>
              </div>
            <div class="col-sm-2">
                <p>
                  <label for="first_name">Location</label>                         
                  <input class="form-control"  type="text" id="myPlaceTextBox"/>
                </p>
              </div>
                <div class="col-sm-1">
                <p>
                  <label for="first_name">Duration</label>                         
                  <select name="duration[]" data-placeholder="Select Duration" multiple
					        class=" chosen-select" tabindex="8">

						<?php
                                                $ar = $_POST['duration'];
						foreach ($durations as $row) {?>
							<option <?php for($i=0;$i<count($ar);$i++){
                                                            if ($ar[$i] == $row->days){ echo 'Selected';}
} ?> value="<?php echo $row->days;?>" > <?php echo  $row->description; ?></option>
						<?php }
						?>


					</select>
                </p>
              </div>

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
		    <br>
		    <h3 class="h3">Auctions by Area</h3>
		    <br>
		        <div class="row">
		        
		        <?php
		        
		        //echo 'testing';
		        $rowitems_count = 1;
		        $colitems_count = 0;
		        $max_items_per_row = 4;
		        $max_items_per_col = 2;
		        $new_row = true;
		        $new_col = true;
		        $total_areas = count($auction_areas);
		        //print_r($auction_areas);
		        foreach ($auction_areas as $area) {
		            //if($area->ass_province == 'GP'){
		              if($rowitems_count == 1){
		                echo '<div class="col-sm-3">';
		                echo '<ul class="list-unstyled">';
		              }
		                echo '    <li><a href="./auction_details?auction_id='.$area->id.'&area='.$area->ass_city.'&duration=7&aset=5">'.$area->ass_city.' ('.$area->area_count.')</a></li>';

		              if($rowitems_count == $max_items_per_col){
		                echo '  </ul>';
		                echo '</div>';
		                $rowitems_count = 1;
		              } else {
		                $rowitems_count++;
		              }   
		            //}
		            
		          } 
		          
		        ?>

		      </div>


              <div class="table_div">

		    <br>
		    <br>
		    <h3 class="h3">Auction Rooms</h3>

			<table class="table table-bordered headed" cellspacing="0" width="100%">
				<thead>
					<tr>
					  <th>Room Type / Duration</th>
					  <th>Start Date</th>
					  <th>End Date</th>
					  <th>Total Auctions</th>
					  <th></th>
					</tr>
				</thead>
			<tbody>
				<?php
				// ******* Billboard Media Rooms ******** 
				$monday_next_week = date('Y-m-d', strtotime('next monday'));
				$months = 0;
				$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +$months month")); 

				for($j=1; $j<=3; $j++){

					$months = $j;
					
					$next_auction_ends_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_start_date)) . " +$months month -1 day")); 
					
				?>
					<tr>
					  <td><?php echo 'Billboards (',$j, ' Months) '; ?></td>
					  <td><?php echo $next_auction_start_date,' 00:00';?></td>
					  <td><?php echo $next_auction_ends_date,' 23:59';?></td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>	
				<?php
					$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_ends_date)) . " +1 day")); //Move Monday next week so that we dont calculate end date based on initial monday
				} 
				?>	
					<tr>
					  <td> Billboards (>3 Months) </td>
					  <td> <?php echo date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +3 month")),' 00:00'; ?> </td>
					  <td> Varies </td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>

					<tr class="grey">
						<td class="grey" colspan="5"></td>
					</tr>	

				<?php
				// ******** Print Media Rooms ********* 
				$monday_next_week = date('Y-m-d', strtotime('next monday'));
				$months = 0;
				$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +$months week")); 

				for($j=1; $j<=3; $j++){

					$months = $j;
					
					$next_auction_ends_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_start_date)) . " +$months week -1 day")); 
					
				?>
					<tr>
					  <td><?php echo 'Print (',$j, ' Weeks) '; ?></td>
					  <td><?php echo $next_auction_start_date,' 00:00';?></td>
					  <td><?php echo $next_auction_ends_date,' 23:59';?></td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>	
				<?php
					$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_ends_date)) . " +1 day")); //Move Monday next week so that we dont calculate end date based on initial monday
				} 
				?>	
					<tr>
					  <td> Print (>3 Weeks) </td>
					  <td> <?php echo date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +3 week")),' 00:00'; ?> </td>
					  <td> Varies </td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>
					<tr class="grey">
						<td class="grey" colspan="5"></td>
					</tr>	


				<?php
				// ***** Digital Media Rooms ********
				$monday_next_week = date('Y-m-d', strtotime('next monday'));
				$months = 0;
				$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +$months day")); 

				for($j=1; $j<=3; $j++){

					$months = $j;
					
					$next_auction_ends_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_start_date)) . " +$months day -1 day")); 
					
				?>
					<tr>
					  <td><?php echo 'Digital (',$j, ' Days) '; ?></td>
					  <td><?php echo $next_auction_start_date,' 00:00';?></td>
					  <td><?php echo $next_auction_ends_date,' 23:59';?></td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>	
				<?php
					$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_ends_date)) . " +1 day")); //Move Monday next week so that we dont calculate end date based on initial monday
				} 
				?>	
					<tr>
					  <td> Digital (>3 Days) </td>
					  <td> <?php echo date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +3 day")),' 00:00'; ?> </td>
					  <td> Varies </td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>
					<tr class="grey">
						<td class="grey" colspan="5"></td>
					</tr>	


				<?php
				/*
				// ***** Radio Media Rooms ********
				// Aution room detail link example from auction_new.php (old)
				//<a href="auction_details?auction_id=<?php echo $row->id;?>&area=<?php echo $row->ass_city;?>&duration=<?php echo $row->loc_id; ?>&aset=<?php echo $row->mec_id; ?>">
				//
				*/
				$monday_next_week = date('Y-m-d', strtotime('next monday'));
				$months = 0;
				$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +$months day")); 

				for($j=1; $j<=3; $j++){

					$months = $j;
					
					$next_auction_ends_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_start_date)) . " +$months day -1 day")); 
					
				?>
					<tr>
					  <td><?php echo 'Radio / TV (',$j, ' Days) '; ?></td>
					  <td><?php echo $next_auction_start_date,' 00:00';?></td>
					  <td><?php echo $next_auction_ends_date,' 23:59';?></td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>	
				<?php
					$next_auction_start_date = date('Y-m-d', strtotime(date("Y-m-d", strtotime($next_auction_ends_date)) . " +1 day")); //Move Monday next week so that we dont calculate end date based on initial monday
				} 
				?>	
					<tr>
					  <td> Radio / TV (>3 Days) </td>
					  <td> <?php echo date('Y-m-d', strtotime(date("Y-m-d", strtotime($monday_next_week)) . " +3 day")),' 00:00'; ?> </td>
					  <td> Varies </td>
					  <td><span class="badge"><?php echo rand(10,30); ?></span></td>
					  <td></td>
					</tr>
					<tr class="grey">
						<td class="grey" colspan="5"></td>
					</tr>	


			</tbody>
			</table>

		</div>

		</div>




            
        </form><!--Main -->

        <!-- Locations view-->
		<div class="map_view">        
		      <div id="map-canvas-sell" style="width:1053px;height:500px;"> Loading ... </div>
		</div>
		

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

function buy_now(id){
    
	bid =  document.getElementById('bid').value * 1;
	min =  document.getElementById('minimum').value * 1;
	buy_now_amt =  document.getElementById('buy_now').value * 1;
	auct_id =  document.getElementById('auct_id').value;
	location.href="buy_now?buy_now="+buy_now_amt+"&bid="+bid+"&ass_id="+id+"&auct_id="+auct_id;

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
