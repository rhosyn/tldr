// const catButton = document.querySelectorAll(".btn-sm");
// const happyButton = document.getElementById("happy-button");
// const carousel = document.getElementById("carousel");

// happyButton.addEventListener('click', function () {
//   happyButton.classList.toggle("happy");
// })



// catButton.forEach(function (btn) {
//   btn.addEventListener('click', function() {
//     carousel.innerHTML = "";
//     article_array.forEach(function (a) {
//       if (a.category == btn.dataset.category) {
//         let hide_article = document.createElement("div");
//         hide_article.className = 'hideRight article';
//         hide_article.id = a.id;
//         hide_article.dataset.sentiment = a.sentiment;
//         hide_article.dataset.category = a.category;
//         let title_p = document.createElement("p");
//         title_p.innerHTML = a.title;
//         title_p.className = 'headline';
//         hide_article.appendChild(title_p);
//         let card_image = document.createElement("div");
//         card_image.className = 'card-image';
//         card_image.style.backgroundImage = "url(" + a.image_url + ")";
//         hide_article.appendChild(card_image);
//         carousel.appendChild(hide_article);
//       }
//     })
//     let next = document.querySelector(".next")
//       .addEventListener('click', function () {moveToSelected('next');});
//     catButton.forEach(function (cb) {
//       cb.classList.remove("selected");
//     })
//     btn.classList.add("selected")
//       if (carousel.children[0].classList.contains("article")) {

//       } else {
//         Array.from(carousel.children).forEach(function (child) {
//           child.classList.add("article");
//         });
//       }

//     let articles = document.querySelectorAll(".article");
//     articles.forEach(function (a) {
//       a.classList.remove("visible");
//       a.classList.remove("selected");
//       a.classList.remove("next");
//       a.classList.remove("nextRightSecond");
//       a.classList.remove("prev");
//       a.classList.remove("prevLeftSecond");
//       a.classList.remove("hideRight");
//       a.classList.remove("hideLeft");
//       if (happyButton.classList.contains("happy")) {
//         if ((a.dataset.category == btn.dataset.category) && (a.dataset.sentiment == "positive" )) {
//           a.classList.remove("hidden");
//           a.classList.add("visible");
//         } else {
//           a.classList.add("hidden");
//         }
//       } else {
//         if (a.dataset.category == btn.dataset.category) {
//         a.classList.remove("hidden");
//         a.classList.add("visible");
//         } else {
//         a.classList.add("hidden");
//         }
//       }
//     });
//     let visArticles = document.querySelectorAll(".visible");
//     let selected = visArticles[0];
//     let next = visArticles[1];
//     let nextRightSecond = visArticles[2];
//     selected.classList.add("selected");
//     next.classList.add("next");
//     nextRightSecond.classList.add("nextRightSecond");
//     visArticles.forEach(function(artic, i) {
//       if (i > 2) {
//         artic.classList.add("hideRight");
//       }
//     });
//   });
// })


// function findCategories () {
//   console.log('hello');
// }



