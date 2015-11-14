require 'test_helper'

class ACartItemsQuantityCanBeUpdatedTest < ActionDispatch::IntegrationTest
  test 'cart items quantity can be updated' do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)

    visit items_path
    click_link 'Add To Cart'
    click_link 'go-to-cart'
    assert_equal current_path, cart_path

    fill_in 'Quantity', with: 3
    click_button 'Update Quantity'
    assert page.has_content?('Gnar possum')
    assert page.has_content?('3000')
  end
end
