
# json.users do
#   json.array! @users do |user|
#     json.extract! user, :id, :name, :gender, :avatar
#   end
# end

json.extract! @user, :id, :name, :image, :rate, :description, :contact, :talent

json.users do
  json.array! @users do |user|
    json.extract! user, :id, :name, :gender, :avatar
  end
end

