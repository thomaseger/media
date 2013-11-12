class AddBorrowedFromToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :borrowed_from, :integer
  end
end
