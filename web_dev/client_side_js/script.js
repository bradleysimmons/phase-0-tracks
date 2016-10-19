console.log("the script is running");

function displayMenu() {
  var menu = document.getElementById("nav_menu");
  menu.style.display = "inline";
}

var h2 = document.getElementsByTagName("h2");
h2 = h2[0];
h2.addEventListener("click", displayMenu);
