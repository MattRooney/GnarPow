class CartController < ApplicationController

  def show
    item_ids = @cart.contents.keys
    @items = Item.find(item_ids)
    @total = @cart.contents.map {|item_id, quantity| p Item.find(item_id.to_i).price * quantity}.sum
    @cart.count_of(@items)
  end
end
