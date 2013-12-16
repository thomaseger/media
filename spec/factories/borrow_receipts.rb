# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :borrow_receipt do
    owner_id ""
    borrower_id ""
    media_item_id ""
  end

  factory :borrow_receipt_with_owner_borrower_media_item, :parent => :borrow_receipt do
    owner_id {FactoryGirl.create(:user).id}
    borrower_id {FactoryGirl.create(:user).id}
    media_item_id {FactoryGirl.create(:media_item_with_type_and_user).id}
  end
end
