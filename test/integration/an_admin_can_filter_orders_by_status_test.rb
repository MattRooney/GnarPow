require 'test_helper'

class AnAdminCanFilterOrdersByStatusTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test "the truth" do
    admin = User.create(username: 'admin',
                        password: 'password',
                        role:      1)

    create_items_associated_with_orders


    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_index_path(admin)
    click_link("View Ordered")
    save_and_open_page
  end
end
