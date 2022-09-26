class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_by_patient_count
    doctors.ordered_by_patient_count
  end
end
