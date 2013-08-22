class User < ActiveRecord::Base
  has_secure_password

  has_many :events
  has_many :event_attendances
  
  validates :email, uniqueness: true, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :password, presence: true
end
