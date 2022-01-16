
json.extract! @gig, :id, :title, :description, :location, :rate, :date_posted, :term, :expiration

json.user_id @gig.user.id
