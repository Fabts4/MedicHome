class Patient < User
  default_scope { where(doctor: false) }

  has_many :prescriptions
  has_many :prescription_items, through: :prescriptions
end
