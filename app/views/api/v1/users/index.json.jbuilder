# This comes from controller index action
# Jbuilder gem helps take care of this part

json.users do
  # This @users below is from users_controller
  json.array! @users do |user|
    json.extract! user, :id, :image, :name, :description, :rate, :contact, :talent
    # json.image user.image_attachment.attached? ? user.image_attachment.url : user.image
  end
end

# Need to make contact a private?
