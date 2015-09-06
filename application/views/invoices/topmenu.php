<!--
NOTE: Blessed - 18.08.2015
    For the purposes of this presentation I am going to put the code to fetch filters data here
      I will move this to the appropriate controllers, maybe to an autoloaded library like the messaging system
-->
<style>
</style>
<script src="<?php echo base_url(); ?>assets/dropdown/scripts.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url(); ?>assets/dropdown/styles2.css">

<div class="main col-xs-12">
  <ul id="new_menu">  

    <!-- Media Category -->
	<form name="filter_invoice_form" method="post">
    <div class="media_owners_select" style="margin-top:10px; margin-left:10px;">
      <input class="form-control" type="text" name="text_filter" id="text_filter" placeholder="Enter Invoice # or description" >
    </div>
    <li>
      <a href="#">Status <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $status = $_POST['status'];
	  //$filter_display = "";
	  foreach ($status as $key_s=>$value_s){
		 	//$filter_display .= $value5.", ";			
	  }
	  $this->session->set_userdata("value5", $value_s);
	  $my_value5 = $this->session->userdata('value5');
	  if ($my_value5 == "1")
	  {
		  $invoice_status = "Paid";
	  }elseif ($my_value5 == "0")
	  {
		  $invoice_status = "Unpaid";
	  }
	  else
	  {
		  $invoice_status = "All";
	  }
		  
	  echo "<div style='margin-top:-2px;'>".$invoice_status."</div>";
	  ?>
      </a>

      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>
			   <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="status[]" value=""> All
            </label>
          </div>
			   <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="status[]" value="1"> Paid
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="status[]" value="0"> Upaid
            </label>
          </div>
                    
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" onclick="document.filter_invoice_form.submit()" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>
	</form>
  </ul>
</div>
