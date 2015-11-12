require 'test_helper'

class RegisteredUserCanViewPastOrderDetailsTest < ActionDispatch::IntegrationTest
  test 'user can view past order details' do
    skip
    user = User.create(username: "Matt", password: "password")
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)
    Item.create(name: "gwar possum",
                description: "a snowboard for shredding gnar pow",
                price: 15)
    Item.create(name: "hoody",
                description: "a snowboard for shredding gnar pow",
                price: 80)
    user.orders.create(current_status: "completed")

    visit user_orders_path(user)
    click_link "View Order"

    asserst_equal current_path, user_order_path(order_id)
    assert page.has_content?("Order Number")
    assert page.has_content?("completed")
  end
end
