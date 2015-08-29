<?php
//error_reporting(0);
echo $map_1['js'];echo $map_3['js'];echo $map_5['js'];echo $map_7['js'];echo $map_9['js']; 
echo $map_2['js'];echo $map_4['js'];echo $map_6['js'];echo $map_8['js'];echo $map_10['js']; 

//print_r($asset_details);

$bid_range = $this->input->post('bid_range');

 ?>        


		<div class="breadcrumbs">
		    <h1><span class="glyphicon glyphicon-list-alt"></span><a href="#">Auctions</a> / <?php echo $this->input->get('area');?></h1>
		</div>

		<?php 
		$user_type = $this->session->userdata('user_type');
		$user_id = $this->session->userdata('user_id');
		if($user_type == 2 || $user_type == 3 || $user_type > 0){
		  $this->load->view('auction/topmenu');
		}
		?>
		
		<?php
		               
		$this->db->where("watch_list.status", '1');
		//$this->db->where("auctions.status", '1');
		$this->db->where("watch_list.use_id", $user_id );
		$this->db->select('distinct(auction) as auction');
		$this->db->from('auctions');
		$this->db->join('watch_list','watch_list.auction = auctions.id');
		$this->db->join('asset','asset.ass_id = auctions.ass_id');
		$select_query1 = $this->db->get(); 

		$this->db->where("bids.status", '1');
		$this->db->where("auctions.status", '1');
		$this->db->where("bids.bidder", $user_id );
		$this->db->select('distinct(auction) as auction');
		$this->db->from('auctions');
		$this->db->join('bids','bids.auction = auctions.id');
		$this->db->join('asset','asset.ass_id = auctions.ass_id');
		$select_query = $this->db->get();  

		?>

	<div>
    <div class="main col-xs-12">

      <ul class="nav navbar-nav section-menu">
        <li class="active">
        	<a href="../load_stock/asset_details3">Search</a>
        </li>
        <li><a href="../load_stock/active_bids">Your Active Bids<span class="badge"><?php echo $select_query->num_rows;?></span></a></li>
        <li><a href="../load_stock/watch_list">Watch List<span class="badge"><?php echo $select_query1->num_rows;?></span></a></li>
        <li><a href="../load_stock/won_bids">Won Bids</a></li>
        <li><a href="../load_stock/lost_bids">Lost Bids</a></li>
      </ul>

    </div>

    <form method="post" class="main col-xs-12 actions_home_page" action="">
                     
      <div class="text-center">
        <div class="btn-group">
          <button type="button" class="btn btn-default show_auctions_locations active">Show Locations</button>
          <button type="button" class="btn btn-default show_auctions_map" id="showmap">Show Map</button>
        </div>
      </div> 

    </form>

    </div>

      <!-- Results Table -->
      <div class="locations_view" style="padding:30px;" id="wrap">

    	<h3 class="h3">Filter Results</h3>
    	<h4 class="h4">(<?php echo "Bid Range: ",($bid_range=='')?'All':'R'.$bid_range; ?>)</h4>

          <div class="clear"></div>

           
              <div class="row">
                <div class="col-sm-9">

                   <?php
					$a = 0;

					/*
					We need to get the minimum and max values for the bid range
					format is min_val-max_val or >min_val

					We will use bid range to filter assets by 
					*/
					$bid_range_minimum = 0;
					$bid_range_maximum = 999999999999;
					if($bid_range!=''){
						if(substr($bid_range, 0, 1)=='>'){
							$bid_range_values = explode(">", $bid_range);
							$bid_range_minimum= $bid_range_values[1];
							$bid_range_maximum= 999999999999;
						} else {
							$bid_range_values = explode("-", $bid_range);
							$bid_range_minimum= $bid_range_values[0];
							$bid_range_maximum= $bid_range_values[1];							
						}
					}

					//echo " $bid_range_minimum - $bid_range_maximum";
					foreach ($asset_details as $row) {

						foreach($current_bid as $bid_data){
                            	//$latest_bid = $bid_data->currentBid;
                        }
						//Filter assets on bid range (if any)
						//echo "$bid_range-$latest_bid-$bid_range_minimum-$bid_range_maximum";
						//if(($bid_range !='') && ($latest_bid >= $bid_range_minimum) && ($current_bid <= $bid_range_maximum)){

						//Current asset's id
						$asset_id = $row->ass_id;

						//assets's auction id
						$auction_id = $row->id;
						//Latest bid
						$latest_bid = $row->current_bid;
						//Buy now price
						$buynow_price = $row->buy_now;

						//Auction start date
						$auction_starts = $row->starts;

						//bid increment
						$increment = $row->increment;

						$a = $a + 1;
						$b = 'map_'.$a; 
						$c = 'map_canvas'.$a; 

						$this->db->where('tow_id', $row->loc_id);
						$select_query = $this->db->get('town');

						if ($select_query->num_rows > 0){
							foreach ($select_query->result() as $rows){
								$town=$rows->tow_description;                      
							}
						}   
			                
			            $this->db->where('auction', $row->id);
			            $this->db->where('bidder', $this->session->userdata('use_id'));
			            $select_query = $this->db->get('bids');

						if ($select_query->num_rows > 0){
							foreach ($select_query->result() as $rows){
								$yobid=$rows->bid;                               
							}
						}

						//Today's date
						$todayDate = date("Y-m-d H:i:s", mktime(0, 0, 0)); 
						//Start date
						$startDate = date($auction_starts, mktime(0, 0, 0)); 
						//End date
						$endDate = date($row->ends, mktime(0, 0, 0)); 

						//Disable bid/buynow buttons if start date > today or end date < today
						if($row->status == 1 || ($auction_starts <= $todayDate) || ($endDate >= $todayDate)){
							$css_disabled = '';
						} else {
							$css_disabled = 'disabled';
						}
						
						//Asset Images 
						$asset_images = $this->assets->getAssetImages($asset_id);
						//print_r($asset_images[0]->upd_url); 
						//picture url, we need to show these (if any are present, else show placeholder)
						$asset_image_url = $asset_images[0]->upd_url;
						$a_href_class = 'pic'; //default to the placeholder picture
						$a_href_class_css = ''; //No custom css
						if($asset_image_url != ''){
							$a_href_class = 'pic'.$asset_id;
							$a_href_class_css = "
								<style>	
								.assets_box .$a_href_class {
									background-image: url($asset_image_url);
								}
								</style>
							"; //Custom css to use asset picture instead of placeholder
						}

						//Auction end date
						$auction_ends = $row->ends;

						//Get days/hours before auction ends
						$au_now  = date_create(date('Y-m-d H:j:s'));
						$au_ends = date_create($auction_ends);
						$au_diff = date_diff($au_ends, $au_now);
						$auction_ends_in_x_dys_y_hrs = "";
						//get the days
						if($au_diff->d > 0){
							$auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->d.($au_diff->d>1)?$au_diff->d.' days ':' day ';
						}
						//get the hours
						if($au_diff->h > 0){
							$auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->h.($au_diff->h>1)?$au_diff->h.' hours ':' hour ';
						}

						//Get Artwork lead time & unit
						$auction_ends_timestamp = strtotime($auction_ends);
						$asset_lead_time = $this->assets->getAssetLeadTime($asset_id);
						//make sure lead time value is an int for the datetime functions to work properly
						$lead_time_value = intval($asset_lead_time[0]->ass_lead_time);
						// lead time unit e.g. day, week, month etc
						$lead_time_unit = $asset_lead_time[0]->meu_unit;

						// Add lead time to the auction end date to get the artwork required by date
						$artwork_by_timestamp = strtotime ( "+$lead_time_value $lead_time_unit" , 
																strtotime ( $auction_ends) ) ;
						$artwork_by = date ( 'Y-m-d' , $artwork_by_timestamp );

						// To be displayed next to the artwork required by date
						// Pluralise where necessary
						$artwork_by_text = ", after auction ends";
						if($lead_time_value>0 && $lead_time_unit !=''){
							$lead_time_unit .= ($lead_time_value>1)?'s':''; //pluralise if lead time value is > 1
							$artwork_by_text = ", $lead_time_value $lead_time_unit after auction ends ";
						} 

			      ?>
			      <?php echo $a_href_class_css; ?>
                  <div class="assets_box">

                    <a 
                    	href="asset?auction_id=<?php echo $auction_id;?>&ass_id=<?php echo $row->ass_id;?>" 
                    	class="pic <?php echo $a_href_class; ?>">
                    </a>
                    <div class="info">
                      <table>
                        <tbody>
                          <tr>
                            <td width="150px;">Asset Name/Number:</td>
                            <td>
                            	<?php 
                            		echo $row->ass_name;
                            		if($row->status == 1){
                            			if( $auction_starts > $todayDate){
                            				
                            				echo ' (NOT YET OPEN)';
                            				$css_disabled = 'disabled';

                            			} elseif( ($auction_starts <= $todayDate) && ($endDate >= $todayDate) ){
                            			   echo ' (ACTIVE)';
                            			} else {
                            				echo ' (CLOSED)';	
                            				$css_disabled = 'disabled';
                            			}

                            		} elseif($row->status == 2){
                            			echo ' (SOLD)';
                            			$css_disabled = 'disabled';
                            		} elseif($row->status == 9){
                            			echo ' (CANCELLED)';
                            			$css_disabled = 'disabled';
                            		} else {
                            			echo ' (NOT YET OPEN)';
                            			$css_disabled = 'disabled';
                            		}
                            	?>

                            </td>
                          </tr>
						<!-- 
                          <tr>
                            <td>Current Status:</td>
                            <td><?php echo $row->status;?></td>
                          </tr>
 						-->                      
 						  <tr>
                            <td>Current Bid:</td>
                            <td>
                            R<?php echo number_format($latest_bid,2); ?>
                            </td>
                          </tr>
						  <!--                           
						  <tr>
                            <td>Your Bid:</td>
                            <td>R<?php foreach($last_bid as $my_bid){echo number_format($my_bid->myCurrentBid,2);}?></td>
                          </tr> 
                          -->
                          <tr>
                            <td>Start Date:</td>
                            <td><?php echo $row->starts;?></td>
                          </tr>                          
                          <tr>
                            <td>End Date:</td>
                            <td><?php echo $auction_ends;?></td>
                          </tr>                          
                          <tr>
                            <td>Artwork Needed By:</td>
                            <td><?php echo $artwork_by, $artwork_by_text;?></td>
                          </tr>                                                    
                        </tbody>
                      </table>
                      <p class="description">
                      <?php echo 'Description: ',$row->ass_description; ?><br>
                      <?php echo 'Location: ', $row->ass_street_address, ', ',$row->ass_city; ?><br>	
                      </p>
                      <div class="btn-group">
                      	<!-- Setup Asset/Auction data to pass to popup -->
                        <a href="#" class="btn btn-primary <?php echo $css_disabled; ?>"  
                        	data-toggle="modal" data-target="#placeBid" 
                        	data-id="<?php echo $asset_id; ?>"  
                        	data-image="<?php echo $asset_image_url; ?>"  
                        	data-name="<?php echo $row->ass_name;?>" 
                        	data-description="<?php echo $row->ass_description;?>"
                        	data-current-bid="<?php echo $latest_bid; ?>" 
                        	data-auction-id="<?php echo $auction_id; ?>" 
                        	data-increment="<?php echo $increment; ?>" 
                        	data-buynow-price="<?php echo $buynow_price; ?>"
                        	data-ends="<?php echo $auction_ends_in_x_dys_y_hrs; ?>">
                        	<span class="glyphicon glyphicon-record"></span> Bid</a>
                        <!-- Setup Asset/Auction data to pass to popup -->	
                        <a href="#" class="btn btn-primary <?php echo $css_disabled; ?>"  
                        	data-toggle="modal" data-target="#buyNow"
                        	data-id="<?php echo $asset_id; ?>"  
                        	data-auction-id="<?php echo $auction_id; ?>" 
                        	data-image="<?php echo $asset_image_url; ?>"  
                        	data-name="<?php echo $row->ass_name;?>" 
                        	data-description="<?php echo $row->ass_description;?>"
                        	data-increment="<?php echo $increment; ?>" 
                        	data-price="<?php echo $buynow_price; ?>"
                        	data-ends="<?php echo $auction_ends_in_x_dys_y_hrs; ?>">
                        	<span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>
                      </div>
                      <!-- Setup Asset/Auction data to pass to popup -->	
                      <a href="#" class="btn btn-primary" 
                      		data-toggle="modal" data-target="#watchList"
                      		data-id="<?php echo $asset_id; ?>"  
                        	data-auction-id="<?php echo $auction_id; ?>" 
                      		data-image="<?php echo $asset_image_url; ?>"  
                        	data-name="<?php echo $row->ass_name;?>" 
                        	data-description="<?php echo $row->ass_description;?>"
                        	data-increment="<?php echo $increment; ?>" 
                        	data-price="<?php echo $buynow_price; ?>"
                        	data-ends="<?php echo $auction_ends_in_x_dys_y_hrs; ?>">
                      		<span class="glyphicon glyphicon-eye-open"></span> Add to watchlist</a>
                    </div>
                    <div class="clear"></div>
                  </div>
                  <?php 
                  
                  	$room_name = $row->ass_city; //Used in the room details div

                  	//} //end if bid range filter 

                  } //end foreach asset_details row 

                  ?>

                </div>

                <div class="col-sm-3">
                  <div class="side_info_box">
                    <h3>Room Details</h3> 
                    <table>
                        <tbody>
                        	<?php 

                        	$num_assets = count($room_details);  
                        	$count = 0;
                        	//$room_name = "";
                        	$room_type = "";
                        	$room_duration = "";

                        	foreach ($room_details as $key) {	
                        		$count++;
                        		$room_duration.="$key->duration_label, ";
                        		$room_type.="$key->mec_description, ";
                        		if($count == $num_assets){
		                    ?>
		                          <tr>
		                            <td width="150px;"><b>Auction Name:</b></td>
		                            <td><?php echo ($room_name!='')?$room_name:'N/A';?></td>
		                          </tr>
		                          <tr>
		                            <td><b>Total Assets:</b></td>
		                            <td><?php echo $num_assets;?></td>
		                          </tr>		                          
		                          <tr>
		                            <td colspan="2"><b>Category(ies):</b></td>
		                          </tr>
		                          <tr>
		                          	<td colspan="2"><?php echo $room_type;?></td>
		                          </tr>
		                          <tr>
		                            <td colspan="2"><b>Duration(s):</b></td>
		                          </tr>
		                          <tr>  
		                            <td colspan="2"><?php echo $room_duration;?>
		                            </td>
		                          </tr>
		                        </tbody>
		                    <?php
		                    } 
                        }
                        ?>
                      </table>
                  </div>
                
                  <div class="side_info_box">
                  <form method="post" action="">
                    <h3>Filter Assets</h3> 
                    
					<!--                     
					<label>Location</label>
					<input type="text" class="form-control">
					-->
					<?php
					//
					$bid_range = $this->input->post('bid_range');
					//echo $bid_range;
					?>
                    <label>Bid Range</label>
                    <select name="bid_range" class="form-control">
                      <option value="">Show All</option>
                      <option <?php echo ($bid_range=="0-500")?'selected':''; ?> value="0-500">R0 - R500</option>
                      <option <?php echo ($bid_range=="501-1000")?'selected':''; ?> value="501-1000">R501 - R1000</option>
                      <option <?php echo ($bid_range=="1001-3000")?'selected':''; ?> value="1001-3000">R1001 - R3000</option>
                      <option <?php echo ($bid_range=="3001-5000")?'selected':''; ?> value="3001-5000">R3001 - R5000</option>
                      <option <?php echo ($bid_range=="5001-10000")?'selected':''; ?> value="5001-10000">R5001 - R10000</option>
                      <option <?php echo ($bid_range==">10000")?'selected':''; ?> value=">10000">>R10000</option>
                    </select>

                    <div class="text-center">
                      <input type="submit" value="Filter" class="btn btn-primary">
                    </div>
                   </form> 
                  </div>
                </div>
              </div>
              </div>


