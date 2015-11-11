require 'test_helper'

class VisitorCanAddItemToCartAndViewCartTest < ActionDispatch::IntegrationTest
  test 'visitor can add item to cart from index' do
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)

    visit items_path
    click_link "Add to cart"

    within(".cart") do
      assert page.has_content?(1)
    end
  end
  test 'visitor can add item to cart from show page' do
    skip
     Item.create(name: "gnar possum",
                 description: "a snowboard for shredding gnar pow",
                 price: 1000)
    visit items_path
    click_button "View Item"
    click_link "Add to cart"

    within(".cart") do
      assert page.has_content?(1)
    end
  end
  test 'visitor can view cart with selected items' do
    skip
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)
    visit items_path

    click_button "Add to cart"
    click_button "Cart"
    assert_equal current_path, cart_path
    assert page.has_content?("Gnar Possum")
    assert page.has_content?("1000")
  end
end
