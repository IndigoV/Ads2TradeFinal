<!DOCTYPE html>
<html>
  <head>
      <title>Ads to Trade - Login</title>
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
      
      <center>
          <div class="logo">
            <img src="<?=base_url();?>assets/login_logo.png">
          </div>      
      </center>
      <form class="login_form" action="<?=site_url();?>login/validate_credentials" method="post" id="login">

          <div class="fbkg">
            <label>Username</label>
            <input type="text" class="form-control" name="username" id="username" data-validation="required" data-validation-error-msg="Please specify your unsername">

            <label><span class="pull-right"><a href="<?php echo site_url("password"); ?>">Forgot?</a></span> Password </label>
            <input type="password" class="form-control" name="password" id="password" data-validation="required" data-validation-error-msg="Please specify your password">

            <input type="submit" value="Login" class="btn btn-primary">

            <div class="text-center message">
              <a href="<?php echo site_url("register"); ?>">Create an account</a>
            </div>
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

    // Setup form validation only on the form having id "newCampaign"
    $.validate({
      form : '#login',
      validateOnBlur : false,     // disable validation when input looses focus
      errorMessagePosition : 'top', //can also be set to top
      scrollToTopOnError : false
    });

    </script>
    <!-- end form validation -->

  </body>
</html>
      