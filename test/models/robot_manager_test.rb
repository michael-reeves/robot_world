require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  def test_it_creates_a_robot
    robot = RobotManager.create( name:      'robot1',
                                 city:      'city1',
                                 planet:    'planet1',
                                 birthdate: '31/1/2000',
                                 hire_date: '21/2/2015',
                                 category:  'Astro Mech'
                               )
    assert_equal "robot1",                robot.name
    assert_equal "city1" ,                robot.city
    assert_equal "planet1",               robot.planet
    assert_equal "31/01/2000",            robot.birthdate.strftime('%d/%m/%Y')
    assert_equal "21/02/2015",            robot.hire_date.strftime('%d/%m/%Y')
    assert_equal "Astro Mech",            robot.category
  end

  def test_it_gets_all_robots
    RobotManager.create( name:      'robot1',
                         city:      'city1',
                         planet:    'planet1',
                         birthdate: '31/1/2000',
                         hire_date: '21/1/2015',
                         category:  'Astro Mech'
                        )
    RobotManager.create( name:      'robot2',
                         city:      'city2',
                         planet:    'planet2',
                         birthdate: '22/2/2000',
                         hire_date: '22/2/2015',
                         category:  'Protocol'
                        )
    RobotManager.create( name:      'robot3',
                         city:      'city3',
                         planet:    'planet3',
                         birthdate: '30/3/2000',
                         hire_date: '30/3/2015',
                         category:  'Medical'
                        )

    robots = RobotManager.all

    assert_equal 3, robots.count
    assert_equal 'Medical', robots.last.category
  end

  def test_it_finds_a_single_robot
    robot = RobotManager.create( name:      'robot1',
                                 city:      'city1',
                                 planet:    'planet1',
                                 birthdate: '15/1/2000',
                                 hire_date: '15/1/2015',
                                 category:  'Astro Mech'
                               )
            RobotManager.create( name:      'robot2',
                                 city:      'city2',
                                 planet:    'planet2',
                                 birthdate: '21/2/2000',
                                 hire_date: '21/2/2015',
                                 category:  'Protocol'
                               )


    result = RobotManager.find(robot.id)

    assert_equal 'robot1', result.name
  end

  def test_it_updates_a_robot
    RobotManager.create( name:      'robot1',
                         city:      'city1',
                         planet:    'planet1',
                         birthdate: '16/1/2000',
                         hire_date: '16/1/2015',
                         category:  'Astro Mech'
                        )
    robot = RobotManager.create( name:      'robot2',
                                 city:      'city2',
                                 planet:    'planet2',
                                 birthdate: '22/2/2000',
                                 hire_date: '22/2/2015',
                                 category:  'Protocol'
                               )

    update_info = { name:      'robot5',
                    city:      'city5',
                    planet:    'planet5',
                    birthdate: '25/2/2000',
                    hire_date: '28/2/2015',
                    category:  'Protocol'
                  }

    robot = RobotManager.find(robot.id)
    assert_equal 'planet2',   robot.planet
    assert_equal '22/02/2000', robot.birthdate.strftime('%d/%m/%Y')
    assert_equal '22/02/2015', robot.hire_date.strftime('%d/%m/%Y')

    RobotManager.update(robot.id, update_info)

    result = RobotManager.find(robot.id)
    assert_equal 'planet5',   result.planet
    assert_equal '25/02/2000', result.birthdate.strftime('%d/%m/%Y')
    assert_equal '28/02/2015', result.hire_date.strftime('%d/%m/%Y')
  end

  def test_it_deletes_a_robot
    RobotManager.create( name:      'robot1',
                          city:      'city1',
                          planet:    'planet1',
                          birthdate: '1/1/2000',
                          hire_date: '1/1/2015',
                          category:  'Astro Mech'
                        )
    RobotManager.create( name:      'robot2',
                         city:      'city2',
                         planet:    'planet2',
                         birthdate: '2/2/2000',
                         hire_date: '2/2/2015',
                         category:  'Protocol'
                        )
    robot = RobotManager.create( name:      'robot3',
                                 city:      'city3',
                                 planet:    'planet3',
                                 birthdate: '3/3/2000',
                                 hire_date: '3/3/2015',
                                 category:  'Protocol'
                               )

    assert_equal 3, RobotManager.dataset.count

    RobotManager.delete(robot.id)
    assert_equal 2, RobotManager.dataset.count
    assert_equal 'robot2', RobotManager.all.last.name
  end

end
