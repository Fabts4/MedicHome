class User < ApplicationRecord
  has_many :prescriptions, dependent: :destroy
  has_many :prescription_items, through: :prescriptions
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :omniauthable :registerable  :recoverable
  devise :database_authenticatable,
          :rememberable, :validatable

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true

end
