<?php include("Layouts/header.php"); ?>
    <div class="breadcrumbs">
        <h1><span class="glyphicon glyphicon-list-alt"></span>RFP :: Incoming Request For Proposals</h1>
    </div>
    <div class="main col-xs-12">
        <form method="post">
            <ul class="nav navbar-nav section-menu">
                <li><a href="../new_campaign/proposals">Incoming Quotations</a></li>
                <li class="active"><a href="../new_campaign/accepted_proposals">Accepted Proposals</a></li>
                <li><a href="../new_campaign/campaigns">New Request For Proposals</a></li>
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
                    <th>Campaign Title</th>
                    <th>Campaign Budget</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Respond By Date</th>
                    <th>Partial Availability</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
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
                <?php

                for($i = 0; $i < count($campaignDetails); $i++) {
                    // start row
                    $green_process = ($campaignDetails[$i]->process == "2") ? 'green_process' : '';
                    echo '<tr class="'. $green_process .'">';

                    // start title
                    echo '<td>'. $campaignDetails[$i]->cam_title .'<input type="hidden" name="camp_title" id="camp_title" value="'. $campaignDetails[$i]->cam_title .'" /></td>';
                    // start budget
                    echo '<td>'. $campaignDetails[$i]->cam_budget .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_budget .'" /></td>';
                    // start start date
                    echo '<td>'. $campaignDetails[$i]->cam_requested_start_date .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_requested_start_date .'" /></td>';
                    // start end date
                    echo '<td>'. $campaignDetails[$i]->cam_requested_end_date .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_requested_end_date .'" /></td>';
                    // start respond by date
                    echo '<td>'. $campaignDetails[$i]->cam_requested_response_date .'<input type="hidden" name="" id="" value="'. $campaignDetails[$i]->cam_requested_response_date .'" /></td>';
                    // start partial availability
                    echo '<td>No<input type="hidden" name="" id="" value="No" /></td>';
                    // start status
                    echo '<td>Submitted to media owner<input type="hidden" name="" id="" value="Submitted to media owner" /></td>';
                    // start action
                    echo '<td><a target="_blank" href="../new_campaign/getQuote?id='. $campaignDetails[$i]->cam_id .'" class="btn btn-default"  >View Quote</a><input type="hidden" name="campaign_desc" id="campaign_desc" value=""/></td>';

                    // end row
                    echo '</tr>';
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
        </tbody>
        </table>
    </div>

<?php include("Layouts/footer.php"); ?>