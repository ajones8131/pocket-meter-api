class User < ActiveRecord::Base
  #validation(s)
  validates_presence_of :username

  #relantionship(s)
  has_many :comments
end
