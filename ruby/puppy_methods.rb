
class Puppy

  def initialize
    puts "Initialzing new puppy instance ..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(integer)
    i = 0
    integer.times do 
      puts "Woof!"
    end
  end 

  def roll_over()
    puts "*rolls over*"
  end

  def dog_years(integer)
     puts integer*7
  end

  def play_dead()
    puts "*plays_dead*"
  end
end

class Car

  def initialize()
    puts "start your engines"
  end

  def drive
      puts "Vroom vroom"
  end

  def road_trip(integer)
    integer.times do |int|
      miles = int + 1
      puts "We've driven #{miles} miles!"
    end
  end
end

=begin
# DRIVER CODE
fido = Puppy.new
fido.fetch("ball")
# fido should return the ball
fido.speak(3)
# fido should Woof 3 times
fido.roll_over()
# fido should roll over
fido.dog_years(7)
# should print 49
fido.play_dead()
#fido should paly dead

# DRIVER CODE
sheila = Car.new
# should initialize
sheila.drive 
# should vroom vroom 
sheila.road_trip(10)
# should travel 10 miles
=end

#can't figure out how to call methods on instances outside of this loop

# 10.times do |i|
#   car_name = "car_#{i + 1}"
#   puts car_name
#   car_name = Car.new
#   puts car_name
# end



# cars_hash = {}
# 50.times do |i|
#   car_name = "car #{i + 1}"
#   cars_hash[car_name] = Car.new
# end

# cars_hash.each do |car_name, id|
#   puts "#{car_name}: #{id}"
#   id.drive
#   id.road_trip(1)
# end

