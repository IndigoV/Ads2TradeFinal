<?php
//TODO: 
//	Need to relook login/login_validate and navigate/index to 
//  come up with dashboard/{dashboard type}
//
// For now load the model here (not ideal)
//$this->load->model('dashboard');

//Current user
$user_type = $this->session->userdata('user_type');
$user_id = $this->session->userdata('user_id');
$user = $user_id;

//Get dashboard totals              
// My Assets
$myAssets = $this->dashboard->totalAssets($user_id);
$myAssetsCount = $myAssets[0]->total_assets;
$myAssetsCostTotal = $myAssets[0]->total_acquisition_cost;

// My Active Bids
$myBids = $this->dashboard->userBids($user_id);
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
//$myLatestBidAmount = $userBids[0]->bid;

// All (My??) Active Auctions
$allAuctions = $this->dashboard->totalAuctions($user_id);
$totalAuctions = $allAuctions[0]->total;

// All Auctions / Bids
$forAllUsers = 0;
$allBids = $this->dashboard->userBids($forAllUsers);
$allBidsCount = 0;
$allBidsTotal = 0;
$first_record = true;
foreach ($allBids as $row) {
	$allBidsCount++;
	$allBidsTotal += $row->bid;
	if($first_record){
		$allLatestBidAmount = $row->bid;
		$first_record = false;
	}
}

?>
<div class="breadcrumbs">
  <h1><span class="glyphicon glyphicon-home"></span> Dashboard</h1>
