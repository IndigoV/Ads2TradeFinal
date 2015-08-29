<div class="clear"></div>
</div>
</div>
</div>

<script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/js/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>bootbox/bootbox.min.js" type="text/javascript"></script>

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>

<script src="<? echo base_url(); ?>assets/js/new_campaign.josh.js"></script>
<script src="<? echo base_url(); ?>assets/js/maps.josh.js"></script>
<script src="<? echo base_url(); ?>assets/js/google.maps.search.josh.js"></script>
<script src="<? echo base_url(); ?>assets/js/select2.min.js"></script>


<script src="<? echo base_url(); ?>assets/mapping/js/html2canvas.js"></script>
<script src="<? echo base_url(); ?>assets/mapping/js/markerclusterer.js"></script>
<script src="<? echo base_url(); ?>assets/mapping/js/oms.min.js"></script>
<script src="<? echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>
<!--<script src="--><?// echo base_url(); ?><!--assets/mapping/js/AdsMap_error.js"></script>-->
<!--<script src="--><?// echo base_url(); ?><!--assets/mapping/js/AdsMapRFC.js"></script>-->

<?php
    if(isset($error)) echo "<script>bootbox.alert('".$error."')</script>";
    if(isset($success)) echo "<script>bootbox.alert('".$success."')</script>";
?>

</body>
</html>
      