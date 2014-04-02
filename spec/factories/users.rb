# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {|n| "User - #{n}"}
    email {|n| "#{n}@example.com"}
    provider "twitter"
    uid 1
  end
end
