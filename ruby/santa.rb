#Eventually, your simulator will build thousands of Santas, but for now, 
#start by defining a Santa class in phase-0-tracks/ruby/santa.rb. 
#Your class should have three instance methods:

class Santa

#An initialize method that prints "Initializing Santa instance ...".

  def initialize
    puts "initializing santa instance"
  end

#A speak method that will print "Ho, ho, ho! Haaaappy holidays!" 
#(Santa has been working on being more inclusive.)

  def speak
    puts "ho, ho, ho! happy hollandaise!"
  end

#An eat_milk_and_cookies method that takes a cookie type 
#(example: "snickerdoodle") as a parameter and prints "That was a good <type of cookie here>!" 

  def eat_milk_and_cookies(cookie_type)
    puts "that was a good #{cookie_type}!"
  end

end

#Add a bit of code below your class declaration to check that 
#you're able to initialize a Santa instance and call its methods.

saint_nick = Santa.new

saint_nick.speak
saint_nick.eat_milk_and_cookies("chocolate chip cookie")