<?php //var_dump($region); 
    //var_dump($_POST);
//Outdoor Assets

$asset_type = $this->input->get('type'); //outdoor or indoor

?>


<style>
    html, body, #map-canvas {
        height: 500px;
        margin: 0px;
        padding: 0px;
        max-width: none !important; /* Fix broken google maps controls*/
    }
    img{max-width: none !important; /* Fix broken google maps controls*/}
    #asset_details {
        margin-top: 500px;
    }
    
    #mapModal{
  position:fixed; 
  top:0; 
  left:0; 
  width:900px; 
  height:700px; 
  background:#FFF; 
  display:none; 
  padding:5px; 
  border:3px double #CCC; 
  z-index:10;
  -moz-border-radius:6px;
  -webkit-border-radius:6px; 
  -moz-box-shadow:3px 3px 6px #666;
  -webkit-box-shadow:3px 3px 6px #666; 
}
  
    .tabs_wrap{ border:solid 1px #e1e1e1; }
    .tabs_wrap a.active{ background-color: #cbc9c9; }
    .dn{ display:none;}
    .Faces{ border-bottom: solid 1px #e1e1e1; padding-bottom: 10px; height: 30px; margin-bottom: 10px; }
    .dbfl{float:left; display:inline-block;}
    .tab_content{display:none; height: 215px; overflow: auto;}
    .tab_content.active{display:block;}
    #dialog_content .buttons_wrap a{ margin-right: 10px;}
    #dialog_content{ float:left; width:100%;}
    #dialog_content label{ display: block; margin: 0px;}
    #dialog_content .form-control{ outline: none!important; border-shadow: none; margin: 0px;outline: none; border: solid 2px #e1e1e1; width: 250px; padding: 6px; margin-bottom: 10px;}

#divSpecsheet div{
  
}
#divSpecsheet .modal .modal-dialog{ 
  width: 90%; 
  width: 900px;
}   
#frmSpecsheet .modal-body{
    overflow-y: scroll;
    height: 400px;
}

.ui-dialog .ui-dialog-title {
  float: left;
  color: #404040;
  font-weight: bold;
  margin-top: 2px;
  margin-bottom: 2px;
  padding: 2px;
}

.ui-draggable .ui-dialog-titlebar {
  cursor: move;
}
.ui-dialog .ui-dialog-titlebar {
  position: relative;
  padding: 5px 15px;
  border: 0 0 0 1px solid;
  border-color: white;
  padding: 5px 15px;
  font-size: 14px;
  text-decoration: none;
  background: 0;
  -moz-border-radius-bottomright: 0;
  -webkit-border-bottom-right-radius: 0;
  -khtml-border-bottom-right-radius: 0;
  -moz-border-radius-bottomleft: 0;
  -webkit-border-bottom-left-radius: 0;
  -khtml-border-bottom-left-radius: 0;
  border-bottom-left-radius: 0;
  border-bottom: 1px solid #ccc;
  background-color: lightgrey;
}
.ui-dialog-titlebar {
  text-align: right;
  background-color: lightgrey;
}
.ui-dialog .ui-dialog-buttonpane button {
  margin: .5em .4em .5em 0;
  cursor: pointer;
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;  
}

.ui-widget-header {
  font-weight: bold;
  border-color: #0064cd #0064cd #003f81;
  border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
  border: 1px solid #666;
}

.ui-widget-content {
  border: 1px solid #aaa;
  background: #fff url(images/ui-bg_glass_75_ffffff_1x400.png) 50% 50% repeat-x;
  color: #404040;
  text-align: center;
}
.ui-widget {
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  font-size: 13px;
}
.

</style>

<!-- Below style is for bootstrap modal -->
<style type="text/css">
    
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

@media print
{
    body * { visibility: hidden; }
    #map-canvas * { visibility: visible; }
    #map-canvas {visibility: visible;position:relative; top: 0px; left: 0px;}
}

</style>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/css/jquery.ui.custom.css"></script>

<div id="popup_content" style="display:none">
    <div id="dialog_content">

    <form>
    <input type="hidden" name="ass_is_mall" id="ass_is_mall" class="dbfl" value="0">
    <input type="hidden" name="face" id="face" class="dbfl" value="fa">    
     
            <div class="face_a_content">

                <div class="tab_content active" id="basic">
                    <button type="button" class="delete_new_asset close" aria-hidden="true">X</button>

                    <label>Title</label>

                    <input type="text" name="title" class="form-control">
                    <label>Media Type</label>
                    <select name="mec_id" class="form-control">
                        <option value="" disabled selected>Select media cat</option>
                        <?php foreach ($media_category as $row):?>
                        <option value="<?php echo $row->mec_id;?>"><?php echo $row->description;?></option> 
                        <?php endforeach;?>            
                    </select>
                    <label>Description</label>
                    <textarea name="desc" class="form-control"></textarea>                  
                    <input type="hidden" name="action" value="add_new_asset" >
                    
                </div>

            </div>
            
            <div class="face_b_content dn">
                <div class="tab_content active" id="basic">
                    <label>Title</label>
                    <input type="text" name="title1" class="form-control">
                    <label>Media Type</label>
                    <select name="mec_id1" class="form-control">
                        <option value="" disabled selected>Select media cat</option>
                        <?php foreach ($media_category as $row):?>
                        <option value="<?php echo $row->mec_id;?>"><?php echo $row->mec_description;?></option>
                        <?php endforeach;?>            
                    </select>
                    <label>Description</label>
                    <textarea name="desc1" class="form-control"></textarea>
                    <input type="hidden" name="action" value="add_new_asset" >
                    
                </div>
            </div>

            <div class="buttons_wrap">
                <input type="hidden" class="form-control latlong" name="position"  value="" >
				

                <a href="#" class="save_new_asset btn btn-primary" id="button">Save</a>
                <a href="#" class="save_new_asset_edit btn btn-primary" id="button-edit">Save & Edit</a>
                <a href="#" class="delete_new_asset btn btn-primary">Delete</a>
            </div><br>
        </form></div>
    <div class="clear"></div>
    </div>
    
    <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog" style="width: 75%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<h4 class="modal-title" id="myModalLabel">View Location Map</h4>
			</div>
			<div class="modal-body">
				<div id="campaign_map_canvas" style="width: 100%; height: 500px"></div>
				<div id="campaign_images" style="width: 100%; height: 800px;"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>

<!-- mapping requirements -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
        
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>

<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/redrawMap.js"></script>

<!-- mapping requirements end -->

<div class="breadcrumbs" style="margin-top:-100px;">
    <h1><span class="glyphicon glyphicon-list-alt"></span>Manage Stock</h1>
</div>

	<?php 
	$user_type = $this->session->userdata('user_type');
	if($user_type == 2 || $user_type == 3 || $user_type > 0){
	  $this->load->view('auction/topmenu');
	}
	?>

