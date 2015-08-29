<div class="clear"></div>
</div>
</div>
</div>

<script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/js/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>bootbox/bootbox.min.js" type="text/javascript"></script>

<!-- Datatables CSS --> 
<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/datatables/css/jquery.dataTables.css'); ?>">
<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/datatables/css/dataTables.tableTools.css'); ?>">

<!-- Datatables TableTools JS -->
<script type="text/javascript" language="javascript" src="<?php echo base_url('assets/datatables/js/dataTables.tableTools.js')?>"></script>

<!-- Loaded in autions views 
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyA5bJNyTu51BbOwopYMiV93RkuPO1yoSqA&sensor=false"></script>
-->

<!-- RFP/campaign only scripts (causing conflicts in auctions, need more investigation to see why)
<script src="<? echo base_url(); ?>assets/js/new_campaign.josh.js"></script>
<script src="<? echo base_url(); ?>assets/js/maps.josh.js"></script>
<script src="<? echo base_url(); ?>assets/js/google.maps.search.josh.js"></script>
-->

<script src="<? echo base_url(); ?>assets/js/auctions.scripts.js"></script>
<script src="<? echo base_url(); ?>assets/js/select2.min.js"></script>


<script src="<? echo base_url(); ?>assets/mapping/js/html2canvas.js"></script>
<script src="<? echo base_url(); ?>assets/mapping/js/markerclusterer.js"></script>
<script src="<? echo base_url(); ?>assets/mapping/js/oms.min.js"></script>
<!-- Loaded in auctions views 
<script src="<? echo base_url(); ?>assets/mapping/js/AdsMap.js"></script>
-->
<!--<script src="--><?// echo base_url(); ?><!--assets/mapping/js/AdsMap_error.js"></script>-->
<!--<script src="--><?// echo base_url(); ?><!--assets/mapping/js/AdsMapRFC.js"></script>-->

<?php
    if(isset($error)) echo "<script>bootbox.alert('".$error."')</script>";
    if(isset($success)) echo "<script>bootbox.alert('".$success."')</script>";
?>
      <script>
        //Validate Bid Value
        $(document).ready(function () {
            //Add watch
            $('#btnAddWatch').on("click", function( event ) {
                
                var form = $('#frmAddWatch');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';
                console.log('watchList:'+form.serialize());
                console.log('URL:'+auction_base_url + '/' + form.attr('action'));

                $.ajax({
                    type: form.attr('method'),  //form method
                    url: auction_base_url + '/' + form.attr('action'),   //form action
                    data: form.serialize(),
                    success: function(data, status) {
                        $('#watchList').modal('hide');
                        //Modal Message here
                        alert('Thank you! The asset has been added to your watchlist.');
                        //window.location.reload();
                    }
                });

            });

            //buy now
            $('#btnBuyNow').on("click", function( event ) {
                
                var form = $('#frmBuyNow');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';

                $.ajax({
                    type: form.attr('method'),  //form method
                    url: auction_base_url + '/' + form.attr('action'),   //form action
                    data: form.serialize(),
                    success: function(data, status) {
                        $('#buyNow').modal('hide');
                        //Modal Message here
                        alert('Thank you! Your purchase has been captured.');
                        window.location.reload();
                    }
                });

            });

            //bid now
            $('#btnSubmit').on("click", function( event ) {

                //alert('Submit Clicked');

                var increment = $('#frmBidNow').find('input[name="increment"]').val();
                var current_bid = $('#frmBidNow').find('input[name="current_bid"]').val();
                var minimum_bid = parseFloat(increment) + parseFloat(current_bid);
                var yourbid = $('#frmBidNow').find('input[name="email"]').val();
                var form = $('#frmBidNow');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';

                yourbid = parseFloat(yourbid);
                current_bid = parseFloat(current_bid);
                increment = parseFloat(increment);

                var bidIsOK = false;
                //alert('your bid' + yourbid + ' vs ' + minimum_bid);
                
                if(isNaN(yourbid)){
                
                  yourbid = 0;
                  bidIsOK = false;
                
                } 
                if (yourbid < minimum_bid){
                
                  bidIsOK = false;
                  errMsg = "Error! Please enter a bid of "+ minimum_bid +".00 or more";
                
                } else {
                
                  bidIsOK = true;
                
                }

                console.log('method:'+form.attr('method'));
                console.log('action:'+auction_base_url + '/' + form.attr('action'));
                console.log('data:'+form.serialize());
                if(bidIsOK){
                    $.ajax({
                        type: form.attr('method'),  //form method
                        url: auction_base_url + '/' + form.attr('action'),   //form action
                        data: form.serialize(),
                        success: function(data, status) {
                            $('#placeBid').modal('hide');
                            //Modal Message here
                            alert('Thank you! Your bid has been placed');
                            window.location.reload();
                        }
                    });
                } else {
                  $('#frmBidNow').find('input[name="email"]').focus(); //set focus on the bid field
                  //$('#frmBidNow').find('snap[name="message"]').html('<div class="alert alert-error"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Error!</strong>'+ errMsg +'</div>');
                  alert(errMsg);
                }

                event.preventDefault();
            });
        });

            $('#frmBidNow').on("submit", function( event ) {

                //alert('Submit Clicked');

                var increment = $('#frmBidNow').find('input[name="increment"]').val();
                var current_bid = $('#frmBidNow').find('input[name="current_bid"]').val();
                var minimum_bid = parseFloat(increment) + parseFloat(current_bid);
                var yourbid = $('#frmBidNow').find('input[name="email"]').val();
                var form = $('#frmBidNow');
                var auction_base_url = '<?php echo site_url("auctions"); ?>';

                yourbid = parseFloat(yourbid);
                current_bid = parseFloat(current_bid);
                increment = parseFloat(increment);

                var bidIsOK = false;
                //alert('your bid' + yourbid + ' vs ' + minimum_bid);
                
                if(isNaN(yourbid)){
                
                  yourbid = 0;
                  bidIsOK = false;
                
                } 
                if (yourbid < minimum_bid){
                
                  bidIsOK = false;
                  errMsg = "Error! Please enter a bid of "+ minimum_bid +".00 or more";
                
                } else {
                
                  bidIsOK = true;
                
                }

                console.log('method:'+form.attr('method'));
                console.log('action:'+auction_base_url + '/' + form.attr('action'));
                console.log('data:'+form.serialize());
                if(bidIsOK){
                    $.ajax({
                        type: form.attr('method'),  //form method
                        url: auction_base_url + '/' + form.attr('action'),   //form action
                        data: form.serialize(),
                        success: function(data, status) {
                            $('#placeBid').modal('hide');
                            //Modal Message here
                            alert('Thank you! Your bid has been placed');
                            window.location.reload();
                        }
                    });
                } else {
                  $('#frmBidNow').find('input[name="email"]').focus(); //set focus on the bid field
                  //$('#frmBidNow').find('snap[name="message"]').html('<div class="alert alert-error"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Error!</strong>'+ errMsg +'</div>');
                  alert(errMsg);
                }

                event.preventDefault();
            });
        //});

      </script>
</body>
</html>
      