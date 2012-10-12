# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gas_station do
    name Faker::Name.name
  end
end