<div class="main col-xs-12">
    <ul class="nav navbar-nav section-menu">
        <li class="active"><a href="<?php echo site_url('load_stock'); ?>">Outdoor Assets</a></li>
        <li><a href="<?php echo site_url('malls')?>">Indoor Assets</a></li>
    </ul>   

    <div class="clear"></div>

    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        If you have a large number of assets to load, please email upload@ads2trade.co.za and one of our Account Managers will work with you directly.
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select the mode View, Edit or Add depending on what you want to do with your assets</div>

        <?php 
        $auctionsaved = $this->input->get('auctionsaved');
        if($auctionsaved>0){
        ?>
          <div class="alert alert-success">
              <a href="#" class="close" data-dismiss="alert">&times;</a>
              <strong>Success!</strong> You have successfully created an asset auction
          </div>
        <?php
        }
        ?>
    <!-- 
    Buttons to determine the Mode (default to view mode)
    -->
    <input type="hidden" id="asset_mode" value="view" />
    <div class="btn-group asset_mode" data-toggle="buttons">
          <label class="btn btn-primary">
            <input value="view" type="radio" name="asset_mode" id="opt_add" title="Add Asset Mode">View
          </label>
        
          <label class="btn btn-primary">
            <input value="edit" type="radio" name="asset_mode" id="opt_edit" title="Edit/Move Asset Mode">Move
          </label>
        
          <label class="btn btn-primary">
            <input value="add" type="radio" name="asset_mode" id="opt_view" title="View Assets Mode">Add
          </label>  
    </div>

    <br><br>
    <div class="row col-md-12">
        <div class="col-xs-12">                
          <label>Send Map To</label>
          <input type="text" id="myPlaceTextBox" placeholder="Enter location" autocomplete="off" class="form-control" />
        </div> 
    <!--</div>

    <div clss="row">-->    
    <div class="col-xs-12" style="padding-top: 20px;">

            <div class="map_wrap" id="map_wrap" style="margin-bottom: 60px; width:100%; ">
                <div id="map-canvas"></div>
            </div>
        </div>
    </div> 
    
    <br/>
    <br/>
    <br/>
    
	<!-- <div class="col-xs-12">-->
        <div class="panel panel-default">
            <div class="panel-heading">Assets Details</div>
            <div class="panel-body">
                <div class="bs-example bs-example-tabs">
                    <ul id="myTab" class="nav nav-tabs" role="tablist">
                      <li class="active"><a href="#table_view" role="tab" data-toggle="tab">Table View</a></li>
                      <li><a href="#gantt_view" role="tab" data-toggle="tab">Gantt Chart View</a></li>
                      <!--
                      <li><a href="#other_view" role="tab" data-toggle="tab">Other View</a></li>
                      -->
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane fade in active" id="table_view">
                      	<!-- Table View Goes Here -->
                      	<br>
					    <div class="table_div">
					    <table class="table table-bordered headed display" id="example" cellspacing="0" width="100%">
					        <thead>
					            <tr>
					            	<th class="sorting_desc_disabled">
					            		<span>
					            			<a href="#" title="Select/Unselect All">	
					            				<input type="checkbox" name="selectAll" id="txtSelectAll" />
					            			</a>	
					            		</span>
					            	</th>
					                <th>Asset name</th>
					                <th>Description</th>
					                <th>Media type</th>
					                <th>Position</th>
					                <th>Status</th>
					                <th>Date added</th>
					                <th>Operations</th>    
					            </tr>
					        </thead>

					        <tfoot>
					            <tr>
					            	<th class="sorting_desc_disabled"></th>
					                <th>Asset name</th>
					                <th>Description</th>
					                <th>Media type</th>
					                <th>Position</th>
					                <th>Status</th>
					                <th>Date added</th>
					                <th>Operations</th>    
					            </tr>
					        	<tr>
					        		<td colspan="8">

									    <div class="btn-group asset_mode" data-toggle="buttons">
									          <label class="btn btn-primary" id="lblPrintMap">
									            <input value="print_map" type="radio" name="print_mode" id="prt_map" 
									            onclick="print_map()" title="Print Map">Print Map
									          </label>
									        
									          <label class="btn btn-primary" id="lblPrintTable">
									            <input value="print_table" type="radio" name="print_mode" id="prt_tab" title="Print Table">Print Table
									          </label>
									        
									          <label class="btn btn-primary" id="lblPrintSummary">
									            <input value="print_summary" type="radio" name="print_mode" id="prt_sum" title="Print Summary Specsheets">Print Summary
									          </label>  

									          <label class="btn btn-primary" id="lblPrintDetail">
									            <input value="print_detail" type="radio" name="print_mode" id="prt_det" title="Print Summary Specsheets">Print Detail
									          </label>  				          
									    </div>

					        		</td>
					        	</tr>            
					        </tfoot>

					        <?php 
					        if(isset($asset) && !empty($asset)):
					            if(isset($med) && !empty($med)):
					        
					        ?>
					        <tbody>
					            <?php
					            $row_id=0; 
					            foreach ($asset as $row):
					              //requires php 5.3+
					              $date1 = new DateTime($row->starts);
					              $date2 = new DateTime($row->ends);
					              $difference = $date2->diff($date1);
					              $diff = $difference->format("%a");
					              //TODO: Find out what status id is in auctions table
					              $status = 'Available'; 
					              //id closed?
					              //if($this->assssssetsi->assetReserved($row->ass_id)){
					              $disabled = false;
					              $action = "Deactivate";
					              $create_auction_msg = "Create Auction"; 
					              if($row->reserved > 0 || $row->ass_status>0){
					                $status = 'Reserved';
					                $disabled = true;
					                $action = "Activate";
					                $asset_status_detail = $row->ass_status_detail;
					                if($asset_status_detail == 1){ // Auction
					                  $create_auction_msg = "This Asset is currently on an active Auction";
					                } 
					                if($asset_status_detail == 2) {
					                  $create_auction_msg = "This Asset is currently on an active RFP/Campaign";
					                }
					                
					                $create_auction_msg = "This Asset needs to be activated";
					              }
					              //id suspended?
					              if($row->reserved>0 || ($row->ass_status>0 && $asset_status_detail>=3)){
					                //Either:
					                // - A bid has been placed
					                // - A buy now offer has been made
					                // - ITem has been added to an RFP
					                // - Item was manuyally marked as "reserved" by the Media owner
					                $status = 'Reserved';
					              }  
					              //red text color for disabled assets - tr level
					              $disabled_text_style = ($disabled)?'style="color:red"':'';
					            ?>
					            <tr id="<?php echo ++$row_id;?>" <?php echo $disabled_text_style?>>  
					                <?php $link = site_url('load_stock/view_asset');?>
					                <td align="center" valign="middle">
					                	<input type="checkbox" class="chkSelectAll" id="txtSelectAll<?php echo $row->ass_id;?>" 
					                	name="selected_assets[]" value="<?php echo $row->ass_id;?>"/>
					                </td>
					                <td>
					                  <a href="<?php echo $link."?ass_id=$row->ass_id";?>">
					                    <?php echo $row->ass_name;?>
					                  </a>
					                </td>
					                <td><?php echo $row->ass_description;?></td>
					                <td>
					                <?php 
					                  foreach ($med as $row1): 
					                    if ($row->mec_id == $row1->mec_id): 
					                      echo $row1->mec_description; 
					                    endif;
					                  endforeach;
					                ?>
					                </td>
					                <td>
					                <?php
					                  $position = $row->position;
					                  $url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=$position&sensor=false";
					                  // Make the HTTP request
					                  $data = file_get_contents($url);
					                  // Parse the json response
					                  $jsondata = json_decode($data,true);
					                  $address = array('formatted_address' => $jsondata["results"][0]["formatted_address"]);
					                  echo $address['formatted_address'];
					                ?>
					                </td>
					                <td>
					                  <?php 
					                    echo ($row->emp_id_maintenance != null && $row->ass_book_value != null)?"Captured": "Partially Captured";
					                  ?>
					                </td>
					                <td><?php echo $row->ass_date;?></td>
					                <td align="center" id="<?php echo $row->ass_id; ?>">
					                  
					                  <a title="<?php echo $create_auction_msg; ?>" style="cursor:pointer" data-toggle="modal" data-target="#addAuctionCart" 
					                    data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>"
					                    class="<?php echo ($disabled)?'btn-disabled':''; ?>">
					                    <span class="h4 glyphicon <?php echo ($disabled)?'glyphicon-lock':'glyphicon-shopping-cart'; ?>"></span>
					                  </a>

					                  <a title="<?php echo $action;?> Site" style="cursor:pointer" data-toggle="modal" data-target="#siteActivate"
					                    data-id="<?php echo $row->ass_id; ?>" data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" data-price="<?php echo $total; ?>"
					                    data-modal-action="<?php echo $action;?>">
					                  <span class="h4 <?php echo ($disabled)?'glyphicon glyphicon-unchecked':'glyphicon glyphicon-check'; ?>"></span></a>

					                  <a href="<?php echo $link."?ass_id=$row->ass_id";?>" 
					                    title="Edit Site" style="cursor:pointer">
					                    <!-- data-toggle="modal" data-target="#editItemDetails" data-id="<?php echo $row->ass_id; ?>" -->
					                    <span class="h4 glyphicon glyphicon-edit"></span>
					                  </a>

					                  <a title="View PDF Specsheet" style="cursor:pointer" href="<?php echo site_url('load_stock/spec_sheet?ass_id='.$row->ass_id); ?>" target="_blank"><span class="h4 glyphicon glyphicon-book"></span></a>

					                  <!--
					                  <a href="#" data-id="<?php echo $row->ass_id; ?>" style="cursor:pointer" 
					                    data-toggle="modal" data-target="#frmAssetOptions">
					                    <span>Marker Popup</span>
					                  </a>
					                  -->
					                </td>
					            </tr>
					            <?php endforeach; 
					            endif;
					            endif;
					            ?>
					            </tbody>

					    </table>
					    </div>

                      	<!-- End Table view -->
                      </div>
                      <div class="tab-pane fade in" id="gantt_view">
                      	<div class="col-xs-12">
                      	<br>
                      	<h4 class="h4">List of Assets that are on the Workflow</h4>
                      	<br>
                      	<div class="row" style="background: #f6f6f6;">
                      		<br>
                      		<div id="timeline" style="height: 500px; width:600px; display: block; margin: 0 auto;"></div>                      		
                      	</div>
                      		<!--
                      		<table width="90%" align="center">
                      			<thead>
                      				<tr>
                      					<th align="center">
                      						<center>
	                      						<div id="duration_filter" style="border: solid thin black; width:50%; height:30px; display:block; text-align: middle;">
	                      							<input type="radio" name="duration_filter" value="1" style="padding-top:5p;">
	                      								<span style="padding-top:5p; padding-left:3px; padding-right:5px;">Seconds</span>
	                      							<input type="radio" name="duration_filter" value="2" style="padding-top:5p;">
	                      								<span style="padding-top:5p; padding-left:3px; padding-right:5px;">Minutes</span>
	                      							<input type="radio" name="duration_filter" value="3" style="padding-top:5p;">
	                      								<span style="padding-top:5p; padding-left:3px; padding-right:5px;">Days</span>
	                      							<input checked="checked" type="radio" name="duration_filter" value="4" style="padding-top:5p;">
	                      								<span style="padding-top:5p; padding-left:3px; padding-right:5px;">Weeks</span>
	                      							<input type="radio" name="duration_filter" value="5" style="padding-top:5p;">
	                      								<span style="padding-top:5p; padding-left:3px; padding-right:5px;">Months</span>
	                      						</div>
	                      						<br>
	                      						<div>
	                      							<strong>Legend:</strong> 
	                      							&nbsp;
	                      							<input checked="checked" type="checkbox" name="status_filter[]" value="0">	
	                      							Not Operational&nbsp;<span style="cursor: pointer; width:50px; color:grey; background-color:grey; border: solid thin grey;">.......</span> 
	                      							&nbsp;
													<input checked="checked" type="checkbox" name="status_filter[]" value="1">
	                      							Running&nbsp;<span style="cursor: pointer; width:50px; color:red; background-color:red; border: solid thin red;">.......</span>
	                      							&nbsp;
	                      							<input checked="checked" type="checkbox" name="status_filter[]" value="2">
	                      							Booked&nbsp;<span style="cursor: pointer; width:50px; color:blue; background-color:blue; border: solid thin blue;">.......</span> 
	                      							&nbsp;
	                      							<input checked="checked" type="checkbox" name="status_filter[]" value="3">
	                      							Reserved&nbsp;<span style="cursor: pointer; width:50px; color:yellow; background-color:yellow; border: solid thin yellow;">.......</span> 
	                      							&nbsp;
	                      							<input checked="checked" type="checkbox" name="status_filter[]" value="4">	
	                      							Available&nbsp;<span style="cursor: pointer; width:50px; color:green; background-color:green; border: solid thin green;">.......</span>
	                      						</div>
	                      						<br>
	                      						<div>
	                      						<button class="btn btn-primary">Reload Chart</button>
	                      						</div>

                            
                                    <div id="ganttChart"></div>
                                    <br/><br/>
                            
                                    <div id="eventMessage"></div>
                      						</center>
                      					</th>
                      				</tr>
                      			</thead>
                      			<tbody>
                      				<tr>
                      					<td align="center">
                      						<br><br>
                      						<div id="gantt_chart" style="heigh:300px; width:90%; border: dotted thin blue; ">
                      							<span style="heigh:300px;">
                      							<?php 
                      							/*
                      							for($i=0; $i<20; $i++){
                      								echo "<br>";	
                      							}	
                      							*/
                      							?>
                      							</span>
                      						</div>
                      						<canvas>
                      							canvas
                      						</canvas>
                      					</td>
                      				</tr>
                      			</tbody>
                      		</table>
                      		-->

                      	</div>
                      </div>
                      <!--
                      <div class="tab-pane fade in" id="other_view">
                      	Other View Goes Here ...
                      </div>
                      -->
                     </div>
                </div>
            </div>
        </div>
    <!--</div>    -->


