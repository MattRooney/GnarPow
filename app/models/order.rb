class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :current_status, presence: true,
                             inclusion: { in: %w(completed ordered paid canceled) }

  def orders_hash
    {
      order_object: self,
      total_price: total_price
    }
  end

  def total_price
    self.order_items.map { |order_item| Item.find(order_item.item_id).price * order_item.quantity }.sum
  end

end
