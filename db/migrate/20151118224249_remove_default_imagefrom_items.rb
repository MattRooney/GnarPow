class RemoveDefaultImagefromItems < ActiveRecord::Migration
  def change
    change_column_default(:items, :image_file_name, nil)
  end
end
