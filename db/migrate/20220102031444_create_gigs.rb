class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :rate
      t.string :date_posted
      t.string :term
      t.string :expiration

      t.timestamps
    end
  end
end
