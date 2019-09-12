
/* global $ */
$(document).on('turbolinks:load', function() { 
	
	$('.sign_in').click(function(){
	    $('.modal_wrapper_new').addClass('active');
	});
	
	$('.close_modal_new').click(function() {
	    $('.modal_wrapper_new').removeClass('active');
	});
	
	$('.log_in').click(function(){
	    $('.modal_wrapper_session').addClass('active');
	});
	
	$('.close_modal_session').click(function(){
	    $('.modal_wrapper_session').removeClass('active');
	});
});