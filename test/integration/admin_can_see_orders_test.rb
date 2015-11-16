require 'test_helper'

class AdminCanSeeOrdersTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test 'logged in admin sees dashboard page with orders' do
    admin = User.create(username: "admin",
                        password: "password",
                        role:      1)
    create_items_associated_with_orders
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit login_path
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_button "Login"
    save_and_open_page
    assert page.has_content?("Welcome, Admin!")
    assert page.has_content?("Orders")
    assert page.has_content?("Status")
  end
end
