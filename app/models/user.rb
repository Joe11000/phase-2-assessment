class User < ActiveRecord::Base
  has_secure_password

  has_many :created_events, :class_name => :event

  has_many :event_attendances

  has_many :attended_events, through: :event_attendances, :source => :user

  
  validates :email, uniqueness: true, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :password, presence: true
end
