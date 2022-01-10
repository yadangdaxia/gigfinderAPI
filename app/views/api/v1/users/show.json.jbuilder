
# json.gig do
#   json.id @gig.id
#   json.name @gig.name
#   json.image @gig.image
#   json.rate @gig.rate
#   json.description @gig.description
#   json.contact @gig.contact
# end



json.extract! @user, :id, :name, :gender, :avatar



# json.users do
#   json.array! @users do |user|
#     json.extract! user, :id, :name, :gender, :avatar
#   end
# end
