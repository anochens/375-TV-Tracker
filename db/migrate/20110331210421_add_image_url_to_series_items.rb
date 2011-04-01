class AddImageUrlToSeriesItems < ActiveRecord::Migration
  def self.up
    add_column :series_items, :image_url, :string
  end

  def self.down
    remove_column :series_items, :image_url
  end
end
