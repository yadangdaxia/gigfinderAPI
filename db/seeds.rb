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
# 5.times do
User.create!(name: 'Tina', image: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60', rate: 'depends', description: Faker::Quote.most_interesting_man_in_the_world, contact: Faker::Internet.email)
User.create!(name: 'David', image: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGJlYXJkJTIwcG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', rate: '35/hr', description: Faker::Quote.most_interesting_man_in_the_world, contact: Faker::Internet.email)
User.create!(name: 'Jerry', image: 'https://images.unsplash.com/photo-1542327897-acbfd35f0163?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXNpYW4lMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', rate: '25usd/hr', description: Faker::Quote.most_interesting_man_in_the_world, contact: Faker::Internet.email)
User.create!(name: 'Chris', image: 'https://images.unsplash.com/photo-1609884612316-947d1f6b2c08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGFzaWFuJTIwcG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', rate: '300rmb/hr', description: Faker::Quote.most_interesting_man_in_the_world, contact: Faker::Internet.email)
# end

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
