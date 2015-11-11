require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest

  test "guest can create an account" do
  visit "/"
  click_link "Login"
  click_link "Create an account"

  fill_in "Username", with: "Matt"
  fill_in "Password", with: "gnargnar"
  click_button "Create Account"

  assert page.has_content?("Logged in as Matt")
  end
end
# assert_equal current_path, user_path()
#
# within(".navbar-fixed")
# refute page.has_content?("Login")
# assert page.has_content?("Logout")
