# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media_item do
    title "MyString"
    link "MyString"
    type nil
    user nil
  end

  factory :media_item_with_type_and_user , :parent => :media_item do
    type {FactoryGirl.create(:type)}
    user {FactoryGirl.create(:user)}
  end

  factory :media_item_with_type , :parent => :media_item do
    type {FactoryGirl.create(:type)}
  end

  factory :media_item_with_user , :parent => :media_item do
    user {FactoryGirl.create(:user)}
  end

  factory :media_item_with_ownerships, :parent => :media_item do 
    ownerships { create_list :ownership, 10 }
  end

  factory :media_item_with_ownerships_and_borrow_receipts, :parent => :media_item_with_type_and_user do 
    ownerships { create_list :ownership, 10 }
    borrow_receipts { create_list :borrow_receipt_with_owner_borrower_media_item, 7 }
  end
end
