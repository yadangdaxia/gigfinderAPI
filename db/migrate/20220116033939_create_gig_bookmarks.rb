class CreateGigBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gig, null: false, foreign_key: true

      t.timestamps
    end
  end
end
