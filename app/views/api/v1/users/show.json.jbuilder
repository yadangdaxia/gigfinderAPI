json.users do
  json.array! @users do |user|
    json.extract! user, :id, :name, :gender, :avatar
  end
end
