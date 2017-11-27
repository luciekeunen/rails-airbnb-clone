class RemoveBookRefFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reservations, :book, foreign_key: true
  end
end
