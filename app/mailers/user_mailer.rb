class UserMailer < ApplicationMailer

  def user_activation(user)
    @user = user
    mail to: user.email, subject: "Account Activation | Look At My Cat"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset | Look At My Cat"
  end
end
