// GOOGLE_API_SERVER_KEY

// https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=AIzaSyARQs4JmuMEWqPwkejlRf5Ir9SAwRR5mgM
// TODO: Autocomplete the input with AJAX calls.
// const input = document.querySelector('#search');
// const results = document.querySelector('#results');

// const drawResponseList = (data) => {
//   results.innerHTML = '';
//   data.items.forEach((item) => {
//     console.log(item)
//     const coucou = item;
//     results.insertAdjacentHTML('beforeend', `<li> Title : ${item.volumeInfo.title} - Author(s) : ${item.volumeInfo.authors.join(" - ")} <img src="${item.volumeInfo.imageLinks.smallThumbnail}"></li>`);
//   });
// };

// const hasAnImage = (item) => {
//   if(item.volumeInfo.smallThumbnail !== ""){
//     return `${item.volumeInfo.smallThumbnail}`
//   } else {
//     return ""
//   }
// }

// const autocomplete = (e) => {
//   fetch(`https://www.googleapis.com/books/v1/volumes?q=${event.currentTarget.value}&key=AIzaSyARQs4JmuMEWqPwkejlRf5Ir9SAwRR5mgM`)
//     .then(response => response.json())
//     .then(data => drawResponseList(data));
// };

// input.addEventListener('keyup', autocomplete);
