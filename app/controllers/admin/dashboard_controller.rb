class Admin::DashboardController < Admin::BaseController
  def index
    @user = current_user
    @orders = Order.all
  end
end
