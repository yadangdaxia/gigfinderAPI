class AddMessageToInquiries < ActiveRecord::Migration[6.1]
  def change
    add_column :inquiries, :message, :text
  end
end
