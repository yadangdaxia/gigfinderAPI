class ChangeDatatypeForUserRate < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :rate, :string
  end
end
