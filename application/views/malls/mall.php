<?php
/**
 * User: Locotec
 * Date: 2015/01/17
 * Time: 5:32
 * Mall Edit Page 
 */

$mall_base = base_url() . 'assets/mall/';
$controller = base_url() . 'index.php/malls/';
foreach ($assets as &$asset) {
	$asset->icon = $mall_base . '../mapping/images/media_1.png';
}
?>

<?php
?>

<style type="text/css">
	#divSpecsheet div{
	}
	#divSpecsheet .modal .modal-dialog{ 
	  width: 90%; 
	  width: 900px;
	}   
	#frmSpecsheet .modal-body{
	    overflow-y: scroll;
	    height: 400px;
	}

	.nav-pills > li > a {
	  width:128px;
	  /*white-space: nowrap;*/ /*Prevent wrapping of pills*/
	}

	.list-group-indoor{
		/*background: transparent;*/
		width: 220px;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		border-radius: 2px;
	}
	.list-group-item-indoor {
		background-color:#f6f6f6;
		border: solid 1px lightgrey;
		border-radius: 2px;
		filter: alpha(opacity=80);
  		/* IE */
  		-moz-opacity: 0.8;
  		/* Mozilla */
  		opacity: 0.8;
  		/* CSS3 */
		line-height: 15px;
		padding: 1px;
	}
	.list-group-item-indoor:hover{
		background-color:lightgreen;
		color:darkgreen;
		font-weight: bold;
	}
</style>
<div class="breadcrumbs" style="margin-top:-100px;">
	<h1><span class="glyphicon glyphicon-gift"></span> Indoor Assets</h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('auction/topmenu');
}
?>

<div class="main col-xs-12">

	<ul class="nav navbar-nav section-menu">
		<li><a href="<?php echo site_url('load_stock'); ?>">Outdoor Assets</a></li>
		<li class="active"><a href="<?php echo site_url('malls'); ?>">Indoor Assets</a></li>
		<!--
		<li><a href="#" title="Coming Soon ...">Incoming Proposals<span class="badge"><?php echo $select_query->num_rows; ?></span></a></li>
		<li><a href="#" title="Coming Soon ...">Sold Items<span	class="badge"><?php echo $select_query1->num_rows; ?></span></a></li>
		-->		
	</ul>

	<div class="clear"></div>

    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        If you have a large number of assets to load, please email upload@ads2trade.co.za and one of our Account Managers will work with you directly.
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select the mode View, Edit or Add depending on what you want to do with your assets</div>
        <?php 
        $auctionsaved = $this->input->get('auctionsaved');
        if($auctionsaved>0){
        ?>
          <div class="alert alert-success">
              <a href="#" class="close" data-dismiss="alert">&times;</a>
              <strong>Success!</strong> You have successfully created an asset auction
          </div>
        <?php
        }
        ?>
</div>

<div class="main col-xs-12" style="padding:5px;">

<script src="<?php echo $mall_base; ?>js/jquery-ui.min.js"></script>

<!--TODO: Minify Mall.js andd change this script src  -->
<script src="<?php echo $mall_base; ?>js/Mall.js"></script>

<script src="<?php echo $mall_base; ?>../js/jquery.panzoom.js"></script>
<script src="<?php echo $mall_base; ?>../js/jquery.mousewheel.js"></script>

<script>
	var options = {
		available_assets: <?php echo json_encode($assets, true);?>,
		controller: '<?php echo $controller;?>',
		image_url: '<?php echo $mall_base;?>upload/',
		in_menu_asset_click: function(asset) {
			//Returns the asset object
			console.log(asset);
		},
		on_level_asset_click: function(asset) {
			console.log(asset);
		}
	};
