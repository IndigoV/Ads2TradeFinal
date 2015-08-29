<style type="text/css">

#divInvoice .modal .modal-dialog{ 
  width: 90%; 
  width: 900px;
}   
#frmInvoice .modal-body{
    overflow-y: scroll;
    height: 400px;
}    

</style>

        <div class="breadcrumbs">
          <h1>
            <span class="glyphicon glyphicon-list-alt"></span> Invoices
          </h1>
        </div>

        

        <div class="main">
          
        <table class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th align="right">Amount.</th>
                    <th>.Status</th>
                    <th></th>
                </tr>
            </thead>
     
            <tbody>
                <?php
                //print_r($invoices);
                //exit;
                if(!empty($invoices)){
                    foreach ($invoices as $invoice_line) {
                        # code...
                        ?>
                        <tr>
                            <td><?php echo $invoice_line->id; ?></td>
                            <td><?php echo $invoice_line->datetime; ?></td>
                            <td><?php echo $invoice_line->description; ?></td>
                            <td align="right"><?php echo number_format($invoice_line->amount,2); ?></td>
                            <td>
                                <?php
                                if($invoice_line->status > 0){
                                    $status = "Paid";
                                } else {
                                    $status = "UnPaid";    
                                }
                                echo $status;
                                ?>
                            </td>
                            <td>
                                <a title="Make Payment" style="cursor:pointer" href="#" 
                                class="btnMakePayment">
                                <span class="h4 glyphicon glyphicon-shopping-cart"></span></a>
                                <span>&nbsp;</span>
                                
                                <a title="View PDF" style="cursor:pointer" href="#"
                                style="cursor:pointer" data-toggle="modal" data-target="#frmInvoice"
                                data-id="<?php echo $invoice_line->id; ?>"
                                data-date-time="<?php echo $invoice_line->datetime; ?>"
                                data-description="<?php echo $invoice_line->description; ?>"
                                data-status="<?php echo $status;?>">
                                <span class="h4 glyphicon glyphicon-book"></span></a>

                            </td>
                        </tr>  
                        <?php
                    }
                } else {
                ?>
                <tr>
                    <td colspan="6">
                        <p>
                        You currently do not have any invoices yet. 
                        <a href="<?php echo site_url('load_stock/asset_details3'); ?>">Click Here</a> to bid on or buy advertising space.
                        </p>
                    </td>
                </tr>                
                <?php
                }
                ?>
            </tbody>
        </table>
              
        </div>

<!-- Asset Specsheet Modal -->

<div id="divInvoice">
  <div class="modal fade" id="frmInvoice" tabindex="-1" role="dialog" 
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:lightgrey;">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
        <span class="sr-only">Close</span></button>
        <h4 class="h4 modal-title" id="myModalLabel">
          <span class="h4 glyphicon glyphicon-check"></span>
        <?php echo '<span id="modal-action" name="modal-action"> View / Print Invoice </span>';?></h4>
      </div>  
      <div class="modal-body">
        <input type="hidden" value="" name="invoice_id" id="invoice_id">
        <input type="hidden" name="auction_min" value=0>
        <input type="hidden" value="" name="ass_name" id="ass_name">
        <iframe id="iframeInvoice" src="" width="100%" height="400px">
          <center>
            Loading invoice ...
            <img src="<?php echo base_url('assets/loading.gif'); ?>">
          </center>
        </iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">
            <span id="modal-print" name="modal-action">Print</span>
        </button>      
        <button type="button" class="btn btn-primary" data-dismiss="modal">
            <span id="modal-close" name="modal-action">Close</span>
        </button>
      </div>
    </div>
  </div>
  </div>
</div>

<script>

//Make payment
$('.btnMakePayment').on('click',function(){

    $('<div style="widht:200px;"></div>').dialog({
        modal: true,
        title: "Invoice Payment Options",
        open: function() {
          var markup = '<p>The payment module is still under development.<br><br>Please contact us at <b>accounts@ads2trade.co.za</b> for payment arrangements</p>';
          $(this).html(markup);
        },
        buttons: {
          Ok: function() {
            $( this ).dialog( "close" );
          }
        }
      });  //end confirm dialog

});

//Print Invoice
$('#modal-print').on('click',function(){
    $("#iframeInvoice").get(0).contentWindow.print();
});

//Fetch invoice url before modal display
$('#frmInvoice').on('show.bs.modal', function(e) {
     var InvoiceID = $(e.relatedTarget).data('id');
     var InvDate = $(e.relatedTarget).data('date-time');
     var InvDescription = $(e.relatedTarget).data('description');
     var InvoiceURL = '<?php echo site_url("invoice/view")?>';

     //Invoice modal title View / Print Invoice
     $(e.currentTarget).find('span[id="modal-action"]').html('View / Print Invoice #'+InvoiceID);

     //Invoice url
     $(e.currentTarget).find('iframe[id="iframeInvoice"]').attr('src', InvoiceURL+'/?inv='+InvoiceID);
     
}); 

</script>