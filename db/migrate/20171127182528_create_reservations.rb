class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :status
      t.integer :final_price
      t.date :start_day
      t.date :end_day
      t.references :book, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
