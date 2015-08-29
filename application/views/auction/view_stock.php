<?php 
echo $map['js'];
$auction_id = $this->input->get('auction_id');
//echo empty($asset_images). " # of images ". is_null($asset_rates);
//print_r($asset_details);
//exit;
foreach ($asset_details as $row) {
    $auction_id = $row->id;
    $asset_id = $row->ass_id;
    $mec_id = $row->mec_id;
    $asset_name = $row->ass_name;
    $ass_ref = $row->ass_ref;
    $ass_description = $row->ass_description;
    $auction_starts = $row->starts;
    $auction_end = $row->ends;
    $ass_street_address = $row->ass_street_address;
    $ass_city = $row->ass_city;
    $ass_province = $row->ass_province;

    $pri_width = $row->ass_printable_width;
    $pri_height = $row->ass_printable_height;
    $this->db->where('tow_id', $row->loc_id);
            $select_query = $this->db->get('town');
    if ($select_query->num_rows > 0){
        foreach ($select_query->result() as $rows){
            $town=$rows->tow_description;
        }
    }
    //categories/media family
    //$this->db->select('mc.mec_id, mc.mec_description, mt.mam_id, mt.met_description, mf.mef_id, mef_description');
    $this->db->where('mc.mec_id', $mec_id);
    $this->db->select('mc.mec_id, mc.mec_description');
    $this->db->from('media_category mc');
    //$this->db->join('master_medium_type mt', 'media_category.mam_id = master_medium_type.mam_id');
    //$this->db->join('media_family mf', 'master_medium_type.mef_id = media_family.mef_id');
    $select_query = $this->db->get(); 
    if($select_query->num_rows > 0)   
        foreach($select_query->result() as $rows){
            $mec_description=$rows->mec_description;
        }
    }

    $yobid = 0;
        if (isset($auction_id) && $auction_id <> '0' ){
          $this->db->where('auction', $auction_id);
          $this->db->where('bidder', $this->session->userdata('use_id'));
          $select_query = $this->db->get('bids');
          if ($select_query->num_rows > 0){
            foreach ($select_query->result() as $rows){
              $yobid=$rows->bid;
            }
          }
        }

    $todayDate = date("Y-m-d H:i:s", mktime(0, 0, 0));  
    //echo $auction_end;
    if ($todayDate > $auction_end) {
      $stat = 'CLOSED';
      $css_disabled = 'disabled';
    } else {
      $stat = 'ACTIVE';
      $css_disabled = '';
    }

    if($row->status == 0 || $auction_starts > $todayDate){ //Auction as not yet been approved or started
      $css_disabled = 'disabled';
      $stat = 'NOT YET OPEN';
    } 

