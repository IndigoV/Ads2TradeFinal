	<style>
    .modal.large {
        width: 80%;
    }
	</style>
    <div style="height:0px; width: 0px;">
	<?php
    echo $map1['js'];
    echo $map1['html'];
    ?>
        <?php
        $mainBudget = "";
        $optionsAlreadyAdded = array();
        $optionsModalData = array();
        $count = 0;

        foreach($media_all_other_options as $option => $value) {

            foreach($value as $val) {
                if(!in_array($option, $optionsAlreadyAdded)) {
                    // not in array
                    $optionsModalData[$option] = array();
                    foreach($val as $v) {
                        $optionsModalData[$option][$count]['asi_id'] = $v['asi_id'];
                        $optionsModalData[$option][$count]['asi_description'] = $v['asi_description'];
                        $optionsModalData[$option][$count]['mec_id'] = $v['mec_id'];
                        $optionsModalData[$option][$count]['meu_id'] = $v['meu_id'];
                        $optionsModalData[$option][$count]['asi_photo_url'] = $v['asi_photo_url'];
                        $optionsModalData[$option][$count]['asi_quantity'] = $v['asi_quantity'];
                        $optionsModalData[$option][$count]['asi_width'] = $v['asi_width'];
                        $optionsModalData[$option][$count]['asi_length'] = $v['asi_length'];
                        $optionsModalData[$option][$count]['asi_printable_length'] = $v['asi_printable_length'];
                        $optionsModalData[$option][$count]['asi_page_trim_width'] = $v['asi_page_trim_width'];
                        $optionsModalData[$option][$count]['asi_notes'] = $v['asi_notes'];
                        $optionsModalData[$option][$count]['asi_page_trim_length'] = $v['asi_page_trim_length'];
                        $optionsModalData[$option][$count]['asi_frequency'] = $v['asi_frequency'];
                        $optionsModalData[$option][$count]['asi_frequency_meu_id'] = $v['asi_frequency_meu_id'];
                        $optionsModalData[$option][$count]['asi_size'] = $v['asi_size'];
                        $optionsModalData[$option][$count]['asi_size_meu_id'] = $v['asi_size_meu_id'];
                        $optionsModalData[$option][$count]['mec_description'] = $v['mec_description'];
                        $optionsModalData[$option][$count]['meu_description'] = $v['meu_description'];
                    }


//                $optionsModalData[$option]['asi_id'] = $val['asi_id'];

                    // add to array
                    $optionsAlreadyAdded[] = $option;
                    $count++;
                } else {
                    // already in array
                    foreach($val as $v) {
                        $optionsModalData[$option][$count]['asi_id'] = $v['asi_id'];
                        $optionsModalData[$option][$count]['asi_description'] = $v['asi_description'];
                        $optionsModalData[$option][$count]['mec_id'] = $v['mec_id'];
                        $optionsModalData[$option][$count]['meu_id'] = $v['meu_id'];
                        $optionsModalData[$option][$count]['asi_photo_url'] = $v['asi_photo_url'];
                        $optionsModalData[$option][$count]['asi_quantity'] = $v['asi_quantity'];
                        $optionsModalData[$option][$count]['asi_width'] = $v['asi_width'];
                        $optionsModalData[$option][$count]['asi_length'] = $v['asi_length'];
                        $optionsModalData[$option][$count]['asi_printable_length'] = $v['asi_printable_length'];
                        $optionsModalData[$option][$count]['asi_page_trim_width'] = $v['asi_page_trim_width'];
                        $optionsModalData[$option][$count]['asi_notes'] = $v['asi_notes'];
                        $optionsModalData[$option][$count]['asi_page_trim_length'] = $v['asi_page_trim_length'];
                        $optionsModalData[$option][$count]['asi_frequency'] = $v['asi_frequency'];
                        $optionsModalData[$option][$count]['asi_frequency_meu_id'] = $v['asi_frequency_meu_id'];
                        $optionsModalData[$option][$count]['asi_size'] = $v['asi_size'];
                        $optionsModalData[$option][$count]['asi_size_meu_id'] = $v['asi_size_meu_id'];
                        $optionsModalData[$option][$count]['mec_description'] = $v['mec_description'];
                        $optionsModalData[$option][$count]['meu_description'] = $v['meu_description'];
                    }
                    $count++;
                }
            }
        }

        // loop through $optionsModalData to get all data for modal windows:
        //Array
        //(
        //    [bus (Digital)] => Array
        //    (
        //        [0] => Array
        //        (
        //            [asi_id] => 38
        //                    [asi_description] => A0
        //                    [mec_id] => 3
        //                    ...
        //                )
        //
        //            [1] => Array
        //(
        //                    [asi_id] => 39
        //                    [asi_description] => A1
        //                    [mec_id] => 3
        //                    ...
        //                )
        //
        //            [2] => Array
        //                    (
        //                    [asi_id] => 40
        //                    [asi_description] => A2
        //                    [mec_id] => 3
        //                    ...
        //                )
        //
        //        )
        //
        //    [street pole (Digital)] => Array
        //(
        //    [3] => Array
        //    (
        //                    [asi_id] => 44
        //                    [asi_description] => A0
        //                    [mec_id] => 5
        //                    ...
        //                )
        //
        //            [4] => Array
        //(
        //                    [asi_id] => 45
        //                    [asi_description] => A1
        //                    [mec_id] => 5
        //                    ...
        //                )
        //
        //            [6] => Array
        //(
        //    [asi_id] => 47
        //                    [asi_description] => B0
        //                    [mec_id] => 5
        //                    ...
        //                )
        //    ...

        //    echo '<pre>';
        //    print_r($optionsModalData);
        //    echo '</pre>';
        ?>

    </div>
