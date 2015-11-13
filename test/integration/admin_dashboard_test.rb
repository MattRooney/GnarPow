require "test_helper"

class AdminDashboardTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees dashboard page' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_dashboard_path(admin)
    save_and_open_page
    assert page.has_content?("Welcome, Admin!")
  end
end
