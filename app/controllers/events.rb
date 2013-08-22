post 'event/create' do 

  if current_user 
    current_user.events << params[:new_event] # add new event to current user
  end

  erb :homepage
end

get 'event/edit/:event_id' do 

  if current_user # if a user exists
    @event = Event.where(user_id: current_user.id, id: params[:event_id])  # get instance variable of the event that exists for this user
  end

  erb :_event_form
end

get 'event/delete/:event_id' do 
  if current_user # if a user exists
    Event.where(user_id: current_user.id, id: params[:event_id]).destroy  # get instance variable of the event that exists for this user
  end

  erb :_event_form
end

