class Item < ApplicationRecord
  has_many :prescription_items
  has_one_attached :photo
end
