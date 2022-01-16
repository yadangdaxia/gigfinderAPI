# This comes from controller index action
# Jbuilder gem helps take care of this part

json.inquiries do
  # This @users below is from users_controller
  json.array! @inquiries do |inquiry|
    p json.extract! inquiry, :id, :confirm, :message, :user_id, :gig_id
  end
end

# Need to make contact a private?
