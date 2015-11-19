class RemoveDefaultValueFromItemsBrand < ActiveRecord::Migration
  def change
    change_column_default(:items, :brand, 'nil')
  end
end
