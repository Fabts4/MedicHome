class User < ApplicationRecord
  has_many :prescriptions, dependent: :destroy
  has_many :prescription_items, through: :prescriptions
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true

end
