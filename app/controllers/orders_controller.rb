class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      render file: 'public/404' unless current_admin?
    end
  end

  def show
    @order_data = Order.find(params[:id]).orders_hash
  end

  def create
    if current_user
      current_user.set_order(session[:cart])
      session.delete(:cart)
      flash[:success] = 'Order was successfully placed'
      redirect_to orders_path
    else
      flash[:login] = 'You must be logged in to check out'
      redirect_to login_path
    end
  end
end
