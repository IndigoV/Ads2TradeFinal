<style type="text/css">
	#campaign-grid table, th,td{font-size: small;}
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}	
</style>
<div class="breadcrumbs" style="margin-top:-100px;"> <!-- margin-top: use up whitespace at the top of the page -->
    <h1><span class="glyphicon glyphicon-globe"></span>Manage Campaigns :: View All</h1>
</div>

<?php 
$user_type = $this->session->userdata('user_type');
if($user_type == 2 || $user_type == 3 || $user_type > 0){
  $this->load->view('campaign/topmenu');
}
?>

<div class="main col-xs-12">

</div>

<script type="text/javascript" language="javascript" >
	var count_tbl_rows = 0;
	var arrRows;
	var myTr = [];
	var totalRecords = 0;
	var calendarData = "";
	var timelineData = "";

	$(document).ready(function() {
		var campaignTable = $('#campaign-grid').DataTable( {
			   	dom: 'T<"clear">lfrtip',
			   		"tableTools": {
			   	   	//"sSwfPath": "<?php echo base_url('datatables/tools/copy_csv_xls_pdf.swf'); ?>",
			   	   	"sSwfPath": "//cdn.datatables.net/tabletools/2.2.2/swf/copy_csv_xls_pdf.swf",
			   	    	"sRowSelect": "multi",
				    	"aButtons": [
					        	"select_all", 
					        	"select_none",
							{
						    		"sExtends":    "collection",
						    		"sButtonText": "Export",
						    		"aButtons":    [ "csv", "xls", "pdf","print" ]
							}
				    	]
				},
			"processing": true,
			"serverSide": true,
			"ajax":{
				url :"<?php echo site_url('campaign/workflow_list_dt'); ?>", // json campaign list datasource
				type: "post",  // method  , by default get
				error: function(){  // error handling
					$(".employee-grid-error").html("");
					$("#employee-grid").append('<tbody class="employee-grid-error"><tr><th colspan="3">No Campaigns found for your search criteria</th></tr></tbody>');
					$("#employee-grid_processing").css("display","none");
					
				}
			}
		} );
	
	// Add tooltip to tell user to double click the row in order to view/edit campaign
	// *** TODO: Not working, Needs fixing
	$('#campaign-grid tbody tr').each( function() {
		//var sTitle = 'Double Click to view view/edit this Campaign';
		//$(this).attr( 'title', sTitle );
    } );

	// Process DataTable row double click event
	$('#campaign-grid tbody').on( 'dblclick', 'tr', function () {
		var campaign_id = $(this).find('td:first-child').text();
		var campaign_ref = $(this).find('td:nth-child(2)').text();
	  	alert('Loading Campaign ' + campaign_ref +' Workflow View/Edit...');
	  	console.log('row: ' + campaign_id);
	  	window.location.href = "<?php echo site_url('campaign/workflow_details'); ?>/?id="+campaign_id;
	} );

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

			dataTable.addRows(myTrs);

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

	//By default, calendar is in a hidden div so when the div becomes active we need to render the calendar (not yet working)
	//*** TODO: Fix default calendar render
	$('#myTab').tabs({
	    activate: function(event, ui) {
	        //$('#calendar').fullCalendar('render');
	       //alert('Activate');
	    }
	});

	//Get Current Page Items for use in Calendar and Timeline Views
	arrRows = $('#campaign-grid').DataTable().data();
	totalRecords = arrRows.page.len();
	calendarData = "";
	timelineData = "";

	console.log('page size:' + totalRecords);

	//Google Charts
	//drawChart(arrRows);

	/* Iterate over items 
	   currRow contains row's column values
	   e.g. 
	      ["81", "P000081", "01/01/15", "01/12/14", "31/01/15", "9", "Proposal", 
	       "WIP", "0.00", "0.00", "0.00", "1.97", 
	       "<span class='glyphicon glyphicon-edit edit_campaig…ce_campaign' title='View Mini Spec'></span>&nbsp;", "0"]

	       arrRows[0][0] accesses a column e.g. 81 or P0000081 in the above example
	*/       
	arrRows.each(function(currRow, idx){
		//Build Timeline and Calendar Data Objects 
		console.log(currRow +':' + idx)
		});
	});

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

        dataTable.addRows([
          	['Campaign #1', 'WIP', new Date(2014, 9, 30), new Date(2014, 12, 31) ],
          	['Campaign #2', 'Artwork Ready',      new Date(2014, 10, 4),  new Date(2014, 12, 14) ]  
          ]);
        
        //dataTable.addRows(oneDataArray[0]);

		var options = {
		    timeline: { groupByRowLabel: false }
		  };

        chart.draw(dataTable);
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
			defaultDate: '2015-02-01', //Default to today
			editable: true,
			//allDayDefault: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2015-02-01'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}
			]			
		});
		
	});


</script>

<hr>
<div class="main col-xs-12">
	<div class="row">		        
        <div class="col-md-12">

                <div class="bs-example bs-example-tabs">

                    <ul id="myTab" class="nav nav-tabs" role="tablist">
                      <li class="active"><a href="#view_table" role="tab" data-toggle="tab">Show List</a></li>
                      <li><a href="#view_timeline" role="tab" data-toggle="tab" class="showTimeline">Show Timeline</a></li>
                      <li><a href="#view_calendar" role="tab" data-toggle="tab" class="showCalendar">Show Calendar</a></li>
                    </ul>

                    <div class="tab-content">

                      <div class="tab-pane fade in active" id="view_table">
                      	<div class="row">					        
					        <div class="table-responsive">
								<table id="campaign-grid" cellpadding="0" cellspacing="0" border="0" class="display" width="98%">
										<thead>
											<th>
												No
											</th>
											<th>Campaign</th>
											<th>Confirmed</th>
											<th>Starts</th>
											<th>Ends</th>
											<th>Site QTY</th>
											<th>Workflow</th>
											<th>Status</th>
											<th>Commision</th>
											<th>P&P</th>
											<th>Value</th>
											<th title="Duration in Months">Duration</th>
											<th>Actions</th>
										</thead>
								</table>                   
					        </div>
                      	</div>
                      </div>

                      <div class="tab-pane fade in" id="view_timeline">
                      	
                      	<br>
                      	<div class="row">
                      		<div id="timeline" style="height: 500px; width:600px; display: block; margin: 0 auto;"></div>                      		
                      	</div>

                      </div>

                      <div class="tab-pane fade in" id="view_calendar">
                      	
                      	<br>
                      	<div class="row">
                      		<div id='calendar'></div>
                      	</div>

                      </div>                      

                    </div>
                </div>            
        </div>
	</div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
        <input class="form-control " type="text" placeholder="Mohsin">
        </div>
        <div class="form-group">
        
        <input class="form-control " type="text" placeholder="Irshad">
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
    
        
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
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