<body onload="">
<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>RFP : : Process RFP</h1>
</div>
<div class="main col-xs-12">
<form method="post">
    <ul class="nav navbar-nav section-menu">
        <li><a href="../new_campaign/proposals">Incoming Quotations</a></li>
        <li><a href="#">Accepted Proposals</a></li>
        <li class="active"><a href="#">New Request For Proposals</a></li>
    </ul>


    <div class="clear"></div>

    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        Please Choose Desired Locations For Your Campaign
    </div>

    <br>
</form>
<?php
//$dataw = array();
//$dataw['angu'] = $cats;

// $attributes = array('id' => 'campaigns');
$data = array('onsubmit' => "sendToMediaOwner");
echo form_open('new_campaign/campaigns', $data);

?>
    <?php
    $moreOptionsModalArray = array();
    $inarraycounter = 0;
    foreach($optionsModalData as $omd => $value) {
        $t = "";
        $t = str_replace("(", "", $omd);
        $t = str_replace(")", "", $t);
        $t = str_replace(" ", "", $t);
        $moreOptionsModalArray[$inarraycounter] = strtolower($t);
        $inarraycounter++;
    }
    ?>
<!--    <input type="hidden" name="moreoptionsmodalarray" id="moreoptionsmodalarray" value="--><?php // ?><!--"-->
<div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Campaign Title</th>
            <th>Campaign Budget</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Respond By Date</th>
            <th>Partial Availability</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>

        <?php
        //start of loop
        foreach ($rfps as $amai) {
            $mainBudget = $amai->cam_budget;
            ?>
            <tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <td><?php echo $amai->cam_title; ?><input type="hidden" name="camp_title" id="camp_title"
                                                      value="<?php echo $amai->cam_title; ?>"/></td>
            <td><strong><?php echo "R", number_format($amai->cam_budget, 2, ',', ' '); ?><input type='hidden'
                                                                                                name='camp_budget'
                                                                                                id="camp_budget"
                                                                                                value="<?php echo $amai->cam_budget; ?>"/></strong>
            </td>

            <td><?php echo $amai->cam_requested_start_date; ?><input type="hidden" name="start_date" id="start_date"
                                                                     value="<?php echo $amai->cam_requested_start_date; ?>"/></td>
            <td><?php echo $amai->cam_requested_end_date; ?><input type="hidden" name="end_date" id="end_date"
                                                                   value="<?php echo $amai->cam_requested_end_date; ?>"/></td>
            <td><?php echo $amai->cam_requested_response_date; ?><input type="hidden" name="respond_date" id="respond_by"
                                                                        value="<?php echo $amai->cam_requested_response_date; ?>"/></td>
            <td><?php
                if ($amai->partial_availability = "") {
                    echo $amai->cam_partial_availability_status;
                } else {
                    echo 'NO';
                }
                ?><input type="hidden" name="partial_availability"
                         id="partial_availability"
                         value="<?php echo $amai->cam_partial_availability_status; ?>"/></td>
            <td><?php echo $amai->cam_description; ?><input type="hidden" name="campaign_desc" id="campaign_desc"
                                                            value="<?php echo $amai->cam_description; ?>"/></td>
            </tr>



        <?php
        }
        //end of loop
        ?>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>