?>
        <div class="breadcrumbs">
          <h1><span class="glyphicon glyphicon-list-alt"></span><a href="#">Auctions</a></h1>
        </div>

        <form method="post" class="main col-xs-12">

          <div class="clear"></div>

              <div class="row">
              
                <div class="col-sm-8">
                  <div class="pull-right">
                    <br><br>
                    
                  </div>
                  <h3 class="h3"><?php echo ucwords($mec_description),' #',$asset_name; ?></h3>
                  <h4 class="h4">in <?php echo $ass_city, ', ', $ass_province; ?></h4>
                    <br>
                    <div class="btn-group">

                      <a href="#" 
                      class="btn btn-primary <?php echo $css_disabled; ?>"  
                      data-toggle="modal" data-target="#placeBid"
                      data-id="<?php echo ($asset_id>0)?$asset_id:$this->input->get('ass_id'); ?>"  
                      data-image="<?php echo $asset_images[0]->upd_url; ?>"  
                      data-name="<?php echo $asset_name;?>" 
                      data-description="<?php echo $ass_description;?>"
                      data-current-bid="<?php echo ($current_bid[0]->currentBid>0)?$current_bid[0]->currentBid:0; ?>" 
                      data-auction-id="<?php echo $auction_id; ?>" 
                      data-increment="<?php echo $row->increment; ?>" 
                      data-buynow-price="<?php echo $row->buy_now; ?>"
                      data-ends="<?php echo $auction_ends_in_x_dys_y_hrs; ?>">
                      <span class="glyphicon glyphicon-record"></span> Bid</a>

                      <a href="#" class="btn btn-primary <?php echo $css_disabled; ?>"  
                      data-toggle="modal" data-target="#buyNow"
                      data-id="<?php echo ($asset_id>0)?$asset_id:$this->input->get('ass_id');; ?>"  
                      data-image="<?php echo $asset_images[0]->upd_url; ?>"  
                      data-name="<?php echo $asset_name;?>" 
                      data-description="<?php echo $ass_description;?>"
                      data-current-bid="<?php echo ($current_bid[0]->currentBid>0)?$current_bid[0]->currentBid:0; ?>" 
                      data-auction-id="<?php echo $auction_id; ?>" 
                      data-increment="<?php echo $row->increment; ?>" 
                      data-buynow-price="<?php echo $row->buy_now; ?>"
                      data-ends="<?php echo $auction_ends_in_x_dys_y_hrs; ?>">
                      <span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>

                    </div>
                      <a href="#" class="btn btn-primary"  
                      data-toggle="modal" data-target="#watchList"
                      data-id="<?php echo ($asset_id>0)?$asset_id:$this->input->get('ass_id');; ?>"  
                      data-image="<?php echo $asset_images[0]->upd_url; ?>"  
                      data-name="<?php echo $asset_name;?>" 
                      data-description="<?php echo $ass_description;?>"
                      data-current-bid="<?php echo ($current_bid[0]->currentBid>0)?$current_bid[0]->currentBid:0; ?>" 
                      data-auction-id="<?php echo $auction_id; ?>" 
                      data-increment="<?php echo $row->increment; ?>" 
                      data-buynow-price="<?php echo $row->buy_now; ?>"
                      data-ends="<?php echo $auction_ends_in_x_dys_y_hrs; ?>">
                      <span class="glyphicon glyphicon-eye-open"></span> Add to watchlist</a>
                    
                    <br><br>

                  <div class="map_view">
                    <H3>Loading ...</H3>
                    <div id="map_canvas" style="height:400px;width:730px;margin:-2;"> 
                      <?php echo $map['html'];?>
                    </div>
                  </div>

                  <div class="main_picture" style="height:400px;width:730px;margin:-2;">
                    <a href="#">
                      <?php 
                      if(empty($asset_images)){
                        //Use placeholder picture
                      ?>
                        <img src="<?php echo base_url();?>assets/billboard_1.jpg">
                      <?php
                      } else {
                        //Use the first picture found for this asset
                        ?>
                        <img src="<?php echo $asset_images[0]->upd_url;?>">
                        <?php
                      }  
                      ?>
                    </a>
                  </div>
                  <ul class="thumbnails">
                    <!-- 
                      Get Asset Images, show placeholder if none uploded yet 
                    -->
                    <?php 
                    if(empty($asset_images)){ 
                      //No photos uploaded yet so show placeholder billboard picture
                      ?>
                      <li>
                        <a href="<?php echo base_url();?>assets/billboard_1.jpg">
                          <img src="<?php echo base_url();?>assets/billboard_1.jpg" style="widht:150px; height:150px;">
                        </a>
                      </li>
                    <?php                    
                    } else  {
                        foreach ($asset_images as $image) {
                          if($image->upd_url != ''){
                            ?>
                            <li>
                              <a href="<?php echo $image->upd_url;?>">
                                <img src="<?php echo $image->upd_url;?>" style="widht:150px; height:150px;">
                              </a>
                            </li>    
                            <?php
                          }
                        }
                    }
                    ?>
                    <!-- Map Thumbnail/View -->
                    <li class="show_map_view">
                      <img src="<?php echo base_url();?>assets/thumbnail_map.jpg">
                    </li>
                  </ul>

                  <h3>Description</h3>
                  <p><?php echo $ass_description; ?></p>

                </div>

                <div class="col-sm-4">
                  <div class="side_info_box">
                    <h3>Asset Details</h3> 
                    <table>
                        <tbody>
                          <tr>
                            <td width="150px;">Asset Number:</td>
                            <td><?php echo $row->ass_id; ?></td>
                          </tr>
                          <tr>
                            <td>Current Status:</td>
                            <td><?php echo $stat; ?></td>
                          </tr>
                            <tr>
                            <td>Minimum Bid:</td>
                            <td>R<?php echo number_format($row->minimum_bid,2); ?></td>
                          </tr>
                          <tr>
                            <td>Current Bid:</td>
                            <td>R<?php foreach($current_bid as $bid_data){echo number_format($bid_data->currentBid,2);} ?></td>
                          </tr>
                            <tr>
                            <td>Bid: Increment:</td>
                            <td>R<?php echo number_format($row->increment,2); ?></td>
                          </tr>
                          <tr>
                            <td>Your Bid:</td>
                            <td>R<?php echo number_format($yobid,2); ?></td>
                          </tr>
                          <tr>
                            <td width="150px;">Asset Cost (BCY):</td>
                            <td>R<?php echo number_format($row->ass_production_cost_BCY,2); ?></td>
                          </tr>
                          <tr>
                            <td>Asset Price (ACY):</td>
                            <td>R<?php echo number_format($row->ass_production_price_SCY,2); ?></td>
                          </tr>
                          <tr>
                            <td>Rat Description:</td>
                            <td><?php echo $row->rat_description; ?></td>
                          </tr>
                          <tr>
                            <td>Rat Rate:</td>
                            <td>R<?php echo number_format($row->rat_rate,2); ?></td>
                          </tr>
                          <tr>
                            <td width="150px;">Rat Value (BCY):</td>
                            <td>R<?php echo number_format($row->rat_value_BCY,2); ?></td>
                          </tr>                        
                          <tr>
                            <td>Auction Starts:</td>
                            <td><?php echo $row->starts; ?></td>
                          </tr>
                          <tr>
                            <td>Auction Ends:</td>
                            <td><?php echo $row->ends; ?></td>
                          </tr>
                          <tr>
                            <td>Buy Now Price:</td>
                            <td>R<?php echo number_format($row->buy_now,2); ?></td>
                          </tr>  
                          <tr>
                            <td>Printable Width:</td>
                            <td><?php echo $row->ass_printable_width,' ',$row->w_unit,'s'; ?></td>
                          </tr>
                          <tr>
                            <td>Printable Height:</td>
                            <td><?php echo $row->ass_printable_height,' ',$row->h_unit,'s'; ?></td>
                          </tr>                            
                          <tr>
                            <td>Lead Time:</td>
                            <td><?php echo $row->ass_lead_time,' ',$row->lead_time_unit; ?></td>
                          </tr>                                                  
                        </tbody>
                      </table>
                  </div>

                  <br>
                  <div class="text-center"></div>
                  
                </div>

              </div>

        </form>
        <?php
        //print_r($asset_details);
        ?>
        <!--Main -->

<script type="text/javascript">
  
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
     var Price = $(e.relatedTarget).data('buynow-price');     
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


