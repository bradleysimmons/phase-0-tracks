# write a program that will allow an interior designer to enter the details of a given client: the client's age, number of children, decor theme, and so on (you can choose your own: mix string, integer, and boolean data).



# program should prompt the user
puts "please enter client details:"
# convert any user input to appropriate data type
puts                                      #for a space in terminal print out
puts "please enter client name:"
name = gets.chomp
puts "please enter client age:"
age = gets.chomp.to_i
puts "please enter how many children the client has:"
number_of_children = gets.chomp.to_i
puts "please enter client decor theme:"
decor_theme = gets.chomp
puts "please enter client budget in dollars:"
budget_dollars = gets.chomp.to_i
puts "please enter true or false if client has paid:"
paid = gets.chomp

# print the hash back out to the screen when the designer has answer all of the questions
# keys should be symbols unless you find that you need a string for some reason

puts                            #for a space
p client_data = {
name: name,
age: age,
number_of_children: number_of_children,
decor_theme: decor_theme,
budget_dollars: budget_dollars,
paid: paid
}

# give the user the opportunity to update a key
# if the designer says "none", skip it

puts                                         #for a space
puts "enter 'yes' to udpate client data"
puts "enter 'none' to skip"
update = gets.chomp

if update == "yes"
  update = true
else
  update = false
end

# if the designer enters "decor theme" your program should ask for a new value and update "decor_theme"

if update == true
  puts                                                       #for a space
  puts "please enter which field you would like to update:"
  keys_list = client_data.keys
  puts keys_list
  puts                                 #adding a space again
  key = gets.chomp
  puts "please enter a new value for #{key}:"
  new_value = gets.chomp

  client_data[key.to_sym] = "#{new_value}"
end


# print latest version of hash, exit program
puts                   #for a space
p client_data




