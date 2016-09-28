# write a method that takes an array of integers and an integer 
#to search for. The method should return the index of the item, 
#or nil if the integer is not present in the array. Don't use 
#built-in array methods like .index. You are allowed to use 
#.length and .each.

array = [1, 2, 3, 4, 3, 2, 1]


def search(array_name, integer)
  index_number = 0
  search_results = []
  array_name.each do |value|
      if value == integer
        search_results.push(index_number) 
      end
      index_number +=1
  end
  if search_results.empty?
    puts "integer not present"
    return nil
  else
    p search_results
  end
end

search(array, 3)
search(array, 4)
p search(array, 5)

################# i wanted to make an interface but it is currently broken

# until
# puts "input 'q' to quit"
# puts "array name:"
# array_name = gets.chomp
#   if array_name == "q"
#     break
#   end
# puts "integer:"
# integer = gets.chomp
# integer = integer.to_i
#   if integer == "q"
#     break
#   end

# puts array_name
# p search(array_name, integer)
# end

# i can take the integer i want to search for with gets.chomp and pass it through fine.  when i take the name of the array i want to search for, i'm pretty sure it tries to evaluate it as a string instead of pointing it to the array with that variable name.  i've placed my array definition with the variable name both inside and outside of the method, but i haven't been able to figure it out.

########################

##Add a method to your file that takes a number of Fibonacci terms to generate and returns an array of the terms. For example, fib(6) would return [0,1,1,2,3,5]. Your method should work for a large number of terms. To verify your work: the last number in the array generated by fib(100) will be 218922995834555169026. (How can you verify this without having to compare this huge number manually? Be smart with your driver code!)

def fibonacci(number)
  array = [0, 1]
  index = 2
  until index == number
    last_number = array[index - 1] + array[index - 2]
    array.push(last_number)
    index += 1
  end
    return array[-1]
end

p fibonacci(100)
puts fibonacci(100) == 218922995834555169026

########################

# Choose a simple sorting algorithm to learn about. 
#Bubble sort or insertion sort are good ones for beginners, 
#but you're welcome to be more adventurous.

# Form a conceptual understanding of how the algorithm works. 
#What helps you grasp it? Do visualizations help? How can 
#you find the right materials for yourself?

# Notice your emotional state as you tackle this algorithm: 
#do you feel frustrated, underqualified, stupid, or overwhelmed? 
#Or is it more like excitement and curiosity? How do you think 
#these feelings affect your ability to learn?


def bubble_sort(array)
  n = array.length   # assigns array length to variable n
  count = 0
  loop do
    swapped = false   # initializes swapped variable as false
    # p "count = #{count}"  # for visualization
    # p "array = #{array}"
    (n-1).times do |i|  # for array length - 1 iterate through 
      # p "count = #{count}"   # for visualization
      # p "array = #{array}"
      # p "if #{array[i]} > #{array[i+1]}"
      if array[i] > array[i+1]    # if preceding number is larger
        array[i], array[i+1] = array[i+1], array[i] # swap them and run through again
        swapped = true   # marking that action has been taken
        count += 1
      end
    end

    break if not swapped
  end

  array
end

array = [2, 10, 8, 4, 6]

p bubble_sort(array)

# Pseudocode a sorting method that takes an array of integers 
#and uses a sorting algorithm. The method should return a sorted 
#version of the array. Your pseudocode should not be Ruby-specific.

# create example ordered database for all possible integers
# create piles for grouping matches
# pick up character and compare to ordered database
# place into matching group
# compile by arranging matching groups in order


# Implement the sorting method in Ruby.


ordered_integers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
matching_groups = {}

# create hash to store all matching groups

ordered_integers.each do |integer|
  matching_groups[integer] = []
end
  





