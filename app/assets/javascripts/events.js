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


    /*いいね順と最近の投稿順の切り替え*/
	$('.comment_liked_ranks').click(function(){
	    $('#comments_area_liked_rank_ver').css('display','block');
	    $('#comments_area').css('display','none');
	    
	    $('.comment_recent').css('border-bottom','none');
	    $(this).css('border-bottom','solid 3px #4EAA40');
	});

	$('.comment_recent').click(function() {
	    $('#comments_area').css('display','block');
	    $('#comments_area_liked_rank_ver').css('display','none');
	    
	    $('.comment_liked_ranks').css('border-bottom','none');
	    $(this).css('border-bottom','solid 3px #4EAA40');
	});
});