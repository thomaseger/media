class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :title
      t.string :link
      t.references :type
      t.references :user

      t.timestamps
    end
    add_index :media_items, :type_id
    add_index :media_items, :user_id
  end
end
