require 'spec_helper'
require 'database_cleaner'

describe MediaItem do

  context "validation" do
    it "succeeds with type and user" do 
      item = FactoryGirl.build :media_item_with_type_and_user
      item.should be_valid
    end

    it "fails without a type and a user" do
      item = FactoryGirl.build :media_item
    end

    it "fails without a type" do
      item = FactoryGirl.build :media_item_with_user
    end

    it "fails without a user" do
      item = FactoryGirl.build :media_item_with_type
    end
  end
  
  context "search" do 
    it "returns an empty result" do
      query = "_NOT_FOUND_"
      result = MediaItem.search query 
      expect(result).to be_empty
    end

    it "returns one hit" do
      item = FactoryGirl.create :media_item_with_type_and_user
      query = "yStr"
      result = MediaItem.search query
      expect(result.first).to eq item
    end
  end

  context "amount" do
    it "is 0" do 
      item = FactoryGirl.build :media_item
      amount = item.amount
      expect(amount).to eq 0
    end

    it "is 10" do 
      item = FactoryGirl.build :media_item_with_ownerships
      amount = item.amount
      expect(amount).to eq 10
    end
  end

  context "available" do
    it "are 3" do
      item = FactoryGirl.build :media_item_with_ownerships_and_borrow_receipts
      available = item.available
      expect(available).to eq 3
    end
  end

end
