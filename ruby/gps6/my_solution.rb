# Virus Predictor

# I worked on this challenge [by myself, with: megan eding ].
# We spent [2.5] hours on this challenge.

# EXPLANATION OF require_relative
#
#
require_relative 'state_data'
# require_relative is to call in a file to the file you are currently working in.  The require_relative file is in the same folder as your current file.  
# require is used to call in modules and other files not directly within your file structure.

class VirusPredictor
  # initialize takes the input parameters and sets them to instance variables 
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  # calling in private methods: predicted_deaths and speed_of_spread
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  def predicted_deaths
    # predicted deaths is solely based on population density
    # private method; calculation of deaths based on @population_density and @popultion.  The higher the density and population, the higher the death count.  Floor rounds the float down to the nearest integer.
    
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density < 50 
      number_of_deaths = (@population * 0.05).floor 
    else 
      increase = (@population_density/500)
      number_of_deaths = (@population * increase).floor
    end 

  # printing our results in a readable way
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
  # private method; calculating how quickly the disease will spread based on @population_density.  Output is in months and left as a float. The higher the density, the more quickly the disease will spread (based on speed counter). 
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 2.5

    if @population_density >= 200
      speed = 0.5
    else 
      increase = (@population_density/50).floor
      increase.times do
        speed -= 0.5
      end 
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state_name, pop_info| 
  state_instance = VirusPredictor.new(state_name, pop_info[:population_density], pop_info[:population])
  state_instance.virus_effects
end 




# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section

=begin
  
What are the differences between the two different hash syntaxes shown in the state_data file?
What does require_relative do? How is it different from require?
What are some ways to iterate through a hash?
When refactoring virus_effects, what stood out to you about the variables, if anything?
What concept did you most solidify in this challenge?

=end

#one hash uses strings for keys, the other uses symbols
#require relative allows the user to specify a file path relative to the program file
#require allows user to require other files such as built in modules, by name
#i typically use .each to iterate through a hash.  .each has many variations that allow the user to iterate through keys or values or both.
#the variables incremented in a linear fashion
#i really want to work on refactoring.  i learned how to kind of begin an inquiry into what can be done.  i also used the float method for the first time and set up private methods.  this was a good exercise.