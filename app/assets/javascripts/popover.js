$('.button').on('click', function(e) {
  e.preventDefault();
  $('.overlay').toggleClass('active');
  $('.content').toggleClass('smaller');
  $('.trial_content').toggleClass('active');
});

$('.overlaybox').on('click', function(e) {
  $('.overlay').toggleClass('active');
  $('.content').toggleClass('smaller');
  $('.trial_content').toggleClass('active');
});

// pointer event: none
