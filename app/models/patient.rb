class Patient < User
  default_scope { where(doctor: false) }

  has_many :prescriptions, dependent: :destroy
  # has_many :prescription_items, through: :prescriptions

  validates :ssn, presence: true
  validates :mutuelle_name, presence: true
  validates :mutuelle_number, presence: true

  def self.simple_form_collection
    all.map { |patient| [patient.full_name, patient.id] }
  end

  def full_name
    "#{first_name} #{last_name} (#{ssn})"
  end
end
