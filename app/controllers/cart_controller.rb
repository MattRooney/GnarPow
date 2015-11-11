class CartController < ApplicationController

  def show
    item_ids = @cart.contents.keys
    @items = Item.find(item_ids)
    @cart.count_of(@items)
  end
end
