<?php include("Layouts/header.php"); ?>
<div class="breadcrumbs">
    <h1><span class="glyphicon glyphicon-list-alt"></span>RFP :: Incoming Request For Proposals</h1>
</div>
<div class="main col-xs-12">
    <form method="post">
        <ul class="nav navbar-nav section-menu">
            <li><a href="../new_campaign/media_owner_accepted_proposals">Accepted Proposals</a></li>
            <li class="active"><a href="../new_campaign/media_owner_campaign_list">Proposals</a></li>
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
                        echo '<tr>';

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
                        echo '<td>'.$campaignDetails[$i]->prs_description .'<input type="hidden" name="" id="" value="Submitted to media owner" /></td>';
                        // start action
                        echo '<td><a href="../new_campaign/media_owner_campaign_management?id='. $campaignDetails[$i]->cam_id .'&oid='. $campaignDetails[$i]->operator_id .'" class="btn btn-default"  >Process This RFP</a><input type="hidden" name="campaign_desc" id="campaign_desc" value=""/></td>';

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