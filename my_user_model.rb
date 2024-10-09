# my_user_model.rb
require 'sqlite3'

class User
  DB_NAME = 'db.sql'

  def initialize
    @db = SQLite3::Database.new(DB_NAME)
    create_table
  end

  def create_table
    @db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        firstname TEXT,
        lastname TEXT,
        age INTEGER,
        password TEXT,
        email TEXT
      );
    SQL
  end

  def create(user_info)
    @db.execute("INSERT INTO users (firstname, lastname, age, password, email) VALUES (?, ?, ?, ?, ?)",
                user_info[:firstname], user_info[:lastname], user_info[:age], user_info[:password], user_info[:email])
    @db.last_insert_row_id
  end

  def find(user_id)
    @db.get_first_row("SELECT * FROM users WHERE id = ?", user_id)
  end

  def all
    users = {}
    @db.execute("SELECT * FROM users") do |row|
      users[row[0]] = { firstname: row[1], lastname: row[2], age: row[3], password: row[4], email: row[5] }
    end
    users
  end

  def update(user_id, attribute, value)
    @db.execute("UPDATE users SET #{attribute} = ? WHERE id = ?", value, user_id)
    find(user_id)
  end

  def destroy(user_id)
    @db.execute("DELETE FROM users WHERE id = ?", user_id)
  end
end
