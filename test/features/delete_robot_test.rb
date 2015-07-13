require_relative '../test_helper'

class DeleteRobotTest < FeatureTest

  def test_user_can_delete_a_robot
    robot1 = RobotManager.create( name:      "C-3PO",
                                  city:      "Mos Eisley",
                                  planet:    "Tatooine",
                                  birthdate: '1/2/1976',
                                  hire_date: "3/4/2014",
                                  category:  "Protocol"
                                )
    robot2 = RobotManager.create( name:      "R2-D2",
                                  city:      "Swamp",
                                  planet:    "Dagobah",
                                  birthdate: '2/3/1977',
                                  hire_date: "3/4/2015",
                                  category:  "Astro Mech"
                                )
    visit '/robots'

    assert page.has_css? "li##{robot1.id}"
    assert page.has_css? "li##{robot2.id}"

    find(:xpath, "//form[@action='/robots/#{robot1.id}']").click_button 'delete'
    assert '/robots', current_path

    refute page.has_content? 'C-3PO'
  end

end
