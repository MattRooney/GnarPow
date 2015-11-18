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
    @order = Order.find(params[:id])
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

  def update
    Order.find(params[:id]).update_attributes(current_status: params[:order_status])
    redirect_to admin_dashboard_index_path
  end
end
