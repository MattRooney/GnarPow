require 'test_helper'

class AdminCanTransitionOrderStatusTest < ActionDispatch::IntegrationTest
  include CategoryItemsSetup
  test "admin can transition order status from ordered to cancel test" do
      admin_order_setup('completed')

      within("#order_#{Order.last.id}") do
        assert page.has_content?('completed')
        assert page.has_link?('View Order')
        assert page.has_link?('Cancel')
        click_link('Cancel')
      end

      assert admin_dashboard_index_path, current_path

      within("#order_#{Order.last.id}") do
        assert page.has_content?('canceled')
        refute page.has_link?('Cancel')
      end

    end

    test "admin can transition order status from paid to cancel test" do
        admin_order_setup('paid')

        within("#order_#{Order.last.id}") do
          assert page.has_content?('paid')
          assert page.has_link?('View Order')
          assert page.has_link?('Cancel')
          click_link('Cancel')
        end
        
        assert admin_dashboard_index_path, current_path

        within("#order_#{Order.last.id}") do
          assert page.has_content?('canceled')
          refute page.has_link?('Cancel')
        end

      end
end
