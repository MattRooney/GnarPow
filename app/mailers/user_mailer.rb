class UserMailer < ApplicationMailer
  default from: 'gnarpow.info@gmail.com'

  def sample_email(user)
    @user = user
    @items = user.orders.last.items
    mail(to: user.email, subject: "Order #{user.orders.last.id}")
  end

  def daily_deal_email(user)
    if user.email
      mail(to: user.email, subject: "GnarPow Daily Deal")
    end
  end
end
