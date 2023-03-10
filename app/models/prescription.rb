class Prescription < ApplicationRecord
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"

  has_many :prescription_items, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :items, through: :prescription_items

  scope :filter_by_status, -> (status) { where status: status }

  enum status: {
    draft: 0,
    sent: 1,
    ordered: 2
  }
end
