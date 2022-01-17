class User < ApplicationRecord
  has_many :gig_bookmarks
  has_many :talent_bookmarks
  # No need to validate name, as we don't have it on login
  validate :open_id
  has_many :gigs
  has_many :inquiries
  has_one_attached :image_attachment

  include PgSearch::Model
  pg_search_scope :search_by_talent,
    against: [ :talent ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
