# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def sample_email_preview
    UserMailer.sample_email(User.first)
  end
end
