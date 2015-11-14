require 'test_helper'

class VisitorCannotViewOrdersAndAdminViewsTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test "an unauthenticated user cannot view any orders" do
    create_categories_items_user_order_and_login

    visit "/orders"

    assert page.has_content?("Your Orders")
    assert page.has_content?("ordered")

    click_link("View Order")
    within(".orders-table") do
      assert page.has_content?("$2000")
      assert page.has_content?("Gnar possum")
    end
    click_link("Logout")

    visit "/orders"

    assert page.has_content?("404")
  end

  test "an unauthenticated user cannot view a users cart" do
    skip
  end

  test "an unauthenticated user cannot view a users dashboard" do
    skip
  end

  test "an unauthenticated user cannot view admin dashboard" do
    skip
  end

  test "an unauthenticated user cannot make themselve an admin" do
    skip
  end
end
