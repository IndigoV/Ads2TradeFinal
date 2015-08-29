<?php error_reporting(0); ?>
<div class="breadcrumbs">
  <h1><span class="glyphicon glyphicon-list-alt"></span>My Active Bids</h1>
</div>

<?php 

$_SESSION['page'] = 'ACTIVE_BIDS';

$user_type = $this->session->userdata('user_type');
$user_id = $this->session->userdata('user_id');
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
                    <th>Location</th>
                    <th>Your Bid</th>
                    <th>Current Bid</th>
                    <th>Buy Now Price</th>
                    <th>Time Remaining</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
     
            <tbody>
                
<?php
              
 if (!empty($myBids)){       
  foreach ($myBids as $rows){       

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
                      <a class="thumbnail" href="<?php echo $asset_url;?>" <?php echo $css_disabled;?>>
                        <img src="<?php echo $img;?>">
                      </a>
                    </td>
                    <td><a href="<?php echo $asset_url;?>"><?php echo $ass_name ?></a></td>
                    <td><?php echo $location;?></td>
                    <td><?php echo $rows->bid;?></td>
                    <td><?php echo $current_bid;?></td>
                    <td><?php echo $buy_now;?></td>
                    <td><?php echo $auction_ends_in_x_dys_y_hrs;?></td>
                    <td><?php echo $row->mec_description;?></td>
                    <td><?php echo $stat;?></td>
                    <td align="center" width="260">
                        <a href="#" 
                        onclick="modalshow('<?php echo $row->ass_id; ?>','1')" 
                        class="btn btn-default" 
                        <?php echo $css_disabled;?>
                        title="<?php echo $closed_title; ?>">Options</a>
                     </td>
                </tr>
        <?php 
              //}
       
       }


}else{ ?>
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
 
 $("#modalwin").load("loadajax?c="+a+"&type="+b+"&p=active_bids");
 // $("#modalwin").load("bid_pop?ass_id="+a+"&type="+b);
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
/* 
echo "<pre>";
//echo count($myWatchlist); 
//print_r($au_diff);
print_r($myBids);
*/
 ?>