@hospital_1 = FactoryBot.create(:hospital)
@hospital_2 = FactoryBot.create(:hospital)

@doctor_1 = FactoryBot.create(:doctor, hospital: @hospital_1)
@doctor_2 = FactoryBot.create(:doctor, hospital: @hospital_1)
@doctor_3 = FactoryBot.create(:doctor, hospital: @hospital_1)
@doctor_4 = FactoryBot.create(:doctor, hospital: @hospital_1)
@doctor_5 = FactoryBot.create(:doctor, hospital: @hospital_1)

@doctor_1.patients << FactoryBot.create_list(:patient, 8)
@doctor_2.patients << FactoryBot.create_list(:patient, 3)
@doctor_3.patients << FactoryBot.create_list(:patient, 1)
@doctor_4.patients << FactoryBot.create_list(:patient, 6)
@doctor_5.patients << FactoryBot.create_list(:patient, 7)

@doctor_6 = FactoryBot.create(:doctor, hospital: @hospital_2)
@doctor_7 = FactoryBot.create(:doctor, hospital: @hospital_2)
@doctor_8 = FactoryBot.create(:doctor, hospital: @hospital_2)
@doctor_9 = FactoryBot.create(:doctor, hospital: @hospital_2)

@doctor_6.patients << FactoryBot.create_list(:patient, 4)
@doctor_7.patients << FactoryBot.create_list(:patient, 2)
@doctor_8.patients << FactoryBot.create_list(:patient, 3)
@doctor_9.patients << FactoryBot.create_list(:patient, 1)