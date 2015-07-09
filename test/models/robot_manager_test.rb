require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  def test_it_create_a_robot
    RobotManager.create({ id:        1,
                          name:      'robot1',
                          city:      'city1',
                          planet:    'planet1',
                          birthdate: '1/1/2000',
                          hire_date: '1/1/2015',
                          category:  'Astro Mech'
                        })

    robot = RobotManager.find(1)

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
