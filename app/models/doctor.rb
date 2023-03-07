class Doctor < User
  default_scope { where(doctor: true) }

  has_many :prescriptions
  has_many :prescription_items, through: :prescriptions

  # validates :rpps, presence: true
end
