
<script src="<?php echo base_url(); ?>assets/dropdown/scripts.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url(); ?>assets/dropdown/styles.css" />
<form method="post" id="frmTopFilter" name="topfilter" action="">
<div class="main col-xs-12">
  <ul id="new_menu">  
    <div class="media_owners_select">
      <select class="form-control" name="filter_media_owner" id="filter_media_owner">
        <option value="0">Media Owner</option>
        <?php foreach ($media_owners as $row) {
          # code...
          ?>
          <option value="<?php echo $row->use_id; ?>" 
	   <?php echo (isset($filter_media_owner) && $filter_media_owner==$row->use_id)?' selected':'';?>>
	   <?php echo $row->use_first_name.', '.$row->use_last_name;  ?></option>
          <?php
        }?>
      </select>

    </div>
    <li>
      <a href="#">Contract no/ Name <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
      <div><span style="margin-top:-50px;" id="selected_filter_contract">
	<?php echo $this->input->get('ct'); ?></span></div>
	</a>

      <div class="drop_down">
        <div class="d_content">
          <select class="form-control" name="filter_contract" id="filter_contract">
            <?php foreach ($contracts as $row) {
              # code...
              ?>
              <option value="<?php echo $row->cam_id; ?>" 
		<?php echo (isset($filter_contract) && $filter_contract==$row->cam_id)?' selected':'';?>>
		<?php echo $row->cam_ref,' - ',$row->cam_title;  ?></option>
              <?php
            }?>
          </select>

        </div>
        <div class="d_buttons">
          <center>
            <button class="btn btn-primary" class="btnSearchFilter">Search</button>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>

    <li>
      <a href="#">Client <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
       <div><span style="margin-top:-50px;" id="selected_filter_contract">
       <?php 
	$selected_filter_contact = "";
	foreach ($advertisers as $row) {
	  if(isset($filter_advertiser) && in_array($row->use_id, $filter_advertiser)){
	    $selected_filter_contact .= $row->use_last_name.",";
	  }
	}
	echo substr($selected_filter_contact,0,20); ?></span></div>
      </a>
      <div class="drop_down">
        <div class="d_content">
          <select class="form-control" multiple name="filter_advertiser[]">
            <?php foreach ($advertisers as $row) {
              # code...
              ?>
              <option value="<?php echo $row->use_id; ?>"
 		<?php echo (isset($filter_advertiser) && in_array($row->use_id, $filter_advertiser))?' selected':'';?>>
		<?php echo $row->use_first_name.', '.$row->use_last_name;  ?></option>
              <?php
            }?>
          </select>
        </div>
        <div class="d_buttons">
          <center>
    	<!-- <a href="#" class="btn btn-primary">Search</a> -->
	  <!--  <button class="btn btn-primary" class="btnSearchFilter" 
		onlick="document.topfilter.submit();">Search</button>-->
	    <button id="btnAdvSearch" type="button" class="btn btn-primary" class="btnSearchFilter">Search</button>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>


    <li>
      <a href="#">Media Category <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>

       <div><span style="margin-top:-50px;" id="selected_filter_contract">
       <?php

	function getCatName($i){
	switch($i){
		 case 1: "Outdoor"; break;
		 case 2: "Indoor"; break;
		 case 3: "Rolling Media"; break;
		 case 4: "Print"; break;
		 case 5: "Othe"; break;
		}
	}

        //$selected_filter_category = "";
        /*for ($i=1; $i<6;$i++) {
          if(isset($filter_media_category) && in_array($i, $filter_media_category)){
            $selected_filter_category .= getCatName($i).",";
          }
        }*/
        echo $selected_filter_category; ?></span></div>

	</a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="filter_media_category[]" value="1"
		<?php echo (isset($filter_media_category) && in_array(1, $filter_media_category))?' checked="checked"':'';?>
> Outdoor
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="filter_media_category[]" value="2"

<?php echo (isset($filter_media_category) && in_array(2, $filter_media_category))?' checked="checked"':'';?>
> Indoor
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="filter_media_category[]" value="3"
<?php echo (isset($filter_media_category) && in_array(3, $filter_media_category))?' checked="checked"':'';?>
> Rolling Media
            </label>
          </div>

          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="filter_media_category[]" value="4"
