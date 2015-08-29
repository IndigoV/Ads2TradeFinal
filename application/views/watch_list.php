<?php //include("header.php"); ?>
<div class="breadcrumbs">
  <h1><span class="glyphicon glyphicon-list-alt"></span>My Watch List</h1>
</div>

<?php 
$_SESSION['page'] = 'WATCHLIST';

$user_type = $this->session->userdata('user_type');
$user_id = $this->session->userdata('user_id');
$user = $user_id;
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}

// My Active Bids
$bid_type = 1; //Active [1=Active, 2=Won, 3=Lost]
$myBids = $this->dashboard->userBids($user_id, $bid_type);
$myBidsCount = 0;
$myBidsTotal = 0;
$first_record = true;
foreach ($myBids as $row) {
  $myBidsCount++;
  $myBidsTotal += $row->bid;
  if($first_record){
    $myLatestBidAmount = $row->bid;
    $first_record = false;
  }
}
$total_active_bids = $myBidsCount;

// My Watchlist 
$myWatchlist = $this->dashboard->userWatchList($user_id);
//var_dump($myWatchlist);
//TODO: Find a cleaner way for this
$_SESSION['total_active_bids'] = 100;
$_SESSION['myBidsCount'] = $myBidsCount;
$_SESSION['myWatchlistCount'] = ($myWatchlist)?count($myWatchlist):0;

?>
        
<div class="main col-xs-12">

<?php
  $this->load->view('auctions_totals_header');
?>

 <div class="clear"></div>

    <table class="table table-bordered headed" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Pic</th>
            <th>Asset Name</th>
            <th>Your Bid</th>
            <th>Current Bid</th>
            <th>Time Remaining</th>
            <th>Asset Type</th>
            <th>Status</th>
            <th>&nbsp;</th>
        </tr>
    </thead>

    <tbody>
                
<?php
 $user = $this->session->userdata('use_id');   
 if (!empty($myWatchlist)){       
  foreach ($myWatchlist as $rows) {       

      $ass_name = $rows->ass_name;
      $elapsed = '';                                               
      $img = '../../assets/images/add1.jpg';
      $date = $rows->ends;//date('Y-m-d h:i:s', time());
      $date1 = $rows->bidwhen;//'2013-09-11 10:25:00';
      $current_bid= $row->current_bid;
      $buy_now= $rows->buy_now;
      $location=$rows->ass_address;
      
      $yobid = $this->auction->auctionUserLastMaxBid($rows->auction_id, $user);


      if ($yobid > $current_bid){
          $stat = '<statuses verify>';
      } elseif ($yobid == 0){
          $stat = 'No Bid';
      } else {
          $stat = 'Out Bid';
      }

      $asset_url = site_url('auctions/asset')."?auction_id=$rows->auction_id&ass_id=$rows->ass_id";
      
      //Auction end date
      $auction_ends = $rows->ends;

      //Get days/hours before auction ends
      $au_now  = date_create(date('Y-m-d H:j:s'));
      $au_ends = date_create($auction_ends);
      $au_diff = date_diff($au_ends, $au_now);
      $auction_ends_in_x_dys_y_hrs = "";
      //get the days
      if($au_diff->d > 0){
      $auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->d.($au_diff->d>1)?$au_diff->d.' Days ':' Day ';
      }
      //get the hours
      if($au_diff->h > 0){
      $auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->h.($au_diff->h>1)?$au_diff->h.' Hours ':' Hour ';
      }
      //get the mins
      if($au_diff->i > 0){
      $auction_ends_in_x_dys_y_hrs .= ' '.$au_diff->i.($au_diff->i>1)?$au_diff->i.' Minutes ':' Minute ';
      }

      //If Auction has ended then ellapsed in N/A therefore *** Auction Ended ***
      $todayDate = date("Y-m-d H:i:s", mktime(0, 0, 0));  

      if ($todayDate > $rows->ends) {
        $stat = 'CLOSED';
        $css_disabled = 'disabled';
        $auction_ends_in_x_dys_y_hrs = "0 Days 0 Hours 0 Minutes";
        $closed_title = 'This auction has closed';
      } else {
        $stat = 'ACTIVE';
        $css_disabled = '';
        $closed_title = 'Auction options';
      }

      $elapsed = $auction_ends_in_x_dys_y_hrs;

  ?>
      <tr>
          <td width="50">
            <a class="thumbnail" href="<?php echo $asset_url;?>">
              <img src="<?php echo $img;?>">
            </a>
          </td>
          <td><a href="<?php echo $asset_url;?>"><?php echo $ass_name ;?></a></td>
          <td><?php echo ($yobid>0)?$yobid:'N/A';?></td>
          <td><?php echo $rows->current_bid;?></td>
          <td><?php echo $elapsed;?></td>
          <td><?php echo $rows->description;?></td>
          <td><?php echo $stat;?></td>
           <td width="260">
              <a href="#" onclick="modalshow('<?php echo $row->ass_id; ?>','<?php echo $row->auction_id; ?>')" class="btn btn-default" <?php echo $css_disabled;?>>Options</a>
              <a href="#" onclick="removes('<?php echo $row->ass_id; ?>','<?php echo $row->auction_id; ?>')" class="btn btn-default" >Remove Item</a>
          </td>
      </tr>
<?php        
  }
} else { 
?>
            <div class="feed-element">
            <div class="media-body ">
              <small class="pull-right"></small>
              <a href="#">No Bids Yet</a><br>
              <small class="text-muted"></small>
            </div>
          </div> 
            
       <?php }
?>
            </tbody>
        </table>

      

    

</div><!--Main -->


  <?php //include("footer.php"); ?>

        <script>
  function modalshow(a,b){
    

  var width,height,padding,top,left,modalbak,modalwin;
  width   = 900;
  height  = 500;
  padding = 64;
  top     = (window.innerHeight-height-padding)/2;
  left    = (window.innerWidth-width-padding)/2;
 
  $("#modalwin").load("loadajax?c="+a+"&type="+b+"&p=watch_list");
  modalbak = document.getElementById("modalbak");
  modalbak.style.display = "block";

  modalwin = document.getElementById("modalwin");
  modalwin.style.top     = top+"px";
  modalwin.style.left    = left+"px";
  modalwin.style.display = "block";
}
function modalhide1(){
  document.getElementById("modalbak").style.display = "none";
  document.getElementById("modalwin").style.display = "none";
}

function removes(a,b){
 var r = confirm("Are you sure you want to remove this item from Watch List?");
  if (r == true) {
      location.href="remove_watch?auction_id="+b+"&ass_id="+a;
  }
}

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

<div id='modalbak'></div>
<div id='modalwin' >
             
</div> 
<?php

//echo "<pre>";
//echo count($myWatchlist); 
//print_r($myWatchlist);
//print_r($yobid);

 ?>