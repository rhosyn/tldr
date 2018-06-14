function attach_target_listeners() {
  document.querySelectorAll('.next_target').forEach((element) => {
    element.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      next_snippet();
    })
  })
}

function generate_snippets() {
  const active_card_id = parseInt(document.querySelector('.selected').id.replace('article-id-',''), 10);
  ahoy.track('article_click', {article_id: active_card_id});
  const article_snippets = snippet_array[active_card_id];
  console.log(article_snippets)
  const size = article_snippets.length;
  let count = 0;
  article_snippets.forEach((snippet) => {
    count += 1;
    snippet = snippet.trim();
    if (snippet.charAt(0) === '"') {snippet = snippet.substr(1, snippet.length-1)}
    snippet = snippet.trim();
    // set everything to hidden by default
    let snippet_container = document.createElement("div");
    snippet_container.className = 'snippet_container snippet_hidden';
    snippet_container.id = `snippet-${count}`;

    // If it's the first card, unhide it
    if (count == 1) {
     activate_snippet(snippet_container);
   }

    // Create and append children. Order doesn't matter
    let snippet_content = document.createElement("div");
    snippet_content.className = 'snippet_content';

    let content_p = document.createElement("p");
    content_p.innerHTML = snippet;
    snippet_content.appendChild(content_p);
    snippet_container.appendChild(snippet_content);

    let snippet_no = document.createElement("div");
    snippet_no.className = 'snippet_no';
    snippet_no.innerHTML = `${count} / ${size}`;
    snippet_container.appendChild(snippet_no);

    let target_right = document.createElement("div");
    target_right.className = 'next_target target_right';
    if (count != size) { snippet_container.appendChild(target_right)}

    let target_left = document.createElement("div");
    target_left.className = 'next_target target_left';
    if (count != 1) {snippet_container.appendChild(target_left)}

    $( ".overlaycontainer" ).append(snippet_container);

});
}

function activate_snippet(snippet){
  snippet.classList.toggle('snippet_hidden');
  snippet.classList.toggle('snippet_active');
}

function next_snippet() {
  current_snippet = document.querySelector(".snippet_active");
  activate_snippet(current_snippet);
  const next_id = `snippet-${parseInt(current_snippet.id.replace('snippet-',''), 10) + 1}`;
  const prev_id = `snippet-${parseInt(current_snippet.id.replace('snippet-',''), 10) - 1}`;
  if (event.target.classList.contains("target_right")) {
    activate_snippet(document.getElementById(next_id))
  }
  else if (event.target.classList.contains("target_left")){
    activate_snippet(document.getElementById(prev_id))
  }
}

function destroy_snippets() {
  const active_card_id = parseInt(document.querySelector('.selected').id.replace('article-id-',''), 10);
  current_snippet = parseInt(document.querySelector(".snippet_active").id.replace('snippet-',''), 10);
  ahoy.track('snippet_destroy', {article_id: active_card_id, snippet_no: current_snippet});
  document.querySelectorAll('.snippet_container').forEach((snippet) => {
    console.log(snippet);
    snippet.remove();
  })
}
