/* global $ */
$(document).on('turbolinks:load', function() { 
	$(function(){
		if (window.location.href.match(/\/users\/\d+\/events/)!=null){
			setInterval(catchNewComment, 5000);
			setInterval(updateCommentArea, 6000)
		}
	});
	
	function catchNewComment(){
		let parentDOM = document.getElementById("comments_area");
		let commentTarget = parentDOM.getElementsByClassName("all_comment_each")[0];
		let id = commentTarget.getAttribute('data-id');
		let comment_id = Number(id);
		
		$.ajax({ 
			url: location.href, 
			type: 'GET',
			data: {last_comment_id: comment_id },
			dataType: 'script' 
		})
		.done(function(data){
		  console.log('new comment has been catched ')
		})
		.fail(function(){
		  console.log('検索に失敗しました') 
	    });
	}

	function updateCommentArea() {
        $.ajax({ 
			url: location.href, 
			type: 'GET',
			data: {update_comment_area: "update!" },
			dataType: 'script' 
		})
		.done(function(data){
		  console.log('updated comment area')
		})
		.fail(function(){
		  console.log('update was fail') 
	    });
	}
	
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