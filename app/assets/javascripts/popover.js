
$('#carousel').on('click', function(e) {
  // e.cancelBubble=true;
  console.log('hello');
  $('.overlay').toggleClass('active');
  $('#carousel').toggleClass('smaller');
  // $('.trial_content').toggleClass('active');
  generate_snippets(article_snippets[0]);
  attach_target_listeners();

});

$('.overlaybox').on('click', function(e) {
  $('.overlay').toggleClass('active');
  $('#carousel').toggleClass('smaller');
  // $('.trial_content').toggleClass('active');
  destroy_snippets();
});

// pointer event: none