<?php
$user_type = $this->session->userdata('user_type');
if($user_type == 3){ //operator


    ?>
    <div class="row">
        <div class="col-xs-4">
            <p>
                <label for="first_name">Enter Locations Required</label>

            </p>


            <input class="form-control" type="text" id="myPlaceTextBox2"/><br />
            </p>

            <p>
            <p>

            <p>
            <ul class="interests_wrapper" id="likes">
                <?
                foreach($locations as $location) {
                    $url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=$location->lat,$location->long&sensor=false";

                    $data = file($url);
                    $address = "";

                    foreach ($data as $line_num => $line) {
                        if ( false != strstr( $line, "\"formatted_address\"" ) ) {

                            $addr = substr( trim( $line ), 22, -2 );
                            $addrArray = explode(',', $addr);
                            if(isset($addrArray[3])) {
                                $addr = $addrArray[1] . ', ' . $addrArray[3];
                            } else {
                                $addr = $addrArray[1];
                            }

                            $address = $addr;
                            echo '<li  class="location" data-location="'.$address.'">';
                                echo '<span class="title">'.$address.' </span>';
                                echo '<span class="" onclick="deleteMe()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></span>';
                                echo '<input type="hidden" name="chosen_location[]" value="'.$address.'">';
                                echo '<input type="hidden" name="latitude[]" value="'.$location->lat.'">';
                                echo '<input type="hidden" name="longitude[]" value="'.$location->long.'">';
                                echo '<input type="hidden" name="address[]" value="'.$address.'">';
                                echo '</li>';
                            break;
                        }
                    }
                }
                ?>
            </ul>

            <br>
            <br>
            <br>
            <p>
            </p>
        </div>

        <div class="col-xs-8 pull-right">
            <?
                // put all images here
//                foreach($screenshots as $screenshot) {
//                    echo '<div class="col-xs-3 marginBottom10">';
//                    echo '<a href="'.base_url().$screenshot.'" target="_blank"><img src="'.base_url().$screenshot.'" class="thumbnail" style="height: 75px; width: auto;" /></a>';
//                    echo '</div>';
//                }
            ?>
        </div>

    </div>
    <div class="row">
        <?
//            echo '<pre>';
//            var_dump($mec_stuffAll[0]->mef_description);
//            echo '</pre>';
        ?>
        <form class="">
        <div class="col-md-3">
            <p><label>Media Families:</label><br><strong>
                    <select name="mef_id[]" id="mef_id" data-placeholder="Select Media Type" style="width:100%;" multiple="multiple" class="select2dropdown" tabindex="8">
                        <?php
                            $arrayFamily = [];
                            if (isset($mec_stuffAll)) {
                                for($i = 0; $i < count($mec_stuffAll); $i++) {
                                    echo '<option value="'. ucwords($mec_stuffAll[$i]->mef_description) .'">' . ucwords($mec_stuffAll[$i]->mef_description) . '</option>';
                                }
//                                foreach ($mec_stuffAll as $k => $value) {
//                                    echo $k;
////                                    if(!in_array($value['mef_description'], $arrayFamily)) {
////                                        echo '<option value="'. ucwords($value['mef_description']) .'">' . ucwords($value['mef_description']) . '</option>';
////                                        $arrayFamily[] = $value['mef_description'];
////                                    }
//                                }
                            }
                        ?>
                    </select>
                </strong></p>

            <p></p>
        </div>
        <div class="col-md-6">
            <p><label>Media Types:</label><br><strong>
                    <select name="mec_id[]" id="mec_id" data-placeholder="Select Media Type" style="width:100%;" multiple="multiple" class="select2dropdown" tabindex="8">

                    </select>
                </strong></p>

            <p></p>
        </div>
        <div class="col-md-3">
            <p><label>&nbsp;</label><br><strong>
                <input type="button" id="addItem" class="btn btn-primary" value="Add Items">
            </strong></p>
            <p></p>
        </div>
        </form>
<!---->
<!--        <p>Media Types:<br/><strong>-->
<!--                --><?php
//                foreach ($mec_id as $key => $value) { //loop thru chosen media types
//                    print_r($value);
//                    echo '<br />';
//                }
//
//                ?>
<!--            </strong><input type="hidden" name="media_types[]" id="media_types" value="--><?//
//            foreach ($mec_id as $key => $value) {
//                echo $value . ',';
//            }
//            ?><!--"/></p>-->

        <p>&nbsp;</p>
    </div>

<?php } else { ?>
    <div class="row">
        <div class="col-xs-4">
            <p>
                <label for="first_name">Locations Required</label>
                <!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="addLocation(<?php echo $_GET['id'];?>)" class="btn btn-success">Add Location</button> -->

            </p>
        </div>
    </div>

<?php } ?>
<div class="clearfix"></div>
<br /><br />
<div class="row">
<div class="col-sm-12">
    <div class="tablesForContent">
    <?php
    $count = 0;
    $mapCounter = 0;
    $total_for_account = 0;
    $alreadyIn = array();
    if (isset($allAddresses) && is_array($allAddresses)) {
//        print_r($allAddresses);
        $counterForAsset = 0;
        $numberTable = 1;
        foreach ($allAddresses as $key) {
            if(!in_array($key['address'], $alreadyIn)) {
                $alreadyIn[] = $key['address'];
//            print_r($key);
////                    print_r($area_lat_long);
//                //LAT LONG
//                $area_lat_long[$count] = isset($area_lat_long[$count]) ? $area_lat_long[$count] : "-26.2041028, 28.047305100000017";
//    //                    echo $area_lat_long[$count];
//            echo '<strong>area: '. $key['address'] .'         <a class="glyphicon glyphicon-new-window" type="button" data-toggle="modal" data-target="#mapModal" data-latLng="'.$key['lat'] . ','. $key['long'] .'" style="cursor:pointer;"></a><br>';
//                $mapCounter++;?>
                <div class="row row-item-for-total-main">
                <input type="hidden" id="street_address" name="street_address[<?php echo $count; ?>]" class="street_address"
                       value="<?php echo $key['address']; ?>">
                <h4><span class="glyphicon glyphicon-map-marker"
                          aria-hidden="true"></span> <? echo $key['address']; ?>        <a
                        class="glyphicon glyphicon-new-window" type="button" data-toggle="modal"
                        data-target="#mapModal" data-latLng="<? echo $key['lat']; ?>,<? echo $key['long']; ?>"
                        style="cursor:pointer;"></a></h4>
                <table class="table table-striped">
                <thead>
                <th width="300">Media Type</th>
                <th width="140">Quanity Required</th>
                <th>Average Asset Price</th>
                <th>Price</th>
                <th width="100">&nbsp;</th>
                <th width="100">Select</th>
                </thead>
                <tbody>
                <?php
                    $j = 0;
                    $total_used = 0;
                    $total_bal = isset($budget) ? $budget : 0;
                    $qty = 0;
                    $i = 0;
                    $alreadyIn = array();
                    $alreadyInMedia = array();
       
                    foreach(array($key) as $place => $e) {
                        $locationForSelection = $e['address'];

                        for($c = 0; $c < count($average_price); $c++) {
                            $counter = 0;
                                if (isset($average_price[$c][$locationForSelection])) {


                                    foreach ($average_price[$c][$locationForSelection] as $type => $item) {
                                        $av_price = $item;
                                        $qty = 0;
                                        $total = 0.00;

                                        $t = str_replace("(", "", $media_types[$counter]);
                                        $t = str_replace(")", "", $t);
                                        $t = str_replace(" ", "", $t);
                                        if (!in_array($t, $alreadyInMedia)) {
                                            $alreadyInMedia[] = $t;
                                            ?>
                                            <tr class="asset_<?php echo $counterForAsset; ?> asset_item">

                                                <td><?php echo strtoupper($type); ?>
                                                    <input type="hidden"
                                                           value="<?php echo strtolower($media_types_id[$counter]); ?>"
                                                           id="media_category" name="mec_id[]"/>
                                                    <input type="hidden"
                                                           value="<?php echo strtolower($media_types[$counter]); ?>"
                                                           id="media_category" name="media_category[]"/>
                                                </td>
                                                <td>
                                                    <input type="text"
                                                           class="form-control input-sm q_asset_<? echo $counterForAsset; ?> med_quantity"
                                                           name="med_quantity[]" id="med_quantity"
                                                           placeholder="Quantity Required"
                                                           value="<? echo $qty; ?>"/>
                                                </td>
                                                <td>
                                                    <input type="text" readonly="true" name="avg_total[]"
                                                           id="asset_<? echo $counterForAsset; ?>"
                                                           class="form-control input-sm avg_asset avg_asset_<? echo $counterForAsset; ?>"
                                                           value="<? echo number_format($av_price, 2); ?>"/>
                                                </td>
                                                <td>
                                                    <input type="text" readonly="true" name="avg_total[]"
                                                           id="asset_<? echo $counterForAsset; ?>"
                                                           class="form-control input-sm rem_asset rem_asset_<? echo $counterForAsset; ?>"
                                                           value="0.00"
                                                           data-assetCounter="<?php  echo $counterForAsset; ?>"/>
                                                </td>
                                                <td width="50">
                                                    <a href="#"class="btn btnMoreOptions <?php  echo (!in_array(strtolower($t), $moreOptionsModalArray)) ? 'btn-default' : 'btn-primary'; ?> btn-sm" data-toggle="modal"
                                                       data-target="#<?php  echo (!in_array(strtolower($t), $moreOptionsModalArray)) ? 'OptionsModal' : strtolower($t).'OptionsModal'; ?>"
													   data-location="<?php echo $key['address']; ?>">
													   <!-- <?php echo strtolower($t);?> 
													   -->
													   <span
                                                            class="glyphicon glyphicon-play"></span> More options</a>
                                                </td>
                                                <td>
                                                    <center><input type="checkbox" name="checks[]"
                                                                   id="asset_<? echo $counterForAsset; ?>"
                                                                   data-categoryID="<?php echo $media_types_id[$counter]; ?>"
                                                                   data-counterForAsset="<?php echo $counterForAsset; ?>"
                                                                   class="check_asset_<? echo $counterForAsset; ?>"/>
                                                    </center>
                                                </td>
                                            </tr>
                                            <?php
								
                                            $i++;
                                            $counter++;
                                            $counterForAsset++;
                                        }
                                    }
                                }
                            }
                        }

                    }
?>
                    </tbody>
                </table>
            </div>
            <?php 
			 $checkboxVal = $_POST['moreOptionsCheckBox'];
			 $location_hidden = $_POST['hidden_location'];
			 
			 if ($location_hidden == $key['address'])
			 {
				foreach ($checkboxVal as $key=>$value)
				{
					$this->session->set_userdata("val", $value);
					$asi_id = $this->session->userdata('val');
					echo "<br/>".$asi_id."<br/>";
				}
				 
			 }
			
            $count++;
            $numberTable++;
        }
    }
    ?>
    </div>
