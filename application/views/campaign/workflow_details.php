<?php
// Get campaign object
//$campaign[0]
$campaign = $campaign[0];
?>
<style type="text/css">
	#campaign-grid table, th,td{font-size: small;}
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}	

	#campaign-details th{ font-weight: bold;}

.panel-default > .panel-heading {
    font-weight: 700;
    font-size: 16px;
    text-overflow: ellipsis;
    background-color: #52BAD5;
    color: #FFFFFF;
    border: none;
}

.table-curved tr,td { 
	line-height: 10px; 
	height: 10px;
}
.table-curved {
   background-color: #f6f6f6;	
   border-collapse: separate;
   border: solid #ccc 1px;
   border-radius: 6px;
   border-left: 0px;
   border-top: 0px;
}
.table-curved > thead:first-child > tr:first-child > th {
    border-bottom: 0px;
    border-top: solid #ccc 1px;
    border-top: none;
}
.table-curved td, .table-curved th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
}
.table-curved > :first-child > :first-child > :first-child {
    border-radius: 6px 0 0 0;
}
.table-curved > :first-child > :first-child > :last-child {
    border-radius: 0 6px 0 0;
}
.table-curved > :last-child > :last-child > :first-child {
    border-radius: 0 0 0 6px;
}
.table-curved > :last-child > :last-child > :last-child {
    border-radius: 0 0 6px 0;
}

.table-curved input[type="radio"] {
    -webkit-appearance: checkbox;
    -moz-appearance: checkbox;
    -ms-appearance: checkbox;     /* not currently supported */
    -o-appearance: checkbox;      /* not currently supported */
}

</style>

<div class="breadcrumbs" style="margin-top:-100px;"> <!-- margin-top: use up whitespace at the top of the page -->
    <h1><span class="glyphicon glyphicon-globe"></span>Manage Campaigns :: Edit Workflow (<?php echo $campaign->cam_ref; ?>)</h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('campaign/topmenu');
}
?>

<div class="main col-xs-12">
	<div class="row">
		<div class="table-responsive">	
		  <!--<p>Description: <?php echo $campaign->cam_description; ?></p>             -->
		  <table id="campaign-details" class="table DataTable">
		    <thead>
		      <tr style="font-weight:bold;">
		        <th>No</th>
		        <th>Campaign</th>
		        <th>Confirmed</th>
		        <th>Starts</th>
		        <th>Ends</th>
		        <th>Status</th>
		        <th>Workflow</th>		     
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td><?php echo $campaign->cam_ref; ?></td>
		        <td><?php echo $campaign->cam_title; ?></td>
		        <td><?php echo $campaign->cam_creation_date; ?></td>
		        <td><?php echo $campaign->cam_requested_start_date; ?></td>
		        <td><?php echo $campaign->cam_requested_end_date; ?></td>
		        <td><?php echo $campaign->cam_status_text; ?></td>
		        <td><?php echo $campaign->cam_workflow_text; ?></td>
		        <td></td>
		      </tr>
		    </tbody>
		  </table>
	  	</div>
	</div>
	<!--
	<div class="row" style="margin-top:-20px;">
		<table id="campaign-assets" class="cell-border" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		                <th>M/Owner</th>
		                <th>M/Owner Site</th>
		                <th>A2T Site</th>
		                <th>Site Category</th>
		                <th>Site Type</th>
		                <th>Description</th>
		                <th>Size</th>
		                <th>Region</th>
		                <th>Town</th>
		                <th>Surbub</th>
		                <th>Street Addr</th>
		            </tr>
		        </thead>
		 
		        <tbody>
		        	<?php

		        	foreach ($campaign_assets as $row) {
		        		//print_r($row->ass_owner);
		        	?>	
		            <tr>
		                <td><?php echo $row->ass_owner; ?></td>
		                <td><?php echo $row->ass_owner_site; ?></td>
		                <td><?php echo $row->ass_site; ?></td>
		                <td><?php echo $row->ass_site_category; ?></td>
		                <td><?php echo $row->ass_site_type; ?></td>
		                <td><?php echo $row->ass_description; ?></td>
		                <td><?php echo $row->asset_size; ?></td>
		                <td><?php echo $row->ass_province; ?></td>
		                <td><?php echo $row->ass_city; ?></td>
		                <td><?php echo $row->ass_street_address; ?></td>
		                <td><?php echo $row->asset_status; ?></td>		                
		            </tr>
		            <?php
		        		} //end foreach campaign assets
		        	?>
		</tbody>
		</table>
	</div>
	-->
