require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test "visitor lands on homepage with slider" do
    visit '/'

    assert page.has_content?("Welcome to GnarPow")
  end
end
