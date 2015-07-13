require_relative '../test_helper'


class RobotsIndexTest < FeatureTest

  def test_user_sees_index_of_robots
    robot1 = RobotManager.create({ name:      "C-3PO",
                                   city:      "Mos Eisley",
                                   planet:    "Tatooine",
                                   birthdate: '1/2/1976',
                                   hire_date: "3/4/2014",
                                   category:  "Protocol"
                                 })
    robot2 = RobotManager.create({
                                   name:      "R2-D2",
                                   city:      "Swamp",
                                   planet:    "Dagobah",
                                   birthdate: '2/3/1977',
                                   hire_date: "3/4/2015",
                                   category:  "Astro Mech"
                                 })

    visit '/'
    click_link 'Robot Directory'

    assert_equal '/robots', current_path

    assert page.has_content? 'Robots'
    assert page.has_content? 'C-3PO'
    assert page.has_content? 'R2-D2'

  end

  def test_users_can_see_robot_avatars
    robot1 = RobotManager.create( name:      "C-3PO",
                                  city:      "Mos Eisley",
                                  planet:    "Tatooine",
                                  birthdate: '1/2/1976',
                                  hire_date: "3/4/2014",
                                  category:  'Protocol'
                                )
    robot2 = RobotManager.create( name:      'R2-D2',
                                  city:      "Swamp",
                                  planet:    "Dagobah",
                                  birthdate: '2/3/1977',
                                  hire_date: "3/4/2015",
                                  category:  'Astro Mech'
                               )
    visit '/robots'

    assert page.has_css?("#avatar#{robot1.id}")
    assert page.has_css?("#avatar#{robot2.id}")
  end

end