</script>
<?php if (!$mall_id): ?>
	<script>
		var mall;
		function new_mall() {
			Mall.create(options, function(mall_inst) {
				mall = mall_inst;
				$('#container').append(mall_inst.build());
			});
		}

	</script>

	<button onclick="new_mall();" class="btn btn-success">New Mall</button>
	<?php else: ?>
	<script>
		var mall;
		$(function(){
			var controller = '<?php echo $controller;?>';
			mall = Mall.load(<?php echo $mall_id;?>, controller, options);
			$('#container').html(mall.build()  );
		});
	</script>
<?php endif; ?>

</div>

<div class="main col-xs-12" style="padding:40px;">

	<div id="container">
			<?php if ($mall_id):?>
				<img src="<?php echo base_url()?>assets/mapping/images/loading.gif" />
			<?php endif;?>	
	</div>
	<div id="mall_assets" style="width:60%" align="left">
		<h4 class="h4">Mall Assets</h4>
		<div id="mall_assets_table">
		<table class="table table-bordered headed" id="mall_level_assets_table">
			<thead>
				<tr>
					<th>Asset ID</th>
					<th>Asset Level Number</th>
					<th>Floor Position</th>
					<th>Options</th>
				</tr>
			</thead>			
			<tfoot>
				<tr>
					<th>Asset ID</th>
					<th>Asset Level Number</th>
					<th>Floor Position</th>
					<th>Options</th>
				</tr>
			</tfoot>
			<tbody>
			</tbody>						
		</table>
		</div>
	</div>

	<!--
	ZOOM TRIAL RUN :()
	<section id="focal">
	      <h1>Use the mousewheel to zoom on a focal point</h1>
	      <div class="parent">
	        <div class="panzoom">
	          <img src="http://blog.millermedeiros.com/wp-content/uploads/2010/04/awesome_tiger.svg" width="900" height="900">
	        </div>
	      </div>
	      <script>
	        (function() {
	          var $section = $('#focal');
	          var $panzoom = $section.find('.panzoom').panzoom();
	          $panzoom.parent().on('mousewheel.focal', function( e ) {
	            e.preventDefault();
	            var delta = e.delta || e.originalEvent.wheelDelta;
	            var zoomOut = delta ? delta < 0 : e.originalEvent.deltaY > 0;
	            $panzoom.panzoom('zoom', zoomOut, {
	              increment: 0.1,
	              animate: false,
	              focal: e
	            });
	          });
	        })();
	      </script>
	    </section>
		-->
</div>

<!-- ASSET POPUPS -->

<!-- Asset Operations Modal -->

<form name="frmAssetOptions" method="post" action="#">
<div class="modal fade" id="frmAssetOptions" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-list-alt"></span>
      <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action"></span> Asset Processing Options';?></h4>
    </div>  

    <div class="modal-body">

      <div class="row"> 
        <div class="col-xs-3">
          <a class="thumbnail" href="#" style="width: 200px; height: 200px;">
            <img src="<?php echo base_url('assets/add1.jpg'); ?>" name="asset_image">
          </a>
        </div>
        
        <div id="map-canvas-popup" style="position:absolute; left:230px;width: 320px; height: 190px;">
          <div style="text-align:left; border:1px solid red; visibility:hidden; ">
          </div>
          
        </div>
        
        <div id="pano-popup" 
          style="border:1px solid blue;text-align:left; position:absolute; 
          left:230px;width: 320px; height: 190px; ">
          
          <center>
            <br>
            Loading Street View ...
            <br>
            <img src="<?php echo base_url('assets/loading.gif'); ?>">
          </center>
          
        </div>
      </div>

      <div class="row">
        <input type="hidden" value="" name="ass_id" id="asset_id">
        <input type="hidden" name="auction_min" value=0>
        <input type="hidden" value="" name="ass_name" id="ass_name">
          <h5 class="h5" style="padding-left:15px;"><b>Reference: </b><span id="ass_reference"></span> 
          &nbsp;&nbsp;&nbsp;&nbsp;<b>Availability: </b><span id="availability"></span></h5>
          <h5 class="h5" style="padding-left:15px;"><b>Description: </b><span id="description">Description will go here ...</span></h5>       
      </div>  
    </div>

    <div class="modal-footer" style="text-align:center;">
      <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-info-sign"></span>
        Choose an option below to process this asset 
      </div>

      <button type="button" class="btn btn-primary opAuction" data-dismiss="modal" 
      title="Add this Asset to an Auction">
        <span id="opAuction" name="modal-action">Auction Asset</span>
      </button>
      <button class="btn btn-primary opEdit" title="Edit the Asset's Details" data-dismiss="modal">
        <span id="opEdit" name="modal-action">Edit Asset</span>
      </button>
      <button class="btn btn-primary opActivate" title="Active or Diactivate this Asset">
        <span id="opActivate" name="modal-action">Activate/Deactivate</span>
      </button>  
      <button class="btn btn-primary opSpecsheet" title="View this Asset's Specsheet"
       data-target="frmSpecsheet" data-dismiss="modal">
        <span id="opSpecsheet" name="modal-action">Specsheet</span>
      </button>    
      <button class="btn btn-primary" data-dismiss="modal">
        <span id="opClose" name="modal-action">Close</span>
      </button> 
    </div>
  </div>
