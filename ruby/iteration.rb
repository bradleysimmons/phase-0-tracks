#write your own method that takes a block. Your method should print out a status message before and after running the block. Your block doesn't have to do anything fancy -- it can just print out several of its own parameters.

def say_hello
  puts "hello there"
  yield("you there", "uh, you")
  puts "sure is nice out here"
end

say_hello { |name1, name2| puts "great to see you, #{name1} and #{name2}." }


#declare an array and a hash, and populate each of them with some data.

my_names = ["bradley", "james", "simmons"]

names_hash = {
  :first_name => "bradley",
  :middle_name => "james",
  :family_name => "simmons"
}


#Demonstrate that you can iterate through each one using .each

my_names.each do |name|
  p name
end

names_hash.each do |name_type, name|
  p "my #{name_type} is #{name}"
end



 #and then using .map! (modifying the data in some way). Print the data structures before and after each call to demonstrate whether they have been modified or not.

p my_names

 my_names.map! do |name|
  name.length
end

p my_names

#Use the documentation to find other Array and Hash methods that take blocks, and that can accomplish the tasks below, then add sample calls to phase-0-tracks/ruby/iteration.rb -- one for the array, and one for the hash.

#A method that iterates through the items, deleting any that meet a certain condition (for example, deleting any numbers that are less than 5).

integer_array = [1, 2, 3, 4, 5]

numbers_hash = {
  :one => 1,
  :two => 2,
  :three => 3,
  :four => 4,
  :five => 5
}

p integer_array

integer_array.delete_if {|integer| integer < 3}

p integer_array

p numbers_hash

numbers_hash.delete_if {|word, integer| word.length < 4}

p numbers_hash

#A method that filters a data structure for only items that do satisfy a certain condition (for example, keeping any numbers that are less than 5).

p integer_array

integer_array.keep_if {|integer| integer < 4}

p integer_array

p numbers_hash

numbers_hash.keep_if {|word, integer| word.length < 5}

p numbers_hash

#A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!

color_array = ["zenith blue", "dusty meringue", "ember red", "ginger pink", "hot green"]
color_hash = {
  :first => "zenith blue",
  :second =>  "dusty meringue",
  :third =>  "ember red",
  :fourth =>  "ginger pink",
  :fifth =>  "hot green"
}

p color_array

p color_array.index {|color| color == "hot green"}

p color_hash.select {|number, color_name| color_name.length > 9}


#A method that will remove items from a data structure until the condition in the block evaluates to false, then stops (you may not find a perfectly working option for the hash, and that's okay).

p color_array.reject {|color| color == "hot green"}

p color_hash.reject {|number, color_name| color_name == "dusty meringue"}






