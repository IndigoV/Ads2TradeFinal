<form id="formSendBackToMediaOwner" action="do_send_back_to_media_owner" method="post">
    <div class="col-md-12">
        <div class="col-sm-3">
            <label class="form-label">Comment: <span style="color: red">*</span> </label>
        </div>
        <div class="col-sm-9">
            <textarea id="comment" class="form-control"></textarea>
            <input type="hidden" id="id" value="<?php echo $id; ?>" />
        </div>
    </div>
    <div class="col-md-12">
        <div class="col-sm-3"></div>
        <div class="col-sm-9">
            <br />
            <button id="btn-send-back" class="btn btn-default">Submit</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    jQuery(function() {
        var $ = jQuery;
        $('#btn-send-back').button().click(function() {
            RfpCampaigns.doSendBackToMediaOwner();
            return false;
        });
    });
</script>