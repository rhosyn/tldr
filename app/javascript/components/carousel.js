const catButton = document.querySelectorAll(".btn-sm");
const happyButton = document.getElementById("happy-button");
const carousel = document.getElementById("carousel");
const landingMenu = document.getElementById("menu");
const footerLinks = document.querySelector(".footer-links");
const overlay = document.querySelector(".overlay");
const catTitle = document.querySelector(".carousel-cat-title");
const clickMe = document.querySelector(".click_me_container");
const box = document.querySelector(".box");

happyButton.addEventListener('click', function () {
  happyButton.classList.toggle("happy");
  if (document.querySelector(".footer-category") != null) {
    document.querySelector(".footer-category").remove();
  }
  overlay.classList.remove("hidden");
  happyButton.classList.add("i-am-selected");
  landingMenu.style.display = 'none';
  footerLinks.style.display = 'flex';
  carousel.innerHTML = "";
  if (happyButton.classList.contains("happy")) {
    box.style.display = 'block';

    // let footerDiv = document.createElement("div");
    // footerDiv.className = "footer-category";
    // let footerBreak_one = document.createElement("div");
    // let footerBreak_two = document.createElement("div");
    // footerBreak_one.className = "footer-break-one";
    // footerBreak_two.className = "footer-break-two";
    // let smiley_face = document.createElement("i");
    // smiley_face.className = "far fa-smile";
    // footerDiv.appendChild(footerBreak_one);
    // footerDiv.appendChild(smiley_face);
    // footerDiv.appendChild(footerBreak_two);
    // clickMe.appendChild(footerDiv);


    happy_array.forEach(function (happy) {
      let hide_article = document.createElement("div");
      hide_article.className = 'hideRight article';
      hide_article.id = happy.id;
      hide_article.dataset.title_sentiment = happy.title_sentiment;
      hide_article.dataset.body_sentiment = happy.body_sentiment;
      hide_article.dataset.category = happy.category;
      let date_div = document.createElement("div");
      date_div.className = 'date';
      let day_span = document.createElement("span");
      day_span.className = 'day';
      day_span.innerHTML = happy.day;
      let month_span = document.createElement("span");
      month_span.className = 'month';
      month_span.innerHTML = happy.month;
      let year_span = document.createElement("span");
      year_span.className = 'year';
      year_span.innerHTML = happy.year;
      date_div.appendChild(day_span);
      date_div.appendChild(month_span);
      date_div.appendChild(year_span);
      let title_p = document.createElement("p");
      title_p.innerHTML = happy.title;
      title_p.className = 'headline';
      hide_article.appendChild(date_div);
      hide_article.appendChild(title_p);
      let card_image = document.createElement("div");
      card_image.className = 'card-image';
      card_image.style.backgroundImage = "url(" + happy.image_url + ")";
      hide_article.appendChild(card_image);
      carousel.appendChild(hide_article);
    })
  } else {
    box.style.display = 'none';
    landingMenu.style.display = 'block';
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
      a.classList.remove("hidden");
      a.classList.add("visible");
      a.classList.add("article");
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
  handleGesture();
})

catButton.forEach(function (btn) {
  btn.addEventListener('click', function() {
    landingMenu.style.display = 'none';
    footerLinks.style.display = 'flex';
    carousel.innerHTML = "";
    overlay.classList.remove("hidden");
    article_array.forEach(function (a) {
      if (happyButton.classList.contains("happy")) {
        if ((a.category == btn.dataset.category) && (a.title_sentiment == "positive" ) && (a.body_sentiment == "positive" )) {
          let hide_article = document.createElement("div");
          hide_article.className = 'hideRight article';
          hide_article.id = a.id;
          hide_article.dataset.title_sentiment = a.title_sentiment;
          hide_article.dataset.body_sentiment = a.body_sentiment;
          hide_article.dataset.category = a.category;
          let date_div = document.createElement("div");
          date_div.className = 'date';
          let day_span = document.createElement("span");
          day_span.className = 'day';
          day_span.innerHTML = a.day;
          let month_span = document.createElement("span");
          month_span.className = 'month';
          month_span.innerHTML = a.month;
          let year_span = document.createElement("span");
          year_span.className = 'year';
          year_span.innerHTML = a.year;
          date_div.appendChild(day_span);
          date_div.appendChild(month_span);
          date_div.appendChild(year_span);
          let title_p = document.createElement("p");
          title_p.innerHTML = a.title;
          title_p.className = 'headline';
          hide_article.appendChild(date_div);
          hide_article.appendChild(title_p);
          let card_image = document.createElement("div");
          card_image.className = 'card-image';
          card_image.style.backgroundImage = "url(" + a.image_url + ")";
          hide_article.appendChild(card_image);
          carousel.appendChild(hide_article);
        }
      } else {
          if (a.category == btn.dataset.category) {

            let hide_article = document.createElement("div");
            hide_article.className = 'hideRight article';
            hide_article.id = a.id;
            hide_article.dataset.sentiment = a.sentiment;
            hide_article.dataset.category = a.category;
            let date_div = document.createElement("div");
            date_div.className = 'date';
            let day_span = document.createElement("span");
            day_span.className = 'day';
            day_span.innerHTML = a.day;
            let month_span = document.createElement("span");
            month_span.className = 'month';
            month_span.innerHTML = a.month;
            let year_span = document.createElement("span");
            year_span.className = 'year';
            year_span.innerHTML = a.year;
            date_div.appendChild(day_span);
            date_div.appendChild(month_span);
            date_div.appendChild(year_span);
            let title_p = document.createElement("p");
            title_p.innerHTML = a.title;
            title_p.className = 'headline';
            hide_article.appendChild(date_div);
            hide_article.appendChild(title_p);
            let card_image = document.createElement("div");
            card_image.className = 'card-image';
            card_image.style.backgroundImage = "url(" + a.image_url + ")";
            hide_article.appendChild(card_image);
            carousel.appendChild(hide_article);
          }
      }
    })
    let catTitle = document.querySelector(".carousel-cat-title");
    let clickMe = document.querySelector(".click_me_container");
    if (document.querySelector(".carousel-cat-title") != null) {
      catTitle.remove();
    }
    if (document.querySelector(".footer-category") != null) {
      document.querySelector(".footer-category").remove();
    }
    let footerDiv = document.createElement("div");
    footerDiv.className = "footer-category";
    let footerBreak_one = document.createElement("div");
    let footerBreak_two = document.createElement("div");
    footerBreak_one.className = "footer-break-one";
    footerBreak_two.className = "footer-break-two";
    let category_title = document.createElement("h1");
    category_title.className = "carousel-cat-title";
    category_title.innerText = btn.dataset.category;
    footerDiv.appendChild(footerBreak_one);
    footerDiv.appendChild(category_title);
    footerDiv.appendChild(footerBreak_two);
    clickMe.appendChild(footerDiv);

    catButton.forEach(function (cb) {
      cb.classList.remove("i-am-selected");
    })
    btn.classList.add("i-am-selected")
      if (carousel.children[0].classList.contains("article")) {

      } else {
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
      a.classList.add("hidden");
      }
    });
    let visArticles = document.querySelectorAll(".visible");
    let selected = visArticles[0];
    let next = visArticles[1];
    selected.classList.add("selected");
    ahoy.track('article_view', {article_id: parseInt($(selected).attr('id'),10)});
    next.classList.add("next");
    if (visArticles.length > 2) {
      let nextRightSecond = visArticles[2];
      nextRightSecond.classList.add("nextRightSecond");
    }
    visArticles.forEach(function(artic, i) {
      if (i > 2) {
        artic.classList.add("hideRight");
      }
    });
    handleGesture();
  });
})

