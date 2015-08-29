
<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>RFP : : Create a new campaign</h1>
    <br/><br/>

    <form method="post">
        <ul class="nav navbar-nav section-menu">
            <li class="active"><a href="#">Search</a></li>
            <li><a href="../load_stock/active_bids">Your Active Bids<span class="badge"><?php echo '0'; ?></span></a></li>
            <li><a href="../load_stock/watch_list">Watch List<span class="badge"><?php echo '2'; ?></span></a></li>
            <li><a href="../load_stock/won_bids">Won Bids</a></li>
            <li><a href="../load_stock/lost_bids">Lost Bids</a></li>
        </ul>


        <div class="clear"></div>

        <br>
    </form>


    <?php
        $attributes = array('id' => 'newCampaign1');
        echo form_open('new_campaign/saveCampaign', $attributes);
    ?>



    <div class="row">
        <div class="col-sm-3">
            <div class="side_info_box nmt">
                <h3>Campaign Details</h3>

                <p>Title:<br> <strong><?php echo ucwords(isset($camp_title) ? $camp_title : ''); ?><input type="hidden"
                                                                                                          name="camp_title[]"
                                                                                                          id="camp_title"
                                                                                                          value="<?php echo isset($camp_title) ? $camp_title : ''; ?>"
                                                                                                          data-validation="required"/></strong>
                </p>

                <p>&nbsp;</p>

                <p>Budget:<br> <strong
                        class="budgetBeforeRemaining">R <?php echo isset($budget) ? number_format($budget, 2) : ''; ?>
                        <input type='hidden' name='budget[]' id="budget"
                               value="<?php echo isset($budget) ? number_format($budget, 2) : 0; ?>"/></strong></p>

                <p>&nbsp;</p>

                <p>Media Families:<br> <input type="hidden" name="media_families[]" id="media_families"
                                              value="<?php isset($mef_id) ? print_r($mef_id) : ''; ?>"/><strong>
                        <?php
                        if (isset($mef_id) && is_array($mef_id)) {
                            foreach ($mef_id as $key) {
                                echo '<p>', ucwords($key), '</p>';
                            }
                        }
                        ?>
                    </strong></p>

                <p></p>

                <p>Media Types:<br/><strong>
                        <?php
                        foreach ($mec_id as $key => $value) { //loop thru chosen media types
                            print_r($value);
                            echo '<br />';
                        }

                        ?>
                    </strong><input type="hidden" name="media_types[]" id="media_types" value="<?
                    foreach ($mec_id as $key => $value) {
                        echo $value . ',';
                    }
                    ?>"/></p>

                <p>&nbsp;</p>

                <p>Start Date:<br> <strong><?php echo isset($from_date) ? $from_date : ''; ?><input type="hidden"
                                                                                                    name="from_date[]"
                                                                                                    id="from_date"
                                                                                                    value="<?php echo isset($from_date) ? $from_date : ''; ?>"/></strong>
                </p>

                <p>&nbsp;</p>

                <p>End Date:<br> <strong><?php echo isset($to_date) ? $to_date : ''; ?><input type="hidden"
                                                                                              name="to_date[]"
                                                                                              id="to_date"
                                                                                              value="<?php echo isset($to_date) ? $to_date : ''; ?>"/></strong>
                </p>

                <p>&nbsp;</p>

                <p>Respond By Date:<br> <strong><?php echo isset($respond_date) ? $respond_date : ''; ?><input
                            type="hidden" name="respond_date[]" id="respond_date"
                            value="<?php echo isset($respond_date) ? $respond_date : ''; ?>"/></strong></p>

                <p>&nbsp;</p>

                <p>Partial Availablity:<br> <strong>
                        <?php
                        if (isset($partial_availability)) {
                            if ($partial_availability == "on") {
                                echo "YES";
                            } else {
                                echo "NO";
                            }
                        } else {
                            echo 'NO';
                        }
                        ?>
                    </strong><input type="hidden" name="partial_availability" value="<?php
                    if (isset($partial_availability)) {
                        if ($partial_availability == "on") {
                            echo "YES";
                        } else {
                            echo "NO";
                        }
                    } else {
                        echo 'NO';
                    }
                    ?>"/></p>

                <p>&nbsp;</p>

                <p>Description:<br> <strong><?php echo ucwords($description) ?></strong><input type="hidden"
                                                                                               name="description[]"
                                                                                               id="description"
                                                                                               value="<?php echo $description; ?>"/>
                </p>

            </div>
        </div>

        <div class="col-sm-9">
            <?php
            $count = 0;
            $mapCounter = 0;
            $total_for_account = 0;
            if (isset($streetAdd) && is_array($streetAdd)) {
                $counterForAsset = 0;
                $numberTable = 1;
                foreach ($streetAdd as $key) {
//                    print_r($area_lat_long);
                    //LAT LONG
                    $area_lat_long[$count] = isset($area_lat_long[$count]) ? $area_lat_long[$count] : "-26.2041028, 28.047305100000017";
//                    echo $area_lat_long[$count];
//        echo '<strong>area: '. $streetAdd[$count] .'         <a class="glyphicon glyphicon-new-window" type="button" data-toggle="modal" data-target="#mapModal" data-latLng="'.$area_lat_long[$count].'" style="cursor:pointer;"></a><br>';
                    $mapCounter++;?>
                    <div class="row row-item-for-total-main">
                    <input type="hidden" id="street_address" name="street_address[<?php echo $count; ?>]"
                           value="<?php echo $streetAdd[$count]; ?>">
                    <h4><span class="glyphicon glyphicon-map-marker"
                              aria-hidden="true"></span> <? echo $streetAdd[$count]; ?>        <a
                            class="glyphicon glyphicon-new-window" type="button" data-toggle="modal"
                            data-target="#mapModal" data-latLng="<? echo $allAddresses[$count]['lat']; ?>,<? echo $allAddresses[$count]['long']; ?>"
                            style="cursor:pointer;"></a></h4>
                    <table class="table table-striped">
                        <thead>
                        <th>Media Type</th>
                        <th width="140">Quanity Required</th>
                        <th width="155">Average Asset Price</th>
                        <th width="125">Price</th>
                        <th>&nbsp;</th>
                        </thead>
                        <tbody>
                        <tr>
                            <?php

                            $j = 0;
                            $total_used = 0;
                            $total_bal = isset($budget) ? $budget : 0;
                            $qty = 1;
                            $i = 0;
                            foreach ($my_categories as $key2) { //loop thru chosen media types
                                foreach ((array)$key2 as $data) {

//                                    echo $data->mec_description;
                                    //check valid description
                                    $j++;
                                    $data_description = isset($data->mec_description) ? $data->mec_description : '';
//                                    echo '<pre>';
//                                    var_dump($average_price);
//                                    echo '</pre>';
//                                print_r($average_price[$streetAdd[$count]]);
                                    $ex = explode(',', $streetAdd[$count]);
                                    $av_price = $average_price[$count][$ex[0]][$mec_stuff[$i]];
                                    $price = $qty * $av_price;
                                    $total_for_account += $price;
                                    ?>
                                        <tr class="asset_<? echo $counterForAsset; ?> asset_item">
                                             <td><?php echo strtoupper($mec_stuff[$i]); ?>
                                        <input type="hidden" id="media_category" name="mec_id[]" value="<?php
                                        foreach ($mec_stuff as $ms) {
                                            echo $ms . ',';
                                        }
                                        ?>">
                                        <input type="hidden" id="media_category" name="media_category[]"
                                               value="<?php echo $data_description; ?>"></td>
                                    <td><input type="text"
                                               class="form-control input-sm q_asset_<? echo $counterForAsset; ?> med_quantity"
                                               name="med_quantity[]" id="med_quantity" placeholder="Quantity Required"
                                               value="<? echo $qty; ?>"/></td>
                                    <td><input type="text" readonly="true" name="avg_total[]"
                                               id="asset_<? echo $counterForAsset; ?>"
                                               class="form-control input-sm avg_asset_<? echo $counterForAsset; ?>"
                                               value="<? echo number_format($av_price, 2); ?>"/></td>
                                    <td><input type="text" readonly="true" name="rem_total[]"
                                               id="asset_<? echo $counterForAsset; ?>"
                                               class="form-control input-sm rem_asset rem_asset_<? echo $counterForAsset; ?>"
                                               value="<? echo number_format($price, 2); ?>"/></td>
                                    <td width="50"><a href="#" class="btn btn-primary btn-sm" data-toggle="modal"
                                                      data-target="#optionsModal"><span class="glyphicon glyphicon-play"></span>
                                            More options</a></td>
                                </tr>
                                <?php $i++;
                                $counterForAsset++;
                                }
                            }?>
                        </tbody>
                    </table>
                    </div>
                    <?php $count++;
                    $numberTable++;
                }
            }
            ?>
            <div class="pull-right">
                <table>
                    <tr>
                        <td width="100"><h4>Total</h4></td>
                        <td width="220"><h3 class="h3" id="lblSubtotalAll"><? echo number_format($total_for_account, 2); ?></h3><input type="hidden" name="subtotal[]" value="<? echo number_format($total_for_account, 2); ?>"></td>
                    </tr>
                </table>
            </div>
            <br />
            <div class="clearfix"></div>
            <div class="pull-right">
                <div class="row">
                    <div class="col-xs-6">
                        <input type="button" class="btn btn-cancel" value="Cancel" data-toggle="modal" data-target="#cancelModal"/>
                    </div>
                    <div class="col-xs-6">
                        <input type="submit" class="btn btn-primary" value="Save Campaign" id="saveCampaign"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php echo form_close(); ?><!--Main -->

