<style type="text/css">

    #map-canvas {
        height: 400px;
        margin: 0px;
        padding: 0px
    }

    #map-canvas img {
        max-width: none !important; 
        height: auto !important; 
        background: none !important;
        border: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
    }

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

    .rg-view {
      visibility: hidden;
    }

</style>

<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">    
    <div class="rg-image-wrapper">
        {{if itemsCount > 1}}
            <div class="rg-image-nav">
                <a href="#" class="rg-image-nav-prev">Previous Image</a>
                <a href="#" class="rg-image-nav-next">Next Image</a>
            </div>
        {{/if}}
        <div class="rg-image"></div>
        <div class="rg-loading"></div>
        <div class="rg-caption-wrapper">
            <div class="rg-caption" style="display:none;">
                <p></p>
            </div>
        </div>
    </div>
</script>


<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>View Edit Stock </h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}

$asset_type = $this->input->get('type');
$indoor_active = '';
$outdoor_active = 'class="active"';;
if($asset_type == 'indoor'){
    $indoor_active = 'class="active"';
    $outdoor_active = '';
} 
?>

<div class="main col-xs-12">
    
    <div clss="row">    
        <div class="col-xs-12">

		    <ul class="nav navbar-nav section-menu">
		        <li <?php echo $outdoor_active; ?>><a href="<?php echo site_url('load_stock'); ?>">Outdoor Assets</a></li>
		        <li <?php echo $indoor_active; ?>><a href="<?php echo site_url('malls')?>">Indoor Assets</a></li>
		    </ul>    

		    <div class="clear"></div>

		    <div class="alert alert-info" role="alert">
		        <span class="glyphicon glyphicon-info-sign"></span>
		        If you have a large number of assets to load, please email upload@ads2trade.co.za and one of our Account Managers will work with you directly.
            </div>
            <?php 
            $updated = $this->input->get('updated');
            if($updated>0){
            ?>
            <div class="alert alert-success">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <strong>Success!</strong> You have successfully updated the assets's details
            </div>
            <?php
            } else {            
                $error = $this->input->get('error');
                if($error>0){
                ?>
                <div class="alert alert-danger">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>Error!</strong> There was an error updating the asset details, please make sure you fill in all the required fields
                </div>
                <?php
                }
            }
            ?>
		    <br>

            <div class="text-center">
                <br>
                <div class="btn-group">
                    <button type="button" class="btn btn-default show_auctions_locations active">Show Photos</button>
                    <button type="button" class="btn btn-default show_auctions_map" id="showmap"><span id="mapShow">Show Map</span></button>
                </div>
            </div>
            <br>

            <div class="locations_view">

                <!-- Asset Photos  -->
                <div class="locations_view" style="padding:30px;" id="wrap">


                    <div class="col-xs-12 pull-right" style="margin-top: 0px;">
                          
                        <!-- Large modal -->
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Upload Photo(s)</button>

                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color:lightgrey;">
                                    <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title h4" id="myModalLabel">Upload Asset Photo(s)</h4>
                                </div>
                                <div class="modal-body">
                                
                                    <form id="multiform" action="<?php echo site_url()?>load_stock/do_upload" method="POST" enctype="multipart/form-data">    
                                    
                                    <label>Asset Photo</label>
                                    <input type="file" class="form-control" name="userfile" id="file" accept=".jpg,.png,.gif"><br/>
                                    <input type="hidden" name="ass_id" value="<?php echo $this->input->get('ass_id');?>">
                                    <button class="btn primary">Upload</button>
                                    
                                    </form>
                                    <br/>
                                    <p id="msg" style="color: #e01e2a"></p>
                                    <p id="msg2" style="color: #339900"></p>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload();">Close</button>
                                </div>
                            </div>
                        </div>
                        </div>
                    
                    
                        <!-- Large modal -->
                        <!--
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal1">Upload Face B photo</button>
                        -->
                        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Face B photo upload</h4>
                                </div>
                                <div class="modal-body">
                                    
                                    <form id="multiform1" action="<?php echo site_url()?>load_stock/do_upload" method="POST" enctype="multipart/form-data">
                                        
                                    <label>Face B photo</label>
                                    <input type="file" class="form-control" name="userfile" id="file1"><br/>
                                    <input type="hidden" name="ass_id" value="<?php echo $row->ass_id;?>">
                                    <button class="btn primary">Upload</button>
                                    
                                    </form>
                                    <br/>
                                    <p id="msg1" style="color: #e01e2a"></p>
                                    <p id="msg3" style="color: #339900"></p>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                        </div>
                    
                        <div class="container">    
                            <div class="content">
                        
                                <div id="rg-gallery" class="rg-gallery">
                                        <div class="rg-thumbs">
                                            <!-- Elastislide Carousel Thumbnail Viewer -->
                                            <div class="es-carousel-wrapper">
                                                <div class="es-nav">
                                                    <span class="es-nav-prev">Previous</span>
                                                    <span class="es-nav-next">Next</span>
                                                </div>
                                                <div class="es-carousel" id="thumbnails">
                                                    <ul>
                                                        <?php 
                                                        if(isset($photos) && !empty($photos)): 
                                                            foreach ($photos as $row):
                                                        ?>
                                                         <li>
                                                            <a href="#">
                                                            <img src="<?php echo $row->upd_url;?>" data-large="<?php echo $row->upd_url;?>" alt="Asset Image #" data-description="" data-target="#frmPreview"/>
                                                            </a>
                                                        </li> 
                                                        <?php  
                                                            endforeach; 
                                                        endif;
                                                        ?>
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- End Elastislide Carousel Thumbnail Viewer -->
                                        </div><!-- rg-thumbs -->
                                </div><!-- rg-gallery -->

                            </div><!-- content -->

                            <img id="largeImage" src="">

                        </div><!-- container -->

                    </div> 



                </div>

            </div>

            <div class="map_view">        
              
                <input type="hidden" id="myPlaceTextBox" placeholder="Enter location" autocomplete="off" class="form-control" />

                <div class="map_wrap" style="width:1053px;height:400px; padding-bottom:30px;">
                    <center>
                        <div id="map-canvas"></div>
                    </center>
                </div>

            </div>
        </div>
    </div>
    
    <br>
    <br>


    <div class="clear"></div>
    <div style="margin-top:50px;">
    <br/>
    <?php
    $attributes = array('class' => 'form');
    //echo form_open_multipart('load_stock/update_asset', $attributes);
    echo form_open('load_stock/update_asset', $attributes);
    ?>
    
    <h3 class="h3" style="margin-top:30px;">Asset Details </h3>
    <div class="row">
    <div class="col-sm-6"> 

            <p>
                <?php 
                if(isset($asset_by_id) && !empty($asset_by_id)):
                ?>
                <?php 
                if(isset($unit) && !empty($unit)):
                ?>
                
                <?php echo form_error('ass_ref');?>
                <?php 
                foreach ($asset_by_id as $row):
                ?>
                <label for="asset_name">Asset Name</label>                           
                <input type="text" name="ass_ref" value="<?php echo (isset($row->ass_name) && !empty($row->ass_name))? $row->ass_name: '';?>" id="loc_ref" class="form-control">
            </p>

        
            <p>
                <label for="first_name">Copy from</label>                         
                <select name="copy_existing" id="copy_existing" class="form-control">
                    <option value="" disabled selected>Select Existing Asset Details</option>
                    <?php
                    foreach ($asset as $rows):?>
                    <option value="<?php echo $row->ass_id;?>"><?php echo $rows->ass_name;?></option>
                    <?php
                     endforeach;
                    ?>
                </select>
            </p>
       
            <p>
                <?php echo form_error('asset_desc');?>
                <label for="first_name">Asset Description</label>                           
                <textarea name="asset_desc" id="asset_desc" class="form-control"><?php 
                    echo (isset($row->ass_description) && !empty($row->ass_description))? trim($row->ass_description):'';
                    ?></textarea>
            </p>

            <p>
            <?php echo form_error('employee_maintenance');?>
            <label for="first_name">Employee (Maintenance)</label>                         
            <select name="employee_maintenance" id="employee_maintenance" class="form-control">
                <option value="4" <?php echo set_select('employee_maintenance', '4'); ?>>Simon Michael</option>
                <option value="5" <?php echo set_select('employee_maintenance', '5'); ?>>John Doe</option>
                <option value="6" <?php echo set_select('employee_maintenance', '6'); ?>>Rob Van Dam</option>
            </select>
            </p>
            
            <p>
                <?php echo form_error('acq_cost');?>
                <label for="asset_name">Acquisition Cost</label>                           
                <input type="text" name="acq_cost" onkeyup="numbers_only('acq_cost')" value="<?php echo (isset($row->ass_acquisition_cost) && !empty($row->ass_acquisition_cost))? $row->ass_acquisition_cost: '';?>" id="acq_cost" class="form-control">
            </p>

            <div class="row"> 
                <div class="col-sm-6"> 
                    <?php echo form_error('book_value');?>
                    <label for="asset_name">Asset Book Value</label>                           
                    <input type="text" name="book_value" onkeyup="numbers_only('book_value')" value="<?php echo (isset($row->ass_book_value) && !empty($row->ass_book_value))? $row->ass_book_value: '';?>" id="book_value" class="form-control">
                </div>
                <div class="col-sm-3"> 
                    <?php echo form_error('ass_duration');?>
                    <label for="ass_duration">Asset Duration</label>                           
                    <input type="text" name="ass_duration" onkeyup="numbers_only('ass_duration')" value="<?php echo (isset($row->ass_duration) && !empty($row->ass_duration))? $row->ass_duration: '';?>" id="ass_duration" class="form-control">
                </div>
                <div class="col-sm-3"> 
                    <?php echo form_error('ass_duration_unit');?>                          
                    <label for="ass_duration_unit">Duration Unit</label>                           
                    <select name="ass_duration_unit" id="ass_duration_unit" class="form-control">
                        <option value="0">Select Unit</option>
                            <?php 
                            if(isset($unit) && !empty($unit)): 
                                foreach ($unit as $row2):
                            ?>
                            <option value="<?php echo $row2->meu_id;?>" 
                                <?php echo ($row2->meu_id==$row->ass_duration_unit)?'selected':''; ?>
                            ><?php echo $row2->meu_unit;?></option>
                        <?php 
                            endforeach; 
                        endif;?>
                    </select>

                </div>                
            </div>

            <div class="row"> 
                <div class="col-sm-4"> 
                    <?php echo form_error('ass_population_group');?>
                    <label for="ass_population_group">Population Group</label>                           
                    <input type="text" name="ass_population_group" onkeyup="numbers_only('ass_population_group')" value="<?php echo (isset($row->ass_population_group) && !empty($row->ass_population_group))? $row->ass_population_group: '';?>" id="ass_population_group" class="form-control">
                </div>
                <div class="col-sm-4"> 
                    <?php echo form_error('ass_monthly_volumes');?>
                    <label for="ass_monthly_volumes">Monthly Volumes</label>                           
                    <input type="text" name="ass_monthly_volumes" onkeyup="numbers_only('ass_monthly_volumes')" value="<?php echo (isset($row->ass_monthly_volumes) && !empty($row->ass_monthly_volumes))? $row->ass_monthly_volumes: '';?>" id="ass_monthly_volumes" class="form-control">
                </div>
                <div class="col-sm-4"> 
                    <?php echo form_error('ass_daily_volumes');?>
                    <label for="ass_daily_volumes">Daily Volumes</label>                           
                    <input type="text" name="ass_daily_volumes" onkeyup="numbers_only('ass_daily_volumes')" value="<?php echo (isset($row->ass_daily_volumes) && !empty($row->ass_daily_volumes))? $row->ass_daily_volumes: '';?>" id="ass_daily_volumes" class="form-control">
                </div>                                
            </div>            
            
            <div class="row"> 
                <div class="col-sm-6">
                <?php echo form_error('pri_height');?>
                <label for="asset_name">Printable length</label>                           
                <input type="text" name="pri_height" onkeyup="numbers_only('pri_height')" value="<?php echo (isset($row->ass_printable_height) && !empty($row->ass_printable_height))? $row->ass_printable_height: '';?>" id="pri_height" class="form-control">
                </div>
                
                <div class="col-sm-6">
                <?php echo form_error('pri_length_unit');?>
                <label for="asset_name">Unit</label>                           
                <select name="pri_length_unit" id="pri_length_unit" class="form-control">

                    <option value="0">Select a unit</option>
                    <?php 
                    if(isset($unit) && !empty($unit)): 
                        foreach ($unit as $row2):
                    ?>
                    <option value="<?php echo $row2->meu_id;?>" 
                        <?php echo ($row2->meu_id==$row->ass_height_meu_id)?'selected':''; ?>
                    ><?php echo $row2->meu_unit;?></option>
                    <?php 
                        endforeach; 
                    endif;?>
                </select>
                </div>
            </div>
            
            <div class="row">
        <div class="col-sm-6">
                <?php echo form_error('pri_width');?>
                <label for="asset_name">Printable Width</label>                           
                <input type="text" name="pri_width" onkeyup="numbers_only('pri_width')" value="<?php echo (isset($row->ass_printable_width) && !empty($row->ass_printable_width))? $row->ass_printable_width: '';?>" id="pri_width" class="form-control">
        </div>       
                
        <div class="col-sm-6">
                <?php echo form_error('pri_width_unit');?>
                <label for="asset_name">Unit</label>                           
                <select name="pri_width_unit" id="pri_width_unit" class="form-control">
                    <option value="0">Select a unit</option>
                    <?php 
                    if(isset($unit) && !empty($unit)): 
                        foreach ($unit as $row3):
                    ?>
                        <option value="<?php echo $row3->meu_id;?>" 
                            <?php echo ($row3->meu_id==$row->ass_width_meu_id)?'selected':''; ?>
                        ><?php echo $row3->meu_unit;?></option>
                    <?php 
                        endforeach; 
                    endif;
                    ?>
                </select>
        </div>
    </div>
            
            
            <p>  
                <?php echo form_error('proportional_costs');?>
                <label for="proportional_costs">Proportional Costs</label>                           
                <input type="text" name="proportional_costs" onkeyup="numbers_only('proportional_costs')" value="<?php echo (isset($row->ass_proportional_costs) && !empty($row->ass_proportional_costs))? $row->ass_proportional_costs: '';?>" id="proportional_costs" class="form-control">
            </p>
    </div>
    



