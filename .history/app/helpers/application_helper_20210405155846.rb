module ApplicationHelper
  before_action :login_required

  def login_required
    if !logged_in?
      redirect_to login_path, :notice => "Log in to create a game or a genre"
    end
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

  helper_method :current_user
end
