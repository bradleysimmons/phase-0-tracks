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
// store in hash with key name
// specific to that string length

// haven't learned hashes yet
// so store in array
// iterate through
// and print if string length
// = long string length


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
