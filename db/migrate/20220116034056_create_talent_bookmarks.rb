class CreateTalentBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :talent_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :talent, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