</div><!--Main -->

<!-- GanntView Scripts and CSS -->
<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/gantt/jquery.ganttView.css" />
<link rel="stylesheet" type="text/css" href="reset.css" />
  <!--<script type="text/javascript" src="<?php echo base_url(); ?>assets/gantt/lib/jquery-1.4.2.js"></script>-->
  <script type="text/javascript" src="<?php echo base_url(); ?>assets/gantt/lib/date.js"></script>
  <!--<script type="text/javascript" src="<?php echo base_url(); ?>assets/gantt/lib/jquery-ui-1.8.4.js"></script>-->
  <script type="text/javascript" src="<?php echo base_url(); ?>assets/gantt/jquery.ganttView.js"></script>
  <script type="text/javascript" src="<?php echo base_url(); ?>assets/gantt/data.js"></script>
  <script type="text/javascript">
    $(function () {
      $("#ganttChart").ganttView({ 
        data: ganttData,
        slideWidth: 900,
        behavior: {
          onClick: function (data) { 
            var msg = "You clicked on an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
            $("#eventMessage").text(msg);
          },
          onResize: function (data) { 
            var msg = "You resized an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
            $("#eventMessage").text(msg);
          },
          onDrag: function (data) { 
            var msg = "You dragged an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
            $("#eventMessage").text(msg);
          }
        }
      });
      
      // $("#ganttChart").ganttView("setSlideWidth", 600);
    });
  </script>

<!-- POPUPS -->

<!-- Create Asset Auction -->
<form name="frmCreateAuction" id="frmCreateAuction" 
  method="post" action="<?php echo site_url('auctions/create?action=create&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva'); ?>">
<div class="modal fade" id="addAuctionCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-shopping-cart"></span>
      <?php echo isset($ass_name)?$ass_name:'Create A New Auction';?></h4>
    </div>

    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0>
      <input type="hidden" value="" name="ass_name" id="ass_name">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>-->
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
    <div class="row">
      <p class="col-xs-6">
      <label for="from_date">Duration: <span id="price" name="price"></span></label> 
      <select class="form-control" name="duration" id="duration">
      <?php                                    
      $ar = $this->input->post('duration');
      foreach ($durations as $row) {?>
        <option <?php for($i=0;$i<count($ar);$i++){
                        if ($ar[$i] == $row->days){ echo 'Selected';}
                      } ?> 
          value="<?php echo $row->days;?>" > <?php echo  $row->description; ?></option>
      <?php }
      ?>

      </select>
      </p>

      <?php
      //Get the next monday
      $from_next_monday = date('Y-m-d', strtotime('next monday'));
      ?> 
      <p class="col-xs-6">
          <label for="from_date">Start Date</label>                           
          <input type="date" name="from_date" value="<?php echo $from_next_monday;?>" id="from_date" class="form-control">
          <input type="hidden" name="to_date" value="" id="to_date" class="form-control">
      </p>
      <p class="col-xs-6">
          <label for="price">Minimum Bid Amount</label>                           
          <input type="text" name="price" value="<?php echo $minimum_bid;?>" id="price" class="form-control">
      </p> 
      <p class="col-xs-6">
          <label for="increment">Bid Increment Amount</label>                           
          <input type="text" name="increment" value="<?php echo $increment;?>" id="increment" class="form-control">
      </p> 
      <p class="col-xs-6"> 
          <label for="buy_now">Allow Buy Now</label>                           
          <input type="checkbox" name="allow_buy_now" value="1" id="allow_buy_now" checked="checked">
      </p>
      <p class="col-xs-6"> 
          <label for="buy_now">Buy Now Price</label>                           
          <input type="text" name="buy_now" value="<?php echo $buy_now;?>" id="buy_now" class="form-control">
      </p>
      <p class="col-xs-6"> 
          <label for="add_to_current">Add to current auction</label>                           
          <input type="checkbox" name="add_to_current" value="1" id="add_to_current">
      </p>
      <p class="col-xs-6"> 
          <label for="add_to_next">Add to next auction</label>                           
          <input type="checkbox" name="add_to_next" value="1" id="add_to_next" checked="checked">
      </p>
      </div>
    </div>

    <div class="modal-footer" style="padding-top:30px;">
      <button type="submit" onclick="document.frmCreateAuction.submit();return false;" class="btn btn-primary" data-dismiss="modal">Create Auction</button>
    </div>
  </div>
</div>
</div></form>

<!-- Asset Specsheet Modal -->

<div id="divSpecsheet">
  <div class="modal fade" id="frmSpecsheet" tabindex="-1" role="dialog" 
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:lightgrey;">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
        <span class="sr-only">Close</span></button>
        <h4 class="h4 modal-title" id="myModalLabel">
          <span class="h4 glyphicon glyphicon-check"></span>
        <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action"> Asset Specsheet</span>';?></h4>
      </div>  
      <div class="modal-body">
        <input type="hidden" value="" name="ass_id" id="auction_asset_id">
        <input type="hidden" name="auction_min" value=0>
        <input type="hidden" value="" name="ass_name" id="ass_name">
        <iframe id="iframeSpecsheet" src="" width="100%" height="400px">
          <center>
            Loading specsheet ...
            <img src="<?php echo base_url('assets/loading.gif'); ?>">
          </center>
        </iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">
        <span id="modal-action3" name="modal-action">Close</span>
        </button>
      </div>
    </div>
  </div>
  </div>
</div>

<!-- Activate / Desctivate Asset Modal -->

<form name="frmActivate" method="post" 
action="<?php echo site_url('auctions/create?action=activate&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva'); ?>">
<div class="modal fade" id="siteActivate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-check"></span>
      <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action">Activated/Deactivated</span> Stock Item';?></h4>
    </div>  
    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0>
      <input type="hidden" value="" name="ass_name" id="ass_name">
      <input type="hidden" id="ass_action" name="ass_action" value="">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>-->
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
      <h4 class="text-center">This Stock Item will be <span id="modal-action2" name="modal-action">Activated/Deactivate</span>d</h4>
    </div>
    <div class="modal-footer">
      <button id="btnFrmActivate" type="button" class="btn btn-primary" data-dismiss="modal">
      <span id="modal-action3" name="modal-action">Proceed</span>
      </button>
    </div>
  </div>
