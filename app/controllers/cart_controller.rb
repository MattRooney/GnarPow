class CartController < ApplicationController
  def show
    @complete_cart = @cart.complete_cart
  end
end
