// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require html.sortable.min
//= require_tree .
//= require tasks

$(function() {
  ready();
});

var ready, set_positions;
ready = function(){
  set_positions();
  $('.tasklist').sortable();
  $('.tasklist').sortable().bind('sortupdate', function(e, ui) {
    updated_order = []
    set_positions();
    $('.task').each(function(i){
      updated_order.push({ id: $(this).data("id"), position: i+1 });
    });
    $.ajax({
      type: "PUT",
      url: '/tasks/sort',
      data: { order: updated_order }
    });
  });
  set_positions();
}

set_positions = function(){
  $('.task').each(function(i){
    $(this).attr("data-pos",i+1);
  });
}

function toggleVideoVolume() {
  vid = $('#bgvid');
  btn = $(".videoVolumeBtn").children("button");
  if(vid.prop('muted') == true){
    vid.prop('muted', false)
    btn.text("Motivation Enabled");
    btn.addClass('motivated');
    btn.removeClass('unmotivated');
  } else {
    vid.prop('muted', true)
    btn.text("Motivation Disabled");
    btn.addClass('unmotivated');
    btn.removeClass('motivated');
  }
}

// var positionMath = parseInt($("li.flex-box.flex-box").prev().attr("data-pos"))+parseInt($("li.flex-box.flex-box").next().attr("data-pos"));
// positionMath / 2
function newTaskItem() {

}
