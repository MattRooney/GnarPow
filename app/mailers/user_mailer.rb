class UserMailer < ApplicationMailer
  default from: "gnarpow.info@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: "matthewjrooney@gmail.com", subject: "Sample Email")
  end
end
