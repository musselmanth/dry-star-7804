require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}

  describe 'instance methods' do
    describe '.doctors_by_patient_count' do
      before :each do
        @hospital_1 = create(:hospital)
        @hospital_2 = create(:hospital)

        @doctor_1 = create(:doctor, hospital: @hospital_1)
        @doctor_2 = create(:doctor, hospital: @hospital_1)
        @doctor_3 = create(:doctor, hospital: @hospital_1)
        @doctor_4 = create(:doctor, hospital: @hospital_1)
        @doctor_5 = create(:doctor, hospital: @hospital_1)

        @doctor_1.patients << create_list(:patient, 8)
        @doctor_2.patients << create_list(:patient, 3)
        @doctor_3.patients << create_list(:patient, 1)
        @doctor_4.patients << create_list(:patient, 6)
        @doctor_5.patients << create_list(:patient, 7)

        @doctor_6 = create(:doctor, hospital: @hospital_2)
        @doctor_7 = create(:doctor, hospital: @hospital_2)
        @doctor_8 = create(:doctor, hospital: @hospital_2)
        @doctor_9 = create(:doctor, hospital: @hospital_2)

        @doctor_6.patients << create_list(:patient, 4)
        @doctor_7.patients << create_list(:patient, 2)
        @doctor_8.patients << create_list(:patient, 3)
        @doctor_9.patients << create_list(:patient, 1)
      end
      
      it 'returns doctors for the hospital by patient count' do
        expect(@hospital_1.doctors_by_patient_count).to eq([@doctor_1, @doctor_5, @doctor_4, @doctor_2, @doctor_3])
        expect(@hospital_2.doctors_by_patient_count).to eq([@doctor_6, @doctor_8, @doctor_7, @doctor_9])
      end
    end
  end
end
