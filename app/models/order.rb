class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :current_status, presence: true,
                             inclusion: { in: %w(completed ordered paid canceled) }


end
