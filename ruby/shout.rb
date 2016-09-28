# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   #Add a yelling_happily method to our module. 
#   #You can decide what that method should return.

#   def self.yelling_happily(words)
#     words + "-ing YES!"
#   end
# end

# #Add driver code underneath your module declaration 
# #that calls both of your module methods.

# p Shout.yell_angrily("yes")
# p Shout.yelling_happily("no")

#Comment out the old code in shout.rb, and 
#make a mixin version of the Shout module instead.

module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words + "-ing YES!!!"
  end
end

#Write two classes representing anything that might 
#shout, and include the Shout module in those classes.

class Zealot
  include Shout
end

class Fanatic
  include Shout
end


#Test your work by adding driver code at the bottom 
#of the file that instantiates instances of your 
#classes and calls the two module methods on each instance.

believer_one = Zealot.new
p believer_one.yell_angrily("no")
p believer_one.yelling_happily("yes")

believer_two = Fanatic.new
p believer_two.yell_angrily("no")
p believer_two.yelling_happily("yes")

