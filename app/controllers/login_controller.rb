class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def json_signup
  end

  def json_login
  end

  def clearData
    User.delete_all()
  end

  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))

    if params[:login]
      u = User.find_by username: @user.username, password: @user.password

      # user exists in db
      if !u.nil?
        redirect_to :controller => 'login', :action => 'welcome', :user => u.id
      else
        @users = User.all
        @user.errors.add(:username, "Invalid username and password combination. Please try again.")
        render 'index'
      end


    elsif params[:add]

      # error occured when saving user to db
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
