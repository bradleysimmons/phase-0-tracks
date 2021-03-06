# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  name = params[:name]
    "#{params[:name]} is #{params[:age]} years old"
  end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# # write a GET route that retrieves
# # all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# # write a GET route that retrieves
# # a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

## write a GET route that displays 
## an address

get '/contact/:address' do
  address = params[:address]
  "the address is: #{address}"
end

## A /great_job route that can take 
#a person's name as a query parameter 
#(not a route parameter) and say 
#{}"Good job, [person's name]!". 
#If the query parameter is not present, 
#the route simply says "Good job!"

get '/great_job/' do
  if params[:name]
    "good job, #{params[:name]}!"
  else
    "good job"
  end
end

#A route that uses route parameters 
#to add two numbers and respond with 
#the result. The data types are tricky 
#here -- when will the data need to be 
#(or arrive as) a string?

get '/:number_one/plus/:number_two' do
  sum = ("#{params[:number_one]}").to_i + ("#{params[:number_two]}").to_i
  sum.to_s
end

#Optional bonus: Make a route that allows 
#the user to search the database in some way 
#-- maybe for students who have a certain 
#first name, or some other attribute. If you 
#like, you can simply modify the home page to 
#take a query parameter, and filter the students 
#displayed if a query parameter is present.

get '/search/:campus' do
  names = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])
  results = ""
  names.each do |student|
    results << "ID: #{student['id']}<br>"
    results << "Name: #{student['name']}<br>"
    results << "Age: #{student['age']}<br>"
    results << "Campus: #{student['campus']}<br><br>"
  end
  results
end
