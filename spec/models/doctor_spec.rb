require 'rails_helper'

RSpec.describe Doctor do

  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through :doctor_patients}
  end

  describe 'class methods' do
    describe '#ordered_by_patient_count' do
      before :each do 
        @doctor_1 = create(:doctor)
        @doctor_2 = create(:doctor)
        @doctor_3 = create(:doctor)
        @doctor_4 = create(:doctor)
        @doctor_5 = create(:doctor)

        @doctor_1.patients << create_list(:patient, 8)
        @doctor_2.patients << create_list(:patient, 3)
        @doctor_3.patients << create_list(:patient, 1)
        @doctor_4.patients << create_list(:patient, 6)
        @doctor_5.patients << create_list(:patient, 7)
      end

      it 'returns doctors ordered by their count of patients' do
        expect(Doctor.ordered_by_patient_count).to eq([@doctor_1, @doctor_5, @doctor_4, @doctor_2, @doctor_3])
      end

      it 'can return patient_count' do
        doctors = Doctor.ordered_by_patient_count
        expect(doctors.first.patient_count).to eq(8)
      end
    end
  end
end
