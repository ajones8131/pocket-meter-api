class CommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :description, :rating, :timestamp, :user_id
end
