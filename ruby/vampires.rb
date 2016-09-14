# At the beginning of your program, ask the user 
# how many employees will be processed, then begin 
# the survey process for the first employee. After 
# you print the result for that employee, start the 
# survey over again, and repeat until all the employees 
# have been processed.

puts "how many users will be processed?"
users = gets.chomp.to_i
starting_count = 0
current_count = starting_count

until current_count == users

# write a program that asks the new employee the following questions.

puts "what is your name?"
name = gets.chomp

puts "how old are you?"
age = gets.chomp.to_i

puts "what year were you born?"
birth_year = gets.chomp.to_i

puts "should we order you some garlic bread?"
garlic = gets.chomp

puts "would you like to enroll in our health care plan?"
health_plan = gets.chomp

# set conditional for checking truth on age

current_year = 2016
if age == current_year - birth_year
  age_truth = true
elsif age == current_year - birth_year - 1
  age_truth = true
else
  age_truth = false
end

# set booleans for garlic and health plan

if garlic == "yes"
  garlic_willing = true
else
  garlic_willing = false
end

if health_plan == "yes"
  health_plan_willing = true
else
  health_plan_willing = false
end

# set booleans for drake cula and tu fang

if name == "tu fang" || name == "drake cula"
  def_vampire = true
else
  def_vampire = false
end


# If the employee got their age right, and is willing to eat garlic bread 
# or sign up for insurance, the result is “Probably not a vampire.”

if (def_vampire == false) && age_truth && (garlic_willing || health_plan_willing) 
  result = "probably not a vampire"


# If the employee got their age wrong, and hates garlic bread or waives insurance, 
# the result is “Probably a vampire.”

elsif (def_vampire == false) && (age_truth == false) && ((garlic_willing == false) || (health_plan_willing == false))
  result = "probably a vampire"


# If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, 
# the result is “Almost certainly a vampire.”

elsif (def_vampire == false) && (age_truth == false) && (garlic_willing == false) && (health_plan_willing == false)
  result = "almost certainly a vampire"

# Even if the employee is an amazing liar otherwise, anyone going by the name of 
# “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. In that case, 
# you should print “Definitely a vampire.”

elsif (def_vampire == true)
  result = "definitely a vampire"

# Otherwise, print “Results inconclusive.”

else
  result = "results inconclusive"
end

# Print the result at the end of the survey.

puts "vampire test results: #{result}"

current_count = current_count + 1

end

puts "multiple employee survey complete"