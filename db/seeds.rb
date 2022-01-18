# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# 5.times do
#   User.create!(name: Faker::Internet.email(name: 'Nancy'))
# end

# puts "creating users"
# User.create!(name: 'David', image: "https://source.unsplash.com/random/300×300/?skill", rate: 50.2, description: "Flower decerator", contact: "112344555", avatar: "https://source.unsplash.com/random/300×300/?skill", gender: "M")

puts "destroying all bookmarks"
TalentBookmark.destroy_all
GigBookmark.destroy_all

puts "destroying all inquiries"
Inquiry.destroy_all

puts "destroying all gigs"
Gig.destroy_all

puts "destroying all users"
User.destroy_all

puts "destroying all categories"
Category.destroy_all



# 5.times do
User.create!(name: 'Pillow', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user1.jpeg', rate: 'depends', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Animator", contact: Faker::Internet.email)
User.create!(name: 'David', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user2.jpeg', rate: '35/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Translator", contact: Faker::Internet.email)
User.create!(name: 'Jerry', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user3.jpeg', rate: '25usd/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Tattoo artist", contact: Faker::Internet.email)
User.create!(name: 'Chris', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user4.jpeg', rate: '300rmb/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Teacher", contact: Faker::Internet.email)
User.create!(name: 'Leslie', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user5.jpeg', rate: '$39/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Fashion Design", contact: Faker::Internet.email)
User.create!(name: 'Penny', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user6.jpeg', rate: '540rmb/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Tattoo design", contact: Faker::Internet.email)
User.create!(name: 'Richard', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user7.jpeg', rate: '300rmb/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Teacher", contact: Faker::Internet.email)
User.create!(name: 'Minnow', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user8.jpeg', rate: '280rmb/hr', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Carpenter", contact: Faker::Internet.email)
User.create!(name: 'Cotton', image: 'https://giggle-cloud.oss-cn-shanghai.aliyuncs.com/Resources/user9.jpeg', rate: '700 USD - full day', description: Faker::Quote.most_interesting_man_in_the_world, talent: "Interpreter", contact: Faker::Internet.email)
# end


puts "creating categories fun and work"
Category.create!(name: "Fun")
Category.create!(name: "Work")

puts "creating gigs..."
Gig.create!(user: User.all.sample, title: "Voice actor", description: "We need your lovely voice! It's great if you can sing or make high pitched cartoon character voices", location: "Beijing", rate: "350/hr", term: "as needed", expiration: "end of 2022", category: Category.first)
Gig.create(user: User.all.sample, title: "Bartender", description: "We need your cocktail skills", location: "Shanghai", rate: "negotiable", term: "2 weeks", expiration: "March 1", category: Category.first)
Gig.create(user: User.all.sample, title: "Drama teacher", description: "We need your cocktail skills", location: "Guangzhou", rate: "25/hr", term: "1 night per week", expiration: "until filled", category: Category.first)
Gig.create(user: User.all.sample, title: "Graffiti artist", description: "Searching for an artist to add color and design to our building", location: "Shenzhen", rate: "35/hr", term: "multi-day", expiration: "no expiration", category: Category.first)
Gig.create!(user: User.all.sample, title: "Thai/English translator", description: "Needed on a recurring basis for online/offline meetings. Get in touch.", location: "Beijing", rate: "350/hr", term: "as needed", expiration: "no expiration", category: Category.first)
Gig.create(user: User.all.sample, title: "Full stack Web development", description: "Ongoing projects! Work from home or our office 3 days per week.", location: "Tennessee", rate: "Munificent", term: "Indefinite", expiration: "Until filled", category: Category.first)
Gig.create(user: User.all.sample, title: "Dance/theatre teacher", description: "We're looking to hire a dedicated adjunct instructor with 6+ years of experience teaching secondary school students or above", location: "Tokyo", rate: "45/hr", term: "3 days per week", expiration: "until filled", category: Category.first)
Gig.create(user: User.all.sample, title: "Comic artist/illustrator/painter", description: "Need a talented comic artist to decorate the interior of our kindergarten", location: "Fushun", rate: "negotiable", term: "multi-day", expiration: "no expiration", category: Category.first)



# puts "creating inquiries..."
# Inquiry.create!(user_id: 1, gig_id: 1, confirm: false)
# Inquiry.create!(user_id: 2, gig_id: 2, confirm: false)
# Inquiry.create!(user_id: 5, gig_id: 2, confirm: false, message: "looks cool, let's have a phone call. 123456789")
# Inquiry.create!(user_id: 5, gig_id: 3, confirm: false, message: "I'm interested. My Wechat: 123456789")

puts "Created #{User.count} users"
puts "Created #{Gig.count} gigs"
puts "Created #{Category.count} categories"
puts "Created #{Inquiry.count} inquiries"
