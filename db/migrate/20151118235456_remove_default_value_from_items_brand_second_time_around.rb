class RemoveDefaultValueFromItemsBrandSecondTimeAround < ActiveRecord::Migration
  def change
    change_column_default(:items, :brand, nil)
  end
end
