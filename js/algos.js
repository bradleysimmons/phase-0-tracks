// takes an array of strings 
// returns longest string in array

// establish initial longest string variable
// compare each subsequent string to long string
// if string is longer than long string
// re-assign long string variable with new value
// return long string

var array = ["ear", "blues", "fish", "prison", "planet", "eleven"];

// handle multiple strings
// that are equally the longest

// establish index 0
// as long string

// if string length = long string
// store in array
// also store long string in array
// iterate through
// and push to new array 
// if string length = long string length


var long_string_finder = function(array) {
  var long_string = array[0]
  var equal_string = []

  for (var i = 1; i < array.length; i++) {
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

console.log(long_string_finder(array));

//////////

// // takes two objects
// // checks if objects share 
// // at least one key-value pair

// // select first key-value pair
// // of object one
// // iterate through key-value pairs
// // of object two
// // if match
// // return true
// // select subsequent key-value pair
// // of object one
// // and repeat until
// // no more key-value pairs 
// // or match

// var steven = {name: "steven", age: 54, haircut: "mop"};
// var tamir = {name: "tamir", age: 54, haircut: "yes"};
// var wild_bill = {name: "wild bill", age: 63, haircut: "bowl cut"}
// var jessie = {name: "jessie", age: 27, haircut: "bowl cut"}
// var elijah = {name: "elijah", age: 14, haircut: "bald"}

// // for/in loop
// // loops through properties in an object

// var match_key_value_pair = function(object_one, object_two) {
//   for (var key_of_one in object_one) {
//     for (var key_of_two in object_two) {
//       // console.log(key_of_one + ": " + object_one[key_of_one]);          // print to see
//       // console.log(key_of_two + ": " + object_two[key_of_two]);
//       if ((key_of_one + ": " + object_one[key_of_one]) == (key_of_two + ": " + object_two[key_of_two])) {
//       return true;
//       }
//     } 
//   }  return false;
// };

// ////////// driver code

// // console.log(match_key_value_pair(steven, tamir));
// // console.log(match_key_value_pair(elijah, wild_bill));
// // console.log(match_key_value_pair(jessie, wild_bill));


// //////////

// // takes integer
// // for amount of strings
// // to put in an array
// // words should be random varying length
// // between zero and eleven letters

// // driver code 
// // does following ten times:
// // generates array
// // prints array
// // feeds array to longest word function
// // prints result

// // psuedocode:
// // determine length of word
// // by generating 1-10 random
// // determine index number
// // for each character
// // by generating 1-26 random
// // assign letter
// // using alphabet string
// // push word into array
// // repeat

// var get_random_integer = function(min, max) {
//    min = Math.ceil(min);
//    max = Math.floor(max);
//    return Math.floor(Math.random() * (max - min)) + min;
// };

// var alphabet_string = "abcdefghijklmnopqrstuvqxyz";

// var random_string_generator = function(integer) {
//   word_array = [];
//     for (var i = 0; i < integer; i++) {
//       var string = "";
//       var integer_one = get_random_integer(1, 11);
//       for (var i_2 = 0; i_2 < integer_one; i_2++) {
//         var integer_two = get_random_integer(0, 26);
//         string += alphabet_string[integer_two];
//       }
//       word_array.push(string);
//     } 

//   console.log("\n");
//   console.log("returned " + word_array.length + " strings: ");  
//   console.log(word_array);
//   return word_array;
// };

// ////////// driver code

// long_string_finder(random_string_generator(10));
// long_string_finder(random_string_generator(6));
// long_string_finder(random_string_generator(3));
// long_string_finder(random_string_generator(2));
// long_string_finder(random_string_generator(1));
// long_string_finder(random_string_generator(9));
// long_string_finder(random_string_generator(6));
// long_string_finder(random_string_generator(4));
// long_string_finder(random_string_generator(11));
// long_string_finder(random_string_generator(20));


// console.log("\n");
//   console.log("maximum string length: " + long_string.length);
  
//   if (longest_strings.length == 1) {
//     console.log(longest_strings.length + " occurrence:");
//   } else if (longest_strings.length > 1) {
//     console.log(longest_strings.length + " occurrences:");
//     };

//   console.log(longest_strings);




