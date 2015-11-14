require 'test_helper'

class VisitorCanAddItemToCartAndViewCartTest < ActionDispatch::IntegrationTest
  test 'visitor can add item to cart from index' do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)

    visit items_path
    assert page.has_content?('Cart: 0')
    click_link 'Add To Cart'

    assert page.has_content?('You now have 1 gnar possum in your cart.')
    assert page.has_content?('Cart: 1')

    click_link 'Add To Cart'
    assert page.has_content?('You now have 2 gnar possums in your cart.')
    assert page.has_content?('Cart: 2')
  end

  test 'visitor can add item to cart from show page' do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)
    visit items_path
    click_link 'View Item'
    click_link 'Add To Cart'

    assert page.has_content?('Cart: 1')
  end

  test 'visitor can view cart with selected items' do
    Item.create(name: 'gnar possum',
                description: 'a snowboard for shredding gnar pow',
                price: 1000)
    visit items_path

    click_link 'Add To Cart'
    click_link 'go-to-cart'

    assert_equal current_path, cart_path
    assert page.has_content?('Gnar possum')
    assert page.has_content?('1000')
  end

  test 'visitor can view cart with multiple items' do
    item_1 = Item.create(name: 'gnar possum',
                         description: 'a snowboard for shredding gnar pow',
                         price: 1000)
    item_2 = Item.create(name: 'gnar possum',
                         description: 'a snowboard for shredding gnar pow',
                         price: 1000)
    item_3 = Item.create(name: 'Sweet Jacket',
                         description: 'Keeps you warm',
                         price: 240)

    visit items_path
    within("#item_#{item_1.id}") do
      click_link 'Add To Cart'
    end
    within("#item_#{item_2.id}") do
      click_link 'Add To Cart'
    end
    within("#item_#{item_3.id}") do
      click_link 'Add To Cart'
    end

    click_link 'go-to-cart'
    assert_equal current_path, cart_path
    assert page.has_content?('Gnar possum')
    assert page.has_content?('1000')
    assert page.has_content?('Gnar possum')
    assert page.has_content?('1000')
    assert page.has_content?('2')
    assert page.has_content?('Sweet jacket')
    assert page.has_content?('240')
  end
end
