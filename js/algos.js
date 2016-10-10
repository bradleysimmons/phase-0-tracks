// takes an array of strings 
// returns longest string in array
// and strings of equal length

// initialize long string variable
// initialize longest strings variable

// compare each subsequent string to long string
// if current string is longer than long string
// re-assign long string variable with new value
// clear out longest strings array
// push new longest string into longest strings array

// if current string length = long string
// push into longest strings array


var long_string_finder = function(array) {
  var long_string = ""
  var longest_strings = []

  for (var i = 0; i < array.length; i++) {
    if (array[i].length > long_string.length) {
      long_string = array[i];
      longest_strings = [];
      longest_strings.push(long_string);
    } else if (array[i].length == long_string.length) {
        longest_strings.push(array[i]);
      } 
  } return longest_strings;
};

////////// driver code

var array = ["ear", "blues", "fish", "prison", "planet", "eleven"];

console.log(long_string_finder(array));

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

var match_key_value_pair = function(object_one, object_two) {
  for (var key_of_one in object_one) {
    for (var key_of_two in object_two) {
      if ((key_of_one == key_of_two) && 
        (object_one[key_of_one] == object_two[key_of_two])) {
        return true;
      }
    } 
  }  return false;
};

////////// driver code

var steven = {name: "steven", age: 54, haircut: "mop"};
var tamir = {name: "tamir", age: 54, haircut: "shag"};
var leslie = {name: "leslie", age: 63, haircut: "bowl cut"};
var jessie = {name: "jessie", age: 27, haircut: "bowl cut"};
var elijah = {name: "elijah", age: 14, haircut: "bald"};

console.log(match_key_value_pair(steven, tamir));
console.log(match_key_value_pair(elijah, leslie));
console.log(match_key_value_pair(jessie, leslie));


//////////

// takes integer
// for amount of strings
// to put in an array
// strings should be random varying length
// between zero and eleven characters

// determine length of string
// by generating a random number, 1-10 
// determine index number for each character
// by generating random number, 1-26 
// assign letter using alphabet string
// push string into array
// repeat

var get_random_integer = function(min, max) {
   min = Math.ceil(min);
   max = Math.floor(max);
   return Math.floor(Math.random() * (max - min)) + min;
};

var alphabet_string = "abcdefghijklmnopqrstuvqxyz";

var random_string_generator = function(integer) {
  word_array = [];
    for (var i = 0; i < integer; i++) {
      var string = "";
      var integer_one = get_random_integer(1, 11);
      for (var i_2 = 0; i_2 < integer_one; i_2++) {
        var integer_two = get_random_integer(0, 26);
        string += alphabet_string[integer_two];
      }
      word_array.push(string);
    }
     return word_array;
};

////////// driver code

// does following ten times:
// generates array
// prints array
// feeds array to longest word function
// prints result

for (var i = 0; i < 10; i++) {
  var random_array = random_string_generator(get_random_integer(1, 21));
  console.log(random_array);
  console.log(long_string_finder(random_array));
}


