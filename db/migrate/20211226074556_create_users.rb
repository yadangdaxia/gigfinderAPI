class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.float :rate
      t.string :description
      t.string :contact

      t.timestamps
    end
  end
end
