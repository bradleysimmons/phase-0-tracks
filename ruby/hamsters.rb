puts "what is the hamster\'s name?"
name = gets.chomp

puts "how loud is the hamster on a scale of 1 to 10?"
volume = gets.chomp.to_i

puts "what color fur does the hamster have?"
color = gets.chomp

puts "is the hamster a good candidate for adoption?"
adoptable = gets.chomp

if adoptable == "yes" 
    adoptable = true 
  else 
    adoptable = false 
  end 

puts "what is the estimated age of the hamster?"
age = gets.chomp

  if age == ""
    age = nil
  end
  

puts "The hamster\'s name is #{name}.  #{name} is estimated to be #{age} years old.  
     On a scale of 1 to 10, with one being quiet and ten being loud, #{name} is a #{volume}.
     #{name}\'s fur is #{color}.  It is #{adoptable} that #{name} is a good candidate for adoption."

