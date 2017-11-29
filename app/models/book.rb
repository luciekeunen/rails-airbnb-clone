class Book < ApplicationRecord
  has_many :collection_items
  has_many :reviews, through: :collection_items
  has_many :profiles, through: :collection_items

  mount_uploader :photo, PhotoUploader
end
