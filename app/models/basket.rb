class Basket < ApplicationRecord
  belongs_to :prescription
  belongs_to :pharmacy
end
