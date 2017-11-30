class Reservation < ApplicationRecord
  belongs_to :collection_item
  belongs_to :profile

  validates :start_day, presence: true
  validates :end_day, presence: true
end
