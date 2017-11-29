class AddCoordinatesToCollectionItems < ActiveRecord::Migration[5.0]
  def change
    add_column :collection_items, :latitude, :float
    add_column :collection_items, :longitude, :float
  end
end