</div>
</div></form>

<!-- Bid or Buy Auction -->

<form name="frmEditItem" id="frmEditItem" method="post" >
<div class="modal fade" id="editItemDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog" style="width: 860px;">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-edit"></span>
      <?php echo isset($ass_name)?$ass_name:'View/Edit Site Details: ';?><span id="ass_name_header" name="ass_name"></span></h4>
    </div>

    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0 id="auction_min_text">
      <input type="hidden" value="" name="ass_name" id="ass_name_text">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Asset Details</a></li>
        <li><a href="#tab2" data-toggle="tab">Auctions History</a></li>
      </ul>
      <div class="tab-content">

        <div class="tab-pane active" id="tab1">
          <div id="response"></div>
          <div class="row"> 
              <div class="col-xs-3">
                <a class="thumbnail" href="#">
            <img src="<?php echo base_url('assets/add1.jpg'); ?>">
                </a>
              </div>
              <div id="map-canvas-edit" style="width: 300px; height: 190px;"></div>
              <div id="pano_edit" style="position:absolute; left:523px; top: 60px; width: 300px; height: 190px;"></div>
          </div>
          <div class="col-xs-12" class="row"> 
                <div >
                      <table style="" class="table table-striped">  
                      <tbody>  
                      <tr>  
                        <td><strong>Ass Descrption</strong></td>  
                        <td><span id="ass_description"></span></td>  
                        <td><strong></strong></td>  
                        <td></td>  
                        <td colspan="4">  
                          <input  name="minimum" id="minimum" type="hidden" value="">
                          <input  name="auct_id" id="auct_id" type="hidden" value="">
                          <strong>Asset Type: <span id="ass_type"></span></strong>
                        </td>
                      </tr>  
                      </tbody>  
                      </table> 

                  </div>
              
             </div>

        </div>
        <div class="tab-pane" id="tab2">
          <p>
          There is no auction history for this Asset at the moment
          </p>
        </div>
      </div>

    </div>
    <!--
    <div class="modal-footer" style="padding-top:30px;">
      <button type="submit" class="btn btn-primary" data-dismiss="modal"> Close </button>
    </div>
    -->
    <div class="modal-footer" style="text-align:center;">
      <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        Choose an option below to process this asset 
      </div>

      <button type="button" class="btn btn-primary opAuction" data-dismiss="modal" 
      title="Add this Asset to an Auction">
        <span id="opAuction" name="modal-action">Auction Asset</span>
      </button>
      <button class="btn btn-primary opEdit" title="Edit the Asset's Details" data-dismiss="modal">
        <span id="opEdit" name="modal-action">Edit Asset</span>
      </button>
      <button class="btn btn-primary opActivate" title="Active or Diactivate this Asset">
        <span id="opActivate" name="modal-action">Activate/Deactivate</span>
      </button>  
      <button class="btn btn-primary opSpecsheet" title="View this Asset's Specsheet">
        <span id="opSpecsheet" name="modal-action">Specsheet</span>
      </button>    
      <button class="btn btn-primary" data-dismiss="modal">
        <span id="opClose" name="modal-action">Close</span>
      </button> 
    </div>

  </div>
</div>
</div></form>

<!-- Asset Operations Modal -->

<form name="frmAssetOptions" method="post" action="#">
<div class="modal fade" id="frmAssetOptions" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-list-alt"></span>
      <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action"></span> Asset Processing Options';?></h4>
    </div>  

    <div class="modal-body">

      <div class="row"> 
        <div class="col-xs-3">
          <a class="thumbnail" href="#" style="width: 200px; height: 200px;">
            <img src="<?php echo base_url('assets/add1.jpg'); ?>" name="asset_image">
          </a>
        </div>
        
        <div id="map-canvas-popup" style="position:absolute; left:230px;width: 320px; height: 190px;">
          <div style="text-align:left; border:1px solid red; ">
          </div>
          
        </div>
        
        <div id="pano-popup" 
          style="border:1px solid blue;text-align:left; position:absolute; 
          left:230px;width: 320px; height: 190px; ">
          
          <center>
            <br>
            Loading Street View ...
            <br>
            <img src="<?php echo base_url('assets/loading.gif'); ?>">
          </center>
          
        </div>
      </div>

      <div class="row">
        <input type="hidden" value="" name="ass_id" id="asset_id">
        <input type="hidden" name="auction_min" value=0>
        <input type="hidden" value="" name="ass_name" id="ass_name">
          <h5 class="h5" style="padding-left:15px;"><b>Reference: </b><span id="ass_reference"></span> 
          &nbsp;&nbsp;&nbsp;&nbsp;<b>Availability: </b><span id="availability"></span></h5>
          <h5 class="h5" style="padding-left:15px;"><b>Description: </b><span id="description">Description will go here ...</span></h5>       
      </div>  
    </div>

    <div class="modal-footer" style="text-align:center;">
      <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        Choose an option below to process this asset 
      </div>

      <button type="button" class="btn btn-primary opAuction" data-dismiss="modal" 
      title="Add this Asset to an Auction">
        <span id="opAuction" name="modal-action">Auction Asset</span>
      </button>
      <button class="btn btn-primary opEdit" title="Edit the Asset's Details" data-dismiss="modal">
        <span id="opEdit" name="modal-action">Edit Asset</span>
      </button>
      <button class="btn btn-primary opActivate" title="Active or Diactivate this Asset">
        <span id="opActivate" name="modal-action">Activate/Deactivate</span>
      </button>  
      <button class="btn btn-primary opSpecsheet" title="View this Asset's Specsheet"
       data-target="frmSpecsheet" data-dismiss="modal">
        <span id="opSpecsheet" name="modal-action">Specsheet</span>
      </button>    
      <button class="btn btn-primary" data-dismiss="modal">
        <span id="opClose" name="modal-action">Close</span>
      </button> 
    </div>
  </div>
</div>
</div></form>


<!-- END POPUPS -->

<!--
Hidden field to ghold currently selected asset id
-->
<input type="hidden" name="selected_asset_id" id="selected_asset_id" value="0">

<!-- Google Timeline Component -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
  
  google.load("visualization", "1", {packages:["timeline"]});
  
  google.setOnLoadCallback(drawChart);

  function drawChartDummy(){
  	//dummy, do nothing
  }

  function drawChart() {
    var container = document.getElementById('timeline');
    var chart = new google.visualization.Timeline(container);
    var dataTable = new google.visualization.DataTable();

	//Get Current Page Items for use in Calendar and Timeline Views
	//arrRows = $('#campaign-grid').DataTable().data();
	//totalRecords = arrRows.page.len();
	//console.log('page size 2:' + totalRecords + ':' + $('#campaign-grid').DataTable().data()[0]);

    dataTable.addColumn({ type: 'string', id: 'Position' });
    dataTable.addColumn({ type: 'string', id: 'Name' });
    dataTable.addColumn({ type: 'date', id: 'Start' });
    dataTable.addColumn({ type: 'date', id: 'End' });

		//Add Rows
		<?php
		$found_one_time_entries = false;
		foreach ($asset as $row) {
			if( is_null($row->from_date) && is_null($row->to_date)){
				//make sure asset is on workflow timeline

			} else {
				$found_one_time_entries = true;					
				# code...
				//extract day, month (0 based since we will put it into javascript) and year from date
				// Start Date
				$start_day = date('d',strtotime($row->from_date));
				$start_mon = date('m',strtotime($row->from_date))-1;
				$start_year = date('Y',strtotime($row->from_date));
				// End Date
				//$ends = date('D M d Y H:i:s O',strtotime($row->to_date));
				$end_day = date('d',strtotime($row->to_date));
				$end_mon = date('m',strtotime($row->to_date))-1;
				$end_year = date('Y',strtotime($row->to_date));
			
					?>
						dataTable.addRow(['<?php echo $row->cam_title; ?>', '<?php echo $row->campaign_status;?>',
			                new Date(<?php echo $start_year; ?>,<?php echo $start_mon; ?>,<?php echo $start_day; ?>), 
			                new Date(<?php echo $end_year; ?>,<?php echo $end_mon; ?>,<?php echo $end_day; ?>)]);
			
			  			<?php				
					} //end if asset on workflow

		} //end foreach

		if($found_one_time_entries == false){

				// Start Date  (Today)
				$start_day = date('d');
				$start_mon = date('m')-1;
				$start_year = date('Y');

				// End Date (7 days from today)
				//$ends = date('D M d Y H:i:s O',strtotime($row->to_date));
				$end_day = date('d',strtotime("+7 day"));
				$end_mon = date('m',strtotime("+7 day"))-1;
				$end_year = date('Y',strtotime("+7 day"));

			?>
				dataTable.addRow(['------------------', ' ****************                           ***********************',
	                new Date(<?php echo $start_year; ?>,<?php echo $start_mon; ?>,<?php echo $start_day; ?>), 
	                new Date(<?php echo $end_year; ?>,<?php echo $end_mon; ?>,<?php echo $end_day; ?>)]);	

				dataTable.addRow(['Workflow Assets', 'You do not have any assets on workflows yet',
	                new Date(<?php echo $start_year; ?>,<?php echo $start_mon; ?>,<?php echo $start_day; ?>), 
	                new Date(<?php echo $end_year; ?>,<?php echo $end_mon; ?>,<?php echo $end_day; ?>)]);			

				dataTable.addRow(['------------------', ' ****************                           ***********************',
	                new Date(<?php echo $start_year; ?>,<?php echo $start_mon; ?>,<?php echo $start_day; ?>), 
	                new Date(<?php echo $end_year; ?>,<?php echo $end_mon; ?>,<?php echo $end_day; ?>)]);					
			<?php
		}
		?>

	    // Calculate height based on number of line items
	    var rowHeight = 41;
	    var chartHeight = (dataTable.getNumberOfRows() + 1) * rowHeight;

	    var options = {
	        height: chartHeight,
	        width: 800,
	        forceIFrame: true,
	        timeline: { groupByRowLabel: false }
	    }

    chart.draw(dataTable, options);
  }

