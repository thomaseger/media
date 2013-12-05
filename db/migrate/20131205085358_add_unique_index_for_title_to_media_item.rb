class AddUniqueIndexForTitleToMediaItem < ActiveRecord::Migration
  def change
  	add_index :media_items, :title, :unique => true
  end
end
