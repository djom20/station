# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    user_id 1
    brand "MyString"
    model "MyString"
    year 1
    color "MyString"
  end
end