</div>
<script type="text/javascript" language="javascript" >

	var worklist_home = "<?php echo site_url('campaign/workflow'); ?>";
	/*
	// Datepicker options
	$('.datepicker').datepicker({
		format: 'mm/dd/yyyy',
		startDate: '-3d'
	});*/

	$(document).ready(function() {
	    $('#campaign-assets').DataTable({
	    	/*"paging": false,*/		/* remove paging*/
	    	/*"filter": false,	*/	/* remove the search/filter box*/
	    	/*"bInfo" : false*/	/* remove the showing x of y entries */
	    });

	    /*	
	    	btnApply
			btnCalendar
			btnTimeline
			btnCancel
			btnSave
		*/

		$('.btnCancel').on('click',function(){
			//close and return to worklist
			window.location.href = worklist_home;
		});

		$('.btnSave').on('click',function(){
			//save and stay on page
			//window.location.href = worklist_home;
		});

		$('.btnTimeline').on('click',function(){
			//show Timeline view
			//window.location.href = worklist_home;
			$('.showTimeline').trigger('click');
		});	

		$('.btnCalendar').on('click',function(){
			//show calendar view
			//window.location.href = worklist_home;
			$('.showCalendar').trigger('click');
		});

		$('#btnUploadAttachment').on('click', function(){
			//alert('dddddddddddddd');

			var formObj = $('#multiform');
			var formURL = formObj.attr("action");
		        
			if(window.FormData !== undefined)  // for HTML5 browsers
			{
			
				var formData = new FormData(this);
		                
		                if($("#file").val().length === 0){
		                    return false;
		                }
		                else{
		                
				$.ajax({
		                        url: formURL,
					type: "POST",
					data:  formData,
					mimeType:"multipart/form-data",
					contentType: false,
		                        cache: false,
					processData:false,
					success: function(data)
		                        {
		                                alert(data);
		                                if(data === "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png"){
		                                $("#msg").html(data).fadeOut(10000);
		                                }else{
		                                    
		                                    $("#msg2").html(data).fadeOut(5000);
		                                }
		                        },
				  	error: function(jqXHR, textStatus, errorThrown) 
		                        {
		                            alert(textStatus);
		                        } 	        
		                        });   
		                    } 
		                    e.preventDefault();
		   }
		   else  //for olden browsers
			{
				//generate a random id
				var  iframeId = "unique" + (new Date().getTime());

				//create an empty iframe
				var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');

				//hide it
				iframe.hide();

				//set form target to iframe
				formObj.attr("target",iframeId);

				//Add iframe to body
				iframe.appendTo("body");
				iframe.load(function(e)
				{
					var doc = getDoc(iframe[0]);
					var docRoot = doc.body ? doc.body : doc.documentElement;
					var data = docRoot.innerHTML;
					//data return from server.
					
				});
			
			}


		});

		//Popup Buttons
		//btnUpdateWOrkflowStatus				
		$('#btnUpdateWOrkflowStatus').on('click',function(){
			//Get form valus and submit via ajax, then reload screen onces done
			var workflow_url = "<?php echo site_url('campaign/updateWorkflowStatus')?>";
			var commentIsOK = false;
			var campaign_id = "<?php echo $this->input->get('id'); ?>";
			var comments = $('#status_comment').val();
			var new_status = $('#workflow_new_status').val();
			var datetime = $('#workflow_datetime').val();

            if (comments == ''){            
              commentIsOK = false;
              errMsg = "Error! Please enter a reason for the status update";    
              $('#status_comment').focus();
              return false;        
            } else {            
              commentIsOK = true;   

	            $.ajax({
	                type: 'post',  //post method
	                url: workflow_url,   
	                data: {'campaign_id':campaign_id,'comments':comments,'new_status':new_status,'datetime':datetime},
	                success: function(data, status) {
	                    $('#edit').modal('hide');
	                    //Modal Message here
	                    alert('Workflow status has been updated');
	                    window.location.reload();
	                }
	            });

            }

		});
		
		//btnUpdateAssetStatus
		$('#btnUpdateAssetStatus').on('click',function(){
				//Get form valus and submit via ajax, then reload screen onces done
				var workflow_url = "<?php echo site_url('campaign/updateAssetStatus')?>";
				var commentIsOK = false;
				var campaign_id = "<?php echo $this->input->get('id'); ?>";
				var comments = $('#asset_status_comment').val();
				var new_status = $('#cbo_asset_status').val(); //get the selected status
				//var new_status = $("input:radio[name='asset_status']:checked").val();
				var datetime = $('#asset_datetime').val();
				var update_status_all = $("input:radio[name='update_status_all']:checked").val();

				// Get all selected assets
				var allAssetCheckboxes = document.getElementsByClassName('chkSelectAllAssets');
				var allSelected = 0;
			    for(var j = 0; j < allAssetCheckboxes.length; j++) {
			    	var e = allAssetCheckboxes[j];
			    	if((e.type=='checkbox') && (!e.disabled)){
			    	    //$('#'+e.id).trigger('click');  //Needed for bootstrap/display to update/refresh
			    	    if(e.checked == true){
			    	    	allSelected += ',' + e.value;
			    	    }
			    	}
			    }	

			    if(allSelected == 0 && update_status_all == 0){ //Dont apply to all & No assets selected
			    	alert('You have not selected any assets, Got to the List View and choose your assets'); 
			    	$('.showList').trigger('click'); //goto Asset List View
			    	$('#assetStatus').modal('hide');
			    	return false;
			    } /*else {
			        //alert('Updating Selected Assets: '+allSelected + ':' + update_status_all);
			    	console.log('selected:'+allSelected);	
			    	//return true;
			    }*/
			    //alert('Checking Comments');
	            if (comments == ''){            
	              //commentIsOK = false;
	              errMsg = "Error! Please enter a reason for the status update";
	              alert(errMsg);    
	              $('#asset_status_comment').focus();
	              return false;        
	              //alert('Comment Error');
	            } else {            
	              //commentIsOK = true;   
	              	//alert('Before Submit');
		            $.ajax({
		                type: 'post',  //post method
		                url: workflow_url,   
		                data: {'campaign_id':campaign_id,
		                       'comments':comments,
		                       'new_status':new_status,
		                       'datetime':datetime,
		                	   'update_status_all':update_status_all, 
		                	   'assets':allSelected},
		                success: function(data, status) {
		                    $('#assetStatus').modal('hide');
		                    //Modal Message here
		                    alert('Workflow Assets statuses have been updated');
		                    window.location.reload();
		                }
		            });

	            }

			});

		});

	//Attachment uplaods

	$('#btnUploadAttachment').on('click', function(){
//		alert(' uploading ...')	;

		var formObj = $('#multiform');
		var formURL = formObj.attr("action");
	        
		if(window.FormData !== undefined)  // for HTML5 browsers
		{
		
			var formData = new FormData(this);
	                
	                if($("#file").val().length === 0){
	                    return false;
	                }
	                else{
	                
			$.ajax({
	                        url: formURL,
				type: "POST",
				data:  formData,
				mimeType:"multipart/form-data",
				contentType: false,
	                        cache: false,
				processData:false,
				success: function(data)
	                        {
	                                alert(data);
	                                if(data === "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png"){
	                                $("#msg").html(data).fadeOut(10000);
	                                }else{
	                                    
	                                    $("#msg2").html(data).fadeOut(5000);
	                                }
	                        },
			  	error: function(jqXHR, textStatus, errorThrown) 
	                        {
	                            alert(textStatus);
	                        } 	        
	                        });   
	                    } 
	                    e.preventDefault();
	   }
	   else  //for olden browsers
		{
			//generate a random id
			var  iframeId = "unique" + (new Date().getTime());

			//create an empty iframe
			var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');

			//hide it
			iframe.hide();

			//set form target to iframe
			formObj.attr("target",iframeId);

			//Add iframe to body
			iframe.appendTo("body");
			iframe.load(function(e)
			{
				var doc = getDoc(iframe[0]);
				var docRoot = doc.body ? doc.body : doc.documentElement;
				var data = docRoot.innerHTML;
				//data return from server.
				
			});
		
		}


	});	

	$("#submit").click(function(){
		//alert(' 2nd buttons');
		/*
	         $.ajax({
				     type: "POST",
				 url: "process.php",
				 data: $('form.contact').serialize(),
				         success: function(msg){
				                 $("#thanks").html(msg)
				        $("#form-content").modal('hide'); 
				         },
				 error: function(){
				 alert("failure");
				 }
	       });
		*/
	 });

	$("#multiform").submit(function(e)
	{
	    e.preventDefault(); 
	    return false;   
		var formObj = $(this);
		var formURL = formObj.attr("action");
	        
		if(window.FormData !== undefined)  // for HTML5 browsers
		{
		
			var formData = new FormData(this);
	                
	                if($("#file").val().length === 0){
	                    return false;
	                }
	                else{
	                
			$.ajax({
	                        url: formURL,
				type: "POST",
				data:  formData,
				mimeType:"multipart/form-data",
				contentType: false,
	                        cache: false,
				processData:false,
				success: function(data)
	                        {
	                                alert(data);
	                                if(data === "Your file upload seem to have errors: file size must be less than 5MB, file extention/type must be gif|jpg|jpeg|png"){
	                                $("#msg").html(data).fadeOut(10000);
	                                }else{
	                                    
	                                    $("#msg2").html(data).fadeOut(5000);
	                                }
	                        },
			  	error: function(jqXHR, textStatus, errorThrown) 
	                        {
	                            alert(textStatus);
	                        } 	        
	                        });   
	                    } 
	                    e.preventDefault();
	   }
	   else  //for olden browsers
		{
			//generate a random id
			var  iframeId = "unique" + (new Date().getTime());

			//create an empty iframe
			var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');

			//hide it
			iframe.hide();

			//set form target to iframe
			formObj.attr("target",iframeId);

			//Add iframe to body
			iframe.appendTo("body");
			iframe.load(function(e)
			{
				var doc = getDoc(iframe[0]);
				var docRoot = doc.body ? doc.body : doc.documentElement;
				var data = docRoot.innerHTML;
				//data return from server.
				
			});
		
		}

	});

