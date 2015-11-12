require 'test_helper'

class RegisteredUserCanViewPastOrderDetailsTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test 'user can view past order details' do
    create_categories_and_items
    current_user = User.create(username: "Matt", password: "gnargnar")
    visit login_path

    within(".login_form") do
      fill_in "Username", with: "Matt"
      fill_in "Password", with: "gnargnar"
      click_button "Login"
    end


    order = current_user.orders.create(current_status: "ordered",
                                       total_price: 1335)

    visit orders_path(current_user)
    click_link "View Order"


    assert_equal order_path(order), current_path
    save_and_open_page
    
    assert page.has_content?("Order Number")
    assert page.has_content?("Order Status")
    assert page.has_content?("Total")
    assert page.has_content?("Submitted on")
  end
end