<!-- Locations view-->

<div class="map_view" style="background-color: white;">        
	<div id="map-canvas-sell" style="width:1053px; height:500px; margin-top:250px; margin-left:50px;"> Loading AdsMap... </div>
</div>


<script>
  function modalshow(a,b){ 

  var width,height,padding,top,left,modalbak,modalwin;
  width   = 900;
  height  = 500;
  padding = 64;
  top     = (window.innerHeight-height-padding)/2;
  left    = (window.innerWidth-width-padding)/2;
  
 $("#modalwin").load("loadajax?c="+a+"&type="+b+"&p=auction_details");
  //$("#modalwin").load("bid_pop?ass_id="+a+"&type="+b);
  modalbak = document.getElementById("modalbak");
  modalbak.style.display = "block";

  modalwin = document.getElementById("modalwin");
  modalwin.style.top     = top+"px";
  modalwin.style.left    = left+"px";
  modalwin.style.display = "block";
}

function modalhide(){
  document.getElementById("modalbak").style.display = "none";
  document.getElementById("modalwin").style.display = "none";
}

//triggered when Bid modal is about to be shown
$('#placeBid').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     var AssetDescription = $(e.relatedTarget).data('description');
     var CurrentBid = $(e.relatedTarget).data('current-bid');
     var AssetPicture = $(e.relatedTarget).data('image');
     var BidIncrement = $(e.relatedTarget).data('increment');
     var BuyNowPrice = $(e.relatedTarget).data('buynow-price');     //buy now price
     var AuctionId = $(e.relatedTarget).data('auction-id');
     var AuctionEnds = $(e.relatedTarget).data('ends');
     var AssetURL = "asset?auction_id="+AuctionId+"&ass_id="+AssetId; //url to asset details page

     //console.log('ID:'+AssetId + '-' + AssetName + '-' + CurrentBid + '-'+ AssetPicture + '-' + BidIncrement + '-' + AuctionId + '-'+ AuctionEnds);
     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     $(e.currentTarget).find('input[name="auct_id"]').val(AuctionId);
     $(e.currentTarget).find('input[name="increment"]').val(BidIncrement);
     $(e.currentTarget).find('input[name="current_bid"]').val(CurrentBid);
     
     //Increment label & buynow price
     $(e.currentTarget).find('span[name="lbl_increment"]').html('Bid Increment :<b>'+BidIncrement+'</b>');
     $(e.currentTarget).find('span[name="asset_type"]').html('Buy Now Price:<b>'+BuyNowPrice+'</b>'); //buy now price

     //Minimum bid
     //placeholder="Enter 0.00 or more"
     var mimimumBid = parseFloat(CurrentBid) + parseFloat(BidIncrement);
     $(e.currentTarget).find('input[name="email"]').attr("placeholder",'Enter '+mimimumBid+'.00 or more');

     //asset name/description
     $(e.currentTarget).find('span[name="asset_name"]').html(AssetName + " (" + AssetDescription + ")");
     //$(e.currentTarget).find('span[name="asset_name"]').html(AssetName);
     if(AssetPicture!=''){
        $(e.currentTarget).find('img[name="asset_image"]').attr("src",AssetPicture);
     }
     //Set thumbnail url on popup
     $(e.currentTarget).find('a[name="thumbnail"]').attr("href",AssetURL);
          
     // price details, minimum bid etc
     $(e.currentTarget).find('span[name="auction_remaining"]').html(AuctionEnds);
     $(e.currentTarget).find('span[name="current_bid"]').html(CurrentBid);
     
});

