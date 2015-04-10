class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if params[:login]
      render 'index'
    elsif params[:add]
      if !@user.save
        render 'index'
      end
    end
  end
end