</script>

<script type="text/javascript" language="javascript" >

	var count_tbl_rows = 0;
	var arrRows;
	var myTr = [];
	var totalRecords = 0;
	var calendarData = "";
	var timelineData = "";

	//For Timeline & Calendar View

	var myTrs = [];
	var myCols = [];
	var col = 1;
	var row = 1;
	var eventObjectList = [];

	//Show Timeline Button Clicked
	$('.showTimeline').on('click',function(){
		//alert('Show Timeline');
	        var container = document.getElementById('timeline');
	        var chart = new google.visualization.Timeline(container);
	        var dataTable = new google.visualization.DataTable();

	        dataTable.addColumn({ type: 'string', id: 'Status' });
	        dataTable.addColumn({ type: 'string', id: 'Name' });
	        //dataTable.addColumn({ type: 'string', role: 'tooltip' });
	        dataTable.addColumn({ type: 'date', id: 'Start' });
	        dataTable.addColumn({ type: 'date', id: 'End' });

			$('#campaign-grid > tbody > tr').each(function () {

				myCols = [];
				tempCols = [];
				col = 0;
				console.log("row:"+row++);
	               $(this).find('td').each(function () {
	               	console.log("   col :"+col);
		               	if(col == 1){
		               		tempCols[0] = $(this).text();
		               	}
		               	if(col == 6){
		               		tempCols[1] = $(this).text();
		               	}
		               	if(col == 3){
		               		starts = $(this).text();
		               		starts = starts.split('/');
		               		tempCols[2] = new Date(2000+parseInt(starts[2]),starts[1],starts[0]);
		               		//tempCols[2] = new Date(2014,starts[1],starts[0]);
		               	}
		               	if(col == 4){
		               		ends = $(this).text();
		               		ends = ends.split('/'); 
		               		//console.log(ends); console.log(parseInt(ends[2])); console.log(2000+parseInt(ends[2]));
		               		//console.log(ends[1]); console.log(ends[0]);
		               		//tempCols[3] = new Date(2000+parseInt(ends[2]),parseInt(ends[1]),parseInt(ends[0]));
		               		tempCols[3] = new Date(2015,ends[1],ends[0]); /* TODO: fix date to pickup year from campaign*/
		               	}		               			               	
		               	col++;                   
	               });
	            for(i=0; i<4; i++){
	            	myCols.push(tempCols[i]);
	            }   				
				myTrs.push(myCols);
       		});
			//alert(myTrs);
			//console.log(myTrs);

			//dataTable.addRows(myTrs);

			//Add Rows
			<?php
			foreach ($campaign_assets as $row) {
				# code...
				//extract day, month (0 based since we will put it into javascript) and year from date
				//// Start Date
				//$starts = date('D M d Y H:i:s O',strtotime($row->from_date));
				//$ends = date('D M d Y H:i:s O',strtotime($row->to_date));

				// Start Date
				$start_day = date('d',strtotime($row->from_date));
				$start_mon = date('m',strtotime($row->from_date))-1;
				$start_year = date('Y',strtotime($row->from_date));
				// End Date
				//$ends = date('D M d Y H:i:s O',strtotime($row->to_date));
				$end_day = date('d',strtotime($row->to_date));
				$end_mon = date('m',strtotime($row->to_date))-1;
				$end_year = date('Y',strtotime($row->to_date));

			?>
  			dataTable.addRow(['<?php echo $row->asset_status; ?>', 
			'<?php echo $row->ass_site; ?>',
			new Date(<?php echo $start_year; ?>,<?php echo $start_mon; ?>,<?php echo $start_day; ?>),
			new Date(<?php echo $end_year; ?>,<?php echo $end_mon; ?>,<?php echo $end_day; ?>)]);

  			<?php				
			}
  			?>

		    // Calculate height based on number of line items
		    var rowHeight = 41;
		    var chartHeight = (dataTable.getNumberOfRows() + 1) * rowHeight;

		    var options = {
		        height: chartHeight,
		        width: 800,
		        forceIFrame: true
		    }

			chart.draw(dataTable, options);
	});

	//Show Calendar View
	$('.showCalendar').on('click',function(){
		//alert('calendar view');
		var eventObject = Object;
		row = 0;
		myTrs = [];
		$('#campaign-grid > tbody > tr').each(function () {
			myCols = [];
			tempCols = [];
			col = 0;
			console.log("row:"+row++);
	           $(this).find('td').each(function () {
	           	console.log("   col :"+col);
	               	if(col == 0){ //Id
	               		tempCols[5] = $(this).text();
	               	}	           	
	               	if(col == 1){ //Ref
	               		tempCols[0] = $(this).text();
	               	}
	               	if(col == 6){ //Workflow 
	               		tempCols[1] = $(this).text();
	               	}
	               	if(col == 7){ //Status 
	               		tempCols[4] = $(this).text();
	               	}               	
	               	if(col == 3){ //Start date must be in the form yyyy-mm-ddThh:mm:ss (the Thh:mm:ss is optional)
	               		starts = $(this).text();
	               		starts = starts.split('/');
	               		//tempCols[2] = new Date(2000+parseInt(starts[2]),starts[1],starts[0]);
	               		tempCols[2] = new Date(2014,starts[1],starts[0]);
	               	}
	               	if(col == 4){ //End Date must be in the form yyyy-mm-ddThh:mm:ss (the Thh:mm:ss is optional)
	               		ends = $(this).text();
	               		ends = ends.split('/'); 
	               		console.log(ends); console.log(parseInt(ends[2])); console.log(2000+parseInt(ends[2]));
	               		console.log(ends[1]); console.log(ends[0]);
	               		tempCols[3] = new Date(2000+parseInt(ends[2]),parseInt(ends[1]),parseInt(ends[0]));
	               		//tempCols[3] = new Date(2015,ends[1],ends[0]); /* fix date to pickup year from campaign*/
	               	}		               			               	
	               	col++;                   
	           });
	        for(i=0; i<6; i++){
	        	myCols.push(tempCols[i]);
	        }     
	        //console.log(myCols);
	        var duration = moment.duration(myCols[3] - myCols[2]).days();
	        eventObject = {
	        	"id" : myCols[5],
	        	"title" : myCols[0] + ' - ' + myCols[1] + ' (' + myCols[4] + ')',
	        	"allDay" : true,
	        	"start" : myCols[2],
	        	"end" : myCols[3],
	        	"url" : "#viewCampaignDetail",
	        	"description":  '[' + myCols[0] + '-'+ myCols[1] + '] (' + myCols[4] + ') Starts:'+ myCols[2] +' Ends: ' + myCols[3] + ' Duration: ' + duration
	        	};
	        
	        eventObjectList.push(eventObject);
	        	
			myTrs.push(myCols);

			});
		//console.log(myTrs[0]);   				
		//alert(myTrs);
		console.log(myTrs);
		console.log('--------');
		console.log(eventObjectList);
		console.log('*********');
		console.log($('#calendar').fullCalendar('clientEvents'));
		//Remove events
		$('#calendar').fullCalendar('removeEvents');
		console.log('events removed');
		//Reload events
		$('#calendar').fullCalendar('addEventSource', eventObjectList );
		console.log('events reloaded');
		//Veridy what events
		console.log('*********');
		console.log($('#calendar').fullCalendar('clientEvents'));
		//Re-render the calendar div (since this is hidden by default)
		//$('#calendar').fullCalendar('render');

	} );


	//Get Current Page Items for use in Calendar and Timeline Views
	arrRows = 0;
	totalRecords = 0;
	calendarData = "";
	timelineData = "";

	console.log('page size:' + totalRecords);


