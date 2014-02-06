# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :type do
    sequence(:name) { |n| "Type#{n}" }
  end

  factory :type_with_fixed_name, :parent => :type do
    name 'Fixed'
  end

end
