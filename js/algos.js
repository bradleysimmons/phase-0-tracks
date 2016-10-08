// takes an array of strings 
// returns longest string in array

// compare first two strings
// establish initial longest string variable
// compare each subsequent string to long string
// if string is longer than long string
// re-assign long string variable with new value
// return long string

var array = ["ear", "corn", "fish", "prison", "planet", "jail"];

var long_string_finder = function(array){
if (array[0].length > array[1].length) {
  var long_string = array[0];
} else {
  var long_string = array[1];
}

for (var i = 0; i < array.length; i++) {
  if (array[i].length > long_string.length) {
    long_string = array[i]};
} return long_string;
}

console.log(long_string_finder(array));

// first version is okay
// but does not handle multiple strings
// that are equally the longest

// if string length = long string
// store in array
// also store long string in array
// iterate through
// and push to new array 
// if string length = long string length


var long_string_finder_two = function(array) {
  if (array[0].length > array[1].length) {
      var long_string = array[0];
  } else {
      var long_string = array[1];
    }

  var equal_string = []

  for (var i = 0; i < array.length; i++) {
    if (array[i].length > long_string.length) {
      long_string = array[i];
    } else if (array[i].length == long_string.length) {
        equal_string.push(array[i]);
      } 
  }

  equal_string.push(long_string)
  var longest_strings = []

  for (var i = 0; i < equal_string.length; i++) {
    if (equal_string[i].length == long_string.length) {
      longest_strings.push(equal_string[i]);
    }
  }

  return longest_strings;

};

console.log(long_string_finder_two(array));

//////////

// takes two objects
// checks if objects share 
// at least one key-value pair

// select first key-value pair
// of object one
// iterate through key-value pairs
// of object two
// if match
// return true
// select subsequent key-value pair
// of object one
// and repeat until
// no more key-value pairs 
// or match

var steven = {name: "steven", age: 54, haircut: "mop"};
var tamir = {name: "tamir", age: 54, haircut: "yes"};
var wild_bill = {name: "wild bill", age: 63, haircut: "bowl cut"}
var jessie = {name: "jessie", age: 27, haircut: "bowl cut"}
var elijah = {name: "elijah", age: 14, haircut: "bald"}

// for/in loop
// loops through properties in an object

var match_key_value_pair = function(object_one, object_two) {
  for (var key_of_one in object_one) {
    for (var key_of_two in object_two) {
      // console.log(key_of_one + ": " + object_one[key_of_one]);          // print to see
      // console.log(key_of_two + ": " + object_two[key_of_two]);
      if ((key_of_one + ": " + object_one[key_of_one]) == (key_of_two + ": " + object_two[key_of_two])) {
      return true;
      }
    } 
  }  return false;
};

console.log(match_key_value_pair(steven, tamir));
console.log(match_key_value_pair(elijah, wild_bill));
console.log(match_key_value_pair(jessie, wild_bill));


//////////

// takes integer
// for amount of strings
// to put in an array
// words should be random varying length
// between zero and eleven letters

// driver code 
// does following ten times:
// generates array
// prints array
// feeds array to longest word function
// prints result

// psuedocode:
// determine length of word
// by generating 1-10 random
// determine index number
// for each character
// by generating 1-26 random
// assign letter
// using alphabet string
// push word into array
// repeat


word_array = [];
var alphabet_string = "abcdefghijklmnopqrstuvqxyz";

var random_string_generator = function(input) {
   
    for (var i = 0; i < input; i++) {
      var string = "";
      var integer_one = get_random_integer(1, 11);
      for (var i_2 = 0; i_2 < integer_one; i_2++) {
        var integer_two = get_random_integer(0, 26);
        string += alphabet_string[integer_two];
      }
      word_array.push(string);
    } 
  console.log(word_array);
  return word_array;
};

var get_random_integer = function(min, max) {
   min = Math.ceil(min);
   max = Math.floor(max);
   return Math.floor(Math.random() * (max - min)) + min;
};
  

random_string_generator(10);

// long string finder breaks 
// if only one string in array

// also breaks if longest word
// is at index 1










