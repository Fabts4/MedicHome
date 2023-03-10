class Cart < ApplicationRecord
  belongs_to :prescription
  belongs_to :pharmacy

  has_many :cart_items, dependent: :destroy

  enum status: {
    draft: 0,
    ordered: 1
  }
end
