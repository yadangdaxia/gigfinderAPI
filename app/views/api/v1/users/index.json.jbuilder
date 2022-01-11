# This comes from controller index action
# Jbuilder gem helps take care of this part

json.users do
  # This @users below is from users_controller
  json.array! @users do |user|
    json.extract! user, :id, :name, :image, :description, :rate, :contact
  end
end

# Need to make contact a private?
