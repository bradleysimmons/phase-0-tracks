var colors = ["blue", "red", "orange", "pink"];
var names = ["Ed", "Seabiscuit", "American Pharoah", "Secretariat"];

colors.push("green");
names.push("Apples");

var horses = {};

for (var i = 0; i < colors.length; i++) {
  horses[names[i]] = colors[i];
}

function Car(make, model, color) {
  this.make = make;
  this.model = model;
  this.color = color;
  this.honk = function() {
    console.log("Beep! Beep!");
  };
}

var racecar = new Car("Ferrari", "F1", "red");
racecar.honk();
console.log(racecar);

var lemon = new Car("Hyundai", "Sonata", "grey");
lemon.honk();
console.log(lemon);