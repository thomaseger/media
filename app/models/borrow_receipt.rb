class BorrowReceipt < ActiveRecord::Base

  attr_accessible :borrower_id, :media_item_id, :owner_id

  validates_presence_of :borrower_id, :media_item_id, :owner_id
end
