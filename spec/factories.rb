require 'faker'

FactoryBot.define do
  factory :hospital do
    name {Faker::Company.name}
  end

  factory :doctor do
    hospital
    name {Faker::Name.name}
    specialty {Faker::Job.key_skill}
    university {Faker::University.name}
  end

  factory :patient do
    name {Faker::Name.name}
    age {rand(1..90)}
  end

  factory :doctor_patient do
    doctor
    patient
  end
end