//triggered when Buy now modal is about to be shown
$('#buyNow').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     var AssetDescription = $(e.relatedTarget).data('description');
     var AssetPicture = $(e.relatedTarget).data('image');
     var BidIncrement = $(e.relatedTarget).data('increment');
     var AuctionId = $(e.relatedTarget).data('auction-id');
     var AuctionEnds = $(e.relatedTarget).data('ends');
     var Price = $(e.relatedTarget).data('price');     
     var AssetURL = "asset?auction_id="+AuctionId+"&ass_id="+AssetId; //url to asset details page

     //console.log('ID:'+AssetId + '-' + AssetName + '-(' + Price + ')-'+ AssetPicture + '-' + BidIncrement + '-' + AuctionId + '-'+ AuctionEnds);
     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     $(e.currentTarget).find('input[name="auct_id"]').val(AuctionId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="asset_name"]').html(AssetName + " (" + AssetDescription + ")");
     //$(e.currentTarget).find('span[name="asset_name"]').html(AssetName);
     if(AssetPicture!=''){
        $(e.currentTarget).find('img[name="asset_image"]').attr("src",AssetPicture);
     }
     //Set thumbnail url on popup
     $(e.currentTarget).find('a[name="thumbnail"]').attr("href",AssetURL);

     // price details, minimum bid etc
     $(e.currentTarget).find('span[name="auction_remaining"]').html(AuctionEnds);
     $(e.currentTarget).find('span[name="buynow-price"]').html(Price);
     
});

