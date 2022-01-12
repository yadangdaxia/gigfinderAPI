# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Gig.destroy_all
# puts "all gigs destroyed"
# puts "------"
require 'faker'
5.times do
  User.create!(name: Faker::Internet.email(name: 'Nancy'))
end

puts "creating users"
User.create!(name: 'David', image: "https://source.unsplash.com/random/300×300/?skill", rate: 50.2, description: "Flower decerator", contact: "112344555", avatar: "https://source.unsplash.com/random/300×300/?skill", gender: "M")

puts "destroying all gigs"
Gig.destroy_all

puts "destroying all categories"
Category.destroy_all
puts "creating categories fun and work"
Category.create!(name: "Fun")
Category.create!(name: "Work")

puts "creating gigs..."
Gig.create!(user: User.all.sample, title: "Voice actor", description: "We need your lovely voice! It's great if you can sing or make high pitched cartoon character voices", location: "Beijing", rate: "350/hr", term: "as needed", expiration: "no expiration", category: Category.first)
Gig.create(user: User.all.sample, title: "Bartender", description: "We need your cocktail skills", location: "Shanghai", rate: "negotiable", term: "2 weeks", expiration: "March 1", category: Category.first)
Gig.create(user: User.all.sample, title: "Drama teacher", description: "We need your cocktail skills", location: "Guangzhou", rate: "25/hr", term: "1 night per week", expiration: "until filled", category: Category.first)

puts "Created #{Gig.count} gigs"
puts "Created #{Category.count} categories"
