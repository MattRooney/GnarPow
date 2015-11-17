class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      render file: 'public/404' unless current_admin?
      flash[:non_user] = 'You must be logged in to view your orders'
    end
  end

  def show
    @order_data = Order.find(params[:id]).orders_hash
  end

  def create
    if session[:cart].nil? || session[:cart] == {}
      flash[:no_items] = "There's nothing in your cart."
      redirect_to items_path
    elsif current_user && session[:cart]
      current_user.set_order(session[:cart])
      UserMailer.sample_email(current_user).deliver_now
      session.delete(:cart)
      flash[:success] = 'Order was successfully placed'
      redirect_to orders_path
    else
      flash[:login] = 'You must be logged in to check out'
      redirect_to login_path
    end
  end
end
