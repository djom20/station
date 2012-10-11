# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    brand   {[:chevrolet, :mazda, :toyota, :chrysler, :hyundai, :ford].sample}
    model   Faker::Name.name
    year    Faker::Base.numerify("1960")
    color   {["blanco", "negro", "azul", "rojo"].sample}
  end
end