</script>

<script type="text/javascript" language="javascript" class="init">

//globals for tracking asset and activation function
var activate_ass_id;
var activate_ass_action;
var first_time = true;

function GetAddress(latLongValue) {
            var latLongValue = latLongValue.split(",");
            var lat = latLongValue[0];
            var lng = latLongValue[1];
            var latlng = new google.maps.LatLng(lat, lng);
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        //alert("Location: " + results[1].formatted_address);
                        return results[1].formatted_address;
                    } 
                }
                return "Position:"+latLongValue;
            });
        }

$(document).ready(function() {
    $('#example').dataTable({
      });

	var table = $('#example').DataTable();
	 
	$('#example').on( 'draw.dt', function () { //page.dt is when page changes but before the new page data has been rendered
	    
	    var info = table.page.info();
	    var ids = "28,29,30,31";

	    first_time = false;
	    //alert( 'Showing page: '+info.page+' of '+info.pages );
	    var ids = getAllAssetsOnCurrentPage();

	    //Redraw the Map
		if(first_time == false){
	    	deleteMarkers();
	    	redrawMap(ids);
		}

		//Redraw the timeline

	} );

} );

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
  	//console.log(markers[i]);
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
// Also delete markerClusters
// Trigger map resize (i.e. redraw map)
function deleteMarkers() {
  clearMarkers();
  markers = [];
  adsMap.spider.clearMarkers();
  adsMap.markerCluster.clearMarkers();
  google.maps.event.trigger(map, 'resize');
}

//Print Buttons
//prt_map,prt_tbl,prt_sum,prt_det
$("#lblPrintMap").on('click',function(){
	alert('Printing Map...');
  window.print();
	//var map_canvas = $('#map-canvas');
	//printContent('map-canvas');
	//PrintElem('map_wrap');
  //PrintMapPopup('map_wrap');
	//console.log(map_canvas);	
	//print map div
});

$("#lblPrintTable").on('click',function(){
	alert('Printing Table...');
	PrintElem('example_wrapper');
	//var table_canvas = $('#table_div');
	//console.log(table_canvas);	
	//print table div
});

$("#lblPrintSummary").on('click',function(){
	alert('Printing Summary...');
	//Get all selected assets
	printSpecSheets();
	//print table div
});

$("#lblPrintDetail").on('click',function(){
	alert('Printing Detailed...');
	//Get all selected assets
	printSpecSheets();
	//print table div
});

function getAllAssetsOnCurrentPage(){
	var allAssetCheckboxes = document.getElementsByClassName('chkSelectAll');
	var allSelected = 0;
	var specSheetPage = "";
    for(var j = 0; j < allAssetCheckboxes.length; j++) {
    	var e = allAssetCheckboxes[j];
    	if((e.type=='checkbox') && (!e.disabled)){
    	    allSelected += ',' + e.value;
    	}
    }	
    //alert("Reload Map with: " + allSelected + " ...");

    return allSelected;
}

function printSpecSheets(detailed){
	var allAssetCheckboxes = document.getElementsByClassName('chkSelectAll');
	var allSelected = 0;
	var specSheetPage = "";
    for(var j = 0; j < allAssetCheckboxes.length; j++) {
    	var e = allAssetCheckboxes[j];
    	if((e.type=='checkbox') && (!e.disabled)){
    	    //$('#'+e.id).trigger('click');  //Needed for bootstrap/display to update/refresh
    	    if(e.checked == true){
    	    	allSelected += ',' + e.value;
    	    }
    	}
    }	
    if(allSelected == 0){
    	alert('You have not selected any assets');
    } else {
        //alert(' Selected '+allSelected);
        var specSheetPage = "<?php echo site_url('auctions/spec_sheet_list?asset_ids='); ?>"+allSelected;
        alert(specSheetPage);
        PopupURL(specSheetPage);
    	console.log(specSheetPage);	
    }
}

function PrintElem(elem)
{
    //Popup($(elem).html());
    var data = document.getElementById(elem).innerHTML;
    console.log(data);
    Popup(data);
}

function PopupURL(dataURL)
{
	var mywindow = window.open(dataURL, 'Specsheet', 'height=400,width=600');
	mywindow.focus(); // necessary for IE >= 10
	return true;
}

function PrintMapPopup()
{
    var mywindow = window.open('', 'Print Preview', 'height=400,width=600');

    var contents = mywindow.opener.document.getElementById("map_wrap");
    document.write(contents.innerHTML);
    window.print();  
}

function Popup(data) 
{
    var mywindow = window.open('', 'Print Preview', 'height=400,width=600');
    mywindow.document.write('<html><head><title>Print Preview</title>');
    /*optional stylesheet*/ 
	mywindow.document.write('<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.css" type="text/css" />');
	mywindow.document.write('<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css" type="text/css" />');
	mywindow.document.write('<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/dataTables.bootstrap.css" type="text/css" />');
	mywindow.document.write('<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap-checkbox.css" type="text/css" />');
	mywindow.document.write('<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/jquery-ui.min.css" type="text/css" />');
    mywindow.document.write('<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/jquery-ui.theme.min.css" type="text/css" />');
    mywindow.document.write('</head><body >');
    mywindow.document.write(data);
    mywindow.document.write('</body></html>');

    mywindow.document.close(); // necessary for IE >= 10
    mywindow.focus(); // necessary for IE >= 10

    //mywindow.print();
    //mywindow.close();

    return true;
}


//Check/Uncheck all
$("#txtSelectAll").click(function(){
	var checkAll = document.getElementById("txtSelectAll").checked;
	var allAssetCheckboxes = document.getElementsByClassName('chkSelectAll');
	//console.log(checkAll);
	//console.log(allAssetCheckboxes);
	if(checkAll == true){       
		checkUncheckAll(allAssetCheckboxes, true);		
	} else {
		checkUncheckAll(allAssetCheckboxes, false);		
	}
});

function checkUncheckAll(checkBoxes, checkedVal){
	//console.log('checkAll:'+checkedVal)
    for(var j = 0; j < checkBoxes.length; j++) {
    	var e = checkBoxes[j];
    	if((e.type=='checkbox') && (!e.disabled)){
    	    //console.log('BEFORE chk' + j + ' id: ' +e.id + ' val:' + e.checked);
    	    $('#'+e.id).trigger('click');  //Needed for bootstrap/display to update/refresh
    	    e.checked = checkedVal;
    	    //console.log('AFTER  chk' + j + ' id: ' +e.id + ' val:' + e.checked);
    	}
    }
}