</div>
    <div class="pull-right">
        <table>
            <tr>
                <td width="100"><h4>Total</h4></td>
                <td width="220"><h3 class="h3" id="lblSubtotalAll"><? echo number_format($total_for_account, 2); ?></h3><input type="hidden" id="subtotal" name="subtotal[]" value="<? echo number_format($total_for_account, 2); ?>"></td>
            </tr>
            <tr>
                <td width="100"><h4>Budget</h4></td>
                <td width="220"><h3 class="h3" id="lblBudgetAll"><? echo number_format($mainBudget, 2); ?></h3><input type="hidden" id="mainbudgetForInput" name="mainbudget[]" data-val="<?php echo $mainBudget; ?>" value="<? echo number_format($mainBudget, 2); ?>"></td>
            </tr>
            <tr>
                <td width="100"><h4>Estimated Difference</h4></td>
                <td width="220"><h3 class="h3" id="lblEstimatedDifferenceAll"><?php  ?></h3></td>
            </tr>
        </table>
    </div>
    <br />

    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-9">
            <p><label>Media Owners:</label><br><strong>
                    <select name="media_owners[]" id="media_owners" data-placeholder="Select Media Owner" style="width:100%;" multiple="multiple" class="select2dropdown">
                        <?php
                            $count = 0;
                            foreach($media_owners as $mediaOwner) {
                                echo '<option value="'.$mediaOwner->use_id.';'.$mediaOwner->use_first_name.';'.$mediaOwner->use_last_name.'">'.$mediaOwner->use_first_name.' '.$mediaOwner->use_last_name.'</option>';
                                $count++;
                            }

                        ?>
                    </select>
                </strong></p>

        </div>
        <div class="pull-right">
            <div class="col-md-3">
                <p><label>&nbsp;</label><br><strong>
                <input type="button" class="btn btn-success" value="Add Media Owner" id="addMediaOwnerBtn" />
                        </strong></p>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="clearfix"></div>

    <div class="row">
        <h3 class="h3">Media Owners</h3>
        <table class="table table-striped text-center">
            <thead>
                <tr>
                    <th>Media Owner</th>
                    <th width="150" class="text-center">Budget Sent</th>
                    <th width="200" class="text-center">Number of Assets</th>
                    <th width="200" class="text-center">Media Categories</th>
                </tr>
            </thead>
            <tbody class="media-owners-table">

            </tbody>
        </table>
    </div>

    <div class="clearfix"></div>
    <div class="pull-right">
        <div class="row">
            <div class="col-xs-6">
                <input type="button" class="btn btn-cancel" value="Cancel" data-toggle="modal" data-target="#cancelModal"/>
            </div>
            <div class="col-xs-6">
                <input type="button" class="btn btn-primary" value="Submit Campaign" id="saveCampaignSendToMediaOwner"/>
            </div>
        </div>
    </div>