</script>

<!-- Google Timeline Component -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      
      google.load("visualization", "1", {packages:["timeline"]});
      
      google.setOnLoadCallback(drawChart);

      function drawChartDummy(){
      	//dummy, do nothing
      }

      function drawChart() {
        var container = document.getElementById('timeline');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();

		//Get Current Page Items for use in Calendar and Timeline Views
		arrRows = $('#campaign-grid').DataTable().data();
		totalRecords = arrRows.page.len();
		//console.log('page size 2:' + totalRecords + ':' + $('#campaign-grid').DataTable().data()[0]);

		//*** Not working ***
		/*
		arrRows.each(function(currRow, idx){
			//Build Timeline data arrays
			console.log(currRow +':' + idx)
		});
		*/
        //var oneDataArray = [[arrRows[0][1],arrRows[0][7],new Date(2014, 9, 30), new Date(2014, 12, 31)]];

        dataTable.addColumn({ type: 'string', id: 'Position' });
        dataTable.addColumn({ type: 'string', id: 'Name' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
	/*
        dataTable.addRows([
          	['Campaign #1', 'WIP', new Date(2014, 9, 30), new Date(2014, 12, 31) ],
          	['Campaign #2', 'Artwork Ready',      new Date(2014, 10, 4),  new Date(2014, 12, 14) ]  
          ]);
        */

			//Add Rows
			<?php
			foreach ($campaign_assets as $row) {
				# code...
				//extract day, month (0 based since we will put it into javascript) and year from date
				// Start Date
				$start_day = date('d',strtotime($row->from_date));
				$start_mon = date('m',strtotime($row->from_date))-1;
				$start_year = date('Y',strtotime($row->from_date));
				// End Date
				//$ends = date('D M d Y H:i:s O',strtotime($row->to_date));
				$ends_day = date('d',strtotime($row->to_date));
				$end_mon = date('m',strtotime($row->to_date))-1;
				$end_year = date('Y',strtotime($row->to_date));

			?>
  			dataTable.addRow(['<?php echo $row->asset_status; ?>', 
			'<?php echo $row->ass_site;?>',
                    new Date(<?php echo $start_year; ?>,<?php echo $start_mon; ?>,<?php echo $start_day; ?>), 
                    new Date(<?php echo $end_year; ?>,<?php echo $end_mon; ?>,<?php echo $end_day; ?>)]);

	  			<?php				
			}
  			?>
        //dataTable.addRows(oneDataArray[0]);
	/*
		var options = {
		    timeline: { groupByRowLabel: false }
		  };
	*/
		    // Calculate height based on number of line items
		    var rowHeight = 41;
		    var chartHeight = (dataTable.getNumberOfRows() + 1) * rowHeight;

		    var options = {
		        height: chartHeight,
		        width: 800,
		        forceIFrame: true,
		        timeline: { groupByRowLabel: false }
		    }

        chart.draw(dataTable, options);
      }

    </script>

<!-- FullCalendar.io Component -->
<link href="<?php echo base_url('assets/fullcalendar/css/fullcalendar.css');?>" rel='stylesheet' />
<link href="<?php echo base_url('assets/fullcalendar/css/fullcalendar.print.css');?>" rel='stylesheet' media='print' />
<script src="<?php echo base_url('assets/fullcalendar/js/moment.min.js');?>"></script>
<script src="<?php echo base_url('assets/fullcalendar/js/fullcalendar.min.js');?>"></script>
<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '<?php echo date("Y-m-d");?>', //Default to today
			editable: true,
			//allDayDefault: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
			//Add Rows
			<?php
			foreach ($campaign_assets as $row) {
				# code...
				//extract day, month (0 based since we will put it into javascript) and year from date
				// Start Date
				$start_date = date('Y-m-d',strtotime($row->from_date));
				// End Date
				$end_date = date('Y-m-d',strtotime($row->to_date));

			?>
				{
					title: '<?php echo "$row->ass_site ($row->asset_status)" ; ?>',
					start: '<?php echo $start_date; ?>',
					end:'<?php echo $end_date; ?>'
				},  			

  			<?php				
			}
  			?> 			
				{
					title: 'Ads2Trade Go Live!',
					url: 'http://blestab.blogspot.com/',
					start: '2015-10-23'
				}
			/*	{
					title: 'All Day Event',
					start: '2015-02-01'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}
			*/
			]			
		});
		
	});

