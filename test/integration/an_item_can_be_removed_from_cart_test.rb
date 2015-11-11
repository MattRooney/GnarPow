require 'test_helper'

class AnItemCanBeRemovedFromCartTest < ActionDispatch::IntegrationTest
  test 'item can be removed from cart' do
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)

    visit items_path
    click_link "Add To Cart"
    click_link "Cart"
    assert_equal current_path, cart_path

    click_link "Remove Item"
    refute page.has_content?("Gnar possum")
    refute page.has_content?("1000")
  end
end
