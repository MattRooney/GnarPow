class Item < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'shredding_brah2.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :description, :price, presence: true
  validates :price, numericality: true

  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  def self.search_all(query)
    all = []
    all << search_brands(query)
    all << search_descriptions(query)
    all << search_names(query)
    all.flatten.uniq!
    all
  end

  def self.search_brands(query)
    Item.where("brand LIKE ?", "%#{query}%")
  end

  def self.search_descriptions(query)
    Item.where("description LIKE ?", "%#{query}%")
  end

  def self.search_names(query)
    Item.where("name LIKE ?", "%#{query}%")
  end

end
