class AddUserReferenceToGigs < ActiveRecord::Migration[6.1]
  def change
    add_reference :gigs, :user, foreign_key: true
  end
end
