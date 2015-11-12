class OrdersController < ApplicationController

  def index
    @orders = User.find(params[:user_id]).orders
  end

end
