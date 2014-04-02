# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name {|n| "Ticket #{n}"}
  end
end