//triggered when watchlist modal is about to be shown
$('#watchList').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     var AssetDescription = $(e.relatedTarget).data('description');
     var AssetPicture = $(e.relatedTarget).data('image');
     var BidIncrement = $(e.relatedTarget).data('increment');
     var AuctionId = $(e.relatedTarget).data('auction-id');
     var AuctionEnds = $(e.relatedTarget).data('ends');
     var Price = $(e.relatedTarget).data('price');     
     var AssetURL = "asset?auction_id="+AuctionId+"&ass_id="+AssetId; //url to asset details page

     //console.log('ID:'+AssetId + '-' + AssetName + '-(' + Price + ')-'+ AssetPicture + '-' + BidIncrement + '-' + AuctionId + '-'+ AuctionEnds);
     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     $(e.currentTarget).find('input[name="auct_id"]').val(AuctionId);
	 /***** NOT USED IN WATCHLIST FOR NOW *************************
     //asset name/description
     $(e.currentTarget).find('span[name="asset_name"]').html(AssetName + " (" + AssetDescription + ")");
     //$(e.currentTarget).find('span[name="asset_name"]').html(AssetName);
     if(AssetPicture!=''){
        $(e.currentTarget).find('img[name="asset_image"]').attr("src",AssetPicture);
     }
     //Set thumbnail url on popup
     $(e.currentTarget).find('a[name="thumbnail"]').attr("href",AssetURL);

     // price details, minimum bid etc
     $(e.currentTarget).find('span[name="auction_remaining"]').html(AuctionEnds);
     $(e.currentTarget).find('span[name="buynow-price"]').html(Price);
     */
     
});

