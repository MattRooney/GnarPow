class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_items.map {|order_item| Item.find(order_item.item_id).price * order_item.quantity }.sum
  end


end
