class RemoveWatchedFromListItems < ActiveRecord::Migration
  def self.up
    remove_column :list_items, :watched
  end

  def self.down
    add_column :list_items, :watched, :boolean
  end
end
