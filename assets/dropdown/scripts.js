$(document).ready(function(e) {
	var count_clicks = 0;
	$("#new_menu li a").click(function(){
		console.log('menu clicked' + count_clicks++);
		drop_down = $(this).parent().find(".drop_down");

		if(drop_down.hasClass("active")){
			drop_down.removeClass("active");
		}else{
			$(".drop_down.active").removeClass("active");
			drop_down.addClass("active")
		}
		
		old_drop_down = drop_down;
	});
});