$(".asset_mode .btn").click(function() {
    // whenever a button is clicked, set the hidden helper
    $("#asset_mode").val($.trim($(this).text()));
}); 

    var raw_markers = <?php echo json_encode($asset);?>; /* Load all assets for this user*/
    var base_url = '<?php echo base_url();?>';
    var mall_assets_url = '<?php echo site_url("malls/");?>';
    var pos_update_url = '<?php echo site_url("load_stock/update_pos");?>';
    var adsMap = false;
    var disableListener = false;
    var centerposition = new google.maps.LatLng(-26.063214,27.943271);
    var marker_icon = base_url + 'assets/mapping/images/media_11.png';
    var markers = [];

    function initialize() {
        var mapOptions = {zoom: 6, center: centerposition};
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        //map.setOptions({draggableCursor:'move'});

        var addAssetListener = google.maps.event.addListener(map, 'click', function(event) {
            //check the Mode and determine whether or not to show the add asset marker modal
            //var asset_mode = $('input[name=asset_mode]').val();
            var asset_mode = $('#asset_mode').val();
            //alert("Asset Mode:" + asset_mode);

            if (disableListener || (asset_mode.toLowerCase() == "edit" || asset_mode.toLowerCase() == "view")) {
                //if view mode then zoom into map on click
                if(asset_mode.toLowerCase() == "view"){
                  //map.setCenter(map.setCenter());    //marker is marker to center on
                  map.setZoom(map.getZoom() + 1);                 
                }
                return;
            }
            addMarker(event.latLng);
        });
        //var markers = [];
        for (var i in raw_markers) {
            (function (i) {
                var marker_details = raw_markers[i]
                console.log('Ugly hack to fix missing mec_id field');
                if (!marker_details.hasOwnProperty('mec_id')) {
                    marker_details.mec_id = marker_details.med_id;
                }

                if(marker_details.ass_is_mall == 1){
                    marker_icon = base_url + 'assets/mapping/images/media_1.png';     /* Shopping Mall Icon */
                } else {
                    marker_icon = base_url + 'assets/mapping/images/media_'+marker_details.mec_id+'.png'; /* use icon as per mec_id default */
                }

                var position_parts = marker_details.position.split(',');

                var latLng = new google.maps.LatLng(position_parts[0], position_parts[1]);
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    type: parseInt(marker_details.mec_id),
                    icon: marker_icon,
                    title: ""+marker_details.ass_name + " (" + marker_details.ass_description + ")",
                    is_mall: marker_details.ass_is_mall,
                    asset_id: marker_details.ass_id,
                    mall_id: marker_details.mall_id,
                    cursor:'move',
                    draggable: true,
                });
                //marker.setCursor({cursor:'move'});
                //Marker click event

                // Attach the marker click event to hijack click event for Malls
                google.maps.event.addListener(marker, 'click', function (event) {
                    //debugger;
                    var chagedPos = marker.position;
                    var asset_id = marker.asset_id;
                    var asset_is_mall = marker.is_mall;
                    var asset_mec_id = marker.type;
                    var asset_mall_id = marker.mall_id;

                    console.log(' maker clicked : ' + asset_id);
                    $('#selected_asset_id').val(asset_id);
                    if(asset_is_mall == 1){

                    } 

                });

                google.maps.event.addListener(marker, "dragend", function (event) {
                      latitude = this.getPosition().lat();
                      longitude = this.getPosition().lng();
                      console.log('new marker pos:' + latitude + ','+ longitude + 'id:'+ marker.asset_id + pos_update_url);

                      $.post( pos_update_url, { ass_id: marker.asset_id, lat: latitude, lng: longitude })
                      .done(function( data ) {
                        //alert( "Asset Moved " );
                             $('<div></div>').dialog({
                              modal: true,
                              title: "Asset Move Confirmartion",
                              open: function() {
                                var markup = 'Asset Moved Succefully!';
                                $(this).html(markup);
                              },
                              buttons: {
                                Ok: function() {
                                  $( this ).dialog( "close" );
                                }
                              }
                            });  //end confirm dialog
                        /*
                        BootstrapDialog.show({
                            message: 'Hi Apple!'
                        });                             
                        */
                      });
                });

                //InfoWindow for popup with operations options
                //Edit - Auction - Specsheet - Activate/Diactivate - Streetview

                markers.push(marker);


//              google.maps.event.addListener(marker, 'click', function () {
//
//                  modalshow(marker_details.ass_id);
//              });
            })(i);

        }
        var optOptions = {
            urlBase: base_url,
            markers: markers,
            showRadii: false,
            showSearchPOIButton: function() {
                disableListener = true;
                adsMap.add_message('Please click on the map.', 10);
                adsMap.search_poi(false, function() {
                    disableListener = false;
                });
                return false;
            },
            showFilterButton: function() {
                disableListener = true;
                adsMap.add_message('Please click on the map.', 10);
                adsMap.filter_markers_in_radius(false, function() {
                    disableListener = false;
                });
                return false;
            }
        };
        var clusterOptions = {};
        var spiderOptions = {
                    keepSpiderfied: true
                };
        var html2canvasOptions = {
            logging: true
        };
        adsMap = new AdsMap(map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
                //Now add the click events to the markers
        document.addEventListener('AdsMaploaded', function(e) {
            adsMap.spider.addListener('click', function(clicked_marker) {
                modalshow(clicked_marker.asset_id);
            });
        }, false);
                               
        /** Autocomplete Places */
        var input = document.getElementById('myPlaceTextBox');
        var image = base_url + 'assets/mapping/images/user_marker.png';
        var marker_location = new google.maps.Marker({
            map: map,
            draggable: true,
            icon: image,
            animation: google.maps.Animation.DROP,
            visible: false
        });

        var autoCompleteOnChange = function () {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById("myPlaceTextBox").value;

            geocoder.geocode({ "address": address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {

                    $("#location").parent().removeClass("has-error");
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    $("#latitude").val(latitude);
                    $("#longitude").val(longitude);
                    marker_location.setVisible(true);
                    marker_location.setPosition(results[0].geometry.location);
                    console.log(results[0].geometry.location);
                    map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
                    map.setZoom(9);
                    google.maps.event.addListener(marker_location, "dragend", function (event) {
                        latitude = this.getPosition().lat();
                        longitude = this.getPosition().lng();
                        $("#latitude").val(latitude);
                        $("#longitude").val(longitude);
                    });
                } else {
                    alert("Request failed.")
                    $("#location").parent().addClass("has-error");
                }
            });

        }

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);
        google.maps.event.addListener(autocomplete, 'place_changed', autoCompleteOnChange);

    }

    google.maps.event.addDomListener(window, 'load', initialize);
        
        function search_poi() {
        adsMap.add_message('Please click on the area where you would like to search.', 10);
        adsMap.search_poi();
    }


 
    var centerposition = new google.maps.LatLng(-26.063214,27.943271);
    var marker;
    var markers = [];
    var map;
    var ajax_file = "<?php echo site_url('our_ajax'); ?>";
    var openInfoWindow;
    var image = base_url + 'assets/blue_icon.png';

    function populate_table(gotoEditPage){
    	gotoEditPage = typeof gotoEditPage !== 'undefined' ? gotoEditPage : 0; //default to false
        var mediaowner_id = $("#mediaowner_id").val();
        $.ajax({type: "POST",url: ajax_file,
            data: { action:'table_data', mediaowner_id:mediaowner_id},
            success:function(html){
                //openInfoWindow.close();
                //$(".table_div").html(html);
                if(gotoEditPage > 0){ // redirect to edit asset page
                	//alert('Redirecting to asset edit page ...');	
                	//http://localhost/ads2trade/index.php/load_stock/view_asset?ass_id=29
                	window.location.href="<?php echo site_url('load_stock/view_asset?ass_id='); ?>" + gotoEditPage;
                } else { //else reload page to show newly added asset
                    window.location.reload();
                }
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
    }

    function setup_marker(marker){
        
        var mLatLang = marker.getPosition().toUrlValue();
        google.maps.event.addListener(marker, 'click', function() {
            if (openInfoWindow) {
                openInfoWindow.close();
            }

            var infowindow = new google.maps.InfoWindow({
                content: ''
            });
            $.post( ajax_file, { action: "get_asset_details", position: mLatLang},function( data ) {
            
                var contentString = $('<div>'+data+'</div>');    

                infowindow.setContent(contentString[0]);
                infowindow.open(map,marker);
                openInfoWindow = infowindow;

                //Find remove button in infoWindow
                var removeBtn = contentString.find('.delete_asset')[0];
                var saveBtn = contentString.find('.save_asset')[0];

                //add click listner to remove marker button
                google.maps.event.addDomListener(removeBtn, "click", function(event) {
                    //call remove_marker function to remove the marker from the map
                    remove_marker(marker);
                });

                //add click listner to save marker button
                google.maps.event.addDomListener(saveBtn, "click", function(event) {
                    //call remove_marker function to remove the marker from the map
                    save_current_asset(marker,infowindow);
                });
            });
          
        });
    }

    function remove_marker(Marker){
        //Remove saved marker from DB and map using jQuery Ajax
        var mLatLang = Marker.getPosition().toUrlValue(); //get marker position
        
        var myData = {action : 'delete_asset', latlang : mLatLang}; //post variables
        $.ajax({
            type: "POST",
            url: ajax_file,
            data: myData,
            success:function(data){
                Marker.setMap(null); 
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
      
    }

    function save_current_asset(Marker,infowindow){
        
        var myData = $(infowindow.content).find('form').serialize();
        $.ajax({
            type: "POST",
            url: ajax_file,
            data: myData,
            success:function(data){
                openInfoWindow.close();
                populate_table();
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
      
    }

    function save_new_asset(Marker,infowindow, gotoEditPage){
        var myData = $(infowindow.content).find('form').serialize();
        
        $.ajax({type: "POST",url: ajax_file,
            data: myData,
            success:function(data){ 
                openInfoWindow.close();
                if(gotoEditPage){
                	asset_id = data; // got to the asset edit page
                } else {
                	asset_id = ""; //do not go to the asset edit page
                }
                populate_table(asset_id);
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
    }

    function addMarker(location) {
        if (openInfoWindow) {
            openInfoWindow.close();
        }

      
        var marker = new google.maps.Marker({
            position: location,
            draggable:true,
            icon:image,
            map: map
        });

        markers.push(marker);

        var mLatLang = marker.getPosition().toUrlValue();
        var popupcontent = $("#popup_content").html();
        
        var contentString = $('<div>'+popupcontent+'</div>');    
        contentString.find('.latlong').val(mLatLang);

        var infowindow = new google.maps.InfoWindow({
            content: '',maxWidth: 360 ,Height: 600 
        });
        infowindow.setContent(contentString[0]);
        openInfoWindow = infowindow;
        infowindow.open(map,marker);

        //Find remove button in infoWindow
        var removeBtn = contentString.find('.delete_new_asset');
        var saveBtn = contentString.find('.save_new_asset');
        var saveEditBtn = contentString.find('.save_new_asset_edit');

        //add click listner to remove marker button
        removeBtn.on('click', function( ){
            marker.setMap(null);
        })
        google.maps.event.addListener(infowindow, "closeclick", function(event) {
            marker.setMap(null); 
        });

        //add click listner to save marker button
        var gotoEditPage = false;
        saveBtn.on("click", function(event) {
            save_new_asset(marker,openInfoWindow, gotoEditPage);
        });

        //add click listner to save marker button
        gotoEditPage = true;
        saveEditBtn.on("click", function(event) {
            save_new_asset(marker,openInfoWindow, gotoEditPage);
        });

        setup_marker(marker);
      

    }
      
</script>

<script language="javascript" type="text/javascript">

$('#frmCreateAuction').on('submit', function(){
  alert('Creating Auction ...');
});

//triggered when modal is about to be shown
$('#addAuctionCart').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     var AssetPrice = $(e.relatedTarget).data('price');

     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="description"]').html(AssetName);
     $(e.currentTarget).find('input[name="ass_name"]').val(AssetName);

     // price details, minimum bid etc
     $(e.currentTarget).find('input[name="price"]').val(AssetPrice);
     $(e.currentTarget).find('input[name="auction_min"]').val(AssetPrice);
     
});

$('#siteActivate').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     //var AssetPrice = $(e.relatedTarget).data('price');
     var ModalAction = $(e.relatedTarget).data('modal-action');
     //alert(ModalAction);
     if(ModalAction =='' || ModalAction == null || ModalAction == undefined){
		ModalAction = $(e.relatedTarget).data('opactivate');     	
     }
     //alert('2'+ModalAction);
     //Update the globals
     activate_ass_id = AssetId;
     activate_ass_action = ModalAction;

     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="description"]').html(AssetName);
     $(e.currentTarget).find('input[name="ass_name"]').val(AssetName);
     
     //data-modal-action
     $(e.currentTarget).find('span[name="modal-action"]').html(ModalAction);
     $(e.currentTarget).find('input[name="ass_action"]').val(ModalAction);
     //alert('var' + ModalAction);
     //alert('form val' + $(e.currentTarget).find('input[name="ass_action"]').val());
});

$('#frmAssetOptions').on('show.bs.modal', function(e) {
    var AssetId = $(e.relatedTarget).data('id');

    if(AssetId !='' || AssetId == null || AssetId == undefined){
      //AssetId = '1011';     
      AssetId = $('#selected_asset_id').val(); 
      //console.log('AssetId:'+ AssetId)
    }
    //

    //asset id
    $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
    //$(e.currentTarget).find('input[name="asset_id"]').val(AssetId);
     
    //Get Asset details
    $.ajax({
        type: 'GET',
        url: "<?php echo site_url('auctions/jsonGetAssetDetails'); ?>",
        data: { c: AssetId, p: "details" }
    })
    .done(function (data) {
        console.log(data);
        var jsonAsset = $.parseJSON(data); 
        //console.log(jsonAsset);

       var asset_name = " "+jsonAsset.ass_name;
       var asset_img = jsonAsset.asset_image;
       var dft_asset_img = "<?php echo base_url('assets/add1.jpg'); ?>";

       if(jsonAsset.ass_ref != ""){
        asset_name += " (" + jsonAsset.ass_ref + ")";
       }
       
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;
       var availability = "";
       if(jsonAsset.status == 1 || jsonAsset.ass_status > 0){
        availability = " In Active Auction "; 
       } else {
        availability = " Available "; 
       }

       if(asset_img !="" && asset_img != null){
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",asset_img);
       } else {
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",dft_asset_img);
       }

       $("#frmAssetOptions").find('span[id="ass_name"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="ass_reference"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="description"]').html(jsonAsset.ass_description);
       $("#frmAssetOptions").find('span[id="availability"]').html(availability);

      //Add attributes to opAuction button
      /*
        data-toggle="modal" 
        data-target="#addAuctionCart" 
        data-id="<?php echo $row->ass_id; ?>" 
        data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" 
        data-price="<?php echo $total; ?>"
      */       
       $("#frmAssetOptions .opAuction").attr("data-target","#addAuctionCart");
       $("#frmAssetOptions .opAuction").attr("data-toggle","modal");
       $("#frmAssetOptions .opAuction").attr("data-id",AssetId);
       $("#frmAssetOptions .opAuction").attr("data-name",asset_name);
       $("#frmAssetOptions .opAuction").attr("data-price",0);
       //Adjust map center
       
      if (typeof google === 'object' && typeof google.maps === 'object'){
          var assetLatLong = jsonAsset.position.split(",");
          var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
            var assetMapOptions = {
                center: assetLatLongObject,
                zoom: 14
            };
          
          
          //$("#frmAssetOptions").find('div[id="map-canvas-popup"]')
          mapA = new google.maps.Map(document.getElementById('map-canvas-popup'), 
                                      assetMapOptions);

          console.log('mapA 2a' + mapA);

          mapA.setCenter(assetLatLongObject);
          //mapA.setZoom(savedMapZoom);
          //Update Street View as well
          var panoramaOptions = {
            position: assetLatLongObject,
            pov: {
              heading: 34,
              pitch: 10
            }
          };
          document.getElementById('pano-popup').innerHTML = '';
          //$("#frmAssetOptions").find('div[id="pano"]').val('');
          //$("#frmAssetOptions").find('div[id="pano"]').html('');
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano-popup').innerHTML, 
                                                              panoramaOptions);
          mapA.setStreetView(panorama);

          console.log('mapA 2' + mapA);
      }
      

    })
    .fail(function () {
        alert("Error getting Asset details");
    });

});

//Asset Operations Buttons Actions
//Auction button on auction popup
$("#frmEditItem .opAuction").click(function() {
  //alert('Edit Item clicked');
  //$("#frmAssetOptions .opAuction").trigger('click');
  var AssetId = $("#frmEditItem").find('input[name="ass_id"]').val();

  //Modal options
  var options = {
      "backdrop" : "true",
      "show" : "true"
  }

  //Show modal
  $('#frmAssetOptions').modal(options);

}); 

//Auction button
$("#frmAssetOptions .opAuction").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    if(AssetId == ""){
      var AssetId = $("#frmEditItem").find('input[name="ass_id"]').val();
    }
    //alert('Auction Button Clicked!');
}); 
//Edit button
$("#frmAssetOptions .opEdit").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    var edit_url = "<?php echo site_url('load_stock/view_asset?ass_id=');?>"+AssetId;
    window.location.href=edit_url;
}); 
//Activate/deactivate button
$("#frmAssetOptions .opActivate").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    if(AssetId == ''){
      AssetId = $('#selected_asset_id').val();
    }
    //alert('Activate/Deactivate button Clicked!');
}); 

