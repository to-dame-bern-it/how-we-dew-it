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
//= require jquery.datetimepicker.full.min


$(document).ready(function() {
  ready();
  $("#new-task-form").hide();
  $(".hideTasks").children("button").on("click", function() {
    toggleTaskListVisibility();
  });

  $(".task").on("click", function() {

    if(event.target != this) return;

    if($(this).hasClass("editing")){
      return false;
    }
    $(this).addClass("editing");
    var taskId = $(this).closest(".task").attr("data-id");
    $.ajax({
      type: "GET",
      url: '/tasks/'+taskId+'/edit'
    });
  });

  $('.completeTaskBtn').on("click", function() {
    completeTaskBtn();
  });


});

function completeTaskBtn() {
  var taskId = $(event.target).closest(".task").attr("data-id");
  $.ajax({
    type: "PATCH",
    url: '/tasks/'+taskId,
    data: { task: {status_id: "3"} }
  });
}

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



  // $('.color').colorPicker({
  //   animationSpeed: 150, // toggle animation speed
  //   GPU: true, // use transform: translate3d
  //   opacity: false,
  // });

  // $("#editClick" ).mouseup.mousedown(function() {
  //   $.ajax('#editClick')
  //     alert( "Just checking if this works." );
  // });

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

  if(btn.text() == "Hide Content") {
    btn.text("Show Content");
    $("main").toggle();
    btn.addClass('motivated');
    btn.removeClass('unmotivated');
  } else {
    btn.text("Hide Content");
    $("main").toggle();
    btn.addClass('unmotivated');
    btn.removeClass('motivated');
  }
}


var videos = {
  JustDoIt: "ShiaLaBeouf",
  LesBrown: "LesBrown",
  JimCarrey: "JimCarrey",
  ProveThemWrong: "ProveThemWrong",
  KidPresident: "KidPresident",
  RockyBalboa: "RockyBalboa",
  MattFoley: "MattFoley"
}




