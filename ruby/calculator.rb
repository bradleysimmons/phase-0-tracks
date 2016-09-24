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

p calculate(4, "+", 5)
p calculate(4, "-", 5)
p calculate(4, "*", 5)
p calculate(4, "/", 5)

