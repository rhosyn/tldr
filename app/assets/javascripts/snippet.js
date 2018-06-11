const start_button = document.getElementById("sample_start_button");
start_button.addEventListener("click", (event) => {
  // console.log(event.currentTarget);
  // console.log(article_snippets[0]);
  generate_snippets(article_snippets[0]);
  attach_target_listeners();
});

function attach_target_listeners() {
  document.querySelectorAll('.next_target').forEach((element) => {
    element.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      next_snippet();
    })
  })
}

function generate_snippets(article_snippets) {
  const size = article_snippets.length;
  let count = 0;
  article_snippets.forEach((snippet) => {
    count += 1;

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

    // debugger
    document.body.append(snippet_container);
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
  document.querySelectorAll('.snippet_container').forEach((snippet) => {
    console.log(snippet);
    snippet.remove();
  })
}
