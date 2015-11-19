class HomeController < ApplicationController
  def home
    @featured_item = Item.find_by(name: 'gnar possum')
  end
  
end
