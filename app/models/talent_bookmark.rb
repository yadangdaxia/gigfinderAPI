class TalentBookmark < ApplicationRecord
  belongs_to :talent, class_name: 'User', foreign_key: 'talent_id', required: true
  belongs_to :user
end