</div>
</div></form>

<!-- Create Asset Auction -->

<form name="frmCreateAuction" id="frmCreateAuction" 
  method="post" action="<?php echo site_url('auctions/create?action=create&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva'); ?>">
<div class="modal fade" id="addAuctionCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-shopping-cart"></span>
      <?php echo isset($ass_name)?$ass_name:'Create A New Auction';?></h4>
    </div>

    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0>
      <input type="hidden" value="" name="ass_name" id="ass_name">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>-->
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
    <div class="row">
      <p class="col-xs-6">
      <label for="from_date">Duration: <span id="price" name="price"></span></label> 
      <select class="form-control" name="duration" id="duration">
      <?php                                    
      $ar = $this->input->post('duration');
      foreach ($durations as $row) {?>
        <option <?php for($i=0;$i<count($ar);$i++){
                        if ($ar[$i] == $row->days){ echo 'Selected';}
                      } ?> 
          value="<?php echo $row->days;?>" > <?php echo  $row->description; ?></option>
      <?php }
      ?>

      </select>
      </p>

      <?php
      //Get the next monday
      $from_next_monday = date('Y-m-d', strtotime('next monday'));
      ?> 
      <p class="col-xs-6">
          <label for="from_date">Start Date</label>                           
          <input type="date" name="from_date" value="<?php echo $from_next_monday;?>" id="from_date" class="form-control">
          <input type="hidden" name="to_date" value="" id="to_date" class="form-control">
      </p>
      <p class="col-xs-6">
          <label for="price">Minimum Bid Amount</label>                           
          <input type="text" name="price" value="<?php echo $minimum_bid;?>" id="price" class="form-control">
      </p> 
      <p class="col-xs-6">
          <label for="increment">Bid Increment Amount</label>                           
          <input type="text" name="increment" value="<?php echo $increment;?>" id="increment" class="form-control">
      </p> 
      <p class="col-xs-6"> 
          <label for="buy_now">Allow Buy Now</label>                           
          <input type="checkbox" name="allow_buy_now" value="1" id="allow_buy_now" checked="checked">
      </p>
      <p class="col-xs-6"> 
          <label for="buy_now">Buy Now Price</label>                           
          <input type="text" name="buy_now" value="<?php echo $buy_now;?>" id="buy_now" class="form-control">
      </p>
      <p class="col-xs-6"> 
          <label for="add_to_current">Add to current auction</label>                           
          <input type="checkbox" name="add_to_current" value="1" id="add_to_current">
      </p>
      <p class="col-xs-6"> 
          <label for="add_to_next">Add to next auction</label>                           
          <input type="checkbox" name="add_to_next" value="1" id="add_to_next" checked="checked">
      </p>
      </div>
    </div>

    <div class="modal-footer" style="padding-top:30px;">
      <button type="submit" onclick="document.frmCreateAuction.submit();return false;" class="btn btn-primary" data-dismiss="modal">Create Auction</button>
    </div>
  </div>
