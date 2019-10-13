$(document).on('turbolinks:load', function() { 
    $(function(){
      $('.user_edit').hover(function(){
          $( ".dropdown_menu_user_edit").slideDown('fast');
      }, function(){
          $(".dropdown_menu_user_edit").slideUp('fast');
      });
    });
  });
  