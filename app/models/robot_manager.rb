require 'yaml/store'

class RobotManager

  def self.database
    if ENV['TASK_MANAGER_ENV'] == 'test'
      @database ||= Sequel.sqlite('db/robot_directory_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/robot_directory_development.sqlite3')
    end
  end

  # Create
  def self.create(robot)
    begin
      dataset.insert( name:      robot[:name],
                      city:      robot[:city],
                      planet:    robot[:planet],
                      birthdate: robot[:birthdate],
                      hire_date: robot[:hire_date],
                      category:  robot[:category]
                    )
    rescue
      return false
    end

    Robot.new(dataset.last)
  end

  # Read
  def self.all
    dataset.to_a.map { |record| Robot.new(record)  }
  end

  def self.find(id)
    all.find { |robot| robot.id == id }
  end

  # Update
  def self.update(id, robot)
    dataset.where(id: id).update(robot)
  end

  # Delete
  def self.delete(id)
    dataset.where(id: id).delete
  end


  # Dashboard Features
  def self.count
    dataset.count
  end

  def self.average_age
    sum = all.reduce(0) do |tot, robot|
      tot + ((Date.today - Date.parse(robot.birthdate)).to_i / 365.25)
    end

    "%0.2f" % ( sum / count ) unless count == 0
  end

  def self.robots_by_hired_year
    all.group_by { |robot| Date.parse(robot.hire_date).year }
  end

  def self.robots_by_category
    all.group_by(&:category)
  end

  # Testing
  def self.delete_all
    dataset.truncate
  end

  def self.dataset
    database.from(:robots).order(:id)
  end
end
