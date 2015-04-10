class LoginController < ApplicationController
  def index
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if params[:login]

    elsif params[:add]

    end
  end
end
