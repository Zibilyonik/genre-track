class ApplicationController < ActionController::Base
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

  def log_in(user)
    session[:user_id] = nil
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def genreless_games
    @games = current_user.games.all
    @genreless = []
    @games.each{|x| @genreless << x if x.genres.empty?}
    @genreless
  end

  def icon_of_genre(genre)
    return "No Icon" if genre.nil?
    @icon = genre.icon
    if @icon
      return image_tag("#{@icon}.png", size: "60x60")
    else
      return "None"
    end
  end
  helper_method :icon_of_genre
  helper_method :genreless_games
  helper_method :log_out
  helper_method :log_in
  helper_method :current_user
end
