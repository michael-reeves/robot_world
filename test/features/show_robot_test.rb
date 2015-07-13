require_relative "../test_helper"

class ShowRobotTest < FeatureTest

  def test_user_can_see_the_robot_show_page
    robot1 = RobotManager.create( name:      "C-3PO",
                                  city:      "Mos Eisley",
                                  planet:    "Tatooine",
                                  birthdate: '1/2/1976',
                                  hire_date: "3/4/2014",
                                  category:  "Protocol"
                                )

    visit '/robots'

    find(:xpath, "//a[@href='/robots/#{robot1.id}']").click
    assert page.has_content? 'C-3PO'
  end

end
