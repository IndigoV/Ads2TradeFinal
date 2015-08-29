<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>RFP : : Process RFP</h1>
</div>
<div class="main col-xs-12">
    <form method="post">
        <ul class="nav navbar-nav section-menu">
            <li><a href="../new_campaign/proposals" class="active">Incoming Quotations</a></li>
            <li><a href="../new_campaign/accepted_proposals">Accepted Proposals</a></li>
            <li><a href="../new_campaign/campaigns">New Request For Proposals</a></li>
        </ul>


        <div class="clear"></div>

        <div class="alert alert-info" role="alert">
            <span class="glyphicon glyphicon-info-sign"></span>
            Please Choose Desired Locations For Your Campaign
        </div>

        <br>
    </form>


    <div class="row">
        <div class="col-sm-3">
            <div class="side_info_box nmt">
                <h3>Campaign Details</h3>

                <p>Title:<br> <strong><?php echo $campaign->cam_title; ?></strong></p><br/>

                <p>Budget:<br> <strong><?php echo $campaign->cam_budget; ?></strong></p><br/>

                <p>Start Date:<br> <strong><?php echo $campaign->cam_requested_start_date; ?></strong></p>
                <br/>

                <p>End Date:<br> <strong><?php echo $campaign->cam_requested_end_date; ?></strong></p><br/>

                <p>Respond By DateRespond By Date:<br>
                    <strong><?php echo $campaign->cam_requested_response_date; ?></strong></p><br/>

                <p>Partial Availablity:<br>
                    <strong><?php echo $campaign->cam_partial_availability_status; ?></strong></p><br/>

                <p>Description:<br> <strong><?php echo $campaign->cam_description; ?></strong></p><br/>

            </div>
        </div>


        <?php
        $data = array('onsubmit' => "sendToMediaOwner");
        echo form_open('new_campaign/campaigns', $data);
        ?>
        <div class="col-sm-9">
            <?php
            $count = 0;
            $inArrayLocations = array();
            foreach ($media as $locations => $location) {
                $selectedAssetsMain = array();
                $assetsInLocationMain = array();
                $c = 0;
                ?>
                <h4 class="h3"><span class="glyphicon glyphicon-map-marker"
                                     aria-hidden="true"></span> <?php echo $locations; ?></h4>
                <table class="table table-striped">
                    <thead>
                    <th>Media Type</th>
                    <th width="350">More Option Sizes Requested</th>
                    <th width="200">Quantity Requested</th>
                    <th width="150">&nbsp;</th>
                    </thead>
                    <tbody>
                    <?php
                    foreach ($location as $type => $items) {
//                        echo '<pre>';
//                        print_r($items);
//                        echo '</pre>';
                        $rfpForSubmissionMediaCategoriesID = $items['rfp_for_submission_media_categories_id'];
                        $rfp_for_submission_id = $items['rfp_for_submission_id'];
                        $rfp_for_location_id = $items['rfp_for_location_id'];
                        $media_category_id = $items['media_category_id'];
                        $quantity = $items['quantity'];
                        $mec_id = $items['mec_id'];
                        $mec_description = $items['mec_description'];
                        $mam_id = $items['mam_id'];
                        $mec_tearsheet_printing = $items['mec_tearsheet_printing'];
                        $mec_editions_mandatory = $items['mec_editions_mandatory'];
                        $mec_contractor = $items['mec_contractor'];
                        $mec_time_dependant = $items['mec_time_dependant'];
                        $mec_height_dependant = $items['mec_height_dependant'];
                        $mec_site_dependant = $items['mec_site_dependant'];
                        $mec_interval_billing = $items['mec_interval_billing'];
                        $mec_base_rate = $items['mec_base_rate'];
                        $mec_rate_card_nett = $items['mec_rate_card_nett'];
                        $rlm_id = $items['rlm_id'];
                        $mec_export_code = $items['mec_export_code'];
                        $mef_id = $items['mef_id'];
                        $more_options = $items['more_options'];
                        $assetsInLocation = $items['assetsInLocation'];
                        $selectedAssets = $items['selectedAssets'];
                        $qty = $items['quantity'];
                        $mainLat = $items['lat'];
                        $mainLng = $items['lng'];

                        $assetsInLocationMain[$c] = $assetsInLocation;
                        $selectedAssetsMain[$c] = $selectedAssets;
                        $c++;

                        $moreOptionsOptions = "";
                        for ($i = 0; $i < count($more_options); $i++) {
                            if ($i == 0) {
                                $moreOptionsOptions = $more_options[$i]->asi_description;
                            } else {
                                $moreOptionsOptions .= ", " . $more_options[$i]->asi_description;
                            }
                        }
                        ?>
                        <tr class="">
                            <td><?php echo strtoupper($type); ?><input type="hidden" name="media_type_detail"
                                                                       class="media_type_detail"
                                                                       value="<?php echo strtolower($type); ?>"/></td>
                            <td><?php echo $moreOptionsOptions; ?></td>
                            <td><?php echo $qty; ?></td>
                            <?php
                            if (count($assetsInLocation) > 0) {
                                ?>
                                <td width="50"><a href="#" class="btn btn-primary btn-sm openSelectAssetsModal" data-toggle="modal"
                                                  data-target="#selectAssetsModal" data-mecid="<?php echo $mec_id; ?>" data-location="<?php echo strtolower($locations); ?>" data-lat="<?php echo $mainLat; ?>" data-long="<?php echo $mainLng; ?>"><span
                                            class="glyphicon glyphicon-play"></span> Select Assets</a></td>
                            <?php
                            } else {
                                ?>
                                <td width="50"><a href="#" class="btn btn-default btn-sm openSelectAssetsModal"
                                                  class="glyphicon glyphicon-play" data-mecid="<?php echo $mec_id; ?>" data-location="<?php echo strtolower($locations); ?>" data-lat="<?php echo $mainLat; ?>" data-long="<?php echo $mainLng; ?>"></span> Select Assets</a></td>
                            <?php
                            }
                            ?>

                        </tr>
                    <?php
                    }
                    ?>
                    </tbody>
                </table>

                <?php
            }

            ?>

            <br/><br/>


        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="pull-right col-md-5">
                    <table>
                        <tr>
                            <td width="100"><h4>Total</h4></td>
                            <td width="220"><h3 class="h3">R <span id="price"><?php echo $totalForAllSelectedAssets; ?></span></h3></td>
                        </tr>
                    </table>
                </div>
                <div class="pull-right col-md-5">
                    <table>
                        <tr>
                            <td width="100"><h4>Total Discount</h4></td>
                            <td width="220"><h3 class="h3">R <input type="text" class="form-control input-sm" value="<?php echo $discountForAllSelectedAssets; ?>" readonly name="discountedTotal" id="discountedTotal"/></h3></td>
                        </tr>
                    </table>
                </div>
                <br /><br />
                <div class="clearfix"></div>
                <div class="pull-right col-md-5">
                    <div class="col-md-5">
                        <a href="#" data-target="#submitProposalToAdvertiser" data-toggle="modal"
                           id="btnSubmitProposalToAdvertiser"
                           class="btn btn-primary btn-block">Submit To Advertiser</a>
                    </div>

                    <div class="col-md-7 pull-right">
                        <input type="button" id="submitProposalToMediaOwner" class="btn btn-primary btn-block"
                               value="Submit To Media Owner"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <br /><br />
            <div class="col-lg-12">
                <table class="table table-striped">
                    <thead>
                    <th>Location</th>
                    <th>Type</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Name of Asset</th>
                    <th>Asset Price</th>
                    </thead>
                    <tbody id="body-list">

                    <?php

                        for($i = 0; $i < count($moSelectedAssets); $i++) {
                            $asset = $moSelectedAssets[$i];
                            $rfpID = $asset->rfp_for_submission_id;
                            $mecid = $asset->media_categories_id;
                            $assetID = $asset->asset_id;
                            $mediaOwnerID = $asset->from_id;
                            $media_category_description = $asset->mec_description;
                            $location = $asset->location;
                            $assetName = $asset->ass_name;
                            $startDate = $asset->from_date;
                            $endDate = $asset->to_date;
                            $price = (isset($asset->ass_production_price_SCY)) ? $asset->ass_production_price_SCY : '0';

                            echo '<tr id="selectedasset_'. $assetID .'" data-assetID="'. $assetID .'">';

                            echo '<td data-location="'. strtolower($location) .'">'. $location .'</td>';
                            echo '<td data-type="'. $mecid .'">'. $media_category_description .'</td>';
                            echo '<td><input type="date" class="form-control" data-location="'. strtolower($location) .'" data-assetid="'. $assetID .'" id="start_date" value="'. $startDate .'"/></td>';
                            echo '<td><input type="date" class="form-control" data-location="'. strtolower($location) .'" data-assetid="'. $assetID .'" id="end_date" value="'. $endDate .'"/></td>';
                            echo '<td data-assetname="'. $assetName .'">'. $assetName .'</td>';
                            echo '<td data-price="'. $price .'">'. $price .'</td>';
                            echo '<td><span class="glyphicon glyphicon-remove remove-asset" data-location="'. strtolower($location) .'" data-mecid="'. $mecid .'" data-assetid="'. $assetID .'"></span></td>';

                            echo '<tr>';

                        }

                    ?>

                    </tbody>
                </table>
            </div>
        </div>
        <?php echo form_close(); ?><!--Main -->
    </div>

    <div class="modal fade" id="submitProposalToAdvertiser" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Submit to Advertiser</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you would like to submit the proposal to the advertiser as it is now?</p>

                    <p><strong>Note:</strong> Any changes you have made, that are not accepted by the media owner,
                        will be lost.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <a href="submitProposalToAdvertiserFinalApproval?id=<?php echo $_GET['id']; ?>&&moid=<?php echo $_GET['moid']; ?>" class="btn btn-primary" id="submitProposalToAdvertiserFinalApproval">Submit Proposal To Advertiser</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade submitProposalToAdvertiserModal" id="submitProposalToAdvertiser" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog submitAdvertiserModalWindow">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Submit to Media Owner</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you would like to submit the proposal with your edits to the media owner?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-default" id="submitProposalToAdvertiserFinalApproval">
                        Submit Proposal To Advertiser
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal For Map -->
    <div class="modal fade choose-asset-modal" id="selectAssetsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog assetsModalWindow">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Choose as Asset</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5">
                            <div id="map" class="pul-right" style="width: 100%; height: 250px"></div>
                        </div>
                        <small>
                            <div class="no_assets">
                                <p>Sorry, there are no assets in this area. <a href="../load_stock">Click here to add more assets</a></p>
                            </div>
                            <div class="col-md-7">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th width="40">&nbsp;</th>
                                        <th width="160"><small>Asset Name</small></th>
                                        <th width="50"><small>Selling Price</small></th>
                                    </tr>
                                    </thead>
                                    <tbody id="asset_body">

                                    </tbody>
                                </table>
                            </div>
                        </small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeAssetsModalWindow">Close</button>
                    <button type="button" class="btn btn-primary saveChangesMediaOwner">Save changes</button>
                </div>
            </div>
        </div>
    </div>

