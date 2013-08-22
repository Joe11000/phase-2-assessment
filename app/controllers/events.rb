# create a new event. Send them to the edit event view without a @event parameter
get '/event/create' do 
  erb :_new_event
end

post '/event/create' do 

  if current_user 
    current_user.created_events.create(params[:event]) 
  end

  @user = current_user
  erb :homepage
end

get '/event/:event_id' do
  @event = Event.find_by(user_id: current_user.id, id: params[:event_id])
  erb :_event_form_uneditable
end

get '/event/edit/:event_id' do 
  @event=nil
  if current_user # if a user exists
    @event = Event.find_by(user_id: current_user.id, id: params[:event_id])  # get instance variable of the event that exists for this user
  end
  erb :_event_form_editable
end


get '/event/delete/:event_id' do 
  if current_user # if a user exists
    Event.find_by(user_id: current_user.id, id: params[:event_id]).destroy  # get instance variable of the event that exists for this user
  end

  redirect to '/'
end


post '/event/edit/:event_id' do 
  if current_user # if a user exists
    @event = Event.find_by(id: params[:event_id])  # get instance variable of the event that exists for this user

    if  @event # if a new event
      @event.update(params[:event])
    end

  end

  redirect to '/'
end
