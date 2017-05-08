class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # send email
      UserMailer.signup_user(@user).deliver
      redirect_to @user, notice: "Signed up successfully."
    else
      render :new
    end
  end
end
