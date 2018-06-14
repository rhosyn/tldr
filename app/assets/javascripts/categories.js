const catButton = document.querySelectorAll(".btn-sm");
const happyButton = document.getElementById("happy-button");

happyButton.addEventListener('click', function () {
  // console.log('hello');
  happyButton.classList.toggle("happy");
})

catButton.forEach(function (btn) {
  btn.addEventListener('click', function() {
    catButton.forEach(function (cb) {
      cb.classList.remove("selected");
    })
    btn.classList.add("selected")
    let carousel = document.getElementById("carousel");
      if (carousel.children[0].classList.contains("article")) {

      } else {
        let carousel = document.getElementById("carousel");
        Array.from(carousel.children).forEach(function (child) {
          child.classList.add("article");
        });
      }

    let articles = document.querySelectorAll(".article");
    articles.forEach(function (a) {
      a.classList.remove("visible");
      a.classList.remove("selected");
      a.classList.remove("next");
      a.classList.remove("nextRightSecond");
      a.classList.remove("prev");
      a.classList.remove("prevLeftSecond");
      a.classList.remove("hideRight");
      a.classList.remove("hideLeft");
      if (a.dataset.category == btn.dataset.category) {
        a.classList.remove("hidden");
        a.classList.add("visible");
      } else {
        a.classList.add("hidden")
      }
    });
    let visArticles = document.querySelectorAll(".visible");
    let selected = visArticles[0];
    let next = visArticles[1];
    let nextRightSecond = visArticles[2];
    selected.classList.add("selected");
    next.classList.add("next");
    nextRightSecond.classList.add("nextRightSecond");
    visArticles.forEach(function(artic, i) {
      if (i > 2) {
        artic.classList.add("hideRight");
      }
    });
  });
})