<?php echo (isset($filter_media_category) && in_array(4, $filter_media_category))?' checked="checked"':'';?>
> Print
            </label>
          </div>
          
          <div class="checkbox block">
            <label>
              <input type="checkbox" class="mediaCategory" name="filter_media_category[]" value="5"
<?php echo (isset($filter_media_category) && in_array(5, $filter_media_category))?' checked="checked"':'';?>
> Other
            </label>
          </div>

        </div>
        <div class="d_buttons">
          <center>
            <!-- <a href="#" class="btn btn-primary">Search</a>-->
	    <button id="btnCategorySearch" type="button" class="btn btn-primary" class="btnSearchFilter">Search</button>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>


    <li>
      <a href="#">Campaign Status <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	<div><span style="margin-top:-50px;" id="selected_filter_status">
	<?php
        $selected_filter_status= "";
        foreach ($workflow_status as $row) {
          if(isset($filter_campaign_status) && in_array($row->pro_status_id, $filter_campaign_status)){            	
            $selected_filter_status .= $row->prs_description.",";
          }
        }
        echo '<b>'.substr($selected_filter_status,0,30).'</b>'; ?></span></div>
	</a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>

          <?php foreach ($workflow_status as $row) {
            # code...
            ?>
            <div class="checkbox block">
              <label>
                <input type="checkbox" class="filter_campaign_status" value="<?php echo $row->pro_status_id; ?>" 
                        name="filter_campaign_status[]"
<?php echo (isset($filter_campaign_status) && in_array($row->pro_status_id, $filter_campaign_status))?' checked="checked"':'';?>
		><?php echo $row->prs_description; ?>
              </label>
            </div>            
            <?php
          }?>
          
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>


    <li>
      <a href="#">Dates <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
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
              <td>Confirmed</td>
              <td><input class="form-control datepicker" name="confirmed_date" data-provide="datepicker"></td>
              <td>Or</td>
              <td><input class="form-control datepicker" name="confirmed_start_date" data-provide="datepicker"></td>
              <td><input class="form-control datepicker" name="confirmed_end_date" data-provide="datepicker"></td>
            </tr>

            <tr>
              <td>Start</td>
              <td><input class="form-control datepicker" name="starts_date"></td>
              <td>Or</td>
              <td><input class="form-control datepicker" name="starts_start_date"></td>
              <td><input class="form-control datepicker" name="starts_end_date"></td>
            </tr>

            <tr>
              <td>End</td>
              <td><input class="form-control datepicker" name="ends_date"></td>
              <td>Or</td>
              <td><input class="form-control datepicker" name="ends_start_date"></td>
              <td><input class="form-control datepicker" name="ends_end_date"></td>
            </tr>

            <tr>
              <td>Worfkflow</td>
              <td><input class="form-control datepicker" name="workflow_date"></td>
              <td>Or</td>
              <td><input class="form-control datepicker" name="workflow_start_date"></td>
              <td><input class="form-control datepicker" name="workflow_end_date"></td>
            </tr>
          </table>
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>


    <li>
      <a href="#">Campaign Origin <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
      <div class="drop_down">
        <div class="d_content">
          <a href="#">Select All</a> <span>|</span> <a href="#">Clear All</a>

          <?php foreach ($origins as $row) {
            # code...
            ?>
            <div class="checkbox block">
              <label>
                <input type="checkbox" name="filter_origin[]" value="<?php echo $row->id; ?>"> <?php echo $row->origin_description; ?>
              </label>
            </div>            
            <?php
          }?>
          
        </div>
        <div class="d_buttons">
          <center>
            <a href="#" class="btn btn-primary">Search</a>
            <a href="#" class="btn btn-primary">Cancel</a>
          </center>
        </div>
      </div>
    </li>
  </ul>
</div>
</form>
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
<pre>
<?php 
	print_r($filter_advertiser); 
	print_r($filter_media_category);
	print_r($selected_filter_category);
?>
</pre>
-->
