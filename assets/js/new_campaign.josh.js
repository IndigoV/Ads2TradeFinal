/**
 * Created by josh on 2015/01/19.
 */
var adsMap;
var alreadyInMediaTypes;
var alreadyInMainArrayToSubmit;
var arrayToSubmit = {};
var tempArrayToSubmit = {};
var allMediaOwnerDetails = {};
var mediaOwnersAlreadyInTable = [];
var allMoreOptions = [];
var numOfAssets = 0;
var selectedMoreOptionsAssetNumber = null;
var moreOptionsLocation = null;
var moreOptionsSelected = [];
var moreOptionsSelectedTemp = [];
var allMediaOwnersObject = [];
var selectedAssetAssetNumber = null;
//var startdate = "";
//var enddate = "";
var assetsLocation = null;
var tempPrice = "";

var operatorAddsSelectedAsset = {};
var datesForSelectedAssets = {};
//var allMarkers = {};
var allMarkers = [];
var defaultMap;
var discount = 0;

//$('select.mef_id').select2();

$(function() {

    alreadyInMediaTypes = [];

    // assign all dates and dropdowns here
    $('.select2dropdown').select2();
    $('#mec_id').select2();
    $('#mef_id').select2();
    $('#from_date').datepicker({dateFormat: 'yy-mm-dd'});
    $('#to_date').datepicker({dateFormat: 'yy-mm-dd'});
    $('#respond_date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.input-errors').hide();

    //filtering media family/type
    $("#mef_id").change(function () {
        var id = $(this).val();
        if (id || id == null) {
            $.ajax({
                url: 'ajax_get_mediatypes/?id=' + id,
                method: 'POST',
                dataType: 'JSON',
                success: function (data) {
                    var ul = document.createElement('ul');
                    ul.className = "chosen-results";
                    for (var i = 0; i < data.length; i++) {
                        if (i == 0) {
                            $('#mec_id').contents().remove();
                        }
                        var text = data[i].text;
                        var li = document.createElement('li');
                        li.className = "active-result";
                        li.setAttribute('data-option-array-index', data[i].id);
                        li.innerHTML = text;
                        ul.appendChild(li);
                        // create options
                        var option = document.createElement('option');
                        option.setAttribute('data-val', data[i].id);
                        option.value = data[i].text;
                        option.text = data[i].text;
                        document.getElementById("mec_id").appendChild(option);
                    }
                    $('#mec_id_chosen .chosen-drop').append(ul);

                },
                error: function(data) {
                    // // console.log(data);
                }
            });
        }
    });

    // validate input
    $('#next').click(function() {
        $('#input-errors').hide();
        var errors = "";
        // Step 1:
        // Make sure there is a campaign title
        if($('#camp_title').val() == "") {
            errors += "Campaign Title is required.<br />";
        }

        // Step 2:
        // Make sure budget is filled in, and only numeric
        if($('#budget').val() == "") {
            errors += "Budget is required.<br />";
        }

        // Step 3:
        // Make sure budget is numeric
        if($('#budget').val() == "") {
            errors += "Budget must be numeric only.<br />";
        }

        // Step 4:
        // Make sure starting date has not passed
        var dateStart = $('#from_date').val().split('-');
        var dateOne = new Date(dateStart[0], dateStart[1]-1, dateStart[2]);
        var dateTwo = new Date();
        if (dateOne < dateTwo) {
            errors += "You cannot set a starting day before today.<br />";
        }

        // Step 5:
        // Make sure end date has not passed
        var dateStart = $('#to_date').val().split('-');
        var dateOne = new Date(dateStart[0], dateStart[1]-1, dateStart[2]);
        if (dateOne < dateTwo) {
            errors += "You cannot set a ending day before today.<br />";
        }

        // Step 6:
        // Make sure end date is after start date
        var dateStart = $('#from_date').val().split('-');
        var dateEnd = $('#to_date').val().split('-');
        var dateOne = new Date(dateStart[0], dateStart[1]-1, dateStart[2]);
        var dateTwo = new Date(dateEnd[0], dateEnd[1]-1, dateEnd[2]);
        if (dateOne > dateTwo) {
            errors += "The end of the campaign cannot be before it starts.<br />";
        }

        // Step 7:
        // Make sure respond by date is not before today
        var dateStart = $('#respond_date').val().split('-');
        var dateOne = new Date(dateStart[0], dateStart[1]-1, dateStart[2]);
        var dateTwo = new Date();
        if (dateOne < dateTwo) {
            errors += "You cannot set the respond by date for before today.<br />";
        }

        // Step 7.2:
        // Make sure respond by date is not before today
        var dateRespond = $('#respond_date').val().split('-');
        var dateOne = new Date(dateRespond[0], dateRespond[1]-1, dateRespond[2]);
        var dateStart = $('#from_date').val().split('-');
        var dateTwo = new Date(dateStart[0], dateStart[1]-1, dateStart[2]);
        if (dateOne > dateTwo) {
            errors += "You cannot set the respond by date for after the campaign begins.<br />";
        }

        // Step 8:
        // Make sure There is a media family
        if(!$('.mef_family .select2-selection__rendered li').hasClass('select2-selection__choice')) {
            errors += "Please select a media family.<br />";
        }

        // Step 9:
        // Make sure There is a media type
        if(!$('.mec_type .select2-selection__rendered li').hasClass('select2-selection__choice')) {
            errors += "Please select a media type.<br />";
        }

        // Step 10:
        // Make sure there is atleast 1 selected place
        var arr = [];
        var all = $('input[name="chosen_location[]"]:checked');
        var allSearches = document.getElementsByClassName('location');
        if(all.length == 0 && allSearches.length == 0) {
            errors += "Please select at least 1 area.<br />";
        }

        // Step 11:
        // Display Errors
        if(errors != "") {
            $('#input-errors').show();
            $('#input-errors').html(errors);
            $('html, body').animate({
                scrollTop: $("#input-errors").offset().top - 50
            }, 500);
            return;
        }

        // Step 12:
        // get all chosen places
        for(var i = 0; i < all.length; i++) {
            arr[i] = all[i].value;
        }

        //// // console.log(arr);

        // Step 13:
        // get all chosen places from search
        var arr2 = [];
        var allSearches = document.getElementsByClassName('location');
        for(var j = 0; j < allSearches.length; j++) {
            arr2[j] = allSearches[j].getAttribute('data-location');
        }

        $('#newCampaign').submit();

    });

    function tickCheckbox(id) {
        var allCheckboxes = $('.row-item-for-total-main input[name="checks[]"]');

        allCheckboxes.each(function(){
            if($(this).data('counterforasset') == id) {
                $(this).attr('checked', true);
                $('.check_asset_'+id+' button .cb-icon-check').css('display', 'inline-block');
                $('.check_asset_'+id+' button .cb-icon-check-empty').css('display', 'none');
            }
        });
    }

    $('body').on('change', '.row-item-for-total-main input[name="checks[]"]', function(){
        // get counterforasset value
        var counterforasset = $(this).data('counterforasset');
        // get price
        var priceText = $('.rem_asset_'+counterforasset).val().replace(',', '');
        //// // console.log(priceText);
        if($(this).is(':checked')) {
            // add to subtotal
            var subtotalText = $('#lblSubtotalAll').text().replace(',', '');
            var subtotal = Number(subtotalText);
            var price = Number(priceText);

            var total = Number(subtotal) + Number(price);
            $('#lblSubtotalAll').text(insertCommas(total.toFixed(2) + ""));
            var budget = $('#lblEstimatedDifferenceAll').text();

            budget = Number(budget.replace(/[^0-9\.]+/g,""));
            var difference = Number(budget) - Number(price);
            //// // console.log(budget + " " + price + " " + difference);
            $('#lblEstimatedDifferenceAll').text(insertCommas(difference.toFixed(2) + ""));
        } else {
            // subtract from subtotal
            var subtotalText = $('#lblSubtotalAll').text().replace(',', '');
            var subtotal = Number(subtotalText);
            var price = Number(priceText);

            var total = Number(subtotal) - Number(price);

            $('#lblSubtotalAll').text(insertCommas(total.toFixed(2) + ""));
            var budget = $('#lblEstimatedDifferenceAll').text();
            budget = Number(budget.replace(/[^0-9\.]+/g,""));
            var difference = Number(budget) + Number(price);
            //// // console.log(budget + " " + price + " " + difference);
            $('#lblEstimatedDifferenceAll').text(insertCommas(difference.toFixed(2) + ""));
        }




        //$('#lblSubtotalAll').text(insertCommas(total.toFixed(2) + ""));
        //$('#lblEstimatedDifferenceAll').text(insertCommas(difference.toFixed(2) + ""));
    });

    $('body').on('change', '#med_quantity', function() {
        var className = $(this).attr('class');
        var classes = className.split(' ');
        for(var i = 0; i < classes.length; i++) {
            if(classes[i].indexOf('asset_') > -1) {
                var arr = classes[i].split('_');
                var quantity = document.getElementsByClassName('q_asset_'+arr[2])[0];
                var avg = document.getElementsByClassName('avg_asset_'+arr[2])[0];
                var q = Number(quantity.value.replace(/[^0-9\.]+/g,""));
                var a = Number(avg.value.replace(/[^0-9\.]+/g,""));
                var end = a * q;
                end = insertCommas(end.toFixed(2));
                document.getElementsByClassName('rem_asset_'+arr[2])[0].value = end;
                // get current table
                tickCheckbox(arr[2]);
                $('.table:has(.q_asset_'+arr[2]+')').each(function(index){
                    var subspan = $(this).find('.subtotal');
                    // Get All Quantities
                    var total = 0;
                    var allQuantities = $(this).find('.med_quantity');
                    allQuantities.each(function(){
                        var allClasses = $(this).attr('class').split(' ');
                        for(var j = 0; j < allClasses.length; j++) {
                            if(allClasses[j].indexOf('q_asset_') > -1) {
                                var allParts = allClasses[j].split('_');
                                var avg_asset = $('.avg_asset_'+allParts[2]).val();
                                var q = Number($(this).val().replace(/[^0-9\.]+/g,""));
                                var t = Number(avg_asset.replace(/[^0-9\.]+/g,"")) * q;
                                total += t;
                            }
                        }
                    });
                    subspan.text(insertCommas(total.toFixed(2)));

                    updateTotal();
                });
            }
        }
    });

    function updateTotal() {
        var total = 0;
        var allSubtotals = $('.rem_asset');
        //// // console.log(allSubtotals);
        for(var i = 0; i < allSubtotals.length; i++) {

            var assetCounter = allSubtotals[i].getAttribute('data-assetcounter');
            var doc = document.querySelectorAll('[data-counterForAsset="'+assetCounter+'"]');
            if(doc[0]) {
                if (doc[0].checked) {
                    total += Number(allSubtotals[i].value.replace(/[^0-9\.]+/g, ""));
                }
            }

        }
        var budget = $('#mainbudgetForInput').val();
        //// // console.log(budget);
        budget = Number(budget.replace(/[^0-9\.]+/g,""));
        var difference = budget - total;
        $('#lblSubtotalAll').text(insertCommas(total.toFixed(2) + ""));
        $('#lblEstimatedDifferenceAll').text(insertCommas(difference.toFixed(2) + ""));
        //updateBudgetRemaining();
    }

    function updateBudgetRemaining() {
        var cost = $('#lblSubtotalAll').text();
        var bb4r = $('.budgetBeforeRemaining').text();

        var endAmount = Number(bb4r.replace(/[^0-9\.]+/g,"")) - Number(cost.replace(/[^0-9\.]+/g,""));
        if(endAmount >= 0) {
            $('#lblBudgetRemaining').text(insertCommas(endAmount.toFixed(2) + ""));
            if(endAmount > 0) {
                $('#lblBudgetRemaining').css('color', 'green');
            }
        } else {
            endAmount = endAmount * -1;
            $('#lblBudgetRemaining').text("- " + insertCommas(endAmount.toFixed(2) + ""));
            $('#lblBudgetRemaining').css('color', 'red');
        }
    }

});