</div>
</div>

<?php echo form_close(); ?><!--Main -->

<!--Main -->


<div id='modalbak' ></div>
<div id='modalwin' >


</div>


<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h3 class="h3 modal-title" id="myModalLabel">Are you sure you want to cancel your Request for Proposal?</h3>
            </div>
            <div class="modal-body">
                <button type="button" class="btn btn-default" data-dismiss="modal">Wait, no! Go Back!</button>
                <div class="pull-right">
                    <a href="../load_stock/active_bids" class="btn btn-primary">Cancel Proposal</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modalbak1"></div>
<div id="mapModal2">

</div>

<div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog" style="width: 75%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<h4 class="modal-title" id="myModalLabel">View Location Map</h4>
			</div>
			<div class="modal-body">
				<div id="map" style="width: 100%; height: 500px; display:none;" ></div> 
				<div id="campaign_map_canvas" style="width: 100%; height: 500px"></div>
				<div id="campaign_images" style="width: 100%; height: 800px;"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>

<?php
foreach($optionsModalData as $omd => $value) {
$t = str_replace("(", "", $omd);
$t = str_replace(")", "", $t);
$t = str_replace(" ", "", $t);
$moreOptionsModalArray[$inarraycounter] = strtolower($t);
$inarraycounter++;
?>
<div class="modal fade modal-window-more-options" id="<?php echo strtolower($t); ?>OptionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog optionsModalWindow">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Please Select the asset sizes</h4>
            </div>
            <div class="modal-body">

			<form name="document-submit-form"  id="document-submit-form" method="post"  enctype="multipart/form-data">
                <table class="table">
                    <thead>
                    <th width="100">&nbsp;</th>
                    <th>Descriptions</th>
                    <th>Printable Width</th>
                    <th>Printable Length</th>
                    <th>Duration</th>
                    </thead>
                    <tbody>
                    <?php
					//$default_value = $value; //used for default popup further below
					foreach($value as $v) {
							
						?>
						<?php
									if($v['asi_size'] != null) {
										$duration = $v['asi_size'] . ' sec';
									} else {
										$duration  = 'N/A';
									}
									?>
							<tr class="tr_<? echo $v['asi_id']; ?> tr_moreOptions">
								<td>
								<input type="checkbox" name="moreOptionsCheckBox[]" id="<?=$v['asi_id'];?>" class="moreOptions<? echo $v['asi_id']; ?> type<? echo strtolower($t); ?>" value="<?php echo "Description: $v[asi_description] Printable Width: $v[asi_description] Printable Length: $v[asi_height] Duration: $duration";?>">
								</td>
								<td><?php echo $v['asi_description']; ?></td>
								<td><?php echo $v['asi_width']; ?></td>
								<td><?php echo $v['asi_length']; ?></td>
								<td>
								<script>
									//$(e.currentTarget).find('input[name="hidden_location"]').val(locaiton);
								</script>
								</td>
							</tr>
							<?
							}
							?>
							 
					
					
					
                    </tbody>
                </table>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" onclick="document.document-submit-form.submit();" class="btn btn-primary saveChanges <? echo str_replace(" ", "-", $omd); ?>">Save changes</button>
					<input type="hidden" name="hidden_location" value="" class="hidden_location">
				</div>
				</form>
            </div>
        </div>
    </div>
</div>

<?php
}
$val = $_POST["moreOptionsCheckBox"];
					$this->session->set_userdata("val", $val);
					$val2 = $this->session->userdata('val'); 

			
