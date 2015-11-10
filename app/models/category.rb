class Category < ActiveRecord::Base
  before_save :set_slug
  has_many :items


  def to_param
   title
  end

  def set_slug
    self.slug = title.parameterize
  end

end
