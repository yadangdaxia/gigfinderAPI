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
puts "destroying all gigs"
Gig.destroy_all

puts "destroying all categories"
Category.destroy_all
puts "creating categories fun and work"
Category.create!(name: "Fun")
Category.create!(name: "Work")

puts "creating gigs..."
Gig.create!(user: User.all.sample, title: "Voice factor", description: "We need youfr lovely voice", category: Category.first)

Gig.create(user: User.all.sample, title: "Bartender", description: "We need your cocktail skills", location: "Shangnai", category: Category.first)

puts "Created #{Gig.count} gigs"
puts "Created #{Category.count} categories"