?>

<!-- Default Size Options Popup if no match is found -->
<div class="modal fade modal-window-more-options" id="OptionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog optionsModalWindow">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Please Select the asset sizes</h4>
            </div>
            <div class="modal-body">

			<form name="document-submit-form"  id="document-submit-form" method="post"  enctype="multipart/form-data">
                <table class="table">
                    <thead>
                    <th width="100">&nbsp;</th>
                    <th>Descriptions</th>
                    <th>Printable Width</th>
                    <th>Printable Length</th>
                    <th>Duration</th>
                    </thead>
                    <tbody>
					
					<?php	
					//$value = $default_value; //see above
					foreach($value as $v) {
							
						?>
						<?php
									if($v['asi_size'] != null) {
										$duration = $v['asi_size'] . ' sec';
									} else {
										$duration  = 'N/A';
									}
									?>
							<tr class="tr_<? echo $v['asi_id']; ?> tr_moreOptions">
								<td>
								<input type="checkbox" name="moreOptionsCheckBox[]" id="<?=$v['asi_id'];?>" class="moreOptions<? echo $v['asi_id']; ?> type<? echo strtolower($t); ?>" value="<?php echo "Description: $v[asi_description] Printable Width: $v[asi_width] Printable Length: $v[asi_height] Duration: $duration";?>">
								</td>
								<td><?php echo $v['asi_description']; ?> <input type="hidden" name="moreOptionsItem[]" value="<? echo $v['asi_id']; ?>" id="moreOptionsItem<? echo $v['asi_id']; ?>"/></td>
								<td><?php echo $v['asi_width']; ?></td>
								<td><?php echo $v['asi_length']; ?></td>
								<td>
								<?php echo $duration; ?>
								</td>
							</tr>
							<?
							}
							?>
							 
					
					
					
                    </tbody>
                </table>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" onclick="document.document-submit-form.submit();" class="btn btn-primary saveChanges <? echo str_replace(" ", "-", $omd); ?>">Save changes</button>
					<input type="hidden" name="hidden_location" value="" class="hidden_location">
				</div>
				</form>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo base_url(); ?>/assets/js/google.maps.search.josh.js"></script>

