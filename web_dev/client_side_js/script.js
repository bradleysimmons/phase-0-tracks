console.log("the script is running");

function addPinkBorder(event) {
  console.log("click event:");
  console.log(event);
  event.target.style.border = "2px solid pink";
}

var photo = document.getElementById("");
photo.addEventListener("click", addPinkBorder);