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


$(function() {
  $(".tasklist").sortable({

  });

  // $(".draggable").draggable({
  //   connectToSortable: "#tasklist",
  //   helper: "clone",
  //   revert: "invalid"
  // });

  $(".draggable").disableSelection();

  $('.sortable').sortable().bind('sortupdate', function(e, ui) {
      /*

      This event is triggered when the user stopped sorting and the DOM position has changed.

      ui.item contains the current dragged element.
      ui.index contains the new index of the dragged element (considering only list items)
      ui.oldindex contains the old index of the dragged element (considering only list items)
      ui.elementIndex contains the new index of the dragged element (considering all items within sortable)
      ui.oldElementIndex contains the old index of the dragged element (considering all items within sortable)
      ui.startparent contains the element that the dragged item comes from
      ui.endparent contains the element that the dragged item was added to (new parent)

      */
  });
});

