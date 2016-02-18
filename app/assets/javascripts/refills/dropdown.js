$(document).ready(function(){
  $(".dropdown-button").click(function() {
    $(".dropdown-menu").toggleClass("show-menu");
    $(".dropdown-menu > li").click(function(){
      $(".dropdown-menu").removeClass("show-menu");
    });
    $(".dropdown-menu.dropdown-select > li").click(function() {
      $(".dropdown-button").html($(this).html());
      var vid = $(this).text().replace(/ /g,'');
      var videl = $('#bgvid');
      videl.children("source").first().attr("src", videos[vid]+".mp4");
      // videl.children("source").last().attr("src", videos[vid]+".webm");
      videl.get(0).load();
      toggleVideoVolume(true);
    });
  });

});