$('#addItem').on('click', function() {
    var mediaFamilies = $('#mef_id').val();
    var mediaTypes = $('#mec_id').val();

    if(mediaTypes != null) {
        // get all media types
        var allTables = $('.row table.table');
        var table = $('.row table.table .asset_item');
        var lastAsset = table[table.length-1];
        var lastAssetClasses = lastAsset.className;
        var lastAssetClassesSplit = lastAssetClasses.split(' ');
        var lastAssetClassNumber = lastAssetClassesSplit[0];
        lastAssetClassNumber = lastAssetClassNumber.replace('asset_', '');
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

        var length = uniqueMediaTypes.length;


        var allAddresses = [];
        // get locations
        var addresses = $('.street_address');
        for(var i = 0; i < addresses.length; i++) {
            allAddresses[i] = addresses[i].value;
        }

        var alreadyInArea = [];
        var k = 0;
        var table = $('.row table.table .asset_item');
        //// // console.log(table);
        var lastAsset = table[table.length-1];
        var lastAssetClasses = lastAsset.className;
        var lastAssetClassesSplit = lastAssetClasses.split(' ');
        var lastAssetClassNumber = lastAssetClassesSplit[0];
        lastAssetClassNumber = lastAssetClassNumber.replace('asset_', '');
        var assetNumber = Number(lastAssetClassNumber)+1;

        for(var i = 0; i < mediaTypes.length; i++) {
            mediaTypes[i] = mediaTypes[i].toUpperCase().trim();
        }

        for(var i = 0; i < uniqueMediaTypes.length; i++) {
            uniqueMediaTypes[i] = uniqueMediaTypes[i].toUpperCase().trim();
        }

        //// // console.log(uniqueMediaTypes);
        //// // console.log(mediaTypes);
        //// // console.log("--------");
        for(var i = 0; i < mediaTypes.length; i++) {
            //// // console.log(mediaTypes[i]);
            for(var j = 0; j < uniqueMediaTypes.length; j++) {
                //// // console.log(uniqueMediaTypes[j]);
                //if(mediaTypes[i] != uniqueMediaTypes[j]) {
                    if(!(uniqueMediaTypes.indexOf(mediaTypes[i]) > -1)) {
                        if(!(alreadyInMediaTypes.indexOf(mediaTypes[i]) > -1)) {
                            //// // console.log('----');
                            //// // console.log(mediaTypes[i]);
                            //// // console.log('----');
                            alreadyInMediaTypes[k] = mediaTypes[i];
                            k++;

                            $.ajax({
                                url: 'getAverageAssetPriceForItemAndLocations',
                                type: 'POST',
                                data: {'type' : mediaTypes[i], 'addresses' : allAddresses},
                                async: false,
                                success: function(res) {
                                    for(var l = 0; l < res.length; l++) {
                                        var address = res[l]['address'];
                                        var categoryID = res[l]['categoryid'];
                                        var aap = res[l]['aap'];
                                        var type = res[l]['type'];
                                        //// // console.log(address);
                                        var allDivs = $('.row-item-for-total-main');
                                        //// // console.log(allDivs);
                                        allDivs.each(function() {
                                            var h4 = this.getElementsByTagName('h4')[0].innerHTML.replace(/<[^>]*>/g, "").trim();
                                            //// // console.log(h4);
                                            //// // console.log(address);
                                            //// // console.log();
                                            if(h4.trim() == address.trim()) {
                                                // the current parent contains the correct address
                                                // insert row into table


                                                var t = this.getElementsByTagName('table')[0];
                                                var tbody = t.getElementsByTagName('tbody')[0];

                                                // create table row
                                                var tr = document.createElement('tr');
                                                tr.className = "asset_" + assetNumber + " asset_item";

                                                // create table cells
                                                var tdMediaType = document.createElement('td');
                                                var tdQuantity = document.createElement('td');
                                                var tdAverageAssetPrice = document.createElement('td');
                                                var tdPrice = document.createElement('td');
                                                var tdMoreOptions = document.createElement('td');
                                                tdMoreOptions.setAttribute('width', '50');
                                                var tdMoreSelect = document.createElement('td');

                                                var typeNormal = type;

                                                var type2 = type.replace("(", "");
                                                type2 = type2.replace(")", "");
                                                type2 = type2.replace(/ /g, "");
                                                type2 = type2.toLowerCase();
                                                //// // console.log(type2);

                                                // create table data
                                                tdMediaType.innerHTML = type.toUpperCase() + ' <input type="hidden" id="media_category", value="'+typeNormal.toLowerCase()+'" name="media_category[]" />';
                                                tdQuantity.innerHTML = '<input id="med_quantity" class="form-control input-sm q_asset_'+assetNumber+' med_quantity" type="text" value="0" placeholder="Quantity Required" name="med_quantity[]">';
                                                tdAverageAssetPrice.innerHTML = '<input id="asset_'+assetNumber+'" class="form-control input-sm avg_asset_'+assetNumber+'" type="text" value="'+aap.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+'" name="avg_total[]" readonly="true">';
                                                tdPrice.innerHTML = '<input id="asset_'+assetNumber+'" class="form-control input-sm rem_asset rem_asset_'+assetNumber+'"data-assetcounter="'+assetNumber+'" data-categoryid="'+categoryID+'" type="text" value="0.00" name="rem_total[]" readonly="true">';
                                                tdMoreOptions.innerHTML = '<a href="#" class="btn btn-primary btn-sm" data-target="#'+type2+'OptionsModal" data-toggle="modal"><span class="glyphicon glyphicon-play"></span> More Options</a>';
                                                tdMoreSelect.innerHTML = '<center><input id="asset_'+assetNumber+'" data-categoryid="'+categoryID+'" data-counterforasset="'+assetNumber+'"  class="check_asset_'+assetNumber+'" type="checkbox" name="checks[]"></center>';

                                                tr.appendChild(tdMediaType);
                                                tr.appendChild(tdQuantity);
                                                tr.appendChild(tdAverageAssetPrice);
                                                tr.appendChild(tdPrice);
                                                tr.appendChild(tdMoreOptions);
                                                tr.appendChild(tdMoreSelect);

                                                tbody.appendChild(tr);
                                                $('.check_asset_'+assetNumber).checkbox();
                                                //// // console.log(assetNumber);
                                                assetNumber++;
                                            }
                                        });
                                    }
                                },
                                error: function(res) {
                                    // // console.log(res);
                                }
                            });

                        }
                    }
                //}
            }
        }

    }
});

