class Comment < ActiveRecord::Base
  validates_presence_of :rating
  validates :description, presence: true, length: { maximum: 250 }
end
