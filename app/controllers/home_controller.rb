class HomeController < ApplicationController
  def home
    @featured_item = Item.find(4)
  end
end
