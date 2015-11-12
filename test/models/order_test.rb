require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "a new order with all attributes is valid" do
    order = Order.new(current_status: "completed")

    assert order.valid?
  end

  test "a new order is not valid without a current status" do
    order = Order.new()

    assert order.invalid?
  end

  test "a new order is not valid without one of the approved statuses" do
    invalid_order = Order.new(current_status: "gnar-rad")
    valid_order = Order.new(current_status: "paid")

    assert invalid_order.invalid?
    assert valid_order.valid?
  end

  test "an order has many items" do
    skip
    item = Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       image_file_name: 'hi.png')

    order = Order.new(current_status: "completed",
                       total_price: 1000)

  end

  test "a user can have one order" do
    skip
    user = User.create(username: "Matt", password: "password")

  end

  test "a user can have many orders" do
    skip
  end

end
