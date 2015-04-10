class LoginController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if params[:login]
      redirect_to login_welcome_path
    elsif params[:add]
      if !@user.save
        @users = User.all
        render 'index'
      else
        redirect_to :controller => 'login', :action => 'welcome', :user => @user
      end
    end
  end

  def welcome
    @user = User.find(params[:user])
    @user.count += 1
    @user.save
  end

end