function getAllCheckedItems() {
    var allCheckBoxes = $('.row-item-for-total-main input[name="checks[]"]:checked');
    tempArrayToSubmit['location'] = {};
    //numOfAssets = allCheckBoxes.length;
	numOfAssets = 0;
    for(var i = 0; i < allCheckBoxes.length; i++) {
        // checked
        // 1. get the id of the asset
        var assetId = allCheckBoxes[i].id;
        // 2. get the number of that asset
        var assetNumber = assetId.replace('asset_', '');
        // 3. get the asset quantity
        var qty = $('.q_asset_'+assetNumber).val();
        // 4. get the asset type
        var node = $('.check_asset_'+assetNumber);
        var t = node.parent().parent().siblings().eq(0).text().trim();
        //var ty = node.parent().parent().siblings('#media_category').val().trim();
        var ty = node.parent().parent().siblings().eq(0).find('input[name="media_category[]"]').val();
        //// // console.log(t); // t = type - output is the text needed, ie: bench, or streetpole, and it works just fine.
        // 5. get the asset location
        var loc = node.parent().parent().parent().parent().parent().siblings('h4').text().replace(/<[^>]*>/g, "").trim();
        // 6. get the more options data

        var moreOptions = [];
		
		numOfAssets = parseInt(numOfAssets) + parseInt(qty);

        //if(moreOptionsSelected.indexOf(loc) > -1) {
        //    //// // console.log();
        //
        //    var all = moreOptionsSelected[loc][ty.split(' ').join('-')];
        //    if(all) {
        //        for(var j = 0; j < all.length; j++) {
        //            // // console.log(all[j]);
        //            moreOptions.push(all[j]);
        //        }
        //    }
        //}

        if (moreOptionsSelected.indexOf(loc) > -1) {
            //// // console.log('location found');
            // location found
            //// // console.log(moreOptionsSelected);
            if (moreOptionsSelected[loc].indexOf(ty.split(' ').join('-').toLowerCase()) > -1) {
                //// // console.log('type found');
                // type exists in the list
                var all = moreOptionsSelected[loc][ty.split(' ').join('-').toLowerCase()];
                for(var j = 0; j < all.length; j++) {
                    moreOptions.push(all[j]);
                }
            } else {
                // // console.log("type not found "+ty);
            }
        } else {
            // location not found

        }


        // 7. Output to Javascript Array
        if (!tempArrayToSubmit.hasOwnProperty(loc)) {
            //If we don't, create it.
            tempArrayToSubmit[loc] = {};
            tempArrayToSubmit[loc][t] = {
                'qty': qty,
                'assetNumber': assetNumber,
                'moreOptions' : moreOptions
            };
        } else {
            tempArrayToSubmit[loc][t] = {
                'qty': qty,
                'assetNumber': assetNumber,
                'moreOptions' : moreOptions
            };
        }
    }
    return tempArrayToSubmit;
}

function getBudgetForMediaOwner() {
    var allCheckBoxes = $('.row-item-for-total-main input[name="checks[]"]:checked');
    var budget = 0;
    for(var i = 0; i < allCheckBoxes.length; i++) {
        // checked
        // 1. get the id of the asset
        var assetId = allCheckBoxes[i].id;
        // 2. get the number of that asset
        var assetNumber = assetId.replace('asset_', '');
        //// // console.log(assetNumber);
        // 3. get the asset quantity
        var qty = $('.q_asset_'+assetNumber).val();
        //// // console.log(qty);
        // 4. get the average asset price
        var avg = $('.avg_asset_'+assetNumber).val();
        //// // console.log(avg);
        var q = Number(qty.replace(/[^0-9\.]+/g,""));
        var a = Number(avg.replace(/[^0-9\.]+/g,""));
        var end = a * q;
        var aap = end.toFixed(2);
        budget += Number(aap);
    }
    return budget;
}


