class CollectionItem < ApplicationRecord
  belongs_to :profile
  belongs_to :book
  has_many :reservations
  has_many :messages
  has_many :reviews
end
