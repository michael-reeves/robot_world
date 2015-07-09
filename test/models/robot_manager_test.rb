require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  def test_it_create_a_robot
    RobotManager.create({ name:      'robot1',
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

  def test_it_gets_all_robots
    RobotManager.create({ name:      'robot1',
                          city:      'city1',
                          planet:    'planet1',
                          birthdate: '1/1/2000',
                          hire_date: '1/1/2015',
                          category:  'Astro Mech'
                        })
    RobotManager.create({ name:      'robot2',
                          city:      'city2',
                          planet:    'planet2',
                          birthdate: '2/2/2000',
                          hire_date: '2/2/2015',
                          category:  'Protocol'
                        })
    RobotManager.create({ name:      'robot3',
                          city:      'city3',
                          planet:    'planet3',
                          birthdate: '3/3/2000',
                          hire_date: '3/3/2015',
                          category:  'Medical'
                        })

    robots = RobotManager.all

    assert_equal 3, robots.count
    assert_equal 'Medical', robots.last.category
  end

  def test_it_finds_a_single_robot
    RobotManager.create({ name:      'robot1',
                          city:      'city1',
                          planet:    'planet1',
                          birthdate: '1/1/2000',
                          hire_date: '1/1/2015',
                          category:  'Astro Mech'
                        })
    RobotManager.create({ name:      'robot2',
                          city:      'city2',
                          planet:    'planet2',
                          birthdate: '2/2/2000',
                          hire_date: '2/2/2015',
                          category:  'Protocol'
                        })


    robot = RobotManager.find(1)

    assert_equal 'robot1', robot.name
  end

  def test_it_updates_a_robot
    RobotManager.create({ name:      'robot1',
                          city:      'city1',
                          planet:    'planet1',
                          birthdate: '1/1/2000',
                          hire_date: '1/1/2015',
                          category:  'Astro Mech'
                        })
    RobotManager.create({ name:      'robot2',
                          city:      'city2',
                          planet:    'planet2',
                          birthdate: '2/2/2000',
                          hire_date: '2/2/2015',
                          category:  'Protocol'
                        })

    update_info = { name:      'robot5',
                    city:      'city5',
                    planet:    'planet5',
                    birthdate: '2/2/2000',
                    hire_date: '2/2/2015',
                    category:  'Protocol'
                  }

    robot = RobotManager.find(2)
    assert_equal 'planet2', robot.planet

    RobotManager.update(2, update_info)

    robot = RobotManager.find(2)
    assert_equal 'planet5', robot.planet
  end

  def test_it_deletes_a_robot
    RobotManager.create({ name:      'robot1',
                          city:      'city1',
                          planet:    'planet1',
                          birthdate: '1/1/2000',
                          hire_date: '1/1/2015',
                          category:  'Astro Mech'
                        })
    RobotManager.create({ name:      'robot2',
                          city:      'city2',
                          planet:    'planet2',
                          birthdate: '2/2/2000',
                          hire_date: '2/2/2015',
                          category:  'Protocol'
                        })
    RobotManager.create({ name:      'robot3',
                          city:      'city3',
                          planet:    'planet3',
                          birthdate: '3/3/2000',
                          hire_date: '3/3/2015',
                          category:  'Protocol'
                        })

    assert_equal 3, RobotManager.count

    RobotManager.delete(2)
    assert_equal 2, RobotManager.count
    assert_equal 'robot3', RobotManager.all.last.name
  end

end
