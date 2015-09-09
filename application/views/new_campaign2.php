<!--    <script src="assets/jquery-1.7.2.min.js" type="text/javascript"></script> -->
<style type="text/css">
    /* BEGIN Fix map zoom */    
    #map_canvas img {max-width: inherit !important; max-height: inherit !important}
    #map img {max-width: inherit !important; max-height: inherit !important} 
    /* END Fix map zoom */      
</style>
<div style="height:0px; width: 0px;">
    <?php
        echo $map1['js'];
        echo $map1['html'];
    ?>

</div>
<div class="map">

</div>
<div class="breadcrumbs">
        <h1><span class="glyphicon glyphicon-list-alt"></span>RFP : : Create A New Campaign</h1>
    </div>
    <div class="main col-xs-12">
        <form method="post">
            <ul class="nav navbar-nav section-menu">
                <li class="active"><a href="../new_campaign/headerInfo">Search</a></li>
                <li><a href="../new_campaign/ad_campaigns">All Campaigns</a></li>
                <li><a href="../new_campaign/quotesFromOperator">Quotes From Operator</a></li>
            </ul>
        </form>


    <div class="clear"></div>
    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        Please Choose Desired Locations For Your Campaign
    </div>

    <br>

    <?php
        $attributes = array('id' => 'newCampaign'); // for validator
        echo form_open('new_campaign/saveCampaignSummaryHeaderInfo', $attributes);
    ?>
    <div class="form-error alert alert-danger input-errors" id="input-errors">

    </div>
    <div class="top_form">
        <div class="row">
            <div class="col-sm-5">
                <p>
                    <label for="camp_title">Campaign Title</label>
                    <input type="text" name="camp_title" id="camp_title" class="form-control" data-validation="required" data-validation-error-msg="Please specify the Campaign title"/>
                </p>
            </div>

            <div class="col-sm-3 mef_family">
                <p>
                    <label for="mef_id">Choose Media Family</label>
                    <select name="mef_id[]" id="mef_id" data-placeholder="Select Media Type" style="width:100%;" multiple="multiple" class="select2dropdown" tabindex="8">
                        <?php foreach ($my_families as $data) {
                            echo "<option value='".$data->mef_description."'>".$data->mef_description."</option>";
                        }?>
                    </select>
                </p>
            </div>

            <div class="col-sm-4 mec_type">
                <p>
                <label for="mec_id">Choose Media Type</label>
                <div id="media_types">
                    <select name="mec_id[]" id="mec_id" data-placeholder="Select Media Type" style="width:100%;" multiple="multiple" class="select2dropdown" tabindex="8">
                        <?php foreach ($all_media as $data) {
                            echo "<option value='".$data->description."'>".$data->description."</option>";
                        }?>
                    </select>
                </div>
                </p>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-sm-4">
                <p>
                    <label for="first_name">Budget</label>
                    <input type="text" name="budget" id="budget" class="form-control" data-validation="number" data-validation-error-msg="Please enter a valid budget amount"/>
                </p>
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <p class="col-sm-2">
                        <label for="first_name">From Date</label>
                        <input type="date" name="from_date" id="from_date" class="form-control datepicker" data-validation="date" data-validation-error-msg"Please specify a valid start date">
                    </p>
                    <p class="col-sm-2">
                        <label for="first_name">To Date</label>
                        <input type="date" data-date name="to_date" id="to_date" class="form-control datepicker" data-validation="date" data-validation-error-msg="Please specify a valid end date">
                    </p>
                    <p class="col-sm-2">
                        <label for="respond_date">Respond By</label>
                        <input type="date" data-date name="respond_date" id="respond_date" class="form-control datepicker" data-validation="date" data-validation-error-msg="Please specify a valid 'Respond by' date">
                    </p>
                    <p class="col-sm-6">
                        <label for="description">Description</label>
                        <textarea class="form-control" rows="3" name="description" id="description" data-validation="required" data-validation-error-msg="Please provide a description of your campaign"></textarea>
                    </p>
                </div>
            </div>

            <div class="col-sm-2">
                <label for="first_name">&nbsp;</label><br>
                <input type="checkbox" checked="checked" name="partial_availability" id="partial_availability">
                <label for="partial_availability">Partial Availability</label><br>

            </div>
        </div>
        <div class="clear"></div>
    </div>

    <br>

    <div class="row">
        <div class="col-xs-4">
            <!-- Begin validation error messages -->
            <span id="error-message-wrapper">
            </span>
            <!-- End validation error messages -->

            <p><label for="first_name">Enter Locations Required</label></p>


            <input class="form-control" type="text" id="myPlaceTextBox" placeholder="Enter a location" autocomplete="off"/><br />

            <p>
                <ul class="interests_wrapper" id="likes">

                </ul>
        </div>
        <div class="col-xs-8">
            <div id="map" class="pul-right" style="width: 100%; height: 500px"></div>

        </div>
    </div>
<br /><br />
        <div class="row text-center">
            <div id="map_images" style="width: 100%; height: 200px;"></div>
        </div>

    <p><input type="button" value="Back" class="btn btn-default"/>
    <input type="button" value="Next" id="next" class="btn btn-success"/>

    <?php echo form_close(); ?>

    <!-- begin form validation -->
    <script type="text/javascript">



    </script>
    <!-- end form validation -->

    <!--Main -->

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
    <!-- Mapping Requirements -->

    <!---->
    <div class="cloned" style="margin-top: 2em;">
        <p>The data object in cache.</p>
    </div>
    <!---->
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">
    <!-- Maps already loaded from php -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMapRFC.js"></script>
    <script type="text/javascript" src="<? echo base_url(); ?>assets/js/maps.josh.js"></script>
</div>

