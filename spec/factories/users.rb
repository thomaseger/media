FactoryGirl.define do
  factory :user do
    password 'changeme'
    password_confirmation 'changeme'
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:name) { |n| "Mr. Test#{n}" }
  end
end
