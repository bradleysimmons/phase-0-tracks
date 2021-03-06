# GPS Pairing 2.2

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
# Split the string into individual items (array)
# Create an empty data structure (hash) 
# Iterate through array and push each item into our empty hash
  # set default quantity to 0 
  # Iterate through hash and print each individual key/value pairs 
# output: [hash]

def list_creator(items)

    items_array = items.split(' ')

    items_hash = {}

    items_array.each do |item|
        items_hash[item] = 0 
    end  

    items_hash
end 

# Method to add an item to a list
# input: hash, item name , optional quantity
# steps: 
# use item argument to represet hash key 
# use quantity argument to set value of the key
# output: return updated hash 

def add_item(hash, item, quantity)

    hash[item] = quantity.to_i 

    return hash
end 

# Method to remove an item from the list
# input: hash, item name
# steps: use item name to delete from hash
# output: updated hash

def remove_item(hash, item)
    hash.delete(item)
    return hash
end

# Method to update the quantity of an item
# input: hash, item name, quantity
# steps: use new quantity to update value of item name
# output: updated hash

def update_quantity(hash, item, quantity)
    hash[item] = quantity
    return hash
end


# Method to print a list and make it look pretty
# input: hash
# steps: Iterate through hash and print each individual key/value pairs 
# output: pretty list

def print_list(hash)
    hash.each do |item, quantity|
    puts "#{item}: #{quantity}"
    end
end

# Driver Code 

grocery_list = list_creator("Apples")

add_item(grocery_list, "Lemonade", 2)
add_item(grocery_list, "Tomatos", 3)
add_item(grocery_list, "Onions", 1)
add_item(grocery_list, "Ice_Cream", 4)

remove_item(grocery_list, "Lemonade")

update_quantity(grocery_list, "Ice_Cream", 1)

print_list(grocery_list)