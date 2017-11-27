class CreateCollectionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_items do |t|
      t.integer :price_per_day
      t.text :description
      t.string :quality
      t.string :edition
      t.references :profile, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
