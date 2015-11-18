require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test 'visitor lands on homepage with slider' do
    create_featured_item
    visit '/'

    assert page.has_content?('Welcome to GnarPow')
  end
end
