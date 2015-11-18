require 'test_helper'

class VisitorCanViewDailyDealTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test 'a visitor can view daily deal item on homepage' do
    create_items

    visit '/'

    assert page.has_content?('Gnarliest Deal of the Day!')
    assert page.has_content?('GNAR POSSUM')
    assert page.has_content?('$700')
    assert page.has_content?('30% OFF!')
  end
end
