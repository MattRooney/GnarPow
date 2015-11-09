require 'test_helper'

class VisitorCanViewProductsTest < ActionDispatch::IntegrationTest

  test 'a user can view items' do
    item = Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       image: "picture url")
    item = Item.create(name: "gwar possum",
                       description: "a snowboard for gwar concerts",
                       price: 15,
                       image: "gwar picture url")

    visit items_path

    save_and_open_page
    assert page.has_content?("Snowboards")
    assert page.has_content?("gnar possum")
    assert page.has_content?("gwar possum")
  end

end
