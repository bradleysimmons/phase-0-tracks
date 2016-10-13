# media scale

# web design tool for representing scale properties of tangible media
# in a web format

# enter paintings and information into database
# calculate surface area of tangible paintings using dimensions
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
    width INT
  )
XX

db.execute(create_table_command)

def create_media_item(db, name, height, width)
  db.execute("INSERT INTO media_table (name, height, width) VALUES (?, ?, ?)", [name, height, width])
end

def calculate_item_area(media)
  media.each do |array|
    array[2] * array[3]
  end
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
  height = gets.chomp
    if height == "q"
      break
    end
  puts "enter width"
  width = gets.chomp
    if width == "q"
      break
    end
  create_media_item(db, name, height, width)
end

media = db.execute("SELECT * FROM media_table")

calculate_item_area(media)

