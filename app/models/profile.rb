class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :collection_items
  has_many :messages
end
