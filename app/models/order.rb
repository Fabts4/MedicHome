class Order < ApplicationRecord
  belongs_to :basket
  belongs_to :item
end
