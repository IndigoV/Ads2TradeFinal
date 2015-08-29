/**
 * Created by josh on 2015/01/19.
 */

function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("rfp_locations").deleteRow(i);
}

var markers = [];

function mezmerize2(address, lat, lon) {
    // empty search box
    $('#myPlaceTextBox2').val("");

    // check if new searched location already exists in the search results from previous searches
    var piecesOfAddress = address.split(",");
    var alreadyInSearchItems = false;
    var allLocations = $('.interests_wrapper li');
    allLocations.each(function(){
        var currentAddressPieces = this.getAttribute('data-location').replace(" ", "").split(",");
        var currentAddress = currentAddressPieces[0];
        if(currentAddress == piecesOfAddress[0]) {
            alreadyInSearchItems = true;
        }
    });

    if(alreadyInSearchItems) {
        // current search location already exists in the list of locations
        console.log("location already appears in list of locations");
    } else {
        // add location
        var latlong = getLatLong(address);
        var location_html = '<li class="location" data-location="'+address+'">'+
            '<span class="title">'+address+' </span>'+
            '<span class="" onclick="deleteMe()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></span>'+
            '<input type="hidden" name="chosen_location[]" value="'+address+'">'+
            '<input type="hidden" name="latitude[]" value="'+lat+'">'+
            '<input type="hidden" name="longitude[]" value="'+lon+'">'+
            '<input type="hidden" name="address[]" value="'+address+'">'+
            '</li>';

        $(".interests_wrapper").append(location_html);

        // get all media types
        var allTables = $('.row table.table');
        //console.log(allTables);
        var table = $('.row table.table .asset_item');
        //console.log(table);
        var lastAsset = table[table.length-1];
        var lastAssetClasses = lastAsset.className;
        var lastAssetClassesSplit = lastAssetClasses.split(' ');
        var lastAssetClassNumber = lastAssetClassesSplit[0];
        lastAssetClassNumber = lastAssetClassNumber.replace('asset_', '');
        //console.log(lastAssetClassNumber);
        var array = [];
        var count = 0;
        table.each(function() {
            array[count] = this.getElementsByTagName('td')[0].innerHTML.replace(/<[^>]*>/g, "").trim();
            count++;
        });

        // remove duplicate elements of array
        var uniqueMediaTypes = [];
        $.each(array, function(i, el){
            if($.inArray(el, uniqueMediaTypes) === -1) uniqueMediaTypes.push(el);
        });

        // add location with media items and prices
        $.ajax({

            url : 'getNewLocationInfo',
            type : 'POST',
            data: {'address' : address, 'lat' : lat, 'long' : lon, 'media' : uniqueMediaTypes},
            success: function(res) {
                // hold result
                var array = res;
                // hold all average prices
                var avPricesArray = [];
                // hold all media types / media items
                var itemArray = [];
                // counter
                var c = 0;
                // loop through result to get the average prices
                for(var item in array['average_price']) {
                    //console.log(array['average_price'][item]);
                    avPricesArray[c] = array['average_price'][item];
                    itemArray[c] = item;
                    c++;
                }

                // DEBUGGING
                //console.log(itemArray);
                //console.log(avPricesArray);
                //console.log(table.length);

                var assetNumber = Number(lastAssetClassNumber)+1;
                //console.log(assetNumber);
                var tableNumber = allTables.length;

                // create new div
                var d = document.createElement('div');
                d.className = "row row-item-for-total-main";

                // create hidden input
                var hiddenStreetAddress =  document.createElement('input');
                hiddenStreetAddress.setAttribute('type', 'hidden');
                hiddenStreetAddress.setAttribute('name', 'street_address['+tableNumber+']');
                hiddenStreetAddress.setAttribute('value', address);
                hiddenStreetAddress.id = "street_address";
                hiddenStreetAddress.className = "street_address";
                // add hidden input field to div
                d.appendChild(hiddenStreetAddress);

                // create h4 / header tag
                var h4 = document.createElement('h4');
                h4.innerHTML = '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> '+address+' <a class="glyphicon glyphicon-new-window" style="cursor:pointer;" data-latlng="'+lat+','+lon+'" data-target="#mapModal" data-toggle="modal" type="button"></a>';
                // add h4 to div
                d.appendChild(h4);

                // create new table
                var t = document.createElement('table');
                t.className = 'table table-striped';

                // create table headers
                var thead = document.createElement('thead');
                thead.innerHTML = '<tr><th width="300">Media Type</th><th width="140">Quantity Required</th><th>Average Asset Price</th><th>Price</th><th width="100">&nbsp;</th><th width="100">Select</th></tr>';
                // add thead to table
                t.appendChild(thead);

                // create table body
                var tbody = document.createElement('tbody');

                // create blank table row
                var trB = document.createElement('tr');
                // add blank table row to table body
                tbody.appendChild(trB);
                var total = 0;
                for(var i = 0; i < itemArray.length; i++) {
                    // create line item
                    // create row
                    var tr = document.createElement('tr');
                    tr.className = 'asset_'+assetNumber+' asset_item';

                    // create description
                    var tddesc = document.createElement('td');
                    tddesc.innerHTML = itemArray[i].toUpperCase() + ' <input type="hidden" name="media_category[]" id="media_category" value="'+itemArray[i]+'" />';
                    // add description to row
                    tr.appendChild(tddesc);

                    // create qty
                    var tdqty = document.createElement('td');
                    tdqty.innerHTML = '<input id="med_quantity" width="140" class="form-control input-sm q_asset_'+assetNumber+' med_quantity" type="text" value="0" placeholder="Quantity Required" name="med_quantity[]">';
                    // add qty to row
                    tr.appendChild(tdqty);

                    // create average asset price
                    var tdaap = document.createElement('td');
                    //console.log(avPricesArray[i]);
                    tdaap.innerHTML = '<input id="asset_'+assetNumber+'" width="155" class="form-control input-sm avg_asset_'+assetNumber+'" type="text" value="'+avPricesArray[i].toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+'" name="avg_total[]" readonly="true">';
                    // add aap to row
                    tr.appendChild(tdaap);

                    var val = 1 * avPricesArray[i];

                    // create price
                    var tdp = document.createElement('td');
                    tdp.innerHTML = '<input id="asset_'+assetNumber+'" width="155" class="form-control input-sm rem_asset rem_asset_'+assetNumber+'" type="text" value="'+val.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+'" name="rem_total[]" readonly="true">';
                    // add price to row
                    tr.appendChild(tdp);
                    total += val;

                    // create more options button
                    var tdmob = document.createElement('td');
                    tdmob.innerHTML = '<a class="btn btn-primary btn-sm" data-target="#'+ itemArray[i].replace(' ', '').replace('(', '').replace(' ', '').replace(')', '').replace(' ', '').trim().replace(' ', '').toLowerCase() +'OptionsModal" data-toggle="modal" href="#"> <span class="glyphicon glyphicon-play"></span> More options</a>';
                    // add more options button to row
                    tr.appendChild(tdmob);

                    // create checkbox button
                    var tdc = document.createElement('td');
                    tdc.innerHTML = '<center><input id="asset_'+assetNumber+'" class="check_asset_'+assetNumber+'" type="checkbox" name="checks[]"></center>';
                    tr.appendChild(tdc);
                    $('.check_asset_'+assetNumber).checkbox();

                    // append row to table body
                    tbody.appendChild(tr);

                    assetNumber++;
                }

                total = total.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                $('#lblSubtotalAll').text(total);
                // add table body to table
                t.appendChild(tbody);

                // add table to div
                d.appendChild(t);

                $('.tablesForContent').append(d);
                $('input[type="checkbox"]').checkbox();
            },
            error: function(res) {
                console.log(res);
            }

        });
    }
}

