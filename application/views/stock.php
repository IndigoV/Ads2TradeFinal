<?php error_reporting(0);?>
<?php echo $map_1['js'];echo $map_3['js'];echo $map_5['js'];echo $map_7['js'];echo $map_9['js']; ?>
<?php echo $map_2['js'];echo $map_4['js'];echo $map_6['js'];echo $map_8['js'];echo $map_10['js'];
$count = 0;
foreach ($mmm as $row) {
    
    $count = $count + 1;
}

?>        
<script type="text/javascript">
function approve(){
  if (confirm("Are you sure you want to approve all")) {
    location.href='add_all?all=1';
  }
  return false;
}
function decline(){
  if (confirm("Are you sure you want to decline all")) {
    location.href='remove_all?all=1';
  }
  return false;
}
</script>

<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>Incoming Auction Items For Approval</h1>
</div>

   
    <div class="table_div">

    	<div class="container">

        <form method="post" class="main col-xs-12 actions_home_page" action="">

          <div class="top_form">
          <!--
            <div class="row">
              <div class="col-sm-3">
                <p>
                 <label for="first_name">Media Family</label>                         
                 <select class="chosen-select" name="mef_id[]" id="mef_id" data-placeholder="Media Family" style="width:100%;" multiple
                     tabindex="7">
             
                  <?php
                  $arry1 = $_POST['mef_id'];

                  foreach ($may_asset_family as $row) {?>
                  <option <?php for($i=0;$i<count($arry1);$i++){
                  if ($arry1[$i] == $row->mef_id){ echo 'Selected';}

                  } ?> value="<?php echo $row->mef_id;?>"  ><?php echo $row->mef_description;?></option>
                  <?php }
                  ?>
                
                </select>
                </p>
              </div>

              <div class="col-sm-3">
                <p>
                  <label for="first_name">Master Media</label>                         
                  <select name="mam_id[]" id="mam_id" data-placeholder="Master Media" style="width:100%;" multiple
                      class="chosen-select" tabindex="8">

                  <?php
                  $arry = $_POST['mam_id'];                            
                  foreach ($may_asset_master as $row) {?>
                      <option <?php 
                      for($i=0;$i<count($arry);$i++){
                            if ($arry[$i] == $row->mam_id){ 
                                echo 'Selected';
                            }
                          } ?> value="<?php echo $row->mam_id;?>"  ><?php echo $row->met_description;?></option>
                  <?php }
                  ?>
                </select>
                </p>
              </div>
              <div class="col-sm-3">
                <p>
                  <label for="first_name">Location</label>                         
                  <input class="form-control"  type="text" id="myPlaceTextBox"/>
                </p>
              </div>
              <div class="col-sm-3">
                <p>
                  <label for="duration">Duration</label>   
                  <br>                      
                  <select name="duration[]" data-placeholder="Select Duration" multiple
                  class=" chosen-select" tabindex="8">

                    <?php
                    $ar = $_POST['duration'];
                    foreach ($durations as $row) {?>
                      <option <?php for($i=0;$i<count($ar);$i++){
                                                                    if ($ar[$i] == $row->days){ echo 'Selected';}
                        } ?> value="<?php echo $row->days;?>" > <?php echo  $row->description; ?></option>
                    <?php 
                        }
                    ?>

                  </select>
                </p>
              </div>
            </div>

            -->

        <div class="row">
          <div class="col-sm-6">

          	  <?php 
          	  $filter = $this->input->post('filter');
          	  ?>

                <label for="filter">Site Name, Description or Location</label>  
                <input type="text" class="form-control" placeholder="Type Site Name, Description or Location ..." value="<?php echo isset($filter)?$filter:'';?>" name="filter">

				<!-- /input-group -->
              <!-- /.col-lg-6 -->

          </div>

          <div class="col-sm-2">
            <label for="first_name" style="padding:0px;">&nbsp;</label>
            <input type="submit" class="btn btn-primary filterBtn" value="Apply Filter">
          </div>

        </div>

            <div class="clear"></div>
          </div>
          </form>

    	</div>
        
        <?php
        if($result){ 
        ?>	<div style="padding-left:30px; padding-right:30px;">
		    	<div class="alert alert-info" role="alert" >
		        	<span class="glyphicon glyphicon-info-sign"></span>
		        	<?php echo $result; ?>
		        </div>
	        </div>
        <?php
    		}
        ?>
        <div class="panel panel-default" style="padding-right:30px;">
				<div class="panel-heading">
					<div class="row">
						<div class="container">
							<div class="sbInRow ">
								<form novalidate="novalidate" class="form-inline">
																		
									<div class="form-group pull-right">
										<span class="help-block">Found <?php echo $count;?> Assets</span>
									</div>
                                                                    <div class="form-group pull-right">
                                                                        <span class="help-block">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</div>
                                                                    
								</form>

							</div>
						</div>
					</div>
				</div>
                                                                        <div class="form-group pull-right">
                                                                            <span class="help-block"><input name="approve" onclick="approve()" type="button" class="btn btn-primary" value="Approve All">&nbsp;&nbsp;<input name="approve" onclick="decline()" type="button" class="btn btn-primary" value="Decline All"></span>
									</div>
            <br>
            <br>
            
				<div class="panel-body" style="padding-left:30px; padding-right:5px;">

				<div class="list-group" data-bind="foreach: pagedRows">
						
				<?php
				$a = 0;
				//print_r($mmm);
				foreach ($mmm as $row) {
					$a = $a + 1;
					$b = 'map_'.$a; 
					$c = 'map_canvas'.$a; 

					$auction_id = $row->id;
					$asset_id = $row->ass_id;

					$from = $row->starts;
					$ends = $row->ends;
					$duration = $row->duration;
					//$ass_description = $duration;
					$minimum_bid = $row->minimum_bid;
					$buy_now = $row->buy_now;
					$increment = $row->increment;

					//Asset Image
					$img_url = $row->upd_url;
					$asset_image_css_style = '';
					if($img_url != '' && $img_url != null && !is_null($img_url)){
						$asset_image_css_style = "background-image: url($img_url);";
					}
 
            ?>
                  <div class="assets_box">
                  <!-- href="asset?auction_id=<?php echo $auction_id;?>&ass_id=<?php echo $row->ass_id;?>"  -->
                    <a  style="width:178px;height:178px;<?php echo $asset_image_css_style;?>" 
                    	href="#" 
                    	class="pic <?php echo $a_href_class; ?>">
                    </a>
                    <div class="info">
                      <table>
                        <tbody>
                          <tr>
                            <td width="150px;">Asset Name/Number:</td>
                            <td>
                            	<?php 
                            		echo $row->ass_name,' (PENDING)';
                            		$css_disabled = 'disabled';
                            	?>
                            </td>
                            <td>

		                      <div class="btn-group" style="padding-left:10px;">

		                        <a href="<?php echo site_url('my_stock/approve?p=op_index&approve=approve&asst_id='),$asset_id,'&auction_id=',$auction_id; ?>" 
		                        	class="btn btn-primary"   
		                        	data-id="<?php echo $asset_id; ?>">
		                        	<span class="glyphicon glyphicon-ok"></span> Approve</a>

		                        <a href="<?php echo site_url('my_stock/approve?p=op_index&decline=decline&asst_id='),$asset_id,'&auction_id=',$auction_id; ?>" 
		                        	class="btn btn-primary"  
		                        	data-id="<?php echo $asset_id; ?>">
		                        	<span class="glyphicon glyphicon-remove"></span> Decline</a>
		                      </div>

		                    </div>	

                            </td>
                          </tr>                     
                          <tr>
                            <td>Start Date:</td>
                            <td><?php echo $from;?></td>
                          </tr>                          
                          <tr>
                            <td>End Date:</td>
                            <td><?php echo $ends;?></td>
                          </tr>                                                                             
                        </tbody>
                      </table>
                      <p class="description">
                      <?php echo 'Minimum bid: ', $minimum_bid,' Duration: ',$duration; ?><br>
                      <?php echo 'Buy Now: ', $buy_now, ' Increment:',$increment; ?><br>	
                      </p>
                    </div>
                    <div class="clear"></div>
                  </div>

      
      <?php 

  		}

      ?>


    </div>
				</div>
				<div class="panel-footer">
					<div class="smd-pagination">
						<div id="pager" class="smd-pager light-theme"><span class="current"></span></a><span class="ellipse"></span></div>
					</div>
				</div>
			</div>



</div><!--Main -->
<pre>
<?php
//include("footer.php"); 
//print_r($mmm);
?>
</pre>