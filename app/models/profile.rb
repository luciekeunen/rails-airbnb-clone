class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :collection_items, dependent: :destroy
  has_many :messages

  validates :first_name, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader
end
