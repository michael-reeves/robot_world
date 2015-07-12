class Robot
  attr_reader :id,
              :name,
              :city,
              :planet,
              :birthdate,
              :hire_date,
              :category

  def initialize( properties )
    @id        = properties[:id]
    @name      = properties[:name]
    @city      = properties[:city]
    @planet    = properties[:planet]
    @birthdate = properties[:birthdate]
    @hire_date = properties[:hire_date]
    @category  = properties[:category]
  end
end
