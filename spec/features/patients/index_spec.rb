require 'rails_helper'

RSpec.describe 'Patients Index Page', type: :feature do
  before :each do
    @patient_1 = create(:patient, age: 5, name: "Jimmy Johnson")
    @patient_2 = create(:patient, age: 12, name: "Alex Albertson")
    @patient_3 = create(:patient, age: 18, name: "Roberta Robertson")
    @patient_4 = create(:patient, age: 19, name: "Floe Flenderson")
    @patient_5 = create(:patient, age: 30, name: "Ryan Risanti")
    @patient_6 = create(:patient, age: 67, name: "Ben Benson")
    @patient_7 = create(:patient, age: 80, name: "Vanessa Vesper")
    @patient_8 = create(:patient, age: 85, name: "Andrea Anderson")

    visit(patients_path)
  end

  it 'has a title' do
    expect(page).to have_content("Patient Directory")
  end

  it 'lists only the names of patients over 18' do
    expect(page).to_not have_content(@patient_1.name)
    expect(page).to_not have_content(@patient_2.name)
    expect(page).to_not have_content(@patient_3.name)
    expect(page).to have_content(@patient_4.name)
    expect(page).to have_content(@patient_5.name)
    expect(page).to have_content(@patient_6.name)
    expect(page).to have_content(@patient_7.name)
    expect(page).to have_content(@patient_8.name)
  end

  it 'lists the patients in alphabetical order' do
    expect(@patient_8.name).to appear_before(@patient_6.name)
    expect(@patient_6.name).to appear_before(@patient_4.name)
    expect(@patient_4.name).to appear_before(@patient_5.name)
    expect(@patient_5.name).to appear_before(@patient_7.name)
  end
end