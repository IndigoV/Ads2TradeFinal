<?php //var_dump($angu_macats);

//foreach ($angu_macats as $data) {
//	$cats[] = $this->media_category->getIDs($data);
//}
?>
<style>
    .modal.large {
        width: 80%;
    }
</style>
<div style="height:0px; width: 0px;">
    <?php //echo $map1['js'];
    //echo $map1['html'];
    ?>

</div>
<body>

<div class="main col-xs-12">

    <?php
    //$dataw = array();
    //$dataw['angu'] = $cats;
    echo form_open('new_campaign/campaignSummary');
    ?>
    <div class="col-md-12">
        <div class="col-sm-12">
            <br />
            <a href="../new_campaign/proposals" class="btn btn-default"><< Back</a>
            <hr />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Campaign Quotations: <?php echo $campaign_details->cam_title; ?></div>
        <div class="panel-body">
            <div class="col-md-12">
                <div class="col-sm-12">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Campaign Title</th>
                            <th>Campaign Budget</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Respond By Date</th>
                            <th>Partial Availability</th>
                            <th>Status</th>
                            <th>Select To Send To Advertiser</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php

                        $alreadyDown = array();
                        $arr = array();
                        foreach($propsals as $proposal) {
                            foreach($proposal as $p) {
                                $media_owner_id = $p->media_owner_id;
                                if(!in_array($p->campaign_id, $alreadyDown)) {
                                    $allCampaignData = $this->db->query("SELECT * FROM campaign WHERE cam_id = " . $p->campaign_id)->result()[0];
                                    $allCampaignData->media_owner_id = $media_owner_id;
                                    $allCampaignData->process = $p->process;
                                    //$arr[$allCampaignData->cam_id] = $allCampaignData;
                                    if(isset($allCampaignData->cam_id)) {
                                        $users = $this->db->query("SELECT * FROM user WHERE use_id = {$p->media_owner_id}")->result();
                                        if(count($users) > 0) {
                                            $allCampaignData->m_owner = $users[0];
                                        }
                                        $allCampaignData->rfp_for_submission_id = $p->rfp_for_submission_id;
                                        $arr[] = $allCampaignData;
                                    }
                                    $alreadyDown[] = $p->campaign_id;
                                }
                            }
                        }

                        rsort($arr);

                        for($i = 0; $i < count($arr); $i++) {
                            //echo "<pre>". print_r($arr[$i], 1) . "</pre>"; exit();
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

                            <tr class="<?php echo ($arr[$i]->process == '1') ? 'green_process' : ''; ?>">
                                <td><a href="../new_campaign/operator_campaign_management_details?id=<?php echo $campaign_details->cam_id; ?>&moid=<?php echo $arr[$i]->media_owner_id; ?>" ><?php echo $arr[$i]->cam_title; ?></a><input type="hidden" name="cam_title" id="camp_title" value="<?php echo $arr[$i]->cam_title; ?>"</td>
                                <td><?php echo "R", number_format($arr[$i]->cam_budget, 2, ',', ' '); ?><input type="hidden" name="cam_budget" id="camp_budget" value="<?php echo $arr[$i]->cam_budget; ?>"</td>
                                <td><?php echo $arr[$i]->cam_requested_start_date; ?><input type="hidden" name="start_date" id="start_date" value="<?php echo $arr[$i]->cam_requested_start_date; ?>"</td>
                                <td><?php echo $arr[$i]->cam_requested_end_date; ?><input type="hidden" name="end_date" id="end_date" value="<?php echo $arr[$i]->cam_requested_end_date; ?>"</td>
                                <td><?php echo $arr[$i]->cam_requested_response_date; ?><input type="hidden" name="respond_date" id="respond_by" value="<?php echo $arr[$i]->cam_requested_response_date; ?>"</td>
                                <td><?php echo ($arr[$i]->cam_partial_availability_status == 1) ? 'Yes' : 'No'; ?></td>
                                <td>Incoming Quotation From: <b><?php echo isset($arr[$i]->m_owner) ? $arr[$i]->m_owner->use_first_name . ' ' . $arr[$i]->m_owner->use_last_name  : "Owner"; ?> </b></td>
                                <td>
                                    <input type="checkbox" id="select_proposal_<?php echo $arr[$i]->rfp_for_submission_id; ?>"/>
                                </td>
                                <td>
                                    <!--<a href="../new_campaign/campaigns2?id=<?php echo $arr[$i]->cam_id; ?>&moid=<?php  echo $arr[$i]->media_owner_id; ?>" class="btn btn-default">Send To Advertiser</a> <hr /> -->
                                    <a href="#" onclick="RfpCampaigns.sendBackToMediaOwner(<?php echo $arr[$i]->rfp_for_submission_id; ?>)" class="btn btn-default">Send Back To Media Owner</a>
                                </td>
                            </tr>

                            </tr>
                        <?php
                        }
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
            </div>
            <div class="col-md-12">
                <div class="col-sm-12">
                    <button type="button" id="btn-submit-to-advertiser" class="btn btn-default">Send To Advertiser</button>
                </div>
            </div>



            </tbody>
            </table>
        </div>
    </div>

