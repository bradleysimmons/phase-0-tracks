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

def scale_ratio_calculator(largest_width, min_width, desired_max_width, desired_min_width)
  media_item_range = largest_width - min_width
  desired_scaled_range = desired_max_width - desired_min_width
  desired_scaled_range / media_item_range
end 

def scaled_width_in_range_calculator(width_to_scale, min_width, scale_ratio, desired_min_width)
  (((width_to_scale - min_width) * scale_ratio) + desired_min_width).round(3)
end

########## driver code

puts "########## media scale"
puts "## enter information for a collection of media items"
puts "## return scaled proportions for representation on the web"

until

  puts "\n"
  puts "select option:"
  puts "1: input media item to database"
  puts "2: delete media item from database"
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

  if option == "2"
    print_database(db)
    puts "enter id of media item to delete (or \"q\" to quit):"
    id_to_delete = gets.chomp
    if id_to_delete == "q"
    else 
      db.execute("DELETE FROM media_table WHERE id=#{id_to_delete}")
    end
  end

  if option == "3"
    print_database(db)
  end

  if option == "4"
    max_area = db.execute("SELECT width, MAX(area) FROM media_table")
    max_area = max_area.flatten
    largest_width = max_area[0].to_f
    print_database(db)
    puts "enter id of media item to scale (or 0 to scale all):"
    id_to_scale = gets.chomp
      if id_to_scale == "0"
        id_to_scale_query = db.execute("SELECT name, width, aspect_ratio FROM media_table")
      else
        id_to_scale_query = db.execute("SELECT name, width, aspect_ratio FROM media_table WHERE id=#{id_to_scale}")
      end

    puts "select a scaling option:"
    puts "1: by desired max width (true proportions)"
    puts "2: by desired max and min width (proportions in a range)"
    scaling_option = gets.chomp

    puts "enter desired width of largest media item:"
    desired_max_width = gets.chomp.to_f

      if scaling_option == "2"
        puts "enter desired width of smallest media item:"
        desired_min_width = gets.chomp.to_f
        min_width = db.execute("SELECT MIN(width) FROM media_table")
        min_width = min_width.join("").to_i
        scale_ratio = scale_ratio_calculator(largest_width, min_width, desired_max_width, desired_min_width)

          id_to_scale_query.each do |array|
            name = array[0]
            width_to_scale = array[1]
            aspect_ratio = array[2]
            scaled_width = scaled_width_in_range_calculator(width_to_scale, min_width, scale_ratio, desired_min_width)
            scaled_height = scaled_height_calculator(scaled_width, aspect_ratio)
            puts "\n"
            puts "media name: #{name}"
            puts "scaled height: #{scaled_height}; scaled width: #{scaled_width}"
          end
      else
        id_to_scale_query.each do |array|
          name = array[0]
        width_to_scale = array[1]
        aspect_ratio = array[2]
        scaled_width = scaled_width_calculator(desired_max_width, largest_width, width_to_scale)
        scaled_height = scaled_height_calculator(scaled_width, aspect_ratio)
        puts "\n"
        puts "media name: #{name}"
        puts "scaled height: #{scaled_height}; scaled width: #{scaled_width}"
        end
      end
  end

  if option == "5"
    break
  end

end