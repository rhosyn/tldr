function history_listeners() {
  document.querySelectorAll('.history_article').forEach((element) => {
    // debugger
    element.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle('history_active');
      document.querySelector('.history_container').classList.toggle('smaller');
      // $('.overlay').toggleClass('active');
      document.querySelector('.history_overlay').classList.toggle('active');
      // document.querySelector('.history_expanded_container').classList.toggle('active');
      generate_history_expanded(event.currentTarget);
    })
  })
}

function history_overlay_listeners() {
  document.querySelector('.history_overlaybox').addEventListener("click", (event) => {
    console.log('hi');
    document.querySelector('.history_overlay').classList.toggle('active');
    document.querySelector('.history_container').classList.toggle('smaller');
    document.querySelector('.history_expanded_container').remove();
    document.querySelectorAll('.history_active').forEach((e) => {
      e.classList.toggle('.history_active');
    })
  })
}


function generate_history_expanded (element) {
  // console.log(snippets);
  let container = document.createElement("div");
  container.className = "history_expanded_container";

  let img = document.createElement("div");
  img.className = "history_expanded_img";
  img.setAttribute("style", `background-image: url(${element.dataset.img_url});`)
  let title = document.createElement("p");
  title.innerHTML = element.dataset.title;

  img.appendChild(title);
  container.appendChild(img);

  let snippet_container = document.createElement("div");
  snippet_container.classList = "history_expanded_snippet_container";
  const snippets = element.dataset.sentences.split('", "');
  snippets.forEach((s) => {
  let snippet = document.createElement("div");
    snippet.classList = "history_expanded_snippet";
    let s_text = document.createElement("p");
    s_text.innerHTML = s.replace('["','').replace('"]','');

    snippet.appendChild(s_text);
    snippet_container.appendChild(snippet);
  })

  container.appendChild(snippet_container);
  $( ".history_overlaycontainer" ).append(container);
}

$('document').ready(history_listeners())

