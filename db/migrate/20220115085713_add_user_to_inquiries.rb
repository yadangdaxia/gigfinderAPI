class AddUserToInquiries < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquiries, :user, null: false, foreign_key: true
  end
end
