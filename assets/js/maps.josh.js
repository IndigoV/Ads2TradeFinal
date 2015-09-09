var adsMap;
function createMap() {
    //$('#mapModal').on('shown.bs.modal', function (e) {
    //    console.log(e);
        //var tmp_id = $(e.relatedTarget).attr('data-latLng');
        //var areas = tmp_id.split(',');
        //var l1=areas[0];
        //var l2=areas[1];
        //var position = new google.maps.LatLng(l1, l2);
        //
        //var mapOptions = {
        //    center: position,
        //    zoom: 10
        //};
        //
        //var campaign_map = new google.maps.Map(document.getElementById("campaign_map_canvas"), mapOptions);
        var mapOptions = {
            //center: position,
            center: new google.maps.LatLng(-26.2044, 28.0456),
            zoom: 10
        };
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        //var selected_marker = new google.maps.Marker({
        //    position: position,
        //    map: map
        //    //icon: 'assets/mapping/images/user_marker.png'
        //});
        var optOptions = {
            urlBase: 'http://indigostorage.co.za/Ads2TradeFinal/',
            showRadii: true,
            currentFilterCriteria: {},
            showSearchPOIButton: true,
            showFilterButton: true,
            showScreenShotButton: true,
            showLegend: false
        };
        var clusterOptions = {};
        var spiderOptions = {};
        var html2canvasOptions = {
            logging: false
        };

        adsMap = new AdsMap(map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
        google.maps.event.trigger(map,'resize');

        //var campaign = new AdsMap.Campaign(adsMap, {url: 'upload_campaign', onsuccess: function() {
        //    $('#mapModal').modal('hide');
        //    alert('Succesfully posted images');
        //}}, {id: tmp_id});
        //$('#map_images').html(campaign.edit());
    //});

};



function initialize() {
    var input = /** @type {HTMLInputElement} */(
        document.getElementById('myPlaceTextBox2'));

    var autocomplete = new google.maps.places.Autocomplete(input);

    google.maps.event.addListener(autocomplete, 'place_changed', function () {

        var place = autocomplete.getPlace();
        if (!place.geometry) {
            return;
        }

        var address = '';
        if (place.address_components) {
            //address = [
            //    (place.address_components[0] && place.address_components[0].short_name || ''),
            //    (place.address_components[3] && place.address_components[3].long_name || ''),
            //    (place.address_components[4] && place.address_components[4].long_name || '')
            //].join(', ');
            address = (place.address_components[0] && place.address_components[0].short_name || '')+', '+(place.address_components[3] && place.address_components[3].long_name || '')+', '+(place.address_components[4] && place.address_components[4].long_name || '');
        }
        // get lat and lang
        //console.log(address);
        if(getLatLong(address) != undefined) {
            //console.log(latLng);
            var latLng = getLatLong(address);
            var latlongs = latLng.split(',');
            mezmerize2(address, latlongs[0], latlongs[1]);
        } else {
            //console.log('failed');
        }

    });
}

google.maps.event.addDomListener(window, 'load', initialize);

function getLatLong(address){

    var lattitude = "0";
    var longitude = "0";
    //console.log('here');
    var returnStuff = "";
    $.ajax({
        url:"https://maps.googleapis.com/maps/api/geocode/json?address="+address+"&sensor=false",
        type: "POST",
        async: false,
        success:function(res){
            lattitude = res.results[0].geometry.location.lat;
            longitude = res.results[0].geometry.location.lng;
            //console.log(lattitude);
            //console.log(longitude);
            //console.log(lattitude + ',' + longitude);
            returnStuff = lattitude + ',' + longitude;
        },
        error: function(res) {
            console.log(res + " error");
        }
    });
    return returnStuff;
}

$('#mapModal').on('shown.bs.modal', function (e) {
    //console.log('map modal');
    var tmp_id = $(e.relatedTarget).attr('data-latLng');
    var areas = tmp_id.split(',');
    var l1 = areas[0];
    var l2 = areas[1];
    var position = new google.maps.LatLng(l1, l2);

    var mapOptions = {
        center: position,
        zoom: 10
    };

    var map = new google.maps.Map(document.getElementById("map"), mapOptions);

    var selected_marker = new google.maps.Marker({
        position: position,
        map: map
        //icon: 'assets/mapping/images/user_marker.png'
    });
    var optOptions = {
        urlBase: 'http://indigostorage.co.za/Ads2TradeFinal/',
        showRadii: true,
        currentFilterCriteria: {},
        showSearchPOIButton: true,
        showFilterButton: true,
        showScreenShotButton: true,
        showLegend: false
    };
    var clusterOptions = {};
    var spiderOptions = {};
    var html2canvasOptions = {
        logging: false
    };

    adsMap = new AdsMap(map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
    google.maps.event.trigger(map, 'resize');
});