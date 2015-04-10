class LoginController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if params[:login]
      render 'welcome'
    elsif params[:add]
      if !@user.save
        render 'index'
      else
        render 'welcome'
      end
    end
  end

  def welcome
  end

end