</script>
  
   <style>
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


    <!-- View/Edit Asset Site Details-->

    <form name="frmEditItem" id="frmEditItem" method="post" action="create?action=edititem&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva">
    <div class="modal fade" id="editItemDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 860px;">
      <div class="modal-content">
        <div class="modal-header" style="background-color:lightgrey;">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="h4 modal-title" id="myModalLabel">
            <span class="h4 glyphicon glyphicon-edit"></span>
          <?php echo isset($ass_name)?$ass_name:'View Site Details: ';?><span id="ass_name_header" name="ass_name"></span></h4>
        </div>

        <div class="modal-body">
          <input type="hidden" value="" name="ass_id" id="auction_asset_id">
          <input type="hidden" name="auction_min" value=0 id="auction_min_text">
          <input type="hidden" value="" name="ass_name" id="ass_name_text">
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
                		<img src="<?php echo base_url('assets/add1.jpg'); ?>" name="asset_image">
                    </a>
                  </div>
                  <div id="map-canvas" style="width: 300px; height: 190px;"> 
                  	Asset Map loading ...
                  </div>
                  <div id="pano" style="position:absolute; left:523px; top: 60px; width: 300px; height: 190px;">
                  	Asset Street View loading ...
                  </div>
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
                                  <a href="<?php echo site_url("auctions/spec_sheet?ass_id=$row->ass_id"); ?>" target="_blank">
                                    <button type="button" class="btn btn-primary">View Spec Sheet</button>
                                  </a>
                                </div>
                              </div> 
                            </td>
                          </tr>
                          <tr>  
