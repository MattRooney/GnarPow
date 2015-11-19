class AddDefaultImageToItems < ActiveRecord::Migration
  def change
    change_column_default(:items, :image_file_name, 'app/assets/images/shredding_brah2.png')
  end
end
