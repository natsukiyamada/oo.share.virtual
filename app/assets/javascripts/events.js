/* global $ */
$(document).on('turbolinks:load', function() { 
	
	$('.create_event_form').click(function(){
	    $('.modal_wrapper_make_event').addClass('active');
	});
	
	$('.close_modal_event').click(function() {
	    $('.modal_wrapper_make_event').removeClass('active');
	});
});