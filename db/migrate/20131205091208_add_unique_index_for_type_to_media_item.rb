class AddUniqueIndexForTypeToMediaItem < ActiveRecord::Migration
  def change
  	add_index :media_items, [:title, :type_id], :unique => true
  end
end
