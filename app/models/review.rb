class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :collection_item
end
