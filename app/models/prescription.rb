class Prescription < ApplicationRecord
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"
  has_many :prescription_items, dependent: :destroy
  has_many :baskets, dependent: :destroy
  has_many :items, through: :prescription_items


end
