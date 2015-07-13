require_relative '../test_helper'

class UpdateRobotTest < FeatureTest

  def test_user_can_update_a_robot
    robot1 = RobotManager.create( name:      "C-3PO",
                                  city:      "Mos Eisley",
                                  planet:    "Tatooine",
                                  birthdate: '1/2/1976',
                                  hire_date: "3/4/2014",
                                  category:  "Protocol"
                                )
    visit '/robots'
    click_link 'edit'

    assert page.has_content? 'Edit Robot'

    fill_in('Name', with: 'R2-D2')
    fill_in('City', with: 'Denver')
    fill_in('Planet', with: 'Earth')
    fill_in('Birthdate', with: '4/1/2000')
    fill_in('Hire Date', with: '5/2/2015')
    select('Astro Mech', from: 'Type')

    click_button 'Update'

    assert_equal "/robots/#{robot1.id}", current_path

    assert page.has_content? 'R2-D2'
    assert page.has_content? 'Denver'
    assert page.has_content? 'Earth'
    assert page.has_content? '2000-01-04'
    assert page.has_content? '2015-02-05'
    assert page.has_content? 'Astro Mech'
  end

end
