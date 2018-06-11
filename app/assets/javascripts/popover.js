// $('.button').on('click', function(e) {
//   e.preventDefault();
//   $('.overlay').toggleClass('active');
//   $('.content').toggleClass('smaller');
//   $('.trial_content').toggleClass('active');
// });

$('.sample_start_button').on('click', function(e) {
  $('.overlay').toggleClass('active');
  $('.content').toggleClass('smaller');
  // $('.trial_content').toggleClass('active');
  generate_snippets(article_snippets[0]);
  attach_target_listeners();

});

$('.overlaybox').on('click', function(e) {
  $('.overlay').toggleClass('active');
  $('.content').toggleClass('smaller');
  // $('.trial_content').toggleClass('active');
  destroy_snippets();
});

// pointer event: none
