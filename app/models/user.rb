class User < ApplicationRecord
  # No need to validate name, as we don't have it on login
  validates :open_id
  has_many :gigs
  has_many :inquiries
end
