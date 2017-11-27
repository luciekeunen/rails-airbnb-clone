class AddCollectionItemRefToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :collection_item, foreign_key: true
  end
end
