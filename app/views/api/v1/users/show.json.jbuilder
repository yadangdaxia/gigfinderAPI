
# json.users do
#   json.array! @users do |user|
#     json.extract! user, :id, :name, :gender, :avatar
#   end
# end

json.extract! @user, :id, :name, :image, :rate, :description, :contact, :talent
json.bookmarked @bookmarked
# json.image @user.image_attachment.attached? ? @user.image_attachment.service_url : @user.image
