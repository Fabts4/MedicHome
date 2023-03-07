class Doctor < User
  default_scope { where(doctor: true) }

  has_many :prescriptions, dependent: :destroy
  # has_many :prescription_items, through: :prescriptions

  validates :rpps, presence: true
end
