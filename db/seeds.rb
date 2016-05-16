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
  User.create(user_attributes)
end