</div>
<?php echo form_close(); ?>

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
        var cell1 = row.insertCell(-1);
        var cell2 = row.insertCell(0);
        var cell3 = row.insertCell(1);
        var cell4 = row.insertCell(2);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(3);

        cityCell = '<div id="mineCity"></div>';
        btn = '<input type="button" value="Delete Location" class="btn btn-danger" onclick="deleteRow(this)">';
        proxBtn = '<input type="text"  id="proximity" name="proximity" class="form-control" placeholder="No Proximity Sprcified" readonly />';
        myLat = '<input type="hidden"  id="lat[]" name="lat[]" value="' + lat + "," + lon + '"/>';
        myStreetAdd = '<input type="hidden"  id="streetAdd[]" name="streetAdd[]" value="' + address + '"/>';
        viewMap = '<button type="button" class="js-fire-modal btn btn-info" data-toggle="modal" data-target="#mapModal" data-latLng="' + lat + ',' + lon + '">View Map</button>';
        myDiv = '<div id="hepano"></div>';
        myCountry = address.substr(address.lastIndexOf(",") + 1);
        //myLattitude = '<input type="hidden" value="+lat+" class="btn btn-danger" onclick="deleteRow(this)">';
        cell1.innerHTML = address + myStreetAdd;
        // $("#mineCity").load("city_cell?c=" + "address");
        cell2.innerHTML = myCountry;
        cell3.innerHTML = btn;
        cell5.innerHTML = proxBtn + myLat; //+ myStreetAdd;
        // cell5.innerHTML = myLat;
        cell4.innerHTML = viewMap;
        cell6.innerHTML = " <strong>lat:</strong> " + lat + "\n <strong>lon:</strong> " + lon;
        //$("#hepano").load("dynamic_table?c=" + document.getElementById('cit_id').value);

        //remember to reset the search box after populating the table

    }



    var base_url = '<?php echo base_url();?>';
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

            var campaign = new AdsMap.Campaign(adsMap, {url: base_url + 'index.php/new_campaign/upload_campaign', onsuccess: function() {
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

        jQuery('#btn-submit-to-advertiser').button().click(function() {
            var $ = jQuery;
            var selected = [];
            $('input:checked').each(function() {
                var val = $(this).attr('id').split('_')[2];
                selected.push(val);
            });
            if( selected.length > 0 ) {
                var cat = '';
                for(var i = 0; i < selected.length; i++) {
                    if(cat == '') {
                        cat += selected[i].toString();
                    }else {
                        cat += '_' + selected[i].toString();
                    }
                }
                $.post(
                    'send_proposal_to_advertiser',
                    {rfp_sub_ids: cat},
                    function(data) {
                        data = $.parseJSON(data);
                        if(data.success == true) {
                            window.location.href = "view_campaign_quotations?id=" + data.campaign_id.toString();
                        }else {
                            alert("Error: " + data.message);
                        }
                    }
                )
            }else {
                alert('Select Quote(s) to send please!');
            }
            return false;
        });

    });
</script>