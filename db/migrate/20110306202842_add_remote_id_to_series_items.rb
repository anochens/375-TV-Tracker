class AddRemoteIdToSeriesItems < ActiveRecord::Migration
  def self.up
    add_column :series_items, :remote_id, :integer
  end

  def self.down
    remove_column :series_items, :remote_id
  end
end
