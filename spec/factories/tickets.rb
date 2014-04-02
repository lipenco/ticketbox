# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name "MyString"
    user nil
    category nil
  end
end