<div class="col-sm-6">
              
                <!--<p class="col-md-6" style="margin-left: -12px;">-->
            
            <p>    
                    <label for="mec_id">Media Type</label>
                    <select name="mec_id" class="form-control">
                    <option value="0">Select Media Type</option>
                        <?php 
                        foreach ($med_cat as $med):
                        ?>
                            <option value="<?php echo $med->mec_id;?>" 
                                <?php echo ($med->mec_id==$row->mec_id)?'selected':''; ?>
                            ><?php echo $med->description;?></option> 
                        <?php 
                        endforeach;
                        ?>            
                    </select>
            </p>
    
            
            <p>  
                <?php echo form_error('mat_type');?>
                <label for="mat_type">Material Type</label>                           
                <select name="mat_type" id="mat_type" class="form-control">
                    <option value="0">Select Material Type</option>
                    <option value="1" <?php echo ($row->mat_id==1)?'selected':''; ?>>Vinly</option>
                    <option value="2" <?php echo ($row->mat_id==2)?'selected':''; ?>>Cloth</option>
                    <option value="3" <?php echo ($row->mat_id==3)?'selected':''; ?>>Plastic</option>
                    <option value="4" <?php echo ($row->mat_id==4)?'selected':''; ?>>Glass</option>
                </select>
            </p>
            
             <p>  
                <?php echo form_error('loc_type');?>
                <label for="loc_type">Location Type</label>                           
                <select name="loc_type" id="loc_type" class="form-control">
                    <option value="0">Select Location Type</option>
                    <option value="1" <?php echo ($row->lot_id==1)?'selected':''; ?>>Street corner</option>
                    <option value="2" <?php echo ($row->lot_id==2)?'selected':''; ?>>Busy mall</option>
                    <option value="3" <?php echo ($row->lot_id==3)?'selected':''; ?>>Highway</option>
                </select>
            </p>
              <p>  
                <?php echo form_error('lead_time');?>  
                <label for="lead_time">Production Lead Time</label>                           
                <select name="lead_time" id="lead_time" class="form-control">
                    <option value="0">Select Lead Time</option>
                    <option value="1" <?php echo ($row->ass_lead_time==1)?'selected':''; ?>>2 hours</option>
                    <option value="2" <?php echo ($row->ass_lead_time==2)?'selected':''; ?>>2 weeks</option>
                    <option value="3" <?php echo ($row->ass_lead_time==3)?'selected':''; ?>>2 days</option>
                </select>
            </p>
            
            <p>
                <?php echo form_error('pro_requirements');?>
                <label for="pro_requirements">Production Requirements</label>                           
                <textarea name="pro_requirements" id="pro_requirements" class="form-control"><?php echo (isset($row->ass_production_requirements) && !empty($row->ass_production_requirements))? $row->ass_production_requirements: '';?></textarea>
            </p>
            
            <p>
                <?php echo form_error('position_1');?>
                <label for="position_1">Position</label>                           
                <textarea name="position_1" id="position_1" class="form-control"><?php echo (isset($row->position) && !empty($row->position))?$row->position:'';
                    ?></textarea>
                <?php $map_center_coods = (isset($row->position) && !empty($row->position))? $row->position: '';
                ?>
            </p>
            <input type="hidden" name="ass_id" value="<?php echo $row->ass_id;?>">
            
            