</div>
</div></form>

<!-- Asset Specsheet Modal -->

<div id="divSpecsheet">
  <div class="modal fade" id="frmSpecsheet" tabindex="-1" role="dialog" 
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:lightgrey;">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
        <span class="sr-only">Close</span></button>
        <h4 class="h4 modal-title" id="myModalLabel">
          <span class="h4 glyphicon glyphicon-check"></span>
        <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action"> Asset Specsheet</span>';?></h4>
      </div>  
      <div class="modal-body">
        <input type="hidden" value="" name="ass_id" id="auction_asset_id">
        <input type="hidden" name="auction_min" value=0>
        <input type="hidden" value="" name="ass_name" id="ass_name">
        <iframe id="iframeSpecsheet" src="" width="100%" height="400px">
          <center>
            Loading specsheet ...
            <img src="<?php echo base_url('assets/loading.gif'); ?>">
          </center>
        </iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">
        <span id="modal-action3" name="modal-action">Close</span>
        </button>
      </div>
    </div>
  </div>
  </div>
</div>

<!-- Activate / Desctivate Asset Modal -->

<form name="frmActivate" method="post" 
action="<?php echo site_url('auctions/create?action=activate&type=media_owner&session=344ffffsHHhddhzxxRTggdgdvva'); ?>">
<div class="modal fade" id="siteActivate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header" style="background-color:lightgrey;">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="h4 modal-title" id="myModalLabel">
        <span class="h4 glyphicon glyphicon-check"></span>
      <?php echo isset($ass_name)?$ass_name:'<span id="modal-action" name="modal-action">Activated/Deactivated</span> Stock Item';?></h4>
    </div>  
    <div class="modal-body">
      <input type="hidden" value="" name="ass_id" id="auction_asset_id">
      <input type="hidden" name="auction_min" value=0>
      <input type="hidden" value="" name="ass_name" id="ass_name">
      <!--<h4 class="text-center">Create a new Auction for this Item</h4>-->
      <div class="h3">Description: <span id="description" name="description"></span></div>
    <hr>
      <h4 class="text-center">This Stock Item will be <span id="modal-action2" name="modal-action">Activated/Deactivate</span>d</h4>
    </div>
    <div class="modal-footer">
      <button type="button" onclick="document.frmActivate.submit();return false;" class="btn btn-primary" data-dismiss="modal">
      <span id="modal-action3" name="modal-action">Proceed</span>
      </button>
    </div>
  </div>
</div>
</div></form>

<!-- END POPUPS -->

<!--
Hidden field to ghold currently selected asset id
-->
<input type="hidden" name="selected_asset_id" id="selected_asset_id" value="0">

