require 'test_helper'

class VisitorCanViewProductsTest < ActionDispatch::IntegrationTest

  test 'a user can view items' do
    visit items_path

    assert page.has_content?("Snowboards")
  end
end
