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

