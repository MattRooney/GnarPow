class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :current_status, presence: true,
                             inclusion: { in: %w(completed ordered paid canceled) }

  def order_items
    order = current_user.orders.create!(current_status: 'completed')
    order_items = session[:cart].each do |item_id, quantity|
      order.order_items.create(item_id: item_id, quantity: quantity)
    end
  end
end
