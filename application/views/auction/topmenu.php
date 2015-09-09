<!--
NOTE: Blessed - 18.08.2015
    For the purposes of this presentation I am going to put the code to fetch filters data here
      I will move this to the appropriate controllers, maybe to an autoloaded library like the messaging system
-->
<script src="<?php echo base_url(); ?>assets/dropdown/scripts.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url(); ?>assets/dropdown/styles.css" />
<div class="main col-xs-12">
  <ul id="new_menu">  

    <!-- Media Category -->
    <li>
	<form name="filter_form" method="post">
      <a href="#">Media Category <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	$mc = $_POST['media_category'];
	$mc2 = $_POST['media_category_hid'];
	  if(count($mc)>0 && !empty($mc))
	  {
	
		$mc_val = implode(',', $mc);
		$mc_val2 = implode(',', $mc2);
		if ($mc_val == "1,2,3,4,5,6,7,8,9,13,14,15,16,17,18,20,21"){
			$mc_val = "Outdoor";
		}elseif ($mc_val == "1,10,15,16,24,25"){
			$mc_val = "Indoor";
		}elseif ($mc_val == "5,7,9,10,13,15,17,20,22,23,24"){
			$mc_val = "Rolling Media";
		}elseif ($mc_val == "11,12"){
			$mc_val = "Print";
		}elseif ($mc_val == "19,22,23"){
			$mc_val = "Other";
		}else
			$mc_val = $mc_val2;
	  }
	  echo "<br/><font color=white><div style='margin-top:-2px;'>".substr($mc_val, 0, 17)."...</div></font>";
	  ?>
      </a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#" class="selectAllMediaCategory">Select All</a> <span>|
          </span> <a href="#" class="selectAllMediaCategory">Clear All</a>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="1,2,3,4,5,6,7,8,9,13,14,15,16,17,18,20,21"> Outdoor
			    <input type="hidden" class="mediaCategory" name="media_category_hid[]" value="Outdoor"> 
			  
			  <?php
			  ?>
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="1,10,15,16,24,25"> Indoor
			  <input type="hidden" class="mediaCategory" name="media_category_hid[]" value="Indoor">
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="3,5,7,9,10,13,15,17,20,22,23,24"> Rolling Media
			  <input type="hidden" class="mediaCategory" name="media_category_hid[]" value="Rolling Media">
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="11,12"> Print
			  <input type="hidden" class="mediaCategory" name="media_category_hid[]" value="Print">
            </label>
          </div>
          
          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_category[]" value="19,22,23"> Other
			   <input type="hidden" class="mediaCategory" name="media_category_hid[]" value="Other">
            </label>
          </div>

        </div>
        <div class="d_buttons">
          <center>
            <a href="#" onclick="document.filter_form.submit()" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>

    <!-- Media Type -->
    <li>
      <a href="#">Media Type <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $mt = $_POST['media_type'];
	  if(count($mt)>0 && !empty($mt))
	  {
		$mt_val = implode(',', $mt);
	  }
	  echo "<div  style='margin-top:-2px; '>".substr($mt_val, 0, 17)."...</div>";
	  ?>
      </a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value="Dustbin"> Dustbin
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value="Billboards"> Billboards
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value="Busshelter"> Busshelter
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value="Street Sign"> Street Sign
            </label>
          </div>
          
          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value= "Radio"> Radio
            </label>
          </div>
          
          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value="Digital"> Digital
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_type[]" value="Mobile"> Mobile
            </label>
          </div>

        </div>
        <div class="d_buttons">
          <center>
            <a href="#" onclick="document.filter_form.submit()" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>

    <li>
      <a href="#">Auction Status <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $as = $_POST['auction_status'];
	  if(count($as)>0 && !empty($as))
	  {
		$as_val = implode(',', $as);
	  }
	  echo "<div style='margin-top:-2px;'>".substr($as_val, 0, 17)."...</div>";
	  ?>
      </a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="auction_status[]" value="On Auction"> On Auction
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="auction_status[]" value="Scheduled Auction"> Scheduled Auction
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="auction_status[]" value="Scheduled Auction"> Past Auction
            </label>
          </div>
          
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" onclick="document.filter_form.submit()" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>


    <li>
      <a href="#">Active / Not Active <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $active = $_POST['activeNotActive'];
	  if(count($active)>0 && !empty($active))
	  {
		$active_val = implode(',', $active);
	  }
	  echo "<div style='margin-top:-2px;'>".substr($active_val, 0, 17)."...</div>";
	  ?>
      </a>
      <div class="drop_down">
        <div class="d_content">

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="activeNotActive[]" class="activeNotActive" value="Active"> Active
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="activeNotActive[]" class="activeNotActive" value="Not Active"> Not Active
            </label>
          </div>

        </div>
        <div class="d_buttons">
          <center>
            <a href="#" onclick="document.filter_form.submit()" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>


    <li>
      <a href="#">Media Status <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  <?php
	  $ms = $_POST['media_status'];
	  if(count($ms)>0 && !empty($ms))
	  {
		$ms_val = implode(',', $ms);
	  }
	  echo "<div style='margin-top:-2px;'>".substr($ms_val, 0,17)."...</div>";
	  ?>
      </a>

      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_status[]" value="Available"> Available
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_status[]" value="Reserved"> Reserved
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_status[]" value="Booked"> Booked
            </label>
          </div>

          <div class="checkbox block" >
            <label>
              <input type="checkbox" name="media_status[]" value="Running">  Running
            </label>
          </div>
                    
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" onclick="document.filter_form.submit()" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>
  </ul>
</div>
<script type="text/javascript">

$(document).ready(function() {
    $('a.selectAllMediaCategory').click(function(event) {  //on click 
        if(this.checked) { // check select status
            $('.mediaCategory').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "mediaType"               
            });
        }else{
            $('.mediaCategory').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "mediaType"                       
            });         
        }
    });
    
});

</script>
<script type="text/javascript">
  var campaign_id = '<?php echo isset($GET['id'])?$GET['id']:0; ?>';

  //Media Owner filter changed
  //filter_media_owner

  //Contract filter changed
  $('#filter_contract').on('change', function() {
    var campaign_filter_text = this.options[this.selectedIndex].text;
    $('#selected_filter_contract').html(campaign_filter_text);
    campaign_id = this.value; 
    window.location.href = '<?php echo site_url('campaign/workflow_details/?id='); ?>' + campaign_id + '&ct=' + campaign_filter_text;
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

<!--
Keep this for me, I want this 

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
              <td>Confirmed</td>
              <td><input class="form-control" name="date"></td>
              <td>Or</td>
              <td><input class="form-control" name="date"></td>
              <td><input class="form-control" name="date"></td>
            </tr>

            <tr>
              <td>Start</td>
              <td><input class="form-control" name="date"></td>
              <td>Or</td>
              <td><input class="form-control" name="date"></td>
              <td><input class="form-control" name="date"></td>
            </tr>

            <tr>
              <td>End</td>
              <td><input class="form-control" name="date"></td>
              <td>Or</td>
              <td><input class="form-control" name="date"></td>
              <td><input class="form-control" name="date"></td>
            </tr>

            <tr>
              <td>Worfkflow</td>
              <td><input class="form-control" name="date"></td>
              <td>Or</td>
              <td><input class="form-control" name="date"></td>
              <td><input class="form-control" name="date"></td>
            </tr>
          </table>

-->