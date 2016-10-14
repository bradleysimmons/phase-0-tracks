# media scale

# web design tool for representing scale properties of tangible media
# in a web format

# enter paintings and information into database
# calculate surface area of tangible paintings using dimensions
# calculate aspect ratio of tangible paintings
# find greatest surface area of all entered paintings
# collect user input for desired image size on web
# return scaled dimensions for all paintings

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

# media = db.execute("SELECT * FROM media_table")

max_area = db.execute("SELECT id, MAX(area) FROM media_table")

p max_area