</div>

<div class="row">
	<div class="col-sm-6">         
		<div class="bottom-buttons">
			<a href="<?php echo site_url('load_stock/?type=outdoor'); ?>" style="margin-top: -25px;" class="btn btn-default">Cancel</a>
			<input  class="btn btn-primary" type="submit" style="margin-top: -24px;" name="next" id="next" value="Save">
		</div>
	</div>
</div>

</div>
<?php
echo form_close();

?>

</div><!--Main -->
</div>



<!-- POPUPS -->

<div class="modal fade" id="frmPreview" tabindex="-1" role="dialog" aria-labelledby="frmPreview" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header" style="background-color:lightgrey;">
            <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title h4" id="myModalLabel">Asset Photo Preview</h4>
        </div>
        <div class="modal-body" style="background-color:#f6f6f6;">
            <center>
                <img id="imgPreview" src="<?php echo base_url('assets/loading.gif'); ?>">
            </center>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>
</div>

<!-- END POPUPS -->


<?php if(isset($asset_by_id) && !empty($asset_by_id)):?>
<?php foreach ($asset_by_id as $row):?>
<!--
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
-->
<script type="text/javascript">

//COUROUSEL

$(function() {
      $('#thumbnails img').click(function() {
            //$('#thumbnails').hide();
            var src = $(this).attr('src');
            //$('#largeImage').attr('src', src).show();
            //alert('Image Clicked');

            $("#frmPreview").find('img[id="imgPreview"]').attr('src',src);
            
            //Modal options
            var options = {
                "backdrop" : "true",
                "show" : "true",
                "width":"700px",
                "height":"400px"
            }

            //Show modal
            $('#frmPreview').modal(options);

      });

      $('#largeImage').hide().click(function() {
            $(this).hide();
            //$('#thumbnails').show();
      });
});

