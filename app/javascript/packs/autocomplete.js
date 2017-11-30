// GOOGLE_API_SERVER_KEY

// https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=AIzaSyARQs4JmuMEWqPwkejlRf5Ir9SAwRR5mgM
// TODO: Autocomplete the input with AJAX calls.
const input = document.querySelector('#collection_item_title');

const drawResponseList = (data) => {
  console.log(data)
  const bounding = input.getBoundingClientRect();
  const results = document.querySelector('#results');
  results.style.top = bounding.bottom + "px";
  results.style.width = bounding.width + "px";
  results.innerHTML = "";
  let result_id = 0;
  data.items.slice(0, 5).forEach((item) => {
    const ici = item;
    console.log(item)
    results.insertAdjacentHTML('beforeend', `<div class="pac-container" id="result${result_id}">Title : ${item.volumeInfo.title} - Author(s) : ${item.volumeInfo.authors.join(" - ")} <img src="${item.volumeInfo.imageLinks.smallThumbnail}" style="width: 50px; height: 50px"> </div>`);
    document.querySelector(`#result${result_id}`).addEventListener('click', (event) => {
      results.innerHTML = "";
      input.value = `Title : ${item.volumeInfo.title} - Author(s) : ${item.volumeInfo.authors.join(" - ")}`
      document.querySelector('#collection_item_synopsis').value = item.searchInfo.textSnippet;
      document.querySelector('#collection_item_author').value = item.volumeInfo.authors.join(" - ");
      document.querySelector('#collection_item_photo').value = item.volumeInfo.imageLinks.smallThumbnail;
      document.querySelector('#collection_item_genre').value = item.categories[0];
    });
    result_id += 1;
  });
};

const autocomplete = (e) => {
  fetch(`https://www.googleapis.com/books/v1/volumes?q=${event.currentTarget.value}&key=${ENV['GOOGLE_API_SERVER_KEY']}`)
    .then(response => response.json())
    .then(data => drawResponseList(data));
};

input.addEventListener('keyup', autocomplete);