</div>
<div class="main">

  <br>
  <br>

  <div class="row">
    <div class="col-xs-8">
      <div id="dashboard_stats">
        <div class="row">
          <div class="col-sm-4">
            <a href="<?php echo site_url('load_stock'); ?>" class="stat icon1">
              <h3><?php echo $myAssetsCount;?></h3>
              <h4>My Assets</h4>
              <hr>
              <div class="row info">
                <!--                         
                <div class="col-sm-4 text-left">
                  <span>Total Acquiaition Cost:</span>R<?php echo $allAssetsValue; ?>
                </div> 
                -->
                <div class="col-sm-12 text-right">
                  <small><span>Total Acquisition Cost:</span>R<?php echo $myAssetsCostTotal;?></small>
                </div>
              </div>
            </a>
          </div>

          <div class="col-sm-4">
             <a href="<?php echo site_url('load_stock/active_bids'); ?>" class="stat icon2">
              <h3><?php echo $myBidsCount;?></h3>
              <h4>My Active bids</h4>
              <hr>
              <div class="row info">
                <div class="col-sm-4 text-left">
                  <small><span>Total:</span>R<?php echo $myBidsTotal;?></small>
                </div>
                <div class="col-sm-8 text-right">
                  <small><span>Latest Bid Amount:</span>R<?php echo $myLatestBidAmount;?></small>
                </div>
              </div>
            </a>
          </div>

          <div class="col-sm-4">
            <a href="<?php echo site_url('load_stock/asset_details3'); ?>" class="stat icon3">
              <h3><?php echo $totalAuctions;?></h3>
              <h4>All Auctions</h4>
              <hr>
              <div class="row info">
                <div class="col-sm-6 text-left">
                  <small><span>Bids (<?php echo $allBidsCount; ?>):</span>
                  R<?php echo $allBidsTotal;?></small>
                </div>
                <div class="col-sm-6 text-right">
                  <small><span>Latest Bid:</span>R<?php echo $allLatestBidAmount;?></small>
                </div>
              </div>
            </a>
          </div>


          <div class="col-sm-4">
            <a href="<?php echo site_url('new_campaign/mo_proposals'); ?>" class="stat icon4">
              <h3>0</h3>
              <h4>Request For Proposals</h4>
              <hr>
              <div class="row info">
                <div class="col-sm-4 text-left">
                  <small><span>Total:</span>R0</small>
                </div>
                <div class="col-sm-8 text-right">
                  <small><span>Current Bid Value:</span>R0</small>
                </div>
              </div>
            </a>
          </div>

          <div class="col-sm-4">
            <a href="<?php echo site_url('load_stock'); ?>" class="stat icon5">
              <h3>0</h3>
              <h4>Add Assets To Auction</h4>
              <hr>
              <div class="row info">
                <div class="col-sm-4 text-left">
                  <small><span>Total:</span>R0</small>
                </div>
                <div class="col-sm-8 text-right">
                  <small><span>Current Bid Value:</span>R0</small>
                </div>
              </div>
            </a>
          </div>

          <div class="col-sm-4">
            <a href="#" class="stat icon6">
              <h3>0</h3>
              <h4>Assets On Special</h4>
              <hr>
              <div class="row info">
                <div class="col-sm-4 text-left">
                  <small><span>Total:</span>R0</small>
                </div>
                <div class="col-sm-8 text-right">
                  <small><span>Current Bid Value:</span>R0</small>
                </div>
              </div>
            </a>
          </div>

          
        </div>
      </div>
    </div>

    
    
    <div class="col-xs-4">
      <div class="panel panel-default">
        <div class="panel-heading">Latest News</div>
        <div class="panel-body">

          <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs" role="tablist">
              <li class="active"><a href="#newsfeed" role="tab" data-toggle="tab">Newsfeed</a></li>
              <li><a href="#campaigns" role="tab" data-toggle="tab">Campaigns</a></li>
              <li><a href="#activities" role="tab" data-toggle="tab">Activities</a></li>
            </ul>

            <div id="myTabContent" class="tab-content">

              <div class="tab-pane fade in active" id="newsfeed">
                <div class="feed-activity-list">

                 <?php     
                $this->db->where("user_type_id", '1');
                $this->db->select('*');
                $this->db->from('news');
                $this->db->join('news_group_access', 'news_group_access.news_id = news.id');
                $select = $this->db->get();
                foreach ($select->result() as $feed){                               
              ?>
            <div class="feed-element">
              <div class="media-body ">
                <a href="../navigate/feeds"><?php echo $feed->title;?></a><br>
                <small class="text-muted"><?php echo date('D, F d, Y',strtotime($feed->news_date)); ?></small>
              </div>
            </div>

           <?php }?>
                </div>
              </div>

              <div class="tab-pane fade in" id="campaigns">
			  <?php
				$sql = "SELECT * FROM system_events WHERE event_type in(3) ORDER BY event_date DESC";
				$select = $this->db->query($sql);
				if ($select->num_rows() > 0)
				{
				 foreach ($select->result() as $event){
			  ?>
				<div class="feed-element">
				  <div class="media-body ">
					<a href="../navigate/feeds"><?php echo $event->event_details;?></a><br>
					<small class="text-muted"><?php echo date('D, F d, Y h:j A',strtotime($event->event_date)); ?></small>
				  </div>
				</div>

			  <?php } //end foreach
              } else {?>
              
              <div class="feed-element">
                <div class="media-body ">
                  <span><i>No Campaign Events found </i></span><br>
                  <small class="text-muted"><?php echo date('D, F d, Y h:j A'); ?></small>
                </div>
              </div>
			  
			<?php }?>
			
              </div>

              <div class="tab-pane fade in" id="activities">
              <?php
                $sql = "SELECT * FROM system_events WHERE event_type not in(0,3,4,5) ORDER BY event_date DESC";
                $select = $this->db->query($sql);
				if($select->num_rows() > 0){
                foreach ($select->result() as $event){
              ?>
            <div class="feed-element">
              <div class="media-body ">
                <a href="../navigate/feeds"><?php echo $event->event_details;?></a><br>
                <small class="text-muted"><?php echo date('D, F d, Y h:j A',strtotime($event->event_date)); ?></small>
              </div>
            </div>
		   <?php } //end foreach
		   } else { ?>

              <div class="feed-element">
                <div class="media-body ">
                  <span><i>No Bids/Auctions Activites found </i></span><br>
                  <small class="text-muted"><?php echo date('D, F d, Y h:j A'); ?></small>
                </div>
              </div>
			  
           <?php }?>
		   
              </div>

            </div>
          </div>

          
        </div>
      </div>
    </div>

  </div>

</div>
<?php
//echo "<pre>";
//print_r($allBids);
?>