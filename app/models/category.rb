class Category < ActiveRecord::Base
  has_many :items

  def to_param
   title
  end
  
end
