# log out
get '/logout' do 
  session[:user_id] = nil
  redirect to '/'
end

# sign up 
post '/signup' do
  @user = User.create(params[:signup])
  session[:user_id] = @user.id
  erb :homepage
end

# log into site
post '/login' do 
  maybe_user = User.find_by_email(params[:login][:email])
  
  if maybe_user  # if user exists in databse
    
    if  maybe_user.authenticate(params[:login][:password])  # if password matches confirmed password and it is the correct password of that user in databse
      
      session[:user_id] = maybe_user.id
      @user = maybe_user
      erb :homepage
    else
      
      redirect to '/' # not a user. send them home
    end
  end


end
