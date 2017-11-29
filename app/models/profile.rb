class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :collection_items, dependent: :destroy
  has_many :messages

  validates :first_name, presence: true
  validates :address, presence: true
  validates :description, length: { maximum: 200 }

  mount_uploader :photo, PhotoUploader

  geocoded_by :full_address, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: :address_changed?

  def full_address
    "#{address}, #{zip_code}, #{city}"
  end

  # def full_address_changed?
  #   address_changed? || zip_code_changed? || city_changed? || country_changed?
  # end
end
