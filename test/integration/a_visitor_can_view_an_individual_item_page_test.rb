require 'test_helper'

class AVisitorCanViewAnIndividualItemPageTest < ActionDispatch::IntegrationTest
  test 'a visitor will see full details of a product when they click view item' do
    item = Item.create(name: 'gnar possum',
                       description: 'a snowboard for shredding gnar pow',
                       price: 1000)

    visit items_path

    click_link('View Item')

    assert_equal current_path, item_path(item.id)

    assert page.has_content?('GNAR POSSUM')
    assert page.has_content?('A snowboard for shredding gnar pow')
  end
end
