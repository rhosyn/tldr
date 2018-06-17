const catButton = document.querySelectorAll(".btn-sm");
const happyButton = document.getElementById("happy-button");
const carousel = document.getElementById("carousel");

happyButton.addEventListener('click', function () {
  happyButton.classList.toggle("happy");
  happyButton.classList.add("i-am-selected");
  carousel.innerHTML = "";
  if (happyButton.classList.contains("happy")) {
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

      // let hide_article = document.createElement("div");
      // hide_article.className = 'hideRight article';
      // hide_article.id = happy.id;
      // hide_article.dataset.title_sentiment = happy.title_polarity_sentiment;
      // hide_article.dataset.body_sentiment = happy.body_polarity_sentiment;
      // let title_p = document.createElement("p");
      // title_p.innerHTML = happy.title;
      // title_p.className = 'headline';
      // hide_article.appendChild(title_p);
      // let card_image = document.createElement("div");
      // card_image.className = 'card-image';
      // card_image.style.backgroundImage = "url(" + happy.img_url + ")";
      // hide_article.appendChild(card_image);
      // carousel.appendChild(hide_article);
    })
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
    // visArticles.forEach(function(v) {
    //   console.log(v.children[0]);
    //   // v.children[0].classList.remove();
    //   // v.children[0].classList.add("date");
    //   // v.children[1].classList.remove();
    //   // v.children[1].classList.add("headline");
    //   // v.children[2].classList.remove();
    //   // v.children[2].classList.add("card-image");
    // })
    findClick();
})

catButton.forEach(function (btn) {
  btn.addEventListener('click', function() {
    carousel.innerHTML = "";
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
    // visArticles.forEach(function(v) {
    //   console.log(v.children[0]);
    //   // v.children[0].classList.remove();
    //   // v.children[0].classList.add("date");
    //   // v.children[1].classList.remove();
    //   // v.children[1].classList.add("headline");
    //   // v.children[2].classList.remove();
    //   // v.children[2].classList.add("card-image");
    // })
    findClick();
  });
})



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

    $(prev).removeClass().addClass("prev");
    $(next).removeClass().addClass("next");
    document.querySelector(".selected p").classList.remove("prev");
    document.querySelector(".selected div").classList.remove("selected");

    $(nextSecond).removeClass().addClass("nextRightSecond");
    // $(prevSecond).removeClass().addClass("prevLeftSecond");

    $(nextSecond).nextAll().removeClass().addClass('hideRight');
    $(prevSecond).prevAll().removeClass().addClass('hideLeft');

    $(nextSecond).nextAll().removeClass().addClass('hideRight');
    $(prevSecond).prevAll().removeClass().addClass('hideLeft');

    let car = document.getElementById("carousel");
    let btnSelected = document.querySelector(".btn.i-am-selected");
    let catBtn = document.querySelector(".btn.btn-sm.i-am-selected");
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
}


function findClick() {
  $('#carousel div').click(function() {
    console.log(this);
    moveToSelected($(this));
  });

  $('#prev').click(function() {
    moveToSelected('prev');
  });

  $('#next').click(function() {
    moveToSelected('next');
  });
}


export { moveToSelected };
