# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ownership do
    media_item {FactoryGirl.create(:media_item_with_type_and_user)}
    user {FactoryGirl.create(:user)}
  end
  
  factory :ownership_with_user, :parent => :ownership do
    user {FactoryGirl.create(:user)}
  end

  factory :ownership_with_media_item, :parent => :ownership do
    media_item {FactoryGirl.create(:media_item_with_type_and_user)}
  end

end
