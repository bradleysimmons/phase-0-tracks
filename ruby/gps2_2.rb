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

grocery_list = list_creator("Michael Bradley")

p grocery_list

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

p add_item(grocery_list, "Helin", 5)


# Method to remove an item from the list
# input: hash, item name
# steps: use item name to delete from hash
# output: updated hash



# Method to update the quantity of an item
# input:
# steps:
# output:

# Method to print a list and make it look pretty
# input:
# steps: Iterate through hash and print each individual key/value pairs 
# output:
