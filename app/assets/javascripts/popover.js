
$('.click-me').on('click', function(e) {
  console.log('hello');
  $('.overlay').toggleClass('active');
  $('#carousel').toggleClass('smaller');
  generate_snippets(article_snippets[0]);
  attach_target_listeners();

});

$('.overlaybox').on('click', function(e) {
  $('.overlay').toggleClass('active');
  $('#carousel').toggleClass('smaller');
  destroy_snippets();
});
