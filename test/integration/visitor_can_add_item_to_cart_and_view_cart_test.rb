require 'test_helper'

class VisitorCanAddItemToCartAndViewCartTest < ActionDispatch::IntegrationTest
  test 'visitor can add item to cart' do
    skip
    visit items_path

  end
  test 'visitor can view cart with selected items' do
    skip
    visit cart_path

  end
end
