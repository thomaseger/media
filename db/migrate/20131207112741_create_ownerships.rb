class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :user
      t.references :media_item

      t.timestamps
    end
    add_index :ownerships, :user_id
    add_index :ownerships, :media_item_id
  end
end
