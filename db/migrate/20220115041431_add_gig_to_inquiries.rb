class AddGigToInquiries < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquiries, :gig, null: false, foreign_key: true
  end
end
