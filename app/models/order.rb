class Order < ApplicationRecord
  belongs_to :basket
  has_one :pharmacy, through: :basket
  has_one :prescription, through: :basket
  belongs_to :item
  validates :item, uniqueness: {scope: :basket}
end
