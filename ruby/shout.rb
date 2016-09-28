module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  #Add a yelling_happily method to our module. 
  #You can decide what that method should return.

  def self.yelling_happily(words)
    words + "-ing YES!"
  end
end

#Add driver code underneath your module declaration 
#that calls both of your module methods.

p Shout.yell_angrily("yes")
p Shout.yelling_happily("no")

