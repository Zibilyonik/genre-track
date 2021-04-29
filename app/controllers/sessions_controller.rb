class SessionsController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  def new
    redirect_to user_path(current_user) if logged_in?
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in(user)
      redirect_to user_path(current_user), notice: "Welcome back, #{user.name}!"
    else
      flash.now.alert = 'Invalid Username'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

  private

  def login(_user)
    session[:user_id] = nil
  end
end
