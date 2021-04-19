class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(: params[:session][:])
    if user
      log_in(user)
      redirect_to user, notice: "Welcome back, #{user.}!"
    else
      flash.now.alert = "Invalid "
      redirect_to user_path(current_user)
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