<script type="text/javascript">

    function modalshow(a) {
    var width, height, padding, top, left, modalbak, modalwin, mapA;
    var AssetId = a;

    //Set the selected Asset id
    $('#selected_asset_id').val(AssetId);

    console.log('modal show' + a);

    //$("#frmEditItem").find('span[id="description"]').html(' Asset ID: ' + a);

    //Get Asset/Site Details and populate modal 
    //$('#response').html("<b>Loading asset/site details...</b>");
    $.ajax({
        type: 'GET',
        url: "<?php echo site_url('auctions/jsonGetAssetDetails'); ?>",
        data: { c: a, p: "details" }
    })
    .done(function (data) {
       console.log(data);
       var jsonAsset = $.parseJSON(data); 
       console.log(jsonAsset);

       var asset_name = " "+jsonAsset.ass_name;
       var asset_img = jsonAsset.asset_image;
       var dft_asset_img = "<?php echo base_url('assets/add1.jpg'); ?>";

       if(jsonAsset.ass_ref != ""){
        asset_name += " (" + jsonAsset.ass_ref + ")";
       }
       
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;
       var availability = "";
       if(jsonAsset.status == 1){
        availability = " In Active Auction "; 
       } else {
        availability = " Available "; 
       }

       if(asset_img !="" && asset_img != null){
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",asset_img);
       } else {
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",dft_asset_img);
       }

       $("#frmAssetOptions").find('span[id="ass_name"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="ass_reference"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="description"]').html(jsonAsset.ass_description);
       $("#frmAssetOptions").find('span[id="availability"]').html(availability);

       //Create auction button
       $("#frmAssetOptions .opAuction").attr("data-target","#addAuctionCart");
       $("#frmAssetOptions .opAuction").attr("data-toggle","modal");
       $("#frmAssetOptions .opAuction").attr("data-id",AssetId);
       $("#frmAssetOptions .opAuction").attr("data-name",asset_name);
       $("#frmAssetOptions .opAuction").attr("data-price",0);

       //Activate/deactivate button attributes
       //data-dismiss="modal"
       $("#frmAssetOptions .opActivate").attr("data-target","#siteActivate");
       $("#frmAssetOptions .opActivate").attr("data-toggle","modal");
       $("#frmAssetOptions .opActivate").attr("data-dismiss","modal");
       $("#frmAssetOptions .opActivate").attr("data-id",AssetId);
       $("#frmAssetOptions .opActivate").attr("data-name",asset_name);
       $("#frmAssetOptions .opActivate").attr("data-opActivate","Deactivate");

       $("#frmAssetOptions .opSpecsheet").attr("data-target","#frmSpecsheet");
       //$("#frmAssetOptions .opSpecsheet").attr("data-id",AssetId);
       $("#frmAssetOptions").find('input[name="ass_id"]').val(AssetId);

       //Adjust map center
      if (typeof google === 'object' && typeof google.maps === 'object'){
          var assetLatLong = jsonAsset.position;
          console.log(' position: '+jsonAsset.position);
          assetLatLong = assetLatLong.split(",");
          //debugger;
          var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
            var assetMapOptions = {
                center: assetLatLongObject,
                zoom: 14
            };
            
          mapA = new google.maps.Map(document.getElementById('map-canvas-popup'), assetMapOptions);

          mapA.setCenter(assetLatLongObject);
          //mapA.setZoom(savedMapZoom);
          //Update Street View as well
          var panoramaOptions = {
            position: assetLatLongObject,
            pov: {
              heading: 34,
              pitch: 10
            }
          };
          document.getElementById('pano-popup').innerHTML='';
          //$('div[id="pano"]').val('');
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano-popup').innerHTML, panoramaOptions);
          mapA.setStreetView(panorama);

          console.log(mapA);
          console.log(panoramaOptions);

      }

    })
    .fail(function () {
        alert("Error getting Asset/Site details");
        //$('#response').html("<b>Error getting Asset/Site details!</b>");
        //$("#frmEditItem .modal-body").find('span[id="description"]').html(' Asset ID: ' + a);
    });


    //Modal options
    var options = {
        "backdrop" : "true",
        "show" : "true"
    }
    //Show modal
    //$('#editItemDetails').modal(options);
    $('#frmAssetOptions').modal(options);
    }


//triggered when modal is about to be shown
$('#addAuctionCart').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     var AssetPrice = $(e.relatedTarget).data('price');

     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="description"]').html(AssetName);
     $(e.currentTarget).find('input[name="ass_name"]').val(AssetName);

     // price details, minimum bid etc
     $(e.currentTarget).find('input[name="price"]').val(AssetPrice);
     $(e.currentTarget).find('input[name="auction_min"]').val(AssetPrice);
     
});

$('#siteActivate').on('show.bs.modal', function(e) {
     var AssetId = $(e.relatedTarget).data('id');
     var AssetName = $(e.relatedTarget).data('name');
     //var AssetPrice = $(e.relatedTarget).data('price');
     var ModalAction = $(e.relatedTarget).data('modal-action');

     //asset id
     $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
     
     //asset name/description
     $(e.currentTarget).find('span[name="description"]').html(AssetName);
     $(e.currentTarget).find('input[name="ass_name"]').val(AssetName);
     
     //data-modal-action
     $(e.currentTarget).find('span[name="modal-action"]').html(ModalAction);
     
});

