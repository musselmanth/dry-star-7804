require 'rails_helper'

RSpec.describe 'Hospital Show Page', type: :feature do
  before :each do
    @hospital = create(:hospital)
    
    @doctor_1 = create(:doctor, hospital: @hospital)
    @doctor_2 = create(:doctor, hospital: @hospital)
    @doctor_3 = create(:doctor, hospital: @hospital)
    @doctor_4 = create(:doctor, hospital: @hospital)
    @doctor_5 = create(:doctor, hospital: @hospital)

    @doctor_1.patients << create_list(:patient, 8)
    @doctor_2.patients << create_list(:patient, 3)
    @doctor_3.patients << create_list(:patient, 1)
    @doctor_4.patients << create_list(:patient, 6)
    @doctor_5.patients << create_list(:patient, 7)

    visit(hospital_path(@hospital.id))
  end

  it 'lists the hospitals name' do
    expect(page).to have_content(@hospital.name)
  end

  it 'lists the doctors for the hospital with their patient count' do
    @hospital.doctors_by_patient_count.each do |doctor|
      within("div#doctor_#{doctor.id}") do
        expect(page).to have_content("Dr. #{doctor.name}")
        expect(page).to have_content("Patient Count: #{doctor.patient_count}")
      end
    end
  end

  it 'lists the doctors in order by patient count' do
    expect(@doctor_1.name).to appear_before(@doctor_5.name)
    expect(@doctor_5.name).to appear_before(@doctor_4.name)
    expect(@doctor_4.name).to appear_before(@doctor_2.name)
    expect(@doctor_2.name).to appear_before(@doctor_3.name)
  end
end