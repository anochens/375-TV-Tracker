class ChangeNameOfImageUrl < ActiveRecord::Migration
  def self.up
    remove_column :series_items, :image_url
    add_column :series_items, :image, :string
  end

  def self.down
  end
end   
