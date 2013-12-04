# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :borrow_receipt do
    owner_id ""
    borrower_id ""
    media_item_id ""
  end
end
