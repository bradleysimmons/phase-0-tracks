#pseudocode and write a method that takes a spy's real name (e.g., "Felicia Torres") and creates a fake name with it by doing the following:

puts "input name"
name = gets.chomp

#Swapping the first and last name.

def swap(name)
name = name.split(" ")
name = name.reverse
name = name.join(" ")
end

def makearray(name)
  name = swap(name)
  name = name.split("")
end

name = makearray(name)



#Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

#iterate
#check if aeiou
#recombine
#print

def successive_letter(name)
  vowels = "aeiou"
  consonants = "bcdfghjklmnpqrstvwxyz"

  name.map! do |letter|
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




name = successive_letter(name)

def join_name(name)
  name.join("")
end

p join_name(name)