</div>
<div class="modal fade" id="optionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Choose the size</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <th width="100">&nbsp;</th>
                    <th>Size Options</th>
                    <th>Printable Size</th>
                    <th>Price Range (Min-Max)</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>4 Sheet</td>
                        <td>60X60 Inches</td>
                        <td>R500 - R10,000</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>4 Sheet</td>
                        <td>60X60 Inches</td>
                        <td>R500 - R10,000</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>4 Sheet</td>
                        <td>60X60 Inches</td>
                        <td>R500 - R10,000</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>4 Sheet</td>
                        <td>60X60 Inches</td>
                        <td>R500 - R10,000</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>4 Sheet</td>
                        <td>60X60 Inches</td>
                        <td>R500 - R10,000</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog" style="width: 75%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title" id="myModalLabel">View Location Map</h4>
            </div>
            <div class="modal-body">
                <div id="campaign_map_canvas" style="width: 100%; height: 400px"></div>
                <div id="campaign_images" style="width: 100%; height: 800px;"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
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


<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/mapping/css/mapping_styles.css">-->
<!--<script type="text/javascript" src="--><?php //echo base_url(); ?><!--assets/mapping/js/AdsMapRFC.js"></script>-->

<script type="text/javascript">

    function deleteRow(a) {
        console.log(a);
        $(a).parent().remove();
    }

    function deleteRow3(a, amount, id) {
        console.log(a);
        $(a).parent().remove();
        //recalculate totals
        var current = $('#hidSubtotal' + id).val();
        //alert(current);

        var newtotal = parseFloat(current) - parseFloat(amount);
        if (newtotal < 0) {
            newtotal = 0;
        }

        //alert(newtotal);
        //update  hidden field
        $('#hidSubtotal' + id).val(newtotal);
        //update the label
        $('#lblSubtotal' + id).html(newtotal);

        //hidSubtotalAll
        var SubtotalAll = $('#hidSubtotalAll').val();
        var newSubtotalAll = (parseFloat(SubtotalAll) - parseFloat(amount));
        if (newSubtotalAll < 0) {
            newSubtotalAll = 0;
        }
        $('#hidSubtotalAll').val(newSubtotalAll);

        //lblSubtotalAll
        $('#lblSubtotalAll').html((newSubtotalAll));

        //hidBudgetRemaining
        var BudgetRemaining = $('#hidBudgetRemaining').val();
        var BudgetFixed = $('#budget').val();
        var newBudgetRemaining = (parseFloat(BudgetRemaining) + parseFloat(amount));
        if (newBudgetRemaining < 0) { //cannot have a negative budget
            newBudgetRemaining = 0;
        } else if (newBudgetRemaining > BudgetFixed) { //cannot not exceed the campaign budget
            newBudgetRemaining = BudgetFixed;
        }
        $('#hidBudgetRemaining').val(newBudgetRemaining);

        //lblBudgetRemaining
        $('#lblBudgetRemaining').html((newBudgetRemaining));
    }

    function toCurrency(amount) {
        return amount.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

    function sizeModal(b, lat, ln, medType) {

        var width = 900, height = 500, padding = 0, top = (window.innerHeight - height - padding) / 5, left = (window.innerWidth - width - padding) / 2, modalbak, modalwin, a = "<?php echo isset($id)?$id:3;?>";

        //try other means now
        var myParams = {latitude: lat, longitude: ln, b: b, medType: medType};
        var newQueryString = jQuery.param(myParams);
        //alert(newQueryString); exit;
        //end other
        console.log("city_cell?" + newQueryString);

        $("#mapModal").load("city_cell?" + newQueryString);
        modalbak = document.getElementById("modalbak1");
        modalbak.style.display = "block";

        modalwin = document.getElementById("mapModal");
        modalwin.style.top = top + "px";
        modalwin.style.left = left + "px";
        modalwin.style.display = "block";
    }

</script>