$('.saveChanges').on('click', function() {
    // STEPS:
    // 1. Get main type
    // 2. Get ID / asset number of the selected type
    // 3. Get selected check boxes
    // 4. Get location
    // 5. Add selected check boxes to array to indicate asset with asset ID has been selected
    // 6. Uncheck boxes

    // 1: Get main type
    var classes = $(this).attr('class').split(" ");
    var mainType = classes[3].toLowerCase();

    // 2: Get ID / asset number of the selected type
    var assetClass = selectedMoreOptionsAssetNumber;

    // 3: Get selected check boxes
    var selectedCheckBoxes = $('.optionsModalWindow input[name="moreOptionsCheckBox[]"]');
    moreOptionsSelectedTemp = [];
    //// // console.log(moreOptionsSelected);

    // 4: Get location
    var loc = moreOptionsLocation;
    if(loc == null) {
        loc = "";
    }

    //// // console.log(loc);

    // 5: Add selected check boxes to array to indicate asset with asset ID has been selected
    for(var i = 0; i < selectedCheckBoxes.length; i++) {
        if (selectedCheckBoxes[i].checked) {
            // checked
            // get ID of checked asset
            var selectedCheckboxClasses = selectedCheckBoxes[i].parentNode.parentNode.className;
            var selectedAssetClass = selectedCheckboxClasses.split(" ")[0].replace("tr_", "");
            //// // console.log(selectedAssetClass);
            if (moreOptionsSelected.indexOf(loc) > -1) {
                // location found
                //// // console.log(moreOptionsSelected);
                if (moreOptionsSelected[loc].indexOf(mainType) > -1) {
                    // type already exists in the list
                    if (moreOptionsSelected[loc][mainType].indexOf(selectedAssetClass) > -1) {
                        // asset already exists in the list
                        // do nothing
                        //// // console.log("do nothing");
                    } else {
                        // asset does not exist in the list, so add asset
                        moreOptionsSelected[loc][mainType].push(selectedAssetClass);
                        //// // console.log("type exists but asset does not");
                    }
                } else {
                    // type does not exist in the list
                    // add type and asset
                    moreOptionsSelected[loc].push(mainType);
                    moreOptionsSelected[loc][mainType] = [];
                    moreOptionsSelected[loc][mainType].push(selectedAssetClass);
                    //// // console.log("create new type and asset");
                }
            } else {
                // location not found
                moreOptionsSelected.push(loc);
                //// // console.log(moreOptionsLocation);
                moreOptionsSelected[loc] = [];
                moreOptionsSelected[loc].push(mainType);
                moreOptionsSelected[loc][mainType] = [];
                moreOptionsSelected[loc][mainType].push(selectedAssetClass);
            }
        } else {
            // not checked
            var selectedCheckboxClasses = selectedCheckBoxes[i].parentNode.parentNode.className;
            var selectedAssetClass = selectedCheckboxClasses.split(" ")[0].replace("tr_", "");

            // take out if array
            if(moreOptionsSelected.indexOf(loc) > -1) {
                if(moreOptionsSelected[loc].indexOf(mainType) > -1) {
                    if(moreOptionsSelected[loc][mainType].indexOf(selectedAssetClass) > -1) {
                        moreOptionsSelected[loc][mainType].splice(moreOptionsSelected[loc][mainType].indexOf(selectedAssetClass), 1);
                    }
                }
            }
        }
    }

    // 6: Uncheck Boxes
    var all = $('.modal-window-more-options input[name="moreOptionsCheckBox[]"]');
    all.each(function() {
        $(this).attr('checked', false);
        var classes = $(this).attr('class');
        var assetNumber = classes.split(" ")[0];
        $('.'+assetNumber+' .cb-icon-check').css("display", "none");
        $('.'+assetNumber+' .cb-icon-check-empty').css("display", "inline-block");
    });

    $('.modal-window-more-options').modal('hide');

    //// // console.log(moreOptionsSelected);

});

function getCheckedAssets(assetNumber, loc) {
    //// // console.log($('.asset_'+assetNumber));
    var asset = $('.asset_'+assetNumber);
    //// // console.log(loc);
    //var child = asset.find('input[name*="media_category"]').val();
    //// // console.log(child);
}

function getMoreOptions(assetNumber) {

}

$('#addMediaOwnerBtn').on('click', function() {
    // get array from all items that are selected and their details
    var allCheckedItems = getAllCheckedItems();
    var mediaCategories = [];
    Object.keys(allCheckedItems).map(function(k) {
        var obj = allCheckedItems[k] ;
        var keys = [];
        for(var k in obj) keys.push(k);
        if(keys != ''){
         mediaCategories = keys;
        }
    });
    
    //get all media owners
    var allMediaOwners = $('#media_owners').val();
    var mediaOwnerObject = {};
    if(allMediaOwners == null){
        return;
    }
    for(var i = 0; i < allMediaOwners.length; i++) {

        var mediaOwnerDetails = allMediaOwners[i].split(';');
        var mediaOwnerId = mediaOwnerDetails[0];
        var mediaOwnerFirstName = mediaOwnerDetails[1];
        var mediaOwnerLastName = mediaOwnerDetails[2];

        if(!(mediaOwnersAlreadyInTable.indexOf(mediaOwnerId) > -1)) {

            mediaOwnersAlreadyInTable.push(mediaOwnerId);

            //mediaOwnerObject[mediaOwnerId] = {};
            //mediaOwnerObject[mediaOwnerId] = getAllCheckedItems();

            mediaOwnerDetails[mediaOwnerId] = allCheckedItems;
            var budgetForMediaOwner = getBudgetForMediaOwner();
            // get all selected more options
            var moreOptions = getMoreOptions(mediaOwnerId);

            // add to table of media owners
            var mediaOwnersTable = $('.media-owners-table');
            // create new row and data
            var tr = document.createElement('tr');

            var numberOfAssets = numOfAssets;

            tr.innerHTML = '<td class="text-left indent25">'+mediaOwnerFirstName+' '+mediaOwnerLastName+'<input type="hidden" name="media_owner_names[]" class="media_owners_names" value="'+mediaOwnerFirstName+' '+mediaOwnerLastName+'"/><input type="hidden" name="media_owner_id" value="'+mediaOwnerId+'" id="media_owner_id" class="media_owner_'+mediaOwnerId+'"/></td> <td>R '+insertCommasForBudget(budgetForMediaOwner + "")+' <input type="hidden" class="media_owner_budget" name="media_owner_budgets[]" id="media_owner_budget" value="'+budgetForMediaOwner+'"/></td> <td>'+numberOfAssets+'</td> <td>'+mediaCategories+'</td>';
            mediaOwnersTable.append(tr);
        } else {
            // remove media owner from list and add them again with new content
            //// // console.log(mediaOwnersAlreadyInTable);
            var position = mediaOwnersAlreadyInTable.indexOf(mediaOwnerId);
            if (position > -1) {
                $('.media_owner_' + mediaOwnerId).parent().parent().remove();
                mediaOwnersAlreadyInTable.splice(position, 1);
                mediaOwnersAlreadyInTable.push(mediaOwnerId);

                //mediaOwnerObject[mediaOwnerId] = {};
                // arrayTS = arrayToSubmit
                mediaOwnerDetails[mediaOwnerId] = allCheckedItems;
                var budgetForMediaOwner = getBudgetForMediaOwner();
                // add to table of media owners
                var mediaOwnersTable = $('.media-owners-table');
                // create new row and data
                var tr = document.createElement('tr');

                var numberOfAssets = numOfAssets;

                tr.innerHTML = '<td class="text-left indent25">' + mediaOwnerFirstName + ' ' + mediaOwnerLastName + '<input type="hidden" name="media_owner_names[]" class="media_owners_names" value="' + mediaOwnerFirstName + ' ' + mediaOwnerLastName + '"/><input type="hidden" name="media_owner_id" value="' + mediaOwnerId + '" id="media_owner_id" class="media_owner_' + mediaOwnerId + '"/></td> <td>R ' + insertCommasForBudget(budgetForMediaOwner + "") + ' <input type="hidden" class="media_owner_budget" name="media_owner_budgets[]" id="media_owner_budget" value="' + budgetForMediaOwner + '"/></td> <td>' + numberOfAssets + '</td> <td>' + mediaCategories + '</td>';
                mediaOwnersTable.append(tr);
            }
        }
        if(mediaOwnerDetails != null || mediaOwnerDetails != 'undefined' || mediaOwnerDetails != "") {
            allMediaOwnersObject[mediaOwnerId] = mediaOwnerDetails;
        }

    }
    //// // console.log(allMediaOwnersObject);

    // add modal window data
});

