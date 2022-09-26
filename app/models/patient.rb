class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  default_scope { order(name: :asc) }
  scope :adults, -> { where('age > 18') }
end