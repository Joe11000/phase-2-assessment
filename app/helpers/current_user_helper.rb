def current_user
  @user ||= User.find(session[:user_id])

  if not @user 
    redirect to '/'
  end
end