function insertCommasForBudget(s) {
    // get stuff before the dot
    var d = s.indexOf('.');
    var s2 = d === -1 ? s : s.slice(0, d);
    // insert commas every 3 digits from the right
    for (var i = s2.length - 3; i > 0; i -= 3)
        s2 = s2.slice(0, i) + ',' + s2.slice(i);
    // append fractional part
    if (d !== -1)
        s2 += s.slice(d);
    return s2;
}

$('.modal-window-more-options').on('show.bs.modal', function (e) {
    var invoker = $(e.relatedTarget);
    var invokerParentClasses = invoker.parent().parent().attr('class');
    var assetClass = invokerParentClasses.split(" ")[0];
    var assetNumber = assetClass.replace("asset_", "");
    selectedMoreOptionsAssetNumber = assetNumber;

    var loc = invoker.parent().parent().parent().parent().siblings('#street_address').val();
    getCheckedAssets(assetNumber, loc);
    moreOptionsLocation = loc.trim();

    //// // console.log(moreOptionsLocation);
});

function cleanArray(actual){
    var newArray = new Array();
    for(var i = 0; i<actual.length; i++){
        if (actual[i] != "" && actual[i] != null && actual[i] != ""){
            newArray.push(actual[i]);
        }
    }
    return newArray;
}

$('#saveCampaignSendToMediaOwner').on('click', function() {
    //// // console.log(allMediaOwnersObject);
    //for( var i = 0; i < allMediaOwnersObject.length; i++ ) {
    //    if( typeof(allMediaOwnersObject[i])==="undefined" ) {
    //        allMediaOwnersObject[i] = "";
    //    }
    //}

    var na = cleanArray(allMediaOwnersObject);
    var a = [];
    for(var i = 0; i < na.length; i++) {
        if(na[i] != undefined && na[i] != null && na[i] != "") {
            for(var j = 0; j < na[i].length; j++) {
                if(na[i][j] != undefined && na[i][j] != null && na[i][j] != "") {
                    a.push(na[i]);
                }
            }

        }
    }
    //// // console.log(JSON.stringify(a));
    $.ajax({
        url: 'saveCampaignSendToMediaOwner',
        type: 'POST',
        data: {data : JSON.stringify(allMediaOwnersObject), campaignID : QueryString.id},
        success: function(res) {
            window.location.href = "campaigns";
            // console.log(res);
        },
        error: function(res) {
            // // console.log(res);
        }
    });
});

var QueryString = function () {
    // This function is anonymous, is executed immediately and
    // the return value is assigned to QueryString!
    var query_string = {};
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        // If first entry with this name
        if (typeof query_string[pair[0]] === "undefined") {
            query_string[pair[0]] = pair[1];
            // If second entry with this name
        } else if (typeof query_string[pair[0]] === "string") {
            var arr = [ query_string[pair[0]], pair[1] ];
            query_string[pair[0]] = arr;
            // If third or later entry with this name
        } else {
            query_string[pair[0]].push(pair[1]);
        }
    }
    return query_string;
} ();

$('.options-modal-choose-asset').on('show.bs.modal', function (e) {
    var invoker = $(e.relatedTarget);
    //var invokerParentClasses = invoker.parent().parent().attr('class');
    var invokerParentClasses = invoker.parent().parent().attr('class');
    //// // console.log(invokerParentClasses);
    //return;
    var assetClass = invokerParentClasses.split(" ")[0];
    var assetNumber = assetClass.replace("asset_", "");
    selectedAssetAssetNumber = assetNumber;

    var loc = invoker.parent().parent().parent().parent().siblings('#street_address').val();
    getCheckedAssets(assetNumber, loc);
    assetsLocation = loc.trim();

    //// // console.log(moreOptionsLocation);
});

$('#saveSendToOperator').on('click', function(e){
    //// // console.log(assetsSelected);
    //var ass = {};
    var id = getUrlParameter('id');
    var operatorid = getUrlParameter('oid');
    var alreadySelected = "false";
    if(typeof assetsAlreadySelected != 'undefined') {
        alreadySelected = assetsAlreadySelected;
    }
    //discount = $('#discountedTotal').val();
    discount = document.getElementById('discountedTotal').value;
    // console.log(discount);
    $.ajax({
        url: 'saveSendToOperator',
        type: 'post',
        data: {data : JSON.stringify(selectedAssetsWithDates), id: id, oid: operatorid, discountedTotal: discount, finalPrice: finalPrice, assetsAlreadySelected: alreadySelected},
        success: function(res) {
            // console.log(res);
            if(res.success == "true") {
                // console.log(res);
                window.location.href = "media_owner_campaign_list";
            } else {
                alert("Could not save, sorry.");
            }
        },
        error: function(res) {
            // // console.log(res);
        }
    });
});

$('#acceptOperatorsProposal').on('click', function(e){
    //// // console.log(assetsSelected);
    //var ass = {};
    var id = getUrlParameter('id');
    var operatorid = getUrlParameter('oid');
    if(assetsAlreadySelected == false) {
        if(Object.size(selectedAssetsWithDates) == 0) {
            alert("Please select some assets");
            return;
        }
    }
    //alert("something else");
    //return;
    $.ajax({
        url: 'acceptOperatorsProposal',
        type: 'post',
        data: {id: id, oid: operatorid},
        success: function(res) {
            // console.log(res);
            if(res.success == "true") {
                //// console.log(res);
                window.location.href = "media_owner_campaign_list";
            } else {
                alert("Could not save, sorry.");
            }
        },
        error: function(res) {
            // console.log(res);
        }
    });
});

function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}

