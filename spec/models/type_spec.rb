require 'spec_helper'

describe Type do

  context "validation" do  
    
    it "succeeds with a unique name" do 
      type = FactoryGirl.create(:type)
      type.should be_valid
    end

    it "fails with duplicate names" do 
      type = FactoryGirl.create(:type_with_fixed_name)
      duplicate_type = FactoryGirl.build(:type_with_fixed_name)
      duplicate_type.should_not be_valid
    end

  end
end
