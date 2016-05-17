# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  { username: "ajones" },
  { username: "foobar" },
  { username: "jdoe" },
  { username: "asmith" },
  { username: "rwilson" },
].each do |user_attributes|
  user = User.create(user_attributes)
  user.comments.build( username: "ajones",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' )
  user.comments.build( username: "foobar",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' )
  user.save
end

# [
#   { username: "ajones",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' },
#   { username: "foobar",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' },
#   { username: "jdoe",    description: "Okay Times",  rating: 4, timestamp: '2016-05-14T2:00:35'  },
#   { username: "asmith",  description: "Meh Times",   rating: 3, timestamp: '2016-05-13T3:00:35'  },
#   { username: "rwilson", description: "Great Times", rating: 5, timestamp: '2016-05-12T4:00:35'  },
# ].each do |comment_attributes|
#   Comment.create(comment_attributes)
# end
