require 'test_helper'

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "user can view one past order" do
    user = User.create(username: "Matt", password: "password")
    user.orders.create(current_status: "completed")

    visit user_orders_path(user)

    assert page.has_content?("Your Orders")
    assert page.has_content?("completed")
  end

  test "user can view a list of all past orders" do
    user = User.create(username: "Matt", password: "password")
    user.orders.create(current_status: "completed")
    user.orders.create(current_status: "paid")

    visit user_orders_path(user)

    assert page.has_content?("Your Orders")
    assert page.has_content?("completed")
    assert page.has_content?("paid")

  end
end
