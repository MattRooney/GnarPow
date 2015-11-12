class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :current_status
      t.integer :total_price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
