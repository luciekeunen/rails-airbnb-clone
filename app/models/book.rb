class Book < ApplicationRecord
  has_many :collection_items
  has_many :reviews, through: :collection_items
end
