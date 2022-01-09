json.gigs do
  json.array! @gigs do |gig|
    json.extract! gig, :id, :title, :description, :location, :rate, :date_posted, :term, :expiration
  end
end
