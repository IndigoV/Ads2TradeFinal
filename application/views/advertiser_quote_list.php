<?php include("Layouts/header.php"); ?>
    <div class="breadcrumbs">
        <h1><span class="glyphicon glyphicon-list-alt"></span>RFP :: Incoming Request For Proposals</h1>
    </div>
    <div class="main col-xs-12">
        <form method="post">
            <ul class="nav navbar-nav section-menu">
                <li><a href="../new_campaign/headerInfo">Search</a></li>
                <li><a href="../new_campaign/ad_campaigns">All Campaigns</a></li>
                <li class="active"><a href="../new_campaign/quotesFromOperator">Quotes From Operator</a></li>
            </ul>


            <div class="clear"></div>

            <br>
        </form>
        <?php
        //    print_r($campaignDetails);
        echo form_open('new_campaign/campaignSummary');
        ?>
        <div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <!--<th>Media Owner Name</th>-->
                    <th>Campaign Title</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Respond By Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                <tr>
                    <!--<td></td>-->
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <?php


                for($i = 0; $i < count($campaignDetails); $i++) {
                    // start row
                    echo '<tr>';
                    // start media owner name
                    //echo '<td>'. $campaignDetails[$i]->use_first_name .' '. $campaignDetails[$i]->use_last_name .'<input type="hidden" name="media_owner_name" id="media_owner_name" value="'. $campaignDetails[$i]->use_first_name .' '. $campaignDetails[$i]->use_last_name .'" /></td>';
                    // start title
                    echo '<td>'. $campaignDetails[$i]->cam_title .'<input type="hidden" name="camp_title" id="camp_title" value="'. $campaignDetails[$i]->cam_title .'" /></td>';
                    // start start date
                    echo '<td>'. $campaignDetails[$i]->cam_requested_start_date .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_requested_start_date .'" /></td>';
                    // start end date
                    echo '<td>'. $campaignDetails[$i]->cam_requested_end_date .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_requested_end_date .'" /></td>';
                    // start respond by date
                    echo '<td>'. $campaignDetails[$i]->cam_requested_response_date .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_requested_response_date .'" /></td>';
                    // start status
                    echo '<td>Submitted to media owner<input type="hidden" name="" id="" value="Submitted to media owner" /></td>';
                    // start action
                    echo '<td><a href="../new_campaign/getQuote?id='. $campaignDetails[$i]->rfp_for_submission_id .'" class="btn btn-default" target="_blank">View Quote</a><input type="hidden" name="campaign_desc" id="campaign_desc" value=""/></td>';

                    // end row
                    echo '</tr>';
                }

                ?>
                <tr>
                    <!--<td></td>-->
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
        </tbody>
        </table>
    </div>

<?php include("Layouts/footer.php"); ?>