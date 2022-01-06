json.gigs do
  json.array! @gigs do |gig|
    json.extract! gig, :id, :title, :description, :location, :rate, :date_posted, :term, :expiration, :user_id, :category_id
  end
end
# Will be accessed by front end
