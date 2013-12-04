class RenameBorrowedFromToBorrowedTo < ActiveRecord::Migration
  def change
    rename_column :media_items, :borrowed_from, :borrowed_to
  end
end
