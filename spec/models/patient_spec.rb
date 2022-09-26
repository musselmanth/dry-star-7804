require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through :doctor_patients}
  end

  describe 'class methods' do
    describe '#adult_patients' do
      before :each do
        @patient_1 = create(:patient, age: 5, name: "Jimmy Johnson")
        @patient_2 = create(:patient, age: 12, name: "Alex Albertson")
        @patient_3 = create(:patient, age: 18, name: "Roberta Robertson")
        @patient_4 = create(:patient, age: 19, name: "Floe Flenderson")
        @patient_5 = create(:patient, age: 30, name: "Ryan Risanti")
        @patient_6 = create(:patient, age: 67, name: "Ben Benson")
        @patient_7 = create(:patient, age: 80, name: "Vanessa Vesper")
        @patient_8 = create(:patient, age: 85, name: "Andrea Anderson")
      end

      it 'returns only patients over 18' do
        expect(Patient.adults).to match_array([@patient_4, @patient_5, @patient_6, @patient_7, @patient_8])
      end

      it 'returns patients in alphabetical order' do
        expect(Patient.adults).to eq([@patient_8, @patient_6, @patient_4, @patient_5, @patient_7])
      end
    end
  end
end