document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  // , (e) => { console.log("here!") }
  // adding SF places as list items

  // --- your code here!
  const addPlace = document.getElementsByClassName("list-container");  
  addPlace[0].addEventListener("submit", e => {
    e.preventDefault();
    // debugger
    const placesInputEl = document.getElementsByClassName("favorite-input")
    
    const placeName = placesInputEl[0].value;
    placesInputEl[0].value = "";

    const ul = document.getElementById("restaurants");
    // create an li element
    const li = document.createElement("li");
    // set the text of the li to be the value of the input field
    li.textContent = placeName;

    // insert it as the last item in the ul.
    ul.appendChild(li);
  });



  // adding new photos

  // --- your code here!
  const photoForm = document.getElementById("photo-form");
  document.getElementsByClassName("photo-show-button")[0].addEventListener("click", e => {
    e.preventDefault();
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.className = "photo-form-container";
    } else {
      photoForm.className = "photo-form-container hidden";
    }
  });

  photoForm.addEventListener("submit", e => {
    e.preventDefault();
    const photoUrl = document.getElementById("photo-url-input").value;
    document.getElementById("photo-url-input").value = "";

    const ul = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    const img = document.createElement("img");

    img.src = photoUrl;
    ul.appendChild(li);
    li.appendChild(img);
    
  });

});
