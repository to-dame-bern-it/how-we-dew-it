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
//= require refills/dropdown

$(function() {
  ready();
});

$(document).ready(function() {
  $(".hideTasks").children("button").on("click", function() { toggleTaskListVisibility(); });
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

function toggleVideoVolume(off) {
  vid = $('#bgvid');
  btn = $(".extraMotivation").children("button");
  if(vid.prop('muted') == false || off == true){
    vid.prop('muted', true)
    btn.text("Extra Motivation Disabled");
    btn.addClass('unmotivated');
    btn.removeClass('motivated');
  } else {
    vid.prop('muted', false)
    btn.text("Extra Motivation Enabled");
    btn.addClass('motivated');
    btn.removeClass('unmotivated');
  }
}

function toggleTaskListVisibility() {
  var btn = $(event.target);

  if(btn.text() == "Hide Tasks") {
    btn.text("Show Tasks");
    $("main").toggle();
    btn.addClass('motivated');
    btn.removeClass('unmotivated');
  } else {
    btn.text("Hide Tasks");
    $("main").toggle();
    btn.addClass('unmotivated');
    btn.removeClass('motivated');
  }
}

function newTaskItem() {

}

var videos = {
  JustDoIt: "ShiaLabeouf",
  LesBrown: "LesBrown",
  JimCarrey: "JimCarrey",
  ProveThemWrong: "ProveThemWrong",
  KidPresident: "KidPresident",
  RockyBalboa: "RockyBalboa",
  MattFoley: "MattFoley"
}


