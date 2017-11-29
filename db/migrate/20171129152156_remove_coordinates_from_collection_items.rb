class RemoveCoordinatesFromCollectionItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :collection_items, :latitude, :float
    remove_column :collection_items, :longitude, :float
  end
end
