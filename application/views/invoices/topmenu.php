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
      <input class="form-control" type="text" name="text_filter" id="text_filter" onblur="document.filter_invoice_form.submit()" placeholder="Enter Invoice # or description" >
    </div>
	<?php
	$invoice_no_description = $_POST['text_filter'];
	//echo $invoice_no_description."****";
	?>
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
	   <li>
      <a href="#">Dates <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $date1 = $_POST['date1'];
	  //$filter_display = "";
	  $this->session->set_userdata("value9", $date1);
	  $my_value9 = $this->session->userdata('value9');	  
	  echo "<div style='margin-top:-2px;'>".$my_value9."</div>";
	  
	  $date2 = $_POST['date2'];
	  //$filter_display = "";
	  $this->session->set_userdata("value10", $date2);
	  $my_value10 = $this->session->userdata('value10');	  
	  echo "<div style='margin-top:-2px;'>".$my_value10."</div>";
	  
	  $date3 = $_POST['date3'];
	  //$filter_display = "";
	  $this->session->set_userdata("value11", $date3);
	  $my_value11 = $this->session->userdata('value11');	  
	  echo "<div style='margin-top:-2px;'>".$my_value11."</div>";
	  ?>
	  </a>
      <div class="drop_down dates">
        <div class="d_content">
          <table>
            <tr>
              <td>&nbsp;</td>
              <td>On..</td>
              <td width="30px">&nbsp;</td>
              <td>Between</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr>
              <td>Date</td>
              <td><input class="form-control datepicker" name="date1" data-provide="datepicker"></td>
              <td>Or</td>
              <td><input class="form-control datepicker" name="date2" data-provide="datepicker"></td>
              <td><input class="form-control datepicker" name="date3" data-provide="datepicker"></td>
            </tr>
          </table>
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" class="btn btn-primary" onclick="document.filter_invoice_form.submit()">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>
	<li>
      <a href="#">Amount <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $amount1 = $_POST['amount1'];
	  //$filter_display = "";
	  $this->session->set_userdata("value6", $amount1);
	  $my_value6 = $this->session->userdata('value6');	  
	  echo "<div style='margin-top:-2px;'>".$my_value6."</div>";
	  
	  $amount2 = $_POST['amount2'];
	  //$filter_display = "";
	  $this->session->set_userdata("value7", $amount2);
	  $my_value7 = $this->session->userdata('value7');	  
	  echo "<div style='margin-top:-2px;'>".$my_value7."</div>";
	  
	  $amount3 = $_POST['amount3'];
	  //$filter_display = "";
	  $this->session->set_userdata("value8", $amount3);
	  $my_value8 = $this->session->userdata('value8');	  
	  echo "<div style='margin-top:-2px;'>".$my_value8."</div>";
	  ?>
	  </a>
      <div class="drop_down dates">
        <div class="d_content">
          <table>
            <tr>
              <td>&nbsp;</td>
              <td>Amount</td>
              <td width="30px">&nbsp;</td>
              <td>Between</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr>
              <td>Amount</td>
              <td><input class="form-control" name="amount1" ></td>
              <td>Or</td>
              <td><input class="form-control" name="amount2"></td>
              <td><input class="form-control" name="amount3"></td>
            </tr>
          </table>
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" class="btn btn-primary" onclick="document.filter_invoice_form.submit()">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>
	</form>
  </ul>
</div>
<script type="text/javascript">
  var campaign_id = '<?php echo isset($GET['id'])?$GET['id']:0; ?>';

  //Media Owner filter changed
  //filter_media_owner

  //Contract filter changed
  $('#filter_contract').on('change', function() {
    var campaign_filter_text = this.options[this.selectedIndex].text;
    $('#selected_filter_contract').html(campaign_filter_text);
    campaign_id = this.value; 
    window.location.href = '<?php echo site_url('campaign/setup_topmenu_filters/?id='); ?>' + campaign_id + '&ct=' + campaign_filter_text;
  });

  // Datepicker options
  $('.datepicker').datepicker({
      format: 'mm/dd/yyyy',
      startDate: '-3d'
  });

  // Search/Filter button clicked
  $('#btnAdvSearch').on('click',function(){
  	//alert('filtering ... ');
	$('#frmTopFilter').submit();
  });

  $('#btnCategorySearch').on('click',function(){
        $('#frmTopFilter').submit();
  });

</script>