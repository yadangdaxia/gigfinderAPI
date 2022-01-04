class AddCategoryReferenceToGigs < ActiveRecord::Migration[6.1]
  def change
    add_reference :gigs, :category, foreign_key: true
  end
end
