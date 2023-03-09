class Cart < ApplicationRecord
  belongs_to :prescription
  belongs_to :pharmacy

  enum status: {
    draft: 0,
    ordered: 1
  }
end
