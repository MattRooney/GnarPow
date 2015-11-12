class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.references :item, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
