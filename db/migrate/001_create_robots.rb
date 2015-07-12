require 'sequel'
require 'sqlite3'

environments = %w{ test development }

environments.each do |environment|
  Sequel.sqlite("db/robot_directory_#{environment}.sqlite3").create_table(:robots) do
    primary_key :id
    String      :name
    String      :city
    String      :planet
    DateTime    :birthdate
    DateTime    :hire_date
    String      :category
  end

  puts "creating #{environment} database table robots"
end
