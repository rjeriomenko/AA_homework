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

  
  // adding SF places as list items
  
function clearAndSubmitPlace(event) {
  event.preventDefault()

  const inputPlace = document.querySelector(".favorite-input")
  const textPlace = inputPlace.value
  inputPlace.value = ""

  const listPlace = document.getElementById("sf-places")
  const newPlace = document.createElement("li")
  newPlace.innerText = textPlace
  listPlace.append(newPlace)
}
  
const submitPlace = document.querySelector(".favorite-submit")
submitPlace.addEventListener("click", clearAndSubmitPlace)

  // adding new photos

  // --- your code here!
