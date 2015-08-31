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
	  $filter_display = "";
	  foreach ($mc as $key=>$value1){
		  $filter_display .= $value1.",";
	  }
	  echo "<br/><font color=white><div style='margin-top:-2px;'>".substr($value1, 0, 17)."...</div></font>"
	  ?>
      </a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#" class="selectAllMediaCategory">Select All</a> <span>|
          </span> <a href="#" class="selectAllMediaCategory">Clear All</a>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="Outdoor"> Outdoor
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="Indoor"> Indoor
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="Rolling Media"> Rolling Media
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="media_category[]" value="Print"> Print
            </label>
          </div>
          
          <div class="checkbox block">
            <label>
              <input type="checkbox" name="media_category[]" value="Other"> Other
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
	  $filter_display = "";
	  foreach ($mt as $key=>$value2){
			$filter_display .= $value2.","; 
	  }
	  echo "<div  style='margin-top:-2px; '>".substr($value2, 0, 17)."...</div>"
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
	  $filter_display = "";
	  foreach ($as as $key=>$value3){
			$filter_display .= $value3. ", ";  
	  }
	  echo "<div style='margin-top:-2px;'>".substr($value3, 0, 17)."...</div>"
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
	  $filter_display = "";
	  foreach ($active as $key=>$value4){
			$filter_display .= $value4.", ";  
	  }
	  echo "<div style='margin-top:-2px;'>".substr($value4, 0, 17)."...</div>"
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
	  $filter_display = "";
	  foreach ($ms as $key=>$value5){
		 	$filter_display .= $value5.", "; 
	  }
	  echo "<div style='margin-top:-2px;'>".substr($value5, 0,17)."...</div>";
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
</form>
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