$('.saveChangesMediaOwner').on('click', function() {
    // STEPS:
    // 1. Get main type
    // 2. Get ID / asset number of the selected type
    // 3. Get selected check boxes
    // 4. Get location
    // 5. Add selected check boxes to array to indicate asset with asset ID has been selected
    // 6. Uncheck boxes
    assetsSelectedTemp = {};
    //totalPrice = "";
    var loc = "";
    // 3: Get selected check boxes
    //var selectedCheckBoxes =
    $('.assetsModalWindow input[name="asset_checkbox[]"]:checked').each(function() {
        var type = $(this).data('type').toLowerCase();
        loca = $(this).data('location');
        loc = loca.toLowerCase();
        if(typeof loc != 'undefined') {
            var id = $(this).attr('id');
            alert(id);
            var price = $(this).data('price');
            var cost = $(this).data('cost');
            var assetName = $(this).data('assetname');
            var mecid = $(this).data('mecid');
            var lat = $(this).data('lat');
            var lng = $(this).data('lng');

            //assetsSelectedTemp[location][media type][asset id]
            if(!assetsSelectedTemp.hasOwnProperty(loc)) {
                // create it
                assetsSelectedTemp[loc] = {};
            }
            if(!assetsSelectedTemp[loc].hasOwnProperty(mecid)) {
                assetsSelectedTemp[loc][mecid] = [];
            }
            assetsSelectedTemp[loc][mecid].push(id);
            if(!assetsSelected.hasOwnProperty(loc)) {
                assetsSelected[loc] = {};
            }
            // console.log("assetsSelectedTemp: " + assetsSelectedTemp);
            assetsSelected[loc][mecid] = assetsSelectedTemp[loc][mecid];
            // console.log("loc: ", loc);
            // console.log("mecid: ", mecid);
            // console.log("assetsSelected: ", assetsSelected);

            addToList(id, type, mecid, loca, price, cost, assetName, id, lat, lng);

            updatePrice(price, id, loc, mecid);
        }
    });

    // 6: Uncheck Boxes
    var all = $('.assetsModalWindow input[name="asset_checkbox[]"]');
    all.each(function() {
        $(this).attr('checked', false);
        var classes = $(this).attr('class');
        var assetNumber = classes.split(" ")[0];
        $('.'+assetNumber+' .cb-icon-check').css("display", "none");
        $('.'+assetNumber+' .cb-icon-check-empty').css("display", "inline-block");
    });

    $('.options-modal-choose-asset').modal('hide');
    $('.choose-asset-modal').modal('hide');

    //assetsSelected.push(assetsSelectedTemp);

    //// // console.log(assetsSelected);

    updatePrices();
});

function updatePrices() {
    var totalPrice = "";
    //// // console.log(totalPrice);
    for(key in allPrices) {
        if(allPrices.hasOwnProperty(key)) {
            for(type in allPrices[key]) {
                $.each(allPrices[key][type], function() {
                    totalPrice =  Number(totalPrice) + Number(this);
                });
            }
        }
    }
    finalPrice = totalPrice;
    $('#price').html(totalPrice);
    $('#discountedTotal').val(totalPrice);
}

function updatePrice(price, id, loc, type) {
    if(!allPrices.hasOwnProperty(loc)) {
        allPrices[loc] = {};
    }
    if(!allPrices[loc].hasOwnProperty(type)) {
        allPrices[loc][type] = {};
    }
    if(!allPrices[loc][type].hasOwnProperty(id)) {
        allPrices[loc][type][id] = [];
    }
    if(allPrices[loc][type][id] == "") {
        if(isNumeric(price)) {
            allPrices[loc][type][id].push(price);
        } else {
            allPrices[loc][type][id].push("0");
        }
    }
    //// // console.log(allPrices);
}

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function updateRemoveFromPrices(price, id, loc, type) {
    if(!allPrices.hasOwnProperty(loc)) {
        return;
    }
    if(!allPrices[loc].hasOwnProperty(type)) {
        return;
    }
    if(allPrices[loc][type].hasOwnProperty(id)) {
        delete allPrices[loc][type][id];
    }
}

function addToList(id, type, mecid, loca, price, cost, assetName, assetID, lat, lng) {

    var loc = loca.toLowerCase();

    // console.log("id: ", id);
    // console.log("type: ", type);
    // console.log("mecid: ", mecid);
    // console.log("assetid: ", assetID);

    var tr = document.createElement("tr");
    tr.setAttribute('selectedassetid', assetID);
    tr.id = 'selectedasset_' + assetID;

    var tdAssetName = document.createElement("td");
    tdAssetName.text = assetName;

    var tdLoc = document.createElement("td");
    tdLoc.text = loc;

    var tdType = document.createElement("td");
    tdType.text = type;

    var tdCost = document.createElement("td");
    tdCost.text = cost;

    var tdPrice = document.createElement("td");
    tdPrice.text = price;

    if(!alreadyInList.hasOwnProperty(loc)) {
        alreadyInList[loc] = {};
    }
    if(!alreadyInList[loc].hasOwnProperty(type)) {
        alreadyInList[loc][type] = [];
    }
    if(!(alreadyInList[loc][type].indexOf(id) > -1)) {
        alreadyInList[loc][type].push(id);
        // console.log(loca);
        if(cost == "no") {
            tr.innerHTML = ('<td data-location="'+loc.toLowerCase()+'">'+loca+'</td><td data-type="'+mecid+'">'+type+'</td><td><input type="date" class="form-control" data-assetid="'+id+'" data-location="'+loc.toLowerCase()+'" id="start_date" value="'+startDate+'"/></td><td><input type="date" class="form-control" data-assetid="'+id+'" data-location="'+loc.toLowerCase()+'" id="end_date" value="'+endDate+'"/></td><td data-assetname="'+assetName+'">'+assetName+'</td><td data-price="'+price+'">'+price+'</td><td><span class="glyphicon glyphicon-remove remove-asset" data-location="'+loc.toLowerCase()+'" data-type="'+type.toLowerCase()+'" data-mecid="'+mecid+'" data-assetid="'+assetID+'"></span></td>');
        } else {
            tr.innerHTML = ('<td data-location="'+loc.toLowerCase()+'">'+loca+'</td><td data-type="'+mecid+'">'+type+'</td><td><input type="date" class="form-control" data-assetid="'+id+'" data-location="'+loc.toLowerCase()+'" id="start_date" value="'+startDate+'"/></td><td><input type="date" class="form-control" data-assetid="'+id+'" data-location="'+loc.toLowerCase()+'" id="end_date" value="'+endDate+'"/></td><td data-assetname="'+assetName+'">'+assetName+'</td><td data-price="'+price+'">'+price+'</td><td data-cost="'+cost+'">'+cost+'</td><td><span class="glyphicon glyphicon-remove remove-asset" data-location="'+loc.toLowerCase()+'" data-type="'+type.toLowerCase()+'" data-mecid="'+mecid+'" data-assetid="'+assetID+'"></span></td>');
        }

    }
    $('#body-list').append(tr);
    //// console.log("assetID: " + assetID);
    if(typeof assetID != 'undefined') {

        if(!selectedAssetsWithDates.hasOwnProperty(assetID)) {
            selectedAssetsWithDates[assetID] = {};
        }

        if(!selectedAssetsWithDates[assetID].hasOwnProperty(loc)) {
            selectedAssetsWithDates[assetID][loc] = {};
        }

        selectedAssetsWithDates[assetID][loc] = {
            start: startDate,
            end: endDate,
            location: loc,
            mecid: mecid,
            price: price,
            cost: cost,
            lat: lat,
            lng: lng,
            assetName: assetName,
            type: type,
            assetID: assetID
        };
    }


}

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

