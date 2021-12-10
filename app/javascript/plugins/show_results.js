// TODO: Autocomplete the input with AJAX calls.

const showResults = (event) => {
  const results = document.getElementById('results');
  const searchBar = document.getElementById("search");

  const inputWord = event.currentTarget.value;
  const url = `/pages/autocomplete?query=${inputWord}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      results.innerHTML = "";
      const services = data;
      services.forEach((item) => {
        results.insertAdjacentHTML('beforeend', `<li class="list-group-item">${item.name}</li>`);
      });
    });

    searchBar.addEventListener('keyup', showResults);

};


export { showResults };
