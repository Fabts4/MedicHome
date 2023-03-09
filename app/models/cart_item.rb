class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  has_one :pharmacy, through: :cart
  has_one :prescription, through: :cart

  validates :item, uniqueness: { scope: :cart }
end
