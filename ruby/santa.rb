#Eventually, your simulator will build thousands of Santas, but for now, 
#start by defining a Santa class in phase-0-tracks/ruby/santa.rb. 
#Your class should have three instance methods:

class Santa

#Refactor your code with attr_reader and attr_accessor. 
#Verify that your driver code still works.

attr_reader :age, :ethnicity
attr_accessor :gender


#An initialize method that prints "Initializing Santa instance ...".

#Update your Santa class with the following attributes:

#gender, which will be a string passed in on initialization

#ethnicity, which will be a string passed in on initialization

#reindeer_ranking, an array of reindeer from most preferred to 
#least preferred. This is not passed in on initialization; 
#it simply gets a default value of ["Rudolph", "Dasher", 
#"Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]

#age, which is not passed in on initialization and defaults to 0

  def initialize (gender, ethnicity)
    puts "initializing santa instance"
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", 
    "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = rand(140)
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

  def introduce
    puts "hi, i am a(n) #{@ethnicity} #{@gender} santa"
  end

#Add three attribute-changing methods to your Santa class:

#celebrate_birthday should age Santa by one year.
  
  def celebrate_birthday
    @age = @age + 1
  end

#get_mad_at can take a reindeer's name as an argument, 
#and move that reindeer in last place in the reindeer rankings. 
#Vixen knows what he did.

  def get_mad_at(name)
    index_num = @reindeer_ranking.index(name)
    @reindeer_ranking.delete_at(index_num)
    @reindeer_ranking << name
  end

=begin
#The @gender attribute should have a setter method that allows 
#@gender to be reassigned from outside the class definition.

  def gender=(new_gender)
    @gender = new_gender
  end

#Refactor your code with attr_reader and attr_accessor. 
#Verify that your driver code still works.
=end


=begin
#Add two "getter" methods as well:

#The method age should simply return @age.

  def age
    @age
  end

#The method ethnicity should return @ethnicity.
#Update your driver code to test your work.

  def ethnicity
    @ethnicity
  end

#Refactor your code with attr_reader and attr_accessor. 
#Verify that your driver code still works.
=end


end

#Add a bit of code below your class declaration to check that 
#you're able to initialize a Santa instance and call its methods.

# saint_nick = Santa.new

# saint_nick.speak
# saint_nick.eat_milk_and_cookies("chocolate chip cookie")

#Add some diverse initializations to your file as driver code, 
#then test your work by running the program from the command 
#line. Feel free to get fancy with loops and whatnot, or keep 
#it simple if you prefer.

santas = []
santas << Santa.new("man", "white")
santas << Santa.new("woman", "black")
santas << Santa.new("boy", "latino")
santas << Santa.new("girl", "asian")


santas.each do |santa|
  p santa.celebrate_birthday
  p santa.get_mad_at("Vixen")
  p santa.gender = "transgender"
  p santa.age
  p santa.ethnicity
end

#Write a program that creates lots of Santas. If you're on a 
#cloud-based environment, you may not want to push it past 
#about a hundred Santas. If you're on a faster computer, 
#you may be able to make lots more than that. Play around 
#with the numbers and see what happens.

#Obviously, no one wants to create ten thousand Santas by hand. 
#That's what computers are for!

#Use our array of example genders and an array of example 
#ethnicities (and feel free to add to it if you like -- 
#each array could have a lot more options in it!)

example_genders = ["agender", "female", "bigender", "male", "female", 
  "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", 
  "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

100.times do

#to create your Santas with a randomly selected gender 
#and a randomly selected ethnicity. (How do you randomly 
#select an array item? The Array documentation should be 
#able to help you out there!)

santa = Santa.new(example_genders.sample, example_ethnicities.sample)

#Set your new Santa's age to a random number between 0 and 140.
#No need to store your Santas in a data structure, but your 
#program should print out the attributes of each Santa using 
#the instance methods that give you access to that data.

p "age: #{santa.age}, gender: #{santa.gender}, ethnicity: #{santa.ethnicity}"


end
