class GigBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :gig
  belongs_to :user, class_name: 'Gig', foreign_key: 'gig_id', required: true
end
