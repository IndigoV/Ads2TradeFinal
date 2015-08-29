<div class="breadcrumbs" style="margin-top:-100px;"> <!-- margin-top: use up whitespace at the top of the page -->
    <h1><span class="glyphicon glyphicon-stats"></span>Manage Campaigns :: Reports </h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('campaign/topmenu');
}
?>

<div class="main col-xs-12">
Campaign Workflow Reports coming soon...
</div>
