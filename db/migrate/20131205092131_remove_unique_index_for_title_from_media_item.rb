class RemoveUniqueIndexForTitleFromMediaItem < ActiveRecord::Migration
  def change
  	remove_index :media_items, :title
  end
end
