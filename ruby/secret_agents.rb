# create method
# separate each letter of string
# call next method to advance each letter



#count = 0
#string = "abc"

  #while count < string.length
    #string[count] = string[count].next!
    #count += 1
  #end

#def encrypt(value)
  #puts string






#count = 0
#alpha = "abcdefghijklmnopqrstuvwxyz"
  #while count < alpha.length
    #decrypt = alpha.index("x")
    #puts decrypt - 1
  #end





#def decrypt(letter)
#alpha = "abcdefghijklmnopqrstuvwxyz"
#value = alpha.index(letter)
    #index = value - 1
#end


#def method(string)
#code = string[decrypt("c")]
#end

#puts code


#An encrypt method that advances every letter of a string
#one letter forward. So "abc" would become "bcd". 
#For now, you can assume lowercase input and output. 
#Any space character should remain a space character 
#-- no change made.

# define method

def encrypt(string)

# separate string into characters
# advance characters one letter forward

count = 0 # initialize count
while count < string.length # run loop while count is less than string length (print every character)
  string[count] = string[count].next! # selece character by index #, advance, and reassign
  count += 1 # add to count so next character in string is called through method
end

# reassemble string with advanced characters

puts string

end

encrypt("abc")
encrypt("zed")



