require 'spec_helper'

describe BorrowReceipt do
  context "validation" do
    it "fails if one id is missing" do
      receipt = FactoryGirl.build(:borrow_receipt)
      receipt.should_not be_valid
    end

    it "succeeds if all ids are given" do 
      receipt = FactoryGirl.build(:borrow_receipt_with_owner_borrower_media_item)
      receipt.should be_valid
    end
  end
end