//Activate/deactivate button
$("#frmAssetOptions .opSpecsheet").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    //console.log('');
    if(AssetId == ''){
      AssetId = $('#selected_asset_id').val();
    }    
    var specsheet_url = "<?php echo site_url('auctions/spec_sheet/?ass_id=');?>"+AssetId;
    //window.location.href=specsheet_url;
    //alert(specsheet_url);
    //Modal options
    var options = {
      "backdrop" : "true",
      "show" : "true",
      "width": "800px" /*,
      "remote": specsheet_url*/
    }

    //var modalBody = $('#frmSpecsheet .modal-body');
    //modalBody.load(specsheet_url);
    //iframeSpecsheet
    //$('#frmSpecsheet').removeData('bs.modal');
    //$('#frmSpecsheet').modal({remote: 'some/new/context?p=' + $(this).attr('buttonAttr') });

    $('#iframeSpecsheet').attr('src',specsheet_url);

    //Show modal
    $('#frmSpecsheet').modal(options);

}); 
</script>

<script>

    function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin, mapA;
    var AssetId = a;

    //Set the selected Asset id
    $('#selected_asset_id').val(AssetId);

    console.log('modal show' + a);

    //$("#frmEditItem").find('span[id="description"]').html(' Asset ID: ' + a);

    //Get Asset/Site Details and populate modal 
    //$('#response').html("<b>Loading asset/site details...</b>");
    $.ajax({
        type: 'GET',
        url: "<?php echo site_url('auctions/jsonGetAssetDetails'); ?>",
        data: { c: a, p: "details" }
    })
    .done(function (data) {
       console.log(data);
       var jsonAsset = $.parseJSON(data); 
       console.log(jsonAsset);

       var asset_name = " "+jsonAsset.ass_name;
       var asset_img = jsonAsset.asset_image;
       var dft_asset_img = "<?php echo base_url('assets/add1.jpg'); ?>";
       var active = 0;
       var opaction = "Activate";

       if(jsonAsset.ass_ref != ""){
        asset_name += " (" + jsonAsset.ass_ref + ")";
       }
       
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;
       var availability = "";
       if(jsonAsset.status == 1 || jsonAsset.ass_status > 0){
       
       	availability = " Inactive "; 

       	if (jsonAsset.ass_status_detail == 1 ){
       		availability = " In Active Auction "; 	
       		active = 0;
       		opaction = "Activate";
       	} 
       	if(jsonAsset.ass_status_detail == 2 ) {
       	    availability = " In Active Campaign "; 
       	    active = 0;
       	    opaction = "Activate";
       	} 
       	if(jsonAsset.ass_status_detail == 3 ) {
       	    availability = " Manually Deactivated "; 
       	    active = 0;
       	    opaction = "Activate";
       	} 

       } else {
        availability = " Available "; 
        active = 1;
        opaction = "Deactivate";
       }

       if(jsonAsset.status == null || jsonAsset.ass_status == null){
        	availability = " Available "; 
        	active = 1;
        	//opaction = "Deactivate";       	
       }

       if(asset_img !="" && asset_img != null){
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",asset_img);
       } else {
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",dft_asset_img);
       }

       $("#frmAssetOptions").find('span[id="ass_name"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="ass_reference"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="description"]').html(jsonAsset.ass_description);
       $("#frmAssetOptions").find('span[id="availability"]').html(availability);

      //Add attributes to opAuction button
      /*
        data-toggle="modal" 
        data-target="#addAuctionCart" 
        data-id="<?php echo $row->ass_id; ?>" 
        data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" 
        data-price="<?php echo $total; ?>"
      */       
       //Create auction button
       if(jsonAsset.status == 1 || jsonAsset.ass_status > 0){
       	$("#frmAssetOptions .opAuction").html(availability);
       	$("#frmAssetOptions .opAuction").removeAttr("data-target");
       	$("#frmAssetOptions .opAuction").removeAttr("data-toggle");        	
       	$("#frmAssetOptions .opAuction").attr("onclick","alert('Asset already on Auction\n\nYou cannot add this Asset to an Auction.')");
   	   } else {
       	$("#frmAssetOptions .opAuction").attr("data-target","#addAuctionCart");
       	$("#frmAssetOptions .opAuction").attr("data-toggle","modal");   	
       	$("#frmAssetOptions .opAuction").removeAttr("onclick");        	   	
   	   }
       $("#frmAssetOptions .opAuction").attr("data-id",AssetId);
       $("#frmAssetOptions .opAuction").attr("data-name",asset_name);
       $("#frmAssetOptions .opAuction").attr("data-price",0);

       //Activate/deactivate button attributes
       //data-dismiss="modal"
       $("#frmAssetOptions .opActivate").attr("data-target","#siteActivate");
       $("#frmAssetOptions .opActivate").attr("data-toggle","modal");
       $("#frmAssetOptions .opActivate").attr("data-dismiss","modal");
       $("#frmAssetOptions .opActivate").attr("data-id",AssetId);
       $("#frmAssetOptions .opActivate").attr("data-name",asset_name);
       $("#frmAssetOptions .opActivate").attr("data-opActivate",opaction);       

       $("#frmAssetOptions .opSpecsheet").attr("data-target","#frmSpecsheet");

       /*data-target="#siteActivate"
                    data-id="<?php echo $row->ass_id; ?>" 
                    data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" 
                    data-price="<?php echo $total; ?>"
                    data-modal-action="<?php echo $action;?>"
      */                    
       //Adjust map center

        /*
          {"ass_id":"16","ass_name":"Myne","ass_type":"bill board (Traditional)","ast_id":null,"ass_ref":"Ref My\/000","ass_description":"My Myne",
           "ass_street_address":"419 Valley","ass_city":"Roodepoort","position":"-26.046604,27.944069",
           "current_bid":null,"yobid":0,"minimum_bid":null,"buy_now":null,"increment":null,"auction_id":null}
        */        
       //$('#response').html(jsonAsset.ass_id);
       //$("#frmEditItem").find('span[id="ass_name"]').html();
/*       
       var asset_name = jsonAsset.ass_name + " (" + jsonAsset.ass_ref + ")";
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;

       $("#frmEditItem").find('span[id="ass_name"]').html(asset_name);
       $("#frmEditItem").find('span[id="ass_name_header"]').html(asset_name);
       $("#frmEditItem").find('span[id="ass_description"]').html(jsonAsset.ass_description);
       $("#frmEditItem").find('span[id="ass_type"]').html(jsonAsset.ass_type);
       $("#frmEditItem").find('span[id="ass_address"]').html(asset_address);
       
       $("#frmEditItem").find('span[id="you_last_bid"]').html(jsonAsset.yobid);
       $("#frmEditItem").find('span[id="buy_now"]').html(jsonAsset.buy_now);
       $("#frmEditItem").find('span[id="increment"]').html(jsonAsset.increment);
       $("#frmEditItem").find('span[id="minimum_bid"]').html(jsonAsset.minimum_bid);
       $("#frmEditItem").find('span[id="current_bid"]').html(jsonAsset.current_bid);
*/


       //Adjust map center
      if (typeof google === 'object' && typeof google.maps === 'object'){
          var assetLatLong = jsonAsset.position;
          console.log(' position: '+jsonAsset.position);
          assetLatLong = assetLatLong.split(",");
          //debugger;
          var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
            var assetMapOptions = {
                center: assetLatLongObject,
                zoom: 14
            };
            
          mapA = new google.maps.Map(document.getElementById('map-canvas-popup'), assetMapOptions);

          mapA.setCenter(assetLatLongObject);
          //mapA.setZoom(savedMapZoom);
          //Update Street View as well
          var panoramaOptions = {
            position: assetLatLongObject,
            pov: {
              heading: 34,
              pitch: 10
            }
          };
          document.getElementById('pano-popup').innerHTML='';
          //$('div[id="pano"]').val('');
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano-popup').innerHTML, panoramaOptions);
          mapA.setStreetView(panorama);

          console.log(mapA);
          console.log(panoramaOptions);

      }

    })
    .fail(function () {
        alert("Error getting Asset/Site details");
        //$('#response').html("<b>Error getting Asset/Site details!</b>");
        //$("#frmEditItem .modal-body").find('span[id="description"]').html(' Asset ID: ' + a);
    });


    //Modal options
    var options = {
        "backdrop" : "true",
        "show" : "true"
    }
    //Show modal
    //$('#editItemDetails').modal(options);
    $('#frmAssetOptions').modal(options);
    }

        
	function modalshow_old(a) {
            
    var url = "<?php echo site_url();?>";
		var width, height, padding, top, left, modalbak, modalwin;
		width = 900;
		height = 500;
		padding = 64;
		top = (window.innerHeight - height - padding) / 2;
		left = (window.innerWidth - width - padding) / 2;


	$("#modalwin").load(url + "loadajax_1?c=" +a);

		modalbak = document.getElementById("modalbak");
		modalbak.style.display = "block";

		modalwin = document.getElementById("modalwin");
		modalwin.style.top = top + "px";
		modalwin.style.left = left + "px";
		modalwin.style.display = "block";

	}

	function modalhide() {
		document.getElementById("modalbak").style.display = "none";
		document.getElementById("modalwin").style.display = "none";
	}

    $('#btnFrmActivate').on("click", function( event ) {

        //alert('Submit Clicked');
        var form = $('#frmActivate'); //alert(form);
        var auction_base_url = '<?php echo site_url("auctions"); ?>';
        var ass_action = activate_ass_action;
        var ass_id = activate_ass_id;
        //alert('id/action: ' + ass_id + ass_action);

        var bidIsOK = true;
        console.log('method: post');
        console.log('action:'+auction_base_url + '/activate');
        console.log('data:'+form.serialize());
        if(bidIsOK){
            $.ajax({
                type: 'post',  //form method
                url: auction_base_url + '/activate',   //form action
                //data: form.serialize(),
                data:{'ass_id':ass_id,'ass_action':ass_action},
                success: function(data, status) {
                    //$('#placeBid').modal('hide');
                    //Modal Message here
                    alert('The asset has been ' + data + 'd, Result: ' + status);
                    window.location.reload();
                }
            });
        } else {
        }

        event.preventDefault();
    });

</script>

<div id='modalbak'></div>
<div id='modalwin'>


</div>