$('#frmAssetOptions').on('show.bs.modal', function(e) {

    //get data-id attribute of the clicked element	
    var AssetId = $(e.relatedTarget).data('id');

    if(AssetId =='' || AssetId == null || AssetId == undefined){
      //AssetId = '1011';     
      AssetId = $('#selected_asset_id').val(); 
      //console.log('AssetId:'+ AssetId)
    }
    //

    //asset id
    $(e.currentTarget).find('input[name="ass_id"]').val(AssetId);
    //$(e.currentTarget).find('input[name="asset_id"]').val(AssetId);
     
    //Get Asset details
    $.ajax({
        type: 'GET',
        url: "<?php echo site_url('auctions/jsonGetAssetDetails'); ?>",
        data: { c: AssetId, p: "details" }
    })
    .done(function (data) {
        console.log(data);
        var jsonAsset = $.parseJSON(data); 
        //console.log(jsonAsset);

       var asset_name = " "+jsonAsset.ass_name;
       var asset_img = jsonAsset.asset_image;
       var dft_asset_img = "<?php echo base_url('assets/add1.jpg'); ?>";

       if(jsonAsset.ass_ref != ""){
        asset_name += " (" + jsonAsset.ass_ref + ")";
       }
       
       var asset_address = jsonAsset.ass_street_address + ", " + jsonAsset.ass_city;
       var availability = "";
       if(jsonAsset.status == 1){
        availability = " In Active Auction "; 
       } else {
        availability = " Available "; 
       }

       if(asset_img !="" && asset_img != null){
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",asset_img);
       } else {
        $("#frmAssetOptions").find('img[name="asset_image"]').attr("src",dft_asset_img);
       }

       $("#frmAssetOptions").find('span[id="ass_name"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="ass_reference"]').html(asset_name);
       $("#frmAssetOptions").find('span[id="description"]').html(jsonAsset.ass_description);
       $("#frmAssetOptions").find('span[id="availability"]').html(availability);

      //Add attributes to opAuction button
      /*
        data-toggle="modal" 
        data-target="#addAuctionCart" 
        data-id="<?php echo $row->ass_id; ?>" 
        data-name="<?php echo $row->ass_name, ' (',$row->ass_ref,')'; ?>" 
        data-price="<?php echo $total; ?>"
      */       
       $("#frmAssetOptions .opAuction").attr("data-target","#addAuctionCart");
       $("#frmAssetOptions .opAuction").attr("data-toggle","modal");
       $("#frmAssetOptions .opAuction").attr("data-id",AssetId);
       $("#frmAssetOptions .opAuction").attr("data-name",asset_name);
       $("#frmAssetOptions .opAuction").attr("data-price",0);
       //Adjust map center
       
      if (typeof google === 'object' && typeof google.maps === 'object'){
          var assetLatLong = jsonAsset.position.split(",");
          var assetLatLongObject = new google.maps.LatLng(assetLatLong[0],assetLatLong[1]);
            var assetMapOptions = {
                center: assetLatLongObject,
                zoom: 14
            };
          
          
          //$("#frmAssetOptions").find('div[id="map-canvas-popup"]')
          mapA = new google.maps.Map(document.getElementById('map-canvas-popup'), 
                                      assetMapOptions);

          console.log('mapA 2a' + mapA);

          mapA.setCenter(assetLatLongObject);
          //mapA.setZoom(savedMapZoom);
          //Update Street View as well
          var panoramaOptions = {
            position: assetLatLongObject,
            pov: {
              heading: 34,
              pitch: 10
            }
          };
          document.getElementById('pano-popup').innerHTML = '';
          //$("#frmAssetOptions").find('div[id="pano"]').val('');
          //$("#frmAssetOptions").find('div[id="pano"]').html('');
          var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano-popup').innerHTML, 
                                                              panoramaOptions);
          mapA.setStreetView(panorama);

          console.log('mapA 2' + mapA);
      }
      

    })
    .fail(function () {
        alert("Error getting Asset details");
    });

});

