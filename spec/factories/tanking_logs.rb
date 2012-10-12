# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tanking_log do
    cost    Faker::Base.numerify("10")
    date    "10/10/2012"
    gallon  Faker::Base.numerify("10")
    km      Faker::Base.numerify("10")
  end
end
