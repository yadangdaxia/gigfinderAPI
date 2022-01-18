class GigBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :gig
  # belongs_to :gig class_name: 'Gig', foreign_key: 'gig_id' required: true
end
