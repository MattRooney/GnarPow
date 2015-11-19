require 'test_helper'

class VisitorCanViewDealPageTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test "visitor can view the daily deal page" do
    create_categories_and_items
    create_featured_item
    visit '/deal'

    assert page.has_content?("Today's Gnarliest Item!")
    assert page.has_content?("gnar possum")
    assert page.has_content?("$1000")

    click_link("Add To Cart")

    assert_equal "/items", current_path
  end
end
