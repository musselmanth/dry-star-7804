class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def self.ordered_by_patient_count
    Doctor 
      .joins(:patients)
      .select('doctors.*, COUNT(patients.id) AS patient_count')
      .group(:id)
      .order(patient_count: :desc)
  end
end
