class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    binding.pry
    @order = Order.find(params[:id])
  end


end
