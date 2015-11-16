class AddBrandtoItems < ActiveRecord::Migration
  def change
    add_column :items, :brand, :string, default: "Burton"
  end
end
