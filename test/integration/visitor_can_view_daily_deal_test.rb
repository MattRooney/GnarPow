require 'test_helper'

class VisitorCanViewDailyDealTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test 'a visitor can view daily deal item on homepage' do
    create_featured_item
    visit '/'
    
    assert page.has_content?("Today's Gnarliest Item!")
    assert page.has_content?('GNAR POSSUM')
    assert page.has_content?('$1000')
  end
end