<!--                             <td><strong>Asset Name:</strong></td>  
                            <td> <span id="ass_name"></span></td>   -->
                            <td><strong>Buy Now Price</strong></td>  
                            <td nowrap="nowrap">R <span id="buy_now"></span></td> 
                            <td><strong>Minimum Bid:</strong> </td>  
                            <td nowrap="nowrap">R <span id="minimum_bid"></span></td> 
                            <td><strong>Current Bid:</strong></td>
                            <td nowrap="nowrap">R <span id="current_bid"></span></td>
                          </tr>  
                          <tr>  
                            <td><strong>Descrption</strong></td>  
                            <td colspan="2"> <span id="ass_description"></span></td>  
                            <td><strong></strong></td>  
                              
                            <td colspan="2">  
                              <input  name="bid" id="bid" type="text" placeholder="Enter Bid Amount 0 or more">
                              <input  name="minimum" id="minimum" type="hidden" value="">
                              <input  name="auct_id" id="auct_id" type="hidden" value="">
                            </td>
                            <td colspan="2"><strong>Your Last Bid</strong></td>
                            <td nowrap="nowrap">R <span id="you_last_bid"></span></td>
                          </tr>  
                          <tr>  
                            <td>
                              <strong>Asset Type:</strong>
                            </td>  
                            <td align="left"><span id="ass_type"></span></td>  
                            <td>
                              <a href="buynow?p=<?php echo $p; ?>" class="btn btn-primary" name="btn_buynow" data-dismiss="modal">
                                <!-- <button type="submit" class="btn btn-primary" data-dismiss="modal">Buy Now</button> -->
                                <span class="glyphicon glyphicon-shopping-cart"></span> Buy Now</a>
                              </a>
                            </td>  
                            <td></td>
                            <td colspan="2"> 
                              <a href="#" onclick="bid_now(<?php echo $row->ass_id;?>)" 
                              name="btn_bidnow" class="btn btn-primary" data-dismiss="modal">
                                <!-- <button type="submit" class="btn btn-primary" >Place Bid</button> -->
                                <span class="glyphicon glyphicon-record"></span> Place Bid</a>
                              </a>
                            </td>
                            <td><strong>Increment:</strong></td>
                            <td>R<span id="increment"><?php echo $increment; ?></span></td>
                          </tr>
                          <tr>  
                            <td><strong>Asset Address:</strong></td>  
                            <td colspan="2"><span id="ass_address"><?php echo $row->ass_address;?></span></td>  
                              
                            <td></td><td colspan="2"> </td>
                            <td><strong>Traffic Count:</strong></td>
                            <td><span id="traffic_count">500</span></td>
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

