class CreateBorrowReceipts < ActiveRecord::Migration
  def change
    create_table :borrow_receipts do |t|
      t.integer :owner_id
      t.integer :borrower_id
      t.integer :media_item_id

      t.timestamps
    end
  end
end
