#pseudocode and write a method that takes a spy's real name (e.g., "Felicia Torres") and creates a fake name with it by doing the following:



#Swapping the first and last name.

def swap(name)
name = name.downcase
name = name.split(" ")
name = name.reverse
name = name.join(" ")
end

def makearray(name)
  name = swap(name)
  name = name.split("")
end

#Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

#iterate
#check if aeiou
#recombine
#print

def successive_letter(name)
  vowels = "aeiou"
  consonants = "bcdfghjklmnpqrstvwxyz"

  makearray(name).map! do |letter|
    if letter == " "
      letter = " "
    elsif letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
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

#################################driver code and input validator currently broken


# def input_validator(name)
# valid_input_string = " abcdefghijklmnopqrstuvwxyz"
# character_array = name.split("")
  
#   character_array.each do |character|
#     index_number = valid_input_string.index(character)
#   end
# end




# valid_input = false
# until valid_input == true
#   puts "input name"
#   name = gets.chomp
#   if input_validator(name) <= 26
#     p join_name(name)
#     valid_input = true
#   else
#     valid_input = false
#   end
# end






