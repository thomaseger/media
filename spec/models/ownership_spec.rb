require 'spec_helper'

describe Ownership do
  
  context "validation" do
    it "succeeds if user and media_item are present" do 
      ownership = FactoryGirl.build(:ownership)
      ownership.should be_valid
    end

    it "fails if no user is given" do 
      ownership = FactoryGirl.build(:ownership_with_media_item)
      ownership.should_not be_valid
    end

    it "fails if no media_item is given" do 
      ownership = FactoryGirl.build(:ownership_with_user)
      ownership.should_not be_valid
    end

  end
end
