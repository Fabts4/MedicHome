class Patient < User
  default_scope { where(doctor: false) }

  has_many :prescriptions, dependent: :destroy
  # has_many :prescription_items, through: :prescriptions

  validates :ssn, presence: true
  validates :mutuelle_name, presence: true
  validates :mutuelle_number, presence: true

end
