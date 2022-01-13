class User < ApplicationRecord
  # No need to validate name, as we don't have it on login
  validate :open_id
  has_many :gigs
  has_many :inquiries
  # has_one_attached :image
end
