class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.string :description
      t.integer :rating
      t.timestamp :timestamp

      t.timestamps null: false
    end
  end
end
