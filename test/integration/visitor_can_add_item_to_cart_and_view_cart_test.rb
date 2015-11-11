require 'test_helper'

class VisitorCanAddItemToCartAndViewCartTest < ActionDispatch::IntegrationTest
  test 'visitor can add item to cart from index' do
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)

    visit items_path
    assert page.has_content?("Cart: 0")
    click_link "Add To Cart"

    assert page.has_content?("You now have 1 gnar possum in your cart.")
    assert page.has_content?("Cart: 1")

    click_link "Add To Cart"
    assert page.has_content?("You now have 2 gnar possums in your cart.")
    assert page.has_content?("Cart: 2")

  end

  test 'visitor can add item to cart from show page' do
    skip
     Item.create(name: "gnar possum",
                 description: "a snowboard for shredding gnar pow",
                 price: 1000)
    visit items_path
    click_button "VIEW ITEM"
    click_link "Add To Cart"

    within(".cart") do
      assert page.has_content?(1)
    end
  end
  test 'visitor can view cart with selected items' do
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)
    visit items_path

    click_link "Add To Cart"
    click_link "Cart"
    assert_equal current_path, cart_path
    assert page.has_content?("Gnar possum")
    assert page.has_content?("1000")
  end
end
