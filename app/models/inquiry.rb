class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :gig
  validates_uniqueness_of :gig, scope: :user
end
