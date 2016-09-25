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

   # Even if the employee is an amazing liar otherwise, anyone going by the name of 
      # “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. In that case, 
      # you should print “Definitely a vampire.”

  if name.downcase == "tu fang" || name.downcase == "drake cula"
    result = "definitely a vampire"
  end

  if result != "definitely a vampire"

    puts "how old are you?"
    age = gets.chomp.to_i

    puts "what year were you born?"
    birth_year = gets.chomp.to_i

    puts "should we order you some garlic bread?"
    garlic = gets.chomp

    puts "would you like to enroll in our health care plan?"
    health_plan = gets.chomp

    #In addition to the other questions in the survey, use a loop to ask 
    #the employee to name any allergies, one at a time. The employee can 
    #type “done” when finished.

    #As long as the allergy is not “sunshine,” continue the loop for as 
    #long as is needed. If at any point the employee lists “sunshine” as 
    #an allergy, skip directly to the result of “Probably a vampire.”

    # my notes: set up a loop that stops when user types "done" or "sunshine"
    #           if user types "done", process results
    #           if user types "sunshine", store result as "probably a vampire"
    
    puts "please enter your allergies, one at a time."  
    puts "once you are finished, or if you do not have any allergies," 
    puts "please enter 'done'"
    
    while true
      input = gets.chomp
      if input == "sunshine"
        break
      elsif input == "done"
        break
      end
    end

    if input == "sunshine"
      result = "probably a vampire"
    end

    # skip survey if result = "probably a vampire"

    if result != "probably a vampire"

      # set booleans for checking truth on age

      time = Time.now
      current_year = time.year

      if age == current_year - birth_year
        age_truth = true
      elsif age == current_year - birth_year - 1
        age_truth = true
      else
        age_truth = false
      end

      # set booleans for garlic and health plan

      if garlic == "yes"
        garlic_yes = true
      else
        garlic_yes = false
      end

      if health_plan == "yes"
        health_yes = true
      else
        health_yes = false
      end

      # If the employee got their age right, and is willing to eat garlic bread 
      # or sign up for insurance, the result is “Probably not a vampire.”

      if age_truth && (garlic_yes || health_yes) 
        result = "probably not a vampire"


      # If the employee got their age wrong, and hates garlic bread or waives insurance, 
      # the result is “Probably a vampire.”

      elsif (age_truth == false) && ((garlic_yes == false) || (health_yes == false))
        result = "probably a vampire"


      # If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, 
      # the result is “Almost certainly a vampire.”

      elsif (age_truth == false) && (garlic_yes == false) && (health_yes == false)
        result = "almost certainly a vampire"


      # Otherwise, print “Results inconclusive.”

      else
        result = "results inconclusive"
      end

      # Print the result at the end of the survey.

    end
  end
  
  puts "vampire test results: #{result}"

  current_count = current_count + 1

end

puts "multiple employee survey complete"

puts "actually, never mind."
puts "what do these questions have to do with anything?"
puts "let's all be friends."
