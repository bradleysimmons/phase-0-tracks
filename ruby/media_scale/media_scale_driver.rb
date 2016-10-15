require "sqlite3"
require_relative "media_scale"


db = SQLite3::Database.new("media.db")

db.execute(create_table_command)

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
    puts "enter id of media item to scale (or 0 to scale all):"
    id_to_scale = gets.chomp
      if id_to_scale == "0"
        id_to_scale_query = db.execute("SELECT name, width, aspect_ratio FROM media_table")
      else
        id_to_scale_query = db.execute("SELECT name, width, aspect_ratio FROM media_table WHERE id=#{id_to_scale}")
      end
    puts "enter desired width of largest media item:"
    desired_max_width = gets.chomp.to_f

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

  if option == "4"
    break
  end

end