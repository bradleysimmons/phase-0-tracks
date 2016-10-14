require_relative "media_scale"
require "sqlite3"

########## media scale

# tool for translating scale of tangible media to a web format

# enter paintings information into database
# calculate surface area of paintings
# calculate aspect ratio of paintings
# find painting with greatest surface area
# collect user input for desired max width of image on web
# return scaled dimensions for all paintings 
# in proportion to largest painting

########## create database and table

$db = SQLite3::Database.new("media.db")

create_table_command = <<-XX
  CREATE TABLE IF NOT EXISTS media_table(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    height INT,
    width INT,
    area INT,
    aspect_ratio INT
  )
XX

$db.execute(create_table_command)

########## driver code

puts "########## media scale"
puts "\n"
puts "select option:"
puts "1: input media to database"
puts "2: remove media from database"
puts "3: view database"
puts "4: calculate scaled dimensions"
puts "5: exit"
option = gets.chomp

if option == "1"
  until
    puts "enter media name (or \"q\" to quit):"
    name = gets.chomp
      if name == "q"
        break
      end
    puts "enter height"
    height = gets.chomp.to_i
      if height == "q"
        break
      end
    puts "enter width"
    width = gets.chomp.to_i
      if width == "q"
        break
      end
    area = calculate_item_area(height, width)
    aspect_ratio = calculate_item_aspect_ratio(height, width)
    create_media_item(db, name, height, width, area, aspect_ratio)
  end
end

if option == "3"
  print_database
end

if option == "4"
  max_area = $db.execute("SELECT name, MAX(area) FROM media_table")
  max_area = max_area.flatten
end



# p max_area_name = max_area[0]
# p max_area_value = max_area[1]

# puts "the largest media item in the database is \'#{max_area_name}\'"

# puts "enter desired width for largest item (in pixels):"
# max_width = gets.chomp.to_i

# paintings_list = $db.execute("SELECT id, name FROM media_table")
# paintings_list.each do |painting|
#   p "#{painting[0]}: #{painting[1]}"
# end

# puts "enter id number of painting to return its proportional values:"
# id = gets.chomp

# painting_to_calculate = $db.execute("SELECT height, width FROM media_table WHERE id=#{id}")
# painting_to_calculate = painting_to_calculate.flatten
# p painting_to_calculate