//END COROUSEL

    $("#myModal").on('hide', function () {
            window.location.reload();
        });

    //javascript function to restrict input values to be numbers only.
    function numbers_only(elementId)
    {
	var e = document.getElementById(elementId);
	var str = e.value;
	var val = "";
	if(isNaN(str))
	{
		e.value = "";
		for(var x=0; x<str.length; x++)
		{
			if(isNaN(str[x]))
			{
				//bootbox.alert("Only Numbers 0-9 are allowed!");
				continue;
			}
			else
			{
				e.value += str[x];
			}
		}
	}
    }

</script>
    

<!-- mapping requirements -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>
<!-- mapping requirements end -->

<script type="text/javascript">
	var raw_markers = <?php echo json_encode($asset_by_id);?>;
	var base_url = '<?php echo base_url();?>';
    var site_url = '<?php echo site_url();?>'
    var update_url = site_url + "load_stock/update_location";
	var adsMap = false;
	var disableListener = false;
    var centerposition = '<?=trim($map_center_coods);?>';
    var centerLatLng = centerposition.split(',');
    var centerposition = new google.maps.LatLng(centerLatLng[0],centerLatLng[1]);
    var marker; /* global marker to be able to get marker info globaly on events such as dragstart/ dragend etc */
    var marker_icon = base_url + 'assets/mapping/images/media_11.png'; /* Shopping Mall icon (only for assets with ass_is_mall=1 */

	function initialize() {
		var mapOptions = {
            zoom: 12, 
            center: centerposition,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        }; /* zoom changed from 6 */
		map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

		var addAssetListener = google.maps.event.addListener(map, 'click', function(event) {
			if (disableListener) {
				return;
			}
			//addMarker(event.latLng);   //do we need ability to add new assets here? probably not. we are editing
		});
		var markers = [];
		for (var i in raw_markers) {
			(function (i) {
				var marker_details = raw_markers[i];
				console.log('Ugly hack to fix missing mec_id field');
				if (!marker_details.hasOwnProperty('mec_id')) {
					marker_details.mec_id = marker_details.med_id;
				}

                if(marker_details.ass_is_mall == 1){
                    marker_icon = base_url + 'assets/mapping/images/media_11.png';     /* Shopping Mall Icon */
                } else {
                    marker_icon = base_url + 'assets/mapping/images/media_'+marker_details.mec_id+'.png'; /* use icon as per mec_id default */
                }

				var position_parts = marker_details.position.split(',');
				var latLng = new google.maps.LatLng(<?=$row->position;?>);
				marker = new google.maps.Marker({
					position: latLng,
                    draggable: true,  /*Allow the moving of assets locations */
					map: map,
                    icon: marker_icon,
                    title: ""+marker_details.ass_name + " (" + marker_details.ass_address + ")",
                    asset_id: marker_details.ass_id,
                    type: parseInt(marker_details.mec_id),
                    is_mall: parseInt(marker_details.ass_is_mall),
                    mall_id: marker_details.mall_id
				});

                // Attach the marker drag event to allow and update the moving of asset positions
                google.maps.event.addListener(marker, 'dragstart', function (event) {
                    //debugger;
                    var chagedPos = markers[i].position;
                    console.log(' current pos: ' + chagedPos);
                });

                // Attach the marker drag event to allow and update the moving of asset positions
                google.maps.event.addListener(marker, 'dragend', function (event) {
                    //debugger;
                    var chagedPos = markers[i].position;
                    console.log(' new pos: ' + chagedPos);
                    /*marker.getPosition()*/
                    /*
                    $.post(update_url, {postition: chagedPos}, function(result){
                        //result of the POST 
                        console.log(' marker drag/upd/post complete:'+result);
                    });
                */
                });

                // Attach the marker drag event to allow and update the moving of asset positions
                google.maps.event.addListener(marker, 'click', function (event) {
                    //debugger;
                    var chagedPos = marker.position;
                    var asset_id = marker.asset_id;
                    var asset_is_mall = marker.is_mall;
                    var mall_id = marker.mall_id;
                    var asset_mec_id = marker.type;

                    console.log(' maker clicked : ' + asset_id);
                    if(asset_is_mall == 1){
                        // this is a mall go to mall assets management
                        // or better yet prompt user to either choose to go manage auctions or manage mall items
                        console.log(mall_url);
                        window.location = mall_url;
                        /*
                        if(confirm("Click OK to go to Mall Assets")){
                            alert('Manage Mall Assets...');
                            var mall_url = site_url + "/malls/mall/"+ mall_id;
                            console.log(mall_url);
                        } else {
                            alert('Redirecting to Mall Assets Auctions...');
                        }
                        */
                    } else {
                        // this not a mall, create/manage auctions
                        //alert('Manage Asset Auction(s) popup will load here, work still in progress ...');
                    }

                    /*marker.getPosition()*/
                    /*
                    $.post(update_url, {postition: chagedPos}, function(result){
                        //result of the POST 
                        console.log(' marker drag/upd/post complete:'+result);
                    });
                */
                });

				/* add other markers onto the map as well */
                markers.push(marker);

//				google.maps.event.addListener(marker, 'click', function () {
//
//					modalshow(marker_details.ass_id);
//				});
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

        /*      
        //google.maps.event.trigger(adsMap,'resize');        
        $(window).resize(function() {
            //force map redraw to remove the 'grey areas'
            //adsMap.setCenter(centerposition);

        });      
        */
        /* trigger a window resize event and reset the map's center */        
        $(window).bind('resize', function () {
            //resizeElements();
            var center = map.getCenter();
            google.maps.event.trigger(map, "resize"); //this fixes the problem with not completely loaded map a.k.a 'grey areas'
            map.setCenter(center);
            console.log('window/map resize:' + center);            
        }).trigger('resize');        
                
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
        
        

</script>
<?php 
    endforeach;
endif;
?>

<noscript>
	<style>
		.es-carousel ul{
			display:block;
		}
	</style>
</noscript>

<script type="text/javascript">
    
    $('#mapShow').click(function(e){
        initialize();
        if(map){
          $(window).trigger('resize');
          var center = map.getCenter();
          google.maps.event.trigger(map, "resize"); //this fix the problem with not completely map
          map.setCenter(center);
        }
      });

    /**
     * 
     * The following code is an Ajax code:
     * For posting an ID value to the database
     * and retriving all requested values
     * from the database to the form fields.
     */
    
    var content = "";
    //var content1 = "";
    var content2 = "";
    var content3 = "";
    var content4 = "";
    var content5 = "";
    var content6 = "";
    var content7 = "";
    var content8 = "";
    var content9 = "";
    var content10 = "";
    var content11 = "";
    var content12 = "";
    var content13 = "";
    var content14 = "";
    var content15 = "";
    var content16 = "";
    
    $('#copy_existing').on('change', function(e) {
	var form_data = {
		ass_id: $('#copy_existing').val(),
		ajax: '1'
	};
	$.ajax({
		url: '<?php echo site_url('load_stock/getAssetByAjax1')?>',
		type: 'POST',
		data: form_data,
		dataType: 'json',
		success: function(result) {
                        for(var x = 0; x < $(result).size(); x++){
                            content = result[x].ass_production_requirements;
                            //content1 = result[x].ass_name;
                            content2 = result[x].ass_description;
                            content3 = result[x].ass_printable_width;
                            content4 = result[x].ass_production_price_SCY;
                            content5 = result[x].ass_production_cost_BCY;
                            content6 = result[x].ass_acquisition_cost;
                            content7 = result[x].ass_book_value;
                            content8 = result[x].ass_printable_height;
                            content9 = result[x].ass_proportional_costs;
                            content10 = result[x].mat_id;
                            content11 = result[x].lot_id;
                            content12 = result[x].ass_lead_time;
                            content13 = result[x].ass_position;
                            content14 = result[x].ass_width_meu_id;
                            content15 = result[x].ass_height_meu_id;
                            content16 = result[x].ass_num_faces;
			
			$('#pro_requirements').val(content);
                        //$('#loc_ref').val(content1);
                        $('#asset_desc').val(content2);
                        $('#pri_width').val(content3);
                        $('#pro_cost_scy').val(content4);
                        $('#pro_cost_bcy').val(content5);
                        $('#acq_cost').val(content6);
                        $('#book_value').val(content7);
                        $('#pri_height').val(content8);
                        $('#proportional_costs').val(content9);
                        $('#mat_type').val(content10);
                        $('#loc_type').val(content11);
                        $('#lead_time').val(content12);
                        $('#position_1').val(content13);
                        $('#pri_width_unit').val(content14);
                        $('#pri_length_unit').val(content15);
                        $('#numfaces').val(content16);
                    }
                    content = "";
                    content1 = "";
                    content2 = "";
                    content3 = "";
                    content4 = "";
                    content5 = "";
                    content6 = "";
                    content7 = "";
                    content8 = "";
                    content9 = "";
                    content10 = "";
                    content11 = "";
                    content12 = "";
                    content13 = "";
                    content14 = "";
                    content15 = "";
                    content16 = "";
		},
		error: function (jqXHR, textStatus, errorThrown) {
                  alert(errorThrown);
            }
	});	
});
        
</script>
<script type="text/javascript">
  
//$(document).ready(function(){  
    function getDoc(frame) {
     var doc = null;
     
     // IE8 cascading access check
     try {
         if (frame.contentWindow) {
             doc = frame.contentWindow.document;
         }
     } catch(err) {
     }

     if (doc) { // successful getting content
         return doc;
     }

     try { // simply checking may throw in ie8 under ssl or mismatched protocol
         doc = frame.contentDocument ? frame.contentDocument : frame.document;
     } catch(err) {
         // last attempt
         doc = frame.document;
     }
     return doc;
 }

  

$("#multiform").submit(function(e)
{
        
	var formObj = $(this);
	var formURL = formObj.attr("action");
        
	if(window.FormData !== undefined)  // for HTML5 browsers
	{
	
		var formData = new FormData(this);
                
                if($("#file").val().length === 0){
                    return false;
                }
                else{
                
		$.ajax({
                        url: formURL,
			type: "POST",
			data:  formData,
			mimeType:"multipart/form-data",
			contentType: false,
                        cache: false,
			processData:false,
			success: function(data)
                        {
                                alert(data);
                                if(data === "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png"){
                                $("#msg").html(data).fadeOut(10000);
                                }else{
                                    
                                    $("#msg2").html(data).fadeOut(5000);
                                }
                        },
		  	error: function(jqXHR, textStatus, errorThrown) 
                        {
                            alert(textStatus);
                        } 	        
                        });   
                    } 
                    e.preventDefault();
   }
   else  //for olden browsers
	{
		//generate a random id
		var  iframeId = "unique" + (new Date().getTime());

		//create an empty iframe
		var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');

		//hide it
		iframe.hide();

		//set form target to iframe
		formObj.attr("target",iframeId);

		//Add iframe to body
		iframe.appendTo("body");
		iframe.load(function(e)
		{
			var doc = getDoc(iframe[0]);
			var docRoot = doc.body ? doc.body : doc.documentElement;
			var data = docRoot.innerHTML;
			//data return from server.
			
		});
	
	}

});
$("#multiform").submit();
//});


$("#multiform1").submit(function(e)
{
        
	var formObj = $(this);
	var formURL = formObj.attr("action");
        
	if(window.FormData !== undefined)  // for HTML5 browsers
	{
	
		var formData = new FormData(this);
                var message = "File upload success";
                
                if($("#file1").val().length === 0){
                    return false;
                }
                else{
                
		$.ajax({
                        url: formURL,
			type: "POST",
			data:  formData,
			mimeType:"multipart/form-data",
			contentType: false,
                        cache: false,
			processData:false,
			success: function(data)
                        {
                                alert(data);
                                if(data === "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png"){
                                $("#msg1").html(data).fadeOut(10000);
                                
                                }else{
                                    $("#msg3").html(data).fadeOut(5000);
                                    
                                }
                                    
                            
                        },
		  	error: function(jqXHR, textStatus, errorThrown) 
                        {
                            alert(textStatus);
                        } 	        
                        }); 
                    }   
                    e.preventDefault();
   }
   else  //for olden browsers
	{
		//generate a random id
		var  iframeId = "unique" + (new Date().getTime());

		//create an empty iframe
		var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');

		//hide it
		iframe.hide();

		//set form target to iframe
		formObj.attr("target",iframeId);

		//Add iframe to body
		iframe.appendTo("body");
		iframe.load(function(e)
		{
			var doc = getDoc(iframe[0]);
			var docRoot = doc.body ? doc.body : doc.documentElement;
			var data = docRoot.innerHTML;
			//data return from server.
			
		});
	
	}

});
$("#multiform1").submit();


    function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin, mapA;
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
        /*
          {"ass_id":"16","ass_name":"Myne","ass_type":"bill board (Traditional)","ast_id":null,"ass_ref":"Ref My\/000","ass_description":"My Myne",
           "ass_street_address":"419 Valley","ass_city":"Roodepoort","position":"-26.046604,27.944069",
           "current_bid":null,"yobid":0,"minimum_bid":null,"buy_now":null,"increment":null,"auction_id":null}
        */        
       //$('#response').html(jsonAsset.ass_id);
       //$("#frmEditItem").find('span[id="ass_name"]').html();
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

       //Adjust map center
      if (typeof google === 'object' && typeof google.maps === 'object'){
        var assetLatLong = jsonAsset.position.split(",");
        var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
        var assetMapOptions = {
            center: assetLatLong,
            zoom: 14
        };
        mapA = new google.maps.Map(document.getElementById('map-canvas'), assetMapOptions);
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
        document.getElementById('pano').value('');
        var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
        mapA.setStreetView(panorama);
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
    $('#editItemDetails').modal(options);
    }


</script>

<link rel="stylesheet" href="<?php echo base_url(); ?>css1/style1.css"> 
<link rel="stylesheet" href="<?php echo base_url(); ?>css1/elastislide1.css">
<link rel="stylesheet" href="<?php echo base_url(); ?>css1/reset1.css"> 

<script type="text/javascript" src="<?php echo base_url(); ?>js1/gallery.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>js1/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>js1/jquery.elastislide.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>js1/jquery.tmpl.min.js"></script>

<?php 
        endforeach; 
    endif;
endif;
?>

<pre>
<?php
//print_r($asset_by_id);
?>
</pre>