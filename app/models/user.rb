class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true

  enum role: %w(default admin)

  has_many :orders

  def set_order(session)
    order = orders.create!(current_status: "completed")
    order_items = session.each do |item_id, quantity|
      order.order_items.create(item_id: item_id, quantity: quantity)
    end
    order.total_price = order.order_items.map { |order_item| Item.find(order_item.item_id).price * order_item.quantity }.sum
  end
end
