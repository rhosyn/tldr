
$('.click-me').on('click', function(e) {
  // console.log('hello');
  $('.overlay').toggleClass('active');
  $('#carousel').toggleClass('smaller');
  $('.click-me').toggleClass('active');
  generate_snippets();
  attach_target_listeners();

});

$('.overlaybox').on('click', function(e) {
  $('.overlay').toggleClass('active');
  $('#carousel').toggleClass('smaller');
  $('.click-me').toggleClass('active');
  destroy_snippets();
});
