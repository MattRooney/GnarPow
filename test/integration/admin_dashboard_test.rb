require "test_helper"

class AdminDashboardTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees dashboard page' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_dashboard_path(admin)

    assert page.has_content?("Welcome, Admin!")
  end
  test 'default user does not see admin dashboard' do
    user = User.create(username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_dashboard_path(user)
    save_and_open_page

    refute page.has_content?("Welcome, Default_user!")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
