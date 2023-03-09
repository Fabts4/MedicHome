class Prescription < ApplicationRecord
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"

  has_many :prescription_items, dependent: :destroy
  has_many :baskets, dependent: :destroy
  has_many :items, through: :prescription_items

  enum status: {
    draft: 0,
    sent: 1,
    ordered: 2
  }
end
