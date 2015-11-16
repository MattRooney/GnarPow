require 'test_helper'

class AnItemCanBeRemovedFromCartTest < ActionDispatch::IntegrationTest
  test 'item can be removed from cart' do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)

    visit items_path
    click_link 'Add To Cart'
    click_link 'go-to-cart'
    assert_equal current_path, cart_path

    click_link 'Remove Item'
    refute page.has_content?('Gnar possum')
    refute page.has_content?('1000')
  end

  test 'user is redirected to /cart after removing an item' do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)

    visit items_path
    click_link 'Add To Cart'
    click_link 'go-to-cart'

    assert_equal current_path, cart_path

    click_link 'Remove Item'

    assert_equal current_path, cart_path
  end

  test "a green message of 'Successfully removed SOME_ITEM from your cart.' appears after removing an item" do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)

    visit items_path
    click_link 'Add To Cart'
    click_link 'go-to-cart'

    assert_equal current_path, cart_path

    click_link 'Remove Item'
    within('.flash_remove') do
      assert page.has_content?('You have removed the item: (gnar possum) from your cart.')
    end
  end
end
