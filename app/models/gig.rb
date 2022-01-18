class Gig < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { maximum: 500 }
  belongs_to :user
  belongs_to :category
  has_many :inquiries
  has_many :gig_bookmarks

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title, :description, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
