// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require wice_grid.js
//= require jquery.ui.datepicker
//= require ckeditor/init
//= require_tree .

var ready = function() {
  function toggleNavbarMethod() {
    $('.nav .dropdown').on('mouseover', function(){
        $('.dropdown-toggle').css("background-color", "#db645c");
      }).on('mouseout', function(){
        $('.dropdown-toggle', this).css("background-color", "");
    });
  }
  toggleNavbarMethod();
  function changeCommentSubmitButton() {
    var username = $("#comment_username").val();
    var email = $("#comment_email").val();
    var content = $("#comment_content").val();
    if(username.length > 0 && email.length > 0 && content.length > 0) {
      $('#comment_submit').attr("disabled", false);
      $('#comment_submit').addClass("active");
    } else {
      $('#comment_submit').attr("disabled", true);
      $('#comment_submit').removeClass("active");
    }
  }
  function commentValidate() {
    $("#comment_username").keyup(function(e) {
      changeCommentSubmitButton();
    });
    $("#comment_email").keyup(function(e) {
      changeCommentSubmitButton();
    });
    $("#comment_content").keyup(function(e) {
      changeCommentSubmitButton();
    });
  }
  commentValidate();
};
$(document).ready(ready);
$(document).on('page:load', ready);

