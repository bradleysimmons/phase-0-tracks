var colors = ["dark blue", "opal red", "biscuit gray", "satin pink"];
var names = ["marey", "trotter", "pacer", "quarter"];

colors.push("dusty purple");
names.push("dimes");

var horses = {};

for (var i = 0; i < colors.length; i++) {
  horses[names[i]] = colors[i];
}

function Automobile(make, model, color) {
  this.make = make;
  this.model = model;
  this.color = color;
  this.honk = function() {
    console.log("honk!");
  };
}

var truck = new Automobile("ford", "f-250", "two-tone blue");
truck.honk();
console.log(truck);

var car = new Automobile("oldsmobile", "delta 88", "baroque gold");
car.honk();
console.log(car);