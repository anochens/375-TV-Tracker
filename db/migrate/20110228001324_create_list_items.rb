class CreateListItems < ActiveRecord::Migration
  def self.up
    create_table :list_items do |t|
      t.integer :user_id
      t.integer :series_item_id
      t.boolean :watched
      t.timestamps
    end
  end

  def self.down
    drop_table :list_items
  end
end