//Asset Operations Buttons Actions
//Auction button on auction popup
$("#frmEditItem .opAuction").click(function() {
  //alert('Edit Item clicked');
  //$("#frmAssetOptions .opAuction").trigger('click');
  var AssetId = $("#frmEditItem").find('input[name="ass_id"]').val();

  //Modal options
  var options = {
      "backdrop" : "true",
      "show" : "true"
  }

  //Show modal
  $('#frmAssetOptions').modal(options);

}); 

//Auction button
$("#frmAssetOptions .opAuction").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    if(AssetId == ""){
      var AssetId = $("#frmEditItem").find('input[name="ass_id"]').val();
    }
    //alert('Auction Button Clicked!');
}); 
//Edit button
$("#frmAssetOptions .opEdit").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    var edit_url = "<?php echo site_url('load_stock/view_asset?type=indoor&ass_id=');?>"+AssetId;
    window.location.href=edit_url;
}); 
//Activate/deactivate button
$("#frmAssetOptions .opActivate").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    if(AssetId == ''){
      AssetId = $('#selected_asset_id').val();
    }
    //alert('Activate/Deactivate button Clicked!');
}); 
//Activate/deactivate button
$("#frmAssetOptions .opSpecsheet").click(function() {
    // Edit button clicked
    var AssetId = $("#frmAssetOptions").find('input[name="ass_id"]').val();
    //console.log('');
    if(AssetId == ''){
      AssetId = $('#selected_asset_id').val();
    }    
    var specsheet_url = "<?php echo site_url('auctions/spec_sheet/?ass_id=');?>"+AssetId;
    //window.location.href=specsheet_url;
    //alert(specsheet_url);
    //Modal options
    var options = {
      "backdrop" : "true",
      "show" : "true",
      "width": "800px" /*,
      "remote": specsheet_url*/
    }

    //var modalBody = $('#frmSpecsheet .modal-body');
    //modalBody.load(specsheet_url);
    //iframeSpecsheet
    //$('#frmSpecsheet').removeData('bs.modal');
    //$('#frmSpecsheet').modal({remote: 'some/new/context?p=' + $(this).attr('buttonAttr') });

    $('#iframeSpecsheet').attr('src',specsheet_url);

    //Show modal
    $('#frmSpecsheet').modal(options);

}); 

$(document).ready(function(){
	var canvases = document.getElementsByTagName('canvas');
	console.log(canvases);
	$('.kineticjs-content').hover(function() {
			console.log('Mouse over floor map');
			$(this).addClass('transition');
}, function() {
	$(this).removeClass('transition');
	});
});

</script>
<style>
.img-zoom {
	/*width:310px;*/
	-webkit-transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
	-ms-transition: all .2s ease-in-out;
}

.transition {
	-webkit-transform: scale(2); 
	-moz-transform: scale(2);
	-o-transform: scale(2);
	transform: scale(2);
}

* {
margin: 0;
padding: 0;
}
.magnify {
width: 275px;
margin: 50px auto;
position: relative;
}
/*Lets create the magnifying glass*/
.large {
width: 150px;
height: 150px;
position: absolute;
border-radius: 100%;
/*Multiple box shadows to achieve the glass effect*/
box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85),  0 0 7px 7px rgba(0, 0, 0, 0.25),  inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
/*Lets load up the large image first*/
/*background: url('p5.jpg') no-repeat;*/
/*hide the glass by default*/
display: none;
}
/*To solve overlap bug at the edges during magnification */
.small {
display: block;
}
#col1, #col2, #col3, #col4 {
float: left;
width: 25%;
}
</style>