$(function() {
  new Dragdealer('.flat-slider');

  var globalCounter = 0;
  $('.anibutton').click(function(e) {
    e.preventDefault();
    $('.global-counter').text(++globalCounter);
  });
});