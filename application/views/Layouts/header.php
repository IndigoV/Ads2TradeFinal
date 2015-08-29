<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<?php
//echo $this->layouts->print_includes();

//Check if user still has a valid session
if(!$this->session->userdata('user_id')){
  redirect(base_url());exit;
} else {
  $user_id = $this->session->userdata('user_id');
  //Just in case they have not been included by the controller we are on
  $this->load->model('assets');
  $this->load->model('auction');      
}

?>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/styles.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/dataTables.bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/bootstrap-checkbox.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>/css/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>/css/jquery-ui.theme.min.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/select2.min.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/select2.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/elastislide.css" />

    <script src="<?php echo base_url();?>assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url();?>assets/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>assets/js/rfp_campaigns.js"></script>

    <!-- jquery validator plugin -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>
    <!-- jquery validator plugin -->
    
    <script src="<?php echo base_url();?>assets/js/bootstrap-checkbox.js" type="text/javascript"></script>

    <script src="<?php echo base_url();?>assets/scripts.js" type="text/javascript"></script>


    <script src="<?php echo base_url();?>assets/js/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="<?php echo base_url();?>assets/js/amcharts/serial.js" type="text/javascript"></script>

    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/chosen.css">
    <script src="<?php echo base_url();?>assets/js/chosen.jquery.js" type="text/javascript"></script>

    <script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery.elastislide.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/gallery.js"></script>



	<script type="text/javascript">

    function deleteRow2(a){
            console.log(a);
            $(a).parent().remove();
    }
        
    function sizeModal2(id, b, lat, ln, medType) {
                
        //alert('Loading Sizes....');

        var width = 900 , height = 500, padding = 0, top  = (window.innerHeight - height - padding) / 5, left = (window.innerWidth - width - padding) / 2, modalbak, modalwin, a = id;

        //try other means now
        var myParams = {latitude:lat, longitude:ln, b:b, medType:medType};
        var newQueryString = jQuery.param(myParams);
        //alert(newQueryString); exit;
        //end other 
        //console.log("city_cell?"+newQueryString);

        $("#mapModal2").load("city_cell?"+newQueryString);
        modalbak = document.getElementById("modalbak1");
        modalbak.style.display = "block";

        modalwin = document.getElementById("mapModal2");
        modalwin.style.top = top + "px";
        modalwin.style.left = left + "px";
        modalwin.style.display = "block";

        //alert(modalwin.style.display);

    }

    function modalhide() {

        //alert('Closing popup');

        var mapModal2 =  document.getElementById('mapModal2');
        var mapModal =  document.getElementById('mapModal');
        var modalbak1 =  document.getElementById('modalbak1');

        if (typeof(modalbak1) != 'undefined' && modalbak1 != null)
        {
          // exists.
          document.getElementById("modalbak1").style.display = "none";
        }   
        if (typeof(mapModal) != 'undefined' && mapModal != null)
        {
          // exists.
          document.getElementById("mapModal").style.display = "none";
        }   
        if (typeof(mapModal2) != 'undefined' && mapModal2 != null)
        {
          // exists.
          document.getElementById("mapModal2").style.display = "none";
        }          
        
    }


  </script>
  <meta name="viewport" content="width=1024" />

  </head>
  <body onload="createMap()">
    <div id="top_bar">
      <a href="#" title="Includes. Bids, RFPs & unpaid Invoices"><span class="glyphicon glyphicon-dashboard"></span> 

        <?php
        //$this->load->view('dashboard_totals');

        $allBidsValue = $this->session->userdata('allBidsValue');
        $allRFPsValue = $this->session->userdata('allRFPsValue');
        $allInvoicesValue = $this->session->userdata('allInvoicesValue');
        
        ?>

      R<?php echo number_format($allBidsValue + $allRFPsValue + $allInvoicesValue,2)?> (Estimate spend)
      </a>
      <?php echo anchor('messages/inbox', "<span class=\"badge\">".$this->events->getCountUnreadMessages($user_id)."</span> Inbox", 'title="My Messages"');?>
      <a href="<?php echo site_url("user/edit?id="),$user_id; ?>"><span class="glyphicon glyphicon-user"></span> Settings</a>
    </div>