let touchstartX = 0;
let touchstartY = 0;
let touchendX = 0;
let touchendY = 0;

const gestureZone = document.getElementById('gestureZone');

gestureZone.addEventListener('touchstart', function(event) {
    touchstartX = event.changedTouches[0].screenX;
    touchstartY = event.changedTouches[0].screenY;
}, false);

gestureZone.addEventListener('touchend', function(event) {
    touchendX = event.changedTouches[0].screenX;
    touchendY = event.changedTouches[0].screenY;
    handleGesture();
}, false);

function handleGesture() {
    if (touchendX < touchstartX) {
      console.log('swipe left');
      document.querySelector(".selected").children[0].style.display = 'none';
      document.querySelector(".selected").children[1].style.display = 'none';
      document.querySelector(".next").children[0].style.display = 'block';
      document.querySelector(".next").children[1].style.display = 'block';
      moveToSelected('next');
    }
    if (touchendX > touchstartX) {
      console.log('swipe right');
      document.querySelector(".selected").children[0].style.display = 'none';
      document.querySelector(".selected").children[1].style.display = 'none';
      document.querySelector(".prev").children[0].style.display = 'block';
      document.querySelector(".prev").children[1].style.display = 'block';
      moveToSelected('prev');
    }
}

function moveToSelected(element) {

  if (element == "next") {
    var selected = $(".selected").next();
  } else if (element == "prev") {
    var selected = $(".selected").prev();
  } else {
    var selected = element;
  }

  var next = $(selected).next();
  var prev = $(selected).prev();
  var prevSecond = $(prev).prev();
  var nextSecond = $(next).next();


    $(selected).removeClass().addClass("selected");

    ahoy.track('article_view', {article_id: parseInt($(selected).attr('id'),10)});

    $(prev).removeClass().addClass("prev");
    $(next).removeClass().addClass("next");
    document.querySelector(".selected p").classList.remove("prev");
    // document.querySelector(".selected div").classList.remove("selected");

    $(nextSecond).removeClass().addClass("nextRightSecond");
    // $(prevSecond).removeClass().addClass("prevLeftSecond");

    $(nextSecond).nextAll().removeClass().addClass('hideRight');
    $(prevSecond).prevAll().removeClass().addClass('hideLeft');

    $(nextSecond).nextAll().removeClass().addClass('hideRight');
    $(prevSecond).prevAll().removeClass().addClass('hideLeft');

    let car = document.getElementById("carousel");
    let btnSelected = document.querySelector(".btn.i-am-selected");
    let catBtn = document.querySelector(".btn.i-am-selected");
    Array.from(car.children).forEach(function (ch) {
      if (btnSelected.classList.contains("happy")) {
        ch.classList.remove();
        ch.classList.add("visible");
        ch.classList.add("article");
        ch.children[0].classList.remove();
        ch.children[0].classList.add("date");
        ch.children[1].classList.remove();
        ch.children[1].classList.add("headline");
        ch.children[2].classList.remove();
        ch.children[2].classList.add("card-image");
      } else if (ch.dataset.category == catBtn.dataset.category) {
        ch.classList.remove();
        ch.classList.add("visible");
        ch.classList.add("article");
        ch.children[0].classList.remove();
        ch.children[0].classList.add("date");
        ch.children[1].classList.remove();
        ch.children[1].classList.add("headline");
        ch.children[2].classList.remove();
        ch.children[2].classList.add("card-image");
      } else {
        ch.classList.add("hidden")
        ch.classList.remove("visible");
      }
    });
    let img = document.querySelectorAll(".card-image");
    img.forEach(function (i) {i.classList.remove("selected")});
    document.querySelector(".selected").classList.remove('hidden');
}



export { moveToSelected };
