# media scale

# web design tool for representing scale properties of tangible media
# in a web format

# enter paintings and information into database
# calculate surface area of tangible paintings using dimensions
# calculate aspect ratio of tangible paintings
# find greatest surface area of all entered paintings
# collect user input for desired image size on web
# return scaled dimensions for all paintings

    ## pseudocode for scaled_width_calculator
    # based on largest painting set to 100% at desired width
    # takes desired_max_width, largest_width, width_to_scale
    # returns => scaled_width = (w_t_s / l_w) d_m_w

    ## pseudocode for scaled_height_calculator
    # takes return from scaled_width_calculator, aspect_ratio
    # returns => scaled_height = scaled_width (aspect_ratio)

require "sqlite3"

db = SQLite3::Database.new("media.db")

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

db.execute(create_table_command)

def create_media_item(db, name, height, width, area, aspect_ratio)
  db.execute("INSERT INTO media_table (name, height, width, area, aspect_ratio) VALUES (?, ?, ?, ?, ?)", [name, height, width, area, aspect_ratio])
end

def calculate_item_area(height, width)
  height * width
end

def calculate_item_aspect_ratio(height, width)
  aspect = height.to_f / width.to_f
  aspect = aspect.round(3)
end

def scaled_width_calculator(desired_max_width, largest_width, width_to_scale)
  scaled_width = (width_to_scale / largest_width) * desired_max_width
end

def scaled_height_calculator(scaled_width_calculator_return, aspect_ratio)
  scaled_height = scaled_width * aspect_ratio
end


########## driver code

until
  puts "enter q to quit at any time"
  puts "enter media name:"
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

media = db.execute("SELECT * FROM media_table")

p media

max_area = db.execute("SELECT name, MAX(area) FROM media_table")
max_area = max_area.flatten

p max_area_name = max_area[0]
p max_area_value = max_area[1]

puts "the largest media item in the database is \'#{max_area_name}\'"

puts "enter desired width for largest item (in pixels):"
max_width = gets.chomp.to_i

paintings_list = db.execute("SELECT id, name FROM media_table")
paintings_list.each do |painting|
  p "#{painting[0]}: #{painting[1]}"
end

puts "enter id number of painting to return its proportional values:"
id = gets.chomp

painting_to_calculate = db.execute("SELECT height, width FROM media_table WHERE id=#{id}")
painting_to_calculate = painting_to_calculate.flatten
p painting_to_calculate


