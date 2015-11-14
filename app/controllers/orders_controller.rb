class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = @order.order_items.map { |order_item| Item.find(order_item.item_id).price * order_item.quantity }.sum
  end

  def create
    if current_user
      order = current_user.orders.create!(current_status: 'completed')
      order_items = session[:cart].each do |item_id, quantity|
        order.order_items.create(item_id: item_id, quantity: quantity)
      end
      session.delete(:cart)
      flash[:success] = 'Order was successfully placed'
      redirect_to orders_path
    else
      flash[:login] = 'You must be logged in to check out'
      redirect_to login_path
      # redirect_to login_path(location: "#{request.path}")
    end
  end
end
