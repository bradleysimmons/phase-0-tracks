#pseudocode and write a method that takes a spy's real name (e.g., "Felicia Torres") and creates a fake name with it by doing the following:



#Swapping the first and last name.

def swap(name)
  name = name.downcase
  name = name.split(" ")
  name = name.reverse
  name = name.join(" ")
end

# make into array for use in iterative method

def makearray(name)
  name = swap(name)
  name = name.split("")
end

#Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

#iterate
#handle edge cases/ spaces
#check if aeiou, return successive
#check if consonant, return successive


def successive_letter(name)
  vowels = "aeiou"
  consonants = "bcdfghjklmnpqrstvwxyz"

  makearray(name).map! do |letter|
    if letter == " "
      letter = " "
    elsif letter == "u"
      letter = "a"
    elsif letter == "z"
      letter = "b"
    elsif consonants.index(letter) == nil
      index_num = vowels.index(letter) + 1
      letter = vowels[index_num]
    else
      index_num = consonants.index(letter) + 1
      letter = consonants[index_num]
    end
  end
end

def join_name(name)
  name = successive_letter(name).join("")
  name = name.split(" ")
  name.map! do |name|
    name.capitalize
  end
  name = name.join(" ")
end

#################################

#Provide a user interface that lets a user enter a name and get a fake name back. Let the user do this repeatedly until they decide to quit by typing 'quit'. (They might just hit Enter to continue.)


#### method to check for valid input

def validator(name)
valid_string = " abcdefghijklmnopqrstuvwxyz"
name = name.downcase
name = name.split("")

  name.each do |letter|
    if valid_string.index(letter) == nil
      return false
    end
  end
end

###driver code

name = " "
until name == "quit"
puts "enter name (or 'quit' to end)"
name = gets.chomp
  if name == "quit"
    break
  elsif validator(name) == false
    puts "input ivalid: letters and spaces only"
  else 
    p join_name(name)
  end
end

