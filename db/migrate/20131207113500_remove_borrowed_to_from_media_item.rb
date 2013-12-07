class RemoveBorrowedToFromMediaItem < ActiveRecord::Migration
	def change
    remove_column :media_items, :borrowed_to
	end
end
