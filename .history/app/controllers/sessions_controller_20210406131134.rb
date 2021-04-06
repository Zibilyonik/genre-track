class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in(user)
      redirect_to user, notice: "Welcome back, #{user.username}!"
    else
      flash.now.alert = "Invalid Username"
      redirect_to user_path
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

  private
  def login(user)
    session[:user_id] = nil
  end
end