$(document).on('click', '#submitProposalToMediaOwner', function() {
    //// console.log("in submitProposalToMediaOwner");
    var id = getUrlParameter('id');
    var moid = getUrlParameter('moid');
    var tot = finalPrice + "";
    var dis = $('#discountedTotal').val();
    //// console.log("in submitProposalToMediaOwner");
    $.ajax({
        url: 'submitProposalToMediaOwner',
        type: 'post',
        data: {data : JSON.stringify(selectedAssetsWithDates) + "", id: id + "", moid: moid + "", discounted_total: dis + "", total: tot + ""},
        success: function(res) {
            //// console.log(res);
            if(res.success == "true") {
                //// console.log(res);
                window.location.href = "proposals";
            } else {
                alert("Could not save, sorry.");
            }
        },
        error: function(res) {
            // // console.log(res);
        }
    });
});

$(document).on('click', '.remove-asset', function(){
    var assetID = $(this).data('assetid');
    var mecid = $(this).data('mecid');
    var location = $(this).data('location');

    //// console.log("remove-asset");
    //// console.log("assetID: ", assetID);
    //// console.log("mecid: ", mecid);
    //// console.log("location: ", location);

    if(selectedAssetsWithDates.hasOwnProperty(assetID)) {
        if(selectedAssetsWithDates[assetID].hasOwnProperty(location.toLowerCase())) {
            delete selectedAssetsWithDates[assetID][location.toLowerCase()];
        }

        if(Object.size(selectedAssetsWithDates[assetID]) == 0) {
            delete selectedAssetsWithDates[assetID];
        }
    }

    $('#selectedasset_'+assetID).remove();

    var mecid = $(this).data('mecid');
    var type = $(this).data('type');

    if(allPrices.hasOwnProperty(location.toLowerCase())) {

        if(allPrices[location.toLowerCase()].hasOwnProperty(mecid)) {

            if(allPrices[location.toLowerCase()][mecid].hasOwnProperty(assetID)) {
                //delete allPrices[location.toLowerCase()][mecid][assetID][0];
                delete allPrices[location.toLowerCase()][mecid][assetID];
            }
            //if (Object.size(allPrices[location.toLowerCase()][mecid][assetID]) == 0) {
            //    delete allPrices[location.toLowerCase()][mecid][assetID];
            //}
            if (Object.size(allPrices[location.toLowerCase()][mecid]) == 0) {
                delete allPrices[location.toLowerCase()][mecid];
            }
        }
        if (Object.size(allPrices[location.toLowerCase()]) == 0) {
            delete allPrices[location.toLowerCase()];
        }
    }

    if(alreadyInList.hasOwnProperty(location.toLowerCase())) {

        if(alreadyInList[location.toLowerCase()].hasOwnProperty(type)) {
            delete alreadyInList[location.toLowerCase()][type];
        }
        if(Object.size(alreadyInList[location.toLowerCase()]) == 0) {
            delete alreadyInList[location.toLowerCase()];
        }
    }

    //if(Object.size(allPrices[location.toLowerCase()][mecid]) == 0) {
    //    delete allPrices[location.toLowerCase()][mecid];
    //}
    //if(Object.size(allPrices[location.toLowerCase()]) == 0) {
    //    delete allPrices[location.toLowerCase()];
    //}

    // console.log("allPrices: ", allPrices);
    // console.log("alreadyInList: ", alreadyInList);

    updatePrices();
});

$('.saveChangesSelectedAssetsOperator').on('click', function() {
    //var assetType = $(this).data('assetname');
    //var loc = $(this).data('location');

    //// consolelog(operatorAddsSelectedAsset);

    $('.selectedAssetsModalWindow input[name="asset_checkbox[]"]:checked').each(function() {
        var loc = $(this).data('location');
        var id = $(this).attr('id');
        var check = $('tbody[data-attachedtable="'+ loc +'"] tr[data-assetid="'+ id +'"]');
        if(!(check.length > 0)) {
            var type = $(this).data('type');
            var price = $(this).data('price');
            var cost = $(this).data('cost');
            var assetName = $(this).data('assetname');
            var mecid = $(this).data('mecid');
            if (!operatorAddsSelectedAsset.hasOwnProperty(loc)) {
                operatorAddsSelectedAsset[loc] = {};
            }

            if (!operatorAddsSelectedAsset[loc].hasOwnProperty(type)) {
                operatorAddsSelectedAsset[loc][type] = [];
            }

            if (operatorAddsSelectedAsset[loc][type].indexOf(id) == -1) {
                operatorAddsSelectedAsset[loc][type].push(id);
            }

            // id is now in the array, update prices
            updatePrice(price, id, loc, mecid);
            addToSelectedAssetsList(price, id, type, assetName, loc);
        }
    });

    updatePrices();

    // 6: Uncheck Boxes
    var all = $('.options-modal-select-asset input[name="asset_checkbox[]"]');
    all.each(function() {
        $(this).attr('checked', false);
        var classes = $(this).attr('class');
        var assetNumber = classes.split(" ")[0];
        $('.'+assetNumber+' .cb-icon-check').css("display", "none");
        $('.'+assetNumber+' .cb-icon-check-empty').css("display", "inline-block");
    });

    $('.options-modal-select-asset').modal('hide');

    //// // console.log(operatorAddsSelectedAsset);

});

function addToSelectedAssetsList(price, id, type, assetName, loc) {
    var tbody = $('tbody[data-attachedtable="'+loc+'"]');
    var check = $('tbody[data-attachedtable="'+ loc +'"] tr[data-assetid="'+ id +'"]');
    alert(check.length);
    if(check.length > 0) {
        return;
    }
    var tr = document.createElement('tr');

    var number = tbody.children().length;
    number++;

    var tdNumber = document.createElement('td');
    tdNumber.textContent = number;
    var tdType = document.createElement('td');
    tdType.textContent = type;
    var tdAssetName = document.createElement('td');
    tdAssetName.textContent = assetName;
    var tdPrice = document.createElement('td');
    tdPrice.textContent = price;

    tr.appendChild(tdNumber);
    tr.appendChild(tdType);
    tr.appendChild(tdAssetName);
    tr.appendChild(tdPrice);

    tbody.append(tr);
}

$(document).on('change', '#start_date', function(e) {
    var assetID = $(this).data('assetid');
    var startD = $(this).val();
    var loc = $(this).data('location');
    selectedAssetsWithDates[assetID][loc].start = startD;
});

$(document).on('change', '#end_date', function(e) {
    var assetID = $(this).data('assetid');
    var endD = $(this).val();
    var loc = $(this).data('location');
    selectedAssetsWithDates[assetID][loc].end = endD;
});