//initialize();

</script>

<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>

<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>

<script type="text/javascript">
  var raw_markers = <?php echo json_encode($asset_details);?>;
  var base_url = '<?php echo base_url();?>';
  var adsMap = false;
  var map, mapA; //map (main map): mapA (for asset popup)

	$(document).ready(function(){    
	  
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

	});

  function initialize() {
    console.log('Initializing AdsMap');
    var mapOptions = {
      center: new google.maps.LatLng(<?php echo isset($asset_details[0]->position)?$asset_details[0]->position:'-26.2044, 28.0456'; ?>),
      zoom: 10 /*changed from 6 to remove grey area*/
    };

    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker;

    map = new google.maps.Map(document.getElementById("map-canvas-sell"), mapOptions);
    console.log("AdsMap Center: "+map.getCenter());
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

        console.log(" marker added " + marker_details.mec_id)
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
    var assetLatLong = new google.maps.LatLng(<?php echo isset($asset_details[0]->position)?$asset_details[0]->position:'-26.2044, 28.0456'; ?>);
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

<script>

  function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin;
    var default_image = "<?php echo base_url('assets/add1.jpg'); ?>"; //defau;t asset image
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
        //console.log('*data:'+data);
        var jsonAsset = $.parseJSON(data); 
        //console.log('*Asset:'+jsonAsset);
        /*
          {"ass_id":"16","ass_name":"Myne","ass_type":"bill board (Traditional)","ast_id":null,"ass_ref":"Ref My\/000","ass_description":"My Myne",
           "ass_street_address":"419 Valley","ass_city":"Roodepoort","position":"-26.046604,27.944069",
           "current_bid":null,"yobid":0,"minimum_bid":null,"buy_now":null,"increment":null,"auction_id":null}
        */        
       //$('#response').html(jsonAsset.ass_id);
       //$("#frmEditItem").find('span[id="ass_name"]').html();
       var asset_name = jsonAsset.ass_name + " (" + jsonAsset.ass_description + ")";
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

       //set whether bid/buy buttons are enabled/disbaled based on auction status
		if(jsonAsset.status == 0 || jsonAsset.status == 2){
			css_disabled = 'disabled';
			$("#frmEditItem").find('a[name="btn_bidnow"]').addClass(css_disabled); 
			$("#frmEditItem").find('a[name="btn_buynow"]').addClass(css_disabled); 
			//console.log("status==0 "+jsonAsset.status)
		}      

		//Set Asset image 
		if(jsonAsset.asset_image!='' && jsonAsset.asset_image!=null){
			$("#frmEditItem").find('img[name="asset_image"]').attr("src",jsonAsset.asset_image);
		} else {
			$("#frmEditItem").find('img[name="asset_image"]').attr("src",default_image);
		}

		//bid field placeholder text based on current bid and increment
		if(jsonAsset.current_bid > 0){
			NextMinBidAmount = parseFloat(jsonAsset.current_bid) + parseFloat(jsonAsset.increment);
		} else {
			NextMinBidAmount = parseFloat(jsonAsset.minimum_bid) + parseFloat(jsonAsset.increment);
		}
		$("#frmEditItem").find('input[id="bid"]').attr("placeholder","Enter Bid Amunt " + NextMinBidAmount + " or more");

       //Adjust map center
       //console.log("b4 mapA started ");
      if (typeof google === 'object' && typeof google.maps === 'object'){
      	//console.log("mapA started ");
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
          document.getElementById('pano').value = '';
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
          mapA.setStreetView(panorama);
      		
      	  //trigger map resize to fix issue with partially loaded map/streetview
      	  google.maps.event.trigger(mapA, "resize");
      	  //console.log("mapA resized");
      }
      //console.log("after mapA started ");
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

	  //trigger mapA/window resize
	  if(mapA){
	      $(window).trigger('resize');
	      var center = mapA.getCenter();
	      google.maps.event.trigger(mapA, "resize"); //this fix the problem with not completely map
	      mapA.setCenter(center); 
	      //console.log("#1 trigger mapA/window resize");  
	  } 
//console.log("#2 after trigger mapA/window resize");
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

<div id='modalbak'></div>
<div id='modalwin'>         
</div> 
<?php

function getaddress($lat, $lng)
{
	$url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='.trim($lat).','.trim($lng).'&sensor=false';
	$json = @file_get_contents($url);
	$data=json_decode($json);
	$status = $data->status;
	if($status=="OK")
		return $data->results[0]->formatted_address;
	else
		return false;
}

function getaddress2($coordinates)
{
	$url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='.trim($coordinates).'&sensor=false';
	$json = @file_get_contents($url);
	$data=json_decode($json);
	$status = $data->status;
	if($status=="OK")
		return $data->results[0]->formatted_address;
	else
		return false;
}

?>