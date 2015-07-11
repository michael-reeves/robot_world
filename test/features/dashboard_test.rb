require_relative '../test_helper'


class DashboardTest < FeatureTest
  def test_user_can_see_the_dashboard
    visit '/'

    assert page.has_content? 'Average Robot Age'
  end

end
