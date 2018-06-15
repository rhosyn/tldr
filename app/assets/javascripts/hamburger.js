var Hamburger = {

  el: {
    ham: $('.hamburger'),
    hamburgerTop: $('.hamburger-top'),
    hamburgerMiddle: $('.hamburger-middle'),
    hamburgerBottom: $('.hamburger-bottom')
  },

  init: function() {
    Hamburger.bindUIactions();
  },

  bindUIactions: function() {
    Hamburger.el.ham
        .on(
          'click',
        function(event) {
        Hamburger.activateHamburger(event);
        event.preventDefault();
      }
    );
  },

  activateHamburger: function() {
    Hamburger.el.hamburgerTop.toggleClass('hamburger-top-click');
    Hamburger.el.hamburgerMiddle.toggleClass('hamburger-middle-click');
    Hamburger.el.hamburgerBottom.toggleClass('hamburger-bottom-click');
  }
};

Hamburger.init();