$('.datepicker').datepicker({
    format: 'mm/dd/yyyy',
    startDate: '-3d'
})

/*
$(".chkAssetStatus").click(function(){
    var group = "input:checkbox[name='"+$(this).attr("name")+"']";
    $(group).attr("checked",false);
    $(this).attr("checked",true);
});
*/
</script>

<div class="main col-xs-12">
	<div class="row">		        
        <div class="col-md-12">

                <div class="bs-example bs-example-tabs">

                    <ul id="myTab" class="nav nav-pills" role="tablist">
                      <li class="active"><a href="#view_table" role="tab" data-toggle="tab">Edit Workflow</a></li>
                      <li><a href="#view_list" role="tab" data-toggle="tab" class="showList">Show List</a></li>
                      <li><a href="#view_timeline" role="tab" data-toggle="tab" class="showTimeline">Show Timeline</a></li>
                      <li><a href="#view_calendar" role="tab" data-toggle="tab" class="showCalendar">Show Calendar</a></li>
                    </ul>

                    <div class="tab-content">

                      <div class="tab-pane fade in active" id="view_table">
                      	<div class="row">					        
					        <div class="table-responsive" style="background: #f6f6f6;">
					        	<div class="col-xs-5">

					        		<div class="panel panel-default">					        		

					        		<div class="panel-heading">Update Campaign Status</div>
									<table class="table table-curved">
										<thead>
											<?php 
											$last_worfklow_status = 0;
											$last_worfklow_status_date = '';
											foreach ($workflow_status_history as $row) {
												# code...
												$last_worfklow_status = $row->proposal_status_id;
												$last_worfklow_status_date = $row->created_at;
											?>
											<tr>
												<td>
													<label>
													<input type="checkbox" checked="checked" disabled="disabled">
														<?php echo $row->prs_description;?>
													</label>
												</td>
												<td>
													<label>
														<?php echo $row->created_at;?>
													</label>
												</td>
											</tr>
											<?php
												}

											?>

											<?php 
											$first = 1;
											foreach ($workflow_status as $row) {
												// Only show statuses after $last_worfklow_status
												if($row->pro_status_id>$last_worfklow_status){

													if($first == 1){
														//
														$default_status = $row->pro_status_id;
														$disabled_text = '';
														$default_date = date('Y-m-d H:j:s');
													} else {
														//	
														$default_status = 0;
														$disabled_text = 'disabled="disabled"';
														$default_date = '';
													}

											?>
											<tr>
												<td>
													<label>
													<input type="hidden" name="workflow_new_status" id="workflow_new_status" value="<?php echo $default_status; ?>">
													<input type="hidden" name="workflow_datetime id="workflow_datetime" value="<?php echo $default_date; ?>">
													<input type="checkbox" name="workflow_status[]" value="<?php echo $row->pro_status_id;?>" <?php echo $disabled_text; ?>>
														<?php echo $row->prs_description;?>
													</label>
												</td>
												<td>
													<!-- <label class="btn btn-primary" title="Select Date/Time">Date</label> -->
													<!--<input class="form-control datepicker" name="created_at"> -->
													 <div class="form-group has-feedback">
													    <label class="control-label"></label>
													    <input type="text" class="form-control datepicker" placeholder="Pending" name="created_at"  value="<?php echo $default_date; ?>" />
													    <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
													</div>
												</td>
											</tr>
											<?php
													$first = 0;

													}
												}
											?>

										</thead>
									</table>

									</div>

					        	</div>

					        	<!--
					        	<div class="col-xs-3">

					        		<div class="panel panel-default">

					        		<div class="panel-heading">Update Media Status</div>

									<table class="table table-curved">
										<thead>
											<?php 
											foreach ($asset_status as $row) {
												// Only show statuses after $last_worfklow_status
													$default_date = date('Y-m-d H:j:s');
											?>
											<tr>
												<td>
													<label>
													<input type="hidden" name="asset_new_status" id="asset_new_status" value="<?php echo $default_status; ?>">
													<input type="hidden" name="asset_datetime id="asset_datetime" value="<?php echo $default_date; ?>" data-placeholder="multiple">
													<input type="radio" name="asset_status" value="<?php echo $row->asset_status_id;?>" class="chkAssetStatus">
														<?php echo $row->asset_status;?>
													</label>
												</td>
												<td>
													 <div class="form-group has-feedback">
													    <label class="control-label"></label>
													    <input type="text" class="form-control datepicker" placeholder="Pending" name="created_at"  value="<?php echo $default_date; ?>" />
													    <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
													</div>
												</td>
											</tr>
											<?php
												}
											?>																					
										</thead>
									</table>

									</div>
					        	</div>
					        	-->

								<!-- Messaging Component --> 
								<div class="col-xs-7">

								      <div class="panel panel-default">
								        <div class="panel-heading">Workflow Messaging</div>
								        <div class="panel-body">
								          <div class="bs-example bs-example-tabs">

								            <ul id="campaignTabs" class="nav nav-pills" role="tablist">
								              <li class="active"><a href="#newsfeed" role="tab" data-toggle="tab">Newsfeed</a></li>
								              <li class=""><a href="#attachments" role="tab" data-toggle="tab">Attachments</a></li>
								              <li class=""><a href="#compose" role="tab" data-toggle="tab">Compose</a></li>
								            </ul>

								            <div id="myTabContent" class="tab-content">

								              <div class="tab-pane fade active in" id="newsfeed">
								              
								                <div class="feed-activity-list">
								                <?php
								                if(empty($workflow_events_history )){
								                	?>
    								                  <div class="feed-element">
    								                    <div class="media-body ">
    								                      <span><i>No Campaign Events found </i></span><br>
    								                      <small class="text-muted"><?php echo date('D, F d, Y h:j A'); ?></small>
    								                    </div>
    								                  </div>								                	
								                	<?php	
								                } else {
    								                foreach ($workflow_events_history as $row) {
    								                	# code...
    								                ?>
    								                  <div class="feed-element">
    								                    <div class="media-body ">
    								                      <span><i><?php echo $row->event_details,' - ',$row->use_username;?> </i></span><br>
    								                      <small class="text-muted"><?php echo date('D, F d, Y h:j A',strtotime($row->event_date)); ?></small>
    								                    </div>
    								                  </div>
    								                <?php
    												}
    											}
								                ?>  
								                </div>   

								              </div>

								              <div class="tab-pane fade in" id="attachments">
								              	
								              	<div class="row" style="margin-left:10px;">
								              		<!-- upload button + modal -->

							                        <!-- Large modal -->
							                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Upload</button>

							                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							                        <div class="modal-dialog">
							                            <div class="modal-content">
							                                <div class="modal-header" style="background-color:lightgrey;">
							                                    <button type="button" class="close" data-dismiss="modal">
							                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							                                    <h4 class="modal-title h4" id="myModalLabel">Upload Workflow Attachments</h4>
							                                </div>
							                                <div class="modal-body">
							                                
							                                    <form id="multiform" action="<?php echo site_url('campaign/do_upload/?rfp_id=').$this->input->get('id'); ?>" method="POST" enctype="multipart/form-data">    
							                                    <label>Attachment Type</label>
							                                     <select class="form-control" name="dot_id">
							                                     	<option>Choose Attachment Type</option>
														            <?php foreach ($document_types as $row) {
														              # code...
														              ?>
														              <option value="<?php echo $row->dot_id; ?>"><?php echo $row->dot_description;  ?></option>
														              <?php
														            }?>
														         </select>

							                                    <label>Attachment</label>
							                                    <input type="file" class="form-control" name="userfile" id="file" accept=".jpg,.png,.gif,.doc,docx,.pdf,.xls,.xlsx"><br/>
							                                    <input type="hidden" name="campaign_id" value="<?php echo $this->input->get('id');?>">
							                                    <button class="btn primary" id="btnSubmitAttachment">Upload</button>
							                                    
							                                    </form>
							                                    <br/>
							                                    <p id="msg" style="color: #e01e2a"></p>
							                                    <p id="msg2" style="color: #339900"></p>
							                                    
							                                </div>
							                                <div class="modal-footer">
							                                	<!-- <button class="btn btn-success" id="btnUploadAttachment">submit</button> -->
							                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							                                </div>
							                            </div>
							                        </div>
							                        </div>

								              	</div>

								              	<!-- List of Uploads -->
								                <div class="feed-activity-list">
								                <?php
								                if(empty($workflow_attachments )){
								                	?>
    								                  <div class="feed-element">
    								                    <div class="media-body ">
    								                      <span><i>No Campaign Attachments found </i></span><br>
    								                      <small class="text-muted"><?php echo date('D, F d, Y h:j A'); ?></small>
    								                    </div>
    								                  </div>								                	
								                	<?php	
								                } else {
    								                foreach ($workflow_attachments as $row) {
    								                	# code...
    								                ?>
    								                  <div class="feed-element">
    								                    <div class="media-body ">
    								                      <span>
    								                      	<a href="<?php echo $row->upd_url; ?>" target="_blank">
    								                      		<i><?php echo '(',$row->dot_description,') ',$row->upd_file_name ,' [' , $row->upd_file_type.']';?> </i>
    								                      	</a>
    								                      	</span><br>
    								                      <small class="text-muted"><?php echo date('D, F d, Y h:j A',strtotime($row->upd_date)); ?></small>
    								                    </div>
    								                  </div>
    								                <?php
    												}
    											}
								                ?>
								                </div>   

								              </div>

								              <div class="tab-pane fade in" id="compose">

								              	<?php echo form_open_multipart("campaign/sendMessage") ?>

													<div class="form-control-group">To: 
														<label for="send_to_media_owner">
															<input type="checkbox" value="1" name="send_to_media_owner" title="Send to all linked to this campaign"> Media Owner (s)
														</label>
														<label for="send_to_advertiser">
															<input type="checkbox" value="1" name="send_to_advertiser" title="Send to all linked to this campaign"> Advertiser
														</label>														
													</div>

													<div class="form-control-group">
														<label for="sentto">Or Send To (can also act as CC)</label>
														  <select class="form-control" name="sentto[]" multiple="multiple">
												            <?php foreach ($media_owners as $row) {
												              # code...
												              ?>
												              <option value="<?php echo $row->use_id; ?>"><?php echo $row->use_first_name,',',$row->use_last_name;  ?></option>
												              <?php
												            }?>
												         </select>
														
													</div>

													<div class="form-control-group">
														<label for="message">Subject</label>
														<?php echo form_input('subject', "RE:$campaign->cam_ref:", 'class="form-control"' ); ?>
													</div>

													<div class="form-control-group">
														<label for="message">Message</label>
														<?php //echo form_textarea('message', '', 'class="form-control" rows="3"' ); ?>
														<textarea name="message" cols="40" rows="3" class="form-control"></textarea>
														<input type="hidden" name="campaign_id" value="<?php echo $this->input->get('id'); ?>">
													</div>

													<div class="form-control-group">
													 <center>
														<div class="btn-group" data-toggle="buttons">
														    <label class="">
														        <input type="radio" name="email_site" value="0" checked="checked"> Dont Attach Sites
														    </label>														
														    <label class="">
														        <input type="radio" name="email_site" value="2"> Attach Site reference
														    </label>
														    <label class="">
														        <input type="radio" name="email_site" value="1"> Attach all Campaign Sites
														    </label>
														    														</div>
													 </center>	
													</div>

													<div>
														<center>
														    <button class="btn btn-primary">
														         Send Message
														    </button>															
														</center>
													</div>

													<?php echo form_close() ?>

								              </div>
								          
								        </div>
								      </div>
								    </div>
								</div>
								</div>

								<!-- End Messaging Component -->

					        </div>

                      	</div>
						<!--
						<div>
							<button type="button" class="btn btn-primary btnSave" data-target="#edit" data-toggle="modal">Update Workflow Status</button>
							<button type="button" class="btn btn-primary btnApply" data-target="#assetStatus" data-toggle="modal">Update Site Status</button>
							<button type="button" class="btn btn-primary btnCalendar">Show as Calendar</button>
							<button type="button" class="btn btn-primary btnTimeline">Show as Timeline</button>
							<button type="button" class="btn btn-primary btnCancel">Cancel & Close</button>
							
						</div>
