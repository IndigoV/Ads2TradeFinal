<?php include("Layouts/header.php"); ?>

    <div style="padding-left: 25px;">
        <br />
            <a href="../new_campaign/view_campaign_quotations?id=<?php echo $campaignDetails[0]->cam_id; ?>" class="btn btn-default" > << Back </a>
    </div>

    <div class="breadcrumbs">
        <h1><span class="glyphicon glyphicon-list-alt"></span><a href="#">RFP</a> / View Campaign</h1>
    </div>


    <form method="post" class="main">

    <div class="row">
        <div class="col-sm-3">
            <div class="side_info_box nmt">
                <h3>Campaign Details</h3>
                <p>Title:<br> <strong><?php echo $campaignDetails[0]->cam_title; ?></strong></p><br />
                <p>Budget:<br> <strong><?php echo $campaignDetails[0]->cam_budget; ?></strong></p><br />
                <p>Start Date:<br> <strong><?php echo $campaignDetails[0]->cam_requested_start_date; ?></strong></p><br />
                <p>End Date:<br> <strong><?php echo $campaignDetails[0]->cam_requested_end_date; ?></strong></p><br />
                <p>Respond By Date:<br> <strong><?php echo $campaignDetails[0]->cam_requested_response_date; ?></strong></p><br />
                <p>Partial Availablity:<br> <strong>No</strong></p><br />
                <p>Description:<br> <strong><?php echo $campaignDetails[0]->cam_description; ?></strong></p><br />
            </div>
        </div>

        <div class="col-sm-9">

            <?php
            //                    echo '<pre>';
            //                    print_r($allCampaignDetails);
            //                    echo '</pre>';
            $count = 0;
            foreach($allCampaignDetails as $campaign => $details) {
//                        $areaDetails = explode(',', $campaign);
                $location = $campaign;
//                        echo $location;
//                        echo '<pre>';
//                        print_r($details);
//                        echo '</pre>';
                ?>
                <input type="hidden" id="street_address" name="street_address[<?php echo $count; $count++; ?>]" class="street_address"
                       value="<?php echo $location; ?>">
                <h3 class="h3"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> <?php echo $location; ?></h3>
                <table class="table table-striped">
                    <thead>
                    <th>Media Type</th>
                    <th width="250">More Option Sizes Requested</th>
                    <th>Quantity Requested</th>
                    <th width="150">&nbsp;</th>
                    </thead>
                    <tbody>

                    <?php
                    foreach($details as $detail => $moreOptions) {
//                                    echo $moreOptions[0];
//                                    exit;
//                                    echo '<pre>';
//                                    print_r($moreOptions);
//                                    echo '</pre>';
                        $moreO = $moreOptions['more_options'];

                        $qty = $moreOptions['quantity'];
                        $mo = $moreO;
                        $lat = $moreOptions['lat'];
                        $long = $moreOptions['long'];
//                                    foreach($moreO as $option) {
//                                        $mo = $option;
//                                    }
                        $mec_id = $moreOptions['cat_id'];
                        ?>
                        <tr class="asset_<?php echo $mec_id; ?> asset_item">
                            <td><?php echo strtoupper($detail); ?> <input type="hidden" name="media_type_detail" class="media_type_detail <?php echo strtolower($detail); ?>" /></td>
                            <td><?php echo $mo; ?><input type="hidden" class="form-control input-sm" value=""></td>
                            <td><?php echo $qty; ?></td>
                            <!--<td width="50"><a href="#" class="btn btn-primary btn-sm openSelectAssetsModal" data-lat="<?php echo $lat; ?>" data-mecid="<?php echo $mec_id; ?>" data-long="<?php echo $long; ?>" data-location="<?php echo $location; ?>" data-toggle="modal" data-target="#selectAssetsModal"><span class="glyphicon glyphicon-play"></span> Select Assets</a></td>-->
                        </tr>
                    <?php

                    }
                    ?>

                    </tbody>
                </table>

            <?php

            }

            ?>
            <div class="pull-right">
                <table>
                    <tr>
                        <td width="100"><h4>Total</h4></td>
                        <td width="220"><h3 class="h3">R <span id="price"><?php echo ($totalAmount > 0) ? $totalAmount : ''; ?></span></h3></td>
                    </tr>
                </table>
            </div>
            <br /><br />
            <div class="clearfix"></div>
            <!--<div class="pull-right">
                <table>
                    <tr>
                        <td width="100"><h4>Total Price after discount</h4></td>
                        <td width="220"><h3 class="h3">R <input type="text" value="<?php echo ($discountAmount > 0) ? $discountAmount : ''; ?>" name="discountedTotal" id="discountedTotal" class="form-control input-sm"/></h3></td>
                    </tr>
                </table>
            </div>-->
            <br /><br />
            <div class="clearfix"></div>
            <!--<div class="pull-right">
                <table>
                    <tr>
                        <?php
                        $user_type = $this->session->userdata('user_type');
                        if ($user_type <> 2)
                        {
                            ?>
                            <td width="220"><input type="button" id="acceptOperatorsProposal" value="Accept Proposal" class="btn btn-primary"></td>
                        <?php
                        }
                        ?>
                        <td width="220"><input type="button" id="saveSendToOperator" value="Send Proposal to Operator" class="btn btn-primary"></td>
                    </tr>
                </table>
            </div>-->
        </div>
    </div>

    <div class="row">
        <?php if(isset($comment) && $comment != null) {?>
            <div class="col-md-12">
                <div class="col-sm-12">
                    <br />
                    <div class="alert alert-info"><span style="font-weight: bold">Comment: </span> <?php echo $comment->comments; ?> ( <?php echo $comment->created_at; ?> )</div>
                </div>
            </div>
        <?php } ?>
        <div class="col-lg-12">
            <table class="table table-striped">
                <thead>
                <th>Location</th>
                <th>Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Name of Asset</th>
                <th>Asset Price</th>
                <th>Asset Cost</th>
                <th>Discount (%)</th>
                </thead>
                <tbody id="body-list">
                <?php
                $assetsSelected = array();
                $alreadyInList = array();
                $selectedAssetsWithDate = array();
                $allPrices = array();
                $assetsAlreadySelected = "false";

                for($i = 0; $i < count($allSelectedAssets); $i++) {
                    $asset = $allSelectedAssets[$i];
                    $tempAsset = array();

                    $tempAsset['rfp_for_submission_id'] = $asset->rfp_for_for_submission_id;
                    $tempAsset['media_categories_id'] = $asset->media_categories_id;
                    $tempAsset['asset_id'] = $asset->asset_id;
                    $tempAsset['accepted_by_operator'] = $asset->accepted_by_operator;
                    $tempAsset['from_id'] = $asset->from_id;
                    $tempAsset['to_id'] = $asset->to_id;
                    $tempAsset['transaction_date'] = $asset->transaction_date;
                    $tempAsset['from_date'] = $asset->from_date;
                    $tempAsset['to_date'] = $asset->to_date;
                    $tempAsset['active'] = $asset->active;
                    $tempAsset['completed'] = $asset->completed;
                    $tempAsset['asset_location'] = $asset->location;
                    $tempAsset['asset_name'] = $asset->ass_name;
                    $tempAsset['asset_description'] = $asset->ass_description;
                    $tempAsset['position'] = $asset->position;
                    $tempAsset['asset_ref'] = $asset->ass_ref;
                    $tempAsset['cost'] = (isset($asset->ass_production_cost_BCY)) ? $asset->ass_production_cost_BCY : '0';
                    $tempAsset['price'] = (isset($asset->ass_production_price_SCY)) ? $asset->ass_production_price_SCY : '0';
                    $tempAsset['street_address'] = $asset->ass_street_address;
                    $tempAsset['city'] = $asset->ass_city;
                    $tempAsset['province'] = $asset->ass_province;
                    $tempAsset['country'] = $asset->ass_country;

                    $latLong = explode(',', $asset->position);

                    $allPrices[strtolower($asset->location)][$asset->media_categories_id][$asset->asset_id][] = $tempAsset['price'];

                    $newAsset = array();
                    $newAsset['assetID'] = $asset->asset_id;
                    $newAsset['assetName'] = $asset->ass_name;
                    $newAsset['cost'] = (isset($asset->ass_production_cost_BCY)) ? $asset->ass_production_cost_BCY : '0';
                    $newAsset['end'] = $asset->to_date;
                    $newAsset['lat'] = $latLong[0];
                    $newAsset['lng'] = $latLong[1];
                    $newAsset['location'] = strtolower($asset->location);
                    $newAsset['mecid'] = $asset->media_categories_id;
                    $newAsset['price'] = (isset($asset->ass_production_price_SCY)) ? $asset->ass_production_price_SCY : '0';
                    $newAsset['start'] = $asset->from_date;
                    $newAsset['type'] = strtolower($allTypesWithIdKeys[$tempAsset['media_categories_id']]);

                    ?>

                    <tr id="selectedasset_<?php echo $asset->asset_id; ?>">
                        <td data-location="<?php echo $tempAsset['asset_location']; ?>"><?php echo $tempAsset['asset_location']; ?></td>
                        <td data-type="<?php echo $tempAsset['media_categories_id']; ?>"><?php echo $allTypesWithIdKeys[$tempAsset['media_categories_id']]; ?></td>
                        <td><input type="date" class="form-control" data-assetid="<?php echo $tempAsset['asset_id']; ?>" data-location="<?php echo $tempAsset['asset_location']; ?>" id="start_date" value="<?php echo $tempAsset['from_date']; ?>"/></td>
                        <td><input type="date" class="form-control" data-assetid="<?php echo $tempAsset['asset_id']; ?>" data-location="<?php echo $tempAsset['asset_location']; ?>" id="end_date" value="<?php echo $tempAsset['to_date']; ?>"/></td>
                        <td data-assetname="<?php echo $tempAsset['asset_name']; ?>"><?php echo $tempAsset['asset_name']; ?></td>
                        <td data-price="<?php echo $tempAsset['price']; ?>"><?php echo $tempAsset['price']; ?></td>
                        <td data-cost="<?php echo $tempAsset['cost']; ?>"><?php echo $tempAsset['cost']; ?></td>
                        <td><input type="text" class="form-control" data-discount="" data-location="<?php echo $tempAsset['asset_location']; ?>" id="discount" /></td>
                        <td><span class="glyphicon glyphicon-remove remove-asset" data-location="<?php echo $tempAsset['asset_location']; ?>" data-type="<?php echo $tempAsset['media_categories_id']; ?>" data-mecid="<?php echo $tempAsset['media_categories_id']; ?>" data-assetid="<?php echo $tempAsset['asset_id']; ?>"></span></td>
                    </tr>

<?php
//                        echo "asset_location: " . $asset->location;
//                        echo "media_categories_id: " . $asset->media_categories_id;
//                        echo "count: " . count($assetsSelected[$asset->location][$asset->media_categories_id]+1);
                    $assetsSelected[strtolower($asset->location)][$asset->media_categories_id][] = $asset->asset_id;
                    if(count($assetsSelected) > 0) {
                        $assetsAlreadySelected = "true";
                    }
                    $selectedAssetsWithDate[$asset->asset_id][strtolower($asset->location)] = $newAsset;

                    $alreadyInList[strtolower($asset->location)][strtolower($allTypesWithIdKeys[$tempAsset['media_categories_id']])][] = $asset->asset_id;
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>

    </form><!--Main -->

<?php
$allInfo = array();
$tempInfo = array();
$alreadyInLocationArray = array();
$alreadyInItemsArray = array();
$alreadyInAssetNameArray = array();
$tempAsset = array();
?>
    <!-- Modal For Map -->
    <div class="modal fade choose-asset-modal" id="selectAssetsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog assetsModalWindow" style="width: 1200px;">
            <div class="modal-content" align="left" style="width: 1200px; height:850px;">
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
                            <div>
                                <a href="../load_stock" target="_blank">Click here to add more assets</a></p>
                            </div>
                            <div class="col-md-7">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th width="40"><small></small></th>
                                        <th width="160"><small>Asset Name</small></th>
                                        <th width="50"><small>Selling Price</small></th>
                                        <th width="50"><small>Cost Price</small></th>
                                        <th width="50"><small>View Specsheet</small></th>
                                        <th width="50"><small>Availability</small></th>
                                    </tr>
                                    </thead>
                                    <tbody id="asset_body">
                                    <?php foreach ($asset_details as $asset)
                                    {
                                        ?>
                                        <tr>
                                            <td><small><input type="checkbox"  class="select_asset_for_location_map asset_<?php echo $asset->ass_id;?>" name="asset_checkbox[]" data-location="<?echo $asset->position?>" data-type="<?echo ""?>" data-price="<?echo $asset->ass_production_price_SCY;?>" data-cost="<?echo $asset->ass_production_cost_BCY;?>" data-mecID="<?echo $asset->mec_id;?>" data-assetName="<?echo $asset->ass_name;  ?>" data-lat="<?echo $asset->cam_latitude;  ?>" data-lng="<?php echo $asset->cam_longitude; ?>" id="<?php echo $asset->ass_id?>" ></small></td>
                                            <td ><small><?php echo $asset->ass_name; ?></small></td>
                                            <td><small><?php echo $asset->ass_production_price_SCY; ?></small></td>
                                            <td><small><?php echo $asset->ass_production_cost_BCY; ?></small></td>
                                            <td><small><a href="<?php echo site_url(); ?>auctions/spec_sheet/<?php echo $asset->ass_id;?> " >View SpecSheet<a/></small></td>
                                            <td><small><?php echo $asset->asset_status; ?></small></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                        </small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeAssetsModalWindow">Close</button>
                    <button type="button" class="btn btn-primary saveChangesMediaOwner <? echo strtolower(str_replace(' ', '-', $assetName)); ?>">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /Modal For Map-->

<?php
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
                    $cost = (isset($asset[$i]['ass_production_cost_BCY'])) ? $asset[$i]['ass_production_cost_BCY'] : '0';
                    $mecID = $asset[$i]['mec_id'];
                    $type = $asset[$i]['mec_description'];
                    $assetItemName = $asset[$i]['ass_name'];
                    $assestStatus = $asset[$i]['asset_status'];
                    echo $assestStatus;
                    $lat = $position[0];
                    $lng = $position[1];

                    $assetItem = array(
                        'asset_id' => $assetID,
                        'price' => $price,
                        'cost' => $cost,
                        'mec_id' => $mecID,
                        'asset_name' => $assetItemName,
                        'lat' => $lat,
                        'long' => $lng,
                        'type' => $type,
                        'location' => $address,
                        'asst_status' => $assestStatus
                    );
                    $allAssetItems[$location][$mecID][$count] = $assetItem;
                    $count++;
                }
            }
        }
    }
}
//    echo json_encode($allAssetItems);
//    echo '<pre>';
//    print_r($selectedAssetsWithDate);
//    echo '</pre>';


