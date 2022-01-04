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


puts "destroying all gigs"
Gig.destroy_all

puts "destroying all categories"
Category.destroy_all
puts "creating categories fun and work"
Category.create!(name: "Fun")
Category.create!(name: "Work")

puts "creating gigs..."
Gig.create!(title: "Voice factor", description: "We need youfr lovely voice", user: User.first, category: Category.first)

Gig.create(title: "Bartender", description: "We need your cocktail skills", location: "Shangnai", user: User.first, category: Category.first)

puts "Created #{Gig.count} gigs"
puts "Created #{Category.count} categories"