-->

                      </div>

                      <div class="tab-pane fade in" id="view_list" style="background: #f6f6f6;">
                      	
                      	<br>
                      	<div class="main col-xs-12" style="background: #f6f6f6;">
                      		<div id="list" style="display: block; margin: 0 auto; ">
                      			
								<div class="row" style="padd">
									<table id="campaign-assets" class="cell-border" cellspacing="0" width="100%">
									        <thead>
									            <tr>
									            	<th>
									            		<label><input type="checkbox" id="tblCheckAll">All</label>
									            	</th>
									                <th>M/Owner</th>
									                <th>M/Owner Site</th>
									                <th>A2T Site</th>
									                <th>Site Category</th>
									                <th>Site Type</th>
									                <th>Description</th>
									                <th>Size</th>
									                <th>Region</th>
									                <th>Town</th>
									                <th>Surbub</th>
									                <th>Status</th>
									            </tr>
									        </thead>
									 
									        <tbody>
									        	<?php

									        	foreach ($campaign_assets as $row) {
									        		//print_r($row->ass_owner);
									        	?>	
									            <tr>
									            	<td><input type="checkbox" id="chk" class="chkSelectAllAssets" value="<?php echo $row->asset_id; ?>"></td>
									                <td><?php echo $row->ass_owner; ?></td>
									                
<td><?php echo $row->ass_owner_site; ?></td>
									                
<td><?php echo $row->ass_site; ?></td>
									                
<td><?php echo $row->ass_site_category; ?></td>
									                <td><?php echo $row->ass_site_type; ?></td>
									                <td><?php echo $row->ass_description; ?></td>
									                <td><?php echo $row->asset_size; ?></td>
									                <td><?php echo $row->ass_province; ?></td>
									                <td><?php echo $row->ass_city; ?></td>
									                
<td><?php echo $row->ass_street_address; ?></td>
									                
<td><?php echo $row->asset_status; ?></td>		                
									            </tr>
									            <?php
									        		} //end foreach campaign assets
									        	?>
									</tbody>
									</table>
								</div>

                      		</div>                      		
                      	</div>

                      </div>

                      <div class="tab-pane fade in" id="view_timeline" style="background: #f6f6f6;">
                      	
                      	<br>
                      	<div class="row" style="background: #f6f6f6;">
                      		<div id="timeline" style="height: 500px; width:600px; display: block; margin: 0 auto;"></div>                      		
                      	</div>

                      </div>

                      <div class="tab-pane fade in" id="view_calendar" style="background: #f6f6f6;">
                      	
                      	<br>
                      	<div class="row" style="background: #f6f6f6;">
                      		<div id='calendar'></div>
                      	</div>

                      </div>                      

                    </div>
						<div>
							<button type="button" class="btn btn-primary btnSave" data-target="#edit" data-toggle="modal">Update Workflow Status</button>
							<button type="button" class="btn btn-primary btnApply" data-target="#assetStatus" data-toggle="modal">Update Site Status</button>
							<button type="button" class="btn btn-primary btnCalendar">Show as Calendar</button>
							<button type="button" class="btn btn-primary btnTimeline">Show as Timeline</button>
							<button type="button" class="btn btn-primary btnCancel">Cancel & Close</button>							
						</div>

                </div>            
        </div>
	</div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header  btn-primary btn-lg">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		<h4 class="modal-title custom_align" id="Heading">Update Workflow Details</h4>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<textarea rows="4" class="form-control" placeholder="Enter your comments here" id="status_comment"></textarea>
		</div>
	</div>
	<div class="modal-footer ">
		<button type="button" class="btn btn-primary btn-lg" style="width: 100%;" id="btnUpdateWOrkflowStatus"><span class="glyphicon glyphicon-ok-sign"></span> Update Workflow</button>
	</div>