<?php
$allAssetSelectedItems = array();
$alreadyInLocationArray = array();
$count = 0;
//echo '<pre>';
//print_r($moSelectedAssets);
//echo '</pre>';
for($i = 0; $i < count($moSelectedAssets); $i++) {
    $asset = $moSelectedAssets[$i];
    $position = explode(',', $asset->position);
    $assetID = $asset->ass_id;
    $address = $asset->ass_address;
    $price = (isset($asset->ass_production_price_SCY)) ? $asset->ass_production_price_SCY : '0';
    $cost = 0;
    $mecID = $asset->mec_id;
    $type = $asset->mec_description;
    $assetItemName = $asset->ass_name;
    $lat = $position[0];
    $lng = $position[1];
    $location = $asset->location;
    $start = $asset->from_date;
    $end = $asset->to_date;

    $assetItem = array(
        'asset_id' => $assetID,
        'price' => $price,
        'cost' => "no",
        'mec_id' => $mecID,
        'asset_name' => $assetItemName,
        'lat' => $lat,
        'long' => $lng,
        'type' => $type,
        'location' => $location,
        'address' => $address,
        'start' => $start,
        'end' => $end
    );

    $allAssetSelectedItems[strtolower($location)][$mecID][$assetID] = $assetItem;
}
$allAssetItems = array();
$count = 0;
foreach($allAssets as $location => $assetType) {
    if(!in_array($location, $alreadyInLocationArray)) {
        // is new location

        foreach($assetType as $assetName => $asset) {
            $count = 0;
            for($i = 0; $i < count($asset); $i++) {
                if(isset($asset[$i])) {

                    $position = explode(',', $asset[$i]['position']);
                    $assetID = $asset[$i]['ass_id'];
                    $address = $asset[$i]['ass_address'];
                    $price = (isset($asset[$i]['ass_production_price_SCY'])) ? $asset[$i]['ass_production_price_SCY'] : '0';
//                    $cost = (isset($asset[$i]['ass_production_cost_BCY'])) ? $asset[$i]['ass_production_cost_BCY'] : 'no';
                    $cost = 'no';
                    $mecID = $asset[$i]['mec_id'];
                    $type = $asset[$i]['mec_description'];
                    $assetItemName = $asset[$i]['ass_name'];
                    $lat = $position[0];
                    $lng = $position[1];

                    $assetItem = array(
                        'asset_id' => $assetID,
                        'price' => $price,
                        'cost' => "no",
                        'mec_id' => $mecID,
                        'asset_name' => $assetItemName,
                        'lat' => $lat,
                        'long' => $lng,
                        'type' => $type,
                        'address' => $address,
                        'location' => strtolower($location)
                    );
                    $allAssetItems[strtolower($location)][$mecID][$count] = $assetItem;
                    $count++;
                }
            }
        }
    }
}
echo '<pre>';
print_r($moSelectedAssets);
echo '</pre>';
?>
    <script>

        var startDate = "";
        <?php
            if(isset($campaign->cam_requested_start_date)) {
                ?>
                    startDate = "<?php echo $campaign->cam_requested_start_date; ?>";
                <?php
            }
        ?>


        var endDate = "";
        <?php
            if(isset($campaign->cam_requested_end_date)) {
                ?>
                    endDate = "<?php echo $campaign->cam_requested_end_date; ?>";
                <?php
            }
        ?>


        var selectedAssetsWithDates = {};
        var allAssetItems = {};
        <?php
            if(count($allAssetItems) > 0) {
                ?>
                    allAssetItems = <?php echo json_encode($allAssetItems); ?>;
                <?php
            }
        ?>

        var allassets = {};
        <?php
            if(count($allAssetSelectedItems) > 0) {
                ?>
                    allassets = <?php echo json_encode($allAssetSelectedItems) ?>;
                <?php
            }
         ?>
        var allPrices = {};
        var alreadyInList = {};
        var assetsSelected = [];
        var assetsSelectedTemp = [];

        for(var asset in allassets) {
            asset = allassets[asset];
            for(var mecid in asset) {
                var items = asset[mecid];
                for(var item in items) {
                    item = items[item];
                    console.log(item.location);
                    if(!selectedAssetsWithDates.hasOwnProperty(item.asset_id)) {
                        selectedAssetsWithDates[item.asset_id] = {};
                    }

                    if(!selectedAssetsWithDates[item.asset_id].hasOwnProperty(item.location)) {
                        selectedAssetsWithDates[item.asset_id][item.location] = {};
                    }

                    var price = item.price;
                    if(item.price == "") {
                        price = 0;
                    }

                    console.log(price);

                    selectedAssetsWithDates[item.asset_id][item.location] = {
                        start: item.start,
                        end: item.end,
                        location: item.location,
                        mecid: mecid,
                        price: price,
                        cost: item.cost,
                        lat: item.lat,
                        lng: item.long,
                        assetName: item.asset_name,
                        type: item.type,
                        assetID: item.asset_id
                    };

                    if(!alreadyInList.hasOwnProperty(item.location)) {
                        alreadyInList[item.location] = {};
                    }
                    if(!alreadyInList[item.location].hasOwnProperty(item.type)) {
                        alreadyInList[item.location][item.type.toLowerCase()] = [];
                    }
                    if(!(alreadyInList[item.location][item.type.toLowerCase()].indexOf(item.asset_id) > -1)) {
                        alreadyInList[item.location][item.type.toLowerCase()].push(item.asset_id);
                    }

                    var c = -1;
                    if(!(allPrices.hasOwnProperty(item.location))) {
                        allPrices[item.location] = {};
                        c = -1;
                    }

                    if(!(allPrices[item.location].hasOwnProperty(mecid))) {
                        allPrices[item.location][mecid] = {};
                    }

                    if(!(allPrices[item.location][mecid].hasOwnProperty(item.asset_id))) {
                        allPrices[item.location][mecid][item.asset_id] = [];
                    }

                    allPrices[item.location][mecid][item.asset_id].push(price);
                }
            }
        }

        var finalPrice = 0;

    </script>
    <!-- /Modal For Map-->
<!--    <script src="--><?php //echo base_url(); ?><!--/assets/js/google.maps.search.josh.js"></script>-->