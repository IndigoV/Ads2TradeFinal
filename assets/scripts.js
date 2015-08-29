


$(document).ready(function(e) {
	
	$('input[type="checkbox"]').checkbox();

	$(".drop-down-trigger").click(function(e){
		var menu = $(this).parent().find("ul");
		if(menu.is(":visible")){
			menu.hide();
		}else{
			$(".side_bar ul li ul").hide();
			menu.show();
		}
		return false;
	});

	 /* Thumbnails
  ----------------------------------------------*/
  $('.thumbnails li a').click(function(e){   
  	$(".main_picture").show();
  	$(".map_view").hide();
    $(this).parent().parent().addClass("active");
    var objt =".main_picture";
    var largeIMG = $(this).attr("href");
    
    $(".main_picture").html('<div class="loading">Loading...</div>');
    $(objt).html("<img src='"+largeIMG+"'/>").css({opacity: 0});
    var tmp = $(objt).children();
    tmp[0].onload = function(){
      $(objt).animate({opacity:1},1000);
    }
    tmp[0].onerror = function(){
      $(".main_picture").html('<div class="loading">An error occured</div>').animate({opacity:1},1000);
    }
  
    e.preventDefault();
  });

  $('.show_map_view').click(function(e){ 
  	$(".main_picture").hide();
  	$(".map_view").show();  
  	//After showing map div, trigger map resize event to take care of tha partially loaded map problem
  	triggerMapResize(map);  	
  });
	
	/* Product Thumbnails
	----------------------------------------------*/
	$('.mobi-menu-toggle').click(function(e){
		if($(".side_bar").is(":visible")){
			$(".main_content").css({'margin-left':'0px','overflow':'auto'});
			$(".side_bar").hide();
		}else{
			$(".main_content").css({'margin-left':'205px','overflow':'hidden'});
			$(".side_bar").show();
		}
		return false;
	});


	/* Auction Home Button Group
	----------------------------------------------*/
	$('.show_auctions_map').click(function(e){
		$(this).addClass("active");
		$('.show_auctions_locations').removeClass("active");
		$(".map_view").show();
  		$(".locations_view").hide();  
  		//Maybe restore map center  
  		if (typeof google === 'object' && typeof google.maps === 'object'){
  			loadMapState();
  		}  		
		return false;
	});

	$('.show_auctions_locations').click(function(e){
		$(this).addClass("active");
		$('.show_auctions_map').removeClass("active");
		$(".map_view").hide();
  		$(".locations_view").show();  
  		//Maybe get map center and radius here 
  		if (typeof google === 'object' && typeof google.maps === 'object'){
  			saveMapState();
  		}
		return false;
	});
	
	/* Save / Restore Map Center/Position/Zoom */
	/* Option #1 */
	var previousPosition;
	var previousZoom;
	function savePosition(map) {
	  previousPosition = map.getCenter();
	  //map.savePosition(); //v2 only
	}

	function returnToSavedPosition(map) {
	  if (previousPosition) {
	    map.panTo(previousPosition); // or setCenter
	    //map.returnToSavedPosition(); //v2 only
	  }
	}
	/* Option #2 - DOESNT WORK 
	Since Maps v3 doesn't have a savePosition() function. You need to use getCenter() and getZoom() to retrieve the current position 
	and then restore that position with setCenter() and setZoom()
	*/

	function savePositionV3(map){
  		if (typeof google === 'object' && typeof google.maps === 'object'){
  			previousPosition = map.getCenter();
  			previousZoom = map.getZoom();
  		}
	}

	function returnToSavedPositionV3(map){
  		if (typeof google === 'object' && typeof google.maps === 'object'){
  			map.setCenter(previousPosition);
  			map.setZoom(previousZoom);
  		}
	}

	/* Option #3 - Works like a charm to save/restore map state */

	function saveMapState() { 
	    var mapZoom=map.getZoom(); 
	    var mapCentre=map.getCenter(); 
	    var mapLat=mapCentre.lat(); 
	    var mapLng=mapCentre.lng(); 
	    var cookiestring=mapLat+"_"+mapLng+"_"+mapZoom; 
	    setCookie("AdsMapCookie",cookiestring, 1); 
	} 

	function loadMapState() { 
	    var gotCookieString=getCookie("AdsMapCookie"); 
	    var splitStr = gotCookieString.split("_");
	    var savedMapLat = parseFloat(splitStr[0]);
	    var savedMapLng = parseFloat(splitStr[1]);
	    var savedMapZoom = parseFloat(splitStr[2]);
	    if ((!isNaN(savedMapLat)) && (!isNaN(savedMapLng)) && (!isNaN(savedMapZoom))) {
	        map.setCenter(new google.maps.LatLng(savedMapLat,savedMapLng));
	        map.setZoom(savedMapZoom);
	    }
	}

	function setCookie(c_name,value,exdays) {
	    var exdate=new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	    document.cookie=c_name + "=" + c_value;
	}

	function getCookie(c_name) {
	    var i,x,y,ARRcookies=document.cookie.split(";");
	    for (i=0;i<ARRcookies.length;i++)
	    {
	      x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
	      y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
	      x=x.replace(/^\s+|\s+$/g,"");
	      if (x==c_name)
	        {
	        return unescape(y);
	        }
	      }
	    return "";
	}
	/*
	 When a google map is on a hidden div initially when the div is made visible
	 The map partially loads (has grey areas)
	 This function triggers a window and map resize event to have the map redrawn.
	*/
	function triggerMapResize(map){
		//First make sure google maps is loaded
		if (typeof google === 'object' && typeof google.maps === 'object'){ 
		    if(map){ //check if this is a valid map object
		      $(window).trigger('resize');
		      var center = map.getCenter();
		      google.maps.event.trigger(map, "resize"); 
		      map.setCenter(center);
		    }
		}
	}
	/* Select Boxes/Multiple Slect Boxes
	----------------------------------------------*/
  var config = {
    '.chosen-select': {}
  }
  for (var selector in config) {
    $(selector).chosen(config[selector]);
  }


	/* Data Tables
	----------------------------------------------*/
	$(document).ready(function() {
        if($('#example') != undefined) {
            dataTable = $('#example').dataTable();
            $("#searchbox").keyup(function() {
                dataTable.fnFilter(this.value);
            });
        }
	});


	
});


$(document).ready(function(){
	$(".interests_wrapper li .del").click(function(){
		$(this).parent().remove();
	});

	//Add a location
	$(".add_location_button").click(function(){
		var title = "East London";
		var longitude = "0.56674564";
		var latitude = "1.56674564";
		var address = "30 Thats Road";
		var location_html = '<li>'+
        '<span class="title">'+title+'</span>'+
        '<span class="del"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></span>'+
        '<input type="hidden" name="title[]" value="'+title+'">'+
        '<input type="hidden" name="latitude[]" value="'+latitude+'">'+
        '<input type="hidden" name="longitude[]" value="'+longitude+'">'+
        '<input type="hidden" name="address[]" value="'+address+'">'+
    '</li>';

    $(".interests_wrapper").append(location_html);
	});
});