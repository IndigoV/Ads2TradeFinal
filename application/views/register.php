<!DOCTYPE html>
<html>
  <head>
      <title>Ads to Trade - Register</title>
      <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/bootstrap.css" />
      <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/login.css" />
      <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/dataTables.bootstrap.css" />
      <link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/css/bootstrap-checkbox.css" />
      
      <script src="<?php echo base_url();?>assets/js/jquery.min.js" type="text/javascript"></script>
      <script src="<?php echo base_url();?>assets/js/bootstrap-checkbox.js" type="text/javascript"></script>

      <script src="<?php echo base_url();?>assets/scripts.js" type="text/javascript"></script>

      <!-- jquery validator plugin -->
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>
      <!-- jquery validator plugin -->

      <meta name="viewport" content="width=device-width" />
  </head>
  <body>
        
        <center style="margin-botton:-20px;">
          <div class="logo">
            <img src="<?php echo base_url();?>assets/login_logo.png">
          </div>
        </center>

        <form class="login_form" action="" method="post" id="register">

          <div class="fbkg">
            <label>Company Name or Your Full Name</label>
            <input name="company_name" type="text" class="form-control" data-validation="required" data-validation-error-msg="Please specify the Company Name">

            <label>Telephone</label>
            <input name="mobile_number" type="text" class="form-control" data-validation="number" data-validation-error-msg="Please enter a valid telephone number e.g. 0110235536">

            <label>Email Address</label>
            <input name="email" type="text" class="form-control" data-validation="email" data-validation-error-msg="Please enter a valid email address">

            <label>Choose Account Type</label>
              <label>
                <input value="1" type="radio" name="account_type" id="opt_add" title="Advertiser" checked="">
                &nbsp;&nbsp;Advertiser
              </label>
              <label>
                <input value="2" type="radio" name="account_type" id="opt_edit" title="Media Owner">
                &nbsp;&nbsp;Media Owner
              </label> 

            <!--
            <label>Password </label>
            <input type="password" class="form-control">

            <label>Confirm Password </label>
            <input type="confirm_password" class="form-control">
            -->

            <input type="submit" value="Create an account" class="btn btn-primary">
            <input type="hidden" name="action" value="register">
            <br>
            <br>

            <p class="text-center message">Already Registered? <a href="<?php echo site_url("login"); ?>">Click Here</a> to login</p>
          </div>

        </form>

  		<div class="clear"></div>
      </div>
    </div>
    </div>

    <script src="<?php echo base_url();?>assets/js/bootstrap.min.js"></script>  
    <script src="<?php echo base_url();?>assets/js/dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="<?php echo base_url();?>assets/js/jquery.dataTables.js" type="text/javascript"></script>

    <!-- begin form validation -->
    <script type="text/javascript">   

    var $messages = $('#error-message-wrapper');

    // Setup form validation only on the form having id "newCampaign"
    $.validate({
      form : '#register',
      validateOnBlur : false,     // disable validation when input looses focus
      errorMessagePosition : 'top', //can also be set to top
      scrollToTopOnError : false
    });

    </script>
    <!-- end form validation -->

    
  </body>
</html>
      