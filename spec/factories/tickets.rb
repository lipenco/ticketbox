# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name "MyString"
    date "2014-04-01"
    user nil
    category nil
  end
end
