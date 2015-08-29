<?php //include("header.php"); ?>
<div class="breadcrumbs">
  <h1><span class="glyphicon glyphicon-list-alt"></span>My Won Bids</h1>
</div>

<?php 

$_SESSION['page'] = 'LOST_BIDS';

$user_type = $this->session->userdata('user_type');
$user_id = $this->session->userdata('user_id');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}
?>

<?php

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

//TODO: Find a cleaner way for this
$_SESSION['total_active_bids'] = 100;
$_SESSION['myBidsCount'] = $myBidsCount;
$_SESSION['myWatchlistCount'] = ($myWatchlist)?count($myWatchlist):0;

// My Won Bids
$bid_type = 3; //Active [1=Active, 2=Won, 3=Lost]
$myLostBids = $this->dashboard->userBids($user_id, $bid_type);
$myLostBidsCount = 0;
$myLostBidsTotal = 0;
$first_record = true;
foreach ($myLostBids as $row) {
  $myLostBidsCount++;
  $myLostBidsTotal += $row->bid;
  if($first_record){
    $myLatestWonBidAmount = $row->bid;
    $first_record = false;
  }
}
$total_won_bids = $myLostBidsCount;
$_SESSION['total_won_bids'] = $total_won_bids;

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
                    <th>Winning Bid</th>
                    <th>Auction Ended</th>
                    <th>Type</th>
                    <th>Status</th>
                </tr>
            </thead>
     
            <tbody>
                
<?php
              
 if (!empty($myLostBids)){       
  foreach ($myLostBids as $rows){      
                                        
      $ass_name = $rows->ass_name;
      $elapsed = '';                                               
      $img = '../../assets/images/add1.jpg';
      $date = $rows->ends;//date('Y-m-d h:i:s', time());
      $date1 = $rows->bidwhen;//'2013-09-11 10:25:00';
      $current_bid= $row->current_bid;
      $buy_now= $rows->buy_now;
      $location=$rows->ass_address;
      
      $yobid = 0;


      if ($yobid > $current_bid){
          $stat = '<statuses verify>';
      } elseif ($yobid == 0){
          $stat = 'No Bid';
      } else {
          $stat = 'Out Bid';;
      }
      
      
      $start_date = new DateTime($date);
      $since_start = $start_date->diff(new DateTime($date1));
      
      $a = substr($date1,0,10);
      $b = substr($date,0,10);
      
      if ($a == $b){
          $today = 'Today ';
      } else {
          $today = '';
      }
      
      $elapsed = '';


      $asset_url = site_url('auctions/asset')."?auction_id=$rows->auction_id&ass_id=$rows->ass_id";
      
      //Auction end date
      $auction_ends = $rows->ends;

      //Get days/hours before auction ends
      $au_now  = date_create(date('Y-m-d H:j:s'));
      $au_ends = date_create($auction_ends);
      $au_diff = date_diff($au_ends, $au_now);
      //print_r($au_diff);
      $auction_ends_in_x_dys_y_hrs = '';
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

      if ($todayDate > $auction_ends) {
        $stat = 'CLOSED';
        $css_disabled = 'disabled';
        $auction_ends_in_x_dys_y_hrs = "0 Days 0 Hours 0 Minutes";
        $closed_title = 'This auction has closed';
      } else {
        $stat = 'ACTIVE';
        $css_disabled = '';
        $closed_title = 'Auction options';
      }

?>
        <tr>
            <td width="50">
              <a class="thumbnail" href="<?php echo $asset_url;?>">
                <img src="<?php echo $img;?>">
              </a>
            </td>
            <td><a href="<?php echo $asset_url;?>"><?php echo $ass_name ?></a></td>
            <td><?php echo $rows->bid;?></td>
            <td><?php echo $current_bid;?></td>
            <td><?php echo $rows->ends;?></td>
            <td><?php echo $rows->description;?></td>
            <td><?php echo $stat;?></td>
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

<?php
//echo "<pre>";
//print_r($myLostBids); ?>