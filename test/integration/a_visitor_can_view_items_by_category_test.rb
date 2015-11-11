require 'test_helper'

class AVisitorCanViewItemsByCategoryTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup

  test 'a visitor can visit category page to see all items in category' do
    create_categories_and_items

    visit category_path(@category.slug)

    assert page.has_content?("Snowboards")

    within(".items") do
      assert page.has_content?("Name: GNAR POSSUM")
      assert page.has_content?("Description: A snowboard for shredding gnar
                               pow")
      assert page.has_content?("Price: $1000")
      assert page.has_content?("Name: GWAR POSSUM")
      assert page.has_content?("Description: A snowboard for gwar concerts")
      assert page.has_content?("Price: $15")
      refute page.has_content?("Apparel")
      refute page.has_content?("Name: SWEET JACKET")
      refute page.has_content?("Keeps you warm")
      refute page.has_content?("Price: $240")
      refute page.has_content?("Name: HOODY")
      refute page.has_content?("Keeps you slightly warm")
      refute page.has_content?("Price: $80")
    end

    visit category_path(@category_two.slug)

    assert page.has_content?("Apparel")

    within(".items") do
      assert page.has_content?("Name: SWEET JACKET")
      assert page.has_content?("Keeps you warm")
      assert page.has_content?("Price: $240")
      assert page.has_content?("Name: HOODY")
      assert page.has_content?("Keeps you slightly warm")
      assert page.has_content?("Price: $80")
      refute page.has_content?("Snowboards")
      refute page.has_content?("Name: GNAR POSSUM")
      refute page.has_content?("Description: A snowboard for shredding gnar
                               pow")
      refute page.has_content?("Price: $1000")
      refute page.has_content?("Name: GWAR POSSUM")
      refute page.has_content?("Description: A snowboard for gwar concerts")
      refute page.has_content?("Price: $15")
    end
  end
end
