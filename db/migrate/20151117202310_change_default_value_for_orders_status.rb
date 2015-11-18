class ChangeDefaultValueForOrdersStatus < ActiveRecord::Migration
  def change
    change_column_default(:orders, :current_status, 'ordered')
  end
end