function mezmerize(address, lat, lon) {

    $('#myPlaceTextBox').val("");

    var piecesOfAddress = address.split(",");
    var alreadyInSearchItems = false;
    var allLocations = $('.interests_wrapper li');
    allLocations.each(function(){
        var currentAddressPieces = this.getAttribute('data-location').replace(" ", "").split(",");
        var currentAddress = currentAddressPieces[0];
        if(currentAddress == piecesOfAddress[0]) {
            alreadyInSearchItems = true;
        }
    });

    if(!alreadyInSearchItems) {

        var latlong = getLatLong(address);
        var location_html = '<li class="location" data-location="' + address + '">' +
            '<span class="title">' + address + ' </span>' +
            '<span class="" onclick="deleteMe()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></span>' +
            '<input type="hidden" name="chosen_location[]" value="' + address + '">' +
            '<input type="hidden" name="latitude[]" value="' + lat + '">' +
            '<input type="hidden" name="longitude[]" value="' + lon + '">' +
            '<input type="hidden" name="address[]" value="' + address + '">' +
            '</li>';

        $(".interests_wrapper").append(location_html);

        var optOptions = {
            urlBase: '/codeigniter/ads2trade/',
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

        var pos = new google.maps.LatLng(lat, lon);
        var new_marker = new google.maps.Marker({position: pos, map: adsMap.map});

        adsMap.optOptions.markers.push(new_marker);
    } else {

    }
}
$(function() {

});


var adsMap = false;
function adsMapInit() {

    $('#mapModal').on('shown.bs.modal', function (e) {
        alert('showing map modal');
        var tmp_id = $(e.relatedTarget).attr('data-latLng');

        var parts = tmp_id.split(',');
        var position = new google.maps.LatLng(parts[0], parts[1]);

        var mapOptions = {
            center: position,
            zoom: 10
        };
        var campaign_map = new google.maps.Map(document.getElementById("campaign_map_canvas"), mapOptions);


        var selected_marker = new google.maps.Marker({
            position: position,
            map: campaign_map
        });
        var optOptions = {
            urlBase: base_url,
            markers: [selected_marker],
            showRadii: true,
            currentFilterCriteria: {},
            showSearchPOIButton: true,
            showFilterButton: true
        };
        var clusterOptions = {};
        var spiderOptions = {};
        var html2canvasOptions = {
            logging: true
        };
        adsMap = new AdsMap(campaign_map, clusterOptions, spiderOptions, html2canvasOptions, optOptions);
        google.maps.event.trigger(campaign_map,'resize');

        var campaign = new AdsMap.Campaign(adsMap, {url: base_url + 'index.php/new_campaign/upload_campaign', onsuccess: function() {
            $('#mapModal').modal('hide');
            alert('Succesfully posted images');
        }}, {id: tmp_id});
        $('#campaign_images').html(campaign.edit());
    });

}


$(document).ready(function() {

    $.post(
            'saveCampaign', {
            name: $('#campaign_desc').val(),
            budget: $('#camp_budget').val()
        },
        function(data) {
            //$('#stage').html(data);
        }

    );
});

function deleteMeOld() {
    var listItems = document.getElementsByTagName("li");
    for (var i = 0; i < listItems.length; i++) {
        listItems[i].onclick = function() {
            this.parentNode.removeChild(this);
        }
    }
}

function deleteMe(){

    var listItems = document.getElementsByTagName("li");
    for (var i = 0; i < listItems.length; i++) {
        listItems[i].onclick = function() {
            var address = this.getAttribute('data-location');
            var allRows = $('.row-item-for-total-main');
            allRows.each(function() {
                if(this.innerHTML.trim().indexOf(address) > -1) {
                    var total = 0;
                    $(this).find('.rem_asset').each(function() {

                        total += parseFloat($(this).val().replace(",", "").trim());
                    });

                    var val = $('#lblSubtotalAll').text();
                    val = parseFloat(val.replace(",", "").trim())
                    var end = val - total;

                    $('#lblSubtotalAll').text(end.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
                    this.remove();
                }
            });
            this.parentNode.removeChild(this);
        }
    }
}

