const showResults = (event) => {
  const results = document.getElementById("results");
  const searchBar = document.getElementById("search-bar");

  const inputWord = document.querySelector(".form-control").value;
  const url = `/categories/autocomplete?query=${inputWord}`;

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      results.innerHTML = "";
      const services = data;
      if (Object.keys(services).length === 0) {
        results.insertAdjacentHTML(
          "beforeend",
          `<li class="list-group-item"> We don't have that service yet!</a></li>`
        );
      } else {
        services.forEach((item) => {
          results.insertAdjacentHTML(
            "beforeend",
            `<li class="list-group-item"> <a href="/services_technicians?service_id=${item.id}">${item.name}</a></li>`
          );
        });
      }
    });

  searchBar.addEventListener("keyup", showResults);
};

const searchBar = document.getElementById("search-bar");
searchBar.addEventListener("keyup", showResults);
