class Item < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :description, :price, presence: true
  validates :price, numericality: true

  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
end
