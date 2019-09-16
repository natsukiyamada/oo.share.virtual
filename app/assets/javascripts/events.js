/* global $ */
$(document).on('turbolinks:load', function() { 
	
	$('.create_event_form').click(function(){
	    $('.modal_wrapper_make_event').addClass('active');
	});
	
	$('.close_modal_event').click(function() {
	    $('.modal_wrapper_make_event').removeClass('active');
	});


/*イベントの説明を編集するボタン用 */
	$('.event_comment_form_edit_btn').click(function(){
	    $('.event_edit_area_wrapper').css('display', 'block');
	});

	$('.close_modal_event_edit').click(function() {
	    $('.event_edit_area_wrapper').css('display', 'none');
	});	
});