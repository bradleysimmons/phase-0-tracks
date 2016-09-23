#pseudocode and write a method that takes a spy's real name 
#(e.g., "Felicia Torres") and creates a fake name.

#swap the first and last name.

def swap(name)
  name = name.downcase
  name = name.split(" ")
  name = name.reverse
  name = name.join(" ")
end

#make swapped name into character array for use in iterative method

def make_array(name)
  name = swap(name)
  name = name.split("")
end

#change vowels to the next vowel in alphabet, 
#change consonants to the next consonant in alphabet

#iterate
#handle edge cases/ spaces
#check if vowel, return successive
#check if consonant, return successive

def successive_letter(name)
  vowels = "aeiou"
  consonants = "bcdfghjklmnpqrstvwxyz"

  make_array(name).map! do |character|
    if character == " "
      character = " "
    elsif character == "u"
      character = "a"
    elsif character == "z"
      character = "b"
    elsif consonants.index(character) == nil
      index_number = vowels.index(character) + 1
      character = vowels[index_number]
    else
      index_number = consonants.index(character) + 1
      character = consonants[index_number]
    end
  end
end

#join and format fake_name for printing

def fake_name(name)
  name = successive_letter(name).join("")
  name = name.split(" ")
  name.map! do |name|
    name.capitalize
  end
  return name.join(" ")
end

####################

#create user interface where input = name and output = fake name
#allow multiple inputs until they type 'quit'

#method to check for valid input

def validate(name)
valid_string = " abcdefghijklmnopqrstuvwxyz"
name = name.downcase
name = name.split("")

  name.each do |character|
    if valid_string.index(character) == nil
      return false
    end
  end
end

#method to capitalize input_name for printing

def capitalize(name)
  name = name.split(" ")
  name.map! do |name|
    name.capitalize
  end
  name = name.join(" ")
end

#take input
#check for valid input
#use data structure to store names

names = []
until
puts "enter name (or 'quit' to end)"
name = gets.chomp
  if name == "quit"
    break
  elsif name == "" || validate(name) == false
    puts "invalid input: letters and spaces only"
  else 
    name = capitalize(name)
    names.push([name, fake_name(name)])
  end
end

#when user exits program, iterate through data structure 
#and print all of the data the user entered

puts "\n"
puts "double agents:"

names.each do |input_name, fake_name|
  puts "'#{fake_name}' a.k.a #{input_name}"
end
