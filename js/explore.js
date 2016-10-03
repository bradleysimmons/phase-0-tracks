// In comments, pseudocode a function that takes a string 
// as a parameter and reverses the string. reverse("hello"), 
// for example, should return "olleh". This isn't a task 
// specific to JavaScript -- your pseudocode should be in 
// plain English and use phrases like "for each" instead 
// of JavaScript-specific terms. Remember that you can add 
// strings in JavaScript, so '' + 'a' would result in the 
// string 'a'. Take your time. This is the most valuable 
// skill in programming: being able to think through a 
// problem logically.



// //create input and test 

// var inputstring = "word";
// console.log(inputstring);

// //create output string 

// var outputstring = "";

// //find last character

// console.log(inputstring.length - 1);
// console.log(inputstring[inputstring.length - 1]);

// //and add to new string

// outputstring += inputstring[inputstring.length - 1];
// console.log(outputstring);

// //find second to last character and add to string

// outputstring += inputstring[inputstring.length - 2];
// console.log(outputstring);

// //build a loop that increments this
// //and adds to new string until
// //new string and input string length are equal

// for (var i = 1; i <= inputstring.length; i++) {
  // outputstring += inputstring[inputstring.length - i];
// }

// place in function

function reverse(inputstring) {
  var outputstring = "";

  for (var i = 1; i <= inputstring.length; i++) {
  outputstring += inputstring[inputstring.length - i];
}

return outputstring;

}

// test with driver code

// console.log(reverse("test"));

// add driver code with conditional
// if palindrome, returns statement

// add driver code to print



function printreverseifnotpalindrome(word){
  if (reverse(word) != word) {
    var reversedword = (reverse(word));
  }
  else {
    var reversedword = "input is a palindrome";
  }
  if (1 == 1) {
    console.log(reversedword);
  }
}

printreverseifnotpalindrome("test");
printreverseifnotpalindrome("racecar");
printreverseifnotpalindrome("palindrome");


