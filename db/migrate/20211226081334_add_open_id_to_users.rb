class AddOpenIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :open_id, :string
  end
end