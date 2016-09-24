#Write a calculate method that takes three parameters: an integer, an operator string (example: "+"), and another integer. The method should execute the operation and return the result, an integer. The method should be able to handle the +, -, *, and / operations. For example, calculate(4, '+', 5) should return 9.

#Write driver code that tests all four operations and prints the results.

def calculate(integer, operator, integer_2)
  if operator == "+"
   return integer + integer_2
  end
  if operator == "-"
   return integer - integer_2
  end
  if operator == "*"
   return integer * integer_2
  end
  if operator == "/"
   return integer / integer_2
  end
end

# p calculate(4, "+", 5)
# p calculate(4, "-", 5)
# p calculate(4, "*", 5)
# p calculate(4, "/", 5)

#Comment out your driver code and create a user interface for your program: Prompt the user for a calculation that the user would like to perform, and use your method to give the user a result. For instance, if the user types "4 + 5", the program should print a result of 9 and then exit. You can assume correct input on the user's part.

#Update your program to allow the user to do as many calculations as they want (so the user might enter 3 + 4, receive the answer, and then enter 7 - 1 as the next calculation, and so on). When the user types "done" instead of a calculation, the program can exit.


until
  puts "basic calculator: type 'done' to exit"
  puts "enter a number:"
  integer = gets.chomp
    if integer == "done"
      break
    else
      integer = integer.to_i
    end
  puts "enter an operation (choices: '+', '-', '*', '/'):"
  operator = gets.chomp
    if integer == "done"
      break
    end
  puts "enter a second number:"
  integer_2 = gets.chomp
    if integer == "done"
      break
    else
      integer_2 = integer_2.to_i
    end
    puts "\n"
    puts "result: #{calculate(integer, operator, integer_2)}"
    puts "\n"
end



