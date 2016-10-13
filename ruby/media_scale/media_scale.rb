# media scale

# web design tool for representing scale properties of tangible media
# in a web format

# enter paintings and information into database
# calculate surface area of tangible paintings using dimensions
# find greatest surface area of all entered paintings
# collect user input for desired image size on web
# return scaled dimensions for all paintings

require "sqlite3"

db = SQLite3::Database.new("paintings.db")