<?php

    $loc_id='';   $ast_id=''; $id="";
	if (isset($_REQUEST['ass_id'])){
	    $ass_id =  $_REQUEST['ass_id'];
	    $this->db->where('asset.ass_id', $_REQUEST['ass_id']);
	    $this->db->select('*');
	    $this->db->from('asset');
	    $this->db->join('auctions','asset.ass_id = auctions.ass_id', 'left outer');
	    $select_query = $this->db->get();
	    if ($select_query->num_rows > 0){
	      foreach ($select_query->result() as $rows){
	        $current_bid = $rows->current_bid;
			$asset_id = $rows->ass_id;
            $loc_id = $rows->loc_id;
            $ast_id = $rows->ast_id;
            $ass_name = $rows->ass_name;
            $ass_description = $rows->ass_description;
            $id = $rows->id;
            $buy_now = $rows->buy_now;
            $auction_ends = $rows->ends;
	      }
	    }

	    $this->db->where('tow_id', $loc_id);
	    $select_query = $this->db->get('town');
	    if ($select_query->num_rows > 0){
	      foreach ($select_query->result() as $rows){
	       $location=$rows->tow_description;
	              }
	    }

	    $this->db->where('ast_id', $ast_id);
	    $select_query = $this->db->get('asset_type');
	    if ($select_query->num_rows > 0){
	      foreach ($select_query->result() as $rows){
	        $asset_type=$rows->ast_description;
	              }
	    }
    }

    //remaining auction time
	$au_now  = date_create(date('Y-m-d H:j:s'));
	$au_ends = date_create($auction_ends);
	$au_diff = date_diff($au_ends, $au_now);
	$auction_ends_in_x_dys_y_hrs = "";
	//get the remaining days
	if($au_diff->d > 0){
		$auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->d.($au_diff->d>1)?$au_diff->d.' days ':' day ';
	}
	//get the remaining hours
	if($au_diff->h > 0){
		$auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->h.($au_diff->h>1)?$au_diff->h.' hours ':' hour ';
	}

	//Asset Images 
	$asset_images = $this->assets->getAssetImages($asset_id);

    ?>
  <form name="form1" method="post" action="bid" id="frmBidNow">
    <div class="modal fade" id="placeBid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title h4" id="myModalLabel">
              <span name="asset_name">
                <?php echo isset($ass_name)?$ass_name." ($ass_description)":'';?>
              </span>
            </h4>
          </div>
          <div class="modal-body">
           <div class="row">
            <div class="col-xs-6">
              <a class="thumbnail" href="#" name="thumbnail">
                <?php 
                if(empty($asset_images)){
                  //Use placeholder picture
                ?>
                  <img name="asset_image" src="<?php echo base_url();?>assets/add1.jpg">
                <?php
                } else {
                  //Use the first picture found for this asset
                  ?>
                  <img name="asset_image" src="<?php echo $asset_images[0]->upd_url;?>">
                  <?php
                }  
                ?>
              </a>
            </div>

            <div class="col-xs-6">
              <table class="tables">
                <tr>
                  <td width="100" class="h3">
                    Current Bid 
                    <span name="current_bid">
                      <?php echo isset($current_bid)?$current_bid:'';?>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>
                    <span class="glyphicon glyphicon-flag"></span>
                    <span name="lbl_increment"> 
                    <?php echo isset($location)?$location:'';?> 
                    </span>
                    </td>
                </tr>
                <tr>
                  <td>
                    <input type="hidden" value="<?php echo $id;?>" name="auct_id" id="bid_auct_id">
                    <span class="glyphicon glyphicon-tag" name="lbl_buynow"></span>
                    <span name="asset_type">
                      <?php echo isset($asset_type)?$asset_type:'';?>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>
                    <input type="hidden" value="<?php echo $ass_id;?>" name="ass_id">
                    <input type="hidden" value="<?php echo $increment;?>" name="increment">
                    <input type="hidden" value="<?php echo $current_bid;?>" name="current_bid">
                    <span class="glyphicon glyphicon-time"></span> 
                    <span name="auction_remaining">
                      <?php echo isset($auction_ends_in_x_dys_y_hrs)?$auction_ends_in_x_dys_y_hrs:'';?> 
                    </span>Remaining
                  </td>
                </tr>
                <tr>
                  <td>
                    <span name="message"></span>
                  </td>
                </tr>
              </table>

              <br>

              <div class="form-group">
                <div class="input-group">
                  <input class="form-control" name="email" id="email" type="text" placeholder="Enter 0.00 or more">
                  <a href="#" class="input-group-addon btn btn-primary" id="btnSubmit">Place Bid</a>
                </div>
              </div>

            </div>
           </div>
          </div>
        </div>
      </div>
    </div></form>

    <form name="form2" method="post" action="buynow" id="frmBuyNow">
    <div class="modal fade" id="buyNow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title h4" id="myModalLabel">
              <span name="asset_name">
                <?php echo isset($ass_name)?$ass_name." ($ass_description)":'';?>
              </span>
            </h4>
          </div>
          <div class="modal-body">
           <div class="row">
            <div class="col-xs-6">
              <a class="thumbnail" href="#" name="thumbnail">
                <?php 
                if(empty($asset_images)){
                  //Use placeholder picture
                ?>
                  <img name="asset_image" src="<?php echo base_url();?>assets/add1.jpg">
                <?php
                } else {
                  //Use the first picture found for this asset
                  ?>
                  <img name="asset_image" src="<?php echo $asset_images[0]->upd_url;?>">
                  <?php
                }  
                ?>
              </a>
            </div>
            <div class="col-xs-6">
              <table class="tables">
                <tr>
                  <td width="100" class="h3">
                    Price 
                    <span name="buynow-price">
                      <?php echo isset($buy_now)?$buy_now:'';?>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td>
                    <span class="glyphicon glyphicon-flag"></span>
                      <?php echo isset($location)?$location:'';?>
                    </td>
                </tr>
                <tr>
                  <td>
                    <input type="hidden" value="<?php echo $id;?>" name="auct_id" id="buy_auct_id">
                    <span class="glyphicon glyphicon-tag"></span> 
                      <?php echo isset($asset_type)?$asset_type:'';?>
                    </td>
                </tr>
                <tr>
                  <td>
                    <input type="hidden" value="<?php echo $_REQUEST['ass_id'];?>" name="ass_id">
                    <span class="glyphicon glyphicon-time"></span> 
                    <span name="auction_remaining">
                      <?php echo isset($auction_ends_in_x_dys_y_hrs)?$auction_ends_in_x_dys_y_hrs:'';?> 
                    </span>Remaining</td>
                </tr>
              </table>

              <br>

              <a href="#" class="btn btn-primary btn-block" id="btnBuyNow">Buy Now</a>

            </div>
           </div>
          </div>
        </div>
      </div>
    </div></form>


      <form name="form3" method="post" action="addwatch" id="frmAddWatch">
      <div class="modal fade" id="watchList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
          <input type="hidden" value="<?php echo $_REQUEST['ass_id'];?>" name="ass_id" id="watch_auct_id">
                                         <input type="hidden" value="<?php echo $id;?>" name="auct_id">
            <h4 class="text-center">This Item will be added to you watch list</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnAddWatch">Add To My Watch List</button>
          </div>
        </div>
      </div>
    </div></form>

    <div class="container">
    <div class="page_wrap">
      <div class="top_bar">

        <button type="button" class="mobi-menu-toggle hidden-sm hidden-md hidden-lg" data-toggle="collapse" data-target=".side_bar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <div class="side_bar">

        <div class="slogo">
          <a href="#"><img src="<?php echo base_url();?>assets/logo.png"></a>
        </div>
        <!--
        <ul>
         <?php if($this->session->userdata('user_type') == 1){?>
          <li>
          <a href="<?php echo site_url('navigate/index');?>" class="active">
          <span class="glyphicon glyphicon-home"></span>Dashboard</a></li>
          <li>
            <a href="<?php echo site_url('load_stock/asset_details3');?>" >
            	<span class="glyphicon glyphicon-list-alt"></span>Auctions
            </a>
          </li>
          <li>
            <a href="#"><span class="glyphicon glyphicon-globe"></span>Campaigns</a>
          </li>
          <li>
            <a href="#"><span class="glyphicon glyphicon-file"></span>Invoices</a>
          </li>

          <li>
            <a href="<?php echo site_url('new_campaign/headerInfo');?>">
            <span class="glyphicon glyphicon-file"></span>RFP</a>
          </li>

          <li><a href="#"><span class="glyphicon glyphicon-cog"></span>Settings</a></li>
          <li><a href="<?php echo site_url('login/logout');?>"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
          <?php } else
          if($this->session->userdata('user_type') == 2){  ?>
          <li><a href="<?php echo site_url('navigate/index');?>" class="active"><span class="glyphicon glyphicon-home"></span>Dashboard</a></li>
          <li>
            <a href="<?php echo site_url('load_stock/asset_details3');?>" ><span class="glyphicon glyphicon-list-alt"></span>Auctions</a>
          </li>
          <li>
            <a href="#"><span class="glyphicon glyphicon-globe"></span>Campaigns</a>
          </li>
          <li>
            <a href="#"><span class="glyphicon glyphicon-file"></span>Invoices</a>
          </li>

          <li>
            <a href="../new_campaign/media_owner_campaign_list"><span class="glyphicon glyphicon-file"></span>RFP</a>
          </li>

          <li><a href="#"><span class="glyphicon glyphicon-cog"></span>Settings</a></li>
          <li><a href="<?php echo base_url();?>index.php/login/logout"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
           <?php } elseif($this->session->userdata('user_type') == 3){  ?>

          <li>
            <a href="<?php echo site_url("navigate/index")?>" class="active"><span class="glyphicon glyphicon-home"></span>Dashboard</a>
          </li>
          <li>
            <a href="<?php echo site_url("my_stock/op_index")?>" ><span class="glyphicon glyphicon-list-alt"></span>Auctions</a>
          </li>
          <li>
            <a href="<?php echo site_url("campaign")?>"><span class="glyphicon glyphicon-globe"></span>Campaigns</a>
          </li>
          <li>
            <a href="<?php echo site_url("invoice") ?>"><span class="glyphicon glyphicon-file"></span>Invoices</a>
          </li>

          <li>
            <a href="../new_campaign/campaigns"><span class="glyphicon glyphicon-file"></span>RFP</a>
          </li>

          <li><a href="<?php echo site_url("settings") ?>"><span class="glyphicon glyphicon-cog"></span>Settings</a></li>
          <li><a href="<?php echo site_url("login/logout") ?>"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
          <?php } ?>

        </ul>
        -->
		  <?php $this->load->view('Layouts/sidebar'); ?>

      </div>
      <div class="main_content">
      <div id="img-wrapper-tmpl" style="display:none;"><!-- to prevent TypeError: $(...).tmpl(...).appendTo is not a function gallery.js:142 --></div>

      <script>

        $(document).ready(function () {

            //Add watch
            $('#btnAddWatch').on("click", function( event ) {
                
                var form = $('#frmAddWatch');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';
                console.log('watchList:'+form.serialize());
                console.log('URL:'+auction_base_url + '/' + form.attr('action'));

                $.ajax({
                    type: form.attr('method'),  //form method
                    url: auction_base_url + '/' + form.attr('action'),   //form action
                    data: form.serialize(),
                    success: function(data, status) {
                        $('#watchList').modal('hide');
                        //Modal Message here
                        alert('Thank you! The asset has been added to your watchlist.');
                        //window.location.reload();
                    }
                });

            });

            //buy now
            $('#btnBuyNow').on("click", function( event ) {
                
                var form = $('#frmBuyNow');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';

                $.ajax({
                    type: form.attr('method'),  //form method
                    url: auction_base_url + '/' + form.attr('action'),   //form action
                    data: form.serialize(),
                    success: function(data, status) {
                        $('#buyNow').modal('hide');
                        //Modal Message here
                        alert('Thank you! Your purchase has been captured.');
                        window.location.reload();
                    }
                });

            });

            //bid now
            $('#btnSubmit').on("click", function( event ) {

                //alert('Submit Clicked');

                var increment = $('#frmBidNow').find('input[name="increment"]').val();
                var current_bid = $('#frmBidNow').find('input[name="current_bid"]').val();
                var minimum_bid = parseFloat(increment) + parseFloat(current_bid);
                var yourbid = $('#frmBidNow').find('input[name="email"]').val();
                var form = $('#frmBidNow');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';

                yourbid = parseFloat(yourbid);
                current_bid = parseFloat(current_bid);
                increment = parseFloat(increment);

                var bidIsOK = false;
                //alert('your bid' + yourbid + ' vs ' + minimum_bid);
                
                if(isNaN(yourbid)){
                
                  yourbid = 0;
                  bidIsOK = false;
                
                } 
                if (yourbid < minimum_bid){
                
                  bidIsOK = false;
                  errMsg = "Error! Please enter a bid of "+ minimum_bid +".00 or more";
                
                } else {
                
                  bidIsOK = true;
                
                }

                console.log('method:'+form.attr('method'));
                console.log('action:'+auction_base_url + '/' + form.attr('action'));
                console.log('data:'+form.serialize());
                if(bidIsOK){
                    $.ajax({
                        type: form.attr('method'),  //form method
                        url: auction_base_url + '/' + form.attr('action'),   //form action
                        data: form.serialize(),
                        success: function(data, status) {
                            $('#placeBid').modal('hide');
                            //Modal Message here
                            alert('Thank you! Your bid has been placed');
                            window.location.reload();
                        }
                    });
                } else {
                  $('#frmBidNow').find('input[name="email"]').focus(); //set focus on the bid field
                  //$('#frmBidNow').find('snap[name="message"]').html('<div class="alert alert-error"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Error!</strong>'+ errMsg +'</div>');
                  alert(errMsg);
                }

                event.preventDefault();
            });

            //bid now
            $('#frmBidNow').on("submit", function( event ) {

                //alert('Submit Clicked');

                var increment = $('#frmBidNow').find('input[name="increment"]').val();
                var current_bid = $('#frmBidNow').find('input[name="current_bid"]').val();
                var minimum_bid = parseFloat(increment) + parseFloat(current_bid);
                var yourbid = $('#frmBidNow').find('input[name="email"]').val();
                var form = $('#frmBidNow');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';

                yourbid = parseFloat(yourbid);
                current_bid = parseFloat(current_bid);
                increment = parseFloat(increment);

                var bidIsOK = false;
                //alert('your bid' + yourbid + ' vs ' + minimum_bid);
                
                if(isNaN(yourbid)){
                
                  yourbid = 0;
                  bidIsOK = false;
                
                } 
                if (yourbid < minimum_bid){
                
                  bidIsOK = false;
                  errMsg = "Error! Please enter a bid of "+ minimum_bid +".00 or more";
                
                } else {
                
                  bidIsOK = true;
                
                }

                console.log('method:'+form.attr('method'));
                console.log('action:'+auction_base_url + '/' + form.attr('action'));
                console.log('data:'+form.serialize());
                if(bidIsOK){
                    $.ajax({
                        type: form.attr('method'),  //form method
                        url: auction_base_url + '/' + form.attr('action'),   //form action
                        data: form.serialize(),
                        success: function(data, status) {
                            $('#placeBid').modal('hide');
                            //Modal Message here
                            alert('Thank you! Your bid has been placed');
                            window.location.reload();
                        }
                    });
                } else {
                  $('#frmBidNow').find('input[name="email"]').focus(); //set focus on the bid field
                  //$('#frmBidNow').find('snap[name="message"]').html('<div class="alert alert-error"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Error!</strong>'+ errMsg +'</div>');
                  alert(errMsg);
                }

                event.preventDefault();
            });

        });

      </script>