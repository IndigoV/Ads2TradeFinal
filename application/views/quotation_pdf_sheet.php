<div class="col-md-12">
    <div class="col-sm-12">
        <h1>Ads 2 trade</h1>
        <hr />
    </div>
</div>
<?php $grand_total = 0; ?>
<?php foreach($data as $location_key => $location_data) {?>
    <div class="panel panel-default">
        <div class="panel-heading">
            <table>
                <tr>
                    <td><b>Area:</b></td>
                    <td><?php echo $location_key; ?></td>
                </tr>
            </table>
        </div>
        <?php foreach($location_data as $media_type => $assets) { ?>
            <?php $media_type_total = 0; ?>
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="col-sm-12" style="padding-left: 30px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;Media Type: <?php echo $media_type; ?>
                        <div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assets
                            <hr />

                            <ol>
                                <?php foreach($assets as $asset) { ?>
                                    <?php $media_type_total += $asset->ass_production_price_SCY; ?>
                                    <li>
                                        <table>
                                            <tr>
                                                <td>Asset Name: </td><td><?php echo $asset->ass_name; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Asset Description: </td><td><?php echo $asset->ass_description; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Asset Price: </td><td><?php echo $asset->ass_production_price_SCY; ?></td>
                                            </tr>
                                        </table>
                                    </li>
                                <?php } ?>
                            </ol>
                        </div>
                        <div>
                            <hr />
                            <div align="right">
                                Total: <?php $grand_total += $media_type_total; echo $media_type_total; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
        <?php if(count($screenshots) > 0 ) { ?>
            <div>
                Images<br />
                <hr />
                    <table border="0">
                    <?php foreach($screenshots as $key => $image_location) { ?>
                        <tr>
                            <td><img src="<?php echo 'http://' . $_SERVER['HTTP_HOST'] . '/Ads2TradeFinal'. $image_location; ?>" alt="test alt attribute" width="90" height="90" border="0" /></td>
                        </tr>
                    <?php } ?>
                    </table>
            </div>
        <?php } ?>
    </div>
<?php } ?>
<div>
    <hr />
    <div align="right">
        Grand Total: <?php echo $grand_total; ?>
    </div>
    <hr />
</div>