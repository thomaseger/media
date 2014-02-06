class AddImageUrlToMediaItem < ActiveRecord::Migration
  def change
    add_column :media_items, :image_url, :string
  end
end
