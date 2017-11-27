class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :profile, foreign_key: true
      t.references :collection_item, foreign_key: true

      t.timestamps
    end
  end
end
