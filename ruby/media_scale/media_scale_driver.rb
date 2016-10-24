require "sqlite3"
require_relative "media_scale.rb"

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
      create_media_item(DB, name, height, width, area, aspect_ratio)
    end
  end

  if option == "2"
    print_database(DB)
    puts "enter id of media item to delete (or \"q\" to quit):"
    id_to_delete = gets.chomp
    if id_to_delete == "q"
    else 
      DB.execute("DELETE FROM media_table WHERE id=#{id_to_delete}")
    end
  end

  if option == "3"
    print_database(DB)
  end

  if option == "4"
    max_area = DB.execute("SELECT width, MAX(area) FROM media_table")
    max_area = max_area.flatten
    largest_width = max_area[0].to_f
    print_database(DB)
    puts "enter id of media item to scale (or 0 to scale all):"
    id_to_scale = gets.chomp
      if id_to_scale == "0"
        id_to_scale_query = DB.execute("SELECT name, width, aspect_ratio FROM media_table")
      else
        id_to_scale_query = DB.execute("SELECT name, width, aspect_ratio FROM media_table WHERE id=#{id_to_scale}")
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
        min_width = DB.execute("SELECT MIN(width) FROM media_table")
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