$('.openSelectAssetsModal').on('click', function() {
    var lat = $(this).data('lat');
    var long = $(this).data('long');
    var location = $(this).data('location');
    var mec_id = $(this).data('mecid');
    $('#asset_body').empty();
    clearMarkers();
    if(allAssetItems.hasOwnProperty(location)) {
        var items = allAssetItems[location][mec_id];
        if(Object.size(items) < 1) {
            $('.no_assets').css('visibility', 'visible');
            // console.log('No assets');
        } else {
            $('.no_assets').css('visibility', 'hidden');
            for (var i in items) {
                var item_asset_id = items[i].asset_id;
                var item_asset_name = items[i].asset_name;
                var item_cost = items[i].cost;
                var item_lat = items[i].lat;
                var item_long = items[i].long;
                var item_mec_id = items[i].mec_id;
                var item_price = items[i].price;
                var item_type = items[i].type;
                var item_location = items[i].location;

                var item = {
                    asset_id: item_asset_id, asset_name: item_asset_name, cost: item_cost, price: item_price,
                    mec_id: item_mec_id, lat: item_lat, long: item_long, type: item_type, location: location
                };


                var tr = document.createElement('tr');
                tr.className = 'tr_' + item-item_asset_id + ' asset-item';

                var td_checkbox = document.createElement('td');
                td_checkbox.innerHTML = '<input type="checkbox" style="max-width: 40px;" class="select_asset_for_location_map asset'+item_asset_id+'" name="asset_checkbox[]" data-location="'+location.toLowerCase()+'" data-type="'+item_type.toLowerCase()+'" data-price="'+item_price+'" data-cost="'+item_cost+'" data-mecID="'+item_mec_id+'" data-assetName="'+item_asset_name+'" data-lat="'+item_lat+'" data-lng="'+item_long+'" id="'+item_asset_id+'" />';

                var td_asset_name = document.createElement('td');
                td_asset_name.innerHTML = '<small>'+item_asset_name+' <input type="hidden" name="assetItem[]" value="'+item_asset_id+'" id="assetItem'+item_asset_id+'" data-location="'+location.toLowerCase()+'" /></small>';

                var td_selling_price = document.createElement('td');
                td_selling_price.innerHTML = '<small>'+item_price+'</small>';

                tr.appendChild(td_checkbox);
                tr.appendChild(td_asset_name);
                tr.appendChild(td_selling_price);

                if(item_cost != "no") {
                    var td_cost_price = document.createElement('td');
                    td_cost_price.innerHTML = '<small>'+item_cost+'</small>';
                    tr.appendChild(td_cost_price);
                }

                $('#asset_body').append(tr);
            }
        }
    } else {
        $('.no_assets').css('visibility', 'visible');
        // console.log('No assets');
    }
});

$(document).on('change', '.select_asset_for_location_map', function(){
    var checked = $(this).prop('checked');
    var lat = $(this).data('lat');
    var long = $(this).data('lng');
    var mec_id = $(this).data('mecid');
    var asset_id = $(this).data('assetid');
    var price = $(this).data('price');
    var assetName = $(this).data('assetname');
    var cost = $(this).data('cost');
    var loc = $(this).data('location');

    var pos = new google.maps.LatLng(lat, long);
    //// // console.log(pos);

    var opt = {
        center: pos,
        zoom: 10
    };
    var map = new google.maps.Map(document.getElementById('map'), opt);

    if($(this).prop('checked')) {
        map.setCenter(pos);
        addMarker(pos, map, assetName, lat, long, mec_id, cost, price, assetName, asset_id, loc);
    } else {
        removeMarker(lat, long, map, assetName, mec_id, cost, price, assetName, asset_id, loc);
    }
});

function addMarker(pos, map, assetName, lat, long, mec_id, cost, price, assetName, assetid, loc) {
    var marker = new google.maps.Marker({
        position: pos,
        //map: map,
        title: assetName
    });
    var obj = {
        assetid: assetid,
        lat: lat,
        lng: long,
        mecid: mec_id,
        price: price,
        assetName: assetName,
        cost: cost
    };
    allMarkers.push(obj);
    if(assetid) {

        if(!selectedAssetsWithDates.hasOwnProperty(assetID)) {
            selectedAssetsWithDates[assetID] = {};
        }

        if(!selectedAssetsWithDates[assetID].hasOwnProperty(loc)) {
            selectedAssetsWithDates[assetID][loc] = {};
        }

        selectedAssetsWithDates[assetid][loc] = {
            start: startDate,
            end: endDate,
            lat: lat,
            lng: long,
            mecid: mec_id,
            cost: cost,
            price: price,
            assetName: assetName
        };
    }

    loadMarkers(map);
}

function setAllMap(map) {
    //for (var i = 0; i < allMarkers.length; i++) {
    //    //allMarkers[i].setMap(map);
    //    var obj = {
    //        lat: allMarkers[i].lat,
    //        lng: allMarkers[i].lng,
    //        mecid: allMarkers[i].mec_id,
    //        price: allMarkers[i].price,
    //        assetName: allMarkers[i].assetName,
    //        cost: allMarkers[i].cost
    //    };
    //    var index = allMarkers.indexOf(obj);
    //    allMarkers.splice(index, 1);
    //}
    removeAllMarkers();
    loadMarkers(defaultMap);

}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setAllMap(null);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
    clearMarkers();
    allMarkers = [];
}

function loadMarkers(map) {
    if(defaultMap == false) {
        //google.maps.event.trigger(map, 'resize');
        defaultMap = map;
    }
    for(var i in allMarkers) {
        var currentMarker = allMarkers[i];
        //// // console.log(currentMarker);
        (function(){
            var lat = currentMarker['lat'];
            var long = currentMarker['lng'];
            var pos = new google.maps.LatLng(lat, long);
            var marker = new google.maps.Marker({
                position: pos,
                map: map
            });
            marker.setMap(map);
            //// // console.log(marker);
        })(currentMarker);
    }
    //// // console.log(allMarkers);
}

function removeAllMarkers() {
    for(var marker in allMarkers) {
        var obj = {
            assetid: allMarkers[marker].assetid,
            lat: allMarkers[marker].lat,
            lng: allMarkers[marker].lng,
            mecid: allMarkers[marker].mec_id,
            price: allMarkers[marker].price,
            assetName: allMarkers[marker].assetName,
            cost: allMarkers[marker].cost
        };
        //delete allMarkers[obj];
        var index = allMarkers.indexOf(obj);
        allMarkers.splice(index, 1);

        var obj2 = {
            start: startDate,
            end: endDate
        };
        if(typeof allMarkers[marker].asset_id != 'undefined') {
            delete selectedAssetsWithDates[allMarkers[marker].assetid];
        }
    }
}

function insertCommas(s) {
    // get stuff before the dot
    var d = s.indexOf('.');
    var s2 = d === -1 ? s : s.slice(0, d);
    // insert commas every 3 digits from the right
    for (var i = s2.length - 3; i > 0; i -= 3)
        s2 = s2.slice(0, i) + ',' + s2.slice(i);
    // append fractional part
    if (d !== -1)
        s2 += s.slice(d);
    return s2;
}

function removeMarker(lat, long, map, assetName, mec_id, cost, price, assetName, asset_id, loc) {

    var obj = {
        assetid: asset_id,
        lat: lat,
        lng: long,
        mecid: mec_id,
        price: price,
        assetName: assetName,
        cost: cost
    };
    //delete allMarkers[obj];
    var index = allMarkers.indexOf(obj);
    allMarkers.splice(index, 1);

    loadMarkers(map);
    var obj2 = {
        start: startDate,
        end: endDate
    };

    delete selectedAssetsWithDates[asset_id][loc];
}

$('#closeAssetsModalWindow').on('click', function(){
    var opt = {
        zoom: 10
    };
    var map = new google.maps.Map(document.getElementById('map'), opt);
    for(var i in allMarkers) {
        var marker = allMarkers[i];
        removeAllMarkers();
    }
});