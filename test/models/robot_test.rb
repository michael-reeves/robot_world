require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({ 'id'        => 1,
                        'avatar'    => 'http://robohash.org/1',
                        'name'      => 'robot1',
                        'city'      => 'city1',
                        'planet'    => 'planet1',
                        'birthdate' => '1/1/2000',
                        'hire_date' => '1/1/2015',
                        'category'  => 'Astro Mech'
                      })

    assert_equal "http://robohash.org/1", robot.avatar
    assert_equal "robot1",                robot.name
    assert_equal "city1" ,                robot.city
    assert_equal "planet1",               robot.planet
    assert_equal "1/1/2000",              robot.birthdate
    assert_equal "1/1/2015",              robot.hire_date
    assert_equal "Astro Mech",            robot.category
    assert_equal 1,                       robot.id
  end
end
