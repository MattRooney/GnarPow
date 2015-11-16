require 'test_helper'

class AnAdminCanFilterOrdersByStatusTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test "the truth" do
    create_items_associated_with_orders
    admin = User.create(username: 'admin',
                        password: 'password',
                        role:      1)


    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_index_path(admin)

    save_and_open_page
  end
end
