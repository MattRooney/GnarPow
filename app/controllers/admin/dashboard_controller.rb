class Admin::DashboardController < Admin::BaseController
  def show
    @user = current_user
    @orders = Order.all
  end

end
