require 'rails_helper'

RSpec.describe 'Doctors Show Page', type: :feature do
  before :each do
    @hospital = create(:hospital)
    @doctor = create(:doctor, hospital: @hospital)
    @patients = create_list(:patient, 15)
    @doctor.patients << @patients

    visit(doctor_path(@doctor.id))
  end

  it 'shows the doctors name, specialty, and university' do
    expect(page).to have_content(@doctor.name)
    expect(page).to have_content("Specialty: #{@doctor.specialty}")
    expect(page).to have_content("Doctorate From: #{@doctor.university}")
  end

  it 'shows the hopsital where the doctor works' do 
    expect(page).to have_content("Hospital: #{@hospital.name}")
  end

  it 'lists the patients for the doctor' do
    expect(page).to have_content("Patients:")
    @doctor.patients.each do |patient| 
      within("div#patient_#{patient.id}") do
        expect(page).to have_content(patient.name)
      end
    end
  end
end