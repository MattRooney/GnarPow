require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test 'guest can create an account' do
    create_featured_item
    visit '/'
    click_link 'Login'
    click_link 'Create an account'

    fill_in 'Username', with: 'Matt'
    fill_in 'Password', with: 'gnargnar'
    click_button 'Create Account'

    assert page.has_content?('Logged in as Matt')
  end
end
