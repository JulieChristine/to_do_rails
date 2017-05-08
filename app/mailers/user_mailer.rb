class UserMailer < ApplicationMailer

  def signup_user(user)
    @user = user

    mail to: user.email, subject: "Sign up Confirmation"
  end
end
