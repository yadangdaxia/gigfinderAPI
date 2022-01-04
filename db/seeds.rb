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

Gig.create(title: "Voice actor", description: "We need your lovely voice", user_id: User.first, category_id: Category.first)
# Gig.create(title: "Bartender", description: "We need your cocktail skills", location: "Shangnai", user_id: User.first, category_id: Category.first)

puts "Created #{Gig.count} gigs"
# puts "#{Gig.first.title}"
