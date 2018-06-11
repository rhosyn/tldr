$('.button, .overlay').on('click', function(e) {
  e.preventDefault();
  $('.overlay').toggleClass('active');
  $('.content').toggleClass('smaller');
});
