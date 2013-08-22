get '/' do
  # Look in app/views/index.erb
  if current_user
    erb :homepage
  else
    erb :index
  end
end
