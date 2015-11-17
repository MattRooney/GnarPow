class UserMailer < ApplicationMailer
  default from: 'gnarpow.info@gmail.com'

  def sample_email(user)
    @user = user
    @items = user.orders.last.items
    mail(to: user.email, subject: "Order #{user.orders.last.id}")
  end
end
