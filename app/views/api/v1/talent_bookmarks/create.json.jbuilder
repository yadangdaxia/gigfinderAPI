json.extract! @user, :id, :image, :name, :rate, :description, :contact, :talent
json.bookmarked @bookmarked
# json.image @user.image_attachment.attached? ? @user.image_attachment.service_url : @user.image
