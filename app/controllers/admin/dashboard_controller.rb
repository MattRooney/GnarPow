class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.where(current_status: params[:id])
  end

  def daily_deal
    User.find_each do |user|
      UserMailer.daily_deal_email(user).deliver_now
    end
    flash[:success] = 'Daily Deal email sent!'
    render :index
  end
end
