
    ## pseudocode for scaled_width_calculator
    # based on largest painting set to 100% at desired width
    # takes desired_max_width, largest_width, width_to_scale
    # returns => scaled_width = (w_t_s / l_w) d_m_w

    ## pseudocode for scaled_height_calculator
    # takes return from scaled_width_calculator, aspect_ratio
    # returns => scaled_height = scaled_width (aspect_ratio)

def create_media_item(db, name, height, width, area, aspect_ratio)
  $db.execute("INSERT INTO media_table (name, height, width, area, aspect_ratio) VALUES (?, ?, ?, ?, ?)", [name, height, width, area, aspect_ratio])
end

def calculate_item_area(height, width)
  height * width
end

def calculate_item_aspect_ratio(height, width)
  aspect = height.to_f / width.to_f
  aspect = aspect.round(3)
end

def print_database
  media_table = $db.execute("SELECT id, name FROM media_table")
  puts "\n"
  puts "id: media name"
  media_table.each do |media_item|
    puts media_item.join(": ")
  end
  puts "\n"
end

def scaled_width_calculator(desired_max_width, largest_width, width_to_scale)
  scaled_width = (width_to_scale / largest_width) * desired_max_width
end

def scaled_height_calculator(scaled_width_calculator_return, aspect_ratio)
  scaled_height = scaled_width * aspect_ratio
end