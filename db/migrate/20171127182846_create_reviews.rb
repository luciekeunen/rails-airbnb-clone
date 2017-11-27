class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.float :rating
      t.references :profile, foreign_key: true
      t.references :collection_item, foreign_key: true

      t.timestamps
    end
  end
end
