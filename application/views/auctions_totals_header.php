<?php
$myBidsCount = $_SESSION['myBidsCount'];
$myWatchlistCount = $_SESSION['myWatchlistCount'];
$page = $_SESSION['page'];
?>

  <ul class="nav navbar-nav section-menu">
  	<li><a href="<?php echo site_url('navigate/index'); ?>">Home</a></li>
    <li <?php echo ($page=='SEARCH')?'class="active"':'';?>><a href="<?php echo site_url('load_stock/asset_details3'); ?>">All Auctions</a></li>
    <li <?php echo ($page=='ACTIVE_BIDS')?'class="active"':'';?>><a href="<?php echo site_url('load_stock/active_bids'); ?>">Your Active Bids<span class="badge"><?php echo $myBidsCount;?></span></a></li>
    <li <?php echo ($page=='WATCHLIST')?'class="active"':'';?>><a href="<?php echo site_url('load_stock/watch_list'); ?>">Watch List<span class="badge"><?php echo $myWatchlistCount;?></span></a></li>
    <li <?php echo ($page=='WON_BIS')?'class="active"':'';?>><a href="<?php echo site_url('load_stock/won_bids'); ?>">Won Bids</a></li>
    <li <?php echo ($page=='LOST_BIDS')?'class="active"':'';?>><a href="<?php echo site_url('load_stock/lost_bids'); ?>">Lost Bids</a></li>
  </ul>