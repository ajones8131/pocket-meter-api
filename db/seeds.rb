# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Comment.delete_all

userOne = User.create!(username: "ajones")
userOne.comments.create!( username: "ajones",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' )
userOne.comments.create!( username: "ajones",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' )

userTwo = User.create!(username: "foobar")
userTwo.comments.create!( username: "foobar",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' )
userTwo.comments.create!( username: "foobar",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' )

userThree = User.create!(username: "jdoe")
userThree.comments.create!( username: "jdoe",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' )
userThree.comments.create!( username: "jdoe",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' )

userFour = User.create!(username: "asmith")
userFour.comments.create!( username: "asmith",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' )
userFour.comments.create!( username: "asmith",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' )

userFive = User.create!(username: "rwilson")
userFive.comments.create!( username: "rwilson",  description: "Good Times",  rating: 5, timestamp: '2016-05-16T12:00:35' )
userFive.comments.create!( username: "rwilson",  description: "Bad Times",   rating: 2, timestamp: '2016-05-15T11:00:35' )
