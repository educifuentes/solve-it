// TODO: Autocomplete the input with AJAX calls.

const showResults = (event) => {
  const results = document.getElementById('results');
  const searchBar = document.getElementById("search-bar");

  // const inputWord = event.currentTarget.value;
  const inputWord = document.querySelector('.form-control').value;
  console.log("event");
  console.log(event.currentTarget.value);
  const url = `/categories/autocomplete?query=${inputWord}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      results.innerHTML = "";
      const services = data;
      services.forEach((item) => {
        results.insertAdjacentHTML('beforeend', `<li class="list-group-item"> <a href="/services/${item.id}">${item.name}</a></li>`);
      });
    });

    searchBar.addEventListener('keyup', showResults);

};


export { showResults };
