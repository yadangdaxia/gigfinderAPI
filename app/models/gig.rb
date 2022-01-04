class Gig < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { maximum: 500 }
  belongs_to :user
  belongs_to :category
  has_many :inquiries
end
