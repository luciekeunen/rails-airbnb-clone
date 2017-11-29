class CollectionItem < ApplicationRecord
  belongs_to :profile
  belongs_to :book
  has_many :reservations
  has_many :messages
  has_many :reviews

  attr_accessor :title, :author, :synopsis, :photo, :genre
end