<script>
/*
$('#btnMoreOptions').on('click',function(){
        alert('opening more options modal');
});   
*/
$( ".btnMoreOptions" ).click(function() {
  //get the ;locaton	
  var location = $(this).attr('data-location');	
  //alert( "Handler for .click() called." + location);
  // save it to your form
  $('.hidden_location').val(location); //when you submit your form this will also be sent as hidden_location & u can now use it in your arrays
});                          
</script> 
<!-- Mapping Requirements -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">
<!-- Maps already loaded from php -->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMapRFC.js"></script>
<script>

            
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("rfp_locations").deleteRow(i);
            }

            function mezmerize(address, lat, lon) {
                var table = document.getElementById("rfp_locations");
                var row = table.insertRow(3);
              
                var cell2 = row.insertCell(0);//cell 1
                var cell3 = row.insertCell(1);//cell 2
                var cell7 = row.insertCell(2);//cell 2(0)
                var cell4 = row.insertCell(2);//cell 3
                var cell6 = row.insertCell(3);//cell 4
               // var cell1 = row.insertCell(-1);//cell 5
                var cell5 = row.insertCell(4); //cell 6
               
                btn = '<input type="button" value="Delete Location" class="btn btn-danger" onclick="deleteRow(this)">';
                editbtn = '<input type="button" value="Edit Images" class="btn btn-danger" onclick="">';
                proxBtn = '<input type="text"  id="proximity" name="proximity" class="form-control" placeholder="No Proximity Sprcified" readonly />';
                myLat = '<input type="hidden"  id="lat[]" name="lat[]" value="' + lat + "," + lon + '"/>';
                myStreetAdd = '<input type="hidden"  id="streetAdd[]" name="streetAdd[]" value="' + address + '"/>';
                viewMap = '<button type="button" class="js-fire-modal btn btn-info" data-toggle="modal" data-target="#mapModal" data-latLng="' + lat + ',' + lon + '">View Map</button>';
                myCountry = address.substr(address.lastIndexOf(",") + 1);
		
                //cell 1
                cell2.innerHTML = address + myStreetAdd;
                //--------------------

                //cell 2
                cell3.innerHTML = btn;
                //----------------
                
                //cell 3
                cell4.innerHTML = viewMap;
                //--------------
                
                //cell 4
                cell6.innerHTML = " <strong>lat:</strong> " + lat + "\n <strong>lon:</strong> " + lon;
                //-------------
		
                //cell 5
               // cell1.innerHTML = address + myStreetAdd;
                //-------------
                
                //cell 6
                cell5.innerHTML = proxBtn + myLat; 
                //--------------
                
                //cell 7
                cell7.innerHTML = editbtn; 
                //--------------
          }
			
			var base_url = '<?php echo base_url(); ?>';
            var adsMap = false;
            function adsMapInit() {




                $('#mapModal').on('shown.bs.modal', function (e) {
                    var tmp_id = $(e.relatedTarget).attr('data-latLng');

                    var parts = tmp_id.split(',');
                    var position = new google.maps.LatLng(parts[0], parts[1]);

                    var mapOptions = {
                        center: position,
                        zoom: 10
                    };
                    var campaign_map = new google.maps.Map(document.getElementById("campaign_map_canvas"), mapOptions);


                    var selected_marker = new google.maps.Marker({
                        position: position,
                        map: campaign_map,
                        icon: base_url + 'assets/mapping/images/user_marker.png'
                    });
                    var optOptions = {
                        urlBase: base_url,
                        markers: [selected_marker],
                        showRadii: true,
                        currentFilterCriteria: {},
                        showSearchPOIButton: true,
                        showFilterButton: true
                    };
                    var clusterOptions = {};
                    var spiderOptions = {};
                    var html2canvasOptions = {
                        logging: true
                    };
                    adsMap = new AdsMap(campaign_map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
                    google.maps.event.trigger(campaign_map,'resize');

                    var campaign = new AdsMap.Campaign(adsMap, {url: base_url + 'index.php/new_campaign/upload_campaign/?id=<?php echo $amai->cam_id; ?>', onsuccess: function() {
                            console.log('here');
                            $('#mapModal').modal('hide');
                            alert('Succesfully posted images');
                        }}, {id: tmp_id});
                    $('#campaign_images').html(campaign.edit());
                });

            }
            google.maps.event.addDomListener(window, 'load', adsMapInit);



        </script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function() {
     
                $.post( 
                base_url + '/index.php/new_campaign/saveCampaign',
                { name: $('#campaign_desc').val(),
                    budget: $('#camp_budget').val()},
                function(data) {
                    //$('#stage').html(data);
                }

            );
            });
</script>