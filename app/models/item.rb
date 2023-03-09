class Item < ApplicationRecord
  has_many :prescription_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one_attached :photo
end
