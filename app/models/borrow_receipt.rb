class BorrowReceipt < ActiveRecord::Base
  validates_presence_of :borrower_id, :media_item_id, :owner_id
end
