require_relative '../test_helper'

class NewRobotTest < FeatureTest

  def test_users_can_create_new_robots
    visit '/'

    click_link 'New Robot'

    assert_equal '/robots/new', current_path

    fill_in('Name', with: 'R2-D2')
    fill_in('City', with: 'Mos Eisley')
    fill_in('Planet', with: 'Tatooine')
    fill_in('Birthdate', with: '1/1/2000')
    fill_in('Hire Date', with: '2/2/2015')
    select('Astro Mech', from: 'Type')

    click_button 'Create'
    assert_equal '/robots', current_path
    assert       page.has_content? 'R2-D2'

    id = first("a li").text
    click_link 'R2-D2'
    assert_equal "/robots/#{id}", current_path
    assert       page.has_content? "#{id}"
    assert       page.has_content? 'R2-D2'
    assert       page.has_content? 'Mos Eisley'
    assert       page.has_content? 'Tatooine'
    assert       page.has_content? 'Astro Mech'
  end

end
