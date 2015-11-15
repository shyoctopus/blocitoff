# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "password",
#              password_confirmation: "password")

5.times do
  User.create!(
               email: Faker::Internet.email,
               password: Faker::Internet.password(8, 15)
               )
end

users = User.all

20.times do
  Item.create!(
    name: Faker::Lorem.characters(10),
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created!"
puts "#{Item.count} items created!"
