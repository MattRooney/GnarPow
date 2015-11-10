require 'test_helper'

class AVisitorCanViewItemsByCategoryTest < ActionDispatch::IntegrationTest
  test 'a visitor can visit category page to see all items in category' do

    category     = Category.create(title: "Snowboards")
    category_two = Category.create(title: "Apparel")

    Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       category_id: category.id)
    Item.create(name: "gwar possum",
                       description: "a snowboard for gwar concerts",
                       price: 15,
                       category_id: category.id)
    Item.create(name: "Sweet Jacket",
                       description: "Keeps you warm",
                       price: 240,
                       category_id: category_two.id)
    Item.create(name: "Hoody",
                       description: "Keeps you slightly warm",
                       price: 80,
                       category_id: category_two.id)

    visit category_path(category.id)
    save_and_open_page

    assert page.has_content?("Snowboards")
  end
end
