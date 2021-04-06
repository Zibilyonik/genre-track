class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(params[:username])
    if user
      redirect_to root_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now.alert = "Invalid Username"
      render new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def login(user)
    session[:user_id] = nil
  end
end
