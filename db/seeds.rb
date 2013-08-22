require 'faker'

User.delete_all
Event.delete_all

# Create 500 users
users = 10.times.map do
  User.create :first_name => Faker::Name.first_name,
              :last_name  => Faker::Name.last_name,
              :email      => Faker::Internet.email,
              :birthdate  => Date.today - 15.years - rand(20000).days,
              :password               => "123",
              :password_confirmation  => "123"

end

10.times do 
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create :user_id    => users[rand(users.length)].id,
               :name       => Faker::Company.name,
               :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
               :starts_at => start_time,
               :ends_at   => end_time
end




for i in 1..10
  User.find(i).events << Event.find(i)          # everybody created one
  User.find(i).event_attendances << Event.all   # everyone is going to everybodys event

end


# User.create(first_name:"Joe", last_name:"Noonan", email:"Joe@Joe.com", birthdate: "1989-2-27", password:"123", password_confirmation:"123")
