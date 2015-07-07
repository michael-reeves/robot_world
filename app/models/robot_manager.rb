require 'yaml/store'
require_relative 'robot'

class RobotManager

  def self.database
    @database ||= YAML::Store.new("db/robot_directory")
  end

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

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |properties| Robot.new(properties) }
  end
end