</div>

</div>

</div>
    

<div class="modal fade" id="assetStatus" tabindex="-1" role="dialog" aria-labelledby="assetStatus" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header btn-primary btn-lg">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		<h4 class="modal-title custom_align" id="Heading">Update Site Status Details</h4>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<label>Select the New Asset Status</label> <select name="asset_status" id="cbo_asset_status" class="form-control">
			<?php 
			$default_date = date('Y-m-d H:j:s');
			foreach ($asset_status as $row) {
				// Only show statuses after $last_worfklow_status		
			?>
				<option value="<?php echo $row->asset_status_id;?>"><?php echo $row->asset_status;?></option>
			<?php
				}
			?>	
			</select>
			<input type="hidden" name="asset_new_status" id="asset_new_status" value="<?php echo $default_status; ?>">
			<input type="hidden" name="asset_datetime" id="asset_datetime" value="<?php echo $default_date; ?>" data-placeholder="multiple">
			<input type="hidden" class="form-control datepicker" placeholder="Pending" name="created_at"  value="<?php echo $default_date; ?>" />
		</div>

		<div class="form-group">
			<label>Comments</label>
			<textarea rows="4" class="form-control" placeholder="Enter your comments here" id="asset_status_comment"></textarea>
			
		</div>
		<div class="form-group">
		  <center>
			<label>
			<input type="radio" name="update_status_all" value="1" checked="checked"> Update All Assets </label>
			<label>
			<input type="radio" name="update_status_all" value="0"> Update to Selected Assets </label>			
		  </center>	
		</div>		
	</div>
	<div class="modal-footer ">
		<button type="button" class="btn btn-primary btn-lg" style="width: 100%;" id="btnUpdateAssetStatus"><span class="glyphicon glyphicon-ok-sign"></span> Update Sites</button>
	</div>
</div>

</div>

</div>
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    
  </div>
    
</div>
<?php
//echo "<pre>"; 
//print_r($campaign);
//print_r($workflow_events_history);
?>
