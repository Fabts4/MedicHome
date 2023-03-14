class Item < ApplicationRecord
  has_many :prescription_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one_attached :photo

  def name_with_desc
    "#{name} - (#{desc})".html_safe
  end
end
