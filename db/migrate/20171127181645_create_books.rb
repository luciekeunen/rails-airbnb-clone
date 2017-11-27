class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :synopsis
      t.string :author
      t.string :photo
      t.string :genre
      t.float :average_rating

      t.timestamps
    end
  end
end
