function history_listeners() {
  document.querySelectorAll('.history_article').forEach((element) => {
    // debugger
    element.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle('history_active');
      // document.querySelector('.history_container').classList.toggle('smaller');
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
  let quit_button = document.createElement("button");
  quit_button.setAttribute("type", "button");
  let quit_icon = document.createElement("i");
  quit_button.className = "fas fa-times-circle quit-button";
  quit_button.append(quit_icon);
  container.appendChild(quit_button);

  let imgHolder = document.createElement("div");
  imgHolder.className = "history_expanded_img_div";

  let img = document.createElement("div");
  img.className = "history_expanded_img";
  img.setAttribute("style", `background-image: url(${element.dataset.img_url});`)
  let title = document.createElement("p");
  title.className = "history-popup-header";
  title.innerHTML = element.dataset.title;

  imgHolder.appendChild(img);
  img.appendChild(title);
  container.appendChild(imgHolder);

  let snippet_container = document.createElement("div");
  snippet_container.classList = "history_expanded_snippet_container";
  const snippets = element.dataset.sentences.split('", "');
  snippets.forEach((s) => {
    let snippet = document.createElement("div");
    let s_text = document.createElement("p");
    s_text.innerHTML = s.replace('["','').replace('"]','');
    snippet.classList = "history_expanded_snippet";
    snippet.appendChild(s_text);
    snippet_container.appendChild(snippet);
  })

  container.appendChild(snippet_container);
  $( ".history_overlaycontainer" ).append(container);
  destroy_history_snippets();
}

$('document').ready(history_listeners())

function destroy_history_snippets() {
  let quit = document.querySelector(".quit-button");
  quit.addEventListener('click', (event) => {
    console.log('click quit');
    document.querySelector('.history_overlay').classList.toggle('active');
    document.querySelector('.history_expanded_container').remove();
    // document.querySelector('.history_container').classList.toggle('smaller');
  })
}








