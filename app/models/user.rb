class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true

  enum role: %w(default admin)

  has_many :orders

  def set_order(session)
    order = self.orders.create!(current_status: 'completed')
    order_items = session.each do |item_id, quantity|
      order.order_items.create(item_id: item_id, quantity: quantity)
    end
  end
end
