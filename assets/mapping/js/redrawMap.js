    function redrawMap(ids) {
        //ids = "28,29,30,31";

        //alert('Redrawing Map ...');
        
        raw_markers = []; //update global raw_markers with latest assets
        $.ajax({
            type: "POST", 
            //url: "<php echo site_url('load_stock/ajax_raw_markers'); >?ids="+ids+'&des_id='+ids,
            url: "http://final.ads2trade.co.za/index.php/load_stock/ajax_raw_markers?ids="+ids+'&des_id='+ids,
            dataType: "json", 
            async: false,
            success: function(data){
                raw_markers = data; //update global raw_markers with latest assets
            }
        });
        
        var mapOptions = {zoom: 6, center: centerposition};
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        //map.setOptions({draggableCursor:'move'});

        var addAssetListener = google.maps.event.addListener(map, 'click', function(event) {
            //check the Mode and determine whether or not to show the add asset marker modal
            //var asset_mode = $('input[name=asset_mode]').val();
            var asset_mode = $('#asset_mode').val();
            //alert("Asset Mode:" + asset_mode);

            if (disableListener || (asset_mode.toLowerCase() == "edit" || asset_mode.toLowerCase() == "view")) {
                //if view mode then zoom into map on click
                if(asset_mode.toLowerCase() == "view"){
                  //map.setCenter(map.setCenter());    //marker is marker to center on
                  map.setZoom(map.getZoom() + 1);                 
                }
                return;
            }
            addMarker(event.latLng);
        });
        var markers = [];
        for (var i in raw_markers) {
            (function (i) {
                var marker_details = raw_markers[i]
                console.log('Ugly hack to fix missing mec_id field');
                if (!marker_details.hasOwnProperty('mec_id')) {
                    marker_details.mec_id = marker_details.med_id;
                }

                if(marker_details.ass_is_mall == 1){
                    marker_icon = base_url + 'assets/mapping/images/media_1.png';     /* Shopping Mall Icon */
                } else {
                    marker_icon = base_url + 'assets/mapping/images/media_'+marker_details.mec_id+'.png'; /* use icon as per mec_id default */
                }

                var position_parts = marker_details.position.split(',');

                var latLng = new google.maps.LatLng(position_parts[0], position_parts[1]);
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    type: parseInt(marker_details.mec_id),
                    icon: marker_icon,
                    title: ""+marker_details.ass_name + " (" + marker_details.ass_description + ")",
                    is_mall: marker_details.ass_is_mall,
                    asset_id: marker_details.ass_id,
                    mall_id: marker_details.mall_id,
                    cursor:'move',
                    draggable: true,
                });
                //marker.setCursor({cursor:'move'});
                //Marker click event

                // Attach the marker click event to hijack click event for Malls
                google.maps.event.addListener(marker, 'click', function (event) {
                    //debugger;
                    var chagedPos = marker.position;
                    var asset_id = marker.asset_id;
                    var asset_is_mall = marker.is_mall;
                    var asset_mec_id = marker.type;
                    var asset_mall_id = marker.mall_id;

                    console.log(' maker clicked : ' + asset_id);
                    $('#selected_asset_id').val(asset_id);
                    if(asset_is_mall == 1){

                    } 

                });

                google.maps.event.addListener(marker, "dragend", function (event) {
                      latitude = this.getPosition().lat();
                      longitude = this.getPosition().lng();
                      console.log('new marker pos:' + latitude + ','+ longitude + 'id:'+ marker.asset_id + pos_update_url);

                      $.post( pos_update_url, { ass_id: marker.asset_id, lat: latitude, lng: longitude })
                      .done(function( data ) {
                        //alert( "Asset Moved " );
                             $('<div></div>').dialog({
                              modal: true,
                              title: "Asset Move Confirmartion",
                              open: function() {
                                var markup = 'Asset Moved Succefully!';
                                $(this).html(markup);
                              },
                              buttons: {
                                Ok: function() {
                                  $( this ).dialog( "close" );
                                }
                              }
                            });  //end confirm dialog
                        /*
                        BootstrapDialog.show({
                            message: 'Hi Apple!'
                        });                             
                        */
                      });
                });

                //InfoWindow for popup with operations options
                //Edit - Auction - Specsheet - Activate/Diactivate - Streetview

                markers.push(marker);


//              google.maps.event.addListener(marker, 'click', function () {
//
//                  modalshow(marker_details.ass_id);
//              });
            })(i);

        }
        var optOptions = {
            urlBase: base_url,
            markers: markers,
            showRadii: false,
            showSearchPOIButton: function() {
                disableListener = true;
                adsMap.add_message('Please click on the map.', 10);
                adsMap.search_poi(false, function() {
                    disableListener = false;
                });
                return false;
            },
            showFilterButton: function() {
                disableListener = true;
                adsMap.add_message('Please click on the map.', 10);
                adsMap.filter_markers_in_radius(false, function() {
                    disableListener = false;
                });
                return false;
            }
        };
        var clusterOptions = {};
        var spiderOptions = {
                    keepSpiderfied: true
                };
        var html2canvasOptions = {
            logging: true
        };
        adsMap = new AdsMap(map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
                //Now add the click events to the markers
        document.addEventListener('AdsMaploaded', function(e) {
            adsMap.spider.addListener('click', function(clicked_marker) {
                modalshow(clicked_marker.asset_id);
            });
        }, false);
                               
        /** Autocomplete Places */
        var input = document.getElementById('myPlaceTextBox');
        var image = base_url + 'assets/mapping/images/user_marker.png';
        var marker_location = new google.maps.Marker({
            map: map,
            draggable: true,
            icon: image,
            animation: google.maps.Animation.DROP,
            visible: false
        });

        var autoCompleteOnChange = function () {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById("myPlaceTextBox").value;

            geocoder.geocode({ "address": address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {

                    $("#location").parent().removeClass("has-error");
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    $("#latitude").val(latitude);
                    $("#longitude").val(longitude);
                    marker_location.setVisible(true);
                    marker_location.setPosition(results[0].geometry.location);
                    console.log(results[0].geometry.location);
                    map.setCenter(new google.maps.LatLng(latitude, longitude), 9);
                    map.setZoom(9);
                    google.maps.event.addListener(marker_location, "dragend", function (event) {
                        latitude = this.getPosition().lat();
                        longitude = this.getPosition().lng();
                        $("#latitude").val(latitude);
                        $("#longitude").val(longitude);
                    });
                } else {
                    alert("Request failed.")
                    $("#location").parent().addClass("has-error");
                }
            });

        }

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);
        google.maps.event.addListener(autocomplete, 'place_changed', autoCompleteOnChange);

    }