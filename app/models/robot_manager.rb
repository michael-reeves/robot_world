require 'yaml/store'
require_relative 'robot'

class RobotManager

  def self.database
    @database ||= YAML::Store.new("db/robot_directory")
  end

  # Create
  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['counter']  ||= 0
      database['counter']   += 1
      database['robots'] << { "id"        => database['counter'],
                              "avatar"    => "http://robohash.org/#{database['counter']}",
                              "name"      => robot[:name],
                              "city"      => robot[:city],
                              "planet"    => robot[:planet],
                              "birthdate" => robot[:birthdate],
                              "hire_date" => robot[:hire_date],
                              "category"  => robot[:category]
                            }
    end
  end

  # Read
  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |properties| Robot.new(properties) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot['id'] == id }
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  # Update
  def self.update(id, robot)
    database.transaction do
      target = database['robots'].find { |record| record['id'] == id}
      target['name']      = robot[:name]
      target['city']      = robot[:city]
      target['planet']    = robot[:planet]
      target['birthdate'] = robot[:birthdate]
      target['hire_date'] = robot[:hire_date]
      target['category']  = robot[:category]
    end
  end

end