?>

    <script>

        var selectedAssetsWithDates = {};
        <?php
            if(count($selectedAssetsWithDate) > 0) {
                ?>
        selectedAssetsWithDates = <?php echo json_encode($selectedAssetsWithDate); ?>;
        <?php
    }
?>

        var allPrices = {};
        <?php
            if(count($allPrices) > 0) {
                ?>
        allPrices = <?php echo json_encode($allPrices); ?>;
        <?php
    }
?>

        var alreadyInList = {};
        <?php
            if(count($alreadyInList) > 0) {
                ?>
        alreadyInList = <?php echo json_encode($alreadyInList); ?>;
        <?php
    }
?>

        var assetsSelected = {};
        <?php
            if(count($assetsSelected) > 0) {
                ?>
        assetsSelected = <?php echo json_encode($assetsSelected); ?>;
        <?php
    }
?>

        var assetsAlreadySelected = "";
        <?php
            if(count($assetsAlreadySelected) > 0) {
                ?>
        assetsAlreadySelected = <?php echo $assetsAlreadySelected; ?>;
        <?php
    }
?>

        var assetsSelectedTemp = [];

        var allAssetItems = {};
        <?php
            if(count($allAssetItems) > 0) {
                ?>
        allAssetItems = <?php echo json_encode($allAssetItems); ?>;
        <?php
    }
?>


        var startDate = "";
        <?php
            if(isset($campaignDetails[0]->cam_requested_start_date)) {
                ?>
        startDate = "<?php echo $campaignDetails[0]->cam_requested_start_date; ?>";
        <?php
    }
?>


        var endDate = "";
        <?php
            if(isset($campaignDetails[0]->cam_requested_end_date)) {
                ?>
        endDate = "<?php echo $campaignDetails[0]->cam_requested_end_date; ?>";
        <?php
    }
?>

        var finalPrice = <?php echo ($totalAmount > 0) ? $totalAmount : '0.00'; ?>;

    </script>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/mapping/css/mapping_styles.css">
    <!-- Maps already loaded from php -->
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/mapping/js/AdsMapRFC.js"></script>
    <script type="text/javascriptcript" src="<? echo base_url(); ?>assets/js/maps.josh.js"></script>
    <script type="text/javascriptcript" src="<? echo base_url(); ?>assets/js/google.maps.search.josh.js"></script>
    <script type="text/javascriptcript" src="<? echo base_url(); ?>assets/js/new_campaign.josh.js"></script>
<?php include("Layouts/footer.php"); ?>