# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :type do
    sequence(:name) { |n| "Type1#{n}" }
  end
end
