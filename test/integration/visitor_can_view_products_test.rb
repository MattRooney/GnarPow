require 'test_helper'

class VisitorCanViewProductsTest < ActionDispatch::IntegrationTest

  test 'a user can view items' do
    item = Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: 1000)
    item = Item.create(name: "gwar possum",
                       description: "a snowboard for gwar concerts",
                       price: 15)

    visit items_path

    assert page.has_content?("Snowboards")
    assert page.has_content?("GNAR POSSUM")
    assert page.has_content?("GWAR POSSUM")
  end

end
