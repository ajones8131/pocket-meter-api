class Comment < ActiveRecord::Base
  #validation(s)
  validates_presence_of :rating
  validates :description, presence: true, length: { maximum: 250 }

  #relantionship(s)
  belongs_to :user
end
