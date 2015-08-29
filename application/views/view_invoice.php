<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/invoice-style.css">
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/invoice-print.css">

  <div id="page-wrap">

    <div id="header">INVOICE</div><br>
    
    <div id="identity">
    
            <span id="address">Tel: 0861 222 123 <br>  Email: info@adreach.co.za <br>  Physical Address: 8 Archimedes Street, Kramerville, Sandton, 2148</span>

            <div id="logo">
              <img id="image" src="<?php echo base_url(); ?>assets/images/invoice_logo.png" />
            </div>
    
    </div>
    
    <div style="clear:both"></div>
    
    <div id="customer" style="padding-top:5px;">

            <span id="customer-title">Invoice For: Buyer Company Name</span>

            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td><span>000123</span></td>
                </tr>
                <tr>

                    <td class="meta-head">Date</td>
                    <td><span id="date">May 25, 2015</span></td>
                </tr>
                <tr>
                    <td class="meta-head">Amount Due</td>
                    <td><div class="due">R3,500.00</div></td>
                </tr>

            </table>
    
    </div>
    
    <table id="items">
    
      <tr>
          <th>Item</th>
          <th>Description</th>
          <th>Unit Cost</th>
          <th>Quantity</th>
          <th>Price</th>
      </tr>
      
      <tr class="item-row">
          <td class="item-name"><div class="delete-wpr"><textarea>Steetpole Auction # 45233110</textarea><a class="delete" href="javascript:;" title="Remove row">X</a></div></td>
          <td class="description"><textarea>Asset Details: 566236 - Hans Schoeman Street Between M1 And Hans Strydom Drive - M1a</textarea></td>
          <td><textarea class="cost">R3500.00</textarea></td>
          <td><textarea class="qty">1</textarea></td>
          <td><span class="price">R3500.00</span></td>
      </tr>
      <!--
      <tr class="item-row">
          <td class="item-name"><div class="delete-wpr"><textarea>SSL Renewals</textarea><a class="delete" href="javascript:;" title="Remove row">X</a></div></td>

          <td class="description"><textarea>Yearly renewals of SSL certificates on main domain and several subdomains</textarea></td>
          <td><textarea class="cost">$75.00</textarea></td>
          <td><textarea class="qty">3</textarea></td>
          <td><span class="price">$225.00</span></td>
      </tr>

      <tr id="hiderow">
        <td colspan="5"><a id="addrow" href="javascript:;" title="Add a row">Add a row</a></td>
      </tr>
      -->      
      <tr>
          <td colspan="2" class="blank"> </td>
          <td colspan="2" class="total-line">Subtotal</td>
          <td class="total-value"><div id="subtotal">R3500.00</div></td>
      </tr>
      <tr>

          <td colspan="2" class="blank"> </td>
          <td colspan="2" class="total-line">Total</td>
          <td class="total-value"><div id="total">R3500.00</div></td>
      </tr>
      <tr>
          <td colspan="2" class="blank"> </td>
          <td colspan="2" class="total-line">Amount Paid</td>

          <td class="total-value"><textarea id="paid">R0.00</textarea></td>
      </tr>
      <tr>
          <td colspan="2" class="blank"> </td>
          <td colspan="2" class="total-line balance">Balance Due</td>
          <td class="total-value balance"><div class="due">R3500.00</div></td>
      </tr>
    
    </table>
    
    <div id="terms">
      <h5>Terms</h5>
      <textarea>Payment within 48 hours. Finance Charge of 1.5% will be made on unpaid balances after 24 hours and the asset will be put back on auction.</textarea>
    </div>
  
  </div>