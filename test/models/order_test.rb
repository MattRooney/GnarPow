require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'an order can have one item' do
    user = User.create(username: 'Matt', password: 'password')
    item = Item.create(name: 'gnar possum',
                       description: 'a snowboard for shredding gnar pow',
                       price: 1000)

    item.orders.create(current_status: 'completed',
                       total_price: 1000,
                       user_id: user.id)

    assert_equal 1, item.orders.count
  end

  test 'an order belongs to a user' do
    user = User.create(username: 'Matt', password: 'password')

    user.orders.create(current_status: 'completed')

    assert_equal 1, user.orders.count
    assert_equal 'completed', user.orders.first.current_status
  end

  test 'a user can have many orders' do
    user = User.create(username: 'Matt', password: 'password')

    user.orders.create(current_status: 'completed')
    user.orders.create(current_status: 'paid')
    user.orders.create(current_status: 'ordered')

    assert_equal 3, user.orders.count
    assert_equal 'completed', user.orders.first.current_status
    assert_equal 'ordered', user.orders.last.current_status
  end

    # test "a cart can be saved as an order" do
    #   cart = Cart.new( { "1" => 3, "2" => 1, "3" => 3 })
    #   order = Order.create(cart)
    #
    #   assert_equal 1,
  end

# test "a new order with all attributes is valid" do
#   order = Order.new(current_status: "completed")
#
#   assert order.valid?
# end
#
# test "a new order is not valid without a current status" do
#   order = Order.new()
#
#   assert order.invalid?
# end
#
# test "a new order is not valid without one of the approved statuses" do
#   invalid_order = Order.new(current_status: "gnar-rad")
#   valid_order = Order.new(current_status: "paid")
#
#   assert invalid_order.invalid?
#   assert valid_order.valid?
# end
#
# test "an order has an item" do
#   item = Item.create({name: "gnar possum",
#                      description: "a snowboard for shredding gnar pow",
#                      price: 1000,
#                      image_file_name: 'hi.png'})
#
#   order = Order.create({current_status: "completed"})
#
#   order.items.create(item)
#
#   assert_equal 1, order.items.count
# end
#
# test "an order has many items" do
#   skip
#   item = Item.create(name: "gnar possum",
#                      description: "a snowboard for shredding gnar pow",
#                      price: 1000,
#                      image_file_name: 'hi.png')
#
#   order = Order.new(current_status: "completed",
#                      total_price: 1000)
#
# end
#
# test "a user can have one order" do
#   skip
#   user = User.create(username: "Matt", password: "password")
#
# end
#
# test "a user can have many orders" do
#   skip
# end
