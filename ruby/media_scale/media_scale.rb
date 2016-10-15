########## media scale

# tool for translating scale of tangible media to a web format

# enter paintings information into database
# calculate surface area of paintings
# calculate aspect ratio of paintings
# find painting with greatest surface area
# collect user input for desired max width of image on web
# return scaled dimensions for all paintings 
# in proportion to largest painting

require "sqlite3"

########## create database and table

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

########## pseudocode and methods

    ## pseudocode for scaled_width_calculator
    # based on largest painting set to 100% at desired width
    # takes desired_max_width, largest_width, width_to_scale
    # returns => scaled_width = (w_t_s / l_w) d_m_w

    ## pseudocode for scaled_height_calculator
    # takes return from scaled_width_calculator, aspect_ratio
    # returns => scaled_height = scaled_width (aspect_ratio)

def create_media_item(db, name, height, width, area, aspect_ratio)
  db.execute("INSERT INTO media_table (name, height, width, area, aspect_ratio) VALUES (?, ?, ?, ?, ?)", [name, height, width, area, aspect_ratio])
end

def calculate_item_area(height, width)
  height * width
end

def calculate_item_aspect_ratio(height, width)
  (height.to_f / width.to_f).round(3)
end

def print_database(database)
  media_table = database.execute("SELECT id, name FROM media_table")
  puts "\n"
  puts "id: media name"
  media_table.each do |media_item|
    puts media_item.join(": ")
  end
  puts "\n"
end

def scaled_width_calculator(desired_max_width, largest_width, width_to_scale)
  ((width_to_scale / largest_width) * desired_max_width).round(3)
end

def scaled_height_calculator(scaled_width, aspect_ratio)
  (scaled_width * aspect_ratio).round(3)
end

########## driver code

puts "########## media scale"

until

  puts "\n"
  puts "select option:"
  puts "1: input media to database"
  puts "2: view database"
  puts "3: calculate scaled dimensions"
  puts "4: exit"
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

  if option == "2"
    print_database(db)
  end

  if option == "3"
    max_area = db.execute("SELECT width, MAX(area) FROM media_table")
    max_area = max_area.flatten
    largest_width = max_area[0].to_f
    print_database(db)
    puts "enter id of media item to scale:"
    id_to_scale = gets.chomp
    id_to_scale_query = db.execute("SELECT width, aspect_ratio FROM media_table WHERE id=#{id_to_scale}")
    id_to_scale_query = id_to_scale_query.flatten
    width_to_scale = id_to_scale_query[0]
    aspect_ratio = id_to_scale_query[1]
    puts "enter desired width of largest media item:"
    desired_max_width = gets.chomp.to_f
    scaled_width = scaled_width_calculator(desired_max_width, largest_width, width_to_scale)
    scaled_height = scaled_height_calculator(scaled_width, aspect_ratio)
    puts "scaled height: #{scaled_height}"
    puts "scaled width: #{scaled_width}"
  end

  if option == "4"
    break
  end

end