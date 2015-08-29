/**
 * Blessed
 */
var alreadyInMediaTypes;
$(function() {

    alreadyInMediaTypes = [];

    // assign all dates and dropdowns here
    $('.select2dropdown').select2();
    $('#mec_id').select2();
    //$('#from_date').datepicker({dateFormat: 'yy-mm-dd'});
    //$('#to_date').datepicker({dateFormat: 'yy-mm-dd'});
    //$('#respond_date').datepicker({dateFormat: 'yy-mm-dd'});
    //$('.input-errors').hide();

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
                    console.log(data);
                }
            });
        }
    });
});