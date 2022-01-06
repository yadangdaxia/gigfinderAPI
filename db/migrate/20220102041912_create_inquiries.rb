class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.boolean :confirm

      t.timestamps
    end
  end
end
