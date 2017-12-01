class CollectionItem < ApplicationRecord
  belongs_to :profile
  belongs_to :book
  has_many :reservations
  has_many :messages
  has_many :reviews

  validates :price_per_day, presence: :true, numericality: { only_integer: true }

  attr_accessor :title, :author, :synopsis, :photo, :genre, :fake_title
end
