class Reservation < ApplicationRecord
  belongs_to :collection_item
  belongs_to :profile

  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :final_price, numericality: { greater_than_or_equal_to: 0 }
end
