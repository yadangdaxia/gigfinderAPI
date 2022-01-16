class GigBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :gig
end
