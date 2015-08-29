<?php
$user_id = $this->session->userdata('user_id');
/* User Types
1 = //advertiser login
2 = //media owner login
3 = //operator login
*/
$user_type = $this->session->userdata('user_type');
?>
<style>
.list-group.panel > .list-group-item {
  border-bottom-right-radius: 4px;
  border-bottom-left-radius: 4px
}
.list-group-submenu {
  margin-left:20px;
}
/* Overide Link Color and Link font weight */
a.list-group-item-success {
  color: #555;
  font-weight: bold;
}
</style>

<div id="MainMenu">
  <div class="list-group panel">
    <!-- changes href from #dashboard, removed data-toggle=collapse -->
    <a href="<?php echo site_url('navigate/index/');?>" 
    class="list-group-item list-group-item-success" 
    	data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-home">&nbsp;</span>Dashboard</a>
    <!--  
    <div class="collapse" id="dashboard">
      <a href="<?php echo site_url('navigate/index/?type=3');?>" class="list-group-item">
      	<span>&nbsp;&nbsp;&nbsp;</span>Operator</a>
      <a href="<?php echo site_url('navigate/index/?type=2');?>" class="list-group-item">
      	<span>&nbsp;&nbsp;&nbsp;</span>Media Owner</a>
      <a href="<?php echo site_url('navigate/index/?type=1');?>" class="list-group-item">
      	<span>&nbsp;&nbsp;&nbsp;</span>Advertiser</a>
    </div>
    -->
    <?php
    //OPERATOR & MEDIA OWNER: ASSETS MENU
    if($user_type >= 2):
    ?> 
    <a href="#assets" class="list-group-item list-group-item-success" 
      data-toggle="collapse" data-parent="#MainMenu">
      <span class="glyphicon glyphicon-briefcase">&nbsp;</span>Assets</a>
    <div class="collapse" id="assets">
      <a href="<?php echo site_url('load_stock/?type=outdoor');?>" class="list-group-item">
        <span>&nbsp;&nbsp;&nbsp;</span>Outdoor</a>
      <a href="<?php echo site_url('malls');?>" class="list-group-item">
        <span>&nbsp;&nbsp;&nbsp;</span>Indoor</a>
    </div>
    <?php
      endif;
    ?> 

    <?php
     //EVERYONE: AUCTIONS MENU 
    ?>  
    <a href="#auctions" class="list-group-item list-group-item-success" 
    	data-toggle="collapse" data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-list-alt">&nbsp;</span>Auctions</a>
    <div class="collapse" id="auctions">
      <?php
      //OPERATOR: AUCTIONS / APPROVE
      if($user_type == 3):
      ?>
      <a href="<?php echo site_url('my_stock/op_index');?>" class="list-group-item">
        <span>&nbsp;&nbsp;&nbsp;</span>Awaiting Approval</a>
      <?php
      endif;
      ?>  
      <?php
      //OPERATOR & MEDIA OWNER: AUCTIONS / ASSETS
      if($user_type >= 2):
      ?>             
      <a href="<?php echo site_url('load_stock');?>" class="list-group-item">
      	<span>&nbsp;&nbsp;&nbsp;</span>My Assets</a>
      <a href="<?php echo site_url('my_stock/op_index_remove');?>" class="list-group-item">
        <span>&nbsp;&nbsp;&nbsp;</span>Remove from Auction</a>         
      <?php
      endif;
      ?>         
      <!--    
      <a href="<?php echo site_url('auctions/create');?>" class="list-group-item">
      	<span>&nbsp;&nbsp;&nbsp;</span>Create New Auction</a>
        -->
      <a href="<?php echo site_url('load_stock/asset_details3');?>" 
      	class="list-group-item">
      	<span>&nbsp;&nbsp;&nbsp;</span>Active Auctions</a>

      <a href="#" class="list-group-item" title="Auctions Reports">
        <span>&nbsp;&nbsp;&nbsp;</span>Reports</a>  

    </div>
    <a href="#campaigns" class="list-group-item list-group-item-success" 
    	data-toggle="collapse" data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-globe">&nbsp;</span>Campaigns</a>
      <div class="collapse" id="campaigns">
        <a href="<?php echo site_url('campaign/workflow');?>" class="list-group-item">
          <span>&nbsp;&nbsp;&nbsp;</span>My Campaigns</a>
         <a href="<?php echo site_url('campaign/reports');?>" class="list-group-item" title="Campaigns Reports">
          <span>&nbsp;&nbsp;&nbsp;</span>Reports</a>                   
      </div>
    <a href="#invoices" class="list-group-item list-group-item-success" 
    	data-toggle="collapse" data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-file">&nbsp;</span>Invoices</a>
    	<div class="collapse" id="invoices">
	      <a href="<?php echo site_url('invoice');?>" class="list-group-item">
	      	<span>&nbsp;&nbsp;&nbsp;</span>My Invoices</a>
	      <a href="#payments" class="list-group-item">
	      	<span>&nbsp;&nbsp;&nbsp;</span>My Payments</a>
	    </div>
    <a href="#rfps" class="list-group-item list-group-item-success" 
    	data-toggle="collapse" data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-file">&nbsp;</span>RFP</a>
      <div class="collapse" id="rfps">
        <?php

        //Proposals List URLs
        switch($user_type){
          case 1: $url_proposal_list = site_url('new_campaign/ad_campaigns'); break;   /* what about ad_proposals */
          case 2: $url_proposal_list = site_url('new_campaign/media_owner_campaign_list'); break;
          case 3: $url_proposal_list = site_url('new_campaign/campaigns'); break;
          default: //advetiser default
            $url_proposal_list = site_url('new_campaign/ad_proposals');
        }  
        
        //ADVERTISER
        if($user_type == 1 ):
        ?>
        <a href="<?php echo site_url('new_campaign/headerInfo');?>" class="list-group-item">
          <span>&nbsp;&nbsp;&nbsp;</span>Create a new RFP</a>
        <a href="<?php echo $url_proposal_list; ?>" class="list-group-item">
          <span>&nbsp;&nbsp;&nbsp;</span>My RFPs</a>           
        <?php
        endif;
        ?>                         
        <?php
        //MEDIA OWNER
        if($user_type == 2):
        ?>
        <a href="<?php echo $url_proposal_list; ?>" class="list-group-item">
          <span>&nbsp;&nbsp;&nbsp;</span>Proposals</a>  
        <a href="<?php echo site_url('new_campaign/media_owner_accepted_proposals');?>" class="list-group-item">
          <span>&nbsp;&nbsp;&nbsp;</span>Accepted Proposals</a>                     
        <?php
        endif;
        ?> 

        <?php

          //OPERATOR & MEDIA OWNER: AUCTIONS / ASSETS
        if($user_type >= 3):
        ?>   
         <a href="<?php echo site_url('new_campaign/campaigns');?>" class="list-group-item" title="Incoming RFPs from Advertisers">
          <span>&nbsp;&nbsp;&nbsp;</span>New RFPs</a>     
         <a href="<?php echo site_url('new_campaign/proposals');?>" class="list-group-item" title="Incoming Proposals from Media Owners">
          <span>&nbsp;&nbsp;&nbsp;</span>Incoming Quotations</a>  
         <a href="<?php echo site_url('new_campaign/accepted_proposals');?>" class="list-group-item" title="Incoming Proposals from Media Owners">
          <span>&nbsp;&nbsp;&nbsp;</span>Accepted Proposals</a>            
        <?php
        endif;
        ?>               
         <a href="#" class="list-group-item" title="RFP Reports">
          <span>&nbsp;&nbsp;&nbsp;</span>Reports</a>                   
      </div>      
    <a href="<?php echo site_url("user/edit?id="),$user_id; ?>" class="list-group-item list-group-item-success" 
    	data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-cog">&nbsp;</span>Settings</a>
    <a href="<?php echo site_url("login/logout"); ?>" class="list-group-item list-group-item-success" 
    	data-parent="#MainMenu">
    	<span class="glyphicon glyphicon-off">&nbsp;</span>Logout</a>
  </div>
</div>
