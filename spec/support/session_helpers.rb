def log_in(user)
  session[:user_id] = nil
  session[:user_id] = user.id
end
