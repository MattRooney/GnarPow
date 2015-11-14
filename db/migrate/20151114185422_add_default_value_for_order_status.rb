class AddDefaultValueForOrderStatus < ActiveRecord::Migration
  def change
    change_column_default(:orders, :current_status, "completed")
  end
end
